Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFAEA445B6
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 17:17:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895889.1304568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmxbR-00049b-VN; Tue, 25 Feb 2025 16:16:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895889.1304568; Tue, 25 Feb 2025 16:16:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmxbR-00046I-Si; Tue, 25 Feb 2025 16:16:13 +0000
Received: by outflank-mailman (input) for mailman id 895889;
 Tue, 25 Feb 2025 16:16:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tmxbR-00045v-6p
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 16:16:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tmxbQ-004ivK-2u;
 Tue, 25 Feb 2025 16:16:12 +0000
Received: from [2a02:8012:3a1:0:789b:6f8:a632:2adb]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tmxbQ-003pMo-1X;
 Tue, 25 Feb 2025 16:16:12 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=205qg5PVj+F29x75HkMtutcSTVPETVoXleZ9GyX+hYA=; b=ftF7zjmDDxwwR2j5SbBgpGGmET
	n+/in+DvSrs41RYJ6d+TntDq68X+fF+/01U/jzft6L+Nhxok+HNSfQqtp8+nxM6PxryNjdgfAX7w9
	YnDhjaMg/dhKKWb6zw+n+srqSkp5WQTUju/z5zySbptEjl27EqX2bv4D59dFONFJakCw=;
Message-ID: <900a0a1a-8d5f-4a85-ad48-c4809f3fd735@xen.org>
Date: Tue, 25 Feb 2025 16:16:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] xen/arm: mpu: Ensure that the page size is 4KB
 (arm32)
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250204192357.1862264-1-ayan.kumar.halder@amd.com>
 <20250204192357.1862264-2-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250204192357.1862264-2-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 04/02/2025 19:23, Ayan Kumar Halder wrote:
> Similar to "xen/arm: mpu: Define Xen start address for MPU systems", added

Can you provide the commit ID? Also, we tend to use present for 
describing changes, so s/added/add/

> a build assertion to ensure that the page size is 4KB.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
>   xen/arch/arm/arm32/Makefile     |  1 +
>   xen/arch/arm/arm32/mpu/Makefile |  1 +
>   xen/arch/arm/arm32/mpu/mm.c     | 15 +++++++++++++++
>   3 files changed, 17 insertions(+)
>   create mode 100644 xen/arch/arm/arm32/mpu/Makefile
>   create mode 100644 xen/arch/arm/arm32/mpu/mm.c
> 
> diff --git a/xen/arch/arm/arm32/Makefile b/xen/arch/arm/arm32/Makefile
> index 40a2b4803f..537969d753 100644
> --- a/xen/arch/arm/arm32/Makefile
> +++ b/xen/arch/arm/arm32/Makefile
> @@ -1,5 +1,6 @@
>   obj-y += lib/
>   obj-$(CONFIG_MMU) += mmu/
> +obj-$(CONFIG_MPU) += mpu/
>   
>   obj-$(CONFIG_EARLY_PRINTK) += debug.o
>   obj-y += domctl.o
> diff --git a/xen/arch/arm/arm32/mpu/Makefile b/xen/arch/arm/arm32/mpu/Makefile
> new file mode 100644
> index 0000000000..b18cec4836
> --- /dev/null
> +++ b/xen/arch/arm/arm32/mpu/Makefile
> @@ -0,0 +1 @@
> +obj-y += mm.o
> diff --git a/xen/arch/arm/arm32/mpu/mm.c b/xen/arch/arm/arm32/mpu/mm.c
> new file mode 100644
> index 0000000000..0b8748e575
> --- /dev/null
> +++ b/xen/arch/arm/arm32/mpu/mm.c
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/lib.h>
> +#include <xen/init.h>
> +#include <xen/sizes.h>
> +
> +static void __init __maybe_unused build_assertions(void)
> +{
> +    /*
> +     * Unlike MMU, MPU does not use pages for translation. However, we continue
> +     * to use PAGE_SIZE to denote 4KB. This is so that the existing memory
> +     * management based on pages, continue to work for now.
> +     */
> +    BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
> +}

I think it would be better if we create an arm/mpu/mm.c which would 
contain any common code/requirements between arm64 and arm32 (I assume 
there will be quire a few).

Cheers,

-- 
Julien Grall


