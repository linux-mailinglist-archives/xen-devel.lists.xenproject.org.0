Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03505817F74
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 02:49:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656474.1024666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFPEA-00021s-Ip; Tue, 19 Dec 2023 01:48:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656474.1024666; Tue, 19 Dec 2023 01:48:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFPEA-0001zn-Fc; Tue, 19 Dec 2023 01:48:58 +0000
Received: by outflank-mailman (input) for mailman id 656474;
 Tue, 19 Dec 2023 01:48:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ry3N=H6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rFPE9-0001zh-O5
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 01:48:57 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4dd252c-9e10-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 02:48:56 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D1A47611E3;
 Tue, 19 Dec 2023 01:48:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA2E4C433C7;
 Tue, 19 Dec 2023 01:48:52 +0000 (UTC)
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
X-Inumbo-ID: c4dd252c-9e10-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702950534;
	bh=f3H2YPGB4mkSnGr6Two/tlsKnnMGlZ1oySH+a1+wNLo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dmT/tFuzsOnL5CRGA9atylKG60YzCnFqd+0JiIjZJ33aHtp8vUwQtfnzIqGUpP32M
	 sBJyB03wR8cOjowuuu4jDPvsr++IsljQz8P81rEQJxdcgRh7qJle5DuznYI6oOeVXq
	 tPmtmSdeLiLAHtWKmXtuAnRds+4JtDJQrRbJobeEsy0t5vOm1XvgdEylmwK004RMWD
	 lWET5ct/qomVyGWDDlQIAJtCh1yzYCbWzRAqmIGfUWS9/lGso9ZZ3MWf3Gc+04H8XI
	 XpkyPYOJduTloQZXr8mbImkRh6f35SQZdOzxnMl4OcC7XVSDQF+kjEDdAsiOVkS+lA
	 I3ZXZt4sa6fkg==
Date: Mon, 18 Dec 2023 17:48:51 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>, Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: Re: [XEN PATCH v2] xen: move declaration of first_valid_mfn to
 xen/numa.h
In-Reply-To: <ad7ee70bd00c0de4b6dad48c91281929e98ef95c.1702911455.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312181748430.3175268@ubuntu-linux-20-04-desktop>
References: <ad7ee70bd00c0de4b6dad48c91281929e98ef95c.1702911455.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 18 Dec 2023, Nicola Vetrini wrote:
> Such declaration is moved in order to provide it for Arm and PPC,
> whilst not violating MISRA C:2012 Rule 8.4 in common/page_alloc.c:
> "A compatible declaration shall be visible when an object or
> function with external linkage is defined".
> 
> Signed-off-by: Julien Grall <julien@xen.org>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
> This patch is a rework of a previous one appeared in this series [1], of which
> patches 1 and 2 have been committed already.
> 
> The updated patch was provided by Julien in this thread [2]. I added the commit
> message and the rest of the information.
> 
> [1] https://lore.kernel.org/xen-devel/cover.1702285639.git.nicola.vetrini@bugseng.com/T/#mee6def855787d932fe2f10d5648d437dcb6f046c
> [2] https://lore.kernel.org/xen-devel/cover.1702285639.git.nicola.vetrini@bugseng.com/T/#m3c5b141b806530b5920bb5e9dd53631195560317
> ---
>  xen/arch/arm/include/asm/numa.h | 6 ------
>  xen/arch/ppc/include/asm/numa.h | 6 ------
>  xen/common/page_alloc.c         | 6 ++++--
>  xen/include/xen/numa.h          | 2 ++
>  4 files changed, 6 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/numa.h b/xen/arch/arm/include/asm/numa.h
> index e2bee2bd8223..a2c1da4a82f7 100644
> --- a/xen/arch/arm/include/asm/numa.h
> +++ b/xen/arch/arm/include/asm/numa.h
> @@ -11,12 +11,6 @@ typedef u8 nodeid_t;
>  #define cpu_to_node(cpu) 0
>  #define node_to_cpumask(node)   (cpu_online_map)
>  
> -/*
> - * TODO: make first_valid_mfn static when NUMA is supported on Arm, this
> - * is required because the dummy helpers are using it.
> - */
> -extern mfn_t first_valid_mfn;
> -
>  /* XXX: implement NUMA support */
>  #define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
>  #define node_start_pfn(nid) (mfn_x(first_valid_mfn))
> diff --git a/xen/arch/ppc/include/asm/numa.h b/xen/arch/ppc/include/asm/numa.h
> index 7fdf66c3da74..204180ad5b98 100644
> --- a/xen/arch/ppc/include/asm/numa.h
> +++ b/xen/arch/ppc/include/asm/numa.h
> @@ -10,12 +10,6 @@ typedef uint8_t nodeid_t;
>  #define cpu_to_node(cpu) 0
>  #define node_to_cpumask(node)   (cpu_online_map)
>  
> -/*
> - * TODO: make first_valid_mfn static when NUMA is supported on PPC, this
> - * is required because the dummy helpers are using it.
> - */
> -extern mfn_t first_valid_mfn;
> -
>  /* XXX: implement NUMA support */
>  #define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
>  #define node_start_pfn(nid) (mfn_x(first_valid_mfn))
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 9b5df74fddab..d874525916ea 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -255,8 +255,10 @@ static PAGE_LIST_HEAD(page_broken_list);
>   */
>  
>  /*
> - * first_valid_mfn is exported because it is use in ARM specific NUMA
> - * helpers. See comment in arch/arm/include/asm/numa.h.
> + * first_valid_mfn is exported because it is used when !CONFIG_NUMA.
> + *
> + * TODO: Consider if we can conditionally export first_valid_mfn based
> + * on whether NUMA is selected.
>   */
>  mfn_t first_valid_mfn = INVALID_MFN_INITIALIZER;
>  
> diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
> index 287e81ff6666..a10d4b1778a0 100644
> --- a/xen/include/xen/numa.h
> +++ b/xen/include/xen/numa.h
> @@ -108,6 +108,8 @@ extern void numa_set_processor_nodes_parsed(nodeid_t node);
>  
>  #else
>  
> +extern mfn_t first_valid_mfn;
> +
>  static inline nodeid_t mfn_to_nid(mfn_t mfn)
>  {
>      return 0;
> -- 
> 2.34.1
> 

