Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F51A60E78
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 11:13:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914298.1320071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt22I-0000qB-U5; Fri, 14 Mar 2025 10:13:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914298.1320071; Fri, 14 Mar 2025 10:13:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt22I-0000nl-Om; Fri, 14 Mar 2025 10:13:02 +0000
Received: by outflank-mailman (input) for mailman id 914298;
 Fri, 14 Mar 2025 10:13:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OT8H=WB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tt22I-0000nf-62
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 10:13:02 +0000
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e52c9970-00bc-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 11:12:55 +0100 (CET)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-22398e09e39so39388265ad.3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 03:12:55 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-737116b0ec4sm2607663b3a.159.2025.03.14.03.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 03:12:53 -0700 (PDT)
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
X-Inumbo-ID: e52c9970-00bc-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741947174; x=1742551974; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bj2SWcVYYGuWKywFaYpUHhlVK+1FS9D/WghekRHADyY=;
        b=ZsyZ4v5yvgVBqBXd6vsFo0xeJnzpzaMd6kWKvb3mPeO202XsLoXJl5WwI0FWXfjaCD
         QpL3QLXIYo1n3zSdKOjLl5xTFTMfuJc9dajPVzykP8m5xIkP8HhX/yJaB1Al0JRapT1a
         +SOITnA/00tw61dxviGV9AcI61nfjvQFwuKJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741947174; x=1742551974;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bj2SWcVYYGuWKywFaYpUHhlVK+1FS9D/WghekRHADyY=;
        b=BNbHup7yQzwYW8Z3kv55sVChRuRzwmFwNP0NeOpAq1zwiiYe3PQVVyqSXmJy947XdJ
         1XzO0goQGZTfdodKQnFCeGonWw6PZVmZkK+th7xEVoKCryu909qK6lYQhRl1/gNTSpt3
         akrptv9vmMWBQDWplV9hMtZpj4cCkAP7UNviqSCvJL+EE/e07LEEN7VNQCkifFASUcfA
         4MzIz2FZfzABxzMDBvTCKSEAb/Kc2H+psItgXU4pglJck0fWlyqbWE+UvXskReCaRzjf
         2UuYDDNjtiBeXa4Upx4IGOKexvuvOQXWL4OYcZps5hoZ/GT9vlIsIvqI7lg4KzRfxksA
         M+TA==
X-Forwarded-Encrypted: i=1; AJvYcCXjJYx4ofsDKghvUBBbMj/WbGGigHfNu/Qr41qI28XrVdnAJANzSqxXexNKh+OHGR1rKrtGka8y/0s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJLUJ8z+06rKiDhVLlexFaYLvCsMzhIdP0YEg/4v4urZubjDIH
	2yf+x2swoYZPD0masmPFbV2yzVih6ohymZ2eJSI6mGMFqtXXHo9+TmVyt5DeYr8=
X-Gm-Gg: ASbGnct5PVJwKOW+JeWbSiMLARRnQep+U+uf6P/Q3re5YeTcL1kgWsjmx+8fDuU0RkP
	7NFfUj84kLxjro12rRuQbVOQbbTyHFdhQbq7UluMK3BXmCkHjbKyAkpCljA+MP1zoPIsdWojlo4
	mgdTheQGtdaF90ACImqaphnv3s2jFGHd05KnI14U/tZyg0AHnzBKKZG2BNP4Hg+A9rfp6hd821W
	+7Bu2RUKnHbkUtKzOn8E6aHsnpqeJwHQ93LJkdTchb+Ev6sVREPCAbPs7lu8v2JMnV/gLCeptGD
	TNUSXMitVou7hUulTwuqYs10lI7PCBBT7cYdDovVFkOadpKB9g==
X-Google-Smtp-Source: AGHT+IFtcTuh7b1FZefXdD9qdUZ9S+gyC5st8DJpBhZ1nF69VDQf0x6aZO7QeGRV+Z1vdRQeND6xEQ==
X-Received: by 2002:a05:6a00:17a7:b0:736:69aa:112c with SMTP id d2e1a72fcca58-7372236ef76mr2116528b3a.9.1741947173912;
        Fri, 14 Mar 2025 03:12:53 -0700 (PDT)
Date: Fri, 14 Mar 2025 11:12:48 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/7] x86/wait: prevent duplicated assembly labels
Message-ID: <Z9QBIEICQIQH2WD9@macbook.local>
References: <20250313153029.93347-1-roger.pau@citrix.com>
 <20250313153029.93347-3-roger.pau@citrix.com>
 <8c58e1d6-b591-4211-9364-fa586a5c6d2e@suse.com>
 <Z9PpI8KQnA_gHy9e@macbook.local>
 <729fe31f-69d2-4b4f-8f2b-ac507a65fa27@suse.com>
 <dd147c79-055e-4a94-bb23-4c59821d520a@citrix.com>
 <3d905488-b3ec-452f-afca-9a7d85484fe9@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d905488-b3ec-452f-afca-9a7d85484fe9@suse.com>

On Fri, Mar 14, 2025 at 10:13:07AM +0100, Jan Beulich wrote:
> On 14.03.2025 10:05, Andrew Cooper wrote:
> > On 14/03/2025 8:44 am, Jan Beulich wrote:
> >> On 14.03.2025 09:30, Roger Pau Monné wrote:
> >>> On Fri, Mar 14, 2025 at 09:24:09AM +0100, Jan Beulich wrote:
> >>>> On 13.03.2025 16:30, Roger Pau Monne wrote:
> >>>>> When enabling UBSAN with clang, the following error is triggered during the
> >>>>> build:
> >>>>>
> >>>>> common/wait.c:154:9: error: symbol '.L_wq_resume' is already defined
> >>>>>   154 |         "push %%rbx; push %%rbp; push %%r12;"
> >>>>>       |         ^
> >>>>> <inline asm>:1:121: note: instantiated into assembly here
> >>>>>     1 |         push %rbx; push %rbp; push %r12;push %r13; push %r14; push %r15;sub %esp,%ecx;cmp $4096, %ecx;ja .L_skip;mov %rsp,%rsi;.L_wq_resume: rep movsb;mov %rsp,%rsi;.L_skip:pop %r15; pop %r14; pop %r13;pop %r12; pop %rbp; pop %rbx
> >>>>>       |                                                                                                                                ^
> >>>>> common/wait.c:154:9: error: symbol '.L_skip' is already defined
> >>>>>   154 |         "push %%rbx; push %%rbp; push %%r12;"
> >>>>>       |         ^
> >>>>> <inline asm>:1:159: note: instantiated into assembly here
> >>>>>     1 |         push %rbx; push %rbp; push %r12;push %r13; push %r14; push %r15;sub %esp,%ecx;cmp $4096, %ecx;ja .L_skip;mov %rsp,%rsi;.L_wq_resume: rep movsb;mov %rsp,%rsi;.L_skip:pop %r15; pop %r14; pop %r13;pop %r12; pop %rbp; pop %rbx
> >>>>>       |                                                                                                                                                                      ^
> >>>>> 2 errors generated.
> >>>>>
> >>>>> The inline assembly block in __prepare_to_wait() is duplicated, thus
> >>>>> leading to multiple definitions of the otherwise unique labels inside the
> >>>>> assembly block.  GCC extended-asm documentation notes the possibility of
> >>>>> duplicating asm blocks:
> >>>>>
> >>>>>> Under certain circumstances, GCC may duplicate (or remove duplicates of)
> >>>>>> your assembly code when optimizing. This can lead to unexpected duplicate
> >>>>>> symbol errors during compilation if your asm code defines symbols or
> >>>>>> labels. Using ‘%=’ (see AssemblerTemplate) may help resolve this problem.
> >>>>> Move the assembly blocks that deal with saving and restoring the current
> >>>>> CPU context into it's own explicitly non-inline functions.  This prevents
> >>>>> clang from duplicating the assembly blocks.  Just using noinline attribute
> >>>>> seems to be enough to prevent assembly duplication, in the future noclone
> >>>>> might also be required if asm block duplication issues arise again.
> >>>> Wouldn't it be a far easier / less intrusive change to simply append %= to
> >>>> the label names?
> >>> That won't work AFAICT, as the inline asm in check_wakeup_from_wait()
> >>> won't be able to make a jump to the .L_wq_resume label defined in the
> >>> __prepare_to_wait() assembly block if the label is declared as
> >>> .L_wq_resume%=.
> >>>
> >>> Also we want to make sure there's a single .L_wq_resume seeing how
> >>> check_wakeup_from_wait() uses it as the restore entry point?
> >> Hmm, yes on both points; the %= would only work for .Lskip. Have you gained
> >> understanding why there is this duplication? The breaking out of the asm()
> >> that you do isn't going to be reliable, as in principle the compiler is
> >> still permitted to duplicate stuff. Afaict the only reliable way is to move
> >> the code to a separate assembly file (with the asm() merely JMPing there,
> >> providing a pseudo-return-address by some custom means). Or to a file-scope
> >> asm(), as those can't be duplicated.
> > 
> > See the simplified example in
> > https://github.com/llvm/llvm-project/issues/92161
> > 
> > When I debugged this a while back, The multiple uses of wqv->esp (one
> > explicit after the asm, one as an asm parameter) gain pointer
> > sanitisation, so the structure looks like:
> > 
> >     ...
> >     if ( bad pointer )
> >         __ubsan_report();
> >     asm volatile (...);
> >     if ( bad pointer )
> >         __ubsan_report();
> >     ...
> > 
> > which then got transformed to:
> > 
> >     if ( bad pointer )
> >     {
> >         __ubsan_report();
> >         asm volatile (...);
> >         __ubsan_report();
> >     }
> >     else
> >         asm volatile (...);
> 
> But isn't it then going to be enough to latch &wqv->esp into a local variable,
> and use that in the asm() and in the subsequent if()?

I have the following diff which seems to prevent the duplication,
would you both be OK with this approach?

Thanks, Roger.
---
diff --git a/xen/common/wait.c b/xen/common/wait.c
index cb6f5ff3c20a..60ebd58a0abd 100644
--- a/xen/common/wait.c
+++ b/xen/common/wait.c
@@ -124,6 +124,7 @@ static void __prepare_to_wait(struct waitqueue_vcpu *wqv)
     struct cpu_info *cpu_info = get_cpu_info();
     struct vcpu *curr = current;
     unsigned long dummy;
+    void *esp = NULL;
 
     ASSERT(wqv->esp == NULL);
 
@@ -166,12 +167,12 @@ static void __prepare_to_wait(struct waitqueue_vcpu *wqv)
         ".L_skip:"
         "pop %%r15; pop %%r14; pop %%r13;"
         "pop %%r12; pop %%rbp; pop %%rbx"
-        : "=&S" (wqv->esp), "=&c" (dummy), "=&D" (dummy)
+        : "=&S" (esp), "=&c" (dummy), "=&D" (dummy)
         : "0" (0), "1" (cpu_info), "2" (wqv->stack),
           [sz] "i" (PAGE_SIZE)
         : "memory", "rax", "rdx", "r8", "r9", "r10", "r11" );
 
-    if ( unlikely(wqv->esp == NULL) )
+    if ( unlikely(esp == NULL) )
     {
         gdprintk(XENLOG_ERR, "Stack too large in %s\n", __func__);
         domain_crash(curr->domain);
@@ -179,6 +180,7 @@ static void __prepare_to_wait(struct waitqueue_vcpu *wqv)
         for ( ; ; )
             do_softirq();
     }
+    wqv->esp = esp;
 }
 
 static void __finish_wait(struct waitqueue_vcpu *wqv)


