Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5086D29BD
	for <lists+xen-devel@lfdr.de>; Fri, 31 Mar 2023 23:05:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517045.802047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1piLvw-0004Xz-KS; Fri, 31 Mar 2023 21:05:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517045.802047; Fri, 31 Mar 2023 21:05:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1piLvw-0004Uc-HI; Fri, 31 Mar 2023 21:05:16 +0000
Received: by outflank-mailman (input) for mailman id 517045;
 Fri, 31 Mar 2023 21:05:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1piLvv-0004UU-5T
 for xen-devel@lists.xenproject.org; Fri, 31 Mar 2023 21:05:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1piLvu-0001oI-JF; Fri, 31 Mar 2023 21:05:14 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1piLvu-0007kE-Bn; Fri, 31 Mar 2023 21:05:14 +0000
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
	bh=NjeBsEH+C7JxdiTIUMhlfWn669UNcYMu2mEBcWk9lFg=; b=FhKfV347VrlYobvsFljdsY+9S5
	fJDMT6LrJWwSWpipNBpLdTZ47bXWD2XmSPqCFjNaAZo19ckk1kEAH8YeMsRaxKVVM7tJse0pkpImk
	VTC6yYxD2tGwQGuhGwMwXb0e7xP+Fv07PegiNc5NZtbfVtvyOHNMKcZsqkVULdipDS70=;
Message-ID: <3a94ad32-159d-d06f-cba6-3bb40f9f2085@xen.org>
Date: Fri, 31 Mar 2023 22:05:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH v9 4/5] xen/arm: switch ARM to use generic implementation
 of bug.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1680086655.git.oleksii.kurochko@gmail.com>
 <8fdb98350ae4fc6029738d0aabe13a57e1945a50.1680086655.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8fdb98350ae4fc6029738d0aabe13a57e1945a50.1680086655.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

I was going to ack the patch but then I spotted something that would 
want some clarification.

On 29/03/2023 11:50, Oleksii Kurochko wrote:
> diff --git a/xen/arch/arm/include/asm/bug.h b/xen/arch/arm/include/asm/bug.h
> index cacaf014ab..3fb0471a9b 100644
> --- a/xen/arch/arm/include/asm/bug.h
> +++ b/xen/arch/arm/include/asm/bug.h
> @@ -1,6 +1,24 @@
>   #ifndef __ARM_BUG_H__
>   #define __ARM_BUG_H__
>   
> +/*
> + * Please do not include in the header any header that might
> + * use BUG/ASSERT/etc maros asthey will be defined later after
> + * the return to <xen/bug.h> from the current header:
> + *
> + * <xen/bug.h>:
> + *  ...
> + *   <asm/bug.h>:
> + *     ...
> + *     <any_header_which_uses_BUG/ASSERT/etc macros.h>
> + *     ...
> + *  ...
> + *  #define BUG() ...
> + *  ...
> + *  #define ASSERT() ...
> + *  ...
> + */
> +
>   #include <xen/types.h>
>   
>   #if defined(CONFIG_ARM_32)
> @@ -11,76 +29,7 @@
>   # error "unknown ARM variant"
>   #endif
>   
> -#define BUG_FRAME_STRUCT
> -
> -struct bug_frame {
> -    signed int loc_disp;    /* Relative address to the bug address */
> -    signed int file_disp;   /* Relative address to the filename */
> -    signed int msg_disp;    /* Relative address to the predicate (for ASSERT) */
> -    uint16_t line;          /* Line number */
> -    uint32_t pad0:16;       /* Padding for 8-bytes align */
> -};
> -
> -#define bug_loc(b) ((const void *)(b) + (b)->loc_disp)
> -#define bug_file(b) ((const void *)(b) + (b)->file_disp);
> -#define bug_line(b) ((b)->line)
> -#define bug_msg(b) ((const char *)(b) + (b)->msg_disp)
> -
> -/* Many versions of GCC doesn't support the asm %c parameter which would
> - * be preferable to this unpleasantness. We use mergeable string
> - * sections to avoid multiple copies of the string appearing in the
> - * Xen image. BUGFRAME_run_fn needs to be handled separately.
> - */

Given this comment ...

> -#define BUG_FRAME(type, line, file, has_msg, msg) do {                      \
> -    BUILD_BUG_ON((line) >> 16);                                             \
> -    BUILD_BUG_ON((type) >= BUGFRAME_NR);                                    \
> -    asm ("1:"BUG_INSTR"\n"                                                  \
> -         ".pushsection .rodata.str, \"aMS\", %progbits, 1\n"                \
> -         "2:\t.asciz " __stringify(file) "\n"                               \
> -         "3:\n"                                                             \
> -         ".if " #has_msg "\n"                                               \
> -         "\t.asciz " #msg "\n"                                              \
> -         ".endif\n"                                                         \
> -         ".popsection\n"                                                    \
> -         ".pushsection .bug_frames." __stringify(type) ", \"a\", %progbits\n"\
> -         "4:\n"                                                             \
> -         ".p2align 2\n"                                                     \
> -         ".long (1b - 4b)\n"                                                \
> -         ".long (2b - 4b)\n"                                                \
> -         ".long (3b - 4b)\n"                                                \
> -         ".hword " __stringify(line) ", 0\n"                                \
> -         ".popsection");                                                    \
> -} while (0)
> -
> -/*
> - * GCC will not allow to use "i"  when PIE is enabled (Xen doesn't set the
> - * flag but instead rely on the default value from the compiler). So the
> - * easiest way to implement run_in_exception_handler() is to pass the to
> - * be called function in a fixed register.
> - */
> -#define  run_in_exception_handler(fn) do {                                  \
> -    asm ("mov " __stringify(BUG_FN_REG) ", %0\n"                            \
> -         "1:"BUG_INSTR"\n"                                                  \
> -         ".pushsection .bug_frames." __stringify(BUGFRAME_run_fn) ","       \
> -         "             \"a\", %%progbits\n"                                 \
> -         "2:\n"                                                             \
> -         ".p2align 2\n"                                                     \
> -         ".long (1b - 2b)\n"                                                \
> -         ".long 0, 0, 0\n"                                                  \
> -         ".popsection" :: "r" (fn) : __stringify(BUG_FN_REG) );             \
> -} while (0)
> -
> -#define WARN() BUG_FRAME(BUGFRAME_warn, __LINE__, __FILE__, 0, "")
> -
> -#define BUG() do {                                              \
> -    BUG_FRAME(BUGFRAME_bug,  __LINE__, __FILE__, 0, "");        \
> -    unreachable();                                              \
> -} while (0)
> -
> -#define assert_failed(msg) do {                                 \
> -    BUG_FRAME(BUGFRAME_assert, __LINE__, __FILE__, 1, msg);     \
> -    unreachable();                                              \
> -} while (0)
> +#define BUG_ASM_CONST   "c"

... you should explain in the commit message why this is needed and the 
problem described above is not a problem anymore.

For instance, I managed to build it without 'c' on arm64 [1]. But it 
does break on arm32 [2]. I know that Arm is also where '%c' was an issue.

Skimming through linux, the reason seems to be that GCC may add '#' when 
it should not. That said, I haven't look at the impact on the generic 
implementation. Neither I looked at which version may be affected (the 
original message was from 2011).

However, without an explanation, I am afraid this can't go in because I 
am worry we may break some users (thankfully that might just be a 
compilation issues rather than weird behavior).

Bertrand, Stefano, do you know if this is still an issue?

Cheers,

[1] aarch64-linux-gnu-gcc (Linaro GCC 7.5-2019.12) 7.5.0
[2] arm-none-linux-gnueabihf-gcc (GNU Toolchain for the A-profile 
Architecture 10.3-2021.07 (arm-10.29)) 10.3.1 20210621

-- 
Julien Grall

