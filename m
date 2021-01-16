Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D28EF2F8E3D
	for <lists+xen-devel@lfdr.de>; Sat, 16 Jan 2021 18:21:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69046.123749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0pEr-0003md-RA; Sat, 16 Jan 2021 17:19:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69046.123749; Sat, 16 Jan 2021 17:19:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0pEr-0003mE-O3; Sat, 16 Jan 2021 17:19:49 +0000
Received: by outflank-mailman (input) for mailman id 69046;
 Sat, 16 Jan 2021 17:19:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l0pEq-0003m9-Aj
 for xen-devel@lists.xenproject.org; Sat, 16 Jan 2021 17:19:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l0pEl-0008MS-V9; Sat, 16 Jan 2021 17:19:43 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l0pEl-0005fl-M5; Sat, 16 Jan 2021 17:19:43 +0000
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
	bh=+AKG8NJNNw7I2KAQ37BX7Ifm5MMAD9xubBnXskMfRhs=; b=Pbdxt7QvlPof9qx+tWORqvn03U
	S9oXDNHqD1aOKMe8VEj6lFC1BFoog1dI9p8ickmf829UxH7j3mQux2+TK5UNNl63xr5BCQhWAAgcL
	JIyyGfvH7UYluTNrASmYX4SA+Cuc5rpbw400lLHwI5B9Np4iW0TbxEGSYkVsAWpMLwfU=;
Subject: Re: [PATCH v6 1/3] xen/arm: add support for
 run_in_exception_handler()
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20210116103339.21708-1-jgross@suse.com>
 <20210116103339.21708-2-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <9e9b38bd-4ee2-0a28-29ec-7ac9ba19c873@xen.org>
Date: Sat, 16 Jan 2021 17:19:41 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210116103339.21708-2-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 16/01/2021 10:33, Juergen Gross wrote:
> Add support to run a function in an exception handler for Arm. Do it
> as on x86 via a bug_frame, but pass the function pointer via a
> register (this needs to be done that way, because inline asm support
> for 32-bit Arm lacks the needed functionality to reference an
> arbitrary function via the bugframe).
> 
> Use the same BUGFRAME_* #defines as on x86 in order to make a future
> common header file more easily achievable.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V4:
> - new patch
> 
> V5:
> - adjust BUG_FRAME() macro (Jan Beulich)
> - adjust arm linker script (Jan Beulich)
> - drop #ifdef x86 in common/virtual_region.c
> 
> V6:
> - use register for function address (Arm32 build failure noticed by
>    Julien Grall)

Thank you for trying to sort out the issue on Arm32 :).

> +/*
> + * Unfortunately gcc for arm 32-bit doesn't support the "i" constraint, so
> + * the easiest way to implement run_in_exception_handler() is to pass the
> + * to be called function in a fixed register.

There are a few uses of "i" in Linux Arm32 (such as jump label), 
therefore I am pretty confident "i" works at least in some situation.

I did some more digging this afternoon. Our use of "i" is very similar 
to Linux, so I decided to look at the GCC flags used.

It turns out that Linux will always build with -fno-pie on Arm (either 
32 or 64) whereas Xen will let the compiler to decide (PIE is enabled by 
on my compiler).

I wrote a small example to test the issue (based on Linux static key)

static void test(void)
{
}

int main(void)
{
     asm volatile (".pushsection .bug_frames, \"aw\"\n"
               ".quad %0\n"
               ".popsection\n"
               :: "i"(test));

     return 0;
}

If I add -fno-pie on the command, the constraint error disappears.

On the previous version, you rewrote that didn't see any error. Is it 
possible that your compiler is disabling PIE by default?

I think we need to code to be position independent for at least UEFI. I 
also have plan to look at selecting the Xen virtual address at boot time 
(this is necessary to solve some memory issue on Arm).

 From a quick test, if I use -fno-pie -fpic, then the snipped above will 
build fine. But it is not entirely clear whether the code would still be 
position independent.

I need to have a look how Linux is dealing with KASLR given that 
-fno-pie is used...

> + */
> +#define  run_in_exception_handler(fn) do {                                  \
> +    asm ("mov " __stringify(BUG_FN_REG) ", %0\n"                            \
> +         "1:"BUG_INSTR"\n"                                                  \
> +         ".pushsection .bug_frames." __stringify(BUGFRAME_run_fn) ","       \
> +         "             \"a\", %%progbits\n"                                 \
> +         "2:\n"                                                             \
> +         ".p2align 2\n"                                                     \
> +         ".long (1b - 2b)\n"                                                \
> +         ".long 0, 0, 0\n"                                                  \
> +         ".popsection" :: "r" (fn) : __stringify(BUG_FN_REG) );             \
> +} while (0)

My concern with this approach is we are going to clobber multiple 
registers. On Arm64, this code will be replaced by:

     13cc:       90000001        adrp    x1, 0 <show_execution_state>
     13d0:       91000021        add     x1, x1, #0x0
     13d4:       aa0103e0        mov     x0, x1
     13d8:       d4200020        brk     #0x1

I guess we can optimize it to just clobber one register. Do we expect 
the function executed to rely/replace the content of the registers?

Cheers,

-- 
Julien Grall

