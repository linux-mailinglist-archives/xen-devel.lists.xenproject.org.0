Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 847BF4592D9
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 17:17:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228997.396315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpBzu-000766-RU; Mon, 22 Nov 2021 16:16:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228997.396315; Mon, 22 Nov 2021 16:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpBzu-00073l-Nh; Mon, 22 Nov 2021 16:16:50 +0000
Received: by outflank-mailman (input) for mailman id 228997;
 Mon, 22 Nov 2021 16:16:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=75Oo=QJ=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mpBzs-00073f-QC
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 16:16:48 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96bbee4f-4baf-11ec-9787-a32c541c8605;
 Mon, 22 Nov 2021 17:16:46 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:32788)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mpBzp-000r4X-9F (Exim 4.95) (return-path <amc96@srcf.net>);
 Mon, 22 Nov 2021 16:16:45 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 6FA1D1FDB1;
 Mon, 22 Nov 2021 16:16:45 +0000 (GMT)
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
X-Inumbo-ID: 96bbee4f-4baf-11ec-9787-a32c541c8605
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <39e0fcf5-0665-1614-31d1-59f98551abdd@srcf.net>
Date: Mon, 22 Nov 2021 16:16:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211119182106.14868-1-andrew.cooper3@citrix.com>
 <20211119182106.14868-5-andrew.cooper3@citrix.com>
 <8ac7cf1a-f235-a065-182f-3303aa9be5b7@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 4/5] x86/traps: Drop exception_table[] and use if/else
 dispatching
In-Reply-To: <8ac7cf1a-f235-a065-182f-3303aa9be5b7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/11/2021 09:04, Jan Beulich wrote:
> On 19.11.2021 19:21, Andrew Cooper wrote:
>> --- a/xen/arch/x86/x86_64/entry.S
>> +++ b/xen/arch/x86/x86_64/entry.S
>> @@ -773,14 +773,48 @@ handle_exception_saved:
>>          sti
>>  1:      movq  %rsp,%rdi
>>          movzbl UREGS_entry_vector(%rsp),%eax
>> -        leaq  exception_table(%rip),%rdx
>>  #ifdef CONFIG_PERF_COUNTERS
>>          lea   per_cpu__perfcounters(%rip), %rcx
>>          add   STACK_CPUINFO_FIELD(per_cpu_offset)(%r14), %rcx
>>          incl  ASM_PERFC_exceptions * 4(%rcx, %rax, 4)
>>  #endif
>> -        mov   (%rdx, %rax, 8), %rdx
>> -        INDIRECT_CALL %rdx
>> +
>> +        /*
>> +         * Dispatch to appropriate C handlers.
>> +         *
>> +         * The logic is implemented as an if/else chain.  DISPATCH() calls
>> +         * need be in frequency order for best performance.
>> +         */
>> +#define DISPATCH(vec, handler)         \
>> +        cmp   $vec, %al;               \
>> +        jne   .L_ ## vec ## _done;     \
>> +        call  handler;                 \
>> +        jmp   .L_exn_dispatch_done;    \
>> +.L_ ## vec ## _done:
>> +
>> +        DISPATCH(X86_EXC_PF, do_page_fault)
>> +        DISPATCH(X86_EXC_GP, do_general_protection)
>> +        DISPATCH(X86_EXC_UD, do_invalid_op)
>> +        DISPATCH(X86_EXC_NM, do_device_not_available)
>> +        DISPATCH(X86_EXC_BP, do_int3)
>> +
>> +        /* Logically "if ( (1 << vec) & MASK ) { do_trap(); }" */
>> +        mov   $(1 << X86_EXC_DE) | (1 << X86_EXC_OF) | (1 << X86_EXC_BR) |\
>> +               (1 << X86_EXC_NP) | (1 << X86_EXC_SS) | (1 << X86_EXC_MF) |\
>> +               (1 << X86_EXC_AC) | (1 << X86_EXC_XM), %edx
>> +        bt    %eax, %edx
>> +        jnc   .L_do_trap_done
>> +        call  do_trap
>> +        jmp   .L_exn_dispatch_done
>> +.L_do_trap_done:
>> +
>> +        DISPATCH(X86_EXC_CP, do_entry_CP)
>> +#undef DISPATCH
> The basis for the choice of ordering imo wants spelling out here. For example,
> despite the data provided in the description I'm not really convinced #BP
> wants handling ahead of everything going to do_trap().

Why?

Debugging might be rare, but #BP gets used in non-error cases. 
Everything heading towards do_trap() really got 0 hits, which is
entirely expected because they're all fatal signals by default.

This list is in proper frequency order.

>> @@ -1012,9 +1046,28 @@ handle_ist_exception:
>>          incl  ASM_PERFC_exceptions * 4(%rcx, %rax, 4)
>>  #endif
>>  
>> -        leaq  exception_table(%rip),%rdx
>> -        mov   (%rdx, %rax, 8), %rdx
>> -        INDIRECT_CALL %rdx
>> +        /*
>> +         * Dispatch to appropriate C handlers.
>> +         *
>> +         * The logic is implemented as an if/else chain.  DISPATCH() calls
>> +         * need be in frequency order for best performance.
>> +         */
>> +#define DISPATCH(vec, handler)         \
>> +        cmp   $vec, %al;               \
>> +        jne   .L_ ## vec ## _done;     \
>> +        call  handler;                 \
>> +        jmp   .L_ist_dispatch_done;    \
>> +.L_ ## vec ## _done:
>> +
>> +        DISPATCH(X86_EXC_NMI, do_nmi)
>> +        DISPATCH(X86_EXC_DB,  do_debug)
>> +        DISPATCH(X86_EXC_MC,  do_machine_check)
>> +#undef DISPATCH
>> +
>> +        call  do_unhandled_trap
>> +        BUG   /* do_unhandled_trap() shouldn't return. */
> While I agree with putting BUG here, I don't see the need for the CALL.
> Unlike in handle_exception there's no vector left unhandled by the
> DISPATCH() invocations. The CALL being there give the (wrong) impression
> there would / might be.

I firmly disagree.

do_unhandled_trap() is a fatal error path both here and for the non IST
case, and is absolutely the appropriate thing to call in the dangling
else from this chain.

It is only unreachable if 15 things line up correctly in a very fragile
piece of code, where both you and I have made errors in the past.

~Andrew

