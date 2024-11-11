Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8FA9C3CC2
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 12:12:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833560.1248730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tASLU-0004Iv-05; Mon, 11 Nov 2024 11:12:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833560.1248730; Mon, 11 Nov 2024 11:12:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tASLT-0004Fl-TP; Mon, 11 Nov 2024 11:12:35 +0000
Received: by outflank-mailman (input) for mailman id 833560;
 Mon, 11 Nov 2024 11:12:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tASLS-0004Ff-Jz
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 11:12:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tASLS-00022T-0O;
 Mon, 11 Nov 2024 11:12:34 +0000
Received: from [2a02:8012:3a1:0:440f:f547:9226:a08e]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tASLS-0004w6-0V;
 Mon, 11 Nov 2024 11:12:34 +0000
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
	bh=M28LHIIbvRESAmeI83QiMECTY2zkGwXqxpqo8VVTdeQ=; b=O2JigXHd77de7uC/2uCSIbOaEX
	Q5/rLEn2sPXsDRQsdpP0Z80REmHwSpDgdYim5hLbjJtSY3mLG4pbyh2TEuebkI6FircJJlnor33Xk
	bvXhNGSA0hcsdJlRdEy4icw/Sm5RxHiaGao8c3tsb7IcblW3YTJSf5bTqh7jRmr2f5dg=;
Message-ID: <80ac1e78-5259-43d2-8b18-d5bd3abdca1b@xen.org>
Date: Mon, 11 Nov 2024 11:12:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] xen/mmu: enable SMMU subsystem only in MMU
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Rahul Singh <rahul.singh@arm.com>
References: <20241108195918.856412-1-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241108195918.856412-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 08/11/2024 19:59, Ayan Kumar Halder wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> In Xen, SMMU subsystem is supported for MMU system only. The reason being SMMU
> driver uses the same page tables as MMU.
> Thus, we make it dependent on CONFIG_MMU.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@arm.com>
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
>   xen/arch/arm/Kconfig            | 2 +-
>   xen/drivers/passthrough/Kconfig | 3 ++-
>   2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 15b2e4a227..3699e148e9 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -16,7 +16,7 @@ config ARM
>   	select HAS_DEVICE_TREE
>   	select HAS_PASSTHROUGH
>   	select HAS_UBSAN
> -	select IOMMU_FORCE_PT_SHARE
> +	select IOMMU_FORCE_PT_SHARE if MMU

Realistically, everything under drivers/passthrough is MMU specific. So 
does it actually make any sense to select HAS_PASSTHROUGH right now?

>   
>   config ARCH_DEFCONFIG
>   	string
> diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kconfig
> index 78edd80536..75ad403dd3 100644
> --- a/xen/drivers/passthrough/Kconfig
> +++ b/xen/drivers/passthrough/Kconfig
> @@ -5,6 +5,7 @@ config HAS_PASSTHROUGH
>   if ARM
>   config ARM_SMMU
>   	bool "ARM SMMUv1 and v2 driver"
> +	depends on MMU
>   	default y
>   	help
>   	  Support for implementations of the ARM System MMU architecture
> @@ -15,7 +16,7 @@ config ARM_SMMU
>   
>   config ARM_SMMU_V3
>   	bool "ARM Ltd. System MMU Version 3 (SMMUv3) Support" if EXPERT
> -	depends on ARM_64 && (!ACPI || BROKEN)
> +	depends on ARM_64 && (!ACPI || BROKEN) && MMU
>   	help
>   	 Support for implementations of the ARM System MMU architecture
>   	 version 3. Driver is in experimental stage and should not be used in

Cheers,

-- 
Julien Grall


