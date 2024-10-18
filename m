Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE439A38F0
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 10:44:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821674.1235592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1iZe-0001e8-Fj; Fri, 18 Oct 2024 08:43:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821674.1235592; Fri, 18 Oct 2024 08:43:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1iZe-0001bb-Ct; Fri, 18 Oct 2024 08:43:06 +0000
Received: by outflank-mailman (input) for mailman id 821674;
 Fri, 18 Oct 2024 08:43:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SHZo=RO=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t1iZc-0001bO-Pb
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 08:43:04 +0000
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [2607:f8b0:4864:20::c34])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id faed2d1c-8d2c-11ef-99a3-01e77a169b0f;
 Fri, 18 Oct 2024 10:43:00 +0200 (CEST)
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-5eb7f8e26f4so583529eaf.2
 for <xen-devel@lists.xenproject.org>; Fri, 18 Oct 2024 01:43:00 -0700 (PDT)
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
X-Inumbo-ID: faed2d1c-8d2c-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729240979; x=1729845779; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xVua38eTNwsaYkmdKKirirqsAZkuuYqPZOoYR9T/JuM=;
        b=JCOc3jdFKSvR/leAODcGkyuLyFoZF7j9qX62Gszj/Bqd4QnbSnFnk+WC6IfpcY5d1D
         ti4okDP3sRX1fs9d7Pb8A8YIfhRJJhpkvPVT8Tgac3KQau9mth0zlPhbItoPQ4hlCtXU
         qUbbFV8iOBYihpc1dUxf9YZj/kJhL731/zC2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729240979; x=1729845779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xVua38eTNwsaYkmdKKirirqsAZkuuYqPZOoYR9T/JuM=;
        b=Xudhq+nEald2+PS8qcYa0uGGHqxDQPqqUvS2Prv8aX0G/UEjm9lNEz1AemeWsM1x2+
         Hq25Yy+qZnhvYzELBaeOiQqSFZS1eT4ELa1sq7+kq+AIgkzpPXiLHFow/ADTAK7FkrZ2
         BGBE9rciGT8vouuckb4qgVbPgGLSzKe44tg6sCprjx2KdI33w5wDxQHmqZt5NJjtfcZo
         iwDGL2q+niYcAsSfrP64Yg4hINCdF6+5yX+oaSs5op0qDhc3T+IycwiDEp6Z9ys72+w4
         KyEKbNSBiAIkcDiP/Ee5GMVLK3hJrFrtguNYXSyFI/BU2RGEUpbIH8pEnIGF6m/yeecX
         Durw==
X-Gm-Message-State: AOJu0YwbK2xnJYFqZmUlSq0TO8Z98DPQc/aawgmhgXgBLeuoePeE/7GD
	3jZA4p6sJciqkpiEJM9G40X2frE8aT4IEaFUH9qWGFZafsCVBe20pLDlYIAwZwoTQpHvuLmSWMb
	RvKn9CWQDqthsvHPrOtj/ZQNz8vpfxgxE+rXTvw==
X-Google-Smtp-Source: AGHT+IGxKGHL0rgOsSkBBNov75N9/8afZYcuBghKn0m2YiulyXmOG2drJU+1kAwXh9c3xQIPRL4yVUjBhJFJHrqs4VM=
X-Received: by 2002:a05:6820:f08:b0:5e1:e65d:5148 with SMTP id
 006d021491bc7-5eb8b6e59b0mr1031888eaf.6.1729240979319; Fri, 18 Oct 2024
 01:42:59 -0700 (PDT)
MIME-Version: 1.0
References: <20241017133123.1946204-1-frediano.ziglio@cloud.com>
 <20241017133123.1946204-2-frediano.ziglio@cloud.com> <a5745a93-1d82-45f1-bb88-81a737ebcce3@citrix.com>
In-Reply-To: <a5745a93-1d82-45f1-bb88-81a737ebcce3@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Fri, 18 Oct 2024 09:42:48 +0100
Message-ID: <CACHz=ZhULqJpE8UK7kZQN0He5Poc85Cr6heTCKj1KLjxcPA6XQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] x86/boot: create a C bundle for 32 bit boot code
 and use it
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2024 at 6:13=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> On 17/10/2024 2:31 pm, Frediano Ziglio wrote:
> > The current method to include 32 bit C boot code is:
> > - compile each function we want to use into a separate object file;
> > - each function is compiled with -fpic option;
> > - convert these object files to binary files. This operation removes GO=
P
> >   which we don't want in the executable;
> > - a small assembly part in each file add the entry point;
> > - code can't have external references, all possible variables are passe=
d
> >   by value or pointer;
> > - include these binary files in head.S.
> >
> > There are currently some limitations:
> > - code is compiled separately, it's not possible to share a function
> >   (like memcpy) between different functions to use;
> > - although code is compiled with -fpic there's no certainty there are
> >   no relocations, specifically data ones. This can lead into hard to
> >   find bugs;
> > - it's hard to add a simple function;
> > - having to pass external variables makes hard to do multiple things
> >   otherwise functions would require a lot of parameters so code would
> >   have to be split into multiple functions which is not easy.
> >
> > Current change extends the current process:
> > - all object files are linked together before getting converted making
> >   possible to share code between the function we want to call;
> > - a single object file is generated with all functions to use and
> >   exported symbols to easily call;
> > - variables to use are declared in linker script and easily used inside
> >   C code. Declaring them manually could be annoying but makes also
> >   easier to check them. Using external pointers can be still an issue i=
f
> >   they are not fixed. If an external symbol is not declared this gives =
a
> >   link error.
> >
> > Some details of the implementation:
> > - C code is compiled with -fpic flags (as before);
> > - object files from C code are linked together;
> > - the single bundled object file is linked with 2 slightly different
> >   script files to generate 2 bundled object files;
> > - the 2 bundled object files are converted to binary removing the need
> >   for global offset tables;
> > - a Python script is used to generate assembly source from the 2
> >   binaries;
> > - the single assembly file is compiled to generate final bundled object
> >   file;
> > - to detect possible unwanted relocation in data/code code is generated
> >   with different addresses. This is enforced starting .text section at
> >   different positions and adding a fixed "gap" at the beginning.
> >   This makes sure code and data is position independent;
> > - to detect used symbols in data/code symbols are placed in .text
> >   section at different offsets (based on the line in the linker script)=
.
> >   This is needed as potentially a reference to a symbol is converted to
> >   a reference to the containing section so multiple symbols could be
> >   converted to reference to same symbol (section name) and we need to
> >   distinguish them;
> > - --orphan-handling=3Derror option to linker is used to make sure we
> >   account for all possible sections from C code;
> >
> > Current limitations:
> > - the main one is the lack of support for 64 bit code. It would make
> >   sure that even the code used for 64 bit (at the moment EFI code) is
> >   code and data position independent. We cannot assume that code that
> >   came from code compiled for 32 bit and compiled for 64 bit is code an=
d
> >   data position independent, different compiler options lead to
> >   different code/data.
> >
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>
> This commit message is not particularly easy to follow.  Can I recommend
> the following:
>
> ---%<---
> x86/boot: Rework how 32bit C is linked/included for early boot
>
> Right now, the two functions which were really too complicated to write
> in asm are compiled as 32bit PIC, linked to a blob and included
> directly, using global asm() to arrange for them to have function semanti=
cs.
>
> This is limiting and fragile; the use of data relocations will compile
> fine but malfunction when used, creating hard-to-debug bugs.
>
> Furthermore, we would like to increase the amount of C, to
> deduplicate/unify Xen's boot logic, as well as making it easier to
> follow.  Therefore, rework how the 32bit objects are included.
>
> Link all 32bit objects together first.  This allows for sharing of logic
> between translation units.  Use differential linking and explicit
> imports/exports to confirm that we only have the expected relocations,
> and write the object back out as an assembly file so it can be linked
> again as if it were 64bit, to integrate with the rest of Xen.
>
> This allows for the use of external references (e.g. access to global
> variables) with reasonable assurance of doing so safely.
>
> No functional change.
> ---%<---
>
> which I think is an accurate and more concise summary of what's changing?
>

You cut half of the explanation, replacing with nothing.
Why is a script needed? Why 2 linking? How the new method detects
unwanted relocations?
Why wasn't possible to share functions?
Why using --orphan-handling option?

The description has been there for about 2 months without many objections.

> > diff --git a/xen/arch/x86/boot/.gitignore b/xen/arch/x86/boot/.gitignor=
e
> > index a379db7988..7e85549751 100644
> > --- a/xen/arch/x86/boot/.gitignore
> > +++ b/xen/arch/x86/boot/.gitignore
> > @@ -1,3 +1,4 @@
> >  /mkelf32
> > -/*.bin
> > -/*.lnk
> > +/build32.*.lds
> > +/built-in-32.*.bin
> > +/built-in-32.*.map
>
> /built-in-32.S too
>

Sure

> And from a glance at the file, this adjustment in the combine script too:
>
> -print('\n\t.section\t.note.GNU-stack,"",@progbits', file=3Dout)
> +print('\n\t.section .note.GNU-stack, "", @progbits', file=3Dout)
>
> to have both .section's formatted in the same way.
>

Fine

>
> > diff --git a/xen/arch/x86/boot/build32.lds b/xen/arch/x86/boot/build32.=
lds.S
> > similarity index 70%
> > rename from xen/arch/x86/boot/build32.lds
> > rename to xen/arch/x86/boot/build32.lds.S
> > index 56edaa727b..e3f5e55261 100644
> > --- a/xen/arch/x86/boot/build32.lds
> > +++ b/xen/arch/x86/boot/build32.lds.S
> > <snip>
> >          *(.text)
> >          *(.text.*)
> > -        *(.data)
> > -        *(.data.*)
> >          *(.rodata)
> >          *(.rodata.*)
> > +        *(.data)
> > +        *(.data.*)
>
> Reordering .data and .rodata really isn't necessary.
>

Yes, I asked in some comment. No problem, can be removed.

I'll write another commit. Not anyway strong, this is the general
order of sections. Here won't make much difference, usually you want
this order to minimize page changes (both text and rodata are
read-only).


> I'd just drop this part of the diff.  I have some different follow-up
> for it anyway, which I've been holding off until after this first change
> is sorted.
>
> Everything here I'm happy to fix up on commit, if you're ok with me
> doing so.
>
> ~Andrew

Frediano

