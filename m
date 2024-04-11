Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0018A1DAE
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 20:16:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704114.1100272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruyy7-0002XE-6w; Thu, 11 Apr 2024 18:16:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704114.1100272; Thu, 11 Apr 2024 18:16:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruyy7-0002U1-3d; Thu, 11 Apr 2024 18:16:15 +0000
Received: by outflank-mailman (input) for mailman id 704114;
 Thu, 11 Apr 2024 18:16:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o0DN=LQ=gmail.com=brgerst@srs-se1.protection.inumbo.net>)
 id 1ruyy6-0002Tv-IC
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 18:16:14 +0000
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [2001:4860:4864:20::2c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9389538d-f82f-11ee-94a3-07e782e9044d;
 Thu, 11 Apr 2024 20:16:12 +0200 (CEST)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-22f078f1aecso91991fac.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Apr 2024 11:16:12 -0700 (PDT)
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
X-Inumbo-ID: 9389538d-f82f-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712859371; x=1713464171; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TDS6c2ghnYUkSwWbtZftPqPTODtRchsS8qiLJfzkVWw=;
        b=Mo7DP6ybN2AY7eiX1z0dsw4LN+hBFxbcPyMzHtwGMmUz8pwpQVe3n30D70UMJXQbQj
         DnutIItVKwHX0uoEkUpbNJ0ptlH51zr0odEhPnt3TQioHPlBlKIuM5iLfk2QFmfMzg4a
         /ycldeN21JKNM+c4pHg8nr9NQ4JvHn5iFcZDfA5QYZEHPYUq3CGywxyAyP2m7yeaec2y
         B3QSpNSDVw8+amuZof+27snPHCLNLfTo3QSKdtZZoDZGrnysTs+jKnvcn0Jjtqw2VMKP
         ziDA8ZPrPVoaZZ2mX8/if/ORMjHLmiuItPJhFlKegIxVW5wiHhTSTAqIPMqkWybFS3vl
         zfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712859371; x=1713464171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TDS6c2ghnYUkSwWbtZftPqPTODtRchsS8qiLJfzkVWw=;
        b=qatqBZRRi/XQ0g4y3HyqUfCTHnlk5iSvZfT/7TE5sz121TpzRK3o7apuUNq2XoVow7
         oTujcek1oZem1p9ZjImoxRorpBr7bnMDL1CCW9fJ26GHWw+FwBJbz9vAbt+Pc9z/4wBU
         vQsbSCSLc2NI8LhTIznx6yrkm5/EqOyg2rjdi+MRM1Srq9yRdTy5TZOGlFAyt/H1P8st
         VqlJfD3fRtw+79Le7eN74gcow7StkjgmX23b9FrqRPw6CPwFh8qOlt/3gIk8GqOhAPlE
         cFH6JHgejMPFSoiIYXh24mbMqWYzzPMHYvTZnnsULiT2wC9sAsY3DrgXgBZOeREFfex1
         gm+A==
X-Forwarded-Encrypted: i=1; AJvYcCXuLoljCHsuVjZrQF1Bfg/7xDQiRHkM2yV1Yz2CRcE8d8eUg4c+GZCOHNS7TwTJsuBmsfJ5tSI3QIJeXvE2HrLxVWGlj3I9UkULqDzSwIM=
X-Gm-Message-State: AOJu0YybtyaiztAJXu9HThcjucoNDFMi7O0nXa0pE80lAzYjDZA0rusV
	6kesMvgUMstQrltk40X6EjQtolRb8710n/58xZE9cMLdW88fHqlBbTYNB/Q2sfUNnM+ZkFytas3
	w9UxMWOXQ2WLE8vbHQxnivO3aPg==
X-Google-Smtp-Source: AGHT+IF2hVKasS43gNxPvK3Yxqe3GnEmv7WnsgCokhD0KHgBvCacyvI7d2RHHBMtMHdJooKADEYd0Vu236vMpiguadg=
X-Received: by 2002:a05:6871:8795:b0:22a:dc7:7d64 with SMTP id
 td21-20020a056871879500b0022a0dc77d64mr267337oab.10.1712859371153; Thu, 11
 Apr 2024 11:16:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240410194850.39994-1-jason.andryuk@amd.com> <20240410194850.39994-3-jason.andryuk@amd.com>
 <CAMzpN2h6S69bOLXCUhmkVJErvoKxq-wPmfoaqR7eGHYLgirn+Q@mail.gmail.com> <74465ac2-0060-4047-97d7-acadcdff4cd4@amd.com>
In-Reply-To: <74465ac2-0060-4047-97d7-acadcdff4cd4@amd.com>
From: Brian Gerst <brgerst@gmail.com>
Date: Thu, 11 Apr 2024 14:15:58 -0400
Message-ID: <CAMzpN2iCYXuQXXHmg9qevJXDuzvxDF9L=Vw+w2ZAaPk6vZZFDQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] x86/pvh: Make PVH entrypoint PIC for x86-64
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2024 at 11:26=E2=80=AFAM Jason Andryuk <jason.andryuk@amd.c=
om> wrote:
>
> On 2024-04-10 17:00, Brian Gerst wrote:
> > On Wed, Apr 10, 2024 at 3:50=E2=80=AFPM Jason Andryuk <jason.andryuk@am=
d.com> wrote:
>
> >>          /* 64-bit entry point. */
> >>          .code64
> >>   1:
> >> +       UNWIND_HINT_END_OF_STACK
> >> +
> >>          /* Set base address in stack canary descriptor. */
> >>          mov $MSR_GS_BASE,%ecx
> >> -       mov $_pa(canary), %eax
> >> +       leal rva(canary)(%ebp), %eax
> >
> > Since this is in 64-bit mode, RIP-relative addressing can be used.
> >
> >>          xor %edx, %edx
> >>          wrmsr
> >>
> >>          call xen_prepare_pvh
> >>
> >>          /* startup_64 expects boot_params in %rsi. */
> >> -       mov $_pa(pvh_bootparams), %rsi
> >> -       mov $_pa(startup_64), %rax
> >> +       lea rva(pvh_bootparams)(%ebp), %rsi
> >> +       lea rva(startup_64)(%ebp), %rax
> >
> > RIP-relative here too.
>
> Yes, thanks for catching that.  With the RIP-relative conversion, there
> is now:
> vmlinux.o: warning: objtool: pvh_start_xen+0x10d: relocation to !ENDBR:
> startup_64+0x0
>
> I guess RIP-relative made it visible.  That can be quieted by adding
> ANNOTATE_NOENDBR to startup_64.

Change it to a direct jump, since branches are always RIP-relative.

Brian Gerst

