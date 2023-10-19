Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DAF7CF531
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 12:28:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619134.963732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtQGO-0001C1-PL; Thu, 19 Oct 2023 10:28:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619134.963732; Thu, 19 Oct 2023 10:28:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtQGO-000184-Mc; Thu, 19 Oct 2023 10:28:24 +0000
Received: by outflank-mailman (input) for mailman id 619134;
 Thu, 19 Oct 2023 10:28:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qtQGN-00016V-AF
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 10:28:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qtQGM-00044X-Ha; Thu, 19 Oct 2023 10:28:22 +0000
Received: from [15.248.3.1] (helo=[10.24.67.33])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qtQGM-0006Uy-Bw; Thu, 19 Oct 2023 10:28:22 +0000
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
	bh=BhuOIjfz1KHEnl/nQYxciTzTKK0UcfZrVMqcFSUE/ag=; b=zxwAvf682d3r5eTwWTadTkvI//
	2xJBOBOEtbehPWUCQ+jJHq4DpqF3PEdAZku1SAxiFeUCMXMNI3lYLc/i7fqfPYr5CDRKnTplDQwGB
	iG+mmY9bgXq1TSdfJrgtbfLQuIosc9FbxjTkE8ui5TXxdZ8eq+D/LMv26+RYeK86RFG4=;
Message-ID: <20958e43-2de5-455e-84f6-279887f3e3ad@xen.org>
Date: Thu, 19 Oct 2023 11:28:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 10/10] arm/smmu: address violation of MISRA C:2012
 Rule 8.2
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 Rahul Singh <Rahul.Singh@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <cover.1697207038.git.federico.serafini@bugseng.com>
 <199886f6ba1f2d5701eabd080b4f9723fc28f4b9.1697207038.git.federico.serafini@bugseng.com>
 <39d3f8e0-61cf-4b8d-84f1-a5087ba8ead4@xen.org>
 <D3320838-1E67-4339-A3D4-A3E60FBC4117@arm.com>
 <c9a7f059-4cf5-4a75-b231-573c4fe29b37@xen.org>
 <92C52E39-729F-40AE-A02F-556C8EE471CB@arm.com>
 <alpine.DEB.2.22.394.2310161338540.965337@ubuntu-linux-20-04-desktop>
 <4718460e-756a-40fe-ba1b-7f32a1432b51@xen.org>
 <alpine.DEB.2.22.394.2310171750170.965337@ubuntu-linux-20-04-desktop>
 <6d2388f4-dc05-43bc-aaf7-43ac204fdc57@xen.org>
 <alpine.DEB.2.22.394.2310181720040.965337@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2310181720040.965337@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 19/10/2023 01:21, Stefano Stabellini wrote:
> On Wed, 18 Oct 2023, Julien Grall wrote:
>> Hi Stefano,
>>
>> On 18/10/2023 01:55, Stefano Stabellini wrote:
>>> On Tue, 17 Oct 2023, Julien Grall wrote:
>>>> Hi Stefano,
>>>>
>>>> On 16/10/2023 21:47, Stefano Stabellini wrote:
>>>>> On Mon, 16 Oct 2023, Bertrand Marquis wrote:
>>>>>>> On 16 Oct 2023, at 15:38, Julien Grall <julien@xen.org> wrote:
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> On 16/10/2023 14:31, Bertrand Marquis wrote:
>>>>>>>> Hi Julien,
>>>>>>>
>>>>>>> Hi Bertrand,
>>>>>>>
>>>>>>>>> On 16 Oct 2023, at 11:07, Julien Grall <julien@xen.org> wrote:
>>>>>>>>>
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> On 13/10/2023 16:24, Federico Serafini wrote:
>>>>>>>>>> Add missing parameter names, no functional change.
>>>>>>>>>> Signed-off-by: Federico Serafini
>>>>>>>>>> <federico.serafini@bugseng.com>
>>>>>>>>>> ---
>>>>>>>>>>     xen/drivers/passthrough/arm/smmu.c | 6 +++---
>>>>>>>>>
>>>>>>>>> This file is using the Linux coding style because it is imported
>>>>>>>>> from Linux. I was under the impression we would exclude such
>>>>>>>>> file
>>>>>>>>> for now.
>>>>>>>>>
>>>>>>>>> Looking at exclude-list.json, it doesn't seem to be present. I
>>>>>>>>> think
>>>>>>>>> this patch should be replaced with adding a line in
>>>>>>>>> execlude-list.json.
>>>>>>>> I think that during one of the discussions we said that this file
>>>>>>>> already deviated quite a lot from the status in Linux and we
>>>>>>>> wanted to
>>>>>>>> turn it to Xen coding style in the future hence it is not listed
>>>>>>>> in
>>>>>>>> the exclude file.
>>>>>>> AFAIK the SMMUv{1, 2} code didn't deviate very much from Linux. I
>>>>>>> can't
>>>>>>> tell about the SMMUv3.
>>>>>>
>>>>>> True that i had the v3 code in mind, we might not want to do that for
>>>>>> v1/2
>>>>>> you are right.
>>>>>>
>>>>>>>
>>>>>>>> At the end having a working smmu might be critical in a safety
>>>>>>>> context
>>>>>>>> so it will make sense to also check this part of xen.
>>>>>>> I don't buy this argument right now. We have files in
>>>>>>> exclude-lists.json
>>>>>>> that I would consider critical for Xen to run (e.g. common/bitmap.c,
>>>>>>> common/libfdt). So if you want to use this argument then we need to
>>>>>>> move
>>>>>>> critical components of Xen out of the exclusion list.
>>>>>>
>>>>>> I am sure we will at some point for runtime code but we cannot do
>>>>>> everything on the first shot.
>>>>>> I was not meaning to do that now but that it is something to consider.
>>>>>
>>>>> Things that are in exclude-lists.json are source files that come from
>>>>> other projects and also change very rarely. The argument that we don't
>>>>> do MISRA C on the files in exclude-lists.json, it is not because those
>>>>> files are unimportant, but because they change only once every many
>>>>> years.
>>>>
>>>> Interesting. I would have thought this would be a condition to do MISRA as
>>>> the
>>>> cost to port a patch would increase a bit but this is one time cost every
>>>> many
>>>> years. Whereas code like the SMMU are still actively developped. And in
>>>> particular for SMMUv2 we tried to stick close to Linux to help backport.
>>>> So
>>>> this would be a reason to initially exclude it from MISRA.
>>>>
>>>>>
>>>>> Of course the least we rely on exclude-lists.json the better.
>>>>>
>>>>> For smmu.c, looking at the git history I think it is more actively
>>>>> worked on than other files such as lib/rbtree.c or common/bitmap.c.
>>>>> Given that backports from Linux to smmu.c are not straightforward anyway
>>>>> (please correct me if I am wrong) then I think we should not add smmu.c
>>>>> to exclude-lists.json and do MISRA for smmu.c.
>>>>
>>>> I haven't done any recently. But if they are already not straightforward,
>>>> then
>>>> adding MISRA on top is not really to make it better. So I think if you
>>>> want to
>>>> do MISRA for the SMMU, then we need to fully convert it to Xen and abandon
>>>> the
>>>> idea to backport from Linux.
>>>>
>>>> This would also make the code looks nicer as at the moment this contains
>>>> wrapper just to stay as close as possible to Linux.
>>>
>>> You have a good point. If we do MISRA for the SMMU then we might as well
>>> fully convert the file to Xen. As a clarification, we can still look at
>>> the fixes on the Linux driver and "port" security fixes and other key
>>> patches such as workarounds for broken specific SMMU versions, but for
>>> sure we wouldn't want to backport a new feature of the driver or code
>>> refactoring / code improvements of the driver. But that probably is
>>> already the case today?
>>
>> Most likely yes, some features might be useful to backport. The main one I can
>> think of is not sharing the stage-2 page-tables as there might be some issue
>> to allow the CPU to access the GICv3 ITS doorbell (so it would have to be only
>> mapped in the IOMMU page-tables).
>>
>> The other one is stage-1 support.
>>
>> Anyway, it is not clear whether we could use the same implementation as Linux.
> 
> Yeah.
> 
> In terms of next steps, what do you suggest?
> 
> Are you OK with keeping smmu.c out of exclude-list? And to go forward
> with this patch?

Federico suggested that there are hundreds of violation. I feel like we 
should convert the SMMU driver to Xen coding style, clean-it up and then 
handle any MISRA violations.

I would still be ok to accept small MISRA fix first though.

Cheers,

-- 
Julien Grall

