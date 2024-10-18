Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B63E89A498B
	for <lists+xen-devel@lfdr.de>; Sat, 19 Oct 2024 00:13:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822203.1236177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1vDo-0000jT-Uo; Fri, 18 Oct 2024 22:13:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822203.1236177; Fri, 18 Oct 2024 22:13:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1vDo-0000h8-S8; Fri, 18 Oct 2024 22:13:24 +0000
Received: by outflank-mailman (input) for mailman id 822203;
 Fri, 18 Oct 2024 22:13:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1t1vDn-0000h1-Qv
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 22:13:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t1vDn-0006Gy-Is; Fri, 18 Oct 2024 22:13:23 +0000
Received: from [2a02:8012:3a1:0:11d8:dae4:636f:615c]
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t1vDn-0006Rs-D4; Fri, 18 Oct 2024 22:13:23 +0000
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
	bh=PPU7dvSNOjs7OLwo4wtyElWE+iMdgBfTIKhllPqOzGU=; b=gyDE/KZgzUUsApLgTzljLn8PUI
	ELZzm29++KgT7OkKTFTKUeMk6KCHSSha2nhASFnRmwtRZBsN3G4LlHNcP65lw0pIkA4jUvmLhI3bG
	7aZWR8YfQq/qQEhJ3OK/9C7a2JYxVepx8Z4R/ahcpndkQt204LgUTtM2U0TXh+gGpoug=;
Message-ID: <870059bd-d2af-4100-88be-9f6eb4facbe9@xen.org>
Date: Fri, 18 Oct 2024 23:13:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] xen/arm: mpu: Create boot-time MPU protection
 regions
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-5-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241010140351.309922-5-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 10/10/2024 15:03, Ayan Kumar Halder wrote:
> diff --git a/xen/arch/arm/arm64/mpu/Makefile b/xen/arch/arm/arm64/mpu/Makefile
> new file mode 100644
> index 0000000000..3340058c08
> --- /dev/null
> +++ b/xen/arch/arm/arm64/mpu/Makefile
> @@ -0,0 +1 @@
> +obj-y += head.o
> diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.S
> new file mode 100644
> index 0000000000..4a21bc815c
> --- /dev/null
> +++ b/xen/arch/arm/arm64/mpu/head.S
> @@ -0,0 +1,130 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Start-of-day code for an Armv8-R MPU system.
> + */
> +
> +#include <asm/mm.h>
> +#include <asm/arm64/mpu/sysregs.h>
> +
> +#define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
> +#define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
> +#define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
> +
> +#define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1 */
> +
> +/*
> + * Macro to prepare and set a EL2 MPU memory region.
> + * We will also create an according MPU memory region entry, which
> + * is a structure of pr_t,  in table \prmap.
> + *
> + * Inputs:
> + * sel:         region selector
> + * base:        reg storing base address (should be page-aligned)
> + * limit:       reg storing limit address
> + * prbar:       store computed PRBAR_EL2 value
> + * prlar:       store computed PRLAR_EL2 value
> + * maxcount:    maximum number of EL2 regions supported
> + * attr_prbar:  PRBAR_EL2-related memory attributes. If not specified it will be
> + *              REGION_DATA_PRBAR
> + * attr_prlar:  PRLAR_EL2-related memory attributes. If not specified it will be
> + *              REGION_NORMAL_PRLAR
> + */
> +.macro prepare_xen_region, sel, base, limit, prbar, prlar, maxcount, attr_prbar=REGION_DATA_PRBAR, attr_prlar=REGION_NORMAL_PRLAR
> +
> +    /* Check if the number of regions exceeded the count specified in MPUIR_EL2 */
> +    add   \sel, \sel, #1
> +    cmp   \sel, \maxcount
> +    bgt   fail
> +
> +    /* Prepare value for PRBAR_EL2 reg and preserve it in \prbar.*/
> +    and   \base, \base, #MPU_REGION_MASK
> +    mov   \prbar, #\attr_prbar
> +    orr   \prbar, \prbar, \base
> +
> +    /* Limit address should be inclusive */
> +    sub   \limit, \limit, #1
> +    and   \limit, \limit, #MPU_REGION_MASK
> +    mov   \prlar, #\attr_prlar
> +    orr   \prlar, \prlar, \limit
> +
> +    msr   PRSELR_EL2, \sel
> +    isb
> +    msr   PRBAR_EL2, \prbar
> +    msr   PRLAR_EL2, \prlar
> +    dsb   sy
> +    isb
> +.endm
> +
> +/* Load the physical address of a symbol into xb */
> +.macro load_paddr xb, sym
> +    ldr \xb, =\sym
> +    add \xb, \xb, x20       /* x20 - Phys offset */

Sorry I didn't spot this until now. Xen will be linked to a specific 
physical address, so why do we need to add an offset?

> +.endm
> +
> +/*
> + * Maps the various sections of Xen (described in xen.lds.S) as different MPU
> + * regions.
> + *
> + * Inputs:
> + *   lr : Address to return to.
> + *
> + * Clobbers x0 - x5
> + *
> + */
> +FUNC(enable_boot_cpu_mm)
> +
> +    /* Check if the number of regions exceeded the count specified in MPUIR_EL2 */

AFAIU, this doesn't match what the instruction is doing below.

> +    mrs   x5, MPUIR_EL2
> +
> +    /* x0: region sel */
> +    mov   x0, xzr
> +    /* Xen text section. */
> +    load_paddr x1, _stext
> +    load_paddr x2, _etext
> +    cmp x1, x2
> +    beq 1f

This check seems to be excessive... I can't think of a reason why there 
would be no text at all... Same for a lot of the checks below.

> +    prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prbar=REGION_TEXT_PRBAR
> +
> +1:  /* Xen read-only data section. */
> +    load_paddr x1, _srodata
> +    load_paddr x2, _erodata
> +    cmp x1, x2
> +    beq 2f
> +    prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prbar=REGION_RO_PRBAR
> +
> +2:  /* Xen read-only after init and data section. (RW data) */
> +    load_paddr x1, __ro_after_init_start
> +    load_paddr x2, __init_begin
> +    cmp x1, x2
> +    beq 3f
> +    prepare_xen_region x0, x1, x2, x3, x4, x5
> +
> +3:  /* Xen code section. */
> +    load_paddr x1, __init_begin
> +    load_paddr x2, __init_data_begin
> +    cmp x1, x2
> +    beq 4f
> +    prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prbar=REGION_TEXT_PRBAR
> +
> +4:  /* Xen data and BSS section. */
> +    load_paddr x1, __init_data_begin
> +    load_paddr x2, __bss_end
> +    cmp x1, x2
> +    beq 5f
> +    prepare_xen_region x0, x1, x2, x3, x4, x5
> +
> +5:
> +    ret
> +
> +fail:

This name is a bit too generic given you use within a macro. Also, I 
think it should be its own local function because the macro can be used 
anywhere.

Cheers,

-- 
Julien Grall

