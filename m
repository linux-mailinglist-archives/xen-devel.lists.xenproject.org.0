Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E5EB35A7A
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 12:55:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094314.1449640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqrKg-0000wc-DC; Tue, 26 Aug 2025 10:55:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094314.1449640; Tue, 26 Aug 2025 10:55:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqrKg-0000uS-9e; Tue, 26 Aug 2025 10:55:18 +0000
Received: by outflank-mailman (input) for mailman id 1094314;
 Tue, 26 Aug 2025 10:55:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uqrKe-0000uM-Fl
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 10:55:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uqrKd-007W4e-1r;
 Tue, 26 Aug 2025 10:55:15 +0000
Received: from [2a02:8012:3a1:0:7d60:da5a:46e8:4212]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uqrKd-0028Gv-1W;
 Tue, 26 Aug 2025 10:55:15 +0000
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
	bh=HxYW62Vfz2rbRKN2q+MD6Uq1lqfy7aaAGmdyZRzDWUE=; b=hyQecZpqdrUU3w0QqlV6kmprcs
	a+cs77jTMh7RelGeWvZSkUGJfKF4SxGsonjj1xFxs8smOU+7ypL7/21Ha+aPDWvwsulksXG7F8bA4
	YRwXICBLyM6U0SIePJ4eOKfHDuXT1ywTi4FAJ0ip1X14GtQ5DokYIUmGdoFuUbaWL8EQ=;
Message-ID: <20c20f54-565e-4f59-9b13-218e0958c46b@xen.org>
Date: Tue, 26 Aug 2025 11:55:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: smmuv3: Add cache maintenance for non-coherent
 SMMU queues
Content-Language: en-GB
To: Dmytro Firsov <Dmytro_Firsov@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <24567cc1630b1577c33939ff71d67fb2ebe5572f.1754491424.git.dmytro_firsov@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <24567cc1630b1577c33939ff71d67fb2ebe5572f.1754491424.git.dmytro_firsov@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 06/08/2025 15:58, Dmytro Firsov wrote:
> According to the Arm SMMUv3 spec (ARM IHI 0070), a system may have
> SMMU(s) that is/are non-coherent to the PE (processing element). In such
> cases, memory accesses from the PE should be either non-cached or be
> augmented with manual cache maintenance. SMMU cache coherency is reported
> by bit 4 (COHACC) of the SMMU_IDR0 register and is already present in the
> Xen driver. However, the current implementation is not aware of cache
> maintenance for memory that is shared between the PE and non-coherent
> SMMUs. It contains dmam_alloc_coherent() function, that is added during
> Linux driver porting. But it is actually a wrapper for _xzalloc(), that
> returns normal writeback memory (which is OK for coherent SMMUs).
> 
> During Xen bring-up on a system with non-coherent SMMUs, the driver did
> not work properly - the SMMU was not functional and halted initialization
> at the very beginning due to a timeout while waiting for CMD_SYNC
> completion:
> 
>    (XEN) SMMUv3: /soc/iommu@fa000000: CMD_SYNC timeout
>    (XEN) SMMUv3: /soc/iommu@fa000000: CMD_SYNC timeout
> 
> To properly handle such scenarios, add the non_coherent flag to the
> arm_smmu_queue struct. It is initialized using features reported by the
> SMMU HW and will be used for triggering cache clean/invalidate operations.
> This flag is not queue-specific (it is applicable to the whole SMMU), but
> adding it to arm_smmu_queue allows us to not change function signatures
> and simplify the patch (smmu->features, which contains the required flag,
> are not available in code parts that require cache maintenance).
> 
> Signed-off-by: Dmytro Firsov <dmytro_firsov@epam.com>


With one remark below:

Reviewed-by: Julien Grall <jgrall@amazon.com>


> diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthrough/arm/smmu-v3.h
> index f09048812c..db936b9bd4 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.h
> +++ b/xen/drivers/passthrough/arm/smmu-v3.h
> @@ -522,6 +522,13 @@ struct arm_smmu_queue {
>   
>   	u32 __iomem			*prod_reg;
>   	u32 __iomem			*cons_reg;
> +
> +	/*
> +	 * According to SMMU spec section 3.16, some systems may have
> +	 * SMMUs, that are non-coherent to PE (processing elements).
> +	 * In such case manual cache management is needed.
> +	 */

Please mention the specification version because section numbers are not 
stable. That said, I am not sure I see the value to mention the spec 
here. I think it would be sufficient to say:

"Is the memory access coherent?"


Cheers,

> +	bool				non_coherent;
>   };
>   
>   struct arm_smmu_cmdq {

-- 
Julien Grall


