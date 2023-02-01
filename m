Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA378685D55
	for <lists+xen-devel@lfdr.de>; Wed,  1 Feb 2023 03:27:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488056.755940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pN2qG-0004jb-Tr; Wed, 01 Feb 2023 02:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488056.755940; Wed, 01 Feb 2023 02:27:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pN2qG-0004hA-Qg; Wed, 01 Feb 2023 02:27:20 +0000
Received: by outflank-mailman (input) for mailman id 488056;
 Wed, 01 Feb 2023 02:27:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H7L9=55=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1pN2qF-0004h4-Hm
 for xen-devel@lists.xenproject.org; Wed, 01 Feb 2023 02:27:19 +0000
Received: from ppsw-33.srv.uis.cam.ac.uk (ppsw-33.srv.uis.cam.ac.uk
 [131.111.8.133]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f150e70d-a1d7-11ed-b63b-5f92e7d2e73a;
 Wed, 01 Feb 2023 03:27:16 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:44954)
 by ppsw-33.srv.uis.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1pN2q0-000nkw-Rq (Exim 4.96) (return-path <amc96@srcf.net>);
 Wed, 01 Feb 2023 02:27:04 +0000
Received: from [192.168.1.10] (host-92-12-62-6.as13285.net [92.12.62.6])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 448BE1FB3A;
 Wed,  1 Feb 2023 02:27:04 +0000 (GMT)
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
X-Inumbo-ID: f150e70d-a1d7-11ed-b63b-5f92e7d2e73a
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <b3564bd0-cf28-d268-226a-efc962271750@srcf.net>
Date: Wed, 1 Feb 2023 02:27:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Bobby Eshleman <bobby.eshleman@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1674818705.git.oleksii.kurochko@gmail.com>
 <652289358975cf869e4bc0a6a70e3aba7bd2fbf6.1674818705.git.oleksii.kurochko@gmail.com>
 <75328420-0fbd-92ae-40c7-9fee1c31c907@suse.com>
 <792bc4533d3604acd4321b4b15965adec22431a4.camel@gmail.com>
 <bdb8c6a8-a677-9bef-c819-904bd944e6da@suse.com>
 <7fe303b6-9d01-783b-f24a-12605fe62e5f@xen.org>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH v2 07/14] xen/riscv: introduce exception context
In-Reply-To: <7fe303b6-9d01-783b-f24a-12605fe62e5f@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/01/2023 10:44 pm, Julien Grall wrote:
> Hi Jan,
>
> On 30/01/2023 13:50, Jan Beulich wrote:
>> On 30.01.2023 12:54, Oleksii wrote:
>>> Hi Jan,
>>>
>>> On Fri, 2023-01-27 at 15:24 +0100, Jan Beulich wrote:
>>>> On 27.01.2023 14:59, Oleksii Kurochko wrote:
>>>>> --- /dev/null
>>>>> +++ b/xen/arch/riscv/include/asm/processor.h
>>>>> @@ -0,0 +1,82 @@
>>>>> +/* SPDX-License-Identifier: MIT */
>>>>> +/*****************************************************************
>>>>> *************
>>>>> + *
>>>>> + * Copyright 2019 (C) Alistair Francis <alistair.francis@wdc.com>
>>>>> + * Copyright 2021 (C) Bobby Eshleman <bobby.eshleman@gmail.com>
>>>>> + * Copyright 2023 (C) Vates
>>>>> + *
>>>>> + */
>>>>> +
>>>>> +#ifndef _ASM_RISCV_PROCESSOR_H
>>>>> +#define _ASM_RISCV_PROCESSOR_H
>>>>> +
>>>>> +#ifndef __ASSEMBLY__
>>>>> +
>>>>> +/* On stack VCPU state */
>>>>> +struct cpu_user_regs
>>>>> +{
>>>>> +    unsigned long zero;
>>>>> +    unsigned long ra;
>>>>> +    unsigned long sp;
>>>>> +    unsigned long gp;
>>>>> +    unsigned long tp;
>>>>> +    unsigned long t0;
>>>>> +    unsigned long t1;
>>>>> +    unsigned long t2;
>>>>> +    unsigned long s0;
>>>>> +    unsigned long s1;
>>>>> +    unsigned long a0;
>>>>> +    unsigned long a1;
>>>>> +    unsigned long a2;
>>>>> +    unsigned long a3;
>>>>> +    unsigned long a4;
>>>>> +    unsigned long a5;
>>>>> +    unsigned long a6;
>>>>> +    unsigned long a7;
>>>>> +    unsigned long s2;
>>>>> +    unsigned long s3;
>>>>> +    unsigned long s4;
>>>>> +    unsigned long s5;
>>>>> +    unsigned long s6;
>>>>> +    unsigned long s7;
>>>>> +    unsigned long s8;
>>>>> +    unsigned long s9;
>>>>> +    unsigned long s10;
>>>>> +    unsigned long s11;
>>>>> +    unsigned long t3;
>>>>> +    unsigned long t4;
>>>>> +    unsigned long t5;
>>>>> +    unsigned long t6;
>>>>> +    unsigned long sepc;
>>>>> +    unsigned long sstatus;
>>>>> +    /* pointer to previous stack_cpu_regs */
>>>>> +    unsigned long pregs;
>>>>> +};
>>>>
>>>> Just to restate what I said on the earlier version: We have a struct
>>>> of
>>>> this name in the public interface for x86. Besides to confusion about
>>>> re-using the name for something private, I'd still like to understand
>>>> what the public interface plans are. This is specifically because I
>>>> think it would be better to re-use suitable public interface structs
>>>> internally where possible. But that of course requires spelling out
>>>> such parts of the public interface first.
>>>>
>>> I am not sure that I get you here.
>>> I greped a little bit and found out that each architecture declares
>>> this structure inside arch-specific folder.
>>>
>>> Mostly the usage of the cpu_user_regs is to save/restore current state
>>> of CPU during traps ( exceptions/interrupts ) and context_switch().
>>
>> Arm effectively duplicates the public interface struct
>> vcpu_guest_core_regs
>> and the internal struct cpu_user_regs (and this goes as far as also
>> duplicating the __DECL_REG() helper). Personally I find such duplication
>> odd at the first glance at least; maybe there is a specific reason
>> for this
>> in Arm. But whether the public interface struct can be re-used can
>> likely
>> only be known once it was spelled out.
>
> There are some force padding, a different ordering and some extra
> fields in the internal version to simplify the assembly code.
>
> The rationale is explained in 1c38a1e937d3 ("xen: arm: separate guest
> user regs from internal guest state").
>
> We also have a split between 32-bit and 64-bit to avoid doubling up
> the size in the former case.

And on top of these reasons, I feel I need to remind you that we still
need to break these apart on x86 to fix a stack OoB access in the #DF
handler, and to fix stack alignment for UEFI, and to remove the relics
of vm86 mode, and not to mention adding support for FRED.

It was a fundamental design error that Xen's internal representation
ever made it into the public API, and it absolutely does not want
repeating again.

~Andrew

