Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C2A9621CE
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 09:52:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784533.1193904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjDSu-0004e0-LW; Wed, 28 Aug 2024 07:51:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784533.1193904; Wed, 28 Aug 2024 07:51:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjDSu-0004ap-IU; Wed, 28 Aug 2024 07:51:40 +0000
Received: by outflank-mailman (input) for mailman id 784533;
 Wed, 28 Aug 2024 07:51:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rm2h=P3=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sjDSt-0004aj-8w
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 07:51:39 +0000
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [2607:f8b0:4864:20::c32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a475609-6512-11ef-a0b0-8be0dac302b0;
 Wed, 28 Aug 2024 09:51:37 +0200 (CEST)
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-5d5c7f24372so4756941eaf.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 00:51:37 -0700 (PDT)
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
X-Inumbo-ID: 5a475609-6512-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724831496; x=1725436296; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bP0plvhO8YHIsonleWKg3q16oNG+zil+AkCgzONfyBQ=;
        b=SbTajC1TCr40RuRF0Wy8PLwiSB7ZUN8WyFVN+9M0qN29JJy+UHX8WGFt6mWjpqU4un
         u8cpdGoJxGSK3rxYs8bqAGoAyd/EDVvCQKe8lfhfYpTQCfkV4eaxJnQmpFrPns2O0bjE
         I3pbiabiQ+HOQXAOILUsa1f3km/tTbjVnm5kY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724831496; x=1725436296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bP0plvhO8YHIsonleWKg3q16oNG+zil+AkCgzONfyBQ=;
        b=Xvj293mevAB0gwBG93BV5uXZzjrwXkmPvAUH1QqtFGOJi9xlWLH6fb1TMO/aCmvdBG
         D9lkuG9Nc2NxNLwSNwqj9ynX2nhxD943Xz3dnE/Y7jZLo7refxhnYD4dVxnzZuYtsYLh
         /Yn+VuQUwreSvgA6E7OJBXKSEdonHxAYO9MPewRfe3EgSgnhOd/6ItobiKC11/ov+8un
         +DpOxmo8z/fHqvlpDVBBlRInn2M0GVXaESQuApyitY9Od1cCa/fBfmM1bglXAiNFwVSv
         RgTwsT1aVGlzxptsgXBOnOmCwr60z9Aebwx4fgx8yOG+deJ5JrL4xMnFZUdwSXD2ZzVj
         ZvdA==
X-Forwarded-Encrypted: i=1; AJvYcCX+jfbftQojmhcGxxQWsbTsRr4EhVjjNwEkrsMFWrxVZqIkG7H5ykUt+MBe2QArw0ehbAwQbhnXBc4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwUEI81c3e/sohpf3+rcUvMkjf7lFHmf4SgY2ozWwO2IqciNW9a
	RD8ZqAhtsj9nH1Z11m3MTwdcBEZ61zLEnU77nVmSeuwJr/JYXZfDGWfaTZduJkreRzYrFFXo/JL
	M5GWcctYvbH7uH7Zqh+O4X51t/20P77wE12Oq8Q==
X-Google-Smtp-Source: AGHT+IESSV+TPXt8tKq9x8lQN6dWAmfZ92AelsD0FYE36oZjHpVkgT1RLgqbmnMLYkiwOJ9fm+2VH1huJjrctf6RdtI=
X-Received: by 2002:a05:6820:80f:b0:5dc:a733:d984 with SMTP id
 006d021491bc7-5df866c0974mr1211152eaf.1.1724831496412; Wed, 28 Aug 2024
 00:51:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240822152953.489136-1-frediano.ziglio@cloud.com>
 <55e6dc6c-344a-4483-90c2-e414ef4bc869@suse.com> <CACHz=ZgbU3-HBgoDC9ws=cCK10B2D4K2JxjLN3_0YGoksVep8w@mail.gmail.com>
 <527b3a0f-3e86-47aa-9092-e67df329b7e9@suse.com>
In-Reply-To: <527b3a0f-3e86-47aa-9092-e67df329b7e9@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Wed, 28 Aug 2024 08:51:25 +0100
Message-ID: <CACHz=ZgdCMbkgJfirf=O-kt0mRqUkjXVgfETjZqQbhH-URZ1cw@mail.gmail.com>
Subject: Re: [PATCH] Avoid additional relocations in trampoline code
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Alejandro Vallejo <alejandro.vallejo@cloud.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2024 at 4:50=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 27.08.2024 15:56, Frediano Ziglio wrote:
> > On Mon, Aug 26, 2024 at 9:21=E2=80=AFAM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >>
> >> On 22.08.2024 17:29, Frediano Ziglio wrote:
> >>> The trampoline could have "manual" relocation entries (created
> >>> by assembly macros and some code to use them) and (in case of PE)
> >>> normal executable relocations.
> >>> Remove all normal executable ones. In this way we don't have to
> >>> worry about applying both correctly (they need proper order
> >>> which is hard to spot looking at the code).
> >>>
> >>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> >>
> >> I think this wants splitting into one patch replacing sym_offs() and a
> >> 2nd one introducing the hand-crafted __XEN_VIRT_START additions (which
> >> may want macro-izing). Plus the justification for the change wants
> >> extending, to actually explain what the problem is - after all there's
> >> no issue anywhere right now.
> >
> > Should I explain the time dependency issue with source code?
>
> Time dependency? I guess I don't understand ...
>

You have a time dependency between 2 code path when one has to be
executed before/after another.
Some patterns are expected (you don't call a method on a destroyed
object) but nasty hidden ones makes code more complicated and less
robust, making code changes harder and program fragile.
In that specific case the copy of the trampoline, for EFI path, is
done after relocation rollback. In that specific code path, you are
executing code which is not meant to be executed at that location (now
should be executed at higher locations) hoping that compiler/binary
code can cope with it. The code should relocate back and switch to
higher locations as quick as possible.

> > I suppose I can describe where currently is and why it would be better
> > to have it removed (honestly I though I did but reading the commit
> > message I didn't).
> > Maybe for search reasons it would be better to define 2 macros like
> > the following?
> >
> > #define phys_addr(sym) sym ## _pa
> > #define virt_addr(sym) sym ## _va
> >
> > This way, for instance, searching for the "__high_start" word (like
> > "grep -rw __high_start") would produce a result.
>
> I assume it's best to keep everything there together, so see below.
>
> >> With the sym_offs() uses gone, I think it would be best if the macro w=
as
> >> #undef-ed ahead of the inclusion of trampoline.S. Since x86_64.S uses =
the
> >> macro, that'll require careful re-arrangement of #include order.
> >>
> >
> > I think you mean including the trampoline after including x86_64.S in
> > head.S.
>
> Yes.
>

That worked like a charm!

> >>> --- a/xen/arch/x86/xen.lds.S
> >>> +++ b/xen/arch/x86/xen.lds.S
> >>> @@ -71,7 +71,12 @@ SECTIONS
> >>>    __2M_text_start =3D .;         /* Start of 2M superpages, mapped R=
X. */
> >>>  #endif
> >>>
> >>> -  start_pa =3D ABSOLUTE(start - __XEN_VIRT_START);
> >>> +#define DEFINE_PA_ADDRESS(sym) sym ## _pa =3D ABSOLUTE(sym - __XEN_V=
IRT_START)
> >>> +  DEFINE_PA_ADDRESS(start);
> >>> +  DEFINE_PA_ADDRESS(saved_magic);
> >>> +  DEFINE_PA_ADDRESS(idle_pg_table);
> >>> +  DEFINE_PA_ADDRESS(__high_start);
> >>> +  DEFINE_PA_ADDRESS(s3_resume);
> >>>
> >>>    . =3D __XEN_VIRT_START + XEN_IMG_OFFSET;
> >>>    _start =3D .;
> >>
> >> For the cases where in assembly code you add __XEN_VIRT_START this is =
pretty
> >> odd: You subtract the value here just to add it back there. Did you co=
nsider
> >> a more straightforward approach, like introducing absolute xxx_va symb=
ols?
> >
> > I didn't consider. Would something like
> >
> > #define DEFINE_ABS_ADDRESSES(sym) \
> >    sym ## _pa =3D ABSOLUTE(sym - __XEN_VIRT_START); \
> >    sym ## _va =3D ABSOLUTE(sym)
> >
> > make sense? Maybe the _pa and _va suffixes are too similar? Maybe
> > _physaddr and _virtaddr? Or use capical letters and macros (as above)
> > to avoid possible clashes?
>
> I'd like to ask that we don't introduce symbols we don't actually use. He=
nce
> a single macro defining both is probably not going to be overly helpful. =
As
> to capital letters: I'm struggling with the "(as above)" - I don't see an=
y
> use of capital letters in symbol names being generated. But yes, I was go=
ing
> to suggest to consider _VA and _PA tags, precisely to reduce the risk of
> clashes.
>

Unfortunately this worked but is producing these warnings which are
pretty annoying:

ld: ./.xen.efi.0xffff82d040000000.0: stripping non-representable
symbol 'saved_magic_va' (value 0xffff82d040816018)

I tried to remove them somehow, but I didn't find any way (no hidden
symbols, not been able to force the linker to strip it and not
complain).
I think I'll get back to the single "pa" symbol, this time with _PA
suffix, maybe hidden, and adding macros (phys_addr/virt_addr) to make
clear the purpose.

> Jan

I'll try to split the patch as suggested, although it will be hard to
come with a sensible message for the second commit.

Regards,
  Frediano

