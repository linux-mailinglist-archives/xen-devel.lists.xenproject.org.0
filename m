Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81065AB6008
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 02:07:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983655.1369884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEzef-00053h-08; Wed, 14 May 2025 00:07:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983655.1369884; Wed, 14 May 2025 00:07:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEzee-000523-Tl; Wed, 14 May 2025 00:07:24 +0000
Received: by outflank-mailman (input) for mailman id 983655;
 Wed, 14 May 2025 00:07:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eXN3=X6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uEzed-00051x-US
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 00:07:23 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 685360d7-3057-11f0-9eb6-5ba50f476ded;
 Wed, 14 May 2025 02:07:23 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 42C915C5440;
 Wed, 14 May 2025 00:05:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83B9CC4CEE4;
 Wed, 14 May 2025 00:07:20 +0000 (UTC)
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
X-Inumbo-ID: 685360d7-3057-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747181241;
	bh=nDIW/ShPxys+yLgBG4/j+LA776kk54ox5muaP0Kf3NE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sxC4hIEpoQV58+bL/vTlVQEpbfFNsAopAztJcfl1+8DwrCH2+ePMUyw3ItnB4vOYc
	 YjukCxyY4BzDr84t0/ZvhkamGWFVHisIze335xxmb54jtJRts0I7ptXkV/W52sNEUv
	 F7waLyqLnbddXP1nQ8gvs5RUriSoxoCbRO8qieSsiKcCCM/RfvH4l4i5n2viFXLCn5
	 VqgCc2TsVTPOdDF7UfUi48DC20iA/XIqk4a7+as8svYlLi50lsyT44LjWlow+wblOg
	 5j89trmeHyRNOrdESwoxVJEfU66qTtNfyms4eh4L6bjm37cRwcTcPfDBgsEE1iDCCr
	 n3YyXAKdnjfQA==
Date: Tue, 13 May 2025 17:07:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 1/2] xen/dom0less: mark domain_p2m_set_allocation
 __init
In-Reply-To: <20250513171810.668370-1-stewart.hildebrand@amd.com>
Message-ID: <alpine.DEB.2.22.394.2505131707020.368682@ubuntu-linux-20-04-desktop>
References: <20250513171810.668370-1-stewart.hildebrand@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 13 May 2025, Stewart Hildebrand wrote:
> All functions in dom0less-build.c should be __init.
> 
> Fixes: 2705f1adb9df ("xen: introduce Kconfig ARCH_PAGING_MEMPOOL")
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  xen/common/device-tree/dom0less-build.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
> index 2c56f13771ab..39cb2cd5c70e 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -730,8 +730,8 @@ static int __init domain_p2m_set_allocation(struct domain *d, uint64_t mem,
>      return rc;
>  }
>  #else /* !CONFIG_ARCH_PAGING_MEMPOOL */
> -static inline int domain_p2m_set_allocation(struct domain *d, uint64_t mem,
> -                                            const struct dt_device_node *node)
> +static inline int __init domain_p2m_set_allocation(
> +    struct domain *d, uint64_t mem, const struct dt_device_node *node)
>  {
>      return 0;
>  }
> 
> base-commit: 5873740e41acb8593f92623ddd03caebda2718f6
> -- 
> 2.49.0
> 

