Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC979A49AB
	for <lists+xen-devel@lfdr.de>; Sat, 19 Oct 2024 00:29:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822216.1236198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1vT8-00073Z-FC; Fri, 18 Oct 2024 22:29:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822216.1236198; Fri, 18 Oct 2024 22:29:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1vT8-00071I-CC; Fri, 18 Oct 2024 22:29:14 +0000
Received: by outflank-mailman (input) for mailman id 822216;
 Fri, 18 Oct 2024 22:29:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1t1vT6-0006yg-VF
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 22:29:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t1vT6-0006Wn-OI; Fri, 18 Oct 2024 22:29:12 +0000
Received: from [2a02:8012:3a1:0:11d8:dae4:636f:615c]
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t1vT6-0007gq-FE; Fri, 18 Oct 2024 22:29:12 +0000
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
	bh=iDmJTs92hkVvWmRwe3tGhEaIOKfIblBCHm/9/5i97AI=; b=HCWxvhtN9bMKb8xxAm9vU6pjCn
	/701cdmO1/QfEwu85fIzdQDFo4DtGd1Aoz28UmjKVYpj0/fn+RV2Z4qH2l5GyNEfwf/UYKwOz5Y27
	AOi5yzSa24bnzmCJX2rCdhlcSLsVSmcF2O1Cm3DzLuLNWIqPbfuXceGN+Xse1vqolc8A=;
Message-ID: <edddfb39-f166-4657-aeb7-391f8990d01b@xen.org>
Date: Fri, 18 Oct 2024 23:29:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] xen/arm: mpu: Implement a dummy
 enable_secondary_cpu_mm
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-7-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241010140351.309922-7-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 10/10/2024 15:03, Ayan Kumar Halder wrote:
> Secondary cpus initialization is not yet supported. Thus, we print an
> appropriate message and put the secondary cpus in WFE state.
> And we introduce to BUILD_BUG_ON to prevent users using from building Xen
> on multiprocessor based MPU systems.
> 
> In Arm, there is no clean way to disable SMP. As of now, we wish to support
> MPU on UNP only. So, we have defined the default range of NR_CPUs to be 1 for
> MPU.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from :-
> 
> v1 - 1. NR_CPUS is defined as 1 for MPU
> 
> 2. Added a message in enable_secondary_cpu_mm()
> 
> v2 - 1. Added the range
> 
> 2. Clarified in the commit message why/how we have disabled SMP.
> 
>   xen/arch/Kconfig              |  2 ++
>   xen/arch/arm/arm64/mpu/head.S | 10 ++++++++++
>   xen/arch/arm/setup.c          |  5 +++++
>   3 files changed, 17 insertions(+)
> 
> diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
> index 308ce129a8..6053e048fa 100644
> --- a/xen/arch/Kconfig
> +++ b/xen/arch/Kconfig
> @@ -6,11 +6,13 @@ config PHYS_ADDR_T_32
>   
>   config NR_CPUS
>   	int "Maximum number of CPUs"
> +	range 1 1 if MPU
>   	range 1 16383
>   	default "256" if X86
>   	default "8" if ARM && RCAR3
>   	default "4" if ARM && QEMU
>   	default "4" if ARM && MPSOC
> +	default "1" if ARM && MPU
>   	default "128" if ARM
>   	help
>   	  Controls the build-time size of various arrays and bitmaps
> diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.S
> index e354f4552b..4d36a8c9bc 100644
> --- a/xen/arch/arm/arm64/mpu/head.S
> +++ b/xen/arch/arm/arm64/mpu/head.S
> @@ -147,6 +147,16 @@ fail:
>       b   1b
>   END(enable_boot_cpu_mm)
>   
> +/*
> + * We don't yet support secondary CPUs bring-up. Implement a dummy helper to
> + * please the common code.
> + */
> +ENTRY(enable_secondary_cpu_mm)
> +    PRINT("- SMP not enabled yet -\r\n")
> +1:  wfe
> +    b 1b
> +ENDPROC(enable_secondary_cpu_mm)
> +
>   /*
>    * Local variables:
>    * mode: ASM
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 0203771164..5a0d343f5b 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -296,6 +296,11 @@ void asmlinkage __init start_xen(unsigned long fdt_paddr)
>       int rc, i;
>   
>   #ifdef CONFIG_MPU
> +    /*
> +     * Currently, SMP is not enabled on MPU based systems.
> +     */
> +    BUILD_BUG_ON(NR_CPUS > 1);

I think this is a odd place to add the BUILD_BUG_ON. It would better 
belong to smp.c (if not mpu/smpboot.c). Maybe in a build_assertions() 
function.

Cheers,

-- 
Julien Grall

