Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1694B14F08
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 16:06:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062761.1428488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugkxq-0004wA-9T; Tue, 29 Jul 2025 14:05:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062761.1428488; Tue, 29 Jul 2025 14:05:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugkxq-0004u4-6L; Tue, 29 Jul 2025 14:05:58 +0000
Received: by outflank-mailman (input) for mailman id 1062761;
 Tue, 29 Jul 2025 14:05:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ugkxp-0004ty-1G
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 14:05:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ugkxo-007Urn-1S;
 Tue, 29 Jul 2025 14:05:56 +0000
Received: from [15.248.3.91] (helo=[10.24.66.55])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ugkxo-00FrBE-0V;
 Tue, 29 Jul 2025 14:05:56 +0000
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
	bh=eSQgDTfKd7SkR11pBKMJLcwAuqCmWhzuagK7t+qi+CY=; b=DCTwpdwXmVhYuq1VA5iVYNcEEF
	o9Xx0PhROV3XgMmVy8F5H7MykFVFFHJU1W95Bx5gVp/Pi1bfQQn85Z22Zc5JQaXKMrd54WE9pSGaF
	eSkbyRROhbpSMA75nRooJV5bZW5/sF/3xIgEvKezkD6j6QMp00n82QMtZUTJk9nuJPe8=;
Message-ID: <53c63423-f8c5-4137-943a-45098ec4bb8d@xen.org>
Date: Tue, 29 Jul 2025 15:05:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] xen/arm: gicv3: modify ICH_LR_PHYSICAL_MASK to
 allow eSPI processing
Content-Language: en-GB
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1753367178.git.leonid_komarianskyi@epam.com>
 <47d77527dfb720723a83daa285aca9e72819dfc4.1753367178.git.leonid_komarianskyi@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <47d77527dfb720723a83daa285aca9e72819dfc4.1753367178.git.leonid_komarianskyi@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 24/07/2025 15:57, Leonid Komarianskyi wrote:
> To properly deactivate guest interrupts and allow them to be retriggered
> after the initial trigger, the LR needs to be updated. The current
> implementation ignores interrupts outside the range specified by the mask
> 0x3FF, which only covers IRQ numbers up to 1023. To enable processing of
> eSPI interrupts, this patch updates the mask to 0x13FF.
> 
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
> ---
>   xen/arch/arm/include/asm/gic_v3_defs.h | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/asm/gic_v3_defs.h
> index 7f769b38e3..2c02ddd287 100644
> --- a/xen/arch/arm/include/asm/gic_v3_defs.h
> +++ b/xen/arch/arm/include/asm/gic_v3_defs.h
> @@ -206,7 +206,11 @@
>   #define ICH_LR_VIRTUAL_SHIFT         0
>   #define ICH_LR_CPUID_MASK            0x7
>   #define ICH_LR_CPUID_SHIFT           10
> +#ifndef CONFIG_GICV3_ESPI
>   #define ICH_LR_PHYSICAL_MASK         0x3ff
> +#else
> +#define ICH_LR_PHYSICAL_MASK         0x13ff
> +#endif

Can't we use 0x13ff unconditionally? If not, then why is it fine to use 
it on a system where GICv3 doesn't support? (I assume distros will want 
to have it enabled).
>   #define ICH_LR_PHYSICAL_SHIFT        32
>   #define ICH_LR_STATE_MASK            0x3
>   #define ICH_LR_STATE_SHIFT           62

Cheers,

-- 
Julien Grall


