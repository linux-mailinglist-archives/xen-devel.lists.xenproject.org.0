Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7836C1D7BC9
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 16:49:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jah4Q-0008BY-8Y; Mon, 18 May 2020 14:48:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hVld=7A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jah4O-0008Az-NL
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 14:48:44 +0000
X-Inumbo-ID: ab8a99b2-9916-11ea-b07b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab8a99b2-9916-11ea-b07b-bc764e2007e4;
 Mon, 18 May 2020 14:48:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A74BAAD5C;
 Mon, 18 May 2020 14:48:45 +0000 (UTC)
Subject: Re: [PATCH v3 1/2] x86/idle: rework C6 EOI workaround
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200515135802.63853-1-roger.pau@citrix.com>
 <20200515135802.63853-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <58a4bae6-ad36-06da-6f47-825d4b60bbaa@suse.com>
Date: Mon, 18 May 2020 16:48:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200515135802.63853-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.05.2020 15:58, Roger Pau Monne wrote:
> Change the C6 EOI workaround (errata AAJ72) to use x86_match_cpu. Also
> call the workaround from mwait_idle, previously it was only used by
> the ACPI idle driver. Finally make sure the routine is called for all
> states equal or greater than ACPI_STATE_C3, note that the ACPI driver
> doesn't currently handle them, but the errata condition shouldn't be
> limited by that.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with two nits:

> --- a/xen/arch/x86/acpi/cpu_idle.c
> +++ b/xen/arch/x86/acpi/cpu_idle.c
> @@ -548,26 +548,35 @@ void trace_exit_reason(u32 *irq_traced)
>      }
>  }
>  
> -/*
> - * "AAJ72. EOI Transaction May Not be Sent if Software Enters Core C6 During 
> - * an Interrupt Service Routine"
> - * 
> - * There was an errata with some Core i7 processors that an EOI transaction 
> - * may not be sent if software enters core C6 during an interrupt service 
> - * routine. So we don't enter deep Cx state if there is an EOI pending.
> - */
> -static bool errata_c6_eoi_workaround(void)
> +bool errata_c6_eoi_workaround(void)
>  {
> -    static int8_t fix_needed = -1;
> +    static int8_t __read_mostly fix_needed = -1;
>  
>      if ( unlikely(fix_needed == -1) )
>      {
> -        int model = boot_cpu_data.x86_model;
> -        fix_needed = (cpu_has_apic && !directed_eoi_enabled &&
> -                      (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL) &&
> -                      (boot_cpu_data.x86 == 6) &&
> -                      ((model == 0x1a) || (model == 0x1e) || (model == 0x1f) ||
> -                       (model == 0x25) || (model == 0x2c) || (model == 0x2f)));
> +#define INTEL_FAM6_MODEL(m) { X86_VENDOR_INTEL, 6, m, X86_FEATURE_ALWAYS }
> +        /*
> +         * Errata AAJ72: EOI Transaction May Not be Sent if Software Enters
> +         * Core C6 During an Interrupt Service Routine"
> +         *
> +         * There was an errata with some Core i7 processors that an EOI
> +         * transaction may not be sent if software enters core C6 during an
> +         * interrupt service routine. So we don't enter deep Cx state if
> +         * there is an EOI pending.
> +         */
> +        const static struct x86_cpu_id eoi_errata[] = {

Commonly we use "static const".

> --- a/xen/arch/x86/cpu/mwait-idle.c
> +++ b/xen/arch/x86/cpu/mwait-idle.c
> @@ -770,6 +770,9 @@ static void mwait_idle(void)
>  		return;
>  	}
>  
> +	if ((cx->type >= 3) && errata_c6_eoi_workaround())
> +		cx = power->safe_state;
> +
>  	eax = cx->address;
>  	cstate = ((eax >> MWAIT_SUBSTATE_SIZE) & MWAIT_CSTATE_MASK) + 1;
>  
> diff --git a/xen/include/asm-x86/cpuidle.h b/xen/include/asm-x86/cpuidle.h
> index 5d7dffd228..13879f58a1 100644
> --- a/xen/include/asm-x86/cpuidle.h
> +++ b/xen/include/asm-x86/cpuidle.h
> @@ -26,4 +26,5 @@ void update_idle_stats(struct acpi_processor_power *,
>  void update_last_cx_stat(struct acpi_processor_power *,
>                           struct acpi_processor_cx *, uint64_t);
>  
> +bool errata_c6_eoi_workaround(void);
>  #endif /* __X86_ASM_CPUIDLE_H__ */

I'd prefer if a blank line was left ahead of #ifdef-s of this kind.
Both are easy enough to do while committing, I guess.

Jan

