Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E736E608C3E
	for <lists+xen-devel@lfdr.de>; Sat, 22 Oct 2022 13:06:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428214.678156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omCKH-0002bt-Uw; Sat, 22 Oct 2022 11:06:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428214.678156; Sat, 22 Oct 2022 11:06:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omCKH-0002Z8-Qm; Sat, 22 Oct 2022 11:06:01 +0000
Received: by outflank-mailman (input) for mailman id 428214;
 Sat, 22 Oct 2022 11:06:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1omCKG-0002Yr-3I
 for xen-devel@lists.xenproject.org; Sat, 22 Oct 2022 11:06:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omCKF-0001HQ-OB; Sat, 22 Oct 2022 11:05:59 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omCKF-0008Nx-Ic; Sat, 22 Oct 2022 11:05:59 +0000
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
	bh=fKt7Iquz+05LK/SruQ+8oOkN3I2zKyEsbCtZLs04c6U=; b=25nnaDPotuAW1voQpPDy4Wp8vh
	EC/JX2t2e+SaS41gw8r+xyxtDUENB9UlIHsveithiW9YMfdRQOpSJ3rnXfzsbq6y22LzmoDCxB6Cy
	l+NtPfGngs/d7GPUXUZCazDD9F1XeP+bNs2zcwVHh/yYIfWW//NcDHw0sqEzQi7lfjKg=;
Message-ID: <f69393dc-7a5e-bf63-e12c-a0ac655a8573@xen.org>
Date: Sat, 22 Oct 2022 12:05:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [RFC PATCH v1 09/12] Arm: GICv3: Define GIC registers for AArch32
To: Ayan Kumar Halder <ayankuma@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com
References: <20221021153128.44226-1-ayankuma@amd.com>
 <20221021153128.44226-10-ayankuma@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221021153128.44226-10-ayankuma@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 21/10/2022 16:31, Ayan Kumar Halder wrote:
> Refer "Arm IHI 0069H ID020922"
> 12.5.23 ICC_SGI1R, Interrupt Controller Software Generated Interrupt
> Group 1 Register
> 12.5.12 ICC_HSRE, Interrupt Controller Hyp System Register Enable register
> 12.7.10 ICH_VTR, Interrupt Controller VGIC Type Register
> 12.7.5 ICH_HCR, Interrupt Controller Hyp Control Register
> 12.5.20 ICC_PMR, Interrupt Controller Interrupt Priority Mask Register
> 12.5.24 ICC_SRE, Interrupt Controller System Register Enable register
> 12.5.7 ICC_DIR, Interrupt Controller Deactivate Interrupt Register
> 12.5.9 ICC_EOIR1, Interrupt Controller End Of Interrupt Register 1
> 12.5.14 ICC_IAR1, Interrupt Controller Interrupt Acknowledge Register 1
> 12.5.5 ICC_BPR1, Interrupt Controller Binary Point Register 1
> 12.5.6 ICC_CTLR, Interrupt Controller Control Register
> 12.5.16 ICC_IGRPEN1, Interrupt Controller Interrupt Group 1 Enable register
> 12.7.9 ICH_VMCR, Interrupt Controller Virtual Machine Control Register
> 
> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
> ---
>   xen/arch/arm/include/asm/arm32/sysregs.h | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/arm32/sysregs.h b/xen/arch/arm/include/asm/arm32/sysregs.h
> index 693da22324..d2c5a115f9 100644
> --- a/xen/arch/arm/include/asm/arm32/sysregs.h
> +++ b/xen/arch/arm/include/asm/arm32/sysregs.h

Same as the previous two patches. This should be defined in cpregs.h

> @@ -129,6 +129,22 @@
>   #define ICH_AP1R2_EL2             __AP1Rx_EL2(2)
>   #define ICH_AP1R3_EL2             __AP1Rx_EL2(3)
>   
> +#define ICC_SGI1R_EL1             p15,0,c12
> +
> +#define ICC_SRE_EL2               p15,4,c12,c9,5
> +#define ICH_VTR_EL2               p15,4,c12,c11,1
> +#define ICH_HCR_EL2               p15,4,c12,c11,0
> +
> +#define ICC_PMR_EL1               p15,0,c4,c6,0
> +#define ICC_SRE_EL1               p15,0,c12,c12,5
> +#define ICC_DIR_EL1               p15,0,c12,c11,1
> +#define ICC_EOIR1_EL1             p15,0,c12,c12,1
> +#define ICC_IAR1_EL1              p15,0,c12,c12,0
> +#define ICC_BPR1_EL1              p15,0,c12,c12,3
> +#define ICC_CTLR_EL1              p15,0,c12,c12,4
> +#define ICC_IGRPEN1_EL1           p15,0,c12,c12,7
> +#define ICH_VMCR_EL2              p15,4,c12,c11,7
> +
>   #endif /* __ASSEMBLY__ */
>   
>   #endif /* __ASM_ARM_ARM32_SYSREGS_H */

Cheers,

-- 
Julien Grall

