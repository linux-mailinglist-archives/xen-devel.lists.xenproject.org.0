Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE62CAC98DF
	for <lists+xen-devel@lfdr.de>; Sat, 31 May 2025 03:44:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001839.1381995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLBGc-0003kt-5v; Sat, 31 May 2025 01:44:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001839.1381995; Sat, 31 May 2025 01:44:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLBGc-0003iX-1D; Sat, 31 May 2025 01:44:10 +0000
Received: by outflank-mailman (input) for mailman id 1001839;
 Sat, 31 May 2025 01:44:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ffab=YP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uLBGa-0003gb-7y
 for xen-devel@lists.xenproject.org; Sat, 31 May 2025 01:44:08 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd145eb3-3dc0-11f0-a300-13f23c93f187;
 Sat, 31 May 2025 03:44:07 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E2D16629C1;
 Sat, 31 May 2025 01:44:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 530EDC4CEEB;
 Sat, 31 May 2025 01:44:04 +0000 (UTC)
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
X-Inumbo-ID: bd145eb3-3dc0-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748655845;
	bh=clU528x4zKAAvL7u1yqleYMbeplGWqTSECKfAojrYoI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rS2fO5gHJezXQJsp+NAbePptnHGn07BHmPdNaAdVPoRWnaiw/tRVvGR30M57bEdFN
	 QnFC3RkAT9/v9piud5SDky7xE5moeLK+st982fuB2hZaX34qfA4+w6IMXGz57EwmkR
	 3f2P1j8dAnj6Iu42biL2+gLwrldmHwbz8gXudlIQN10HaaVN/16JQuj/XwT81MZXBd
	 X5sFUyvyZsRp1yjJ58ncCXpKBRjT/KhoLnms5kk4E7xSj/douSuap3Zx9jFaAXcU9o
	 zk3j7UVP9NDJcf1oBoW01wZaw5K+jwoq9sluxq81IdyExnNWV5cUaOCpWTvrAY9M3d
	 aV0LbqlwYujyw==
Date: Fri, 30 May 2025 18:44:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <agarciav@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 14/19] xen/dt: Rename bootfdt.c -> bootinfo-fdt.c
In-Reply-To: <20250530120242.39398-15-agarciav@amd.com>
Message-ID: <alpine.DEB.2.22.394.2505301843480.1147082@ubuntu-linux-20-04-desktop>
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com> <20250530120242.39398-1-agarciav@amd.com> <20250530120242.39398-15-agarciav@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 30 May 2025, Alejandro Vallejo wrote:
> This file will eventually contain bootfdt helpers that make heavy use of
> bootinfo. To simplify git history do the rename here explicitly. A later
> patch extracts bootinfo-independent helpers into bootfdt.c.
> 
> Doing so here would needlessly pollute the diffs.
> 
> Not a functional change.
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/common/device-tree/Makefile                      | 2 +-
>  xen/common/device-tree/{bootfdt.c => bootinfo-fdt.c} | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename xen/common/device-tree/{bootfdt.c => bootinfo-fdt.c} (99%)
> 
> diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
> index 57b9e6ca00..bb6d5ddec5 100644
> --- a/xen/common/device-tree/Makefile
> +++ b/xen/common/device-tree/Makefile
> @@ -1,4 +1,4 @@
> -obj-y += bootfdt.init.o
> +obj-y += bootinfo-fdt.init.o
>  obj-y += bootinfo.init.o
>  obj-y += device-tree.o
>  obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += domain-build.init.o
> diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootinfo-fdt.c
> similarity index 99%
> rename from xen/common/device-tree/bootfdt.c
> rename to xen/common/device-tree/bootinfo-fdt.c
> index fb4ac06390..bb5f45771e 100644
> --- a/xen/common/device-tree/bootfdt.c
> +++ b/xen/common/device-tree/bootinfo-fdt.c
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /*
> - * Early Device Tree
> + * Early Device Tree with bootinfo hooks
>   *
>   * Copyright (C) 2012-2014 Citrix Systems, Inc.
>   */
> -- 
> 2.43.0
> 

