Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5D463F63C
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 18:37:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451091.708696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0nUs-0001sQ-SI; Thu, 01 Dec 2022 17:37:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451091.708696; Thu, 01 Dec 2022 17:37:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0nUs-0001pc-P9; Thu, 01 Dec 2022 17:37:18 +0000
Received: by outflank-mailman (input) for mailman id 451091;
 Thu, 01 Dec 2022 17:37:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p0nUr-0001pW-TI
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 17:37:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p0nUq-0007Va-QK; Thu, 01 Dec 2022 17:37:16 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[192.168.7.195]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p0nUq-0007h9-I9; Thu, 01 Dec 2022 17:37:16 +0000
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
	bh=SIo5dOEqUCg1DV062ZvSliOIBMNEE6M/Oz8SxD4QREk=; b=JlLZ8WHGTaEdSaQjWdX1Rh17C8
	DzMdikh7HTDLrEaHPQQLyf8aBl3XlIeojhadQwbtADFGZdZVHgQi/HexqylNFRzUrH11XOul+UC2N
	XdKrd7qA4qf66xIUTUG8pFMoT/nkONg42UmQAQWGiSEt63/CObj4+PgC5x4cUDSWg+cc=;
Message-ID: <59a9a45f-b4c2-2801-b8e4-2fb21b2af745@xen.org>
Date: Thu, 1 Dec 2022 17:37:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [XEN v1] Xen: Enable compilation when PADDR_BITS == BITS_PER_LONG
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, jbeulich@suse.com, bobbyeshleman@gmail.com,
 alistair.francis@wdc.com, connojdavis@gmail.com, wl@xen.org
References: <20221201100309.2385-1-ayan.kumar.halder@amd.com>
 <c89992bb-065b-e7e4-3f5f-1c70754e4635@xen.org>
 <f44a10ff-06a4-c2e9-930d-a10423026d2c@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f44a10ff-06a4-c2e9-930d-a10423026d2c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 01/12/2022 12:12, Ayan Kumar Halder wrote:
> 
> On 01/12/2022 10:26, Julien Grall wrote:
>> Hi Ayan,
> 
> Hi Julien,
> 
> I have a question.
> 
>>
>> On 01/12/2022 10:03, Ayan Kumar Halder wrote:
>>> It is possible for a pointer to represent physical memory of the same 
>>> size.
>>> In other words, a 32 bit pointer can represent 32 bit addressable 
>>> physical
>>> memory.
>>> Thus, issue a compilation failure only when the count of physical 
>>> address bits
>>> is greater than BITS_PER_LONG (ie count of bits in void*).
>>
>> I am having difficult to understand how this description is related to 
>> the BUILD_BUG_ON(). AFAIU, it is used to check that xenheap_bits can 
>> be used in shift.
>>
>> If the unsigned long is 32-bit, then a shift of 32 could be undefined. 
>> Looking at the current use, the shift are used with "xenheap_bits - 
>> PAGE_SHIFT". So as long as PAGE_SHIFT is not 0, you would be fine.
> Ack
>>
>>>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> ---
>>>
>>> Currently this change will not have any impact on the existing 
>>> architectures.
>>> The following table illustrates PADDR_BITS vs BITS_PER_LONG of 
>>> different archs
>>>
>>> ------------------------------------------------
>>> | Arch      |   PADDR_BITS    |   BITS_PER_LONG |
>>> ------------------------------------------------
>>> | Arm_64    |   48            |   64            |
>>> | Arm_32    |   40            |   32            |
>>> | RISCV_64  |   Don't know    |   64            |
>>> | x86       |   52            |   64            |
>>> -------------------------------------------------
>>
>> The Arm_32 line is a bit confusing because one would wonder why we 
>> haven't seen this issue yet. So I think you want to clarify that the 
>> code path is not used by Arm32.
> 
> Do you want this clarification and the above/below explanation to be a 
> part of the commit message ?

No I don't think this will be relevant in the final commit message.

Cheers,

-- 
Julien Grall

