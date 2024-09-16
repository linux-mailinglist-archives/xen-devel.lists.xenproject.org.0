Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A1D979E0C
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 11:12:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799342.1209319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq7ly-0002Qn-9d; Mon, 16 Sep 2024 09:11:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799342.1209319; Mon, 16 Sep 2024 09:11:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq7ly-0002Ox-6w; Mon, 16 Sep 2024 09:11:54 +0000
Received: by outflank-mailman (input) for mailman id 799342;
 Mon, 16 Sep 2024 09:11:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wse+=QO=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sq7lw-0002Or-OE
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 09:11:52 +0000
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [2607:f8b0:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5178371-740b-11ef-a0b6-8be0dac302b0;
 Mon, 16 Sep 2024 11:11:51 +0200 (CEST)
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-3e04801bb65so1444802b6e.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2024 02:11:51 -0700 (PDT)
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
X-Inumbo-ID: b5178371-740b-11ef-a0b6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1726477910; x=1727082710; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNoX6/JJwHcqjseHFf3j4kzlucWAAJkPlFFH9GPveF0=;
        b=RnKPwHHTcdPrt9+GaRqLIKzlibbu29eCIqzJ07FX5lciZllPRvoH1Tp0nQADbDhs31
         Q0TgJBX+/N1isIJPObWkD/lrxSWv9UdR+QpQYSXwp+bePskrOfn2Kgtcvwral2yKMTue
         zGZ5JKj1EWTmjskjyAb9lM6ju2FdJlqv82JUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726477910; x=1727082710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZNoX6/JJwHcqjseHFf3j4kzlucWAAJkPlFFH9GPveF0=;
        b=QPMpmis7AJNt65krTmMt5IBvx0znAB8Lv0sb80oE+d5vkYLZVToACwONszjqJlQkOB
         ZBBr7hX7Tsf5DtgRkbx2ziIoaSY+xwFf7sGSvMQZkdjFqXzVvXH4dlrm6MoU/diXYfGi
         +XgNVqgE9Zz526yl6tv8F6O0ZI4UXh0myVAC5TMZPmNLGMylaKkIAuTqnFDXuluT+XEH
         3pPijP9yZhMRnfsNZiYvG+bgqs+L1zDfrAwgk6mgYxNmZEx3nu284HBP/QcFEOB/jmRG
         KV3+wve+2BdhCod9WhOHuJ6IxZfe/k6gtGp6QQKlgFTxXHoYtu/kBOM9hL2XKPyGWHsV
         WDKA==
X-Forwarded-Encrypted: i=1; AJvYcCXxmLjbo0Rj0u7/PtsIgwaWyzFvlxzPEVJ2mYp4kfbtor+vwaDD+W9pkCB0WGT9Ipy9FIYdrX8xYqU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5iACTss7e3P0I0MmmxqxYAlUyDoB8WQ+4HLQ0gdCBxm8XDci7
	BNkAkb8QZ7fCBYtLU+DPRKL+ZISmhdkp8K3lLWltUlGi1Ig7qjuGZSLrNpsR3pTNgh8m5B6rRfg
	9nrS6m0irBU9JRUd5Hg6WJx8bptGBuv+EGfRb6w==
X-Google-Smtp-Source: AGHT+IH32/iFRo/qthV/JERO/5rpZdqRKhH+3KbPMae1tcXEqx3QzuE4kX2kmlFumMIb5i6u/Lozi3FYxusEYVl08mg=
X-Received: by 2002:a05:6808:1b0e:b0:3e0:48b2:3f40 with SMTP id
 5614622812f47-3e07a197285mr5074694b6e.45.1726477909800; Mon, 16 Sep 2024
 02:11:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240911095550.31139-1-frediano.ziglio@cloud.com> <d8627af4-5149-48ed-b107-f2401e6dddd3@suse.com>
In-Reply-To: <d8627af4-5149-48ed-b107-f2401e6dddd3@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 16 Sep 2024 10:11:39 +0100
Message-ID: <CACHz=ZjznRNkbTtDwH7jf=Va0r2+c5Tc7DB+pCdFg3aFERDc-Q@mail.gmail.com>
Subject: Re: [PATCH v2] x86: Put trampoline in separate .init.trampoline section
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 14, 2024 at 7:16=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 11.09.2024 11:55, Frediano Ziglio wrote:
> > --- a/xen/arch/x86/boot/head.S
> > +++ b/xen/arch/x86/boot/head.S
> > @@ -882,8 +882,9 @@ cmdline_parse_early:
> >  reloc:
> >          .incbin "reloc.bin"
> >
> > +#include "x86_64.S"
> > +
> > +        .section .init.trampoline, "aw", @progbits
> >  ENTRY(trampoline_start)
> >  #include "trampoline.S"
> >  ENTRY(trampoline_end)
>
> Hmm, nice - this turns out rather easier than I first thought.
>
> > --- a/xen/arch/x86/xen.lds.S
> > +++ b/xen/arch/x86/xen.lds.S
> > @@ -269,6 +269,11 @@ SECTIONS
> >         __ctors_end =3D .;
> >    } PHDR(text)
> >
> > +  . =3D ALIGN(PAGE_SIZE);
>
> Why? There's no special alignment right now.
>

UEFI CA Memory Mitigation requirements, I'll remove from this commit.

> > +  DECL_SECTION(.init.trampoline) {
> > +       *(.init.trampoline)
> > +  } PHDR(text)
> > +
> >  #ifndef EFI
>
> If this is to be a separate section also for ELF, I think that
> wants mentioning explicitly. "Easily disassemble" is too vague
> a reason for my taste.

It's not clear if either you changed your mind on that reason or if
the commit message is not clear. I'm assuming the latter, I'll improve
the commit message.
Not clear why you specify "ELF" in the above sentence, I mean, why
should it matter if it applies to EFI and/or ELF? And why having it
different from ELF to EFI?

>
> Jan

Frediano

