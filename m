Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E7C46E310
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 08:19:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242708.419752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvDhy-0004zU-DB; Thu, 09 Dec 2021 07:19:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242708.419752; Thu, 09 Dec 2021 07:19:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvDhy-0004wk-AB; Thu, 09 Dec 2021 07:19:14 +0000
Received: by outflank-mailman (input) for mailman id 242708;
 Thu, 09 Dec 2021 07:19:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sGmr=Q2=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1mvDhw-0004wc-BI
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 07:19:12 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 4d16b7bd-58c0-11ec-9d12-4777fae47e2b;
 Thu, 09 Dec 2021 08:19:10 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2A2213A1;
 Wed,  8 Dec 2021 23:19:08 -0800 (PST)
Received: from [10.57.3.209] (unknown [10.57.3.209])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2622B3F5A1;
 Wed,  8 Dec 2021 23:19:08 -0800 (PST)
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
X-Inumbo-ID: 4d16b7bd-58c0-11ec-9d12-4777fae47e2b
Subject: Re: Aarch64 stand-alone application for Xen
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <CANLsYkzKn7Nkika=KpHtSyi9=FQwS7Wt94Odbg2HuH+1PFUTzA@mail.gmail.com>
 <B34490D7-5FE3-41D4-9792-41E2BD25EF05@arm.com>
 <CANLsYkywEbLHhxsAJQ8_HPnjdsDXZMO+5-+zbSuqmcUV1Dr4iA@mail.gmail.com>
 <074326cc-f910-2cad-be1f-e27480f53b67@arm.com>
 <CANLsYkyF4Mv+MhyKJ-B4-56G=RVu6U3=OAraK5ZtnOx6TaW1UQ@mail.gmail.com>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <877a84bc-b550-a22b-d3ab-1f81b1b78c6f@arm.com>
Date: Thu, 9 Dec 2021 08:19:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CANLsYkyF4Mv+MhyKJ-B4-56G=RVu6U3=OAraK5ZtnOx6TaW1UQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Mathieu,

On 08.12.2021 22:23, Mathieu Poirier wrote:
> On Wed, 8 Dec 2021 at 07:19, Michal Orzel <michal.orzel@arm.com> wrote:
>>
>> Hi Mathieu,
>>
>> On 08.12.2021 01:06, Mathieu Poirier wrote:
>>> Hi Bertrand,
>>>
>>> On Fri, 26 Nov 2021 at 03:32, Bertrand Marquis <Bertrand.Marquis@arm.com> wrote:
>>>>
>>>> Hi Mathieu,
>>>>
>>>>> On 25 Nov 2021, at 22:59, Mathieu Poirier <mathieu.poirier@linaro.org> wrote:
>>>>>
>>>>> Good day,
>>>>>
>>>>> I am in the process of adding support for aarch64 to the xen-sys
>>>>> crate[1].  The crate currently supports x86_64 and includes a
>>>>> stand-alone "oxerun" application that can be used to validate
>>>>> hypercalls.  My goal is to provide the same functionality on arm64.  I
>>>>> am looking for a stand-alone aarch64 example, something like an "hello
>>>>> world" to help me with the assembler startup code.
>>>>
>>>> We are working on porting XTF to arm64 and already have something running.
>>>> I think it could be a good starting point for you:
>>>> https://github.com/orzelmichal/xtf/tree/arm-devel
>>>
>>> Quick one - have you been able to get the "test-arm-64le-example"
>>> application to run?  So far Xen gives me the following error:
>>>
>>> (XEN) ****************************************
>>> (XEN) Panic on CPU 0:
>>> (XEN) Unable to copy the kernel in the hwdom memory
>>> (XEN) ****************************************
>>>
>>> I wanted to check with you before starting to dig into it.
>>>
>>
>> ICYDK, 64le environment is used to create non-MMU domain in contrast to mmu64le.
> 
> Right.
> 
>> It lacks support for PV console and other important features of Xen.
> 
> I'm good with that - for now all I want is to test hypervisor calls I
> developed in Rust.
> 
>> But we are able to run it without any issue.
>> Please keep in mind that as there is no MMU you need to pay attention to the load address.
>> By default for non-MMU domain, the address is 0x40000000 which is the correct address if you use XTF as a guest.
> 
> I was trying to boot XTF as dom0 using the default address
> (0x40000000), which lead to the output depicted above.
> 
>> If you want to run non-MMU XTF as dom0, you need to specify the correct load address by passing CONFIG_LOAD_ADDRESS=<address>
>> when invoking make. For example on QEMU it would be CONFIG_LOAD_ADDRESS=0x80000000.
>>
> 
> When adding the compilation flag "CONFIG_LOAD_ADDRESS=0x80000000" I
> get further [1].  For my own education, why is address 0x80000000
> required when running a non-MMU XTF as dom0?  Is this a Xen thing?
> 
> The application crashes in the loop on line 135 [2] and I am wondering
> if it wouldn't be related to the QEMU emulation. My setup is as
> follow:
> 
> . QEMU startup command [3]
> . XTF baseline: "c14f7dd289a4 (xtf: Add arm support into xtf-runner)"
> . Xen baseline: "c76cfada1cfa (tools/libacpi: Use 64-byte alignment for FACS)"
> 
> Best regards,
> Mathieu
> 
> [1]. https://pastebin.com/3AVXRGXD
> [2]. https://github.com/orzelmichal/xtf/blob/arm-devel/arch/arm/arm64/head.S#L135
> [3]. https://pastebin.com/52aVAFha
> 

For the setup you provided just compile XTF with CONFIG_LOAD_ADDRESS=0x60000000.
This will fix your problem.
When using non-MMU dom0, the microkernel must be compiled with the load address that
is within the memory bank allocated by Xen. You can see it in your logs:
(XEN) BANK[0] 0x00000060000000-0x00000080000000 (512MB)

You did not specify dom0_mem parameter, so Xen defaults to 512MB for dom0.
You can see it in your logs:
(XEN) PLEASE SPECIFY dom0_mem PARAMETER - USING 512M FOR NOW

FWICS you are passing Xen command line arguments through -append but i'm not sure it works.
The best way is to use dtb.


>>> Thanks,
>>> Mathieu
>>>
>>>>
>>>> Regards
>>>> Bertrand
>>>>
>>>>>
>>>>> Many thanks for the consideration,
>>>>> Mathieu
>>>>>
>>>>> [1]. https://crates.io/crates/xen-sys
>>>>>
>>>>
>>>
>> Cheers,
>> Michal

Cheers,
Michal

