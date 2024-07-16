Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6568B933272
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2024 21:51:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759785.1169466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sToBu-0004Sl-T9; Tue, 16 Jul 2024 19:50:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759785.1169466; Tue, 16 Jul 2024 19:50:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sToBu-0004Pb-QC; Tue, 16 Jul 2024 19:50:26 +0000
Received: by outflank-mailman (input) for mailman id 759785;
 Tue, 16 Jul 2024 19:50:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+WOl=OQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sToBt-0004PV-AR
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2024 19:50:25 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a28e48dc-43ac-11ef-8776-851b0ebba9a2;
 Tue, 16 Jul 2024 21:50:22 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CD11BCE13DD;
 Tue, 16 Jul 2024 19:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAAFEC116B1;
 Tue, 16 Jul 2024 19:50:15 +0000 (UTC)
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
X-Inumbo-ID: a28e48dc-43ac-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721159416;
	bh=LgdqD8kL4Y6uM3s0QcSBO95/PS0q49QRVNwLFjDF+00=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LmZZV/GpJcUiqeqR9KNvHgmhClUx6ntvFelMmY26ACxLV5NMDUpd+IKjPfJ+r5hsd
	 i3VFrOpW9bL/anmV//ULVSefExKeuyHpG2LelxD5T62/rwEgaMdlHtJ8ze3nyy3jsI
	 wghXS2Ppl85dvRvA1x6ODK0ha2wcr/hbsaa2y2lvWRIDYP9LdGF1e5aItetxHQrdIk
	 w4SDxzcqm/7nMPd+gShmVyQcEtoUeD6p04COIMzDuQdpUMbBnU+ZEe1Y+dbjuRRvz5
	 79Q+mH5iv0zOrPK5kvMXD2OYevnZHFqvxcCQdKaS4xi3cWeOkIRFzqh1yCjYqC+VWF
	 kjEEbfj9IGYEg==
Date: Tue, 16 Jul 2024 12:50:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org
Subject: Re: [ImageBuilder] Make 'bootefi' work again
In-Reply-To: <20240716084759.62152-1-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2407161249400.3635@ubuntu-linux-20-04-desktop>
References: <20240716084759.62152-1-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 16 Jul 2024, Michal Orzel wrote:
> When $BOOT_CMD is bootefi, there shall be no '-' between $kernel_addr
> and $device_tree_addr.
> 
> Fixes: 3fa89f8f9853 ("Add support for BOOT_CMD")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

I think and if/else would have been more readable but it is fine anyway.
Thanks for spotting the issue and fixing it quickly!

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
> Note: using this command would be a good opportunity for a Xen EFI boot CI test
> on Arm64 when the stub is not responsible for loading modules.
> ---
>  scripts/uboot-script-gen | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index 8b664e711b10..f8a087b881ce 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -1391,7 +1391,7 @@ fi
>  
>  if [ "$BOOT_CMD" != "none" ]
>  then
> -    echo "$BOOT_CMD $kernel_addr - $device_tree_addr" >> $UBOOT_SOURCE
> +    echo "$BOOT_CMD $kernel_addr $([ "$BOOT_CMD" = "bootefi" ] || echo '-') $device_tree_addr" >> $UBOOT_SOURCE
>  else
>      # skip boot command but store load addresses to be used later
>      echo "setenv host_kernel_addr $kernel_addr" >> $UBOOT_SOURCE
> -- 
> 2.25.1
> 

