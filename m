Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA09C5EF98C
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 17:54:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413847.657770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odvqe-00074w-86; Thu, 29 Sep 2022 15:53:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413847.657770; Thu, 29 Sep 2022 15:53:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odvqe-00072v-5D; Thu, 29 Sep 2022 15:53:16 +0000
Received: by outflank-mailman (input) for mailman id 413847;
 Thu, 29 Sep 2022 15:53:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=04na=2A=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1odvqc-00072p-1q
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 15:53:14 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d28071f5-400e-11ed-964a-05401a9f4f97;
 Thu, 29 Sep 2022 17:53:12 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C0630B820D1;
 Thu, 29 Sep 2022 15:53:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B513C433C1;
 Thu, 29 Sep 2022 15:53:09 +0000 (UTC)
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
X-Inumbo-ID: d28071f5-400e-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664466790;
	bh=ttMe8cMmwtVdgjTvUp5hN4+IDIVKDcGidIj7uh1vLOs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=k1tUwjNyp7OfN2npaE8ib+esU/bmk5XIAyzVA/So3MwUruMruZzL7VZqoK30JvypK
	 drJgawCfpdSamVt5VRyKK8RzjvmtJBqaGVOK46PAW0Rmm0YOEJ1i4V744bZXTQfgQF
	 xMGd3H2MJVDQrkwf540fD3MUqhGPNItAId/lwxm6LQp7hJH7vRINXThRfMbD9tz2cW
	 fpXOnReZCZt+KMGMruvLeNLiWvJ1QbocbrcehKNWxW0SurQXitC/GSLQU3N1gWlqLk
	 q7SPGID9oVVhEyshLiTeO9s9YhMMEj8NlcsNTke/zcWix3gFPv/zsCgsMl24uddhfk
	 FFoc7MnvOSaHg==
Date: Thu, 29 Sep 2022 08:53:08 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [for-4.17 v2] xen/arm: domain_build: Always print the static
 shared memory region
In-Reply-To: <20220919183737.14067-1-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2209290852590.922084@ubuntu-linux-20-04-desktop>
References: <20220919183737.14067-1-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 19 Sep 2022, Michal Orzel wrote:
> At the moment, the information about allocating static shared memory
> region is only printed during the debug build. This information can also
> be helpful for the end user (which may not be the same as the person
> building the package), so switch to printk(). Also drop XENLOG_INFO to be
> consistent with other printk() used to print the domain information.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> The other motivation for this patch is to be consistent with regards
> to the format of the informative logs. We do not really use dprintk with
> XENLOG_INFO unconditionally as it results in printing additionally filename
> and line number which may be misleading for someone reading the boot log.
> Such extra information is helpful on error conditions to make the process
> of debugging easier.
> 
> Rationale for taking this patch for 4.17:
> Useful information printed always instead of only during the debug build.
> 
> Changes in v2:
> - use different argumentation
> - drop XENLOG_INFO
> ---
>  xen/arch/arm/domain_build.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 01c2aaccd82d..40e3c2e1195c 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -844,9 +844,8 @@ static int __init assign_shared_memory(struct domain *d,
>      unsigned long nr_pages, nr_borrowers, i;
>      struct page_info *page;
>  
> -    dprintk(XENLOG_INFO,
> -            "%pd: allocate static shared memory BANK %#"PRIpaddr"-%#"PRIpaddr".\n",
> -            d, pbase, pbase + psize);
> +    printk("%pd: allocate static shared memory BANK %#"PRIpaddr"-%#"PRIpaddr".\n",
> +           d, pbase, pbase + psize);
>  
>      smfn = acquire_shared_memory_bank(d, pbase, psize);
>      if ( mfn_eq(smfn, INVALID_MFN) )
> -- 
> 2.25.1
> 

