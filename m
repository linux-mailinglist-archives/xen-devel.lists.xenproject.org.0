Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A277CBFE2
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 11:49:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618176.961510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsghV-0005KA-3e; Tue, 17 Oct 2023 09:49:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618176.961510; Tue, 17 Oct 2023 09:49:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsghV-0005HR-0Z; Tue, 17 Oct 2023 09:49:21 +0000
Received: by outflank-mailman (input) for mailman id 618176;
 Tue, 17 Oct 2023 09:49:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qsghU-0005H2-01
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 09:49:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qsghS-0008Ja-Va; Tue, 17 Oct 2023 09:49:18 +0000
Received: from [15.248.2.61] (helo=[10.24.67.33])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qsghS-00063b-N5; Tue, 17 Oct 2023 09:49:18 +0000
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
	bh=s+P7xKyTCd6MOyIHvM1R+bIEZkseXh6KQGGqVM7f9ls=; b=zXkVf2Xs1qEdLkvej8qxc4ojt6
	43934mULQY83CI1O8K4ZgkQh0T/Yt+OtLY5zbXRHYlAhfjlltRARWvNIcR92XUfWmVJLRgwlAAOo+
	FFY18C+RjSWgM0NgY+YRG3O4KAKEwvsG2kwEtub8/cC9dqnOEEd4lHWzGrP/6Ddg5WGw=;
Message-ID: <4718460e-756a-40fe-ba1b-7f32a1432b51@xen.org>
Date: Tue, 17 Oct 2023 10:49:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 10/10] arm/smmu: address violation of MISRA C:2012
 Rule 8.2
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2310161338540.965337@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 16/10/2023 21:47, Stefano Stabellini wrote:
> On Mon, 16 Oct 2023, Bertrand Marquis wrote:
>>> On 16 Oct 2023, at 15:38, Julien Grall <julien@xen.org> wrote:
>>>
>>>
>>>
>>> On 16/10/2023 14:31, Bertrand Marquis wrote:
>>>> Hi Julien,
>>>
>>> Hi Bertrand,
>>>
>>>>> On 16 Oct 2023, at 11:07, Julien Grall <julien@xen.org> wrote:
>>>>>
>>>>> Hi,
>>>>>
>>>>> On 13/10/2023 16:24, Federico Serafini wrote:
>>>>>> Add missing parameter names, no functional change.
>>>>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>>>>> ---
>>>>>>   xen/drivers/passthrough/arm/smmu.c | 6 +++---
>>>>>
>>>>> This file is using the Linux coding style because it is imported from Linux. I was under the impression we would exclude such file for now.
>>>>>
>>>>> Looking at exclude-list.json, it doesn't seem to be present. I think this patch should be replaced with adding a line in execlude-list.json.
>>>> I think that during one of the discussions we said that this file already deviated quite a lot from the status in Linux and we wanted to turn it to Xen coding style in the future hence it is not listed in the exclude file.
>>> AFAIK the SMMUv{1, 2} code didn't deviate very much from Linux. I can't tell about the SMMUv3.
>>
>> True that i had the v3 code in mind, we might not want to do that for v1/2 you are right.
>>
>>>
>>>> At the end having a working smmu might be critical in a safety context so it will make sense to also check this part of xen.
>>> I don't buy this argument right now. We have files in exclude-lists.json that I would consider critical for Xen to run (e.g. common/bitmap.c, common/libfdt). So if you want to use this argument then we need to move critical components of Xen out of the exclusion list.
>>
>> I am sure we will at some point for runtime code but we cannot do everything on the first shot.
>> I was not meaning to do that now but that it is something to consider.
> 
> Things that are in exclude-lists.json are source files that come from
> other projects and also change very rarely. The argument that we don't
> do MISRA C on the files in exclude-lists.json, it is not because those
> files are unimportant, but because they change only once every many
> years.

Interesting. I would have thought this would be a condition to do MISRA 
as the cost to port a patch would increase a bit but this is one time 
cost every many years. Whereas code like the SMMU are still actively 
developped. And in particular for SMMUv2 we tried to stick close to 
Linux to help backport. So this would be a reason to initially exclude 
it from MISRA.

> 
> Of course the least we rely on exclude-lists.json the better.
> 
> For smmu.c, looking at the git history I think it is more actively
> worked on than other files such as lib/rbtree.c or common/bitmap.c.
> Given that backports from Linux to smmu.c are not straightforward anyway
> (please correct me if I am wrong) then I think we should not add smmu.c
> to exclude-lists.json and do MISRA for smmu.c.

I haven't done any recently. But if they are already not 
straightforward, then adding MISRA on top is not really to make it 
better. So I think if you want to do MISRA for the SMMU, then we need to 
fully convert it to Xen and abandon the idea to backport from Linux.

This would also make the code looks nicer as at the moment this contains 
wrapper just to stay as close as possible to Linux.

As a side note, the change here looks fairly self-contained. So I don't 
expect a major impact and therefore would not block this. This may not 
be the case for more complex one. Hence why I wanted to exclude it.

Do you expect larger MISRA changes in the SMMU driver?

Cheers,

-- 
Julien Grall

