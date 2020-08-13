Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3471243B9A
	for <lists+xen-devel@lfdr.de>; Thu, 13 Aug 2020 16:34:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6EIg-0006qP-Js; Thu, 13 Aug 2020 14:33:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8kwl=BX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k6EIf-0006qK-BA
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2020 14:33:49 +0000
X-Inumbo-ID: e6a53602-7f68-4eb1-9f34-42b6da084732
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e6a53602-7f68-4eb1-9f34-42b6da084732;
 Thu, 13 Aug 2020 14:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597329228;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=gRcgD3x69R9ErvHQSWMrwIDGi/WRqw8uDrLZ0H6N8hQ=;
 b=Nc4pdIn4sNAbAntA+SJK1XriZbw7mGgJN25Ew+hJ/mFKuKQJtYiWXSa1
 4dr3snNEk4kGVNWF1588AtfkPn6yCvJ6CiFDSGD/pHXUU1e/8YPAPJTwc
 IU7dd0yzuyTqFNnnNpOj20Za5lYz1K1zs8JNPufl2OMSlhLWTJ9gBS7/j 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 0eAAU44QdxBci+8vCDWTeW1C6kNkTAGmBQ0FVi1bTkOqDkcSvt2PQN8rO/t/Nenn6fziMSqC4D
 5+6yaoo7PDiJxb64j5fNc485YjC7AqYvCx/kqZdiZYVjHLD72YIB3JUJM15bzfGSeoKACW3Zyx
 JAXZPwMSO2MXlIbfSABFFGn5w5zRxemViW5JB6BfSvus1KJst9HjK+a2EXy0MzbF/lKL8R6AhQ
 fNBsjX6tb+XI/MHz/bltBjEdcbHSEg6yzUQMHBTU2hCF4Hn++VoJRUXm3aziTx4EZfpovu0BYq
 07s=
X-SBRS: 2.7
X-MesageID: 24799574
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,308,1592884800"; d="scan'208";a="24799574"
Subject: Re: [PATCH 2/5] x86/vlapic: introduce an EOI callback mechanism
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20200812124709.4165-1-roger.pau@citrix.com>
 <20200812124709.4165-3-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <67d9c57d-1173-cab4-e51e-762ac325f3d9@citrix.com>
Date: Thu, 13 Aug 2020 15:33:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200812124709.4165-3-roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 12/08/2020 13:47, Roger Pau Monne wrote:
> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> index 7b5c633033..7369be468b 100644
> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -159,8 +160,26 @@ void vlapic_set_irq(struct vlapic *vlapic, uint8_t vec, uint8_t trig)
>      else
>          vlapic_clear_vector(vec, &vlapic->regs->data[APIC_TMR]);
>  
> +    if ( callback )
> +    {
> +        unsigned long flags;
> +
> +        spin_lock_irqsave(&vlapic->callback_lock, flags);
> +        vlapic->callbacks[vec].callback = callback;
> +        vlapic->callbacks[vec].data = data;
> +        spin_unlock_irqrestore(&vlapic->callback_lock, flags);
> +    }
> +    else
> +        /*
> +         * Removing the callback can be done with a single atomic operation
> +         * without requiring the lock, as the callback data doesn't need to be
> +         * cleared.
> +         */
> +        write_atomic(&vlapic->callbacks[vec].callback, NULL);
> +
>      if ( hvm_funcs.update_eoi_exit_bitmap )
> -        alternative_vcall(hvm_funcs.update_eoi_exit_bitmap, target, vec, trig);
> +        alternative_vcall(hvm_funcs.update_eoi_exit_bitmap, target, vec,
> +                          trig || callback);

I can't reason about this being correct.

When you say EOI, what property do you want, exactly, because there are
a couple of options.

All interrupts, edge or level, require acking at the local APIC, to mark
the interrupt as no longer in service.  For edge interrupts and hardware
APIC acceleration, this will be completed without a VMExit.

Level interrupts from the IO-APIC further require EOI'ing there. 
Whether this requires an explicit action or not depends on the LAPIC
"EOI Broadcast" setting.  I'm not sure if we virtualise and/or support
this setting.


What exactly are we going to want to do from these callbacks
(eventually, not just in this series alone)?

If it can't be made to work for level interrupts only, I'm afraid I
don't think this plan is viable.

(Some trivial comments to follow, but this is the meaty question.)

>  
>      if ( hvm_funcs.deliver_posted_intr )
>          alternative_vcall(hvm_funcs.deliver_posted_intr, target, vec);
> @@ -168,6 +187,11 @@ void vlapic_set_irq(struct vlapic *vlapic, uint8_t vec, uint8_t trig)
>          vcpu_kick(target);
>  }
>  
> +void vlapic_set_irq(struct vlapic *vlapic, uint8_t vec, uint8_t trig)
> +{
> +    vlapic_set_irq_callback(vlapic, vec, trig, NULL, NULL);

Static inline in the header file?

> @@ -1636,9 +1671,23 @@ int vlapic_init(struct vcpu *v)
>      }
>      clear_page(vlapic->regs);
>  
> +    if ( !vlapic->callbacks )
> +    {
> +        vlapic->callbacks = xmalloc_array(typeof(*(vlapic->callbacks)),
> +                                          X86_NR_VECTORS);

This is a large data structure.  At a minimum, you can subtract 16 from
it, because vectors 0 thru 0xf can't legally be targetted by interrupts.

Sadly, I don't think it can be reduced beyond that, because a guest
could arrange for every other vector to become pending in level mode,
even if the overwhelming common option for VMs these days would be to
have no level interrupts at all.

~Andrew

