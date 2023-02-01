Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 296AB6870DC
	for <lists+xen-devel@lfdr.de>; Wed,  1 Feb 2023 23:12:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488460.756550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNLK6-0002lV-GS; Wed, 01 Feb 2023 22:11:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488460.756550; Wed, 01 Feb 2023 22:11:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNLK6-0002jg-DQ; Wed, 01 Feb 2023 22:11:22 +0000
Received: by outflank-mailman (input) for mailman id 488460;
 Wed, 01 Feb 2023 22:11:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pNLK4-0002ja-Nn
 for xen-devel@lists.xenproject.org; Wed, 01 Feb 2023 22:11:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pNLK4-0004SO-63; Wed, 01 Feb 2023 22:11:20 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pNLK3-0008OS-WF; Wed, 01 Feb 2023 22:11:20 +0000
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
	bh=jipR7+cbugD8Ubdec53EWNKrD2peULlIM1gaiRNjkFE=; b=Z7cjQCqsldVlqdkbFtLQEKq9sw
	itWMSW+kygLPe4R3Xo4T54mgHZJo+27ixCJrBYoJrLarusguMojq9/K8JXcrFjimpku0eEqC+s+Ae
	FB5aW3t84PqRcb5p/10jAYdLdiPymp8a5oqHoznrqnewH44BfZHgSh13Iutj0OxQB43I=;
Message-ID: <b5dba106-e7ed-4aa9-ea44-19adacc7fade@xen.org>
Date: Wed, 1 Feb 2023 22:11:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: Oleksii <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1674818705.git.oleksii.kurochko@gmail.com>
 <06c06dde5ee635c6d1ebf66a8cff9e7e1f4fbf5c.1674818705.git.oleksii.kurochko@gmail.com>
 <73553bcf-9688-c187-a9cb-c12806484893@xen.org>
 <2c4d490bde4f04f956e481257ddc7129c312abb6.camel@gmail.com>
 <873d4754-0314-0022-96a9-e54ed78ac6ef@xen.org>
 <d41b705904b693e80cf5fdadd46a26e38d1bc596.camel@gmail.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 12/14] xen/riscv: introduce an implementation of macros
 from <asm/bug.h>
In-Reply-To: <d41b705904b693e80cf5fdadd46a26e38d1bc596.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 01/02/2023 17:40, Oleksii wrote:
> Hi Julien,

Hi Oleksii,

> On Mon, 2023-01-30 at 22:28 +0000, Julien Grall wrote:
>> Hi Oleksii,
>>
>> On 30/01/2023 11:35, Oleksii wrote:
>>> Hi Julien,
>>> On Fri, 2023-01-27 at 16:02 +0000, Julien Grall wrote:
>>>> Hi Oleksii,
>>>>
>>>> On 27/01/2023 13:59, Oleksii Kurochko wrote:
>>>>> The patch introduces macros: BUG(), WARN(), run_in_exception(),
>>>>> assert_failed.
>>>>>
>>>>> The implementation uses "ebreak" instruction in combination
>>>>> with
>>>>> diffrent bug frame tables (for each type) which contains useful
>>>>> information.
>>>>>
>>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>>> ---
>>>>> Changes:
>>>>>      - Remove __ in define namings
>>>>>      - Update run_in_exception_handler() with
>>>>>        register void *fn_ asm(__stringify(BUG_FN_REG)) = (fn);
>>>>>      - Remove bug_instr_t type and change it's usage to uint32_t
>>>>> ---
>>>>>     xen/arch/riscv/include/asm/bug.h | 118
>>>>> ++++++++++++++++++++++++++++
>>>>>     xen/arch/riscv/traps.c           | 128
>>>>> +++++++++++++++++++++++++++++++
>>>>>     xen/arch/riscv/xen.lds.S         |  10 +++
>>>>>     3 files changed, 256 insertions(+)
>>>>>     create mode 100644 xen/arch/riscv/include/asm/bug.h
>>>>>
>>>>> diff --git a/xen/arch/riscv/include/asm/bug.h
>>>>> b/xen/arch/riscv/include/asm/bug.h
>>>>> new file mode 100644
>>>>> index 0000000000..4b15d8eba6
>>>>> --- /dev/null
>>>>> +++ b/xen/arch/riscv/include/asm/bug.h
>>>>> @@ -0,0 +1,118 @@
>>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>>> +/*
>>>>> + * Copyright (C) 2012 Regents of the University of California
>>>>> + * Copyright (C) 2021-2023 Vates
>>>>
>>>> I have to question the two copyrights here given that the
>>>> majority of
>>>> the code seems to be taken from the arm implementation (see
>>>> arch/arm/include/asm/bug.h).
>>>>
>>>> With that said, we should consolidate the code rather than
>>>> duplicating
>>>> it on every architecture.
>>>>
>>> Copyrights should be removed. They were taken from the previous
>>> implementation of bug.h for RISC-V so I just forgot to remove them.
>>>
>>> It looks like we should have common bug.h for ARM and RISCV but I
>>> am
>>> not sure that I know how to do that better.
>>> Probably the code wants to be moved to xen/include/bug.h and using
>>> ifdef ARM && RISCV ...
>>
>> Or you could introduce CONFIG_BUG_GENERIC or else, so it is easily
>> selectable by other architecture.
>>
>>> But still I am not sure that this is the best one option as at
>>> least we
>>> have different implementation for x86_64.
>>
>> My main concern is the maintainance effort. For every bug, we would
>> need
>> to fix it in two places. The risk is we may forget to fix one
>> architecture.
>> This is not a very ideal situation.
>>
>> So I think sharing the header between RISC-V and Arm (or x86, see
>> below)
>> is at least a must. We can do the 3rd architecture at a leisure pace.
>>
>> One option would be to introduce asm-generic like Linux (IIRC this
>> was a
>> suggestion from Andrew). This would also to share code between two of
>> the archs.
>>
>> Also, from a brief look, the difference in implementation is mainly
>> because on Arm we can't use %c (some version of GCC didn't support
>> it).
>> Is this also the case on RISC-V? If not, you may want to consider to
>> use
>> the x86 version.
>>
> I did several experiments related to '%c' in inline assembly for RISC-V
> and it seems that '%c' doesn't support all forms of the use of '%c'.

Thanks for checking!

> I wrote the following macros and they have been compiled without any
> errors:
>                          .....
> #define _ASM_BUGFRAME_TEXT(second_frame)                       \
>      ".Lbug%=: ebreak\n"                                        \
>      ".pushsection .bug_frames.%c[bf_type], \"a\", @progbits\n" \
>      ".p2align 2\n"                                             \
>      ".Lfrm%=:\n"                                               \
>      ".long (.Lfrm%=)\n"                                        \
>      ".long (0x55555555)\n"                                     \
>      ".long (.Lbug%=)\n"                                        \
>      ".long (0x55555555)\n"                                     \
>      ".long %c[bf_line_hi]\n"                                   \
>      ".long (0x55555555)\n"                                     \
>      ".long %[bf_line_hi]\n"                                    \
>      ".long (0x55555555)\n"                                     \
>      ".long %[bf_line_lo]\n"                                    \
>      ".long (0x55555555)\n"                                     \
>      ".long %[bf_ptr]\n"                                        \
>      ".long (0x55555555)\n"                                     \
>      ".long (.Lbug%= - .Lfrm%=) + %c[bf_line_hi]\n"             \
>      ".popsection\n"                                            \
> 
> #define _ASM_BUGFRAME_INFO(type, line, ptr, msg)               \
>      [bf_type]    "i" (type),                                   \
>      [bf_ptr]     "i" (ptr),                                    \
>      [bf_msg]     "i" (msg),                                    \
>      [bf_line_lo] "i" ((line & ((1 << BUG_LINE_LO_WIDTH) - 1))  \
>                        << BUG_DISP_WIDTH),                      \
>      [bf_line_hi] "i" (((line) >> BUG_LINE_LO_WIDTH) << BUG_DISP_WIDTH)
> 
> #define BUG_FRAME(type, line, ptr, second_frame, msg) do {     \
>      __asm__ __volatile__ ( _ASM_BUGFRAME_TEXT(second_frame)    \
>                     :: _ASM_BUGFRAME_INFO(type, line, ptr, msg) ); \
> } while (0)
>                            ....
> 
> 
> But if add ".long %c[bf_ptr]\n" then the following compilation error
> will occur: [ error: invalid 'asm': invalid use of '%c'. ]
> 
> If you look at the dissembler of _bug_frames_...
>                                 ......
>      80201010:   1010                    addi    a2,sp,32   # .Lfrm%=
>      80201012:   8020                    .2byte  0x8020
>      80201014:   5555                    li      a0,-11
>      80201016:   5555                    li      a0,-11
>      80201018:   3022                    .2byte  0x3022  # .Lbug%=
>      8020101a:   8020                    .2byte  0x8020
>      8020101c:   5555                    li      a0,-11
>      8020101e:   5555                    li      a0,-11
>      80201020:   0000                    unimp          # %c[bf_line_hi]
>      80201022:   0000                    unimp
>      80201024:   5555                    li      a0,-11
>      80201026:   5555                    li      a0,-11
>      80201028:   0000                    unimp           # %[bf_line_hi]
>      8020102a:   0000                    unimp
>      8020102c:   5555                    li      a0,-11
>      8020102e:   5555                    li      a0,-11
>      80201030:   0000                    unimp           # %[bf_line_lo]
>      80201032:   1600                    addi    s0,sp,800
>      80201034:   5555                    li      a0,-11
>      80201036:   5555                    li      a0,-11
>      80201038:   10b8                    addi    a4,sp,104   # %[bf_ptr]
>      8020103a:   8020                    .2byte  0x8020
>      8020103c:   5555                    li      a0,-11
>      8020103e:   5555                    li      a0,-11
>      80201040:   2012                    .2byte  0x2012   # (.Lbug%= -
> .Lfrm%=) + %c[bf_line_hi]
>                                 .....
> ... it looks like the error will be generated if the name in %c[name]
> isn't equal to 0.
> 
> Another thing I noticed is that %[name] can be used instead of %c[name]
> for RISC-V ( i did a quick check and it works) so it is still possible
> to follow Intel implementation but required a redefinition of
> _ASM_BUGFRAME_TEXT where %c[...] won't be used. All the rest will be
> the same as in x86 implementation:
>                                  .....
> #define _ASM_BUGFRAME_TEXT(second_frame)                      \
>      ".Lbug%=: ebreak\n"                                       \
>      ".pushsection .bug_frames.%[bf_type], \"a\", @progbits\n" \
>      ".p2align 2\n"                                            \
>      ".Lfrm%=:\n"                                              \
>      ".long (.Lbug%= - .Lfrm%=) + %[bf_line_hi]\n"             \
>      ".long (%[bf_ptr] - .Lfrm%=) + %[bf_line_lo]\n"           \
>      ".if " #second_frame "\n"                                 \
>      ".long 0, %[bf_msg] - .Lfrm%=\n"                          \
>      ".endif\n"                                                \
>      ".popsection\n"                                           \
>                                   .....
> 
> One thing I would like to ask you is why it's better to follow/use x86
> implementation instead of ARM?

IMHO, the x86 version is cleaner. But...

> It seems that "%c[...]" has the best support only for Intel GCC and
> thereby ARM implementation looks more universal, doesn't it?

... you are right, the Arm version is more portable. Although, I do 
wonder how GCC managed to have a different behavior between architecture 
as I would have expected %c to be a generic implementation.

Anyway, if you are basing on the Arm one, then you should be able to
  1) move arch/arm/include/asm/bug.h in asm-generic/bug.h (or similar)
  2) Rename the guard and remove arm specific code.(I am not sure from 
where to include arm{32, 64}/bug.h)
  3) Define BUG_INSTR to ebreak on RISC-V.
  4) Find a place for all the RISC-V specific header
  5) Move do_bug_frame() in common/bug.c

I am happy to help testing the Arm version and/or help moving the code 
to common.

Cheers,

-- 
Julien Grall

