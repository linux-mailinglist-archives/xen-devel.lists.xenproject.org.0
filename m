Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA64FA90E11
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 23:55:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956688.1350023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Aj9-0004Ln-IZ; Wed, 16 Apr 2025 21:55:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956688.1350023; Wed, 16 Apr 2025 21:55:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Aj9-0004KP-Eo; Wed, 16 Apr 2025 21:55:27 +0000
Received: by outflank-mailman (input) for mailman id 956688;
 Wed, 16 Apr 2025 21:55:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RcVf=XC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u5Aj8-0004KJ-0O
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 21:55:26 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fe62a7d-1b0d-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 23:55:25 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8178E615E9;
 Wed, 16 Apr 2025 21:55:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B539CC4CEE2;
 Wed, 16 Apr 2025 21:55:22 +0000 (UTC)
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
X-Inumbo-ID: 7fe62a7d-1b0d-11f0-9eaf-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744840523;
	bh=x5/gR4zv99Dz0QCYoF/7aE3M128dw9QGWkUKF/b5e20=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jQD2OCxt2dLnAanbGWUSYyc5tRIpwPcMG4nwUadF18gRAwqvmqZgjZfkqPNWFlP+u
	 aCqfk+2ep3skDLHw1cx5Of7dLkWINqSc5lHTp1YSyCrSh/GKOaax9YveddWdxXl3DN
	 OgKLXV6vJfeFWAKgvvmFcQuAg3HZvK4UZ0hCwET1d5Yz1TsYuNCcRAXb6O6DKUuuTW
	 sDi+gQWT4tPGk0NfX6PDzFbqGAPPf0h54mIoM9sKJ180qWFS1XZHV4d1XhCSxUB2pM
	 4zYT3iXEowEdUKEwbgvZS65xSEeaYRcPXnGR2OPMu2UcqRLB8WMnXLyTkEb2VnQTN/
	 iOHThmIK15nnw==
Date: Wed, 16 Apr 2025 14:55:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Grygorii Strashko <grygorii_strashko@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, 
    Alejandro Vallejo <agarciav@amd.com>
Subject: Re: [ImageBuilder v2] uboot-script-gen: fix arm64 xen u-boot image
 generation
In-Reply-To: <20250416165014.2263305-1-grygorii_strashko@epam.com>
Message-ID: <alpine.DEB.2.22.394.2504161455140.8008@ubuntu-linux-20-04-desktop>
References: <20250416165014.2263305-1-grygorii_strashko@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 16 Apr 2025, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> The current code in generate_uboot_images() does not detect arm64 properly
> and always generates ARM u-boot image, because below command
>  file -L $XEN
> returns string which may contain "Aarch64" or "ARM64", and, in the later
> case, the current code will mistakenly identify Xen binary as "ARM".
> This causes Xen boot issues.
> 
> Fix it by searching for "ARM64|Aarch64" for AArch64 binary detection.
> 
> - mkimage -l xen.ub
> Before:
>  Image Type:   ARM Linux Kernel Image (uncompressed)
> 
> After:
>  Image Type:   AArch64 Linux Kernel Image (uncompressed)
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> changes in v2:
> - check for "Aarch64" in addition to "ARM64"
> 
>  scripts/uboot-script-gen | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index 527b70dfdc4b..f3ca787e557f 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -824,13 +824,13 @@ function linux_config()
>  
>  generate_uboot_images()
>  {
> -    local arch=$(file -L $XEN | grep "ARM")
> +    local arch=$(file -L $XEN | grep -E 'ARM64|Aarch64')
>  
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

