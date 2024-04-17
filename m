Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5479F8A8DE3
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 23:27:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707768.1106016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxCnY-0001Qg-Rb; Wed, 17 Apr 2024 21:26:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707768.1106016; Wed, 17 Apr 2024 21:26:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxCnY-0001Oh-OR; Wed, 17 Apr 2024 21:26:32 +0000
Received: by outflank-mailman (input) for mailman id 707768;
 Wed, 17 Apr 2024 21:26:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rxCnW-0001Ob-Tn
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 21:26:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rxCnV-0006oB-18; Wed, 17 Apr 2024 21:26:29 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rxCnU-00072V-Rn; Wed, 17 Apr 2024 21:26:28 +0000
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
	bh=PzM6lmtxx1vfbUaXlTa45jogPT0AAuIOiUx1YiRZdDA=; b=AVvYdU/vOYY0jFZMAHSCNd8D4k
	xFIkjg9fG0GIES6eEj2HUreYTgbBfDWabiM/dO6VHKPJRDUeXiQcYFFZvb8M9m0/5rsBCCA0BIjXq
	XcptxusloE/XIPre0reVDDsgfNp/Yny/+KUk8ufGGkb608cPFKoydELrKqGFfBmnXVnI=;
Message-ID: <91a40928-2a93-4e72-94ae-1d67f85265a1@xen.org>
Date: Wed, 17 Apr 2024 22:26:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm: smmu: allow SMMU to have more IRQs than context
 banks
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20240329000822.3363568-1-volodymyr_babchuk@epam.com>
 <20240329000822.3363568-2-volodymyr_babchuk@epam.com>
 <5681b3e2-2e7f-484f-9ea8-c64e94a97dc3@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5681b3e2-2e7f-484f-9ea8-c64e94a97dc3@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 02/04/2024 08:28, Michal Orzel wrote:
> Hello,
> 
> On 29/03/2024 01:08, Volodymyr Babchuk wrote:
>>
>>
>> I encountered platform, namely Qualcomm SA8155P where SMMU-compatible
> NIT: a commit msg should be written in imperative mood
> 
>> IO-MMU advertises more context IQRs than there are context banks. This
>> should not be an issue, we need to relax the check in the SMMU driver
>> to allow such configuration.
>>
>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>> ---
>>   xen/drivers/passthrough/arm/smmu.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
>> index 32e2ff279b..2dd3688f3b 100644
>> --- a/xen/drivers/passthrough/arm/smmu.c
>> +++ b/xen/drivers/passthrough/arm/smmu.c
>> @@ -2550,7 +2550,7 @@ static int arm_smmu_device_dt_probe(struct platform_device *pdev)
>>          parse_driver_options(smmu);
>>
>>          if (smmu->version > ARM_SMMU_V1 &&
>> -           smmu->num_context_banks != smmu->num_context_irqs) {
>> +           smmu->num_context_banks > smmu->num_context_irqs) {
> This was done in Linux by commit:
> d1e20222d537 ("iommu/arm-smmu: Error out only if not enough context interrupts")
> 
> However, they also ignore superfluous interrupts. Shouldn't we do the same?

+1. It would be better to avoid allocating stating for IRQs that are 
never used.

Cheers,

-- 
Julien Grall

