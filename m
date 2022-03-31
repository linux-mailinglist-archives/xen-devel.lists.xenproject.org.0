Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA894EE272
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 22:13:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297083.505941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1na1AA-0002tR-UI; Thu, 31 Mar 2022 20:12:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297083.505941; Thu, 31 Mar 2022 20:12:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1na1AA-0002py-R9; Thu, 31 Mar 2022 20:12:58 +0000
Received: by outflank-mailman (input) for mailman id 297083;
 Thu, 31 Mar 2022 20:12:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1na1A9-0002ps-QM
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 20:12:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1na1A7-0005bc-SK; Thu, 31 Mar 2022 20:12:55 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.12.206]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1na1A7-0000Ke-MU; Thu, 31 Mar 2022 20:12:55 +0000
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
	bh=OpFVtMJCSN1ezlKcJsL3rPmuR9lCtt19nHkG0KXRWM8=; b=TvsIJEwW9TPDIt2eKKUEaVxsqG
	Rol0+dBi8BHLZBthGyBAh8cJoE5aX/D7QMvZtu8YXA1N4TKbzrxybDvS5jXxd0bnOZa3LB/Xhf4dQ
	mb1KCUVNFIz3Lc1k4gAjRykLmSwcXvNXJebOcTmVUCEpuhfOZC7j9e99oUoiO6GO6iFI=;
Message-ID: <e4b554db-5adf-91c3-476f-05721e74c069@xen.org>
Date: Thu, 31 Mar 2022 21:12:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: OS Headers hypercall.h/hypervisor.h
From: Julien Grall <julien@xen.org>
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
References: <Yj+ekdLdRa9U7dfa@mattapan.m5p.com>
 <alpine.DEB.2.22.394.2203281523230.2910984@ubuntu-linux-20-04-desktop>
 <c999faa3-ded7-64af-7bf1-f6b8e5620425@suse.com>
 <YkUAlWH6imVV9D00@mattapan.m5p.com>
 <701a0bdc-a8d3-06c3-7e40-e741dfa45361@xen.org>
In-Reply-To: <701a0bdc-a8d3-06c3-7e40-e741dfa45361@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 31/03/2022 09:44, Julien Grall wrote:
> On 31/03/2022 02:15, Elliott Mitchell wrote:
>> On Tue, Mar 29, 2022 at 08:27:24AM +0200, Jan Beulich wrote:
>>> On 29.03.2022 00:25, Stefano Stabellini wrote:
>>>> On Sat, 26 Mar 2022, Elliott Mitchell wrote:
>>>>> The hypercalls implementation for Linux and FreeBSD have two key 
>>>>> headers,
>>>>> hypercall.h and hypervisor.h.  I'm curious why the implementations for
>>>>> x86 and ARM* are so distinct.
>>>>>
>>>>> I found it fairly straightforward to implement ARM* versions of the 
>>>>> x86
>>>>> _hypercall#() macros.  Once that is done, most of the wrappers in 
>>>>> the x86
>>>>> hypercall.h can be moved to a shared hypervisor.h header.
>>>>>
>>>>> Why does Xen/ARM on Linux still have hypercall.S when merging the
>>>>> headers should reduce maintainance?
>>>>>
>>>>> Was GCC extended inline assembly language for ARM* thought too awful?
>>>>>
>>>>> I'm also curious why these headers are part of the Linux kernel, 
>>>>> instead
>>>>> of being maintained by the Xen Project?
>>>>
>>>> I would have to dig through ancient archives to give you a full answer
>>>> but the reason was that the asm inline on ARM didn't provide enough
>>>> guarantees on ordering and registers it would use and clobber.
>>>
>>> While there may be ordering issues (albeit most ought to be taken care
>>> of by marking the asm() volatile and having it have a memory clobber),
>>> registers used / clobbered ought to always be expressable by asm() -
>>> if not by constraints covering just a single register (such frequently
>>> simply don't exist), then by using register variables tied to a
>>> particular register. Of course in all of this there's an assumption of
>>> no bugs in this area in the compilers claimed as being supported ...
>>
>> I'm merely been working with recent versions of Clang on FreeBSD, but
>> I've got something which appears to work.
>>
>> I would be somewhat hopeful GCC might have fewer bugs on ARM as
>> registers aren't so precious.  Yet that could well be a minefield.
> 
> Linux and Xen have already some code heavily using inline assembly for 
> the SMCCC v1.1 helpers. So, in theory, it should be possible to convert 
> the hypercall to use inline assembly helpers.
> 
> Unlike SMCCC v1.1, the hypercalls are following the AAPCS. So by using 
> the assembly wrapper we don't have to worry on what to save as the 
> compiler will automatically know what to do. Looking at 
> xen/include/public/arch-arm.h, we may be able to reduce the numbers of 
> registers to preserve. So it would be more interesting to switch to 
> inline assembly to reduce the number of instructions.
> 
> That said, we also need to be mindful of straigh-line speculation with 
> HVC instruction. With the inline version, the speculation barrier (sb or 
> dsb/isb) would need to be architecturally executed. With the assembly 
> wrapper, I believe we could only speculatively execute it by adding 
> after the ret.

Please ignore this bit. Digging through my e-mails, I found the private 
discussion regarding this mitigation. Below what I wrote back in 2020:

"The barrier-after-RET is only here to protect against straight-line
speculation of the RET instruction. Not the SMC.

If you have a processor that will always do straight-line speculation
for both the SMC and the RET, then yes the barrier afterwards will block
further speculation.

But let's imagine you have an hypothetical processor that only do
straight-line speculation for the SMC. For the RET instruction, it will
instead decide to speculatively fetch and execute the instructions
pointed out by LR.

This means that the barrier after the RET would never get fetched or
executed speculatively. In this case, there would be no barrier to
speculate even further and reach a potential reveal gadget."

So if we need to mitigate the straight-line-speculation, we would need a 
speculation barrier right after SMC/HVC regardless the approach.

I will have a look at the header Elliott shared.

Cheers,

-- 
Julien Grall

