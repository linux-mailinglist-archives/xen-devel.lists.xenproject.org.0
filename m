Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E0D2D9634
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 11:18:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52086.91142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kokve-0001rq-Ff; Mon, 14 Dec 2020 10:18:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52086.91142; Mon, 14 Dec 2020 10:18:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kokve-0001rD-9R; Mon, 14 Dec 2020 10:18:06 +0000
Received: by outflank-mailman (input) for mailman id 52086;
 Mon, 14 Dec 2020 10:18:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kokvc-0001qd-L0
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 10:18:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kokvZ-0002rT-RI; Mon, 14 Dec 2020 10:18:01 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kokvZ-0005Wl-DA; Mon, 14 Dec 2020 10:18:01 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=H1AcoxOBU4DYwP+eHZO1DuAmYUYc/viR9r4DPmmJ4nU=; b=vnhC/YsmIeVUpBOx6kIpVky1Uw
	0hZWClr6ECKsM3sOkNwvMnoRf2rwTxB+t4yYAnYYKQXtKmW87B0kiowwI+oLb1snDX1QQfrxLdxvp
	O6TBaocVqavRBVKXIsoqU7VvoS64EG+wRjGJ9uf2Ewk5FvGMorkCwiAXWGfFHdLELhP4=;
Subject: Re: [PATCH v4 1/3] xen/arm: add support for
 run_in_exception_handler()
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20201214075615.25038-1-jgross@suse.com>
 <20201214075615.25038-2-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <9d3f8583-cfba-0174-3275-b418648f3f31@xen.org>
Date: Mon, 14 Dec 2020 10:17:58 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201214075615.25038-2-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 14/12/2020 07:56, Juergen Gross wrote:
> Add support to run a function in an exception handler for Arm. Do it
> the same way as on x86 via a bug_frame.
> 
> Unfortunately inline assembly on Arm seems to be less capable than on
> x86, leading to functions called via run_in_exception_handler() having
> to be globally visible.

Jan already commented on this, so I am not going to comment again.

> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V4:
> - new patch
> 
> I have verified the created bugframe is correct by inspecting the
> created binary.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   xen/arch/arm/traps.c       | 10 +++++++++-
>   xen/drivers/char/ns16550.c |  3 ++-
>   xen/include/asm-arm/bug.h  | 32 +++++++++++++++++++++-----------
>   3 files changed, 32 insertions(+), 13 deletions(-)
> 
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 22bd1bd4c6..6e677affe2 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -1236,8 +1236,16 @@ int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc)
>       if ( !bug )
>           return -ENOENT;
>   
> +    if ( id == BUGFRAME_run_fn )
> +    {
> +        void (*fn)(const struct cpu_user_regs *) = bug_ptr(bug);
> +
> +        fn(regs);
> +        return 0;
> +    }
> +
>       /* WARN, BUG or ASSERT: decode the filename pointer and line number. */
> -    filename = bug_file(bug);
> +    filename = bug_ptr(bug);
>       if ( !is_kernel(filename) )
>           return -EINVAL;
>       fixup = strlen(filename);
> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> index 9235d854fe..dd6500acc8 100644
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -192,7 +192,8 @@ static void ns16550_interrupt(
>   /* Safe: ns16550_poll() runs as softirq so not reentrant on a given CPU. */
>   static DEFINE_PER_CPU(struct serial_port *, poll_port);
>   
> -static void __ns16550_poll(struct cpu_user_regs *regs)
> +/* run_in_exception_handler() on Arm requires globally visible symbol. */
> +void __ns16550_poll(struct cpu_user_regs *regs)
>   {
>       struct serial_port *port = this_cpu(poll_port);
>       struct ns16550 *uart = port->uart;
> diff --git a/xen/include/asm-arm/bug.h b/xen/include/asm-arm/bug.h
> index 36c803357c..a7da2c306f 100644
> --- a/xen/include/asm-arm/bug.h
> +++ b/xen/include/asm-arm/bug.h
> @@ -15,34 +15,38 @@
>   
>   struct bug_frame {
>       signed int loc_disp;    /* Relative address to the bug address */
> -    signed int file_disp;   /* Relative address to the filename */
> +    signed int ptr_disp;    /* Relative address to the filename or function */
>       signed int msg_disp;    /* Relative address to the predicate (for ASSERT) */
>       uint16_t line;          /* Line number */
>       uint32_t pad0:16;       /* Padding for 8-bytes align */
>   };
>   
>   #define bug_loc(b) ((const void *)(b) + (b)->loc_disp)
> -#define bug_file(b) ((const void *)(b) + (b)->file_disp);
> +#define bug_ptr(b) ((const void *)(b) + (b)->ptr_disp);
>   #define bug_line(b) ((b)->line)
>   #define bug_msg(b) ((const char *)(b) + (b)->msg_disp)
>   
> -#define BUGFRAME_warn   0
> -#define BUGFRAME_bug    1
> -#define BUGFRAME_assert 2
> +#define BUGFRAME_run_fn 0
> +#define BUGFRAME_warn   1
> +#define BUGFRAME_bug    2
> +#define BUGFRAME_assert 3

Why did you renumber it? IOW, why can't BUGFRAME_run_fn be defined as 3?

>   
> -#define BUGFRAME_NR     3
> +#define BUGFRAME_NR     4
>   
>   /* Many versions of GCC doesn't support the asm %c parameter which would
>    * be preferable to this unpleasantness. We use mergeable string
>    * sections to avoid multiple copies of the string appearing in the
>    * Xen image.
>    */
> -#define BUG_FRAME(type, line, file, has_msg, msg) do {                      \
> +#define BUG_FRAME(type, line, ptr, ptr_is_file, has_msg, msg) do {          \
>       BUILD_BUG_ON((line) >> 16);                                             \
>       BUILD_BUG_ON((type) >= BUGFRAME_NR);                                    \
>       asm ("1:"BUG_INSTR"\n"                                                  \
>            ".pushsection .rodata.str, \"aMS\", %progbits, 1\n"                \
> -         "2:\t.asciz " __stringify(file) "\n"                               \
> +         "2:\n"                                                             \
> +         ".if " #ptr_is_file "\n"                                           \
> +         "\t.asciz " __stringify(ptr) "\n"                                  \
> +         ".endif\n"                                                         \
>            "3:\n"                                                             \
>            ".if " #has_msg "\n"                                               \
>            "\t.asciz " #msg "\n"                                              \
> @@ -52,21 +56,27 @@ struct bug_frame {
>            "4:\n"                                                             \
>            ".p2align 2\n"                                                     \
>            ".long (1b - 4b)\n"                                                \
> +         ".if " #ptr_is_file "\n"                                           \
>            ".long (2b - 4b)\n"                                                \
> +         ".else\n"                                                          \
> +         ".long (" #ptr " - 4b)\n"                                          \
> +         ".endif\n"                                                         \
>            ".long (3b - 4b)\n"                                                \
>            ".hword " __stringify(line) ", 0\n"                                \
>            ".popsection");                                                    \
>   } while (0)
>   
> -#define WARN() BUG_FRAME(BUGFRAME_warn, __LINE__, __FILE__, 0, "")
> +#define run_in_exception_handler(fn) BUG_FRAME(BUGFRAME_run_fn, 0, fn, 0, 0, "")
> +
> +#define WARN() BUG_FRAME(BUGFRAME_warn, __LINE__, __FILE__, 1, 0, "")
>   
>   #define BUG() do {                                              \
> -    BUG_FRAME(BUGFRAME_bug,  __LINE__, __FILE__, 0, "");        \
> +    BUG_FRAME(BUGFRAME_bug,  __LINE__, __FILE__, 1, 0, "");        \
>       unreachable();                                              \
>   } while (0)
>   
>   #define assert_failed(msg) do {                                 \
> -    BUG_FRAME(BUGFRAME_assert, __LINE__, __FILE__, 1, msg);     \
> +    BUG_FRAME(BUGFRAME_assert, __LINE__, __FILE__, 1, 1, msg);     \
>       unreachable();                                              \
>   } while (0)
>   
> 

Cheers,

-- 
Julien Grall

