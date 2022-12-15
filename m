Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF79B64DA70
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 12:34:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463298.721466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5mVZ-0005s8-D0; Thu, 15 Dec 2022 11:34:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463298.721466; Thu, 15 Dec 2022 11:34:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5mVZ-0005oY-9s; Thu, 15 Dec 2022 11:34:37 +0000
Received: by outflank-mailman (input) for mailman id 463298;
 Thu, 15 Dec 2022 11:34:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p5mVY-0005oS-8d
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 11:34:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5mVY-0000T2-0C; Thu, 15 Dec 2022 11:34:36 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224] helo=[10.85.36.201])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5mVX-0007W1-Qs; Thu, 15 Dec 2022 11:34:35 +0000
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
	bh=QVKXA/3pokrugzyZhClqiiT6TCEK+2Lp3zg1BgPAwMI=; b=H136cReGI6ew59DcQjRpVekiBE
	wySlXj6EStrC+CgLOZ5Iigg6yTL7UZlSCyyeFZt9ZEP4g6VQF5voWjnNajIJpo02UdeS/uneCYnYF
	KI989RUDYXBXoeETqypLghlS6K0w8Um0F65/9xuyHQD0ZqTqFnAtXha/scAYWGn0Aw9s=;
Message-ID: <423b32d1-90f1-2a0c-865c-24030a7dcdba@xen.org>
Date: Thu, 15 Dec 2022 11:34:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v2] xen/arm: smmuv3: mark arm_smmu_disable_pasid
 __maybe_unused
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221213181855.81713-1-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221213181855.81713-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stewart,

I was about to commit this patch when I noticed the placement of the 
attribute doesn't match what we are usually doing in Xen.

On 13/12/2022 18:18, Stewart Hildebrand wrote:
> When building with clang 12 and CONFIG_ARM_SMMU_V3=y, we observe the
> following build error:
> 
> drivers/passthrough/arm/smmu-v3.c:1408:20: error: unused function 'arm_smmu_disable_pasid' [-Werror,-Wunused-function]
> static inline void arm_smmu_disable_pasid(struct arm_smmu_master *master) { }
>                     ^
> 
> arm_smmu_disable_pasid is not currently called from anywhere in Xen, but
> it is inside a section of code guarded by CONFIG_PCI_ATS, which may be
> helpful in the future if the PASID feature is to be implemented. Add the
> attribute __maybe_unused to the function.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> v1->v2:
> Add __maybe_unused attribute instead of removing
> ---
>   xen/drivers/passthrough/arm/smmu-v3.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index 9c9f4630090e..0cdc862f96d1 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -1376,6 +1376,7 @@ static int arm_smmu_enable_pasid(struct arm_smmu_master *master)
>   	return 0;
>   }
>   
> +__maybe_unused
>   static void arm_smmu_disable_pasid(struct arm_smmu_master *master)

The attribute should be placed after "void". I.e.:

static void __maybe_unused arm_smmu_disable_pasid(...)

>   {
>   	struct pci_dev *pdev;
> @@ -1405,6 +1406,7 @@ static inline int arm_smmu_enable_pasid(struct arm_smmu_master *master)
>   	return 0;
>   }
>   
> +__maybe_unused
>   static inline void arm_smmu_disable_pasid(struct arm_smmu_master *master) { }

Same here.

>   #endif /* CONFIG_PCI_ATS */
>   

Cheers,

-- 
Julien Grall

