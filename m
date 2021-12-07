Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAE846C35F
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 20:11:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.241759.418233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mufsB-000409-CM; Tue, 07 Dec 2021 19:11:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 241759.418233; Tue, 07 Dec 2021 19:11:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mufsB-0003yC-7g; Tue, 07 Dec 2021 19:11:31 +0000
Received: by outflank-mailman (input) for mailman id 241759;
 Tue, 07 Dec 2021 19:11:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mufs9-0003y6-F3
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 19:11:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mufs8-0000jn-Ud; Tue, 07 Dec 2021 19:11:28 +0000
Received: from [54.239.6.187] (helo=[10.95.81.235])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mufs8-00007D-Oe; Tue, 07 Dec 2021 19:11:28 +0000
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
	bh=zHH6DV0eYjfkSBT3G08YnAeelsLQglgCnFPA2flglPc=; b=H1VYOvARb0UVmpc/Y0KxSkG7dI
	J5pXw3wCRX6cq/+LskDI1z6NiC4WcPQGtYq/n4lyE3Ji8hkW2SJAd2CXiUZjH3zKdzJvKA46TkHzV
	vvx54QrE3uJUI9shhz2Tfl99nSB5GKwz3ZuB8MLYB4uXP7iRYJmmCFMKdx68iLKPkeCM=;
Message-ID: <b7a53384-39cb-f368-f39b-9b560336226b@xen.org>
Date: Tue, 7 Dec 2021 19:11:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH] xen/arm64: Zero the top 32 bits of gp registers on
 entry...
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20211206142032.27536-1-michal.orzel@arm.com>
 <f3573439-4893-440f-54e1-fdeba3eb4508@xen.org>
 <dc114877-b9da-7a5b-260d-b9438cddd777@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <dc114877-b9da-7a5b-260d-b9438cddd777@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07/12/2021 08:37, Michal Orzel wrote:
> Hi Julien,

Hi,

> On 06.12.2021 16:29, Julien Grall wrote:
>> Hi,
>>
>> On 06/12/2021 14:20, Michal Orzel wrote:
>>> to hypervisor when switching to AArch32 state.
>>>
> I will change to "from AArch32 state".
>>> According to section D1.20.2 of Arm Arm(DDI 0487A.j):
>>> "If the general-purpose register was accessible from AArch32 state the
>>> upper 32 bits either become zero, or hold the value that the same
>>> architectural register held before any AArch32 execution.
>>> The choice between these two options is IMPLEMENTATIONDEFINED"
>>
>> Typo: Missing space between IMPLEMENTATION and DEFINED.
>>
> Ok.
>>>
>>> Currently Xen does not ensure that the top 32 bits are zeroed and this
>>> needs to be fixed.
>>
>> Can you outline why this is a problem and why we need to protect? IIRC, the main concern is Xen may misinterpret what the guest requested but we are not concerned about Xen using wrong value.
>>
> I would say:
> "
> The reason why this is a problem is that there are places in Xen where we assume that top 32bits are zero for AArch32 guests.
> If they are not, this can lead to misinterpretation of Xen regarding what the guest requested.
> For example hypercalls returning an error encoded in a signed long like do_sched_op, do_hmv_op, do_memory_op would return -ENOSYS
> if the command passed as the first argument was clobbered,
> "
>>>
>>> Fix this bug by zeroing the upper 32 bits of these registers on an
>>> entry to hypervisor when switching to AArch32 state.
>>>
>>> Set default value of parameter compat of macro entry to 0 (AArch64 mode
>>> as we are on 64-bit hypervisor) to avoid checking if parameter is blank
>>> when not passed.
>>
>> Which error do you see otherwise? Is it a compilation error?
>>
> Yes, this is a compilation error. The errors appear at each line when "entry" is called without passing value for "compat".
> So basically in all the places where entry is called with hyp=1.
> When taking the current patch and removing default value for compat you will get:
> ```
> entry.S:254: Error: ".endif" without ".if"
> entry.S:258: Error: symbol `.if' is already defined
> entry.S:258: Error: ".endif" without ".if"
> entry.S:262: Error: symbol `.if' is already defined
> entry.S:262: Error: ".endif" without ".if"
> entry.S:266: Error: symbol `.if' is already defined
> entry.S:266: Error: ".endif" without ".if"
> entry.S:278: Error: symbol `.if' is already defined
> entry.S:278: Error: ".endif" without ".if"
> entry.S:292: Error: symbol `.if' is already defined
> entry.S:292: Error: ".endif" without ".if"
> entry.S:317: Error: symbol `.if' is already defined
> entry.S:317: Error: ".endif" without ".if"
> ```

Thanks for input. I am concerned with your suggested approach (or using 
.if 0\compat as suggested by Jan) because they allow the caller to not 
properly specify compat when hyp=0. The risk here is we may generate the 
wrong entry.

compat should need to be specified when hyp=1 as we will always run in 
aarch64 mode. So could we protect this code with hyp=0?

Cheers,

-- 
Julien Grall

