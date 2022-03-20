Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFBF4E195C
	for <lists+xen-devel@lfdr.de>; Sun, 20 Mar 2022 02:45:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292485.496774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVkbv-0005Gc-5k; Sun, 20 Mar 2022 01:43:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292485.496774; Sun, 20 Mar 2022 01:43:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVkbv-0005DS-2B; Sun, 20 Mar 2022 01:43:59 +0000
Received: by outflank-mailman (input) for mailman id 292485;
 Sun, 20 Mar 2022 01:43:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u5H8=T7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nVkbs-0005DM-Vj
 for xen-devel@lists.xenproject.org; Sun, 20 Mar 2022 01:43:57 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32ad9af8-a7ef-11ec-8fbc-03012f2f19d4;
 Sun, 20 Mar 2022 02:43:55 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CACCAB80D35;
 Sun, 20 Mar 2022 01:43:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38E14C340EC;
 Sun, 20 Mar 2022 01:43:51 +0000 (UTC)
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
X-Inumbo-ID: 32ad9af8-a7ef-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647740631;
	bh=VehCz83+I1nCI5IdlfcVrnrhrWwIaQwIgWrIrR2T/aw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fABK82MSf9fyN7xCmdN/piaWsUZdNlmmJ+gLNC+zyYDyqMxeZxAHupLSTu+lS+OsZ
	 c1HpYZG2GNA7RZKHQpCZa6JKJrB0FXsPgwu/C5U1+7e4o5ivyjV5cOqY2EPBkr+Vf/
	 o/6kY1vENs2k1JndIvAY7a61Db5bZ6QfGrFY0h4dLTazc7z1+ohu8MJ5/75B4uQWki
	 Qhnonh1dOlLKYnq8wzuhLVuBDmscKEnlCJH+/BJyKnVe9gYHiXC66EqmT3Gowh522V
	 DRhFJDkrXcORmJPkxsoW1xPfdU5FLeuoCvtVqm5LEjZR+g1wWUwJJsSosoetSpUEwp
	 sOL/eactENVkw==
Date: Sat, 19 Mar 2022 18:43:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: julien@xen.org, bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/arm: skip first 32 bytes of zimage32
In-Reply-To: <20220320010509.3605525-1-sstabellini@kernel.org>
Message-ID: <alpine.DEB.2.22.394.2203191843360.2910984@ubuntu-linux-20-04-desktop>
References: <20220320010509.3605525-1-sstabellini@kernel.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

+xen-devel

On Sat, 19 Mar 2022, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> The first 32 bytes of zImage32 are NOPs, not useful just there for
> compatibility. The reason is that some bootloaders skip the first 32
> bytes when starting the kernel. See the comment in Linux
> arch/arm/boot/compressed/head.S.
> 
> Since the introduction of CONFIG_EFI in Linux arm32, those NOPs
> operations have changed implementation from:
> 
>     mov r0, r0
> 
> to:
>     .inst   MZ_MAGIC | (0x1310 << 16)   @ tstne r0, #0x4d000
> 
> See arch/arm/boot/compressed/efi-header.S.
> 
> The new implementation doesn't work on Xen (at least on all versions of
> QEMU I tried).
> 
> Since the first 32 bytes are made to be skipped anyway, skip them. This
> enables Xen to load and start successfully (on QEMU) aarch32 kernels
> with CONFIG_EFI.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---
>  xen/arch/arm/kernel.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
> index 8f43caa186..105a010bf4 100644
> --- a/xen/arch/arm/kernel.c
> +++ b/xen/arch/arm/kernel.c
> @@ -411,10 +411,10 @@ static int __init kernel_zimage32_probe(struct kernel_info *info,
>          }
>      }
>  
> -    info->zimage.kernel_addr = addr;
> +    info->zimage.kernel_addr = addr + 32;
>  
>      info->zimage.start = start;
> -    info->zimage.len = end - start;
> +    info->zimage.len = end - start - 32;
>  
>      info->load = kernel_zimage_load;
>  
> -- 
> 2.25.1
> 

