Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E30F4A55D23
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 02:33:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904506.1312387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqMa2-0001H5-Mk; Fri, 07 Mar 2025 01:32:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904506.1312387; Fri, 07 Mar 2025 01:32:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqMa2-0001Fc-Ib; Fri, 07 Mar 2025 01:32:50 +0000
Received: by outflank-mailman (input) for mailman id 904506;
 Fri, 07 Mar 2025 01:32:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nrba=V2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tqMa0-0001FW-Sg
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 01:32:48 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12076039-faf4-11ef-9ab4-95dc52dad729;
 Fri, 07 Mar 2025 02:32:46 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4755CA45345;
 Fri,  7 Mar 2025 01:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D3C9C4CEE0;
 Fri,  7 Mar 2025 01:32:43 +0000 (UTC)
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
X-Inumbo-ID: 12076039-faf4-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741311164;
	bh=iq74L3tkDFalbRl/uqqfdD/lqn/PwkgF/T9akoXFhWg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nOAeHWOVar+Z3/6mhARMyxnxb8+Uv6BaPvvRbRpssKl1jvShcq7YkKK4kf+cRJkYx
	 1r/D+QdVjPYl3js1EIHD8dSpnwWHKZd6hR27mDa43qeaR0oK0MRx1GG3ttUkRRblkr
	 7fa92nXFlmpyOUu3R7K0biGGdaQ0kRXjmm478s5JQwHJUV1UXKbJI3qv4CGrHDm2FF
	 lSbH+4lmLO/Eu+Jy1IuWRqnpIp4jx5mrutmCeo56wQiMSW3xLqGzPuF1Fs/DgliNU5
	 IX2VjNPFUB2xFuIeP9IwmuW76Xz45SLpx59VlBtWdjM/U8JDODqnK/6EofmY/XPd7o
	 Z7cdJfsSQ45mA==
Date: Thu, 6 Mar 2025 17:32:42 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 04/23] xen/arm: dom0less use domid 0 for hwdom
In-Reply-To: <20250306220343.203047-5-jason.andryuk@amd.com>
Message-ID: <alpine.DEB.2.22.394.2503061731511.2600338@ubuntu-linux-20-04-desktop>
References: <20250306220343.203047-1-jason.andryuk@amd.com> <20250306220343.203047-5-jason.andryuk@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 6 Mar 2025, Jason Andryuk wrote:
> Assign domid 0 to the hwdom.  Normally, dom0less does not use domid 0.
> 
> This fixes using the Xen console which assumes domid 0 to use the
> hypercall interface.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

I hope there is a check already in the code somewhere that triggers an
error if multiple domains are created with domid 0 ?


> ---
>  xen/arch/arm/dom0less-build.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index e539bcc762..5a7871939b 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -969,6 +969,7 @@ void __init create_domUs(void)
>      dt_for_each_child_node(chosen, node)
>      {
>          struct domain *d;
> +        domid_t domid;
>          struct xen_domctl_createdomain d_cfg = {
>              .arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE,
>              .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
> @@ -1121,7 +1122,12 @@ void __init create_domUs(void)
>           * very important to use the pre-increment operator to call
>           * domain_create() with a domid > 0. (domid == 0 is reserved for Dom0)
>           */
> -        d = domain_create(++max_init_domid, &d_cfg, flags);
> +        if ( flags & CDF_hardware )
> +            domid = 0;
> +        else
> +            domid = ++max_init_domid;
> +
> +        d = domain_create(domid, &d_cfg, flags);
>          if ( IS_ERR(d) )
>              panic("Error creating domain %s (rc = %ld)\n",
>                    dt_node_name(node), PTR_ERR(d));
> -- 
> 2.48.1
> 

