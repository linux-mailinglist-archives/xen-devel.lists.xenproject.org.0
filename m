Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8420A3E076F
	for <lists+xen-devel@lfdr.de>; Wed,  4 Aug 2021 20:20:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163831.299971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBLTh-0002QA-QB; Wed, 04 Aug 2021 18:18:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163831.299971; Wed, 04 Aug 2021 18:18:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBLTh-0002OK-Mt; Wed, 04 Aug 2021 18:18:53 +0000
Received: by outflank-mailman (input) for mailman id 163831;
 Wed, 04 Aug 2021 18:18:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mBLTg-0002OE-AD
 for xen-devel@lists.xenproject.org; Wed, 04 Aug 2021 18:18:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mBLTe-0005IR-8e; Wed, 04 Aug 2021 18:18:50 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mBLTe-0000Bx-19; Wed, 04 Aug 2021 18:18:50 +0000
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
	bh=U1kAyWoeFNwOnLZK80ADglulvtgVacQljSkDREd6xPU=; b=obizEWZR6akkadzT8IngjHCW/C
	GNMU+3TXkyd9Lf7n5PRMIRucsfWi4skTc6PIewiGjOQYu9JB8q9v1ufR7dtLJzOtjUxBWnMYiI4WY
	HkLAqhP28VjQ/wIhrMstOfOLHv601KU2a01WdqJFcRjHj/1vuIA3+BPmcbUQKU1DIHp8=;
Subject: Re: [PATCH] do not p2m_invalidate_root when iommu_use_hap_pt
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Volodymyr_Babchuk@epam.com,
 Bertrand.Marquis@arm.com
References: <alpine.DEB.2.21.2108031419500.19737@sstabellini-ThinkPad-T480s>
 <ff5e9e5a-287d-127c-1d39-57c31564e9b3@xen.org>
 <alpine.DEB.2.21.2108031702430.19737@sstabellini-ThinkPad-T480s>
 <a2a99173-c566-c492-310c-003490cdba5f@xen.org>
 <alpine.DEB.2.21.2108041032330.9768@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <93888b4c-adb8-c40d-24a4-1d7b635a3cb5@xen.org>
Date: Wed, 4 Aug 2021 19:18:48 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2108041032330.9768@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 04/08/2021 18:41, Stefano Stabellini wrote:
> On Wed, 4 Aug 2021, Julien Grall wrote:
>> Hi Stefano,
>>
>> On 04/08/2021 01:08, Stefano Stabellini wrote:
>>>>> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
>>>>> index caf17174b8..125a9281fc 100644
>>>>> --- a/xen/arch/arm/arm64/vsysreg.c
>>>>> +++ b/xen/arch/arm/arm64/vsysreg.c
>>>>> @@ -105,6 +105,13 @@ void do_sysreg(struct cpu_user_regs *regs,
>>>>>         case HSR_SYSREG_DCISW:
>>>>>         case HSR_SYSREG_DCCSW:
>>>>>         case HSR_SYSREG_DCCISW:
>>>>> +        if ( iommu_use_hap_pt(current->domain) )
>>>>> +        {
>>>>> +            gdprintk(XENLOG_ERR,
>>>>> +                     "d%u uses set/way cache flushes with the IOMMU on.
>>>>> It
>>>>> cannot work. Replace set/way instructions with dc [ci]vac and retry.
>>>>> Injecting exception into the guest now.\n",
>>>>
>>>> This line would be far too long to print on the serial. I think you want
>>>> to
>>>> add a few newline here.
>>>
>>> Fair enough but I'll try to keep most info on the same line because
>>> otherwise with a dom0less boot it can get confusing. I suggest:
>>
>> I am not quite too sure to understand why it would get confusing with
>> dom0less. Can you give an example?
> 
> I was doing tests with the error messages before implementing the undef
> exception injection. This is the output of a regular domU (not
> dom0less): https://pastebin.com/Wytg660j
> 
> The entire message in this test should be:
> 
> (XEN) d1v0 uses set/way cache flushes with the IOMMU on. It cannot work.
> (XEN) Replace them with dc [ci]vac and retry.
> 
> But actually the first line gets eaten, so we only see:
> 
> (XEN) Replace them with dc [ci]vac and retry.
> 
> several times at the bottom of the logs.

That's most likely because you are hitting the ratelimit. However, 
writing a 80+ line is almost the wrong way to go. This making a lot more 
difficult to serial the console output...

Looking at the output, I think you can shorten to:

"The cache should be flushed by VA rather than by set/way."

At least this would make clear that using them even without the IOMMU is 
a bad idea for performance reason.

Cheers,

-- 
Julien Grall

