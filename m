Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8AB1C8CE4
	for <lists+xen-devel@lfdr.de>; Thu,  7 May 2020 15:47:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWgra-0004rb-RP; Thu, 07 May 2020 13:46:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ibL=6V=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jWgrZ-0004rW-Fs
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 13:46:57 +0000
X-Inumbo-ID: 374223a0-9069-11ea-9f1c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 374223a0-9069-11ea-9f1c-12813bfff9fa;
 Thu, 07 May 2020 13:46:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4DCEBAB64;
 Thu,  7 May 2020 13:46:58 +0000 (UTC)
Subject: Re: [PATCH 13/16] x86/ioemul: Rewrite stub generation to be shadow
 stack compatible
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
 <20200501225838.9866-14-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e36b8093-9288-b4ef-810a-583c0b44c626@suse.com>
Date: Thu, 7 May 2020 15:46:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200501225838.9866-14-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 02.05.2020 00:58, Andrew Cooper wrote:
> The logic is completely undocumented and almost impossible to follow.  It
> actually uses return oriented programming.  Rewrite it to conform to more
> normal call mechanics, and leave a big comment explaining thing.  As well as
> the code being easier to follow, it will execute faster as it isn't fighting
> the branch predictor.
> 
> Move the ioemul_handle_quirk() function pointer from traps.c to
> ioport_emulate.c.  There is no reason for it to be in neither of the two
> translation units which use it.  Alter the behaviour to return the number of
> bytes written into the stub.
> 
> Access the addresses of the host/guest helpers with extern const char arrays.
> Nothing good will come of C thinking they are regular functions.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> --
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Wei Liu <wl@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> Posted previously on its perf benefits alone, but here is the real reason
> behind the change.
> ---
>  xen/arch/x86/ioport_emulate.c  | 11 ++---
>  xen/arch/x86/pv/emul-priv-op.c | 91 +++++++++++++++++++++++++++++++-----------
>  xen/arch/x86/pv/gpr_switch.S   | 37 +++++------------
>  xen/arch/x86/traps.c           |  3 --
>  xen/include/asm-x86/io.h       |  3 +-
>  5 files changed, 85 insertions(+), 60 deletions(-)
> 
> diff --git a/xen/arch/x86/ioport_emulate.c b/xen/arch/x86/ioport_emulate.c
> index 499c1f6056..f7511a9c49 100644
> --- a/xen/arch/x86/ioport_emulate.c
> +++ b/xen/arch/x86/ioport_emulate.c
> @@ -8,7 +8,10 @@
>  #include <xen/sched.h>
>  #include <xen/dmi.h>
>  
> -static bool ioemul_handle_proliant_quirk(
> +unsigned int (*ioemul_handle_quirk)(
> +    u8 opcode, char *io_emul_stub, struct cpu_user_regs *regs);

As requested for the standalone patch - would you mind adding
__read_mostly on this occasion? And I notice now that use of
uint8_t would also be more appropriate.

> --- a/xen/arch/x86/pv/gpr_switch.S
> +++ b/xen/arch/x86/pv/gpr_switch.S
> @@ -9,59 +9,42 @@
>  
>  #include <asm/asm_defns.h>
>  
> -ENTRY(host_to_guest_gpr_switch)
> -        movq  (%rsp), %rcx
> -        movq  %rdi, (%rsp)
> +/* Load guest GPRs.  Parameter in %rdi, clobbers all registers. */
> +ENTRY(load_guest_gprs)
>          movq  UREGS_rdx(%rdi), %rdx
> -        pushq %rbx
>          movq  UREGS_rax(%rdi), %rax
>          movq  UREGS_rbx(%rdi), %rbx
> -        pushq %rbp
>          movq  UREGS_rsi(%rdi), %rsi
>          movq  UREGS_rbp(%rdi), %rbp
> -        pushq %r12
> -        movq  UREGS_r8(%rdi), %r8
> +        movq  UREGS_r8 (%rdi), %r8
>          movq  UREGS_r12(%rdi), %r12
> -        pushq %r13
> -        movq  UREGS_r9(%rdi), %r9
> +        movq  UREGS_r9 (%rdi), %r9
>          movq  UREGS_r13(%rdi), %r13
> -        pushq %r14
>          movq  UREGS_r10(%rdi), %r10
>          movq  UREGS_r14(%rdi), %r14
> -        pushq %r15
>          movq  UREGS_r11(%rdi), %r11
>          movq  UREGS_r15(%rdi), %r15
> -        pushq %rcx /* dummy push, filled by guest_to_host_gpr_switch pointer */
> -        pushq %rcx
> -        leaq  guest_to_host_gpr_switch(%rip),%rcx
> -        movq  %rcx,8(%rsp)
>          movq  UREGS_rcx(%rdi), %rcx
>          movq  UREGS_rdi(%rdi), %rdi
>          ret
>  
> -ENTRY(guest_to_host_gpr_switch)
> +/* Save guest GPRs.  Parameter on the stack above the return address. */
> +ENTRY(save_guest_gprs)
>          pushq %rdi
> -        movq  7*8(%rsp), %rdi
> +        movq  2*8(%rsp), %rdi
>          movq  %rax, UREGS_rax(%rdi)
> -        popq  UREGS_rdi(%rdi)
> +        popq        UREGS_rdi(%rdi)
>          movq  %r15, UREGS_r15(%rdi)
>          movq  %r11, UREGS_r11(%rdi)
> -        popq  %r15
>          movq  %r14, UREGS_r14(%rdi)
>          movq  %r10, UREGS_r10(%rdi)
> -        popq  %r14
>          movq  %r13, UREGS_r13(%rdi)
> -        movq  %r9, UREGS_r9(%rdi)
> -        popq  %r13
> +        movq  %r9,  UREGS_r9 (%rdi)
>          movq  %r12, UREGS_r12(%rdi)
> -        movq  %r8, UREGS_r8(%rdi)
> -        popq  %r12
> +        movq  %r8,  UREGS_r8 (%rdi)
>          movq  %rbp, UREGS_rbp(%rdi)
>          movq  %rsi, UREGS_rsi(%rdi)
> -        popq  %rbp
>          movq  %rbx, UREGS_rbx(%rdi)
>          movq  %rdx, UREGS_rdx(%rdi)
> -        popq  %rbx
>          movq  %rcx, UREGS_rcx(%rdi)
> -        popq  %rcx
>          ret

Now that these are oridinary functions (with just a non-standard
call convention), I think - as said before - they should be marked
STT_FUNC in the object. With that, as also said before, I then
don't think using char[] on the C side declarations (leading to
STT_OBJECT) is appropriate to use - linker are imo fine to warn
about such a mismatch. To prevent the declaration to be used for
an actual call, use e.g. __attribute__((__warning__())) as already
suggested.

Jan

