Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E96703A6778
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 15:10:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141460.261290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsmLq-0003NQ-Lp; Mon, 14 Jun 2021 13:10:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141460.261290; Mon, 14 Jun 2021 13:10:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsmLq-0003Jj-I9; Mon, 14 Jun 2021 13:10:02 +0000
Received: by outflank-mailman (input) for mailman id 141460;
 Mon, 14 Jun 2021 13:10:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lsmLp-00039K-D9
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 13:10:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lsmLp-0004jy-Au; Mon, 14 Jun 2021 13:10:01 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lsmLp-0003BN-3Q; Mon, 14 Jun 2021 13:10:01 +0000
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
	bh=DcXKWpWetdS7J5+taxThxsmttgI+TvgUtlFz/dUH0yM=; b=ilVF6CGnSGZnUJmJDAcLo8Kqcn
	DCxTYHkzkxx8XD2CHooKYYglgaHv8kquEXm1WVYVIeo0riIJXW8r6Q1UCB3mJlh7W0afbh02PcZA4
	2eXMmLjVoz+95/asastAQkSt8n4+0ARLpOzKEJxm4eR4eSaQAB2s8Z7a/Fst4Z868sAc=;
Subject: Re: [PATCH] Arm32: avoid .rodata to be marked as executable
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <25f1b0d2-9270-ba42-d110-2bf14e45b7b8@suse.com>
 <5b819c5e-587b-4eec-b873-73892503c3e2@xen.org>
 <4143bdfd-ca78-d7ce-4ed0-2b6271c48ecf@suse.com>
 <7a57d3df-94d0-5ee6-1ceb-bf4eddec1392@xen.org>
 <666fdb88-94c0-be05-f4d5-d755b0326dad@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <55a201ef-728e-dc59-1f9f-d269e1c5989e@xen.org>
Date: Mon, 14 Jun 2021 15:09:59 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <666fdb88-94c0-be05-f4d5-d755b0326dad@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 14/06/2021 14:02, Jan Beulich wrote:
> On 14.06.2021 12:54, Julien Grall wrote:
>> On 14/06/2021 12:40, Jan Beulich wrote:
>>> On 14.06.2021 11:57, Julien Grall wrote:
>>>> On 11/06/2021 11:19, Jan Beulich wrote:
>>>>> This confuses disassemblers, at the very least. When this data still
>>>>> lived in .init.*, this probably didn't matter much, albeit the
>>>>> "#execinstr" would have been suspicious to me already then. But the
>>>>> latest with their movement to .rodata these attributes should have been
>>>>> dropped.
>>>>
>>>> I don't quite understand why this wasn't really a problem for .init.data
>>>> but it is a problem for .rodata. Can you expand your thought?
>>>
>>> I've said "probably" for a reason, and my thinking here goes along
>>> the lines of what I've said on the other patch regarding .init.*:
>>> There's perhaps not overly much reason to be picky about the
>>> attributes of .init.*, and at least on x86 there is also a case
>>> (the EFI binary) where we fold all .init.* into just .init anyway.
>>
>> Makese sense. Thanks for the explanation.
>>
>>>
>>> The alternative to the present description that I see would be to
>>> go with just the 1st sentence. But I would be afraid in such a
>>> case that you would come back and tell me this is too little of a
>>> description.
>>
>> How about:
>>
>> "xen/arm: .proc.info doesn't need to be executable
>>
>> The section .proc.info lives in .rodata as it doesn't contain any
>> executable code. However, the section is still marked as executable as
>> the consequence .rodata will also be marked executable.
>>
>> Xen doesn't use the ELF permissions to decide the page-table mapping
>> permission. However, this will confuse disassemblers.
>>
>> #execinstr is now removed on all the pushsection dealing with .proc.info".
>>
>> I can update the commit message on commit.
> 
> I'm fine with the new commit message, but I'd prefer the title to
> remain as is, as that aspect is what did trigger me making this > change.

Sure. I will keep your commit title and update the commit message.

Cheers,


-- 
Julien Grall

