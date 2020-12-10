Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0BD2D5B4B
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 14:09:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49199.86969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knLh9-0001j7-Pz; Thu, 10 Dec 2020 13:09:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49199.86969; Thu, 10 Dec 2020 13:09:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knLh9-0001ii-MR; Thu, 10 Dec 2020 13:09:19 +0000
Received: by outflank-mailman (input) for mailman id 49199;
 Thu, 10 Dec 2020 13:09:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>) id 1knLh9-0001id-53
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 13:09:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1knLh8-0007AJ-9H; Thu, 10 Dec 2020 13:09:18 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1knLh7-0007Rm-Sx; Thu, 10 Dec 2020 13:09:18 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID;
	bh=keotjG6VPy7Ty3zMpaGQu/RhUQ507IS5vmtwzCQ8to8=; b=EhfDU7yfo5+hggnBpFZR9MLhvV
	nltuBwp2q0vWmO+16nFH0HJjv2F1p70hvqCr5o6FAx6VbhgJmfDPdgf1WrwSuOdbistBm+HNz1tU/
	B1EjeH6IhB1czGwhCOBW6noawpxE5IO5iYIQqGtAZC9EkISewMeVXR7byikgU1Bs0QlA=;
Message-ID: <c6bcaecf71f9e51bdac15c7f97c8ce8460bef306.camel@xen.org>
Subject: Re: [PATCH] x86/HVM: refine when to send mapcache invalidation
 request to qemu
From: Hongyan Xia <hx242@xen.org>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger
	Pau =?ISO-8859-1?Q?Monn=E9?=
	 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>, "olekstysh@gmail.com"
	 <olekstysh@gmail.com>, George Dunlap <George.Dunlap@eu.citrix.com>
Date: Thu, 10 Dec 2020 13:09:15 +0000
In-Reply-To: <f92f62bf-2f8d-34db-4be5-d3e6a4b9d580@suse.com>
References: <f92f62bf-2f8d-34db-4be5-d3e6a4b9d580@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit

I came across the same issue when QEMU was holding an extra reference
to a page removed from p2m, via XENMEM_add_to_physmap. Please tell me
if I am talking nonsense since my knowledge around QEMU invalidation is
limited.

On Mon, 2020-09-28 at 12:44 +0200, Jan Beulich wrote:
> For one it was wrong to send the request only upon a completed
> hypercall: Even if only part of it completed before getting
> preempted,
> invalidation ought to occur. Therefore fold the two return
> statements.
> 
> And then XENMEM_decrease_reservation isn't the only means by which
> pages
> can get removed from a guest, yet all removals ought to be signaled
> to
> qemu. Put setting of the flag into the central p2m_remove_page()
> underlying all respective hypercalls.

Sounds good. I know this still does not catch everything, but at least
a nice improvement from before.

> 
> Plus finally there's no point sending the request for the local
> domain
> when the domain acted upon is a different one. If anything that
> domain's
> qemu's mapcache may need invalidating, but it's unclear how useful
> this
> would be: That remote domain may not execute hypercalls at all, and
> hence may never make it to the point where the request actually gets
> issued. I guess the assumption is that such manipulation is not
> supposed
> to happen anymore once the guest has been started?

I may still want to set the invalidation signal to true even if the
domain acted on is not the local domain. I know the remote domain may
never reach the point to issue the invalidate, but it sounds to me that
the problem is not whether we should set the signal but whether we can
change where the signal is checked to make sure the point of issue can
be reliably triggered, and the latter can be done in a future patch.

> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Putting the check in guest_physmap_remove_page() might also suffice,
> but then a separate is_hvm_domain() would need adding again.
> 
> --- a/xen/arch/x86/hvm/hypercall.c
> +++ b/xen/arch/x86/hvm/hypercall.c
> @@ -31,7 +31,6 @@
>  
>  static long hvm_memory_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>  {
> -    const struct vcpu *curr = current;
>      long rc;
>  
>      switch ( cmd & MEMOP_CMD_MASK )
> @@ -41,14 +40,11 @@ static long hvm_memory_op(int cmd, XEN_G
>          return -ENOSYS;
>      }
>  
> -    if ( !curr->hcall_compat )
> +    if ( !current->hcall_compat )
>          rc = do_memory_op(cmd, arg);
>      else
>          rc = compat_memory_op(cmd, arg);
>  
> -    if ( (cmd & MEMOP_CMD_MASK) == XENMEM_decrease_reservation )
> -        curr->domain->arch.hvm.qemu_mapcache_invalidate = true;
> -
>      return rc;
>  }
>  
> @@ -326,14 +322,11 @@ int hvm_hypercall(struct cpu_user_regs *
>  
>      HVM_DBG_LOG(DBG_LEVEL_HCALL, "hcall%lu -> %lx", eax, regs->rax);
>  
> -    if ( curr->hcall_preempted )
> -        return HVM_HCALL_preempted;
> -
>      if ( unlikely(currd->arch.hvm.qemu_mapcache_invalidate) &&
>           test_and_clear_bool(currd-
> >arch.hvm.qemu_mapcache_invalidate) )
>          send_invalidate_req();
>  
> -    return HVM_HCALL_completed;
> +    return curr->hcall_preempted ? HVM_HCALL_preempted :
> HVM_HCALL_completed;
>  }
>  
>  /*
> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -812,6 +812,9 @@ p2m_remove_page(struct p2m_domain *p2m,
>          }
>      }
>  
> +    if ( p2m->domain == current->domain )
> +        p2m->domain->arch.hvm.qemu_mapcache_invalidate = true;
> +

So my comment above makes me want to remove the condition.

>      return p2m_set_entry(p2m, gfn, INVALID_MFN, page_order,
> p2m_invalid,
>                           p2m->default_access);
>  }
> 

Hongyan


