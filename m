Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 005DE1EBAB8
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 13:47:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg5OF-00032x-Jc; Tue, 02 Jun 2020 11:47:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Snlw=7P=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jg5OE-00032s-Ko
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 11:47:30 +0000
X-Inumbo-ID: d6019bc6-a4c6-11ea-9947-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d6019bc6-a4c6-11ea-9947-bc764e2007e4;
 Tue, 02 Jun 2020 11:47:29 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: /GoGzeFUN7WsRiQTJ1TYFzktZgzfei0w8bPzjNlIDkSYd2hmXwx/SbGYqvIao7Dv5z2xH9b94u
 vaxOszn/fVF+/vimswcvhyH0uj5UAtFGHajA9N3JWGtIioeRZNJalKLld3WngycpEfZl72VRiy
 j4+oZ0uO/ACc5kw1DusfN+ae9Or5364CckQCbds8Zrbwy9r10MCGTuQ9yB3H9ozyPeY/1bwA9V
 SLra5pZdjwKymXzgVnDVdHaZIbzKILkYZXqu1AZRz/JvYvdcQUQKri+ofnO8xlM2KYw7c3cuuv
 Z/Y=
X-SBRS: 2.7
X-MesageID: 19753068
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,464,1583211600"; d="scan'208";a="19753068"
Date: Tue, 2 Jun 2020 13:47:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v2 for-4.14 2/3] xen/vm_event: add
 vm_event_check_pending_op
Message-ID: <20200602114722.GX1195@Air-de-Roger>
References: <cover.1590028160.git.tamas@tklengyel.com>
 <52492e7b44f311b09e9a433f2e5a2ba607a85c78.1590028160.git.tamas@tklengyel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <52492e7b44f311b09e9a433f2e5a2ba607a85c78.1590028160.git.tamas@tklengyel.com>
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
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Alexandru Isaila <aisaila@bitdefender.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, May 20, 2020 at 08:31:53PM -0600, Tamas K Lengyel wrote:
> Perform sanity checking when shutting vm_event down to determine whether
> it is safe to do so. Error out with -EAGAIN in case pending operations
> have been found for the domain.
> 
> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
> ---
>  xen/arch/x86/vm_event.c        | 23 +++++++++++++++++++++++
>  xen/common/vm_event.c          | 17 ++++++++++++++---
>  xen/include/asm-arm/vm_event.h |  7 +++++++
>  xen/include/asm-x86/vm_event.h |  2 ++
>  4 files changed, 46 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/x86/vm_event.c b/xen/arch/x86/vm_event.c
> index 848d69c1b0..a23aadc112 100644
> --- a/xen/arch/x86/vm_event.c
> +++ b/xen/arch/x86/vm_event.c
> @@ -297,6 +297,29 @@ void vm_event_emulate_check(struct vcpu *v, vm_event_response_t *rsp)
>      };
>  }
>  
> +bool vm_event_check_pending_op(const struct vcpu *v)
> +{
> +    struct monitor_write_data *w = &v->arch.vm_event->write_data;

const

> +
> +    if ( !v->arch.vm_event->sync_event )
> +        return false;
> +
> +    if ( w->do_write.cr0 )
> +        return true;
> +    if ( w->do_write.cr3 )
> +        return true;
> +    if ( w->do_write.cr4 )
> +        return true;
> +    if ( w->do_write.msr )
> +        return true;
> +    if ( v->arch.vm_event->set_gprs )
> +        return true;
> +    if ( v->arch.vm_event->emulate_flags )
> +        return true;

Can you please group this into a single if, ie:

if ( w->do_write.cr0 || w->do_write.cr3 || ... )
    return true;

> +
> +    return false;
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/common/vm_event.c b/xen/common/vm_event.c
> index 127f2d58f1..2df327a42c 100644
> --- a/xen/common/vm_event.c
> +++ b/xen/common/vm_event.c
> @@ -183,6 +183,7 @@ static int vm_event_disable(struct domain *d, struct vm_event_domain **p_ved)
>      if ( vm_event_check_ring(ved) )
>      {
>          struct vcpu *v;
> +        bool pending_op = false;
>  
>          spin_lock(&ved->lock);
>  
> @@ -192,9 +193,6 @@ static int vm_event_disable(struct domain *d, struct vm_event_domain **p_ved)
>              return -EBUSY;
>          }
>  
> -        /* Free domU's event channel and leave the other one unbound */
> -        free_xen_event_channel(d, ved->xen_port);
> -
>          /* Unblock all vCPUs */
>          for_each_vcpu ( d, v )
>          {
> @@ -203,8 +201,21 @@ static int vm_event_disable(struct domain *d, struct vm_event_domain **p_ved)
>                  vcpu_unpause(v);
>                  ved->blocked--;
>              }
> +
> +            if ( vm_event_check_pending_op(v) )
> +                pending_op = true;

You could just do:

pending_op |= vm_event_check_pending_op(v);

and avoid the initialization of pending_op above. Or alternatively:

if ( !pending_op && vm_event_check_pending_op(v) )
    pending_op = true;

Which avoid repeated calls to vm_event_check_pending_op when at least
one vCPU is known to be busy.

>          }
>  
> +        /* vm_event ops are still pending until vCPUs get scheduled */
> +        if ( pending_op )
> +        {
> +            spin_unlock(&ved->lock);
> +            return -EAGAIN;

What happens when this gets called from vm_event_cleanup?

AFAICT the result there is ignored, and could leak the vm_event
allocated memory?

Thanks, Roger.

