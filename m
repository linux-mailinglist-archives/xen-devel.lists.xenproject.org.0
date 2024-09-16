Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B02979E84
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 11:31:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799354.1209338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq83i-00062R-T5; Mon, 16 Sep 2024 09:30:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799354.1209338; Mon, 16 Sep 2024 09:30:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq83i-00060Z-QM; Mon, 16 Sep 2024 09:30:14 +0000
Received: by outflank-mailman (input) for mailman id 799354;
 Mon, 16 Sep 2024 09:30:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wse+=QO=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sq83h-00060T-ME
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 09:30:13 +0000
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [2607:f8b0:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45ae8d16-740e-11ef-a0b6-8be0dac302b0;
 Mon, 16 Sep 2024 11:30:12 +0200 (CEST)
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-3e040388737so2046421b6e.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2024 02:30:12 -0700 (PDT)
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
X-Inumbo-ID: 45ae8d16-740e-11ef-a0b6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1726479011; x=1727083811; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwqg/7P+sTKYDec3SqnWcdpXhJ9Ej+mjaUVbHUBpS2o=;
        b=HqA5O0HGVt+TjOmxOoOBMxSXqHzbOLd7VCyJ8oveI+ugTuSqRtif7KVohgUnklBQ0d
         3cyKCWiTyAnYuJrU0YE59byLSeH76IqjEMEvgFuZ/e0I02C7VFo9SfdUiNRFk68Pn8mo
         zdLZ4wCHzZ+8CFD98eKYS0JxOfcbd4UcbgrJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726479011; x=1727083811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gwqg/7P+sTKYDec3SqnWcdpXhJ9Ej+mjaUVbHUBpS2o=;
        b=IGIsva6KDJG5EA8BUZfe0877sIDWfqh/aO/pn2j5caNdmDX9DAG+U6PZjOadRHqzRZ
         3WvK8juu9Lw5Er8LUApVkiJ8Y9dz8r2s+g/+rNKW40vVjZ2TnzXW4GnpsjjBb25MkeLf
         r7kUEr3bml36GpN7Qhwvcvw4cU0QfhsOBoO5qDmIph6PqOONhQBbZM70gzQILHnLWMyl
         f2j6MS82T3cVDOqwPez6mESvdt/LDx5aH2CZiiQIdTxe6P4NaAYeFYM5bBxv1JPKGy71
         ej1DTUYFmJnvFUwchFbQkobWj64WY+BYvp8tzt58d4hJyHKiLdhVSQOSSDIwcnd8M7v6
         mSgA==
X-Forwarded-Encrypted: i=1; AJvYcCWZnMrc7+yFD77JpR9GRy3+BWl9bE+CkKuhQJXFB1oO4VVzBoxm0gadgn33kJDB/y9UziFRf+nrySs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZS58WKAtXwBA/ldi8z9QyoO/2wlgGbHRYIcAhM18BbnLo+7Ww
	hBRK/eb9DAk9iQiOJlPF9zxLnEZm7Jtn+tL/a8AQdo+2gfaYcAaPZZ6G4bRyYYQnpLE7csk1vWR
	w2Rwxml1gkDsspMzDEKUh+2vf2+GNaykTcFeJkg==
X-Google-Smtp-Source: AGHT+IGlVOG4DCSBHBWRd2d1ZYi8ZSoouPxEOqzr4LCVRgTNur+JA6hqE0vl9idN8FJLC/GhPZ2Ia3vWDVEtmGVmyX0=
X-Received: by 2002:a05:6808:10c1:b0:3e0:37ca:1b29 with SMTP id
 5614622812f47-3e071b32a14mr7505434b6e.46.1726479011309; Mon, 16 Sep 2024
 02:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240828091956.127760-1-frediano.ziglio@cloud.com> <dd3364e4-7f40-4963-a0f1-f743527c9d9d@suse.com>
In-Reply-To: <dd3364e4-7f40-4963-a0f1-f743527c9d9d@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 16 Sep 2024 10:30:00 +0100
Message-ID: <CACHz=ZhsaZsDfNf1KDoaLe-kCkf-cLL-2r-Pi3t0TaeALW0hvw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] x86/boot: Avoid relocations in trampoline code to
 physical addresses
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 14, 2024 at 7:39=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 28.08.2024 11:19, Frediano Ziglio wrote:
> > The trampoline could have "manual" relocation entries (created
> > by assembly macros and some code to use them) and (in case of PE)
> > normal executable relocations.
> > Remove some normal executable ones. In this way we don't have to
> > worry about applying both correctly (they need proper order
> > which is hard to spot looking at the code).
>
> I don't theink the order of applying relocations matters - the overall
> outcome will be the same for any order. What does matter is ...
>
> > Specifically in efi_arch_post_exit_boot trampoline is copied after
> > fixing relocations with efi_arch_relocate_image.
>
> ... whether they're applied by the time certain operations take place.
>
> > These time dependencies
> > between different part of code are hard to spot making hard to change
> > code.
>
> Relocation and copying sitting literally next to each other makes it
> not really hard to spot, imo.
>

I was thinking that there should probably be a single function that
does the relocation and also copy the trampoline in the final spot.

> > In this case the copy is done in a state where code should be run
> > at higher locations so it would be better to reduce the code between
> > calling efi_arch_relocate_image and jumping to higher location.
> > Absolute symbols are defined by linker in order to avoid relocations.
> > These symbols use a "_PA" suffix to avoid possible clashes.
> > phys_addr macro is used to make more clear the address we want and maki=
ng
> > symbol search easier.
>
> At the price of introducing more absolute symbols, which are often
> frowned upon. For example I fear this may (and the 2nd patch will)
> get in the way of us (finally) randomizing Xen's virtual position
> at load/boot time. Especially with xen.efi (where we already have
> the base relocs) this shouldn't be overly difficult to arrange - as
> long as there are no absolute symbols to take care of (ones used
> only very early are okay of course).
>

Considering that bootloaders (both GRUB and EFI) uses 1-to-1 mapping
or physical addressing and that we wrap our 64 bit ELF in a 32 bit ELF
I would assume that we want the randomization done by our code and not
by the bootloader. In this case, I would suggest designing the output
in order to use position independent code/data and do the
randomization/relocation needed. That involves doing something similar
to mkelf32 also for EFI output.
This goes quite a lot out of the target of this series, but I agree
this series clash a bit with address randomization (going in a
different direction).
I suppose I can simply respect the order of calls and drop this series.

> > --- a/xen/arch/x86/boot/head.S
> > +++ b/xen/arch/x86/boot/head.S
> > @@ -870,8 +870,10 @@ cmdline_parse_early:
> >  reloc:
> >          .incbin "reloc.bin"
> >
> > +#include "x86_64.S"
> > +
> > +        .section .init.text, "ax", @progbits
> > +
> >  ENTRY(trampoline_start)
> >  #include "trampoline.S"
> >  ENTRY(trampoline_end)
> > -
> > -#include "x86_64.S"
>
> I take it that this is superseded by the patch introducing
> .init.trampoline?
>

No, they happen to clash/conflict and looks similar because they move
the trampoline inclusion later but for completely different reasons,
one for section continuation, the other for macro preservation.

> Jan

Frediano

