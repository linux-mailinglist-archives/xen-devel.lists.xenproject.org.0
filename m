Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A61BCAB600E
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 02:10:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983663.1369893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEzh9-0005ae-C8; Wed, 14 May 2025 00:09:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983663.1369893; Wed, 14 May 2025 00:09:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEzh9-0005Ye-94; Wed, 14 May 2025 00:09:59 +0000
Received: by outflank-mailman (input) for mailman id 983663;
 Wed, 14 May 2025 00:09:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eXN3=X6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uEzh7-0005YY-TV
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 00:09:57 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4217019-3057-11f0-9eb6-5ba50f476ded;
 Wed, 14 May 2025 02:09:56 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4710043956;
 Wed, 14 May 2025 00:09:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62F19C4CEEF;
 Wed, 14 May 2025 00:09:54 +0000 (UTC)
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
X-Inumbo-ID: c4217019-3057-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747181395;
	bh=ylLORO7UhforemxsiCHsk7OgZlD9BpSGYVx1CI6s5nw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Wj/sk04vwAAFel9/1vRSI7s9G89ZYPzIZ4TbbPOczBFS0O3vxRMSF3H0SxLcKvM1T
	 9SmgEupyRhSegR5S65frmzcEQYDZ1s2KaCKPOnd6wB1kR0lf51cWD1RyoHTUAzO8Rl
	 sHkX5EeoY9bNTrg8SgdHCDGYK5ET1kPMP0BJIZHMLG1kuO/PAJPsnvhi23rkbpdl/1
	 cF7j/X22sfW5ZHJ6yMZWjnfs1Ecnm/E8l6qbdi6/tvGKGDBITWx4SlNfqh3/rxnJld
	 kN+8NeRjH/ynZgiFhuo7oYnTS19A0DqscRBMmx/rWgWs7506oHqnoFWdKCXxg/6KuL
	 hVthnTIxv71fg==
Date: Tue, 13 May 2025 17:09:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 2/2] xen: enforce __init in
 common/device-tree/*-build.c
In-Reply-To: <20250513171810.668370-2-stewart.hildebrand@amd.com>
Message-ID: <alpine.DEB.2.22.394.2505131709480.368682@ubuntu-linux-20-04-desktop>
References: <20250513171810.668370-1-stewart.hildebrand@amd.com> <20250513171810.668370-2-stewart.hildebrand@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 13 May 2025, Stewart Hildebrand wrote:
> Code in domain-build.c and dom0less-build.c was migrated from init-only
> files. Thus, they contain only __init functions. Enforce this at build
> time.
> 
> Fixes: ad03faa942b9 ("xen/common: dom0less: make some parts of Arm's CONFIG_DOM0LESS common")
> Fixes: d07b7369aa65 ("xen/common: dom0less: introduce common domain-build.c")
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/common/device-tree/Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
> index 831b91399b74..ff54a8ef2bee 100644
> --- a/xen/common/device-tree/Makefile
> +++ b/xen/common/device-tree/Makefile
> @@ -1,8 +1,8 @@
>  obj-y += bootfdt.init.o
>  obj-y += bootinfo.init.o
>  obj-y += device-tree.o
> -obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += domain-build.o
> -obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.o
> +obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += domain-build.init.o
> +obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.init.o
>  obj-$(CONFIG_OVERLAY_DTB) += dt-overlay.o
>  obj-y += intc.o
>  obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += kernel.o
> -- 
> 2.49.0
> 

