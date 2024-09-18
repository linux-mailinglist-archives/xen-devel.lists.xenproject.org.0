Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E56A97BCA1
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2024 14:59:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800279.1210210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1squFn-000563-0d; Wed, 18 Sep 2024 12:57:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800279.1210210; Wed, 18 Sep 2024 12:57:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1squFm-00054X-U6; Wed, 18 Sep 2024 12:57:54 +0000
Received: by outflank-mailman (input) for mailman id 800279;
 Wed, 18 Sep 2024 12:57:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1squFl-00054R-RR
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2024 12:57:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1squFl-0003OQ-EL; Wed, 18 Sep 2024 12:57:53 +0000
Received: from [83.68.141.146] (helo=[10.134.0.208])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1squFl-0004RT-73; Wed, 18 Sep 2024 12:57:53 +0000
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
	bh=fS/6u+hGPoep8RUHAqof7I8YQuFu0BMV9dOA2nfIkys=; b=YxYETWBWW4bvTmvJB2YxASd0zA
	uheamxVmE2yn2KOZN+ME6AOCwMVJ5V2bXqGxfJiOx8FaNE1tD40WqRS+/C9bP6HgQwPMk2Ocgeyjf
	blBH7vuyH+qaLrEm31jCa/3fbs3WSvGs7sbdmhrrmcm3riXYAMSX+4rX9uRCDdFwydoE=;
Message-ID: <cea6ad56-46da-44b2-87e7-2dfacfd1a8fe@xen.org>
Date: Wed, 18 Sep 2024 14:57:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm/smmu: Complete SMR masking support
Content-Language: en-GB
To: Rahul Singh <Rahul.Singh@arm.com>, Michal Orzel <michal.orzel@amd.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240904124349.2058947-1-michal.orzel@amd.com>
 <ECEB5067-7661-457C-B13B-E8E2643FDB1E@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ECEB5067-7661-457C-B13B-E8E2643FDB1E@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,


On 12/09/2024 17:59, Rahul Singh wrote:
>> On 4 Sep 2024, at 1:43 PM, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> SMR masking support allows deriving a mask either using a 2-cell iommu
>> specifier (per master) or stream-match-mask SMMU dt property (global
>> config). Even though the mask is stored in the fwid when adding a
>> device (in arm_smmu_dt_xlate_generic()), we still set it to 0 when
>> allocating SMEs (in arm_smmu_master_alloc_smes()). So at the end, we
>> always ignore the mask when programming SMRn registers. This leads to
>> SMMU failures. Fix it by completing the support.
>>
>> A bit of history:
>> Linux support for SMR allocation was mainly done with:
>> 588888a7399d ("iommu/arm-smmu: Intelligent SMR allocation")
>> 021bb8420d44 ("iommu/arm-smmu: Wire up generic configuration support")
>>
>> Taking the mask into account in arm_smmu_master_alloc_smes() was added
>> as part of the second commit, although quite hidden in the thicket of
>> other changes. We backported only the first patch with: 0435784cc75d
>> ("xen/arm: smmuv1: Intelligent SMR allocation") but the changes to take
>> the mask into account were missed.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> Reviewed-by: Rahul Singh <rahul.singh@arm.com>

Committed.

Cheers,

-- 
Julien Grall


