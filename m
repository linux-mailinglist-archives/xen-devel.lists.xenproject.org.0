Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDF19B92F9
	for <lists+xen-devel@lfdr.de>; Fri,  1 Nov 2024 15:20:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829176.1244265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6sV6-0006t8-0N; Fri, 01 Nov 2024 14:19:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829176.1244265; Fri, 01 Nov 2024 14:19:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6sV5-0006qL-Tx; Fri, 01 Nov 2024 14:19:43 +0000
Received: by outflank-mailman (input) for mailman id 829176;
 Fri, 01 Nov 2024 14:19:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1t6sV4-0006qF-FN
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2024 14:19:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1t6sV3-00F3SP-39;
 Fri, 01 Nov 2024 14:19:41 +0000
Received: from [2a02:8012:3a1:0:4ddd:1dd:c52d:25b6]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1t6sV3-009ew1-2A;
 Fri, 01 Nov 2024 14:19:41 +0000
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
	bh=QKIE9JKptbFwWr2f6jpXXtj+vwpLsiRRrCo9Wq+nIQs=; b=K4tprVUWysvzzIitvbMEkUZ1xH
	lDzuyJTdrMQJdVuqO+DlmGamh6hyxhJqszUhpjpLX6TTmbYpP97mLPEWCEIOg3VXSmnh90zKcTy6s
	/VkO4R4qikKyp/gVvJQoxBAxL4YrlKKVS0uIW1tZn1gMDsuV2Gi+Yejjttx35Gq2H+w4=;
Message-ID: <562d89b7-5a71-4013-a590-7686451185d7@xen.org>
Date: Fri, 1 Nov 2024 14:19:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] xen/arm: mpu: Enable MPU
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241028124547.1371867-1-ayan.kumar.halder@amd.com>
 <20241028124547.1371867-6-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241028124547.1371867-6-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 28/10/2024 12:45, Ayan Kumar Halder wrote:
> After the regions have been created, now we enable the MPU. For this we disable
> the background region so that the new memory map created for the regions take
> effect. Also, we treat all RW regions as non executable and the data cache is
> enabled.
> 
> As enable_mpu() is invoked from enable_boot_cpu_mm(), one needs to save and
> restore the lr.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from :-
> 
> v2 - 1. Extracted from the previous patch into a new one.
> 
> 2. Disabled background region.
> 
> v3 - 1. Removed dsb before setting SCTLR_EL2. The reason being
>  From ARM DDI 0487K.a D23-7349:
> "Direct writes to these registers (includes SCTLR_EL2) are not allowed to affect
> any instructions appearing in program order before the direct write."
> So, we don't need a synchronization barrier before writing to SCTLR_EL2.
> Further, we do have synchronization barriers after writing the MPU region
> registers (which happens before we read SCTLR_EL2). So, SCTLR_EL2 is written
> after the MPU registers are synchronized. And, thus adding a 'isb' to flush the
> instruction pipeline ensures that the subsequent instructions are fetched after
> the MPU has been enabled.
> 
> 2. Saved and restored lr in enable_boot_cpu_mm().
> 
>   xen/arch/arm/arm64/mpu/head.S                | 30 ++++++++++++++++++--
>   xen/arch/arm/include/asm/arm64/mpu/sysregs.h |  3 ++
>   2 files changed, 31 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.S
> index 9377ae778c..0edadb009c 100644
> --- a/xen/arch/arm/arm64/mpu/head.S
> +++ b/xen/arch/arm/arm64/mpu/head.S
> @@ -68,6 +68,29 @@ FUNC_LOCAL(fail_insufficient_regions)
>       b   1b
>   END(fail_insufficient_regions)
>   
> +/*
> + * Enable EL2 MPU and data cache
> + * If the Background region is enabled, then the MPU uses the default memory
> + * map as the Background region for generating the memory
> + * attributes when MPU is disabled.
> + * Since the default memory map of the Armv8-R AArch64 architecture is
> + * IMPLEMENTATION DEFINED, we intend to turn off the Background region here.
> + *
> + * Clobbers x0
> + *
> + */
> +FUNC_LOCAL(enable_mpu)
> +    mrs   x0, SCTLR_EL2
> +    bic   x0, x0, #SCTLR_ELx_BR       /* Disable Background region */
> +    orr   x0, x0, #SCTLR_Axx_ELx_M    /* Enable MPU */
> +    orr   x0, x0, #SCTLR_Axx_ELx_C    /* Enable D-cache */
> +    orr   x0, x0, #SCTLR_Axx_ELx_WXN  /* Enable WXN */
> +    msr   SCTLR_EL2, x0
> +    isb
> +
> +    ret
> +END(enable_mpu)
> +
>   /*
>    * Maps the various sections of Xen (described in xen.lds.S) as different MPU
>    * regions.
> @@ -75,10 +98,11 @@ END(fail_insufficient_regions)
>    * Inputs:
>    *   lr : Address to return to.
>    *
> - * Clobbers x0 - x5
> + * Clobbers x0 - x6
>    *
>    */
>   FUNC(enable_boot_cpu_mm)
> +    mov   x6, lr
>   
>       /* Get the number of regions specified in MPUIR_EL2 */
>       mrs   x5, MPUIR_EL2
> @@ -110,8 +134,10 @@ FUNC(enable_boot_cpu_mm)
>       ldr   x2, =__bss_end
>       prepare_xen_region x0, x1, x2, x3, x4, x5
>   
> -    ret
> +    bl    enable_mpu
>   
> +    mov   lr, x6
> +    ret

You should not need to save/restore 'lr'. You could write:

b enable_mpu

So when enable_mpu returns, it will go back to the caller of 
enable_boot_cpu_mm.

With that fixed:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


