Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9EE681E49
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 23:44:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487266.754860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMcsn-0002ay-Jv; Mon, 30 Jan 2023 22:44:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487266.754860; Mon, 30 Jan 2023 22:44:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMcsn-0002Yb-Gk; Mon, 30 Jan 2023 22:44:13 +0000
Received: by outflank-mailman (input) for mailman id 487266;
 Mon, 30 Jan 2023 22:44:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pMcsl-0002YV-N8
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 22:44:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMcsh-0006nR-MG; Mon, 30 Jan 2023 22:44:07 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMcsh-0007DG-GO; Mon, 30 Jan 2023 22:44:07 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=mC1/+GCUZh5t3jhpg3lFZjwqR6jMNtu16L7JSPUjM60=; b=PnP6TRjX61yEHyoaqWhWeHAHH6
	IBnnY5qCpVmejxolRRcTb3L/cxEtEiC8IjAplgrunjwX/tjbZPeawW11o/YCIzZoOp/2sxkyzZ7ES
	XJ29s0ukc9Fi5y/wIija3x1CL1UvK7HD1qDGtZW2I4TpYNAhRCTIcrLU/6Epyp9+MeWU=;
Message-ID: <7fe303b6-9d01-783b-f24a-12605fe62e5f@xen.org>
Date: Mon, 30 Jan 2023 22:44:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: Jan Beulich <jbeulich@suse.com>, Oleksii <oleksii.kurochko@gmail.com>
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
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 07/14] xen/riscv: introduce exception context
In-Reply-To: <bdb8c6a8-a677-9bef-c819-904bd944e6da@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jan,

On 30/01/2023 13:50, Jan Beulich wrote:
> On 30.01.2023 12:54, Oleksii wrote:
>> Hi Jan,
>>
>> On Fri, 2023-01-27 at 15:24 +0100, Jan Beulich wrote:
>>> On 27.01.2023 14:59, Oleksii Kurochko wrote:
>>>> --- /dev/null
>>>> +++ b/xen/arch/riscv/include/asm/processor.h
>>>> @@ -0,0 +1,82 @@
>>>> +/* SPDX-License-Identifier: MIT */
>>>> +/*****************************************************************
>>>> *************
>>>> + *
>>>> + * Copyright 2019 (C) Alistair Francis <alistair.francis@wdc.com>
>>>> + * Copyright 2021 (C) Bobby Eshleman <bobby.eshleman@gmail.com>
>>>> + * Copyright 2023 (C) Vates
>>>> + *
>>>> + */
>>>> +
>>>> +#ifndef _ASM_RISCV_PROCESSOR_H
>>>> +#define _ASM_RISCV_PROCESSOR_H
>>>> +
>>>> +#ifndef __ASSEMBLY__
>>>> +
>>>> +/* On stack VCPU state */
>>>> +struct cpu_user_regs
>>>> +{
>>>> +    unsigned long zero;
>>>> +    unsigned long ra;
>>>> +    unsigned long sp;
>>>> +    unsigned long gp;
>>>> +    unsigned long tp;
>>>> +    unsigned long t0;
>>>> +    unsigned long t1;
>>>> +    unsigned long t2;
>>>> +    unsigned long s0;
>>>> +    unsigned long s1;
>>>> +    unsigned long a0;
>>>> +    unsigned long a1;
>>>> +    unsigned long a2;
>>>> +    unsigned long a3;
>>>> +    unsigned long a4;
>>>> +    unsigned long a5;
>>>> +    unsigned long a6;
>>>> +    unsigned long a7;
>>>> +    unsigned long s2;
>>>> +    unsigned long s3;
>>>> +    unsigned long s4;
>>>> +    unsigned long s5;
>>>> +    unsigned long s6;
>>>> +    unsigned long s7;
>>>> +    unsigned long s8;
>>>> +    unsigned long s9;
>>>> +    unsigned long s10;
>>>> +    unsigned long s11;
>>>> +    unsigned long t3;
>>>> +    unsigned long t4;
>>>> +    unsigned long t5;
>>>> +    unsigned long t6;
>>>> +    unsigned long sepc;
>>>> +    unsigned long sstatus;
>>>> +    /* pointer to previous stack_cpu_regs */
>>>> +    unsigned long pregs;
>>>> +};
>>>
>>> Just to restate what I said on the earlier version: We have a struct
>>> of
>>> this name in the public interface for x86. Besides to confusion about
>>> re-using the name for something private, I'd still like to understand
>>> what the public interface plans are. This is specifically because I
>>> think it would be better to re-use suitable public interface structs
>>> internally where possible. But that of course requires spelling out
>>> such parts of the public interface first.
>>>
>> I am not sure that I get you here.
>> I greped a little bit and found out that each architecture declares
>> this structure inside arch-specific folder.
>>
>> Mostly the usage of the cpu_user_regs is to save/restore current state
>> of CPU during traps ( exceptions/interrupts ) and context_switch().
> 
> Arm effectively duplicates the public interface struct vcpu_guest_core_regs
> and the internal struct cpu_user_regs (and this goes as far as also
> duplicating the __DECL_REG() helper). Personally I find such duplication
> odd at the first glance at least; maybe there is a specific reason for this
> in Arm. But whether the public interface struct can be re-used can likely
> only be known once it was spelled out.

There are some force padding, a different ordering and some extra fields 
in the internal version to simplify the assembly code.

The rationale is explained in 1c38a1e937d3 ("xen: arm: separate guest 
user regs from internal guest state").

We also have a split between 32-bit and 64-bit to avoid doubling up the 
size in the former case.

Cheers,

-- 
Julien Grall

