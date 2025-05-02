Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84762AA7A18
	for <lists+xen-devel@lfdr.de>; Fri,  2 May 2025 21:15:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.975040.1362744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAvpp-0007o9-QS; Fri, 02 May 2025 19:14:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 975040.1362744; Fri, 02 May 2025 19:14:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAvpp-0007l3-N2; Fri, 02 May 2025 19:14:09 +0000
Received: by outflank-mailman (input) for mailman id 975040;
 Fri, 02 May 2025 19:14:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mfxJ=XS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uAvpo-0007kx-L6
 for xen-devel@lists.xenproject.org; Fri, 02 May 2025 19:14:08 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ad3abed-2789-11f0-9ffb-bf95429c2676;
 Fri, 02 May 2025 21:14:02 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D4A5844495;
 Fri,  2 May 2025 19:13:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25D07C4CEE4;
 Fri,  2 May 2025 19:13:59 +0000 (UTC)
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
X-Inumbo-ID: 9ad3abed-2789-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746213240;
	bh=uGGcSP+XC5A+afhF/XOIfsuMCLzMRjeIDkL/zzIXsOY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qgnPSqhrTLn+kFmAP+WY31LB/yZjgzbs6rvfSTK94ur/kVM6poXI4FJiZTTdjoFOf
	 vh8ZrBTjrtPsYLbvQkJlkfP0w/S8AEhhtTzbwfZoTuVMmZ2x3QlsWEDIElilbEYgGy
	 qxoSjk36Mna3DGtMNfCqIa8LWhmq0iEsV5a6p9fdcj3jBXBtkLYlJmGH+G8cokHqg9
	 w56Z9uO1pBNOsFBE4n5ZgflK6GHfmHlMBg/5dmLmJCuAgvdCt7pLbmk/Q/qGTtYUsK
	 jhckOA85i8oSDNvH+EYYxrsYFM5+N+22Q5ph9QSbyLd5edt4CxGY2e/OaW837Do3kp
	 RRGVC0iStOvTg==
Date: Fri, 2 May 2025 12:13:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 4/8] arm/static-shmem.h: drop inclusion of
 asm/setup.h
In-Reply-To: <5e02dc75f4f396d054e9b9206b9305889cadb1a5.1746199009.git.oleksii.kurochko@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2505021213280.3879245@ubuntu-linux-20-04-desktop>
References: <cover.1746199009.git.oleksii.kurochko@gmail.com> <5e02dc75f4f396d054e9b9206b9305889cadb1a5.1746199009.git.oleksii.kurochko@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 2 May 2025, Oleksii Kurochko wrote:
> Nothing is dependent from asm/setup.h in asm/static-shmem.h so inclusion of
> asm/setup.h is droped.

Actually, this patch is not currently dropping any inclusions


> After this drop the following compilation error related to impicit declaration
> of the following functions device_tree_get_reg and map_device_irqs_to_domain,
> device_tree_get_u32 occur during compilation of dom0less-build.c ( as they are
> declared in asm/setup.h ).
> 
> Add inclusion of <asm/setup.h> in dt-overlay.c as it is using handle_device()
> declared in <asm/setup.h>.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V2-3:
>  - Nothing changed. Only rebase.
> ---
>  xen/arch/arm/dom0less-build.c       | 1 +
>  xen/common/device-tree/dt-overlay.c | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index c0634dd61e..7eecd06d44 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -20,6 +20,7 @@
>  #include <asm/dom0less-build.h>
>  #include <asm/domain_build.h>
>  #include <asm/grant_table.h>
> +#include <asm/setup.h>
>  #include <asm/static-memory.h>
>  #include <asm/static-shmem.h>
>  
> diff --git a/xen/common/device-tree/dt-overlay.c b/xen/common/device-tree/dt-overlay.c
> index 81107cb48d..d184186c01 100644
> --- a/xen/common/device-tree/dt-overlay.c
> +++ b/xen/common/device-tree/dt-overlay.c
> @@ -13,6 +13,8 @@
>  #include <xen/libfdt/libfdt.h>
>  #include <xen/xmalloc.h>
>  
> +#include <asm/setup.h>
> +
>  #define DT_OVERLAY_MAX_SIZE KB(500)
>  
>  static LIST_HEAD(overlay_tracker);
> -- 
> 2.49.0
> 

