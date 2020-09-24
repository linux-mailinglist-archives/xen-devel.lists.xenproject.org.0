Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0655527746E
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 16:56:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLSfQ-0007jz-NN; Thu, 24 Sep 2020 14:56:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+2aH=DB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kLSfP-0007ju-6a
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 14:56:15 +0000
X-Inumbo-ID: 9aba906e-df00-464b-a42f-8f7cb7d01de7
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9aba906e-df00-464b-a42f-8f7cb7d01de7;
 Thu, 24 Sep 2020 14:56:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600959373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8nS6uTdqNs7Mryh1A0MaVtFPBEGII0qtQzfeJFc9wKg=;
 b=iIzVHDh9Z9LcUmlaTI+0ECD3/26xSEnfU6TiFdTJxA6Hy/D4KrsPEU17VeEF4X0RZNUK3E
 uUWRLVFS+Wzm2tFy6o+mT8YBYbyWIBF6CWTnfvj34omxN4344ZzfKf6kPArcECQMa8uWe2
 AugwjeHFMVV3+a7oRf9n96S7btlDH7A=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1AEC6B03F;
 Thu, 24 Sep 2020 14:56:13 +0000 (UTC)
Subject: Re: [PATCH 3/3] x86/pv: Inject #UD for missing SYSCALL callbacks
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Andy Lutomirski <luto@kernel.org>,
 Manuel Bouyer <bouyer@antioche.eu.org>
References: <20200923101848.29049-1-andrew.cooper3@citrix.com>
 <20200923101848.29049-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ed891c94-63a4-496c-6817-1b88ac4c004b@suse.com>
Date: Thu, 24 Sep 2020 16:56:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200923101848.29049-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 23.09.2020 12:18, Andrew Cooper wrote:
> Despite appearing to be a deliberate design choice of early PV64, the
> resulting behaviour for unregistered SYSCALL callbacks creates an untenable
> testability problem for Xen.  Furthermore, the behaviour is undocumented,
> bizarre, and inconsistent with related behaviour in Xen, and very liable
> introduce a security vulnerability into a PV guest if the author hasn't
> studied Xen's assembly code in detail.
> 
> There are two different bugs here.
> 
> 1) The current logic confuses the registered entrypoints, and may deliver a
>    SYSCALL from 32bit userspace to the 64bit entry, when only a 64bit
>    entrypoint is registered.
> 
>    This has been the case ever since 2007 (c/s cd75d47348b) but up until
>    2018 (c/s dba899de14) the wrong selectors would be handed to the guest for
>    a 32bit SYSCALL entry, making it appear as if it a 64bit entry all along.

I'm not sure what you derive the last half sentence from. To a 32-bit
PV guest, nothing can make things look like being 64-bit. And as you
did say in your 2018 change, FLAT_KERNEL_SS == FLAT_USER_SS32.

As to the "confusion" of entry points - before the compat mode entry
path was introduced, a 64-bit guest could only register a single
entry point. Hence guests at the time had to multiplex 32- and 64-bit
user mode entry from this one code path. In order to avoid regressing
any such guest, the falling back to using the 64-bit entry point was
chosen. Effectively what you propose is to regress such guests now,
rather than back then.

>    Xen would malfunction under these circumstances, if it were a PV guest.
>    Linux would as well, but PVOps has always registered both entrypoints and
>    discarded the Xen-provided selectors.  NetBSD really does malfunction as a
>    consequence (benignly now, but a VM DoS before the 2018 Xen selector fix).
> 
> 2) In the case that neither SYSCALL callbacks are registered, the guest will
>    be crashed when userspace executes a SYSCALL instruction, which is a
>    userspace => kernel DoS.
> 
>    This has been the case ever since the introduction of 64bit PV support, but
>    behaves unlike all other SYSCALL/SYSENTER callbacks in Xen, which yield
>    #GP/#UD in userspace before the callback is registered, and are therefore
>    safe by default.

I agree this part is an improvement.

> This change does constitute a change in the PV ABI, for corner cases of a PV
> guest kernel registering neither callback, or not registering the 32bit
> callback when running on AMD/Hygon hardware.
> 
> It brings the behaviour in line with PV32 SYSCALL/SYSENTER, and PV64
> SYSENTER (safe by default, until explicitly enabled), as well as native
> hardware (always delivered to the single applicable callback).

Albeit an OS running natively and setting EFER.SCE is obliged to set both
entry points; they can't have one without the other (and not be vulnerable).
Since it's unclear what the PV equivalent of EFER.SCE is, I don't think
comparing this particular aspect of the behavior makes a lot of sense.

> Most importantly however, and the primary reason for the change, is that it
> lets us actually test the PV entrypoints to prove correct behaviour.

You mean "test the absence of PV entry points" here?

> --- a/xen/arch/x86/x86_64/entry.S
> +++ b/xen/arch/x86/x86_64/entry.S
> @@ -26,18 +26,30 @@
>  /* %rbx: struct vcpu */
>  ENTRY(switch_to_kernel)
>          leaq  VCPU_trap_bounce(%rbx),%rdx
> -        /* TB_eip = (32-bit syscall && syscall32_addr) ?
> -         *          syscall32_addr : syscall_addr */
> -        xor   %eax,%eax
> +
> +        /* TB_eip = 32-bit syscall ? syscall32_addr : syscall_addr */
> +        mov   VCPU_syscall32_addr(%rbx), %ecx
> +        mov   VCPU_syscall_addr(%rbx), %rax
>          cmpw  $FLAT_USER_CS32,UREGS_cs(%rsp)
> -        cmoveq VCPU_syscall32_addr(%rbx),%rax
> -        testq %rax,%rax
> -        cmovzq VCPU_syscall_addr(%rbx),%rax
> -        movq  %rax,TRAPBOUNCE_eip(%rdx)
> +        cmove %rcx, %rax
> +
>          /* TB_flags = VGCF_syscall_disables_events ? TBF_INTERRUPT : 0 */
>          btl   $_VGCF_syscall_disables_events,VCPU_guest_context_flags(%rbx)
>          setc  %cl
>          leal  (,%rcx,TBF_INTERRUPT),%ecx
> +
> +        test  %rax, %rax
> +UNLIKELY_START(z, syscall_no_callback) /* TB_eip == 0 => #UD */
> +        movq  VCPU_trap_ctxt(%rbx), %rdi
> +        movl  $X86_EXC_UD, UREGS_entry_vector(%rsp)
> +        subl  $2, UREGS_rip(%rsp)
> +        movl  X86_EXC_UD * TRAPINFO_sizeof + TRAPINFO_eip(%rdi), %eax

I guess you mean "movq ..., %rax"? Iirc 32-bit guests don't even get through
here.

Jan

