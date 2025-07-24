Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0E8B11100
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 20:40:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056490.1424657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf0qa-00062D-Mu; Thu, 24 Jul 2025 18:39:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056490.1424657; Thu, 24 Jul 2025 18:39:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf0qa-00060c-KJ; Thu, 24 Jul 2025 18:39:16 +0000
Received: by outflank-mailman (input) for mailman id 1056490;
 Thu, 24 Jul 2025 18:39:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+z6g=2F=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uf0qZ-00060W-GC
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 18:39:15 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7daf4420-68bd-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 20:39:14 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F359B6112C;
 Thu, 24 Jul 2025 18:39:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5562C4CEED;
 Thu, 24 Jul 2025 18:39:09 +0000 (UTC)
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
X-Inumbo-ID: 7daf4420-68bd-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753382350;
	bh=EowJdlqY4fBwR3WO/t3GihU8U2MzSuec43ZYdiZoQAY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mDpztS0y9qbfOMJVk31/+11sKEJPEVeedI7K5D3zYOtn6TvZHfBheAAjWxwhddrJu
	 AGFdogNCv26kFkjlhjbnWL+bluuZ5PiNRacxu//2Kxf/PT44wXspWJUtgLbasyyt3Z
	 GHuIxUW7mTxrZQLi3Qz4KX7Q5MwWnqbCPSBXb2JPDSN4bNIhHxAZ2ypg4YTq8B5/x8
	 5JHxCoS1+x98OnjzNtajd68oZd8uynIgIaGHpjmZYHcxSdIQqbyJhtLl1BGuL2u2X9
	 y6wTVasxQWR0TYHTWfD4jIeI37OpYhMkFjjCkA7UL1Hyf3WAonih9t6mP2dRMrLg+g
	 xkGMLWZzz9KDQ==
Date: Thu, 24 Jul 2025 11:39:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] iommu: restrict scratch page quarantining to x86
In-Reply-To: <20250724174351.3969-1-stewart.hildebrand@amd.com>
Message-ID: <alpine.DEB.2.22.394.2507241138540.2251867@ubuntu-linux-20-04-desktop>
References: <20250724174351.3969-1-stewart.hildebrand@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 24 Jul 2025, Stewart Hildebrand wrote:
> All IOMMU_QUARANTINE_* options are exposed on Arm since 163c6b589879
> ("xen/arm: pci: introduce PCI_PASSTHROUGH Kconfig option"). However,
> only NONE and BASIC are implemented in any Arm iommu driver since
> 63919fc4d1ca ("xen/arm: smmuv3: Add PCI devices support for SMMUv3") and
> ca8f6ffeb6e3 ("xen/arm: smmuv2: Add PCI devices support for SMMUv2").
> SCRATCH_PAGE is not yet implemented in any Arm iommu driver. Restrict
> scratch page quarantining to x86 for now.
> 
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Cc'ing Arm maintainers to request an Arm ack.
> ---
>  xen/drivers/passthrough/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kconfig
> index 78edd805365e..11aece5f7bda 100644
> --- a/xen/drivers/passthrough/Kconfig
> +++ b/xen/drivers/passthrough/Kconfig
> @@ -90,4 +90,5 @@ choice
>  		bool "basic"
>  	config IOMMU_QUARANTINE_SCRATCH_PAGE
>  		bool "scratch page"
> +		depends on X86
>  endchoice
> 
> base-commit: 150b773a484c911e2926f65adb576e1cdf9de7cf
> -- 
> 2.50.1
> 

