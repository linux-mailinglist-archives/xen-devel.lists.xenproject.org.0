Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 468A847057A
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 17:20:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.244030.422167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvic7-0003XY-HD; Fri, 10 Dec 2021 16:19:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 244030.422167; Fri, 10 Dec 2021 16:19:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvic7-0003Uy-Cv; Fri, 10 Dec 2021 16:19:15 +0000
Received: by outflank-mailman (input) for mailman id 244030;
 Fri, 10 Dec 2021 16:19:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a5or=Q3=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mvic5-0003Us-Tq
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 16:19:13 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7771aec-59d4-11ec-a74f-db008197e53d;
 Fri, 10 Dec 2021 17:19:12 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:45332)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mvic1-0006Cl-06 (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 10 Dec 2021 16:19:09 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id CFFB0200D8;
 Fri, 10 Dec 2021 16:19:08 +0000 (GMT)
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
X-Inumbo-ID: e7771aec-59d4-11ec-a74f-db008197e53d
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <d50d9964-b80f-d46a-49df-90fe5f29e2d3@srcf.net>
Date: Fri, 10 Dec 2021 16:19:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126123446.32324-64-andrew.cooper3@citrix.com>
 <64b55cdc-484d-5657-e0af-3462ebadd09f@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 63/65] x86/setup: Rework MSR_S_CET handling for CET-IBT
In-Reply-To: <64b55cdc-484d-5657-e0af-3462ebadd09f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/12/2021 10:49, Jan Beulich wrote:
> On 26.11.2021 13:34, Andrew Cooper wrote:
>> --- a/xen/arch/x86/acpi/wakeup_prot.S
>> +++ b/xen/arch/x86/acpi/wakeup_prot.S
>> @@ -63,7 +63,24 @@ ENTRY(s3_resume)
>>          pushq   %rax
>>          lretq
>>  1:
>> -#ifdef CONFIG_XEN_SHSTK
>> +#if defined(CONFIG_XEN_SHSTK) || defined(CONFIG_XEN_IBT)
>> +        call    xen_msr_s_cet_value
>> +        test    %eax, %eax
>> +        je      .L_cet_done
> Nit: I consider it generally misleading to use JE / JNE (and a few
> other Jcc) with other than CMP-like insns. Only those handle actual
> "relations", whereas e.g. TEST only produces particular flag states,
> so would more consistently be followed by JZ / JNZ in cases like
> this one. But since this is very much a matter of taste, I'm not
> going to insist on a change here.

Fixed.

>
>> +        /* Set up MSR_S_CET. */
>> +        mov     $MSR_S_CET, %ecx
>> +        xor     %edx, %edx
>> +        wrmsr
>> +
>> +        /* Enable CR4.CET. */
>> +        mov     $XEN_MINIMAL_CR4 | X86_CR4_CET, %ecx
>> +        mov     %rcx, %cr4
> Is it valid / safe to enable CR4.CET (with CET_SHSTK_EN already
> active) before ...
>
>> +#if defined(CONFIG_XEN_SHSTK)
>> +        test    $CET_SHSTK_EN, %eax
> (Intermediate remark: Using %al would seem to suffice and be a
> shorter encoding.)

Fixed.

>
>> +        je      .L_cet_done
>> +
>>          /*
>>           * Restoring SSP is a little complicated, because we are intercepting
>>           * an in-use shadow stack.  Write a temporary token under the stack,
>> @@ -71,14 +88,6 @@ ENTRY(s3_resume)
>>           * reset MSR_PL0_SSP to its usual value and pop the temporary token.
>>           */
>>          mov     saved_ssp(%rip), %rdi
>> -        cmpq    $1, %rdi
>> -        je      .L_shstk_done
>> -
>> -        /* Set up MSR_S_CET. */
>> -        mov     $MSR_S_CET, %ecx
>> -        xor     %edx, %edx
>> -        mov     $CET_SHSTK_EN | CET_WRSS_EN, %eax
>> -        wrmsr
>>  
>>          /* Construct the temporary supervisor token under SSP. */
>>          sub     $8, %rdi
>> @@ -90,12 +99,9 @@ ENTRY(s3_resume)
>>          mov     %edi, %eax
>>          wrmsr
>>  
>> -        /* Enable CET.  MSR_INTERRUPT_SSP_TABLE is set up later in load_system_tables(). */
>> -        mov     $XEN_MINIMAL_CR4 | X86_CR4_CET, %ebx
>> -        mov     %rbx, %cr4
> ... the writing of MSR_PL0_SSP in context here? ISTR some ordering
> issues back at the time when you introduced CET-SS, so I thought I'd
> better ask to be sure.

Yes, it is safe, but the reasons why aren't entirely trivial.

To set up CET-SS, we need to do the following things:

1) CR4.CET=1
2) Configure MSR_S_CET.SHSTK_EN
3) Configure MSR_PL0_SSP pointing at a non-busy supervisor token
4) Configure MSR_ISST_SSP to point at the IST shadow stacks, again with
non-busy tokens
5) execute SETSSBSY to load SSP

The MSRs can be configured whenever, subject to suitable hardware
support.  In both of these cases, we've actually pre-configured the
non-busy supervisor tokens which is why we don't set those up directly. 

Furthermore, we defer setting up MSR_ISST_SSP to when we set up the IDT
and TSS, and that's fine because it doesn't make interrupts/exceptions
any less fatal.

The only hard ordering is that SETSSBSY depends on CR4.CET &&
MSR_S_CET.SHSTK_EN in order to not #UD.

However, between CR4.CET && MSR_S_CET.SHSTK_EN and SETSSBSY, we're
operating with an SSP of 0, meaning that any call/ret/etc are fatal. 
That is why I previously grouped the 3 actions as close to together as
possible.

For the CONFIG_XEN_IBT && !CONFIG_XEN_SHSTK case, we need to set up CR4
and MSR_S_CET only.  This was the only way I could find to lay out the
logic in a half-reasonable way.  It does mean that MSR_PL0_SSP is set up
during the critical call/ret region, but that's the smallest price I
could find to pay.  Anything else would have had more conditionals, and
substantially more #ifdef-ary.


I have put in this:

diff --git a/xen/arch/x86/boot/x86_64.S b/xen/arch/x86/boot/x86_64.S
index 9178b2e6a039..6a4834f9813a 100644
--- a/xen/arch/x86/boot/x86_64.S
+++ b/xen/arch/x86/boot/x86_64.S
@@ -45,6 +45,8 @@ ENTRY(__high_start)
         mov     $XEN_MINIMAL_CR4 | X86_CR4_CET, %ecx
         mov     %rcx, %cr4
 
+        /* WARNING! call/ret/etc now fatal (iff SHSTK) until SETSSBSY
loads SSP */
+
 #if defined(CONFIG_XEN_SHSTK)
         test    $CET_SHSTK_EN, %al
         jz      .L_ap_cet_done


which mirrors our Spectre-v2 warning in the entry paths.

~Andrew

