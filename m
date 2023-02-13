Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D082D6946D0
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 14:20:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494490.764568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRYk0-0007IO-EG; Mon, 13 Feb 2023 13:19:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494490.764568; Mon, 13 Feb 2023 13:19:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRYk0-0007F7-Aw; Mon, 13 Feb 2023 13:19:32 +0000
Received: by outflank-mailman (input) for mailman id 494490;
 Mon, 13 Feb 2023 13:19:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pRYjz-0007F1-1V
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 13:19:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pRYjw-0006D6-MD; Mon, 13 Feb 2023 13:19:28 +0000
Received: from [54.239.6.185] (helo=[192.168.15.251])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pRYjw-0003Lm-Fx; Mon, 13 Feb 2023 13:19:28 +0000
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
	bh=yhGpZgnntPpRs8Hh5jCyIam4Ay/fHr95E6vic4Pnb3M=; b=cqV/1y/Q0mKTkgNf9Tyz80Kq71
	ASvZ6Ave0hB0Ph8nnd0jyQLQmzdxaQpucP6UGhHLZiXuiesUwx2Bsj1YHTqHnP8mk8uy6HODRZY2S
	B0VRqDykKezORqHO5gV59SCnTTAv1LY/xLNjELvqfvAHuxipLhd8XeZkz4ENzHkqtsL0=;
Message-ID: <64aba76d-1746-9f6c-109a-e8c3bf1e1b61@xen.org>
Date: Mon, 13 Feb 2023 13:19:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.1
Subject: Re: [PATCH v1 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1675441720.git.oleksii.kurochko@gmail.com>
 <8adf4aeff96750982e3d670cb3aed11553d546d5.1675441720.git.oleksii.kurochko@gmail.com>
 <199fa5a6-ca31-091e-88e0-cae9efde307b@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <199fa5a6-ca31-091e-88e0-cae9efde307b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 13/02/2023 12:24, Jan Beulich wrote:
> On 03.02.2023 18:05, Oleksii Kurochko wrote:
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -92,6 +92,12 @@ config STATIC_MEMORY
>>   
>>   	  If unsure, say N.
>>   
>> +config GENERIC_DO_BUG_FRAME
>> +	bool
>> +	help
>> +	  Generic do_bug_frame() function is needed to handle the type of bug
>> +	  frame and print an information about it.
> 
> Generally help text for prompt-less functions is not very useful. Assuming
> it is put here to inform people actually reading the source file, I'm okay
> for it to be left here, but please at least drop the stray "an". I also
> think this may want moving up in the file, e.g. ahead of all the HAS_*
> controls (which, as you will notice, all have no help text either). Plus
> finally how about shorter and more applicable GENERIC_BUG_FRAME - after
> all what becomes generic is more than just do_bug_frame()?
> 
>> --- /dev/null
>> +++ b/xen/common/bug.c
>> @@ -0,0 +1,88 @@
>> +#include <xen/bug.h>
>> +#include <xen/errno.h>
>> +#include <xen/types.h>
>> +#include <xen/kernel.h>
> 
> Please order headers alphabetically unless there's anything preventing
> that from being done.
> 
>> +#include <xen/string.h>
>> +#include <xen/virtual_region.h>
>> +
>> +#include <asm/processor.h>
>> +
>> +int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc)
> 
> I know Arm is using vaddr_t and RISC-V now also has it, but in UNIX-like
> environments that's redundant with "unsigned long", and it's also
> redundant with C99's uintptr_t. Hence when seeing the type I always
> wonder whether it's really a host virtual address which is meant (and
> not perhaps a guest one, which in principle could differ from the host
> one for certain guest types). In any event the existence of this type
> should imo not be a prereq to using this generic piece of infrastructure

C spec aside, the use "unsigned long" is quite overloaded within Xen. 
Although, this has improved since we introduced mfn_t/gfn_t.

In the future, I could imagine us to also introduce typesafe for 
vaddr_t, reducing further the risk to mix different meaning of unsigned 
long.

Therefore, I think the introduction of vaddr_t should be a prereq for 
using the generic piece of infrastructure.

> 
>> +{
>> +    const struct bug_frame *bug = NULL;
>> +    const char *prefix = "", *filename, *predicate;
>> +    unsigned long fixup;
>> +    int id = -1, lineno;
> 
> For both of these I question them needing to be of a signed type.
> 
>> +    const struct virtual_region *region;
>> +
>> +    region = find_text_region(pc);
>> +    if ( region )
>> +    {
>> +        for ( id = 0; id < BUGFRAME_NR; id++ )
>> +        {
>> +            const struct bug_frame *b;
>> +            unsigned int i;
>> +
>> +            for ( i = 0, b = region->frame[id].bugs;
>> +                  i < region->frame[id].n_bugs; b++, i++ )
>> +            {
>> +                if ( ((vaddr_t)bug_loc(b)) == pc )
> 
> Afaics this is the sole use of bug_loc(). If so, better change the macro
> to avoid the need for a cast here:
> 
> #define bug_loc(b) ((unsigned long)(b) + (b)->loc_disp)
> 
>> --- /dev/null
>> +++ b/xen/include/xen/bug.h
>> @@ -0,0 +1,127 @@
>> +#ifndef __XEN_BUG_H__
>> +#define __XEN_BUG_H__
>> +
>> +#define BUG_DISP_WIDTH    24
>> +#define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
>> +#define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
>> +
>> +#define BUGFRAME_run_fn 0
>> +#define BUGFRAME_warn   1
>> +#define BUGFRAME_bug    2
>> +#define BUGFRAME_assert 3
>> +
>> +#define BUGFRAME_NR     4
>> +
>> +#ifndef __ASSEMBLY__
>> +
>> +#include <xen/errno.h>
>> +#include <xen/stringify.h>
>> +#include <xen/types.h>
>> +#include <xen/lib.h>
> 
> Again - please sort headers.
> 
>> +#include <asm/bug.h>
>> +
>> +#ifndef BUG_FRAME_STUFF
>> +struct bug_frame {
> 
> Please can we have a blank line between the above two ones and then similarly
> ahead of the #endif?
> 
>> +    signed int loc_disp;    /* Relative address to the bug address */
>> +    signed int file_disp;   /* Relative address to the filename */
>> +    signed int msg_disp;    /* Relative address to the predicate (for ASSERT) */
>> +    uint16_t line;          /* Line number */
>> +    uint32_t pad0:16;       /* Padding for 8-bytes align */
> 
> Already the original comment in Arm code is wrong: The padding doesn't
> guarantee 8-byte alignment; it merely guarantees a multiple of 8 bytes
> size.
> Aiui there's also no need for 8-byte alignment anywhere here (in
> fact there's ".p2align 2" in the generator macros).

I would rather keep the pad0 here.

> 
> I also wonder why this needs to be a named bitfield: Either make it
> plain uint16_t, or if you use a bitfield, then omit the name.

Everything you seem to suggest are clean ups. So I think it would be 
better if they are first applied to Arm and then we move the code to 
common afterwards.

This will make easier to confirm what changed and also tracking the 
history (think git blame).

That said, I don't view the clean-ups as necessary in order to move the 
code in common... They could be done afterwards by Oleksii or someone else.

> 
>> +};
>> +
>> +#define bug_loc(b) ((const void *)(b) + (b)->loc_disp)
>> +#define bug_file(b) ((const void *)(b) + (b)->file_disp);
>> +#define bug_line(b) ((b)->line)
>> +#define bug_msg(b) ((const char *)(b) + (b)->msg_disp)
>> +#endif /* BUG_FRAME_STUFF */
>> +
>> +#ifndef BUG_FRAME
>> +/* Many versions of GCC doesn't support the asm %c parameter which would
>> + * be preferable to this unpleasantness. We use mergeable string
>> + * sections to avoid multiple copies of the string appearing in the
>> + * Xen image. BUGFRAME_run_fn needs to be handled separately.
>> + */
> 
> When generalizing the logic, I wonder in how far the comment doesn't
> want re-wording some. For example, while Arm prefixes constant insn
> operands with # (and x86 uses $), there's no such prefix in RISC-V. At
> which point there's no need to use %c in the first place. (Which in
> turn means x86'es more compact representation may also be usable there.
> And yet in turn the question arises whether RISC-V wouldn't better have
> its own derivation of the machinery, rather than trying to generalize
> things. RISC-V's would then likely be closer to x86'es, just without
> the use of %c on asm() operands. Which might then suggest to rather
> generalize x86'es variant down the road.)
> 
> At the very least the comment's style wants correcting, and in the first
> sentence s/doesn't/don't/. Also %c isn't a parameter, but a modifier.
> 
>> +#define BUG_FRAME(type, line, file, has_msg, msg) do {                      \
>> +    BUILD_BUG_ON((line) >> 16);                                             \
>> +    BUILD_BUG_ON((type) >= BUGFRAME_NR);                                    \
>> +    asm ("1:"BUG_INSTR"\n"                                                  \
> 
> Nit: Style (missing blank after opening parenthesis, and then also at the
> end of the construct ahead of the closing parenthesis).
> 
>> +         ".pushsection .rodata.str, \"aMS\", %progbits, 1\n"                \
>> +         "2:\t.asciz " __stringify(file) "\n"                               \
> 
> file is always a string literal; really it always is __FILE__ in this
> non-x86 implementation. So first preference ought to be to drop the
> macro parameter and use __FILE__ here (same then for line vs __LINE__).
> Yet even if not done like that, the __stringify() is largely unneeded
> (unless we expect file names to have e.g. backslashes in their names)
> and looks somewhat odd here. So how about
> 
>           "2:\t.asciz \"" __FILE__ "\"\n"
> 
> ? But wait - peeking ahead to the x86 patch I notice that __FILE__ and
> __LINE__ need to remain arguments. But then the second preference would
> still be
> 
>           "2:\t.asciz \"" file "\"\n"
> 
> imo. Yet maybe others disagree ...

I would prefer to keep the __stringify() version because it avoids 
relying on file to always be a string literal.

[...]

-- 
Julien Grall

