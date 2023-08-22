Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18430783C3C
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 10:56:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588286.919805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYNAt-0005Mp-M9; Tue, 22 Aug 2023 08:55:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588286.919805; Tue, 22 Aug 2023 08:55:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYNAt-0005Kt-JH; Tue, 22 Aug 2023 08:55:43 +0000
Received: by outflank-mailman (input) for mailman id 588286;
 Tue, 22 Aug 2023 08:55:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qYNAs-0005Kf-At
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 08:55:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYNAr-0005sH-Rk; Tue, 22 Aug 2023 08:55:41 +0000
Received: from [54.239.6.178] (helo=[192.168.0.85])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYNAr-0003m2-LY; Tue, 22 Aug 2023 08:55:41 +0000
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
	bh=WLvRjLNW1Ev/p04chmADKbh8+xMlzGMs1kVPyBEsOiU=; b=Yc78kUxDdx3T5pdYUFcgB6BCMF
	ZQnrYodBou8htAKxqkYqhVqra9l2qurc7YnU/Sxp9k5OgukZkQvf9eboQV/h4Ti32RswbQXEMCgUW
	F/26CMJrzujbv4MIV2UiMOBzJH7vVWeq1D+ZKgFI608cQO6TsRhFGkVFMxK5cKyb5aM8=;
Message-ID: <d5f06a9a-bb54-4184-93e0-78dbb3fd8800@xen.org>
Date: Tue, 22 Aug 2023 09:55:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/13] xen/arm: mmu: enable SMMU subsystem only in MMU
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Penny Zheng <Penny.Zheng@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
 <20230814042536.878720-14-Henry.Wang@arm.com>
 <67f4015f-fb63-f097-ce1b-ea6264232a1e@xen.org>
 <FA20A514-B1D2-4FBA-97F4-93981E1F0636@arm.com>
 <3413dc3c-f343-4e88-aa08-d5a0634c1ef4@xen.org>
 <AAA444BB-00F4-44D6-A8E1-5C84A4EB8092@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AAA444BB-00F4-44D6-A8E1-5C84A4EB8092@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 22/08/2023 09:48, Henry Wang wrote:
> Hi Julien,
> 
>> On Aug 22, 2023, at 16:18, Julien Grall <julien@xen.org> wrote:
>>
>> On 22/08/2023 03:11, Henry Wang wrote:
>>> Hi Julien,
>>
>> Hi,
>>
>>>> On Aug 22, 2023, at 05:34, Julien Grall <julien@xen.org> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On 14/08/2023 05:25, Henry Wang wrote:
>>>>> From: Penny Zheng <Penny.Zheng@arm.com>
>>>>> SMMU subsystem is only supported in MMU system, so we make it dependent
>>>>> on CONFIG_HAS_MMU.
>>>>
>>>> "only supported" as in it doesn't work with Xen or the HW is not supporting it?
>>> I think currently there are no hardware combination of MPU + SMMU, but
>>> theoretically I think this is a valid combination since SMMU supports the linear
>>> mapping. So would below reword looks good to you:
>>> “Currently the hardware use case of connecting SMMU to MPU system is rarely
>>> seen, so we make CONFIG_ARM_SMMU and CONFIG_ARM_SMMU_V3
>>> dependent on CONFIG_MMU."
>>
>> I read this as there might be MPU system with SMMU in development. What you want to explain is why we can't let the developper to select the SMMU driver on an MPU system.
>>
>>  From my understanding this is because the drivers are expecting to use the page-tables and the concept doesn't exist in the MPU system. So the drivers are not ready for the MPU.
> 
> I agree.
> 
>>
>>>>
>>>> Also, I am not entirely convinced that anything in passthrough would properly work with MPU. At least none of the IOMMU drivers are. So I would consider to completely disable HAS_PASSTHROUGH.
>>> I agree, do you think adding below addition diff to this patch makes sense to you?
>>
>> I think it should be a replacement because none of the IOMMU drivers works for the MPU. So I would rather prefer if we avoid adding "depends on" on all of them (even if there are only 3) for now.
> 
> I am a bit confused, I read your above explanation to the commit message as you
> agree with the idea that making SMMU driver not selectable by MPU system. 

No. I would rather prefer if HAS_PASSTHROUGH is completely disabled 
because I doubt the IOMMU infrastructure will work without any change 
for the MPU.

So it sounds incorrect to enable HAS_PASSTHROUGH until one of you 
confirm it works.

Cheers,

-- 
Julien Grall

