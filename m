Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 632B7A60CBD
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 10:06:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914130.1319932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt0zq-0008Dj-Dx; Fri, 14 Mar 2025 09:06:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914130.1319932; Fri, 14 Mar 2025 09:06:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt0zq-0008BW-Ao; Fri, 14 Mar 2025 09:06:26 +0000
Received: by outflank-mailman (input) for mailman id 914130;
 Fri, 14 Mar 2025 09:06:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OT8H=WB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tt0zp-0007bh-1i
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 09:06:25 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a0ebc42-00b3-11f0-9898-31a8f345e629;
 Fri, 14 Mar 2025 10:06:23 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5e5bc066283so2790753a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 02:06:23 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5e816afe223sm1684458a12.70.2025.03.14.02.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 02:06:22 -0700 (PDT)
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
X-Inumbo-ID: 9a0ebc42-00b3-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741943183; x=1742547983; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TqFsN1CFuWRAJjRa36K5sQJT9yZruSVOJe1PWwEpxlQ=;
        b=US/B1VlBYb16R5XLP6TaAryZx/DwTlkSmWGWijWCrfeEWi0htd9h/tHg36a+zbg5Y1
         Ahm7kbHwuCv58TldTI7h9gZJc+R+7EheQz/W2VTXzLt6YoaGAzKunl+3RHwtEMeSCnqL
         7ApcdvcvP4qM/PDtYeBjN7yZuuVj0lG5nUCck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741943183; x=1742547983;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TqFsN1CFuWRAJjRa36K5sQJT9yZruSVOJe1PWwEpxlQ=;
        b=gTaSULEuj5fL3R6r1S/I6Y6ymcbpaYbNW9QQ3kqS8WqBAER3kr5vxzquOHJAE/eV/R
         LgkuB/U5cB83ZgDIXsQ5uXqr9wc7tnQw3aurqWSJhFEbeFZ+AeevialUYpigSmgq+DUo
         G08FDjNUC7/+Oy6BxNxKqTgO+EdcIgKVVlo1jt4ncxUUG2Ta8S5dQ/10TlmiutdoaGfa
         GlkMjqJIMQGjUaVilbuuPDj0ORvk5CVpN12EOncVanhywbmMFR+i0bZUiW7xjM85tl9n
         qDyFMnLY57j8gWAuJm++YKAbETTJ1tzNFF2dtJxGobMEpslGH7ex3pY4e3IMYn9rDCeW
         TWeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZeYG2w8YvE0O+dBKC03clBwc2x/yF6fovoYKUsPL6IqgsBAKfwaroQmvozefLgxW9Nz1HpyTo5n8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwpB8IKeiY8m2l8fmLgjmfjpTIBrqkovz6rHuHq0j2GpB2I1h7c
	+xRYmZsZbwRzY/+u9CD75RF20/WYPODVqe8rP+leknF2YVEJeGpUv0Tdf9MPzKE=
X-Gm-Gg: ASbGncsQsft1gFX6UME7c3JxZvXnBqtlANfzemgdulShrWaWBi4JwbwKB8IXIlc87HV
	Y3eeXdT2ucedytrqBzc9FP7WUvwR+651RqNquV7euv/dTdbUSCjVYZgsVkb5vvOhaggNdCMs80p
	jJufiNQYRrVxgTMcVmFvNw4q/nflTrckUdBYjxDaigwOwhCHM5UK2geVr7d5zyYm3PhxqnulUdS
	GcSlUk/q7tiNWS3I/Tg0AvMlPIH15usls83ebiPTsT3CIWM2fBxBT1LKYO6frIwEwZDkrQyWlu1
	1BbqGlWUggTqe0TrfwwZkessAtQaJC/ltxrmbjzh5UnACzDFCw==
X-Google-Smtp-Source: AGHT+IFmhw/hvJcI/Fev7jCLinaW1BBnQzoeQNhr8YjQg4AkJD23TIqu71RGMoKoeSYvdZvMQipatg==
X-Received: by 2002:a05:6402:4405:b0:5e7:8503:1a4b with SMTP id 4fb4d7f45d1cf-5e89f6430b1mr1858657a12.18.1741943182741;
        Fri, 14 Mar 2025 02:06:22 -0700 (PDT)
Date: Fri, 14 Mar 2025 10:06:18 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/7] x86/wait: prevent duplicated assembly labels
Message-ID: <Z9Pxikoa2Ggo6SkW@macbook.local>
References: <20250313153029.93347-1-roger.pau@citrix.com>
 <20250313153029.93347-3-roger.pau@citrix.com>
 <8c58e1d6-b591-4211-9364-fa586a5c6d2e@suse.com>
 <Z9PpI8KQnA_gHy9e@macbook.local>
 <729fe31f-69d2-4b4f-8f2b-ac507a65fa27@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <729fe31f-69d2-4b4f-8f2b-ac507a65fa27@suse.com>

On Fri, Mar 14, 2025 at 09:44:10AM +0100, Jan Beulich wrote:
> On 14.03.2025 09:30, Roger Pau Monné wrote:
> > On Fri, Mar 14, 2025 at 09:24:09AM +0100, Jan Beulich wrote:
> >> On 13.03.2025 16:30, Roger Pau Monne wrote:
> >>> When enabling UBSAN with clang, the following error is triggered during the
> >>> build:
> >>>
> >>> common/wait.c:154:9: error: symbol '.L_wq_resume' is already defined
> >>>   154 |         "push %%rbx; push %%rbp; push %%r12;"
> >>>       |         ^
> >>> <inline asm>:1:121: note: instantiated into assembly here
> >>>     1 |         push %rbx; push %rbp; push %r12;push %r13; push %r14; push %r15;sub %esp,%ecx;cmp $4096, %ecx;ja .L_skip;mov %rsp,%rsi;.L_wq_resume: rep movsb;mov %rsp,%rsi;.L_skip:pop %r15; pop %r14; pop %r13;pop %r12; pop %rbp; pop %rbx
> >>>       |                                                                                                                                ^
> >>> common/wait.c:154:9: error: symbol '.L_skip' is already defined
> >>>   154 |         "push %%rbx; push %%rbp; push %%r12;"
> >>>       |         ^
> >>> <inline asm>:1:159: note: instantiated into assembly here
> >>>     1 |         push %rbx; push %rbp; push %r12;push %r13; push %r14; push %r15;sub %esp,%ecx;cmp $4096, %ecx;ja .L_skip;mov %rsp,%rsi;.L_wq_resume: rep movsb;mov %rsp,%rsi;.L_skip:pop %r15; pop %r14; pop %r13;pop %r12; pop %rbp; pop %rbx
> >>>       |                                                                                                                                                                      ^
> >>> 2 errors generated.
> >>>
> >>> The inline assembly block in __prepare_to_wait() is duplicated, thus
> >>> leading to multiple definitions of the otherwise unique labels inside the
> >>> assembly block.  GCC extended-asm documentation notes the possibility of
> >>> duplicating asm blocks:
> >>>
> >>>> Under certain circumstances, GCC may duplicate (or remove duplicates of)
> >>>> your assembly code when optimizing. This can lead to unexpected duplicate
> >>>> symbol errors during compilation if your asm code defines symbols or
> >>>> labels. Using ‘%=’ (see AssemblerTemplate) may help resolve this problem.
> >>>
> >>> Move the assembly blocks that deal with saving and restoring the current
> >>> CPU context into it's own explicitly non-inline functions.  This prevents
> >>> clang from duplicating the assembly blocks.  Just using noinline attribute
> >>> seems to be enough to prevent assembly duplication, in the future noclone
> >>> might also be required if asm block duplication issues arise again.
> >>
> >> Wouldn't it be a far easier / less intrusive change to simply append %= to
> >> the label names?
> > 
> > That won't work AFAICT, as the inline asm in check_wakeup_from_wait()
> > won't be able to make a jump to the .L_wq_resume label defined in the
> > __prepare_to_wait() assembly block if the label is declared as
> > .L_wq_resume%=.
> > 
> > Also we want to make sure there's a single .L_wq_resume seeing how
> > check_wakeup_from_wait() uses it as the restore entry point?
> 
> Hmm, yes on both points; the %= would only work for .Lskip. Have you gained
> understanding why there is this duplication?

Not anything else than what Andrew found in:

https://github.com/llvm/llvm-project/issues/92161

> The breaking out of the asm()
> that you do isn't going to be reliable, as in principle the compiler is
> still permitted to duplicate stuff.

I know.  That's why I mention in the commit message that "... asm
block duplication issues arise again."

> Afaict the only reliable way is to move
> the code to a separate assembly file (with the asm() merely JMPing there,
> providing a pseudo-return-address by some custom means). Or to a file-scope
> asm(), as those can't be duplicated.

Moving to a separate file was my first thought, but it seemed more
intrusive that strictly needed to workaround the issue at hand.

I can take a look at what I can do, if the proposed approach is not
suitable.

Thanks, Roger.

