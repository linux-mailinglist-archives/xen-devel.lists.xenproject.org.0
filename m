Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A1D24384B
	for <lists+xen-devel@lfdr.de>; Thu, 13 Aug 2020 12:16:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6AHM-0000lU-37; Thu, 13 Aug 2020 10:16:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lIW0=BX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k6AHL-0000lM-0W
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2020 10:16:11 +0000
X-Inumbo-ID: 0cd77151-f906-4593-9459-2a5d3b2b12f5
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0cd77151-f906-4593-9459-2a5d3b2b12f5;
 Thu, 13 Aug 2020 10:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597313770;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=N5iJJLS+SNUowJnpCrGqMzDNvIcyVATD++2NJIVUZfk=;
 b=ZvBjG5gWFJ80lfJgaK2C3/6UVV+n06vyX981/Up0tozxOp3aOfLIheT9
 nng74vEXYH1IWDTncxQ9g8vBM0aUV6/Jrr024+yKXq68rUCwK61381jK5
 BWNCwQfOC/QOGAuQlLSOuuENYcyF+bifykzp7VoG9pzTrKr7pudRmY536 g=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: WP4kH+OdkP0qw0RmUj9Oh7b3TYkHjG8h724gHTWT/jPkKOPFtYKiiyIOUQlHYW+KOzKszIVDaQ
 7VDvBN/GYLYtCVGVkujlaaqJH2D3mMWnySgnexy6S9KOfF7J6mhIZewyL8rEpRkbwM4RxXk9yf
 l2djRadaQn4p25nAJuvKBwXGNbNDojtrxVbhNJRWQ32SnKuSX4fhfk8cKFCt52qPlr4ipE+5dN
 DMqyKoSB55qQAMUdwtL8wMBvwMGpnaR4m3I7v8bI0ryz3SSM8hVMaiePjTo6nyMexdGxCbp+X8
 CcQ=
X-SBRS: 2.7
X-MesageID: 24422935
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,307,1592884800"; d="scan'208";a="24422935"
Date: Thu, 13 Aug 2020 12:15:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Paul Durrant <paul@xen.org>
CC: <xen-devel@lists.xenproject.org>, Paul Durrant <pdurrant@amazon.com>, "Wei
 Liu" <wl@xen.org>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86 / viridian: remove the viridian_vcpu msg_pending bit
 mask
Message-ID: <20200813101549.GH975@Air-de-Roger>
References: <20200813095723.1429-1-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200813095723.1429-1-paul@xen.org>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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

On Thu, Aug 13, 2020 at 10:57:23AM +0100, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> The mask does not actually serve a useful purpose as we only use the SynIC
> for timer messages.

Oh, I see. I assume it doesn't make sense because there can only be a
single message pending (a timer one), and hence there isn't much value
in doing this SynIC pending tracking? 

> Dropping the mask means that the EOM MSR handler
> essentially becomes a no-op. This means we can avoid setting 'message_pending'
> for timer messages and hence avoid a VMEXIT for the EOM.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

I've got some question below and one nit.

> ---
> Cc: Wei Liu <wl@xen.org>
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: "Roger Pau Monné" <roger.pau@citrix.com>
> 
> This should hopefully simplify Roger's "x86/vlapic: implement EOI callbacks"
> series a little.
> ---
>  xen/arch/x86/hvm/viridian/synic.c  | 24 +-----------------------
>  xen/arch/x86/hvm/vlapic.c          |  2 --
>  xen/include/asm-x86/hvm/viridian.h |  2 --
>  3 files changed, 1 insertion(+), 27 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/viridian/synic.c b/xen/arch/x86/hvm/viridian/synic.c
> index 94a2b88733..22e2df27e5 100644
> --- a/xen/arch/x86/hvm/viridian/synic.c
> +++ b/xen/arch/x86/hvm/viridian/synic.c
> @@ -137,7 +137,6 @@ int viridian_synic_wrmsr(struct vcpu *v, uint32_t idx, uint64_t val)
>          if ( !(viridian_feature_mask(d) & HVMPV_synic) )
>              return X86EMUL_EXCEPTION;
>  
> -        vv->msg_pending = 0;
>          break;
>  
>      case HV_X64_MSR_SINT0 ... HV_X64_MSR_SINT15:
> @@ -168,9 +167,6 @@ int viridian_synic_wrmsr(struct vcpu *v, uint32_t idx, uint64_t val)
>          printk(XENLOG_G_INFO "%pv: VIRIDIAN SINT%u: vector: %x\n", v, sintx,
>                 vector);
>  
> -        if ( new.polling )
> -            __clear_bit(sintx, &vv->msg_pending);
> -
>          *vs = new;
>          break;
>      }
> @@ -334,9 +330,6 @@ bool viridian_synic_deliver_timer_msg(struct vcpu *v, unsigned int sintx,
>          .DeliveryTime = delivery,
>      };
>  
> -    if ( test_bit(sintx, &vv->msg_pending) )
> -        return false;
> -
>      /*
>       * To avoid using an atomic test-and-set, and barrier before calling
>       * vlapic_set_irq(), this function must be called in context of the
> @@ -346,12 +339,9 @@ bool viridian_synic_deliver_timer_msg(struct vcpu *v, unsigned int sintx,
>  
>      msg += sintx;
>  
> +    /* There is no need to set message_pending as we do not require an EOM */
>      if ( msg->header.message_type != HVMSG_NONE )

I think it's fine to use HVMSG_NONE ATM because Xen only knows about
timer messages, but long term wouldn't it be better to use
HVMSG_TIMER_EXPIRED?

> -    {
> -        msg->header.message_flags.msg_pending = 1;
> -        __set_bit(sintx, &vv->msg_pending);
>          return false;
> -    }
>  
>      msg->header.message_type = HVMSG_TIMER_EXPIRED;
>      msg->header.message_flags.msg_pending = 0;
> @@ -380,18 +370,6 @@ bool viridian_synic_is_auto_eoi_sint(const struct vcpu *v,
>      return vs->auto_eoi;
>  }
>  
> -void viridian_synic_ack_sint(const struct vcpu *v, unsigned int vector)
> -{
> -    struct viridian_vcpu *vv = v->arch.hvm.viridian;
> -    unsigned int sintx = vv->vector_to_sintx[vector];
> -
> -    ASSERT(v == current);
> -
> -    if ( sintx < ARRAY_SIZE(vv->sint) )
> -        __clear_bit(array_index_nospec(sintx, ARRAY_SIZE(vv->sint)),
> -                    &vv->msg_pending);
> -}
> -
>  void viridian_synic_save_vcpu_ctxt(const struct vcpu *v,
>                                     struct hvm_viridian_vcpu_context *ctxt)
>  {
> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> index 7b5c633033..1aff4cf989 100644
> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -466,8 +466,6 @@ void vlapic_handle_EOI(struct vlapic *vlapic, u8 vector)
>  
>      if ( vlapic_test_vector(vector, &vlapic->regs->data[APIC_TMR]) )
>          vioapic_update_EOI(d, vector);
> -    else if ( has_viridian_synic(d) )
> -        viridian_synic_ack_sint(v, vector);

Please also clean the comment above about SynIC SINTx being edge
triggered.

Thanks, Roger.

