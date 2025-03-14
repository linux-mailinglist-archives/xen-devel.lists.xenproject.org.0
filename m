Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 729A4A60B97
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 09:30:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914010.1319842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt0R9-0001IH-Op; Fri, 14 Mar 2025 08:30:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914010.1319842; Fri, 14 Mar 2025 08:30:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt0R9-0001Fd-Lc; Fri, 14 Mar 2025 08:30:35 +0000
Received: by outflank-mailman (input) for mailman id 914010;
 Fri, 14 Mar 2025 08:30:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OT8H=WB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tt0R8-0001FX-37
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 08:30:34 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95f86ff7-00ae-11f0-9898-31a8f345e629;
 Fri, 14 Mar 2025 09:30:29 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5e64700a38cso2742928a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 01:30:29 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5e8169b04e5sm1740719a12.35.2025.03.14.01.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 01:30:28 -0700 (PDT)
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
X-Inumbo-ID: 95f86ff7-00ae-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741941028; x=1742545828; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RerXeC9ll5YfPm6IfD3QPYvFKchMgNq3OiVCh0tACcU=;
        b=DPgB6KlY6+YZUeYZ4rmh27RxOx6wLYcqkNuMfJAfqxcMkfVMLIkw/NoCx7kGXG15t4
         OxJeSxsLFAVnESKVzJfW5ejS7zbEH4yp3hSpASF4DFtr3IGx7p4XSu7oP6PwwOL9s5Ct
         KZdm3ySTX1Ne6MGxXnAzoyamwZQU3w5tFRDxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741941028; x=1742545828;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RerXeC9ll5YfPm6IfD3QPYvFKchMgNq3OiVCh0tACcU=;
        b=UKYVDovloDkxUsn0kWhgGhsxczYZjh7DQIRzfSRhAYGNa5+hEBX/vEFuOKvLoyKwRZ
         ZGYVkQ6jB9cEKyO5bPHV2Ojj7H0flLA0CFlOqU5hKNsegRAZTawguHoyHMiPCOl6WYks
         7NrjP+4NWg8C7qKTfWynJMrL/rjm5EoJCJr0MAsy0gAyQ4eGVnstRnqt85wyn1n9SAZu
         jWlYXSQS+LlhCPsPGMoe3ywE/4lijb1XwSeBFrVCMlTGLjSVkBgtn7fQafQC6OtCHwhU
         Chn3vGxQbonmMhTQQ+CaVbbsFv0pu12C7g7FRS1CAR28JgZ73q1IppbCfJ5I/xnQ/1Qn
         QyxQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+Y08fYtaTTav5l4lQUnXoEgwc44z+RXtaK6kcUxXBlk1LBnEy/HqT9iIauAf+1NYw88PCFeT5z3E=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzd6fYJ2skjQdAk72LJQliPYsMBaho/QaMwGj1R4awqEiytGafH
	ZTTLWP/RVXwWwf9gtEZa20gqFMjeIwWP1Vvu2yJij3qvIFtfMbphcipmQ6d8QCc=
X-Gm-Gg: ASbGnctmp0Wq9aaOvTML6Q8mNx+4QQTsdTto1UYg2Wb80aJMud7cG+Fli1GRc7whTm8
	WPozavwm/0EVTDCW/MgKU+otvJnzS97hxXsEINF2XGv0xAFgPkEXa8u63wOpA/UyL/WMOHLPxdP
	GxoZvZLzBTMii8Ak4NK2LESVakTurEzSbZH5QV1BC3P8fnrbXIwhHrFwLENcnHMCMrWcxIuisP8
	YY7SHzsYW3/rIBTuX12KLmk3yF8QRQLkNE6B2IWfLdW1VT+jkxlWw43rXE5Iyy3ubLwaWXCHipD
	TjzXBFpp74tECw6sgXgqtG1+bdqouxET012/88VC0g8UVubnFA==
X-Google-Smtp-Source: AGHT+IFNA1AsHVhG8fwh63Cur3fvsjFKHLU7vyIC4XBzKFXMS2nauT8+3dhq9UofBiBr/VWJxWjcwg==
X-Received: by 2002:a05:6402:35ce:b0:5e6:e68c:9d66 with SMTP id 4fb4d7f45d1cf-5e89f1532d1mr1519374a12.8.1741941028402;
        Fri, 14 Mar 2025 01:30:28 -0700 (PDT)
Date: Fri, 14 Mar 2025 09:30:27 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/7] x86/wait: prevent duplicated assembly labels
Message-ID: <Z9PpI8KQnA_gHy9e@macbook.local>
References: <20250313153029.93347-1-roger.pau@citrix.com>
 <20250313153029.93347-3-roger.pau@citrix.com>
 <8c58e1d6-b591-4211-9364-fa586a5c6d2e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c58e1d6-b591-4211-9364-fa586a5c6d2e@suse.com>

On Fri, Mar 14, 2025 at 09:24:09AM +0100, Jan Beulich wrote:
> On 13.03.2025 16:30, Roger Pau Monne wrote:
> > When enabling UBSAN with clang, the following error is triggered during the
> > build:
> > 
> > common/wait.c:154:9: error: symbol '.L_wq_resume' is already defined
> >   154 |         "push %%rbx; push %%rbp; push %%r12;"
> >       |         ^
> > <inline asm>:1:121: note: instantiated into assembly here
> >     1 |         push %rbx; push %rbp; push %r12;push %r13; push %r14; push %r15;sub %esp,%ecx;cmp $4096, %ecx;ja .L_skip;mov %rsp,%rsi;.L_wq_resume: rep movsb;mov %rsp,%rsi;.L_skip:pop %r15; pop %r14; pop %r13;pop %r12; pop %rbp; pop %rbx
> >       |                                                                                                                                ^
> > common/wait.c:154:9: error: symbol '.L_skip' is already defined
> >   154 |         "push %%rbx; push %%rbp; push %%r12;"
> >       |         ^
> > <inline asm>:1:159: note: instantiated into assembly here
> >     1 |         push %rbx; push %rbp; push %r12;push %r13; push %r14; push %r15;sub %esp,%ecx;cmp $4096, %ecx;ja .L_skip;mov %rsp,%rsi;.L_wq_resume: rep movsb;mov %rsp,%rsi;.L_skip:pop %r15; pop %r14; pop %r13;pop %r12; pop %rbp; pop %rbx
> >       |                                                                                                                                                                      ^
> > 2 errors generated.
> > 
> > The inline assembly block in __prepare_to_wait() is duplicated, thus
> > leading to multiple definitions of the otherwise unique labels inside the
> > assembly block.  GCC extended-asm documentation notes the possibility of
> > duplicating asm blocks:
> > 
> >> Under certain circumstances, GCC may duplicate (or remove duplicates of)
> >> your assembly code when optimizing. This can lead to unexpected duplicate
> >> symbol errors during compilation if your asm code defines symbols or
> >> labels. Using ‘%=’ (see AssemblerTemplate) may help resolve this problem.
> > 
> > Move the assembly blocks that deal with saving and restoring the current
> > CPU context into it's own explicitly non-inline functions.  This prevents
> > clang from duplicating the assembly blocks.  Just using noinline attribute
> > seems to be enough to prevent assembly duplication, in the future noclone
> > might also be required if asm block duplication issues arise again.
> 
> Wouldn't it be a far easier / less intrusive change to simply append %= to
> the label names?

That won't work AFAICT, as the inline asm in check_wakeup_from_wait()
won't be able to make a jump to the .L_wq_resume label defined in the
__prepare_to_wait() assembly block if the label is declared as
.L_wq_resume%=.

Also we want to make sure there's a single .L_wq_resume seeing how
check_wakeup_from_wait() uses it as the restore entry point?

Thanks, Roger.

