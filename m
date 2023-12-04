Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36972803ED8
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 20:55:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647298.1010293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAF2I-000857-Up; Mon, 04 Dec 2023 19:55:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647298.1010293; Mon, 04 Dec 2023 19:55:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAF2I-00082f-RD; Mon, 04 Dec 2023 19:55:22 +0000
Received: by outflank-mailman (input) for mailman id 647298;
 Mon, 04 Dec 2023 19:55:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rAF2H-00082Z-F8
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 19:55:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rAF2D-00024O-Iq; Mon, 04 Dec 2023 19:55:17 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[192.168.23.72]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rAF2D-0005Bk-CU; Mon, 04 Dec 2023 19:55:17 +0000
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
	bh=1/iYg1xVoT4Batkm0nSjXtS0wof6SMbTof+9yg7MyuM=; b=L4Ikfu8JQcW3Ph/HYfqiUIGKeq
	OlkOlG2Iyi7omKKg88W0FxYmsWA1HC6HMNyHCNPMxycKSOhoDZD63Abuesahiq7gHuiDphmcCrJNT
	xbk4OCf26+wQKHJcoXez4G3aVq0ti6a5ZSaNhvm1vAP0mEY46PksdDVrEC52mvjhOelk=;
Message-ID: <ca91f71b-9633-495f-9fb2-731bd250a561@xen.org>
Date: Mon, 4 Dec 2023 19:55:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/arm: Add emulation of Debug Data Transfer
 Registers
Content-Language: en-GB
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, sstabellini@kernel.org,
 stefano.stabellini@amd.com, bertrand.marquis@arm.com, michal.orzel@amd.com,
 Volodymyr_Babchuk@epam.com
Cc: xen-devel@lists.xenproject.org
References: <20231201185009.1719183-1-ayan.kumar.halder@amd.com>
 <0bd65e25-aec2-4294-9a73-1cdaece52242@xen.org>
 <9ffe5a34-d1f4-4f4a-82eb-77c92f71040c@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9ffe5a34-d1f4-4f4a-82eb-77c92f71040c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 04/12/2023 13:02, Ayan Kumar Halder wrote:
> 
> On 04/12/2023 10:31, Julien Grall wrote:
>> Hi Ayan,
> Hi Julien,
>>
>> On 01/12/2023 18:50, Ayan Kumar Halder wrote:
>>> Currently if user enables HVC_DCC config option in Linux, it invokes
>>> access to debug data transfer registers (ie DBGDTRTX_EL0 on arm64,
>>> DBGDTRTXINT on arm32). As these registers are not emulated, Xen injects
>>> an undefined exception to the guest. And Linux crashes.
>>
>> I am missing some data points here to be able to say whether I would 
>> be ok with emulating the registers. So some questions:
>>   * As you wrote below, HVC_DCC will return -ENODEV after this 
>> emulation. So may I ask what's the use case to enable it? (e.g. is 
>> there a distro turning this on?)
> 
> I am not aware of any distro using (or not using) this feature. This 
> issue came to light during our internal testing, when HVC_DCC was 
> enabled to use the debug console. When Linux runs without Xen, then we 
> could observe the logs on the debug console. When Linux was running as a 
> VM, it crashed.
> 
> My intention here was to do the bare minimum emulation so that the crash 
> could be avoided.
This reminds me a bit the discussion around "xen/arm64: Decode ldr/str 
post increment operations". I don't want Xen to contain half-backed 
emulation just to please an OS in certain configuration that doesn't 
seem to be often used.

Also, AFAICT, KVM is in the same situation...

Given this is internal testing, have you considered to ask them to 
disable HVC_DCC?

> 
>>  * Linux is writing to the registers unconditionally, but is the spec 
>> mandating the implementation of the registers? (I couldn't find either 
>> way)
> 
>  From ARM DDI 0487I.a ID081822, H1.2, External debug,
> 
> "The Debug Communications Channel, DCC, passes data between the PE and 
> the debugger:
> 
> — The DCC includes the data transfer registers, DTRRX and DTRTX, and 
> associated flow-control flags.
> 
> — Although the DCC is an essential part of Debug state operation, it can 
> also be used in Non-debug state."
> 
>  From this I infer that the spec mandates the implementation of these 
> registers. IOW, these registers should always be present in any Arm 
> compliant SoC.
> 
>>  * When was this check introduced in Linux? Did it ever changed?
>>
> This check was introduced in the following commit
> 
> "commit f377775dc083506e2fd7739d8615971c46b5246e
> Author: Rob Herring <rob.herring@calxeda.com>
> Date:   Tue Sep 24 21:05:58 2013 -0500
> 
>      TTY: hvc_dcc: probe for a JTAG connection before registering
> 
>      Enabling the ARM DCC console and using without a JTAG connection will
>      simply hang the system. Since distros like to turn on all options, 
> this
>      is a reoccurring problem to debug. We can do better by checking if
>      anything is attached and handling characters. There is no way to probe
>      this, so send a newline and check that it is handled.
> "

I think this is the part I was missing from the commit message. I have 
proposed some wording below.

> 
> As of today, this check hasn't changed.
> 
>>>
>>> We wish to avoid this crash by adding a "partial" emulation. DBGDTR_EL0
>>> is emulated as TXfull | RXfull.
>>
>> Skimming through the Arm Arm, I see that TXfull and Rxfull indicates 
>> that both buffers are full but it doesn't explicitly say this means 
>> the feature is not available.
> We are not saying that the feature is not available. Rather ...
>>
>> I understand this is what Linux checks, but if we want to partially 
>> emulate the registers in Xen, then I'd like us to make sure this is 
>> backed by the Arm Arm rather than based on Linux implementation (which 
>> can change at any point).
>>
>>> Refer ARM DDI 0487I.a ID081822, D17.3.8, DBGDTRTX_EL0
>>> "If TXfull is set to 1, set DTRRX and DTRTX to UNKNOWN"
>>> Also D17.3.7 DBGDTRRX_EL0,
>>> " If RXfull is set to 1, return the last value written to DTRRX."
>>>
>>> Thus, any OS is expected to read DBGDTR_EL0 and check for TXfull
>>> before using DBGDTRTX_EL0. Linux does it via hvc_dcc_init() --->
>>> hvc_dcc_check() , it returns -ENODEV. In this way, we are preventing
>>> the guest to be aborted.
>>
>> See above, what guarantees us that Linux will not change this behavior 
>> in the future?
> 
> If I understand "If TXfull is set to 1, set DTRRX and DTRTX to UNKNOWN" 
> correctly, it seems that Arm ARM expects OS to check for TXfull.
> 
> If the condition is true, it should return some error.
> 
> Let me know if I misunderstood this.

You understand the Arm spec correcly. I think we are disagreeing on the 
wording and whether we should accept basic emulation (see above).

I would like more opinion on that.

[...]

>>> diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
>>> index 39aeda9dab..3f1276f96e 100644
>>> --- a/xen/arch/arm/vcpreg.c
>>> +++ b/xen/arch/arm/vcpreg.c
>>> @@ -548,20 +548,37 @@ void do_cp14_32(struct cpu_user_regs *regs, 
>>> const union hsr hsr)
>>>           break;
>>>       }
>>>   -    case HSR_CPREG32(DBGDSCRINT):
>>> +    case HSR_CPREG32(DBGDSCREXT):
>>> +    {
>>>           /*
>>> -         * Read-only register. Accessible by EL0 if DBGDSCRext.UDCCdis
>>> -         * is set to 0, which we emulated below.
>>> +         * Bit 29: TX full, bit 30: RX full
>>> +         * Given that we emulate DCC registers as RAZ/WI, doing the 
>>> same for
>>> +         * DBGDSCRint would cause a guest to continue using the DCC 
>>> despite no
>>> +         * real effect. Setting the TX/RX status bits should result 
>>> in a probe
>>> +         * fail (based on Linux behavior).
>> If you want to mention Linux then you need to be a bit more specific 
>> because Linux can change at any point. So you at least want to specify 
>> the Linux version and place in the code.
>>
>> So this doesn't get stale as soon as the HVC_DCC driver changes.
> 
> (based on Linux behavior since f377775dc083).

Base on the discussion above, I would like to suggest the following:

Xen doesn't expose a real (or emulated) Debug Communications Channel 
(DCC) to a domain. Yet the Arm Arm implies this is not an optional 
feature. So some domains may start to probe it. For instance, the 
HVC_DCC driver in Linux (since f377775dc083 and at least up to v6.7), 
will try to write some characters and check if the transmit buffer has 
emptied. By setting TX status bit to indicate the transmit buffer is 
full. This we would hint the OS that the DCC is probably not working.

This would give enough information for the reader to know what's going 
and how you emulate.

Also, while writing the proposed comment, I wonder why we need to set 
RX? Wouldn't this potentially indicate to the OS that there are some 
data to read?

Cheers,

-- 
Julien Grall

