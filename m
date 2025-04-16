Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB164A8AD44
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 03:03:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.954773.1348744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4rBd-00077M-2H; Wed, 16 Apr 2025 01:03:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 954773.1348744; Wed, 16 Apr 2025 01:03:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4rBc-00075l-VR; Wed, 16 Apr 2025 01:03:32 +0000
Received: by outflank-mailman (input) for mailman id 954773;
 Wed, 16 Apr 2025 01:03:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RcVf=XC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u4rBc-00075f-AH
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 01:03:32 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c563d41-1a5e-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 03:03:31 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 370B35C5A96;
 Wed, 16 Apr 2025 01:01:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 750C4C4CEE7;
 Wed, 16 Apr 2025 01:03:28 +0000 (UTC)
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
X-Inumbo-ID: 9c563d41-1a5e-11f0-9eaf-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744765408;
	bh=oa4EFIK/bQVckc6BSjpg1v4c8a9K8fCod13N3MapAFw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FWWvOEeFfvBnzm6NblEB4BsFYIlamGIve4pibhVdMIpcSLq1d+/0TMOXd7tEKMK56
	 Hd7ATM/8yo7y8U2d1RuUiy9yrhvRqkYiZgU1aFUlefkNozk+lweCFkp+CO3wbvt0yu
	 KAxUMjm8zIjwp6AT81RW58zXtkwFh7SK1XML9m7vx3reFpUyZszI2Y/AsTziDqdeLk
	 OUOyYYW/mP/FRC4XVTvSUK0nuViw3hcgg4RGSqCjPfzrk25Z1Yo7zKJ+mVyb/8s2Ne
	 HqmpNe8PHKDIff7wk0BGxOgGajhvv9Hq98i4rL63kIzbo5xHeg/AaaZeAa8PXFST8c
	 30P/1gHATMq2w==
Date: Tue, 15 Apr 2025 18:03:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Grygorii Strashko <grygorii_strashko@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [ImageBuilder] uboot-script-gen: fix arm64 xen u-boot image
 generation
In-Reply-To: <20250414081223.1763630-1-grygorii_strashko@epam.com>
Message-ID: <alpine.DEB.2.22.394.2504151758170.8008@ubuntu-linux-20-04-desktop>
References: <20250414081223.1763630-1-grygorii_strashko@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 14 Apr 2025, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> The current code in generate_uboot_images() does not detect arm64 properly
> and always generates ARM u-boot image. This causes Xen boot issues.
> 
> Fix it by searching for "ARM64" for AArch64 binary detection.
> 
> - mkimage -l xen.ub
> Before:
> Image Type:   ARM Linux Kernel Image (uncompressed)
> 
> After:
> Image Type:   AArch64 Linux Kernel Image (uncompressed)
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
>  scripts/uboot-script-gen | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index a9f698f00fd1..c4d26caf5e0e 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -815,13 +815,13 @@ function linux_config()
>  
>  generate_uboot_images()
>  {
> -    local arch=$(file -L $XEN | grep "ARM")
> +    local arch=$(file -L $XEN | grep -o "ARM64")

My file -L gives:

for arm32: ARM OpenFirmware [...]
for arm64: Aarch64

So the ARM64 grep wouldn't work as intended. Is the version of `file'
that you are using really printing ARM64? If so, we can do:

  file -L $XEN | grep -E 'ARM64|Aarch64'


>      if test "$arch"
>      then
> -        arch=arm
> -    else
>          arch=arm64
> +    else
> +        arch=arm
>      fi
>  
>      mkimage -A $arch -T kernel -C none -a $memaddr -e $memaddr -d $XEN "$XEN".ub
> -- 
> 2.34.1
> 

