Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BA21EBC1F
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 14:55:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg6RG-0002OU-V2; Tue, 02 Jun 2020 12:54:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Snlw=7P=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jg6RF-0002OP-Mq
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 12:54:41 +0000
X-Inumbo-ID: 38e77536-a4d0-11ea-abea-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 38e77536-a4d0-11ea-abea-12813bfff9fa;
 Tue, 02 Jun 2020 12:54:40 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: KKi2eqdfOPWnuZddKE7EZJ0z/Ujn0YJYCM0WfQqZCRSph7z8MTWW2w1+vyM76hpO4jtTTAFPcB
 m/h+UQkCFGhX4Kf7gyTkDDrOq8mYhBUXldS0BHytmc6/+5NbvHqlNqVXSao7T26UEQsKTP9mzg
 SNIrYOe7CrN7GLpwuvftFfBcGyD8sb6HNPrQ7yyThFdxpnzEoeM2y5hIHZciQ5BjZSVHiwkJr4
 tbO6JWVJi53HRDVircbrkcMgjJTbriVbiW64Q1m9LT5MiSFBJoIsr2m+6YSEVVdUea/b2oODnM
 PeM=
X-SBRS: 2.7
X-MesageID: 19364950
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,464,1583211600"; d="scan'208";a="19364950"
Date: Tue, 2 Jun 2020 14:54:33 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v2 for-4.14 3/3] xen/vm_event: Add safe to disable vm_event
Message-ID: <20200602125433.GY1195@Air-de-Roger>
References: <cover.1590028160.git.tamas@tklengyel.com>
 <682dde916f982e2889b2be2263418e9506a82c1e.1590028160.git.tamas@tklengyel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <682dde916f982e2889b2be2263418e9506a82c1e.1590028160.git.tamas@tklengyel.com>
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, May 20, 2020 at 08:31:54PM -0600, Tamas K Lengyel wrote:
> Instead of having to repeatedly try to disable vm_events,

Why not use a hypercall continuation instead so that this is all
hidden from the caller?

I take that the current interface requires the user to repeatedly
issue hypercalls in order to disable vm_events until one of those
succeeds?

> request a specific
> vm_event to be sent when the domain is safe to continue with shutting down
> the vm_event interface.
> 
> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
> ---
>  xen/arch/x86/hvm/hvm.c            | 38 ++++++++++++++++++++++++++-----
>  xen/arch/x86/hvm/monitor.c        | 14 ++++++++++++
>  xen/arch/x86/monitor.c            | 13 +++++++++++
>  xen/include/asm-x86/domain.h      |  1 +
>  xen/include/asm-x86/hvm/monitor.h |  1 +
>  xen/include/public/domctl.h       |  2 ++
>  xen/include/public/vm_event.h     |  8 +++++++
>  7 files changed, 71 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index e6780c685b..fc7e1e2b22 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -563,15 +563,41 @@ void hvm_do_resume(struct vcpu *v)
>          v->arch.hvm.inject_event.vector = HVM_EVENT_VECTOR_UNSET;
>      }
>  
> -    if ( unlikely(v->arch.vm_event) && v->arch.monitor.next_interrupt_enabled )
> +    if ( unlikely(v->arch.vm_event) )
>      {
> -        struct x86_event info;
> +        struct domain *d = v->domain;
> +
> +        if ( v->arch.monitor.next_interrupt_enabled )
> +        {
> +            struct x86_event info;
> +
> +            if ( hvm_get_pending_event(v, &info) )
> +            {
> +                hvm_monitor_interrupt(info.vector, info.type, info.error_code,
> +                                      info.cr2);
> +                v->arch.monitor.next_interrupt_enabled = false;
> +            }
> +        }
>  
> -        if ( hvm_get_pending_event(v, &info) )
> +        if ( d->arch.monitor.safe_to_disable )
>          {
> -            hvm_monitor_interrupt(info.vector, info.type, info.error_code,
> -                                  info.cr2);
> -            v->arch.monitor.next_interrupt_enabled = false;
> +            const struct vcpu *check_vcpu;
> +            bool pending_op = false;
> +
> +            for_each_vcpu ( d, check_vcpu )
> +            {
> +                if ( vm_event_check_pending_op(check_vcpu) )

Don't you need some kind of lock here, since you are poking at another
vCPU which could be modifying any of those bits?

> +                {
> +                    pending_op = true;
> +                    break;
> +                }
> +            }
> +
> +            if ( !pending_op )
> +            {
> +                hvm_monitor_safe_to_disable();
> +                d->arch.monitor.safe_to_disable = false;
> +            }
>          }
>      }
>  }
> diff --git a/xen/arch/x86/hvm/monitor.c b/xen/arch/x86/hvm/monitor.c
> index f5d89e71d1..75fd1a4b68 100644
> --- a/xen/arch/x86/hvm/monitor.c
> +++ b/xen/arch/x86/hvm/monitor.c
> @@ -300,6 +300,20 @@ bool hvm_monitor_check_p2m(unsigned long gla, gfn_t gfn, uint32_t pfec,
>      return monitor_traps(curr, true, &req) >= 0;
>  }
>  
> +void hvm_monitor_safe_to_disable(void)
> +{
> +    struct vcpu *curr = current;
> +    struct arch_domain *ad = &curr->domain->arch;

const

> +    vm_event_request_t req = {};
> +
> +    if ( !ad->monitor.safe_to_disable )
> +        return;

Should this rather be an ASSERT? I don't think you are supposed to
call hvm_monitor_safe_to_disable when the bit is not set?

> +
> +    req.reason = VM_EVENT_REASON_SAFE_TO_DISABLE;

I think you cat set the field at definition time.

> +
> +    monitor_traps(curr, 0, &req);
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/arch/x86/monitor.c b/xen/arch/x86/monitor.c
> index 1517a97f50..86e0ba2fbc 100644
> --- a/xen/arch/x86/monitor.c
> +++ b/xen/arch/x86/monitor.c
> @@ -339,6 +339,19 @@ int arch_monitor_domctl_event(struct domain *d,
>          break;
>      }
>  
> +    case XEN_DOMCTL_MONITOR_EVENT_SAFE_TO_DISABLE:
> +    {
> +        bool old_status = ad->monitor.safe_to_disable;
> +
> +        if ( unlikely(old_status == requested_status) )
> +            return -EEXIST;
> +
> +        domain_pause(d);
> +        ad->monitor.safe_to_disable = requested_status;

Maybe I'm missing something, but I don't see any check that others
events are disabled before safe_to_disable is set?

In the same way, you should prevent setting any events when
safe_to_disable is set IMO, likely returning -EBUSY in both cases.

Thanks, Roger.

