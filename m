Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2791FF89A
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 18:05:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlx2Y-00047E-Ml; Thu, 18 Jun 2020 16:05:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fT7M=77=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jlx2Y-000478-98
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 16:05:22 +0000
X-Inumbo-ID: 82bfcb04-b17d-11ea-8496-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 82bfcb04-b17d-11ea-8496-bc764e2007e4;
 Thu, 18 Jun 2020 16:05:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B8121ADC9;
 Thu, 18 Jun 2020 16:05:19 +0000 (UTC)
Subject: Re: [PATCH for-4.14 8/8] x86/hvm: enable emulated PIT for PVH dom0
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200612155640.4101-1-roger.pau@citrix.com>
 <20200612155640.4101-9-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <88a91a26-1ad8-bf85-d55e-4fc29afaf554@suse.com>
Date: Thu, 18 Jun 2020 18:05:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200612155640.4101-9-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, paul@xen.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 12.06.2020 17:56, Roger Pau Monne wrote:
> Some video BIOS require a PIT in order to work properly, hence classic
> PV dom0 gets partial access to the physical PIT as long as it's not in
> use by Xen.
> 
> Since PVH dom0 is built on top of HVM support, there's already an
> emulated PIT implementation available for use. Tweak the emulated PIT
> code so it injects interrupts directly into the vIO-APIC if the legacy
> PIC (i8259) is disabled. Make sure the GSI used matches the ISA IRQ 0
> in the likely case there's an interrupt overwrite in the MADT ACPI

Same nit again as for the earlier patch (also applicable to a code
comment below).

> @@ -578,7 +579,7 @@ int arch_domain_create(struct domain *d,
>  
>      emflags = config->arch.emulation_flags;
>  
> -    if ( is_hardware_domain(d) && is_pv_domain(d) )
> +    if ( is_hardware_domain(d) )
>          emflags |= XEN_X86_EMU_PIT;

Wouldn't this better go into create_dom0(), where all the other
flags get set? Or otherwise all of that be moved here (to cover
the late-hwdom case)?

> --- a/xen/arch/x86/emul-i8254.c
> +++ b/xen/arch/x86/emul-i8254.c
> @@ -168,6 +168,7 @@ static void pit_load_count(PITState *pit, int channel, int val)
>      u32 period;
>      struct hvm_hw_pit_channel *s = &pit->hw.channels[channel];
>      struct vcpu *v = vpit_vcpu(pit);
> +    const struct domain *d = v ? v->domain : NULL;

I think this local variable would better be omitted - its
initializer may raise questions, while at its use sites v
can't be NULL afaict. Plus it's not needed ...

> @@ -190,14 +191,18 @@ static void pit_load_count(PITState *pit, int channel, int val)
>      case 3:
>          /* Periodic timer. */
>          TRACE_2D(TRC_HVM_EMUL_PIT_START_TIMER, period, period);
> -        create_periodic_time(v, &pit->pt0, period, period, 0, pit_time_fired, 
> +        create_periodic_time(v, &pit->pt0, period, period,
> +                             has_vpic(d) ? 0 : hvm_isa_irq_to_gsi(d, 0),
> +                             pit_time_fired,
>                               &pit->count_load_time[channel], false);
>          break;
>      case 1:
>      case 4:
>          /* One-shot timer. */
>          TRACE_2D(TRC_HVM_EMUL_PIT_START_TIMER, period, 0);
> -        create_periodic_time(v, &pit->pt0, period, 0, 0, pit_time_fired,
> +        create_periodic_time(v, &pit->pt0, period, 0,
> +                             has_vpic(d) ? 0 : hvm_isa_irq_to_gsi(d, 0),
> +                             pit_time_fired,
>                               &pit->count_load_time[channel], false);
>          break;
>      default:

... on this path.

> --- a/xen/arch/x86/hvm/vioapic.c
> +++ b/xen/arch/x86/hvm/vioapic.c
> @@ -268,7 +268,14 @@ static void vioapic_write_redirent(
>  
>      spin_unlock(&d->arch.hvm.irq_lock);
>  
> -    if ( is_hardware_domain(d) && unmasked )
> +    if ( is_hardware_domain(d) && unmasked &&
> +         /*
> +          * A PVH dom0 can have an emulated PIT that should respect any
> +          * interrupt overwrites found in the ACPI MADT table, so we need to
> +          * check to which GSI the ISA IRQ 0 is mapped in order to prevent
> +          * identity mapping it.
> +          */
> +         (!has_vpit(d) || gsi != hvm_isa_irq_to_gsi(d, 0)) )

Isn't has_vpit() true now for Dom0, and hence that part of the
condition is kind of pointless? And shouldn't Dom0 never have seen
physical IRQ 0 in the first place (we don't allow PV Dom0 to use
that IRQ either, after all)?

Jan

