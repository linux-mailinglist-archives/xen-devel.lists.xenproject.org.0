Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 857122E966D
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 14:56:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61227.107543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwQL9-0004Ao-JM; Mon, 04 Jan 2021 13:56:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61227.107543; Mon, 04 Jan 2021 13:56:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwQL9-0004AP-F0; Mon, 04 Jan 2021 13:56:07 +0000
Received: by outflank-mailman (input) for mailman id 61227;
 Mon, 04 Jan 2021 13:56:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e1rq=GH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwQL8-0004AK-GI
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 13:56:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7a978c5c-d198-4c26-8d8c-8eb918d3188f;
 Mon, 04 Jan 2021 13:56:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C2F76ACAF;
 Mon,  4 Jan 2021 13:56:03 +0000 (UTC)
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
X-Inumbo-ID: 7a978c5c-d198-4c26-8d8c-8eb918d3188f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609768563; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6uw212bc8C2bZfsL+0aIcJYiAFrxkdiN6zSBTheLPD4=;
	b=GZUWLRYRfBoZVLwl7AUMP3vvpCoNFPGRMPgX5ZOMRDot4we8KLqadFNu/Mzk2cjMI6PWAr
	SC0Q2e7vaBedm7yhDwEK9mI9SuIsnetx7VF838TWjRNkpATmgU1iecbKryvw/KqT8xFiGm
	2DgJD2672K2ayBhTZv2SelAVlCfVv1k=
Subject: Re: [PATCH 5/5] x86: don't build unused entry code when !PV32
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
References: <46d83c92-0b06-fc09-4832-7a7d7935d5c2@suse.com>
 <d417d3f9-3278-ed08-1ff6-45a13b5e3757@suse.com>
 <20201228153004.qip3v6er5rk22fnu@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0341c1f1-dc50-552c-f246-56605ae7c83a@suse.com>
Date: Mon, 4 Jan 2021 14:56:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201228153004.qip3v6er5rk22fnu@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 28.12.2020 16:30, Roger Pau Monné wrote:
> On Wed, Nov 25, 2020 at 09:51:33AM +0100, Jan Beulich wrote:
>> --- a/xen/arch/x86/x86_64/compat/entry.S
>> +++ b/xen/arch/x86/x86_64/compat/entry.S
>> @@ -29,8 +29,6 @@ ENTRY(entry_int82)
>>          mov   %rsp, %rdi
>>          call  do_entry_int82
>>  
>> -#endif /* CONFIG_PV32 */
>> -
>>  /* %rbx: struct vcpu */
>>  ENTRY(compat_test_all_events)
>>          ASSERT_NOT_IN_ATOMIC
>> @@ -197,6 +195,8 @@ ENTRY(cr4_pv32_restore)
>>          xor   %eax, %eax
>>          ret
>>  
>> +#endif /* CONFIG_PV32 */
> 
> I've also wondered, it feels weird to add CONFIG_PV32 gates to the
> compat entry.S, since that's supposed to be only used when there's
> support for 32bit PV guests?
> 
> Wouldn't this file only get built when such support is enabled?

No. We need cstar_enter also for 64-bit guests' 32-bit
user space possibly making system calls via SYSCALL.

>> --- a/xen/arch/x86/x86_64/entry.S
>> +++ b/xen/arch/x86/x86_64/entry.S
>> @@ -328,8 +328,10 @@ UNLIKELY_END(sysenter_gpf)
>>          movq  VCPU_domain(%rbx),%rdi
>>          movq  %rax,TRAPBOUNCE_eip(%rdx)
>>          movb  %cl,TRAPBOUNCE_flags(%rdx)
>> +#ifdef CONFIG_PV32
>>          cmpb  $0, DOMAIN_is_32bit_pv(%rdi)
>>          jne   compat_sysenter
>> +#endif
>>          jmp   .Lbounce_exception
>>  
>>  ENTRY(int80_direct_trap)
>> @@ -370,6 +372,7 @@ UNLIKELY_END(msi_check)
>>          mov    0x80 * TRAPINFO_sizeof + TRAPINFO_eip(%rsi), %rdi
>>          movzwl 0x80 * TRAPINFO_sizeof + TRAPINFO_cs (%rsi), %ecx
>>  
>> +#ifdef CONFIG_PV32
>>          mov   %ecx, %edx
>>          and   $~3, %edx
>>  
>> @@ -378,6 +381,10 @@ UNLIKELY_END(msi_check)
>>  
>>          test  %rdx, %rdx
>>          jz    int80_slow_path
>> +#else
>> +        test  %rdi, %rdi
>> +        jz    int80_slow_path
>> +#endif
>>  
>>          /* Construct trap_bounce from trap_ctxt[0x80]. */
>>          lea   VCPU_trap_bounce(%rbx), %rdx
>> @@ -390,8 +397,10 @@ UNLIKELY_END(msi_check)
>>          lea   (, %rcx, TBF_INTERRUPT), %ecx
>>          mov   %cl, TRAPBOUNCE_flags(%rdx)
>>  
>> +#ifdef CONFIG_PV32
>>          cmpb  $0, DOMAIN_is_32bit_pv(%rax)
>>          jne   compat_int80_direct_trap
>> +#endif
>>  
>>          call  create_bounce_frame
>>          jmp   test_all_events
>> @@ -541,12 +550,16 @@ ENTRY(dom_crash_sync_extable)
>>          GET_STACK_END(ax)
>>          leaq  STACK_CPUINFO_FIELD(guest_cpu_user_regs)(%rax),%rsp
>>          # create_bounce_frame() temporarily clobbers CS.RPL. Fix up.
>> +#ifdef CONFIG_PV32
>>          movq  STACK_CPUINFO_FIELD(current_vcpu)(%rax), %rax
>>          movq  VCPU_domain(%rax),%rax
>>          cmpb  $0, DOMAIN_is_32bit_pv(%rax)
>>          sete  %al
>>          leal  (%rax,%rax,2),%eax
>>          orb   %al,UREGS_cs(%rsp)
>> +#else
>> +        orb   $3, UREGS_cs(%rsp)
>> +#endif
>>          xorl  %edi,%edi
>>          jmp   asm_domain_crash_synchronous /* Does not return */
>>          .popsection
>> @@ -562,11 +575,15 @@ ENTRY(ret_from_intr)
>>          GET_CURRENT(bx)
>>          testb $3, UREGS_cs(%rsp)
>>          jz    restore_all_xen
>> +#ifdef CONFIG_PV32
>>          movq  VCPU_domain(%rbx), %rax
>>          cmpb  $0, DOMAIN_is_32bit_pv(%rax)
>>          je    test_all_events
>>          jmp   compat_test_all_events
>>  #else
>> +        jmp   test_all_events
>> +#endif
>> +#else
>>          ASSERT_CONTEXT_IS_XEN
>>          jmp   restore_all_xen
>>  #endif
>> @@ -652,7 +669,7 @@ handle_exception_saved:
>>          testb $X86_EFLAGS_IF>>8,UREGS_eflags+1(%rsp)
>>          jz    exception_with_ints_disabled
>>  
>> -#ifdef CONFIG_PV
>> +#if defined(CONFIG_PV32)
>>          ALTERNATIVE_2 "jmp .Lcr4_pv32_done", \
>>              __stringify(mov VCPU_domain(%rbx), %rax), X86_FEATURE_XEN_SMEP, \
>>              __stringify(mov VCPU_domain(%rbx), %rax), X86_FEATURE_XEN_SMAP
>> @@ -692,7 +709,7 @@ handle_exception_saved:
>>          test  $~(PFEC_write_access|PFEC_insn_fetch),%eax
>>          jz    compat_test_all_events
>>  .Lcr4_pv32_done:
>> -#else
>> +#elif !defined(CONFIG_PV)
>>          ASSERT_CONTEXT_IS_XEN
>>  #endif /* CONFIG_PV */
>>          sti
>> @@ -711,9 +728,11 @@ handle_exception_saved:
>>  #ifdef CONFIG_PV
>>          testb $3,UREGS_cs(%rsp)
>>          jz    restore_all_xen
>> +#ifdef CONFIG_PV32
>>          movq  VCPU_domain(%rbx),%rax
>>          cmpb  $0, DOMAIN_is_32bit_pv(%rax)
>>          jne   compat_test_all_events
>> +#endif
>>          jmp   test_all_events
>>  #else
>>          ASSERT_CONTEXT_IS_XEN
>> @@ -947,11 +966,16 @@ handle_ist_exception:
>>          je    1f
>>          movl  $EVENT_CHECK_VECTOR,%edi
>>          call  send_IPI_self
>> -1:      movq  VCPU_domain(%rbx),%rax
>> +1:
>> +#ifdef CONFIG_PV32
>> +        movq  VCPU_domain(%rbx),%rax
>>          cmpb  $0,DOMAIN_is_32bit_pv(%rax)
>>          je    restore_all_guest
>>          jmp   compat_restore_all_guest
>>  #else
>> +        jmp   restore_all_guest
>> +#endif
>> +#else
>>          ASSERT_CONTEXT_IS_XEN
>>          jmp   restore_all_xen
>>  #endif
> 
> I would like to have Andrew's opinion on this one (as you and him tend
> to modify more asm code than myself). There are quite a lot of
> addition to the assembly code, and IMO it makes the code more complex
> which I think we should try to avoid, as assembly is already hard
> enough.

Well, while I can see your point (and I indeed asked myself the same
question when making this change), this merely follows the route
started with the addition on CONFIG_PV conditionals. If we think that
prior step didn't set a good precedent, we ought to undo it.
Otherwise I see no good argument against doing the same kind of
transformation a 2nd time (and further ones, if need be down the
road).

Jan

