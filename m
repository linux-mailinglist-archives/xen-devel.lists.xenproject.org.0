Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D921FF652
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 17:12:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlwDE-0005aV-JV; Thu, 18 Jun 2020 15:12:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fT7M=77=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jlwDD-0005aQ-0z
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 15:12:19 +0000
X-Inumbo-ID: 19157840-b176-11ea-baac-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 19157840-b176-11ea-baac-12813bfff9fa;
 Thu, 18 Jun 2020 15:12:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 26202ADF7;
 Thu, 18 Jun 2020 15:12:16 +0000 (UTC)
Subject: Re: [PATCH for-4.14 6/8] x86/vpt: fix injection to remote vCPU
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200612155640.4101-1-roger.pau@citrix.com>
 <20200612155640.4101-7-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <57b6f9fd-4cbc-abc9-09e3-6493eba6c377@suse.com>
Date: Thu, 18 Jun 2020 17:12:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200612155640.4101-7-roger.pau@citrix.com>
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 12.06.2020 17:56, Roger Pau Monne wrote:
> vpt timers are usually added to the per-vCPU list of the vCPU where
> they get setup, but depending on the timer source type that vCPU might
> be different than the one where the interrupt vector gets injected.
> 
> For example the PIT timer use a PIC or IO-APIC pin in order to select
> the destination vCPU and vector, which might not match the vCPU they
> are configured from.
> 
> If such a situation happens pt_intr_post won't be called, and thus the
> vpt will be left in a limbo where the next interrupt won't be
> scheduled. Fix this by generalizing the special handling done to
> IO-APIC level interrupts to be applied always when the destination
> vCPU of the injected vector is different from the vCPU where the vpt
> belongs to (ie: usually the one it's been configured from).
> 
> A further improvement as noted in a comment added to the code might be
> to move the vpt so it's handled by the same vCPU where the vector gets
> injected.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/hvm/vpt.c | 80 +++++++++++++++++++++---------------------
>  1 file changed, 40 insertions(+), 40 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/vpt.c b/xen/arch/x86/hvm/vpt.c
> index 6a975fc668..52ad5b90a7 100644
> --- a/xen/arch/x86/hvm/vpt.c
> +++ b/xen/arch/x86/hvm/vpt.c
> @@ -358,59 +358,59 @@ int pt_update_irq(struct vcpu *v)
>           * interrupt delivery case. Otherwise return -1 to do nothing.
>           */
>          vlapic_set_irq(vcpu_vlapic(v), irq, 0);
> -        pt_vector = irq;
> -        break;
> +        return irq;
>  
>      case PTSRC_isa:
>          hvm_isa_irq_deassert(v->domain, irq);
>          if ( platform_legacy_irq(irq) && vlapic_accept_pic_intr(v) &&
>               v->domain->arch.hvm.vpic[irq >> 3].int_output )
> -            hvm_isa_irq_assert(v->domain, irq, NULL);
> +            pt_vector = hvm_isa_irq_assert(v->domain, irq, NULL);
>          else
> -        {
>              pt_vector = hvm_isa_irq_assert(v->domain, irq, vioapic_get_vector);
> -            /*
> -             * hvm_isa_irq_assert may not set the corresponding bit in vIRR
> -             * when mask field of IOAPIC RTE is set. Check it again.
> -             */

For one, the transformation done here looks to call for folding
both calls to hvm_isa_irq_assert() into one. I'm not, however,
convinced recording the function's return value is useful in the
case where it wasn't recorded before. The change is benign right
now because hvm_isa_irq_assert() will return -1 when its last
argument is NULL, but the question is whether the code here should
start depending on such behavior.

And then, according to this comment (which doesn't get retained in
any form or shape) ...

> -            if ( pt_vector < 0 || !vlapic_test_irq(vcpu_vlapic(v), pt_vector) )
> -                pt_vector = -1;
> -        }
> +
> +        if ( pt_vector < 0 )
> +            return pt_vector;
> +
>          break;
>  
>      case PTSRC_ioapic:
>          pt_vector = hvm_ioapic_assert(v->domain, irq, level);
> -        if ( pt_vector < 0 || !vlapic_test_irq(vcpu_vlapic(v), pt_vector) )
> -        {
> -            pt_vector = -1;
> -            if ( level )
> +        if ( pt_vector < 0 )
> +            return pt_vector;
> +
> +        break;
> +    }
> +
> +    ASSERT(pt_vector >= 0);
> +    if ( !vlapic_test_irq(vcpu_vlapic(v), pt_vector) )
> +    {
> +        time_cb *cb = NULL;
> +        void *cb_priv;
> +
> +        /*
> +         * Vector has been injected to a different vCPU, call pt_irq_fired and
> +         * execute the callback, since the destination vCPU(s) won't call
> +         * pt_intr_post for it.

... this isn't the only reason to come here. Beyond what the comment
says there is the hvm_domain_use_pirq() check in assert_gsi() which
would similarly result in the IRR bit not observed set here. At the
very least these cases want mentioning; I have to admit that I'm not
entirely clear yet whether your handling is correct for both, or
whether the information needs to be propagated into here.

Also instead of ASSERT(pt_vector >= 0) would you pull the respective
if() out of the switch(), to also cover the case of a fall through
without hitting any of the explicitly handled cases, resulting in
pt_vector left at its initial value of -1?

> +         * TODO: move this vpt to one of the vCPUs where the vector gets
> +         * injected.
> +         */
> +        spin_lock(&v->arch.hvm.tm_lock);
> +        /* Make sure the timer is still on the list. */
> +        list_for_each_entry ( pt, &v->arch.hvm.tm_list, list )
> +            if ( pt == earliest_pt )
>              {
> -                /*
> -                 * Level interrupts are always asserted because the pin assert
> -                 * count is incremented regardless of whether the pin is masked
> -                 * or the vector latched in IRR, so also execute the callback
> -                 * associated with the timer.
> -                 */
> -                time_cb *cb = NULL;
> -                void *cb_priv;
> -
> -                spin_lock(&v->arch.hvm.tm_lock);
> -                /* Make sure the timer is still on the list. */
> -                list_for_each_entry ( pt, &v->arch.hvm.tm_list, list )
> -                    if ( pt == earliest_pt )
> -                    {
> -                        pt_irq_fired(v, pt);
> -                        cb = pt->cb;
> -                        cb_priv = pt->priv;
> -                        break;
> -                    }
> -                spin_unlock(&v->arch.hvm.tm_lock);
> -
> -                if ( cb != NULL )
> -                    cb(v, cb_priv);
> +                pt_irq_fired(v, pt);
> +                cb = pt->cb;
> +                cb_priv = pt->priv;
> +                break;
>              }
> -        }
> -        break;
> +        spin_unlock(&v->arch.hvm.tm_lock);
> +
> +        if ( cb != NULL )
> +            cb(v, cb_priv);
> +
> +        pt_vector = -1;
>      }
>  
>      return pt_vector;

To further reduce indentation (and seeing the significant code
churn that happens here anyway), could you consider inverting the
surrounding if() to

    if ( vlapic_test_irq(vcpu_vlapic(v), pt_vector) )
        return pt_vector;    

?

Jan

