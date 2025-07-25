Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E16BB12377
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 20:02:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058359.1425981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufMk8-0005le-AL; Fri, 25 Jul 2025 18:02:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058359.1425981; Fri, 25 Jul 2025 18:02:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufMk8-0005jC-7R; Fri, 25 Jul 2025 18:02:04 +0000
Received: by outflank-mailman (input) for mailman id 1058359;
 Fri, 25 Jul 2025 18:02:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=swpo=2G=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ufMk7-0005j6-17
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 18:02:03 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76803d3f-6981-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 20:02:01 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 01984446EB;
 Fri, 25 Jul 2025 18:01:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9320C4CEE7;
 Fri, 25 Jul 2025 18:01:58 +0000 (UTC)
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
X-Inumbo-ID: 76803d3f-6981-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753466519;
	bh=P9KsNF3eK4kN63rlnkd0lD0jdjSxhTRMtpvr84kyd+s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qKMpPF+8gOAmCtcmtnj9ikNorJX4sxUkGo+SO3GsmeALWxBTxHN5Sfl+8VI0AIchS
	 fmD9Eev0Pk2z+udxL0auz/2ACt6tK8fHIZ+JttxAyweBgn3XP6bPRrXR0E7Gi9wge7
	 5vXs+9DDIFW+PFqNJoWz9eA/psGV6fcYb4bp3872hF+eAsw87T4Yvyeex9y3iJ1HC1
	 /zvALqVlOe3MNMJudX5CscPdqseAT9sySQOpKcDaIS1C5L7P39TfzQRYGfYujkCkqF
	 rvVxriECxiCgZrXlcW/v+YuehOt7ESSNDgmshd7krDlsZVp38jdpEGFHt+D4x3APMu
	 ZY6GakhqAUXIg==
Date: Fri, 25 Jul 2025 11:01:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] iommu: restrict stratch page quarantining to specific
 iommu drivers
In-Reply-To: <20250725161304.6723-1-stewart.hildebrand@amd.com>
Message-ID: <alpine.DEB.2.22.394.2507251101410.2578571@ubuntu-linux-20-04-desktop>
References: <20250725161304.6723-1-stewart.hildebrand@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 25 Jul 2025, Stewart Hildebrand wrote:
> Scratch page quarantining is tied to specific IOMMU implementations, not
> architectures, so tie it to AMD_IOMMU and INTEL_IOMMU instead of X86.
> 
> Fixes: dd7e55a8848c ("iommu: restrict scratch page quarantining to x86")
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/drivers/passthrough/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kconfig
> index 11aece5f7bda..b413c33a4c7a 100644
> --- a/xen/drivers/passthrough/Kconfig
> +++ b/xen/drivers/passthrough/Kconfig
> @@ -90,5 +90,5 @@ choice
>  		bool "basic"
>  	config IOMMU_QUARANTINE_SCRATCH_PAGE
>  		bool "scratch page"
> -		depends on X86
> +		depends on AMD_IOMMU || INTEL_IOMMU
>  endchoice
> 
> base-commit: 6cd9b9226c65c962b0f0e040e7d3d5c4053f8e06
> -- 
> 2.50.1
> 

