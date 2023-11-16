Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 407FA7EE2A9
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 15:22:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634296.989729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3dFE-0004Bq-WD; Thu, 16 Nov 2023 14:21:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634296.989729; Thu, 16 Nov 2023 14:21:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3dFE-00049T-TL; Thu, 16 Nov 2023 14:21:24 +0000
Received: by outflank-mailman (input) for mailman id 634296;
 Thu, 16 Nov 2023 14:21:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r3dFC-000482-Qg
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 14:21:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r3dFA-0006x4-Ls; Thu, 16 Nov 2023 14:21:20 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=[10.95.133.161]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r3dFA-0002Ph-ER; Thu, 16 Nov 2023 14:21:20 +0000
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
	bh=xkwDTNf3I3mRvmhIeuJUoD+rS+2D0VFcMremTXQULuw=; b=koa/KrD4+2JfzwLnkasX4s0w0m
	s9aHANZJCkITyph4VHIXn3AWMGYYa8oIjjm34VOMNWkOzybAGg8kjYg5/BgFAeaB5v4KCyiMaA/iz
	4Ln3wr6ng35P3FdlBj8QxA078urT0vR5Gqaz4ZLoSV2YyzsFSuGiSdd71neHMm1BVqrs=;
Message-ID: <81ec6ac0-8414-41d1-bfe3-ffa6c5750036@xen.org>
Date: Thu, 16 Nov 2023 14:21:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] xen/arm: Enlarge identity map space to 10TB
Content-Language: en-GB
To: Leo Yan <leo.yan@linaro.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Alexey Klimov <alexey.klimov@linaro.org>,
 Luca Fancellu <Luca.Fancellu@arm.com>, Michal Orzel <michal.orzel@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <Rahul.Singh@arm.com>, Henry Wang <Henry.Wang@arm.com>
References: <4B2BD200-5D3E-49D5-BF13-65B769AD4B90@arm.com>
 <CANgGJDqHu0CB=zzZqda18giLYDkL3My+gT592GLO-b9HsF2A4g@mail.gmail.com>
 <d3952200-9edb-4de0-94e3-c00c571a10b9@xen.org>
 <794B0D71-70A7-4546-98E0-EC01573E0D89@arm.com>
 <990b21a3-f8c7-4d02-a8ac-63d31794a76d@xen.org>
 <alpine.DEB.2.22.394.2310171258330.965337@ubuntu-linux-20-04-desktop>
 <4fc83e61-1e57-4f75-b017-7045842165e5@xen.org>
 <69be876f-4238-4041-a6ff-50f7f6487d5d@xen.org>
 <20231019093559.GA105208@leoy-huanghe.lan>
 <80a5c950-242b-467c-8764-8f06e19dc5d4@xen.org>
 <20231106094524.GD90848@leoy-huanghe.lan>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231106094524.GD90848@leoy-huanghe.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Leo,

On 06/11/2023 09:45, Leo Yan wrote:
> Hi Julien,
> 
> On Mon, Nov 06, 2023 at 09:39:24AM +0000, Julien Grall wrote:
> 
> [...]
> 
>>> I would like to check if here is anything specific I should follow up
>>> on. Based on the discussion in this thread, I've come to the following
>>> conclusions:
>>>
>>> - Remove the fixes tags;
>>> - Add a description in commit log, something like:
>>>     "Since commit 1c78d76b67e1 ('xen/arm64: mm: Introduce helpers to
>>>      prepare/enable/disable the identity mapping'), Xen will fail to boot
>>>      up if it's loaded in memory above 2TB. This commit fixes the
>>>      regression introduced by that commit."
>>> - Add tages:
>>>     A review tag from Michal Orzel
>>>     A review tag from Bertrand Marquis
>>>     A test tag from Henry Wang
>>>
>>> Should I repin a new patch set to address the items mentioned above?
>>
>> You will also want to update the documentation after
>> "docs/arm: Document where Xen should be loaded in
>> memory"
> 
> Will do.
> 
>>> Another question is for the 'Release-acked-by' tag.  Henry gave this
>>> tag, but I don't know how to handle it if I need to respin this patch.
>>> Seems to me this is a special tag only for release process, so I don't
>>> need to include it in the new patch, right?
>>
>> The release-acked-by tag is only necessary during freeze period if the patch
>> will land in the next release (i.e. 4.18). In this case, your patch will be
>> part of the 4.19, so you can remove the release-acked-by.
> 
> Okay, I will _not_ include release-acked-by tag in the respin.

I have done the changes and directly committed the series. So no need to 
respin.

Cheers,

-- 
Julien Grall

