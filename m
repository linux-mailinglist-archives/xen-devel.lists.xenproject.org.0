Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60847956EC0
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2024 17:31:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.779820.1189496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg4Kn-0002Np-1N; Mon, 19 Aug 2024 15:30:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 779820.1189496; Mon, 19 Aug 2024 15:30:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg4Km-0002LR-Un; Mon, 19 Aug 2024 15:30:16 +0000
Received: by outflank-mailman (input) for mailman id 779820;
 Mon, 19 Aug 2024 15:30:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lvcB=PS=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sg4Kl-0002LE-ME
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2024 15:30:15 +0000
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [2607:f8b0:4864:20::c34])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee09eebd-5e3f-11ef-a506-bb4a2ccca743;
 Mon, 19 Aug 2024 17:30:14 +0200 (CEST)
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-5da6865312eso3053052eaf.3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2024 08:30:14 -0700 (PDT)
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
X-Inumbo-ID: ee09eebd-5e3f-11ef-a506-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724081413; x=1724686213; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=90hQxXr1uwL6SWxp9EIIRDdoZE6EuASCWeLnxli+oTI=;
        b=c1bTPK59IV1/pm2fW+w4ijP6WYJVxeiPEqdp5IqH/EBRFRYieydsuiMjgZ4QqHmu1d
         N0b+6BIJV13rBDelZtixLogK5DWSXnd7l7LeB7zwQSxUrUGQhTxXtvG3SrnwhzlzTadO
         xTdX6rFJUu2pj+XaCRPlZFJKbz7yHzWQm3q3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724081413; x=1724686213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=90hQxXr1uwL6SWxp9EIIRDdoZE6EuASCWeLnxli+oTI=;
        b=iqLpLRNE09QI29/JYSp9mBrJf3pw/YLdSh9PJTnIaxQKoI0XFOiPeQoalPY9aMS31q
         jK6WlSDNO3f7RIxTNwwxXkGxWM2Frx0y8sXdrFLzdCX4BaJUQdRxwIifGu5XbyA7FkUf
         VgoNeHkxdefru8tKZerBncfeYV6VHDH39ktfnj0YTEVGMAq8nOFkGCbdUE66ocwKKUOV
         5tXrxsYTcOmukKCir5e9/Fhiu8Vo88h2m+WzenhZOxZpHCfPfGZ0TJhPpFG3U37Ivzhv
         RO7uHF7fzcSZzoy5IDl7ky13jfick/DcjEuHkqGeLxTw/3qrOBE4UPhFmw96BwFEQQOo
         My7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUEYBzIb51foAE+ISrA2lJg2N6DLdJsveSWwYs2z25Cp0M0zDASp4Vz7hR96CqSB5jUzDL9e6qC1ot83Te2SSufrGYNQShTZgFkcatvv5Q=
X-Gm-Message-State: AOJu0Yy6p3GSUZIqbVd+JmpX8BGIZS3jf0y+XEgILsX0LkPG+zg6I0dF
	uCBHKFp/EWiwzq6R8y+JLnqBBjJzyvgBLQKfaiP7LZnIIiR8CZhBXvuxWSAoIgt7rg4a3ze3DGa
	XMTw050acv+Y5iVn6yT+YgbHKKqr3Z8Ma3RRtsg==
X-Google-Smtp-Source: AGHT+IHblPiAR0Tp2543f0LHyMLWGcj8uW6YWn2KSU+X7Wu4R158Ry069QHTAxqwTi6SSHncJAgEfJKNHuBjB2P1hLc=
X-Received: by 2002:a05:6820:2228:b0:5ba:ec8b:44b5 with SMTP id
 006d021491bc7-5da9800d2e4mr12583377eaf.3.1724081413587; Mon, 19 Aug 2024
 08:30:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240807134819.8987-1-alejandro.vallejo@cloud.com>
 <20240807134819.8987-2-alejandro.vallejo@cloud.com> <ad72cc97-b9dd-4e7e-93f6-333805e40785@suse.com>
 <CACHz=Zh7wK58mbB762fnevHEKW9qhp-NRJ6buNe1b-qLxP0qPg@mail.gmail.com>
 <b9b40658-ff13-4240-98a2-4811411e31b6@suse.com> <CACHz=Zj8h-TeDa2Ey8EKKEOpXJqx9MnL+AGpdTBY1B8PZ0==mA@mail.gmail.com>
 <a3d901f9-0a74-4cef-b616-77d338dda314@suse.com>
In-Reply-To: <a3d901f9-0a74-4cef-b616-77d338dda314@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 19 Aug 2024 16:30:02 +0100
Message-ID: <CACHz=ZgCd81NV7yXZ-Lud-QP8sj05mH9N0c-1z=eBv3pz2ENAw@mail.gmail.com>
Subject: Re: [PATCH 1/5] x86: Put trampoline in .init.data section
To: Jan Beulich <jbeulich@suse.com>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 3:30=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 19.08.2024 16:16, Frediano Ziglio wrote:
> > On Thu, Aug 8, 2024 at 9:54=E2=80=AFAM Jan Beulich <jbeulich@suse.com> =
wrote:
> >> On 08.08.2024 10:00, Frediano Ziglio wrote:
> >>> On Thu, Aug 8, 2024 at 8:34=E2=80=AFAM Jan Beulich <jbeulich@suse.com=
> wrote:
> >>>> On 07.08.2024 15:48, Alejandro Vallejo wrote:
> >>>>> This change allows to put the trampoline in a separate, not executa=
ble
> >>>>> section. The trampoline contains a mix of code and data (data which
> >>>>> is modified from C code during early start so must be writable).
> >>>>> This is in preparation for W^X patch in order to satisfy UEFI CA
> >>>>> memory mitigation requirements.
> >>>>
> >>>> Which, aiui, has the downside of disassembly of the section no longe=
r
> >>>> happening by default, when using objdump or similar tools, which go =
from
> >>>> section attributes. Why is it being in .init.text (and hence RX) not
> >>>> appropriate? It should - in principle at least - be possible to avoi=
d
> >>>> all in-place writing to it, but instead only ever write to its reloc=
ated
> >>>> copy. Quite a bit more code churn of course.
> >>>>
> >>>> I wonder if we shouldn't put the trampoline in its own section, RWX =
in
> >>>> the object file, and switched to whatever appropriate in the binary
> >>>> (which really may be RX, not RW).
> >>>
> >>> We cannot have RWX to satisfy UEFI CA memory mitigation, that's why I
> >>> had to move it, code sections should not be writeable. We can mark
> >>> either RX or RW but we use the data very early so we are not able to
> >>> change the permissions (we can try with all complications that this
> >>> could bring like how to report an error at so early stages).
> >>
> >> The early writing could be done away with, as indicated. There's not
> >> really any strict requirement to write to the trampoline region within
> >> the Xen image. All updates to it could in principle be done after it
> >> was copied into low memory. Then (and of course only then) could it be
> >> part of an RX section in the image, maybe .init.text, maybe a separate
> >> .trampoline section.
> >
> >    how strong are you on this? Is this "objdump" thing such a big
> > issue? The code contains a lot of 16 bit code which would require
> > additional options anyway. Won't be an assembly listing output more
> > helpful instead?
>
> Well. Whether a listing can serve as a stand-in depends on the situation.
> Not being able to disassemble code (e.g. also in the final executable)
> can be pretty limiting. The need to pass extra options is related, but
> not really an argument against.
>

If some code is inside some data section (in the final binary) you can
use -D option to disassemble everything, even data. For instance a
"objdump -D xen-syms -m i8086" and look for some "trampoline" symbols.
Yes, the output of -D is surely longer than -d.

> > I tried to change the code to change only the final copy of the
> > trampoline but it looks like lot of code assumes it can change the
> > source of it (that is requiring it to be in a writeable section). For
> > instance EFI change settings directly and then allocate space for the
> > copy later. The allocation could be moved but there's a fallback on
> > code that assumes that early allocation can fail.
>
> Right, if there's too much standing in the way then we need to look at
> possible alternatives.
>
> > The trampoline relocation is done with PC relative addressing which is
> > helpful if you are changing the source directly, not the copy.
>
> I'm afraid I can't make a connection between this and what we're
> discussing.
>

The current C code (EFI, xen/arch/x86/efi/efi-boot.h) to relocate the
trampoline is
    for ( trampoline_ptr =3D __trampoline_rel_start;
          trampoline_ptr < __trampoline_rel_stop;
          ++trampoline_ptr )
        *(u32 *)(*trampoline_ptr + (long)trampoline_ptr) +=3D phys;
the formulae is easy as relative but you would need to change to something =
like
    long trampoline_offset =3D phys - (long)trampoline_start;
    for ( trampoline_ptr =3D __trampoline_rel_start;
          trampoline_ptr < __trampoline_rel_stop;
          ++trampoline_ptr )
        *(u32 *)(*trampoline_ptr + (long)trampoline_ptr +
trampoline_offset) +=3D phys;
which is surely more confusing, probably you want to change
relocations (code in trampoline.S) to offsets from trampoline_start
resulting into
    for ( trampoline_ptr =3D __trampoline_rel_start;
          trampoline_ptr < __trampoline_rel_stop;
          ++trampoline_ptr )
        *(u32 *)(*trampoline_ptr + phys) +=3D phys;

well, not impossible, you will need to change trampoline code, and the
2 code to relocate it.

> > Could I ouput the trampoline in a code section ("ax" instead of "aw")
> > and then later move it into .init.data section assuring .init.data is
> > writeable but not executable?
>
> Could you go into a little more detail on what you mean here? At the
> first glance my reaction is "yes, sure, why not", but much depends on
> what exactly is meant.
>

For instance you could put the trampoline into a
    .section .init.trampoline, "awx", @progbits
section (having the "x" will be disassembled by objdump -d head.o).
Then in xen/arch/x86/xen.lds.S in the .init.data section having something l=
ike
...
  DECL_SECTION(.init.data) {
       *(.init.bss.stack_aligned)
      (.init.trampoline)
   ...
this will put the trampoline in .init.data section of the final
object. At this point the .init.data containing code will have execute
permission that you would have to fix using objcopy command.
The final trampoline will be in a data section not executable so to
use objdump you will need the -D option, but not disassembling head.o.
In theory we could keep the temporary object file before the objcopy
adjustment to avoid the -D but I don't think it would save a lot of
burdain.

> Jan

On a related subject I'm trying to come up to a solution in order to
- write more boot code in C instead of assembly;
- avoid duplication between C and assembly code (like trampoline
relocation or page table initialization);
- avoid having to pass pointers to C code (like we do for
xen/arch/x86/boot/reloc.c);
- avoid having bugs like
https://lists.xenproject.org/archives/html/xen-devel/2024-08/msg00784.html,
I'd prefer if compilation would fail in this case instead a bug hidden
in some code path potentially seldomly exercised;
- making possible to reuse code between 32 bit C code (like code in
copy_string in xen/arch/x86/boot/reloc.c and strlen in
xen/arch/x86/boot/cmdline.c).
I have an idea about it, not sure how easy and nice it could be.

Frediano

