Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8965365910
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 14:39:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113631.216556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYpfL-0007qi-Rn; Tue, 20 Apr 2021 12:39:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113631.216556; Tue, 20 Apr 2021 12:39:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYpfL-0007qJ-Ns; Tue, 20 Apr 2021 12:39:43 +0000
Received: by outflank-mailman (input) for mailman id 113631;
 Tue, 20 Apr 2021 12:39:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lYpfK-0007qD-Kx
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 12:39:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lYpfK-0000oF-BF; Tue, 20 Apr 2021 12:39:42 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lYpfK-0006Ot-4N; Tue, 20 Apr 2021 12:39:42 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=+HWN/aKg5PvPEtWcti9+8UG77AaUSNKBQBFazb8xtq8=; b=5p7HHYTI74a/6IcoJSRdLI2xS+
	g5a7Ae6cS9nvarn+N/AWAowZc3bZxoIf1qb/qZnYyEUp1s4Vi11PTBVACGooYN5zPys3UB/44Ycub
	/Ba/Qs4BHMSocVCQuTrwBjFH44Y6Jl8FD2QYKKkhftERy1FArEHtAAEVNdDOH0t6OhZ0=;
Subject: Re: [PATCH] xen/arm: smmuv1: Revert associating the group pointer
 with the S2CR
To: Stefano Stabellini <sstabellini@kernel.org>,
 Rahul Singh <Rahul.Singh@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <d2e4ed0eaf25a6b581fdec63cd31a742f3182118.1618572178.git.rahul.singh@arm.com>
 <6e75d112-6cc1-4b7c-9751-4064b3250dbf@xen.org>
 <E2FE265F-B7A4-45C3-BA9C-3EF9109F8B5E@arm.com>
 <8569c856-8838-e5d1-b653-e7eb476dacdc@xen.org>
 <4C9CE5FC-551A-4F26-B975-FC7F33877FF2@arm.com>
 <78c30978-c3be-4357-fecc-5b2f24bf563f@xen.org>
 <348C921E-1150-4247-A693-1D81933FC3F7@arm.com>
 <996b5db1-da59-f03c-9e04-9ac283aa38f2@xen.org>
 <279F74CA-647D-458B-97C0-968E1795E494@arm.com>
 <alpine.DEB.2.21.2104190920160.4885@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <a972d85e-0791-86d0-471b-5854fc40ccd6@xen.org>
Date: Tue, 20 Apr 2021 13:39:40 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2104190920160.4885@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi,

On 19/04/2021 17:21, Stefano Stabellini wrote:
> On Mon, 19 Apr 2021, Rahul Singh wrote:
>> Hi Julien,
>>
>>> On 18 Apr 2021, at 6:48 pm, Julien Grall <julien@xen.org> wrote:
>>>
>>>
>>>
>>> On 16/04/2021 17:41, Rahul Singh wrote:
>>>> Hi Julien
>>>
>>> Hi Rahul,
>>>
>>>>> On 16 Apr 2021, at 5:08 pm, Julien Grall <julien@xen.org> wrote:
>>>>>
>>>>>
>>>>>
>>>>> On 16/04/2021 17:05, Rahul Singh wrote:
>>>>>>> On 16 Apr 2021, at 4:23 pm, Julien Grall <julien@xen.org> wrote:
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> On 16/04/2021 16:01, Rahul Singh wrote:
>>>>>>>> Hi Julien,
>>>>>>>
>>>>>>> Hi Rahul,
>>>>>>>
>>>>>>>>> On 16 Apr 2021, at 3:35 pm, Julien Grall <julien@xen.org> wrote:
>>>>>>>>>
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> On 16/04/2021 12:25, Rahul Singh wrote:
>>>>>>>>>> Revert the code that associates the group pointer with the S2CR as this
>>>>>>>>>> code causing an issue when the SMMU device has more than one master
>>>>>>>>>> device.
>>>>>>>>>
>>>>>>>>> It is not clear to me why this change was first added. Are we missing any feature when reverting it?
>>>>>>>> This feature was added when we backported the code from Linux to fix the stream match conflict issue
>>>>>>>> as part of commit "xen/arm: smmuv1: Intelligent SMR allocation”.
>>>>>>>> This is an extra feature added to allocate IOMMU group based on stream-id. If two device has the
>>>>>>>> same stream-id then we assign those devices to the same group.
>>>>>>>
>>>>>>> If we revert the patch, then it would not be possible to use the SMMU if two devices use the same stream-id. Is that correct?
>>>>>> No. If we revert the patch we can use the SMMU if two devices use the same stream-id without any issue but each device will be in a separate group.This is same behaviour before the code is merged.
>>>>>
>>>>> Ok. So there is no change in behavior. Good. Can you propose a commit message clarifying that?
>>>> Please have a look if it make sense.
>>>> xen/arm: smmuv1: Revert associating the group pointer with the S2CR
>>>> Revert the code that associates the group pointer with the S2CR as this
>>>> code causing an issue when the SMMU device has more than one master
>>>> device with same stream-id. This issue is introduced by the below commit:
>>>> “0435784cc75dcfef3b5f59c29deb1dbb84265ddb:xen/arm: smmuv1: Intelligent SMR allocation”
>>>>   Reverting the code will not impact to use of SMMU if two devices use the
>>>> same stream-id but each device will be in a separate group. This is the same
>>>> behaviour before the code is merged.
>>>
>>> Look good to me. Is this patch to be applied on top of Stefano's series? If not, is there going to be more clash?
>>>
>>
>> As per Stefano's mail he already tested his patch series on top of this patch. I think this patch has to merged before Stefano’s patch series
>> Let Stefano also confirm that.
>>
>> I think there will be no more clashes.
> 
> Yes, this patch is to be committed *before* my series and I have already
> tested this patch alone and with my series on top. Both cases work fine.

Cool. Thanks for the confirmation. I have committed the patch with the 
new commit message (although, I tweaked a little bit to use the 
abbreviated version of the commit ID).

Cheers,

-- 
Julien Grall

