Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC46DA58FBC
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 10:32:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906332.1313774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trZUT-0001Zp-Na; Mon, 10 Mar 2025 09:32:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906332.1313774; Mon, 10 Mar 2025 09:32:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trZUT-0001Wk-Kx; Mon, 10 Mar 2025 09:32:05 +0000
Received: by outflank-mailman (input) for mailman id 906332;
 Mon, 10 Mar 2025 09:32:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1trZUR-0001WT-RQ
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 09:32:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1trZUR-00CbAh-1M;
 Mon, 10 Mar 2025 09:32:03 +0000
Received: from [2a02:8012:3a1:0:f9cf:8834:13d9:5b3]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1trZUQ-001Fdy-3D;
 Mon, 10 Mar 2025 09:32:03 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=Gm22hsHx2D1i9GF4hRTNTwDK2maDa8wXB/+FvaWaEHg=; b=YYL+XYlfXl/BKgMbzRzHQUxAR+
	XgkCgowLrGl68Gmx3OpK4UCBClhEqJWgYNxQf9SIHW7aj18Fi3ewRwq3rFJKqxhSnYrVtsO7V3Vys
	8htPMuRDUxkODPg9ik9yd60sFysjwgOcFhfnR4lzsps9I6zusUjr2/5VaUxx9IJ8ID0o=;
Message-ID: <8be2b25d-7a2c-40a5-bbdb-0f7aade2bbd2@xen.org>
Date: Mon, 10 Mar 2025 09:32:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/23] xen/arm: dom0less seed xenstore grant table entry
Content-Language: en-GB
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-9-jason.andryuk@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250306220343.203047-9-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jason,

On 06/03/2025 22:03, Jason Andryuk wrote:
> With a split hardware and control domain, the control domain may still
> want and xenstore access.  Currently this relies on init-dom0less to
> seed the grants.  This is problematic since we don't want hardware
> domain to be able to map the control domain's resources.  Instead have
> the hypervisor see the grant table entry.  The grant is then accessible
> as normal.
> 
> This is also useful with a xenstore stubdom to setup the xenbus page
> much earlier.
> 
> This works with C xenstored.  OCaml xenstored does not use grants and
> would fail to foreign map the page.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
>   xen/arch/arm/dom0less-build.c |  9 +++++++++
>   xen/common/grant_table.c      | 10 ++++++++++
>   xen/include/xen/grant_table.h |  8 ++++++++
>   3 files changed, 27 insertions(+)
> 
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 068bf99294..f1d5bbb097 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -21,6 +21,8 @@
>   #include <asm/static-memory.h>
>   #include <asm/static-shmem.h>
>   
> +static domid_t __initdata xs_domid = DOMID_INVALID;
> +
>   bool __init is_dom0less_mode(void)
>   {
>       struct bootmodules *mods = &bootinfo.modules;
> @@ -753,6 +755,10 @@ static int __init alloc_xenstore_page(struct domain *d)
>       interface->connection = XENSTORE_RECONNECT;
>       unmap_domain_page(interface);
>   
> +    if ( xs_domid != DOMID_INVALID )

Looking at this patch again, is this guarantee that the xenstore domain 
will be created first? If not, then I think your series needs to be 
re-ordered so patch #10 is before this patch.

> +        gnttab_seed_entry(d, GNTTAB_RESERVED_XENSTORE, xs_domid,
> +                          gfn_x(gfn), GTF_permit_access);
> +
>       return 0;
>   }
>   
> @@ -1173,6 +1179,9 @@ void __init create_domUs(void)
>           if ( rc )
>               panic("Could not set up domain %s (rc = %d)\n",
>                     dt_node_name(node), rc);
> +
> +        if ( d_cfg.flags & XEN_DOMCTL_CDF_xs_domain )
> +            xs_domid = d->domain_id;

What if there is multiple domain with XEN_DOMCTL_CDF_xs_domain? Should 
we throw an error?

Cheers,

-- 
Julien Grall


