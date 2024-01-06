Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C67B2825D73
	for <lists+xen-devel@lfdr.de>; Sat,  6 Jan 2024 01:47:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662401.1032494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLupP-00028v-Cf; Sat, 06 Jan 2024 00:46:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662401.1032494; Sat, 06 Jan 2024 00:46:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLupP-00026x-8n; Sat, 06 Jan 2024 00:46:19 +0000
Received: by outflank-mailman (input) for mailman id 662401;
 Sat, 06 Jan 2024 00:46:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g2yR=IQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rLupM-000265-VI
 for xen-devel@lists.xenproject.org; Sat, 06 Jan 2024 00:46:16 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fda94620-ac2c-11ee-98ef-6d05b1d4d9a1;
 Sat, 06 Jan 2024 01:46:14 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BA8CDCE1F4A;
 Sat,  6 Jan 2024 00:46:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C25AC433C7;
 Sat,  6 Jan 2024 00:46:07 +0000 (UTC)
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
X-Inumbo-ID: fda94620-ac2c-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704501969;
	bh=51JQYbLOw6xtOk4MFHz9H0ezeQhXUn1O6WTmNNcjXh4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=T4kmyN97cjbNy9EVAzMDgMWmul4Y9tU4VFX5YDNqcG6ebEYTDbaLr/3GHkhJaxHCQ
	 +uyy68zGDFKMT0K1VOYiYBi8kUgJe4wWTsjlaT4QLVSU5KyQa8ggKTlX9PdBDIHyBs
	 +A1B1e9n7vKTgNh9mcjdScroILwLm6QEGPzu5Y3gGrmd9OyU4TkSNilybpeThMLFlD
	 bqPQSFmSHqkhax9lBeDvsFyGv+UZuREcGjdQX1N4YC2B8TyZ+rRw5d9uKXUmrliqr1
	 d2uXiC9642u3JkQrdRb8/IIQDvOzHEYT50AL6xwYKHRX+8MBAOYBndjjYD9BLl4oo6
	 yapXVQ/M7z3YQ==
Date: Fri, 5 Jan 2024 16:46:05 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jiqian Chen <Jiqian.Chen@amd.com>
cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>, 
    Stewart Hildebrand <Stewart.Hildebrand@amd.com>, 
    Huang Rui <Ray.Huang@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: Re: [RFC XEN PATCH v4 2/5] x86/pvh: Allow (un)map_pirq when caller
 isn't DOMID_SELF
In-Reply-To: <20240105070920.350113-3-Jiqian.Chen@amd.com>
Message-ID: <alpine.DEB.2.22.394.2401051639240.3675@ubuntu-linux-20-04-desktop>
References: <20240105070920.350113-1-Jiqian.Chen@amd.com> <20240105070920.350113-3-Jiqian.Chen@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 5 Jan 2024, Jiqian Chen wrote:
> If run Xen with PVH dom0 and hvm domU, hvm will map a pirq for
> a passthrough device by using gsi, see
> xen_pt_realize->xc_physdev_map_pirq and
> pci_add_dm_done->xc_physdev_map_pirq. Then xc_physdev_map_pirq
> will call into Xen, but in hvm_physdev_op, PHYSDEVOP_map_pirq
> is not allowed because currd is PVH dom0 and PVH has no
> X86_EMU_USE_PIRQ flag, it will fail at has_pirq check.
> 
> So, allow PHYSDEVOP_map_pirq when domid of the caller is not
> DOMID_SELF no matter whether currd has X86_EMU_USE_PIRQ flag
> and also allow PHYSDEVOP_unmap_pirq for the failed path to
> unmap pirq.
> 
> Co-developed-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
>  xen/arch/x86/hvm/hypercall.c | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
> index 6ad5b4d5f11f..632a68be3cc4 100644
> --- a/xen/arch/x86/hvm/hypercall.c
> +++ b/xen/arch/x86/hvm/hypercall.c
> @@ -10,6 +10,7 @@
>  #include <xen/hypercall.h>
>  #include <xen/ioreq.h>
>  #include <xen/nospec.h>
> +#include <xen/guest_access.h>
>  
>  #include <asm/hvm/emulate.h>
>  #include <asm/hvm/support.h>
> @@ -72,8 +73,30 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>  
>      switch ( cmd )
>      {
> -    case PHYSDEVOP_map_pirq:
> -    case PHYSDEVOP_unmap_pirq:
> +    case PHYSDEVOP_map_pirq: {
> +        physdev_map_pirq_t map;
> +
> +        if ( copy_from_guest(&map, arg, 1) != 0 )
> +            return -EFAULT;
> +
> +        if ( !has_pirq(currd) && map.domid == DOMID_SELF )
> +            return -ENOSYS;

This looks OK to me although there is already another copy_from_guest in
do_physdev_op, but I don't see an easy way to make it better.

Also, you could write this check like this:

        d = rcu_lock_domain_by_any_id(map.domid);
        if ( d == NULL )
            return -ESRCH;
        if ( !has_pirq(d) )
            return -ENOSYS;
        rcu_unlock_domain(d);

This way it is a bit more generic and not special-cased to DOMID_SELF.

I'll let the x86 maintainers comment on the way the prefer it.


> +        break;
> +    }
> +
> +    case PHYSDEVOP_unmap_pirq: {
> +        physdev_unmap_pirq_t unmap;
> +
> +        if ( copy_from_guest(&unmap, arg, 1) != 0 )
> +            return -EFAULT;
> +
> +        if ( !has_pirq(currd) && unmap.domid == DOMID_SELF )
> +            return -ENOSYS;
> +
> +        break;
> +    }
> +
>      case PHYSDEVOP_eoi:
>      case PHYSDEVOP_irq_status_query:
>      case PHYSDEVOP_get_free_pirq:
> -- 
> 2.34.1
> 

