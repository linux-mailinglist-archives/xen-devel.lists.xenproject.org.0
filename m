Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 052EE6A2AD1
	for <lists+xen-devel@lfdr.de>; Sat, 25 Feb 2023 17:42:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501785.773535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVxd3-0005W4-7y; Sat, 25 Feb 2023 16:42:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501785.773535; Sat, 25 Feb 2023 16:42:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVxd3-0005Tn-55; Sat, 25 Feb 2023 16:42:33 +0000
Received: by outflank-mailman (input) for mailman id 501785;
 Sat, 25 Feb 2023 16:42:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pVxd1-0005Tf-Vm
 for xen-devel@lists.xenproject.org; Sat, 25 Feb 2023 16:42:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pVxd0-00049j-Tq; Sat, 25 Feb 2023 16:42:30 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pVxd0-0002gT-OD; Sat, 25 Feb 2023 16:42:30 +0000
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
	bh=zBYlJBA1NLaIn0qaYHm2AZKC1IEtjOOvmQucoWd7Kc8=; b=rg7oF/KkUt9fUuYmqZGC1+05KO
	61uA7WUqxVq4tKfPoD5lG2uDRZ4SJ+FxBTDkePL/2WKNUOMj+W5MgyAtdrqcibAzgFFVhjf9xt+LB
	6802QHtqDYUosUUUD4c1u0IWG0O8SiHqqxnF3JoY87MTX5lKmGG30YveW6P8jmiWio9A=;
Message-ID: <8734edd9-70eb-b2bd-8763-b7468d7caba3@xen.org>
Date: Sat, 25 Feb 2023 16:42:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1677233393.git.oleksii.kurochko@gmail.com>
 <932b0fd2a211d2d837d00e1bda87a84ad680fe7b.1677233393.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
In-Reply-To: <932b0fd2a211d2d837d00e1bda87a84ad680fe7b.1677233393.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 24/02/2023 11:31, Oleksii Kurochko wrote:
> A large part of the content of the bug.h is repeated among all
> architectures, so it was decided to create a new config
> CONFIG_GENERIC_BUG_FRAME.
> 
> The version of <bug.h> from x86 was taken as the base version.
> 
> The patch introduces the following stuff:
>    * common bug.h header
>    * generic implementation of do_bug_frame
>    * new config CONFIG_GENERIC_BUG_FRAME
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V3:
>   * Add debugger_trap_fatal() to do_bug_frame(). It simplifies usage of
>     do_bug_frame() for x86 so making handle_bug_frame() and find_bug_frame()
>     not needed anymore.
>   * Update do_bug_frame() to return -EINVAL if something goes wrong; otherwise
>     id of bug_frame
>   * Update _ASM_BUGFRAME_TEXT to make it more portable.
>   * Drop unnecessary comments.
>   * define stub value for TRAP_invalid_op in case if wasn't defined in
>     arch-specific folders.
> ---
> Changes in V2:
>    - Switch to x86 implementation as generic as it is more compact
>      ( at least from the point of view of bug frame structure ).
>    - Rename CONFIG_GENERIC_DO_BUG_FRAME to CONFIG_GENERIC_BUG_FRAME.
>    - Change the macro bug_loc(b) to avoid the need for a cast:
>      #define bug_loc(b) ((unsigned long)(b) + (b)->loc_disp)
>    - Rename BUG_FRAME_STUFF to BUG_FRAME_STRUCT
>    - Make macros related to bug frame structure more generic.
>    - Introduce BUG_INSTR and MODIFIER to make _ASM_BUGFRAME_TEXT reusable
>      between x86 and RISC-V.
>    - Rework do_bug_frame() and introduce find_bug_frame() and handle_bug_frame()
>      functions to make it reusable by x86.
>    - code style fixes
> ---
>   xen/common/Kconfig    |   3 +
>   xen/common/Makefile   |   1 +
>   xen/common/bug.c      | 109 ++++++++++++++++++++++++++++++
>   xen/include/xen/bug.h | 150 ++++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 263 insertions(+)
>   create mode 100644 xen/common/bug.c
>   create mode 100644 xen/include/xen/bug.h
> 
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index f1ea3199c8..b226323537 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -28,6 +28,9 @@ config ALTERNATIVE_CALL
>   config ARCH_MAP_DOMAIN_PAGE
>   	bool
>   
> +config GENERIC_BUG_FRAME
> +	bool
> +
>   config HAS_ALTERNATIVE
>   	bool
>   
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index bbd75b4be6..46049eac35 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -1,5 +1,6 @@
>   obj-$(CONFIG_ARGO) += argo.o
>   obj-y += bitmap.o
> +obj-$(CONFIG_GENERIC_BUG_FRAME) += bug.o
>   obj-$(CONFIG_HYPFS_CONFIG) += config_data.o
>   obj-$(CONFIG_CORE_PARKING) += core_parking.o
>   obj-y += cpu.o
> diff --git a/xen/common/bug.c b/xen/common/bug.c
> new file mode 100644
> index 0000000000..f81724fc9b
> --- /dev/null
> +++ b/xen/common/bug.c
> @@ -0,0 +1,109 @@
> +#include <xen/bug.h>
> +#include <xen/debugger.h>
> +#include <xen/errno.h>
> +#include <xen/kernel.h>
> +#include <xen/livepatch.h> > +#include <xen/string.h>
> +#include <xen/types.h>
> +#include <xen/virtual_region.h>
> +
> +#include <asm/processor.h>
> +
> +/* Set default value for TRAP_invalid_op as it is defined only for X86 now */
> +#ifndef TRAP_invalid_op
> +#define TRAP_invalid_op 0
> +#endif

It feels to me that this value should be defined in the else part in 
xen/debugger.h.

> +
> +int do_bug_frame(const struct cpu_user_regs *regs, unsigned long pc)

I would suggest to document what this function is meant to return. 
AFAUI, it would return a negative value in case of an error otherwise 
the bug type.

> +{
> +    const struct bug_frame *bug = NULL;
> +    const struct virtual_region *region;
> +    const char *prefix = "", *filename, *predicate;
> +    unsigned long fixup;
> +    unsigned int id = BUGFRAME_NR, lineno;
> +
> +    region = find_text_region(pc);
> +    if ( region )

NIT: If you invert the condition here, then you can reduce the indention 
by one below.

> +    {
> +        for ( id = 0; id < BUGFRAME_NR; id++ )
> +        {
> +            const struct bug_frame *b;
> +            unsigned int i;

You compare this against n_bugs which is a size_t. So, this wants to be 
a size_t.

> +
> +            for ( i = 0, b = region->frame[id].bugs;
> +                  i < region->frame[id].n_bugs; b++, i++ )
> +            {
> +                if ( bug_loc(b) == pc )
> +                {
> +                    bug = b;
> +                    goto found;
> +                }
> +            }
> +        }
> +    }
> +
> + found:
> +    if ( !bug )
> +        return -EINVAL;
> +
> +    if ( id == BUGFRAME_run_fn )
> +    {
> +#ifdef BUG_FN_REG
> +        void (*fn)(const struct cpu_user_regs *) = (void *)regs->BUG_FN_REG;

AFAIU, this is necessary so Arm can use the generic do_bug_frame().

I was under the impression that RISC-V and Arm had the similar issue 
with %c. It seems like you managed to resolve it on RISC-V, so can we 
fully switch Arm to the generic implementation of bug?

> +#else
> +        void (*fn)(const struct cpu_user_regs *) = bug_ptr(bug);
> +#endif
> +
> +        fn(regs);
> +
> +        return id;
> +    }
> +
> +    /* WARN, BUG or ASSERT: decode the filename pointer and line number. */
> +    filename = bug_ptr(bug);
> +    if ( !is_kernel(filename) && !is_patch(filename) )
> +        return -EINVAL;
> +    fixup = strlen(filename);
> +    if ( fixup > 50 )
> +    {
> +        filename += fixup - 47;
> +        prefix = "...";
> +    }
> +    lineno = bug_line(bug);
> +
> +    switch ( id )
> +    {
> +    case BUGFRAME_warn:
> +        printk("Xen WARN at %s%s:%d\n", prefix, filename, lineno);
> +        show_execution_state(regs);
> +
> +        return id;
> +
> +    case BUGFRAME_bug:
> +        printk("Xen BUG at %s%s:%d\n", prefix, filename, lineno);
> +
> +        if ( debugger_trap_fatal(TRAP_invalid_op, regs) )
> +            return id;
> +
> +        show_execution_state(regs);
> +        panic("Xen BUG at %s%s:%d\n", prefix, filename, lineno);
> +
> +    case BUGFRAME_assert:
> +        /* ASSERT: decode the predicate string pointer. */
> +        predicate = bug_msg(bug);
> +        if ( !is_kernel(predicate) && !is_patch(predicate) )
> +            predicate = "<unknown>";
> +
> +        printk("Assertion '%s' failed at %s%s:%d\n",
> +               predicate, prefix, filename, lineno);
> +
> +        if ( debugger_trap_fatal(TRAP_invalid_op, regs) )
> +            return id;
> +
> +        show_execution_state(regs);
> +        panic("Assertion '%s' failed at %s%s:%d\n",
> +              predicate, prefix, filename, lineno);
> +    }
> +
> +    return id;
> +}
> diff --git a/xen/include/xen/bug.h b/xen/include/xen/bug.h
> new file mode 100644
> index 0000000000..4b18cfa69c
> --- /dev/null
> +++ b/xen/include/xen/bug.h
> @@ -0,0 +1,150 @@
> +#ifndef __XEN_BUG_H__
> +#define __XEN_BUG_H__
> +
> +#define BUG_DISP_WIDTH    24
> +#define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
> +#define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
> +
> +#define BUGFRAME_run_fn 0
> +#define BUGFRAME_warn   1
> +#define BUGFRAME_bug    2
> +#define BUGFRAME_assert 3
> +
> +#define BUGFRAME_NR     4
> +
> +#include <asm/bug.h>
> +
> +#ifndef __ASSEMBLY__
> +
> +#include <xen/errno.h>

errno.h doesn't look to be used within this here. So is it necessary to 
import it?

> +#include <xen/lib.h>

Why is this necessary to include in the header?

> +#include <xen/stringify.h>

You don't seem to use __stringify in this header. So is this necessary?

> +
> +#ifndef BUG_FRAME_STRUCT
> +
> +struct bug_frame {
> +    signed int loc_disp:BUG_DISP_WIDTH;
> +    unsigned int line_hi:BUG_LINE_HI_WIDTH;
> +    signed int ptr_disp:BUG_DISP_WIDTH;
> +    unsigned int line_lo:BUG_LINE_LO_WIDTH;
> +    signed int msg_disp[];
> +};
> +
> +#endif /* BUG_FRAME_STRUCT */
> +
> +#ifndef bug_loc
> +#define bug_loc(b) ((unsigned long)(b) + (b)->loc_disp)
> +#endif
> +
> +#ifndef bug_ptr
> +#define bug_ptr(b) ((const void *)(b) + (b)->ptr_disp)
> +#endif
> +
> +#ifndef bug_line
> +#define bug_line(b) (((((b)->line_hi + ((b)->loc_disp < 0)) &                \
> +                       ((1 << BUG_LINE_HI_WIDTH) - 1)) <<                    \
> +                      BUG_LINE_LO_WIDTH) +                                   \
> +                     (((b)->line_lo + ((b)->ptr_disp < 0)) &                 \
> +                      ((1 << BUG_LINE_LO_WIDTH) - 1)))
> +#endif
> +
> +#ifndef bug_msg
> +#define bug_msg(b) ((const char *)(b) + (b)->msg_disp[1])
> +#endif

For all the macro above, it feels wrong to me to allow an architecture 
to override them if the default BUG_FRAME_STRUCT.

It would also feels wrong to me that if the default BUG_FRAME_STRUCT is 
not used to still partially rely on the generic version of the helper.\

So I would suggest to move them in the #ifndef BUG_FRAME_STRUCT and drop 
the #ifndef <helper>.

> +
> +#ifndef BUG_ASM_CONST
> +#define BUG_ASM_CONST ""
> +#endif

This line is a bit misterious to me. Would you be able to outline why an 
architecture would override this?

> +
> +#if !defined(_ASM_BUGFRAME_TEXT) || !defined(_ASM_BUGFRAME_INFO)
> +
> +#define _ASM_BUGFRAME_TEXT(second_frame)                                            \
> +    ".Lbug%=:"BUG_INSTR"\n"                                                         \
> +    "   .pushsection .bug_frames.%"BUG_ASM_CONST"[bf_type], \"a\", %%progbits\n"    \
> +    "   .p2align 2\n"                                                               \
> +    ".Lfrm%=:\n"                                                                    \
> +    "   .long (.Lbug%= - .Lfrm%=) + %"BUG_ASM_CONST"[bf_line_hi]\n"                 \
> +    "   .long (%"BUG_ASM_CONST"[bf_ptr] - .Lfrm%=) + %"BUG_ASM_CONST"[bf_line_lo]\n"\
> +    "   .if " #second_frame "\n"                                                    \
> +    "   .long 0, %"BUG_ASM_CONST"[bf_msg] - .Lfrm%=\n"                              \
> +    "   .endif\n"                                                                   \
> +    "   .popsection\n"
> +
> +#define _ASM_BUGFRAME_INFO(type, line, ptr, msg)                             \
> +    [bf_type]    "i" (type),                                                 \
> +    [bf_ptr]     "i" (ptr),                                                  \
> +    [bf_msg]     "i" (msg),                                                  \
> +    [bf_line_lo] "i" ((line & ((1 << BUG_LINE_LO_WIDTH) - 1))                \
> +                      << BUG_DISP_WIDTH),                                    \
> +    [bf_line_hi] "i" (((line) >> BUG_LINE_LO_WIDTH) << BUG_DISP_WIDTH)
> +
> +#endif /* _ASM_BUGFRAME_TEXT || _ASM_BUGFRAME_INFO */
> +
> +#ifndef BUG_FRAME
> +
> +#define BUG_FRAME(type, line, ptr, second_frame, msg) do {                   \
> +    BUILD_BUG_ON((line) >> (BUG_LINE_LO_WIDTH + BUG_LINE_HI_WIDTH));         \
> +    BUILD_BUG_ON((type) >= BUGFRAME_NR);                                     \
> +    asm volatile ( _ASM_BUGFRAME_TEXT(second_frame)                          \
> +                   :: _ASM_BUGFRAME_INFO(type, line, ptr, msg) );            \
> +} while (0)
> +
> +#endif
> +
> +#ifndef run_in_exception_handler
> +
> +/*
> + * TODO: untangle header dependences, break BUILD_BUG_ON() out of xen/lib.h,
> + * and use a real static inline here to get proper type checking of fn().
> + */
> +#define run_in_exception_handler(fn)                            \
> +    do {                                                        \
> +        (void)((fn) == (void (*)(struct cpu_user_regs *))NULL); \
> +        BUG_FRAME(BUGFRAME_run_fn, 0, fn, 0, NULL);             \
> +    } while ( 0 )
> +
> +#endif /* run_in_exception_handler */
> +
> +#ifndef WARN
> +#define WARN() BUG_FRAME(BUGFRAME_warn, __LINE__, __FILE__, 0, NULL)
> +#endif
> +
> +#ifndef BUG
> +#define BUG() do {                                              \
> +    BUG_FRAME(BUGFRAME_bug,  __LINE__, __FILE__, 0, NULL);      \
> +    unreachable();                                              \
> +} while (0)
> +#endif
> +
> +#ifndef assert_failed
> +#define assert_failed(msg) do {                                 \
> +    BUG_FRAME(BUGFRAME_assert, __LINE__, __FILE__, 1, msg);     \
> +    unreachable();                                              \
> +} while (0)
> +#endif
> +
> +#ifdef CONFIG_GENERIC_BUG_FRAME
> +
> +struct cpu_user_regs;
> +
> +int do_bug_frame(const struct cpu_user_regs *regs, unsigned long pc);
> +
> +#endif /* CONFIG_GENERIC_BUG_FRAME */
> +
> +extern const struct bug_frame __start_bug_frames[],
> +                              __stop_bug_frames_0[],
> +                              __stop_bug_frames_1[],
> +                              __stop_bug_frames_2[],
> +                              __stop_bug_frames_3[];
> +
> +#endif /* !__ASSEMBLY__ */
> +
> +#endif /* __XEN_BUG_H__ */
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */

Cheers,

-- 
Julien Grall

