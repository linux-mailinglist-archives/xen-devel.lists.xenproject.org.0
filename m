Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 161C8999309
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 21:48:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816465.1230675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syz9B-0002nv-TZ; Thu, 10 Oct 2024 19:48:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816465.1230675; Thu, 10 Oct 2024 19:48:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syz9B-0002mM-Qp; Thu, 10 Oct 2024 19:48:29 +0000
Received: by outflank-mailman (input) for mailman id 816465;
 Thu, 10 Oct 2024 19:48:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mNu3=RG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1syz9A-0002i7-ES
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 19:48:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ce30cf7-8740-11ef-99a2-01e77a169b0f;
 Thu, 10 Oct 2024 21:48:26 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3689F5C5B1F;
 Thu, 10 Oct 2024 19:48:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45B13C4CECC;
 Thu, 10 Oct 2024 19:48:23 +0000 (UTC)
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
X-Inumbo-ID: 9ce30cf7-8740-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728589704;
	bh=WAK0js+uLRaxxjzfDY/gHuN/MOfPSm4ZD9dsAYjJEuQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eMfaXiOT2IB4aLqNTcv8Zpgakv96QjNxSi0tIUVwY6QgrqAIGk5M8vI86muc51Dek
	 2vtxDU4cANumGj8LtjkfqhHy4QWo4KM3BL+Gwc2i9ZxhD2SwkuRSjPFNa6adic7GHP
	 3sVfnvmVIN53mt3K9w41B613oSdOAQ6sGduHXPNUDnhRJe7bZpkEZkmNuB/Gr/cmVP
	 rh8uM3/UkC7n0ehoCd3vndKsg6jvBpVW6Yj3I7QbbiiSpSrA4oYjhkaAIZ1BJO47+V
	 mP1YFD8v6d6AaaJOIL2pakD+D1xDBhRzoUaihoTmCpKJcjrm5bloiCn0BoNY8Lu5E+
	 1sOE1PAa/z8Sw==
Date: Thu, 10 Oct 2024 12:48:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH] device-tree: Move dt-overlay.c to common/device-tree/
In-Reply-To: <20241010105746.140921-1-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2410101248160.471028@ubuntu-linux-20-04-desktop>
References: <20241010105746.140921-1-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 10 Oct 2024, Michal Orzel wrote:
> The code is DT specific and as such should be placed under common
> directory for DT related files. Update MAINTAINERS file accordingly
> and drop the line with a path from a top-level comment in dt-overlay.c.
> It serves no purpose and requires being updated on every code movement.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> This patch is based on the already acked series (waiting to be committed):
> https://lore.kernel.org/xen-devel/20241004122220.234817-1-michal.orzel@amd.com/T/
> ---
>  MAINTAINERS                               | 1 -
>  xen/common/Makefile                       | 1 -
>  xen/common/device-tree/Makefile           | 1 +
>  xen/common/{ => device-tree}/dt-overlay.c | 2 --
>  4 files changed, 1 insertion(+), 4 deletions(-)
>  rename xen/common/{ => device-tree}/dt-overlay.c (99%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f68ddd7f84a5..3bba2c8c31ad 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -292,7 +292,6 @@ M:	Michal Orzel <michal.orzel@amd.com>
>  S:	Supported
>  F:	xen/common/libfdt/
>  F:	xen/common/device-tree/
> -F:	xen/common/dt-overlay.c
>  F:	xen/include/xen/libfdt/
>  F:	xen/include/xen/bootfdt.h
>  F:	xen/include/xen/device_tree.h
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index f90bb00d23e5..8dec11544e35 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -9,7 +9,6 @@ obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
>  obj-$(CONFIG_HAS_DEVICE_TREE) += device-tree/
>  obj-$(CONFIG_IOREQ_SERVER) += dm.o
>  obj-y += domain.o
> -obj-$(CONFIG_OVERLAY_DTB) += dt-overlay.o
>  obj-y += event_2l.o
>  obj-y += event_channel.o
>  obj-y += event_fifo.o
> diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
> index 990abd571acf..58052d074e62 100644
> --- a/xen/common/device-tree/Makefile
> +++ b/xen/common/device-tree/Makefile
> @@ -1,3 +1,4 @@
>  obj-y += bootfdt.init.o
>  obj-y += bootinfo.init.o
>  obj-y += device-tree.o
> +obj-$(CONFIG_OVERLAY_DTB) += dt-overlay.o
> diff --git a/xen/common/dt-overlay.c b/xen/common/device-tree/dt-overlay.c
> similarity index 99%
> rename from xen/common/dt-overlay.c
> rename to xen/common/device-tree/dt-overlay.c
> index 5ce00514ef14..97fb99eaaaf7 100644
> --- a/xen/common/dt-overlay.c
> +++ b/xen/common/device-tree/dt-overlay.c
> @@ -1,7 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /*
> - * xen/common/dt-overlay.c
> - *
>   * Device tree overlay support in Xen.
>   *
>   * Copyright (C) 2023, Advanced Micro Devices, Inc. All Rights Reserved.
> -- 
> 2.25.1
> 

