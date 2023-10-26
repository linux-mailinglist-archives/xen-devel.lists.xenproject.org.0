Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FE27D887B
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 20:41:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623955.972279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw5Hh-0003jQ-DK; Thu, 26 Oct 2023 18:40:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623955.972279; Thu, 26 Oct 2023 18:40:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw5Hh-0003hk-9A; Thu, 26 Oct 2023 18:40:45 +0000
Received: by outflank-mailman (input) for mailman id 623955;
 Thu, 26 Oct 2023 18:40:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=atUU=GI=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qw5Hg-0003he-DS
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 18:40:44 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a4dd48c-742f-11ee-98d5-6d05b1d4d9a1;
 Thu, 26 Oct 2023 20:40:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id A608F82867D9;
 Thu, 26 Oct 2023 13:40:40 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id GKrOlKkyFSRJ; Thu, 26 Oct 2023 13:40:40 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 13D40828686E;
 Thu, 26 Oct 2023 13:40:40 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id AUkXFotv5GY5; Thu, 26 Oct 2023 13:40:39 -0500 (CDT)
Received: from [10.11.0.3] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 8EA8A82867D9;
 Thu, 26 Oct 2023 13:40:39 -0500 (CDT)
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
X-Inumbo-ID: 2a4dd48c-742f-11ee-98d5-6d05b1d4d9a1
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 13D40828686E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1698345640; bh=h4HjbPnCwNrXK1CS8VlcWWEY66J1/tWnBvkHdUy3X8E=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=biCQDRZqXwagJsv+YXvdGi9H2qRPSIYrL3gNRv14JexeoYUoBGM9bskt9k/2QywBU
	 xJb1zzQW44OGOqjndEaCkXm3IFub7zeZvQDMrlTJXTtMLe4siaapMzW/BAPPqIwqS1
	 /RsJ+DhpoKjTJXWxsms4gTdyKNkpZqdP/0+DVeeQ=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <b77587ac-0520-18cf-c1da-6ef75867127d@raptorengineering.com>
Date: Thu, 26 Oct 2023 13:40:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 2/2] xen/ppc: Implement a basic exception handler
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1698273423.git.sanastasio@raptorengineering.com>
 <1d875c978caa4ed0b3d038655a39aa0cb0583565.1698273423.git.sanastasio@raptorengineering.com>
 <6757b3a9-9556-c658-fb01-ce0ff68ab027@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <6757b3a9-9556-c658-fb01-ce0ff68ab027@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/26/23 3:03 AM, Jan Beulich wrote:
> On 26.10.2023 00:41, Shawn Anastasio wrote:
>> Implement a basic exception handler that dumps the CPU state to the
>> console, as well as the code required to set the correct exception
>> vector table's base address in setup.c.
>>
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> 
> Despite me being unhappy about the disconnect of the constants
> Acked-by: Jan Beulich <jbeulich@suse.com>
> One further remark/suggestion though (happy to take care of while
> committing):
> 
>> --- /dev/null
>> +++ b/xen/arch/ppc/ppc64/exceptions-asm.S
>> @@ -0,0 +1,135 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +
>> +#include <asm/asm-defns.h>
>> +#include <asm/processor.h>
>> +
>> +    .section .text.exceptions, "ax", %progbits
>> +
>> +    /* Helper to dump CPU state to struct cpu_user_regs pointed to by r1. */
>> +ENTRY(exception_common)
>> +    /*
>> +     * Save GPRs 1-31. TODO: The value of %r1 has already been modified by the
>> +     * ISR, so the value we save isn't the exact value we had on entry.
>> +     */
>> +    SAVE_GPRS(1, 31, %r1)
> 
> Wouldn't this comment ...
> 
>> +    /* Save LR, CTR, CR */
>> +    mflr    %r0
>> +    std     %r0, UREGS_lr(%r1)
>> +    mfctr   %r0
>> +    std     %r0, UREGS_ctr(%r1)
>> +    mfcr    %r0
>> +    stw     %r0, UREGS_cr(%r1) /* 32-bit */
>> +
>> +    /* Save Exception Registers */
>> +    mfsrr0  %r0
>> +    std     %r0, UREGS_pc(%r1)
>> +    mfsrr1  %r0
>> +    std     %r0, UREGS_msr(%r1)
>> +    mfdsisr %r0
>> +    stw     %r0, UREGS_dsisr(%r1) /* 32-bit */
>> +    mfdar   %r0
>> +    std     %r0, UREGS_dar(%r1)
>> +    li      %r0, -1 /* OS's SRR0/SRR1 have been clobbered */
>> +    std     %r0, UREGS_srr0(%r1)
>> +    std     %r0, UREGS_srr1(%r1)
>> +
>> +    /* Setup TOC and a stack frame then call C exception handler */
>> +    mr      %r3, %r1
>> +    bcl     20, 31, 1f
>> +1:  mflr    %r12
>> +    addis   %r2, %r12, .TOC.-1b@ha
>> +    addi    %r2, %r2, .TOC.-1b@l
>> +
>> +    li      %r0, 0
>> +    stdu    %r0, -STACK_FRAME_OVERHEAD(%r1)
>> +    bl      exception_handler
>> +
>> +    .size exception_common, . - exception_common
>> +    .type exception_common, %function
>> +
>> +    /* Same as exception_common, but for exceptions that set HSRR{0,1} */
>> +ENTRY(h_exception_common)
>> +    /* Save GPRs 1-31 */
>> +    SAVE_GPRS(1, 31, %r1)
> 
> ... better be repeated here?
>

Sure, if you'd like to make that change during commit that'd be great.

> Jan

Thanks,
Shawn

