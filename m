Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D9861E611
	for <lists+xen-devel@lfdr.de>; Sun,  6 Nov 2022 22:02:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.438976.692882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ormmh-0002UH-AG; Sun, 06 Nov 2022 21:02:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 438976.692882; Sun, 06 Nov 2022 21:02:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ormmh-0002Ru-6d; Sun, 06 Nov 2022 21:02:27 +0000
Received: by outflank-mailman (input) for mailman id 438976;
 Sun, 06 Nov 2022 21:02:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ormmg-0002Ro-2n
 for xen-devel@lists.xenproject.org; Sun, 06 Nov 2022 21:02:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ormmf-0000kl-Qi; Sun, 06 Nov 2022 21:02:25 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ormmf-0006sa-KZ; Sun, 06 Nov 2022 21:02:25 +0000
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
	bh=6ec2LBk54MFmYYjhSdL5pisY844zpu/8f73ync2lh7A=; b=VX2gAqZDYAjI7tE4KVSc0KWu10
	o4/DTz4s1Jr3QmxdQCYLbI7QfvjST8vM2Iw0aJLmrtb/pW6RpeqTmif9QKQ1dl5hZo1c+6pqG3uz7
	NAOS4ZAbykwScXF+lKhHMnGlLmKq27E4wZndncrZP2IL0QrM9YD/Yh5BoDWgLb89hMgM=;
Message-ID: <84e476a5-9365-bb80-a8e2-86dcf09681f0@xen.org>
Date: Sun, 6 Nov 2022 21:02:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v6 11/11] xen/arm64: add setup_fixmap and
 remove_identity_mapping for MPU
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org
Cc: nd@arm.com, Penny Zheng <penny.zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
 <20221104100741.2176307-12-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221104100741.2176307-12-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 04/11/2022 10:07, Wei Chen wrote:
> From: Penny Zheng <penny.zheng@arm.com>
> 
> setup_fixmap and remove_identity_mapping are two functions that
> are used in Xen boot-time code flow. We implement these two
> functions for MPU system, in this case, the code flow in head.S
> doesn't need to use #ifdef to gate MPU/MMU code.
> 
> In MMU system, setup_fixmap is used for Xen to map some essentail
> data or devices in boot-time. For MPU system, we still have this
> requirement, we map the early UART to MPU protection region when
> earlyprintk is enabled. This also means PRINT can't be used after
> turning on MPU but before setup_fixmap. This restriction is the
> same as MMU system.
> 
> For remove_identity_mapping, we just need an empty function to
> make head.S code flow happy.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>   xen/arch/arm/arm64/head_mpu.S                 | 49 +++++++++++++++++++
>   .../arm/include/asm/platforms/fvp_baser.h     |  4 ++
>   2 files changed, 53 insertions(+)
> 
> diff --git a/xen/arch/arm/arm64/head_mpu.S b/xen/arch/arm/arm64/head_mpu.S
> index 5a1b03e293..336c0a630f 100644
> --- a/xen/arch/arm/arm64/head_mpu.S
> +++ b/xen/arch/arm/arm64/head_mpu.S
> @@ -20,13 +20,20 @@
>   /*
>    * In boot stage, we will use 1 MPU region:
>    * Region#0: Normal memory for Xen text + data + bss (2MB)
> + * Region#1: Device memory for EARLY UART, size is defined
> + *           by platform's EARLY_UART_SIZE
>    */
>   #define BOOT_NORMAL_REGION_IDX  0x0
> +#define BOOT_DEVICE_REGION_IDX  0x1
>   
>   /* MPU normal memory attributes. */
>   #define PRBAR_NORMAL_MEM        0x30    /* SH=11 AP=00 XN=00 */
>   #define PRLAR_NORMAL_MEM        0x0f    /* NS=0 ATTR=111 EN=1 */
>   
> +/* MPU device memory attributes. */
> +#define PRBAR_DEVICE_MEM        0x20    /* SH=10 AP=00 XN=00 */
> +#define PRLAR_DEVICE_MEM        0x09    /* NS=0 ATTR=100 EN=1 */
> +
>   .macro write_pr, sel, prbar, prlar
>       msr   PRSELR_EL2, \sel
>       dsb   sy
> @@ -69,6 +76,48 @@ ENTRY(prepare_early_mappings)
>       ret
>   ENDPROC(prepare_early_mappings)
>   
> +/*
> + * In MMU system, setup_fixmap is used for Xen to map some essential data
> + * or devices in boot-time. In order to be consistent with MMU system, we
> + * inherit the function name for MPU system.
> + * setup_fixmap of MPU system will:
> + * - Map the early UART to MPU protection region when earlyprintk is
> + *   enabled (The PRINT can't be used after turning on MPU but before
> + *   setup_fixmap).

For the MMU, we have this restriction because the fixmap could clash 
with the identity mapping. I don't think there are such restrictions for 
the MPU and therefore it seems strange to pertain the same behavior.

In fact, I have plan to get rid of this restriction even for the MMU. So 
better this restriction is not spread if we can.

> + *
> + * Clobbers x0 - x3
> + */
> +ENTRY(setup_fixmap)
> +#ifdef CONFIG_EARLY_PRINTK
> +    /* Map early uart to MPU device region for early printk. */
> +    mov x0, #BOOT_DEVICE_REGION_IDX
> +    ldr x1, =CONFIG_EARLY_UART_BASE_ADDRESS
> +    and x1, x1, #MPU_REGION_MASK
> +    mov x3, #PRBAR_DEVICE_MEM
> +    orr x1, x1, x3
> +
> +    ldr x2, =CONFIG_EARLY_UART_BASE_ADDRESS
> +    ldr x3, =(CONFIG_EARLY_UART_BASE_ADDRESS + EARLY_UART_SIZE - 1)
> +    add x2, x2, x3
> +    and x2, x2, #MPU_REGION_MASK
> +    mov x3, #PRLAR_DEVICE_MEM
> +    orr x2, x2, x3
> +
> +    /*
> +     * Write to MPU protection region:
> +     * x0 for pr_sel, x1 for prbar x2 for prlar
> +     */
> +    write_pr x0, x1, x2
> +#endif
> +
> +    ret
> +ENDPROC(setup_fixmap)
> +
> +/* Stub of remove_identity_mapping for MPU systems */
> +ENTRY(remove_identity_mapping)
> +    ret
> +ENDPROC(remove_identity_mapping)

This stub could be avoided if you move the call to 
remove_identity_mapping in enable_mmu() as I did for arm32. See [1].

[1] https://lore.kernel.org/all/20221022150422.17707-3-julien@xen.org/

Cheers,

-- 
Julien Grall

