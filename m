Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 854B65FDE37
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 18:24:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422328.668279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oj102-0003Z0-6l; Thu, 13 Oct 2022 16:23:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422328.668279; Thu, 13 Oct 2022 16:23:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oj102-0003WJ-49; Thu, 13 Oct 2022 16:23:58 +0000
Received: by outflank-mailman (input) for mailman id 422328;
 Thu, 13 Oct 2022 16:23:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oj100-0003WD-AD
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 16:23:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oj0zy-0003VM-Oh; Thu, 13 Oct 2022 16:23:54 +0000
Received: from [15.248.2.148] (helo=[10.24.69.5])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oj0zy-0000Z6-Ht; Thu, 13 Oct 2022 16:23:54 +0000
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
	bh=FPpnaVvAN4PsmzhJaH2gc9mOOkm9k6x3hCsQuhZuV4Y=; b=q63MFJBTsvccRJeKibxbNGUyVq
	cw+BMc50le8f1UE0N3zTzWQM6N3GAe90k/sIOK4GGlTP+uz0fiQhnhlZb65rRxhJr97ht8jlB+2Y5
	9z2mht96tk9gPq5cp/xLUHo1BVOwhcFGx8+OV77ZuhgKen5XOgAio2iEScTb0utmrpBI=;
Message-ID: <053a8892-b6c2-8518-94f5-cc6487a88ca2@xen.org>
Date: Thu, 13 Oct 2022 17:23:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: Need guidance to support reading GICR_TYPER (64 bit register) on
 Aarch32_v8r
To: Ayan Kumar Halder <ayankuma@amd.com>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 bertrand Marquis <Bertrand.Marquis@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>, Penny Zheng <Penny.Zheng@arm.com>
Cc: Jaxson Han <jaxson.han@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e2d041b2-3b38-f19b-2d8e-3a255b0ac07e@amd.com>
 <9b4a9bbf-eb5c-3d13-f796-c6bf5704d85b@xen.org>
 <e94b7c65-1c38-024f-6a91-16098045574a@amd.com>
 <96f989d9-4d55-acc9-a0f7-cbb1212480ad@xen.org>
 <28a406b7-0b9d-3c4b-4db4-67af6729e35f@amd.com>
 <28525ef4-4ecf-e55f-682c-93eeffbc09b5@xen.org>
 <8fda8e62-bc95-0506-da67-ddef0b1f73f6@amd.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <8fda8e62-bc95-0506-da67-ddef0b1f73f6@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 13/10/2022 17:05, Ayan Kumar Halder wrote:
> 
> On 13/10/2022 16:38, Julien Grall wrote:
>> Hi,
> Hi Julien,
>>
>> On 13/10/2022 16:13, Ayan Kumar Halder wrote:
>>>
>>> On 13/10/2022 15:47, Julien Grall wrote:
>>>>> .Thus, the guest need to invoke sys_read32() twice (GICR_TYPER and 
>>>>> GICR_TYPER+4).
>>>>
>>>> I don't understand how you came to this conclusion with what you wrote. 
>>>
>>> Sorry for confusion. I was trying to explain that the code does not 
>>> handle 32 bit access of GICR_TYPER on arm32.
>>>
>>>
>>>> If we had implemented vreg_reg64_extract(), then Zephyr would still 
>>>> need to issue two 32-bit read because Xen doesn't emulate 'ldrd'.
>>>
>>> Yes. So what we need here is not the implementation of 
>>> vreg_reg64_extract() for GICR_TYPER.
>> Why not? Your GICR_TYPER is a 64-bit and the helper is the right way 
>> to hide whether the low/high 32-bit are accessed.
> 
> When Zephyr issues 32 bit reads for GICR_TYPER for GICR_TYPER + 4, it 
> traps to Xen two times.
> 
> So, my understanding is that Xen needs to read two 32 bit values.
> 
> We can modify the vreg_reg64_extract() so that it can return the lower 
> 32 bits in one case and upper 32 bits in the second case.
> 
> Is this what you are suggesting ?

Well... The helper is already doing that. It was introduced to support 
32-bit guest using GICv3 on 64-bit Xen.

Cheers,

-- 
Julien Grall

