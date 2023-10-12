Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1647C79EC
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 00:45:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616168.957966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr4QD-0006Ta-7d; Thu, 12 Oct 2023 22:44:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616168.957966; Thu, 12 Oct 2023 22:44:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr4QD-0006Qz-3v; Thu, 12 Oct 2023 22:44:49 +0000
Received: by outflank-mailman (input) for mailman id 616168;
 Thu, 12 Oct 2023 22:44:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qqh1=F2=gmail.com=ubizjak@srs-se1.protection.inumbo.net>)
 id 1qr4QB-0006Qt-2j
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 22:44:47 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1127031-6950-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 00:44:46 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-53db360294fso2785403a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Oct 2023 15:44:46 -0700 (PDT)
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
X-Inumbo-ID: f1127031-6950-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697150685; x=1697755485; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mUJJKm9lDcsKSbt0Gh9bMyGUZpKtFWFjgv7jiH7IfeI=;
        b=ZhVfYW0QoU5XKh7Q3rU+FB/+8/skV8WygZyV1JI/dZbOz6B8li9RAt/jVrnudMv7KQ
         tQngEPXiOKR1jqhTuLA3Z6OhYe6Pas4arBsj/O3N95zGZG1iCza0oumstqhLmDPDpSJJ
         1VFSeMNXdZUgNFwTxJ5Uz6lJl6Z9R0HdIwSKmtL9jqTh4lwRhCID0w4/G462oRMczWz/
         KlA70zrFxZa0il0jFrtioDio79TYDRmMxY+I/N1fZQlHbvaguQZpP2JjmVOgo7/Dve8V
         S1l04OUmxf+lHU6Hqsthi2C/FybafqIqId50AlXny6/KU5lQs+8hFVNjvt+0VH4gHcTt
         4bjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697150685; x=1697755485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mUJJKm9lDcsKSbt0Gh9bMyGUZpKtFWFjgv7jiH7IfeI=;
        b=Ri0NelrkE/Z4byNgRdoH0nsXhm7yGcLhSXR7kznwCvQ8PRWPZS7NyiBWfpfJWqyUsx
         JyTSA6mM4mSzV58C6ARIWijP2B57gLqdr+ngwPdyJhIf8xjpVrT0h0Qg/pwhORyQiP+q
         jexVr79VQwxHeHE8DrhEKF36veQigwX2a9NXQdreMfo+C/MHHEh8CqPFQWRQDFsfB6n5
         p2pczjKKDWJQ2jfuZCGfttVKiwLI8rXu4zWmvywsW/lmWk/X/fdI8j2akiqnVIakP16p
         gaRrGC/8nGhK4UDbFP88wuXph8kdCZJFr9m1bWBMuQfRCCjVKeD90EujyMpvwl4JpjEA
         GwAg==
X-Gm-Message-State: AOJu0YznneBt61S4s5CXGzZV5VEBKKgSOkYu3+7MQKXQvAiW6xmHJp6+
	WFhoLshyQ3RLiVVZdTKtEbLT+lP2aSXGUhP+ypc=
X-Google-Smtp-Source: AGHT+IFyYAt1/XqbFKonx4X0m+I/iV1wGqc3tYFtJONQ1BAT6fF9nLfX+r3BSk6hrxlKs3nNElJ86qvizT+DQ06Y4ys=
X-Received: by 2002:a05:6402:350f:b0:53e:1f6:fa24 with SMTP id
 b15-20020a056402350f00b0053e01f6fa24mr3460608edd.20.1697150683614; Thu, 12
 Oct 2023 15:44:43 -0700 (PDT)
MIME-Version: 1.0
References: <20231012201743.292149-1-ubizjak@gmail.com> <3af8dcec-66ec-4bd4-b7bf-4bc6f5f3c70f@intel.com>
 <CAFULd4byzHyoz4xM1gL_T1wFkNE-ab8K4upXfPirxM9PdX5JWg@mail.gmail.com>
 <5722e74b-6fc6-4d6e-be25-069ea6385990@zytor.com> <CAFULd4afhj-kJwneh7wz0sExWqOmPicG4fcfF++_fUMHpoNbXA@mail.gmail.com>
 <5694b2bd-de40-45c0-8b38-ac01bc11798a@zytor.com>
In-Reply-To: <5694b2bd-de40-45c0-8b38-ac01bc11798a@zytor.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Fri, 13 Oct 2023 00:44:32 +0200
Message-ID: <CAFULd4YUD_7x5=j1MBB9mcS6rRm9zdmZ33SyjaTArScLVMv2KA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Introduce %rip-relative addressing to PER_CPU_VAR macro
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Dave Hansen <dave.hansen@intel.com>, x86@kernel.org, xen-devel@lists.xenproject.org, 
	linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2023 at 11:22=E2=80=AFPM H. Peter Anvin <hpa@zytor.com> wro=
te:
>
> On 10/12/23 14:17, Uros Bizjak wrote:
> >>
> >> Are you PIC-adjusting the percpu variables as well?
> >
> > After this patch (and after fixing percpu_stable_op to use "a" operand
> > modifier on GCC), the only *one* remaining absolute reference to
> > percpu variable remain in xen-head.S, where:
> >
> >      movq    $INIT_PER_CPU_VAR(fixed_percpu_data),%rax
> >
> > should be changed to use leaq.
> >
> > All others should then be (%rip)-relative.
> >
>
> I mean, the symbols themselves are relative, not absolute?

The reference to the symbol is relative to the segment register, but
absolute to the location of the instruction. If the executable changes
location, then instruction moves around  and reference is not valid
anymore. (%rip)-relative reference compensate for changed location of
the instruction.

Uros.

