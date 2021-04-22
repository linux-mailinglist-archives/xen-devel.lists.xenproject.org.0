Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3ED36819A
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 15:41:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115442.220250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZZZY-0005by-LL; Thu, 22 Apr 2021 13:40:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115442.220250; Thu, 22 Apr 2021 13:40:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZZZY-0005bZ-IG; Thu, 22 Apr 2021 13:40:48 +0000
Received: by outflank-mailman (input) for mailman id 115442;
 Thu, 22 Apr 2021 13:40:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lZZZX-0005bU-0R
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 13:40:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lZZZV-00074C-4N; Thu, 22 Apr 2021 13:40:45 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lZZZU-0003U8-Tk; Thu, 22 Apr 2021 13:40:45 +0000
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
	bh=/aejB0fMAcbFr89tZQfSu7T8ZcXyuAvoxbycHUvkcNI=; b=BvE68gbhCtRJlmwTkVePk6sMSM
	mWnqnld/ou9fKGD9GjlnXhhrJ5vXa5LSJ6ZW6KchKwij1IRVNVnwR4obJvnYpmj9fO/lbb6mXPUa/
	0s1/pwWXniIOj1sVXLo25GzJ2ytOlq2/xS+sVOQmpFo9uqqYPR5MWLpO2hIzF0xbHhYU=;
Subject: Re: [PATCH 5/9] arm/mm: Get rid of READ/WRITE_SYSREG32
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com
References: <20210420070853.8918-1-michal.orzel@arm.com>
 <20210420070853.8918-6-michal.orzel@arm.com>
 <32bfa7d7-33cb-0deb-32bb-fa7d2052e0d9@xen.org>
 <3cee323f-7273-094f-150f-8f790a347d87@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e2220e10-fcac-af61-f2ce-dbf514a02e9e@xen.org>
Date: Thu, 22 Apr 2021 14:40:43 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <3cee323f-7273-094f-150f-8f790a347d87@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 22/04/2021 12:47, Michal Orzel wrote:
> Hi Julien,

Hi Michal,

> On 20.04.2021 15:37, Julien Grall wrote:
>> Hi Michal,
>>
>> On 20/04/2021 08:08, Michal Orzel wrote:
>>> AArch64 system registers are 64bit whereas AArch32 ones
>>> are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
>>> we should get rid of helpers READ/WRITE_SYSREG32
>>> in favour of using READ/WRITE_SYSREG.
>>> We should also use register_t type when reading sysregs
>>> which can correspond to uint64_t or uint32_t.
>>> Even though many AArch64 sysregs have upper 32bit reserved
>>> it does not mean that they can't be widen in the future.
>>>
>>> Modify SCTLR_EL2 accesses to use READ/WRITE_SYSREG.
>>
>> SCTLR_EL2 already has bits defined in the range [32:63]. So this change is going to have a side effect as AFAICT head.S will not touch those bits. So they are now going to be preserved.
>>
>> The Arm Arm defines them as unknown if implemented. Therefore shouldn't we zero them somewhere else?
>>
> SCTLR_EL2 is set in head.S using SCTLR_EL2_SET which means that we are zeroing the upper 32bit half.

Ah! I couldn't find the place doing it. Thanks!

I think it is important to point in the commit message this is just a 
latent bug because the top 32-bit was not used by Xen. Can you update 
the commit message?

Cheers,

-- 
Julien Grall

