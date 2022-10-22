Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAD7608C3D
	for <lists+xen-devel@lfdr.de>; Sat, 22 Oct 2022 13:05:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428208.678145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omCJG-0001yr-KU; Sat, 22 Oct 2022 11:04:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428208.678145; Sat, 22 Oct 2022 11:04:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omCJG-0001v2-HF; Sat, 22 Oct 2022 11:04:58 +0000
Received: by outflank-mailman (input) for mailman id 428208;
 Sat, 22 Oct 2022 11:04:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1omCJF-0001tn-9D
 for xen-devel@lists.xenproject.org; Sat, 22 Oct 2022 11:04:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omCJE-0001GC-VR; Sat, 22 Oct 2022 11:04:56 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omCJE-0008Ld-Oz; Sat, 22 Oct 2022 11:04:56 +0000
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
	bh=N7FSh7BHuRInGQ10YMDMsVppU0t5+7Kg6xMMGERbrN8=; b=pcApPJrxa3HnqkgA1OqyIVCdCC
	rgM1fiz6syhT4TlcG465gVn0nmvqpcKwd9Rryq0XTBLFKa4kCGFfG9VtMxIIDgbNrJTqquAJQ2ykr
	OQz3Hanv+qtZXN1eLJ1naoKDyNfYTIg9SMAyfresFMJxiGglcNMHcK7SVY6/FYzRASpE=;
Message-ID: <e6c5a136-15d3-831f-0d20-2cda3ec9d46b@xen.org>
Date: Sat, 22 Oct 2022 12:04:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [RFC PATCH v1 08/12] Arm: GICv3: Define ICH_AP0R<n> and
 ICH_AP1R<n> for AArch32
To: Ayan Kumar Halder <ayankuma@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com
References: <20221021153128.44226-1-ayankuma@amd.com>
 <20221021153128.44226-9-ayankuma@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221021153128.44226-9-ayankuma@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 21/10/2022 16:31, Ayan Kumar Halder wrote:
> Refer "Arm IHI 0069H ID020922",
> 12.7.1 - Interrupt Controller Hyp Active Priorities Group0 Registers 0-3
> 12.7.2 - Interrupt Controller Hyp Active Priorities Group1 Registers 0-3
> 
> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
> ---
>   xen/arch/arm/include/asm/arm32/sysregs.h | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/arm32/sysregs.h b/xen/arch/arm/include/asm/arm32/sysregs.h
> index f3b4dfbca8..693da22324 100644
> --- a/xen/arch/arm/include/asm/arm32/sysregs.h
> +++ b/xen/arch/arm/include/asm/arm32/sysregs.h

As the previous patch, the define should be declared in cpregs.h.

> @@ -117,6 +117,18 @@
>   #define ICH_LRC14_EL2              __LRC8_EL2(6)
>   #define ICH_LRC15_EL2              __LRC8_EL2(7)
>   
> +#define __AP0Rx_EL2(x)            ___CP32(p15,4,c12,c8,x)
> +#define ICH_AP0R0_EL2             __AP0Rx_EL2(0)
> +#define ICH_AP0R1_EL2             __AP0Rx_EL2(1)
> +#define ICH_AP0R2_EL2             __AP0Rx_EL2(2)
> +#define ICH_AP0R3_EL2             __AP0Rx_EL2(3)
> +
> +#define __AP1Rx_EL2(x)            ___CP32(p15,4,c12,c9,x)
> +#define ICH_AP1R0_EL2             __AP1Rx_EL2(0)
> +#define ICH_AP1R1_EL2             __AP1Rx_EL2(1)
> +#define ICH_AP1R2_EL2             __AP1Rx_EL2(2)
> +#define ICH_AP1R3_EL2             __AP1Rx_EL2(3)
> +
>   #endif /* __ASSEMBLY__ */
>   
>   #endif /* __ASM_ARM_ARM32_SYSREGS_H */

Cheers,

-- 
Julien Grall

