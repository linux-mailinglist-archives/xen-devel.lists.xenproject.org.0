Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AFDCF49A4
	for <lists+xen-devel@lfdr.de>; Mon, 05 Jan 2026 17:13:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195579.1513510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcnCd-0005tB-PJ; Mon, 05 Jan 2026 16:13:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195579.1513510; Mon, 05 Jan 2026 16:13:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcnCd-0005r6-MI; Mon, 05 Jan 2026 16:13:07 +0000
Received: by outflank-mailman (input) for mailman id 1195579;
 Mon, 05 Jan 2026 16:13:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lzVw=7K=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vcnCc-0005qX-Lk
 for xen-devel@lists.xenproject.org; Mon, 05 Jan 2026 16:13:06 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a267ce3-ea51-11f0-9ccf-f158ae23cfc8;
 Mon, 05 Jan 2026 17:13:04 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 77FB14EE0742;
 Mon,  5 Jan 2026 17:13:03 +0100 (CET)
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
X-Inumbo-ID: 6a267ce3-ea51-11f0-9ccf-f158ae23cfc8
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1767629583;
	b=k9/wDpfh6enap/4FiX9zDlTUS0sJ2aW8gQ2Kn8nRk512+t0gEm3Mu4ln46rREGjcY7hF
	 T7lDOQn8QjHfTp7GdMrZBWc7INSGF6P7xGyEZIEOD5tBEsT7eeTAhfYRqMFaXzr0APIYb
	 nydbX4HD+Ks4mCs4CpF/OICkmf2t+0trndeOpZxdXZfOeUMeETk09Cg5KReKd8n7fY1F7
	 HYrIzATn+UaT8T1SSKLIiJaBls0MlkQLJkpfTkW0dnlRjRt55uS+MOqkovUEjLaGsQmgl
	 fkEMKtOvODu1GYZtXZSuI0HneFyrpCGDzFKn9M+wDlh5hglE/cnncY4K+65iXAIiKpPEY
	 3DDY+e70F6SgJ+frP60HYl43IzETNX+so2ZGxQdsPGUytSro9oEOzuaNM6VuB7hIuicni
	 vyWtDMVI4yfVJa5wPOdwfeLI/upOXrhiCJEVswxNaJwB929m8+GMMtAGoSuzpdfYixSyc
	 8/LdeidR1vOEkvpRgXXYrlvErCeqzWf2OsyKbG0of85FvwpbB4MEg1OyAO2LarnFbaAyF
	 jzfD+AuyDSO6Q5nh/Ubv8+uZibRB1OXmcXlDya6tNpuX+ieoKvVpaNoIyCUSCTS5LpNSt
	 Ce9yT/j+RZ9x+HNF2oxZMcF2TX/DuuQNjvhKvw05MobQLZKWkJl88AGBigbtxyc=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1767629583;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=kkkFcPaTtOnOacVvxiO1is934CxyV1Z9JxBRoNWjIe8=;
	b=WiNhFvHwd41+8F8EINIUtKlrnCJIclSioIgt0ClUuMDCl5WA+pfN4Df8+tTFPSuWTojN
	 Njzokpky/Uy9It6uaQqUvQxmbQWaYxMiCJr5VX5Wln2fIoGODqsrNB/NoI3mkQ4Fi72oe
	 K0M/V9NxD69RUs/b7zzIS+PSJdPzjx5Tv5bmVzP9e0yNAP3K4rq2sAPMxnWFG8mO/aMVT
	 U4eUIS85Tebs6Tunk00LDf+38kZqlxIgLbSOPkwWNTQeM0cxSkiTQJoAsQgb+lOLUNEVQ
	 aQ5rT2qPIevMXmucqjCZffD/tmuihQvm0DqBlVmXSgsf2ljy2mISq1cyR6ToL3SVx7OeV
	 yOn9XUkYM8jkvLcpblh8nZaGjhQE2goKWePKiN0Cvf7lE6aYEC+IpK5Gd36COPwN2mD71
	 14IY7hA/2dFCpc6gsIQN4rY94fDsbDjLh39qyWdfYgQXTIfEo45nFhRtq4irkMtXVlXZ9
	 Vw5UESOtYqJGELX/HVMo0js+dRPN5a8tHgIDB8U4T1wf9J0u1V78hE4BQTSrzg9rXxxW7
	 yh9redpMcz22JaBUVDFW/Ore5vJvp11QWvvyawo7jfiV2eF+WuDOxwyBaRz1gaDJxRASx
	 YcMPB0ids0zF7ujTwaX59n7LW2wJnybq1iVv48ZLcsdtP6geOtGuFgoiqid+Xaw=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Mon, 05 Jan 2026 17:13:03 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn?=
 =?UTF-8?Q?=C3=A9?= <roger.pau@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 3/4] x86/i387: Rework fpu_fxrstor() given a newer
 toolchain baseline
In-Reply-To: <662888ee-e983-4194-b8ca-f28560881c29@suse.com>
References: <20251230135427.188440-1-andrew.cooper3@citrix.com>
 <20251230135427.188440-4-andrew.cooper3@citrix.com>
 <662888ee-e983-4194-b8ca-f28560881c29@suse.com>
Message-ID: <37ff7e30cc0715d619a20d7ea6ab72b5@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2026-01-05 16:52, Jan Beulich wrote:
> On 30.12.2025 14:54, Andrew Cooper wrote:
>> Use asm goto rather than hiding a memset() in the fixup section.  With 
>> the
>> compiler now able to see the write into fpu_ctxt (as opposed to the 
>> asm
>> constraint erroneously stating it as input-only), it validly objects 
>> to the
>> pointer being const.
>> 
>> While FXRSTOR oughtn't to fault on an all-zeros input, avoid a risk of 
>> an
>> infinite loop entirely by using a fixup scheme similar to xrstor(), 
>> and
>> crashing the domain if we run out options.
> 
> Question being - does ...
> 
>> --- a/xen/arch/x86/i387.c
>> +++ b/xen/arch/x86/i387.c
>> @@ -38,7 +38,8 @@ static inline void fpu_xrstor(struct vcpu *v, 
>> uint64_t mask)
>>  /* Restore x87 FPU, MMX, SSE and SSE2 state */
>>  static inline void fpu_fxrstor(struct vcpu *v)
>>  {
>> -    const fpusse_t *fpu_ctxt = &v->arch.xsave_area->fpu_sse;
>> +    fpusse_t *fpu_ctxt = &v->arch.xsave_area->fpu_sse;
>> +    unsigned int faults = 0;
>> 
>>      /*
>>       * Some CPUs don't save/restore FDP/FIP/FOP unless an exception
>> @@ -59,49 +60,41 @@ static inline void fpu_fxrstor(struct vcpu *v)
>>       * possibility, which may occur if the block was passed to us by 
>> control
>>       * tools or through VCPUOP_initialise, by silently clearing the 
>> block.
>>       */
>> + retry:
>>      switch ( __builtin_expect(fpu_ctxt->x[FPU_WORD_SIZE_OFFSET], 8) )
>>      {
>>      default:
>> -        asm_inline volatile (
>> +        asm_inline volatile goto (
>>              "1: fxrstorq %0\n"
>> -            ".section .fixup,\"ax\"   \n"
>> -            "2: push %%"__OP"ax       \n"
>> -            "   push %%"__OP"cx       \n"
>> -            "   push %%"__OP"di       \n"
>> -            "   lea  %0,%%"__OP"di    \n"
>> -            "   mov  %1,%%ecx         \n"
>> -            "   xor  %%eax,%%eax      \n"
>> -            "   rep ; stosl           \n"
>> -            "   pop  %%"__OP"di       \n"
>> -            "   pop  %%"__OP"cx       \n"
>> -            "   pop  %%"__OP"ax       \n"
>> -            "   jmp  1b               \n"
>> -            ".previous                \n"
>> -            _ASM_EXTABLE(1b, 2b)
>> -            :
>> -            : "m" (*fpu_ctxt), "i" (sizeof(*fpu_ctxt) / 4) );
>> +            _ASM_EXTABLE(1b, %l[fault])
>> +            :: "m" (*fpu_ctxt)
>> +            :: fault );
>>          break;
>> +
>>      case 4: case 2:
>> -        asm_inline volatile (
>> -            "1: fxrstor %0         \n"
>> -            ".section .fixup,\"ax\"\n"
>> -            "2: push %%"__OP"ax    \n"
>> -            "   push %%"__OP"cx    \n"
>> -            "   push %%"__OP"di    \n"
>> -            "   lea  %0,%%"__OP"di \n"
>> -            "   mov  %1,%%ecx      \n"
>> -            "   xor  %%eax,%%eax   \n"
>> -            "   rep ; stosl        \n"
>> -            "   pop  %%"__OP"di    \n"
>> -            "   pop  %%"__OP"cx    \n"
>> -            "   pop  %%"__OP"ax    \n"
>> -            "   jmp  1b            \n"
>> -            ".previous             \n"
>> -            _ASM_EXTABLE(1b, 2b)
>> -            :
>> -            : "m" (*fpu_ctxt), "i" (sizeof(*fpu_ctxt) / 4) );
>> +        asm_inline volatile goto (
>> +            "1: fxrstor %0\n"
>> +            _ASM_EXTABLE(1b, %l[fault])
>> +            :: "m" (*fpu_ctxt)
>> +            :: fault );
>>          break;
>>      }
>> +
>> +    return;
>> +
>> + fault:
>> +    faults++;
>> +
>> +    switch ( faults )
>> +    {
>> +    case 1: /* Stage 1: Reset all state. */
>> +        memset(fpu_ctxt, 0, sizeof(*fpu_ctxt));
>> +        goto retry;
>> +
>> +    default: /* Stage 2: Nothing else to do. */
>> +        domain_crash(v->domain, "Uncorrectable FXRSTOR fault\n");
>> +        return;
> 
> ... this then count as unreachable and/or dead code in Misra's terms? 
> Nicola?
> Sure, Eclair wouldn't be able to spot it, but that's no excuse imo.
> 
> Jan

Right now, probably not, but even if it did, an ASSERT_UNREACHABLE can 
be added in the default branch to deal with that.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

