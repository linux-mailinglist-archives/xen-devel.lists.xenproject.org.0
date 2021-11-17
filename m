Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AC7454CB4
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 19:02:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226967.392401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnPFN-0001be-F6; Wed, 17 Nov 2021 18:01:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226967.392401; Wed, 17 Nov 2021 18:01:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnPFN-0001Yx-By; Wed, 17 Nov 2021 18:01:25 +0000
Received: by outflank-mailman (input) for mailman id 226967;
 Wed, 17 Nov 2021 18:01:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mnPFL-0001Yr-Pd
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 18:01:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mnPFK-00066o-K0; Wed, 17 Nov 2021 18:01:22 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.21.213]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mnPFK-0002Qv-D8; Wed, 17 Nov 2021 18:01:22 +0000
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
	bh=JKnAP9c8QonaYKOPlLir5wYycd9gkSqKBQnoSgO2SY8=; b=dv1dE3nUk+udqVD3fZrh5kzPu/
	WdeOJopFIK6lV/iyy1RGvbFr1hBNw9eGlfD23BcJGZVFUhoWoH/dPFMT+e7q9RM6TwhxDEp/srwOx
	V5te8klcjICR0d44/7nnhRf7CisZ9dRVoI9P3UefO2awKtPdaBO2hnicxi99WUW3IuyU=;
Message-ID: <c7bda1d6-355e-3240-1d09-59d7c13c4262@xen.org>
Date: Wed, 17 Nov 2021 18:01:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: Xen/ARM - Query about a data abort seen while reading GICD
 registers
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <1489a1b9-aefa-0ddf-8dba-4a566388cc6f@xilinx.com>
 <CED537AF-44AA-41B8-9458-17A5C43FBECC@arm.com>
 <f91fd718-040e-88a3-ca96-30d1efe9a689@xilinx.com>
 <0ACF6308-EDB0-4B98-A029-1C7B23820198@arm.com>
 <636b9fe8-4c10-45f5-da95-513c87e5939f@xilinx.com>
 <BA07700B-D025-492D-A376-513408927F68@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <BA07700B-D025-492D-A376-513408927F68@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

I will combine my answers for this thread in one single e-mail.

On 17/11/2021 16:35, Bertrand Marquis wrote:
>> On 17 Nov 2021, at 16:21, Ayan Kumar Halder <ayan.kumar.halder@xilinx.com> wrote:
>>
>> Hi Bertrand,
>>
>> Many thanks for your response.
>>
>> On 17/11/2021 15:48, Bertrand Marquis wrote:
>>> Hi Ayan,
>>>> On 16 Nov 2021, at 16:24, Ayan Kumar Halder <ayan.kumar.halder@xilinx.com> wrote:
>>>>
>>>> Hi Bertrand,
>>>>
>>>> Thanks for looking into it.
>>>>
>>>> On 16/11/2021 15:36, Bertrand Marquis wrote:
>>>>> Hi Ayan,
>>>>>> On 16 Nov 2021, at 15:27, Ayan Kumar Halder <ayan.kumar.halder@xilinx.com> wrote:
>>>>>>
>>>>>> Hi Xen/Arm experts,
>>>>>>
>>>>>> I am facing a very strange issue while running a baremetal application as a DomU guest on arm64 platform.
>>>>>>
>>>>>> The baremetal app tries to read the GICD register with post indexing as follows :-
>>>>>> ldr x1, =0x3001000
>>>>>> ldr w2, [x1], #4 <<<------ PC = 0x40000ca8
>>>>> Increment on on load is not supported by the emulation layer.
>>>>
>>>> That is surprising. The reason being if I try to read the GICC register (0x3002000) with post indexing then it works fine.
>>> When the ISV bit is not set, Xen would have to decode the instruction to actually emulate the access and properly modify the registers values as long as providing the “emulated” access value.
>>
>> This is very interesting. Is this being done for any of the other instructions in Xen ?
> 
> No Xen is not trying to decode any instructions.

We actually decode some instructions (see arch/arm/decode.c). This was 
necessary because early revision of Cortex-A15 would not properly fill 
syndrome for Thumb instructions.

decode_instruction() could be extended to handle the specific 
instruction if needed.

> If you look at Linux source code, this is the kind of stuff that the kernel is delegating to user application (qemu) to do as it can be quite complex.
> 
>>> There is not such a decoder in Xen right now which means those kind of accesses are not supported for emulated mmio accesses.
>>
>> I am actually trying to understand where I will need to make the changes if I have to add support for the decoder. The reason being this issue is being faced by one of our customer application.
>> Besides changing the instruction to prevent post increment, is there any other mitigation ?
> 
> Not that I know of.

Decoding the instruction is the only solution if you don't want to 
update the baremetal app.

>>
>> The reason being I don't see a way to instruct the compiler to not generate the post indexing instructions.
In general, it is not safe to let the compiler decide for you how to 
access the MMIO registers as it can do all sort of optimization behind 
your back. That's why...

> 
> You can define io access functions instead of letting the compiler generate the read/write functions.
> Look at arch/arm64/include/asm-arm/io.h in linux for example.

... Linux provides io{read, write} helpers.

@Ayan, is the code written in assembly or C? If the latter, how is it 
written?

That said, the ldr writeback instructions should be safe to use. It 
happens that we never had OS using them before.

Cheers,

-- 
Julien Grall

