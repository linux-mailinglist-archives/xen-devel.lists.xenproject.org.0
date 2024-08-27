Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E93B9960CB8
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 15:57:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784063.1193430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siwh0-0003Js-R8; Tue, 27 Aug 2024 13:57:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784063.1193430; Tue, 27 Aug 2024 13:57:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siwh0-0003Gn-Mw; Tue, 27 Aug 2024 13:57:06 +0000
Received: by outflank-mailman (input) for mailman id 784063;
 Tue, 27 Aug 2024 13:57:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YF2W=P2=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1siwgy-0003EW-Ez
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 13:57:04 +0000
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [2607:f8b0:4864:20::c31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c06b452-647c-11ef-a0b0-8be0dac302b0;
 Tue, 27 Aug 2024 15:57:02 +0200 (CEST)
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-5de9809a38aso1350359eaf.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 06:57:02 -0700 (PDT)
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
X-Inumbo-ID: 3c06b452-647c-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724767021; x=1725371821; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ePsRRUJJZrjmR3x3E7P8pxZnFKK+dnjTPbEy/WvWuI=;
        b=BukuysBgKnxuQpkN9Vo+5qXF4r0CRwsPI7RCacnjTBxRhiMRPcUF15lmAlSHDCSC0H
         hhJpickofJ2GVIJWdjyEuKFJGf2adHnYqayJwQ0x0shheAOw2kDbo3aG+3M0FEcuS6lv
         4Ipl1+4f6PWeCaCdZ0vgU7luUX2K7DPAXXzRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724767021; x=1725371821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ePsRRUJJZrjmR3x3E7P8pxZnFKK+dnjTPbEy/WvWuI=;
        b=gQJ1q/MtP99xVRU0mOAX8Tinr13ZaFPX3y2V4kpoXwz2R7WAiOIvX1bEKcvwBDQlfW
         rVyE2tLAOnPLNooRPWmvsTN/Z1nTbDOwk+JhjPsomuDBVkXxJDIMRa1OV1AsqN5izvzG
         y5RZUiRFCb/vAsYcfNWwDPRjPsQCu0lT4oHcUDkC/H+fMvqxdc2Q2zpIpu5oo9klyvDS
         7CSbdbSFcS9a1S13cShVsvGKall5Ix81wGHZbF4lZQnfVwiCl8k4vusE7vHu5F8o4MRf
         3V+WhQmkHFD3RZOofJAzvaNzs2Yh18KkIF6nQolNdqUS90Ps0T/1dOBgK0CIMfPytusq
         4aDg==
X-Forwarded-Encrypted: i=1; AJvYcCUoNRrbczoDH31dgAfIQA1AbMaCd/q6GUiYkorNtaFdhYt43c8FaegSQXVzvadycHN0Ypu2//9Iu08=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwdYLfUNu7QztdpHKN6UZyLQup8U8krjdAp5zOprDXGjk+CoBIR
	fsac4sy27Xw/EDH+jof7nDeBIX8SfkiuVgMdKs+CX+o5jb0hmPqyT+JGlgWaxk+Ka8TFgMegYjf
	R+MYPMmLsMMvETxlgvT+BwNSReYgViN3yhrDdcA==
X-Google-Smtp-Source: AGHT+IEd65LqBC7abzN/zts5K1hpuW+hWIywvh/pydS8ElMKLeDbkWayR1d96BJY1QYVmAi+GGjP7qx2CbIQ5BFfvpk=
X-Received: by 2002:a05:6820:2228:b0:5da:99f5:8fd6 with SMTP id
 006d021491bc7-5dcc5b68c45mr15378505eaf.0.1724767018114; Tue, 27 Aug 2024
 06:56:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240822152953.489136-1-frediano.ziglio@cloud.com> <55e6dc6c-344a-4483-90c2-e414ef4bc869@suse.com>
In-Reply-To: <55e6dc6c-344a-4483-90c2-e414ef4bc869@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Tue, 27 Aug 2024 14:56:47 +0100
Message-ID: <CACHz=ZgbU3-HBgoDC9ws=cCK10B2D4K2JxjLN3_0YGoksVep8w@mail.gmail.com>
Subject: Re: [PATCH] Avoid additional relocations in trampoline code
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Alejandro Vallejo <alejandro.vallejo@cloud.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2024 at 9:21=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 22.08.2024 17:29, Frediano Ziglio wrote:
> > The trampoline could have "manual" relocation entries (created
> > by assembly macros and some code to use them) and (in case of PE)
> > normal executable relocations.
> > Remove all normal executable ones. In this way we don't have to
> > worry about applying both correctly (they need proper order
> > which is hard to spot looking at the code).
> >
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>
> I think this wants splitting into one patch replacing sym_offs() and a
> 2nd one introducing the hand-crafted __XEN_VIRT_START additions (which
> may want macro-izing). Plus the justification for the change wants
> extending, to actually explain what the problem is - after all there's
> no issue anywhere right now.
>

Should I explain the time dependency issue with source code?
I suppose I can describe where currently is and why it would be better
to have it removed (honestly I though I did but reading the commit
message I didn't).
Maybe for search reasons it would be better to define 2 macros like
the following?

#define phys_addr(sym) sym ## _pa
#define virt_addr(sym) sym ## _va

This way, for instance, searching for the "__high_start" word (like
"grep -rw __high_start") would produce a result.

> > --- a/xen/arch/x86/boot/trampoline.S
> > +++ b/xen/arch/x86/boot/trampoline.S
> > @@ -73,7 +73,7 @@ trampoline_protmode_entry:
> >          mov     %ecx,%cr4
> >
> >          /* Load pagetable base register. */
> > -        mov     $sym_offs(idle_pg_table),%eax
> > +        mov     $idle_pg_table_pa, %eax
> >          add     bootsym_rel(trampoline_xen_phys_start,4,%eax)
> >          mov     %eax,%cr3
> >
> > @@ -113,7 +113,7 @@ trampoline_protmode_entry:
> >          .code64
> >  start64:
> >          /* Jump to high mappings. */
> > -        movabs  $__high_start, %rdi
> > +        movabs  $__high_start_pa + __XEN_VIRT_START, %rdi
> >          jmpq    *%rdi
> >
> >  #include "video.h"
> > --- a/xen/arch/x86/boot/wakeup.S
> > +++ b/xen/arch/x86/boot/wakeup.S
> > @@ -99,7 +99,7 @@ wakeup_32:
> >          mov     $bootsym_rel(wakeup_stack, 4, %esp)
> >
> >          # check saved magic again
> > -        mov     $sym_offs(saved_magic),%eax
> > +        mov     $saved_magic_pa, %eax
> >          add     bootsym_rel(trampoline_xen_phys_start, 4, %eax)
> >          mov     (%eax), %eax
> >          cmp     $0x9abcdef0, %eax
> > @@ -112,7 +112,7 @@ wakeup_32:
> >          mov     %ecx, %cr4
> >
> >          /* Load pagetable base register */
> > -        mov     $sym_offs(idle_pg_table),%eax
> > +        mov     $idle_pg_table_pa ,%eax
> >          add     bootsym_rel(trampoline_xen_phys_start,4,%eax)
> >          mov     %eax,%cr3
> >
> > @@ -156,7 +156,7 @@ wakeup_32:
> >          .code64
> >  wakeup_64:
> >          /* Jump to high mappings and the higher-level wakeup code. */
> > -        movabs  $s3_resume, %rbx
> > +        movabs  $s3_resume_pa + __XEN_VIRT_START, %rbx
> >          jmp     *%rbx
> >
> >  bogus_saved_magic:
>
> With the sym_offs() uses gone, I think it would be best if the macro was
> #undef-ed ahead of the inclusion of trampoline.S. Since x86_64.S uses the
> macro, that'll require careful re-arrangement of #include order.
>

I think you mean including the trampoline after including x86_64.S in
head.S. I can do it.

> > --- a/xen/arch/x86/xen.lds.S
> > +++ b/xen/arch/x86/xen.lds.S
> > @@ -71,7 +71,12 @@ SECTIONS
> >    __2M_text_start =3D .;         /* Start of 2M superpages, mapped RX.=
 */
> >  #endif
> >
> > -  start_pa =3D ABSOLUTE(start - __XEN_VIRT_START);
> > +#define DEFINE_PA_ADDRESS(sym) sym ## _pa =3D ABSOLUTE(sym - __XEN_VIR=
T_START)
> > +  DEFINE_PA_ADDRESS(start);
> > +  DEFINE_PA_ADDRESS(saved_magic);
> > +  DEFINE_PA_ADDRESS(idle_pg_table);
> > +  DEFINE_PA_ADDRESS(__high_start);
> > +  DEFINE_PA_ADDRESS(s3_resume);
> >
> >    . =3D __XEN_VIRT_START + XEN_IMG_OFFSET;
> >    _start =3D .;
>
> For the cases where in assembly code you add __XEN_VIRT_START this is pre=
tty
> odd: You subtract the value here just to add it back there. Did you consi=
der
> a more straightforward approach, like introducing absolute xxx_va symbols=
?
>

I didn't consider. Would something like

#define DEFINE_ABS_ADDRESSES(sym) \
   sym ## _pa =3D ABSOLUTE(sym - __XEN_VIRT_START); \
   sym ## _va =3D ABSOLUTE(sym)

make sense? Maybe the _pa and _va suffixes are too similar? Maybe
_physaddr and _virtaddr? Or use capical letters and macros (as above)
to avoid possible clashes?

> Also, as a general request: Can you please become used to adding meaningf=
ul
> subject prefixes to your patches?
>

Sure

> Jan

Frediano

