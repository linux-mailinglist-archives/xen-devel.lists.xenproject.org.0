Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF037CE5F2
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 20:11:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618765.962833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtB0o-0008G2-CR; Wed, 18 Oct 2023 18:11:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618765.962833; Wed, 18 Oct 2023 18:11:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtB0o-0008E0-9a; Wed, 18 Oct 2023 18:11:18 +0000
Received: by outflank-mailman (input) for mailman id 618765;
 Wed, 18 Oct 2023 18:11:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qtB0m-0008Du-IH
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 18:11:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qtB0j-0005sN-Ox; Wed, 18 Oct 2023 18:11:13 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.7.230]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qtB0j-0006xY-If; Wed, 18 Oct 2023 18:11:13 +0000
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
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=3gU3GwLuDWBLYD6oKyWsahGu1lRW4AqzProvHk6L6Ns=; b=1oK/abdMZJIq05B3LrtCLKHNjZ
	1PeBpOcohFzRTR7ZyDRaiFh3e0fRMQgPoDciRk40bXwvTSFonB2QcIHVRJt/ZC9/zCCZHN99aco0/
	FHALRaUv6BhFevgPXAJGgjnO+pRAXuRbxZ1zgbvGJl2UBPWG7YjXF7noiRG02YBehTBo=;
Message-ID: <69be876f-4238-4041-a6ff-50f7f6487d5d@xen.org>
Date: Wed, 18 Oct 2023 19:11:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] xen/arm: Enlarge identity map space to 10TB
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Alexey Klimov <alexey.klimov@linaro.org>,
 Luca Fancellu <Luca.Fancellu@arm.com>, Michal Orzel <michal.orzel@amd.com>,
 "leo.yan@linaro.org" <leo.yan@linaro.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <Rahul.Singh@arm.com>, Henry Wang <Henry.Wang@arm.com>
References: <20231013122658.1270506-1-leo.yan@linaro.org>
 <20231013122658.1270506-3-leo.yan@linaro.org>
 <169101f8-0475-45b1-b2c2-60dadd88d3f0@amd.com>
 <5a5e960b-e6fd-4617-b33a-10cf07f5bb52@xen.org>
 <8BCB97B4-CBDD-43D9-B0F8-7F637B8BE559@arm.com>
 <4B2BD200-5D3E-49D5-BF13-65B769AD4B90@arm.com>
 <CANgGJDqHu0CB=zzZqda18giLYDkL3My+gT592GLO-b9HsF2A4g@mail.gmail.com>
 <d3952200-9edb-4de0-94e3-c00c571a10b9@xen.org>
 <794B0D71-70A7-4546-98E0-EC01573E0D89@arm.com>
 <990b21a3-f8c7-4d02-a8ac-63d31794a76d@xen.org>
 <alpine.DEB.2.22.394.2310171258330.965337@ubuntu-linux-20-04-desktop>
 <4fc83e61-1e57-4f75-b017-7045842165e5@xen.org>
In-Reply-To: <4fc83e61-1e57-4f75-b017-7045842165e5@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 18/10/2023 11:59, Julien Grall wrote:
> On 17/10/2023 20:58, Stefano Stabellini wrote:
>>> And therefore a Fixes tag is sensible. This doesn't mean I would want to
>>> backport it right now (note that only 4.18 is affected). But this 
>>> could change
>>> in the future if we get another report (post-4.18) on a platform 
>>> where there
>>> are no other workaround.
>>>
>>> Stefano any opinions?
>>
>> The Fixes tag carries useful information but the problem is that it is
>> typically used for identifying backports and this is not a backport (at
>> least today we would not consider it a backport).
> 
> Below the definition of Fixes tag (from  process/sending-patches.pandoc):
> 
> If your patch fixes a bug in a specific commit, e.g. you found an issue 
> using ``git bisect``, please use the `Fixes:` tag with the first 12 
> characters of the commit id, and the one line summary.
> 
> This doesn't say anything about backport. In fact, we introduced a 
> separate tag for that (see Backport).
> 
>>
>> So I would provide the same information but without using the Fixes tag.
>> For instance: "This commit fixes an issue that was introduced by XXX
>> because of YYY and only affects the AVA platform with not up-to-date
>> firmware".
> 
> The part after 'and' is misleading. So far we had a report only on AVA 
> platform but this doesn't mean it couldn't happen on other HW. The same 
> is true with the new limit.
> 
> So this wants to be:
> 
> "and so far we only had a report for the AVA platform when using UEFI 
> older than vX."
> 
>>
>> That way, we avoid the risk of someone taking all the applicable commits
>> with a Fixes tag and backporting them without thinking twice about it.
>> But we still have the information in the git log.
> 
> I don't really see the problem for someone to mistakenly backport this 
> patch. In fact, this could potentially save them a lot of debugging if 
> it happens that Xen is loaded above 2TB.
> 
> Anyway, both Bertrand and you seems to be against the Fixes tag here. So 
> I can compromise with the "This commit fixes...". However, can Bertrand 
> or you update process/send-patches.pandoc so it is clear for a 
> contributor when they should add Fixes tag (which BTW I still disagree 
> with but if the majority agrees, then I will not nack)?

We had a chat about this during the Arm maintainer calls. The 
disagreement boiled down to the fact that SUPPORT.md (or the 
documentation) doesn't say anything about whether loading Xen above 2TB 
was supported or not. Depending on the view, one could consider a bug or 
not.

Looking through the documentation, the best place to document might 
actually be misc/arm/booting.txt where we already have some requirements 
to boot Xen (such the binary must be entered in NS EL2 mode).

I will prepare a patch and send one.

Cheers,

-- 
Julien Grall

