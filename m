Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE77960F31
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 16:56:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784145.1193539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sixcY-00056Z-Fm; Tue, 27 Aug 2024 14:56:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784145.1193539; Tue, 27 Aug 2024 14:56:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sixcY-00054Y-Cl; Tue, 27 Aug 2024 14:56:34 +0000
Received: by outflank-mailman (input) for mailman id 784145;
 Tue, 27 Aug 2024 14:56:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YF2W=P2=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sixcX-00054S-OW
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 14:56:33 +0000
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [2607:f8b0:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8beb2d15-6484-11ef-a0b0-8be0dac302b0;
 Tue, 27 Aug 2024 16:56:32 +0200 (CEST)
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-3db18c4927bso481546b6e.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 07:56:32 -0700 (PDT)
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
X-Inumbo-ID: 8beb2d15-6484-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724770591; x=1725375391; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3zfXWuWnfI6HwOBNf9fB4tWQH8n4IDdRYeIo3+qXDJ4=;
        b=icrkqucnVTczXypH4Ax7t+zH3GCBElZNmyrdMJMg+duMserA98Jt6YZDJX2m2rhquO
         EQ2HPXJlRi2D9QWtznSnIEK3I4sk6yILN2VaQ7qik+ZQs4CNdsex4PTJrfJwGpccHaCz
         AIxsBLLYrjeXQdhAE4BSXEAMz3dVMKHEYqQWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724770591; x=1725375391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3zfXWuWnfI6HwOBNf9fB4tWQH8n4IDdRYeIo3+qXDJ4=;
        b=X6U/SXGS47jCuJv/K6idZh5v+rUtq/opInG0BMEdK3QIMCFKzEb4m+OMNqpQef7UKh
         nf3IeLFSQfKkVEDzhuS4uCrYIogal/Qx6sYbXuVpool15r+V4ryLpTzGux03tZxY2Mur
         eEEyjia8HpO3GuyBZphVFBZYosf1+DuRAFLsz9Su27Uj21CjNJfbpFxDCOBtRtdSpvXM
         wPMdiAPEQtXMai73aZEiMrnoN2UvmgLCELK2frEmeAPL65ek7STVabl8HeJMkkaEuVa2
         MzrjGblRBY3N0NOKMvlTM4LY3/r99ymSYAR1qTXf18Te6UUc/p3iA4boCABo23sFYsEB
         5Fag==
X-Forwarded-Encrypted: i=1; AJvYcCVP7DRMNsbGIQ7NU/spohCe6eZa4MIxedGLjo2FNUbAnaXit17edw4hPeesBhLPMY3iMLuB8fnTtSQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyFtBP9EyUPelbr8a9KqhcU4smF69R+DS8C5aWkSnk+Q9GWvgva
	AB442MGeFt8ZyjJC0ldjU8u+DepEXHDqQMVuNwSA71OqEgcofvsTxE0TnkOzTZ7VM3xjB2Kbjoi
	ilSqRcsOlNK5kZL3U73oYJPLegU1l1g7k+WlEwA==
X-Google-Smtp-Source: AGHT+IGjXXXcTTgyMbsVSHGnJCBqRwt8RIWiyisA5OHp6yJviml7+zlcWbxaX0LtI+SYmAVZmygdCce96cwnRd5TERc=
X-Received: by 2002:a05:6808:144a:b0:3de:223a:89ad with SMTP id
 5614622812f47-3de2a89e8a8mr15236605b6e.29.1724770591064; Tue, 27 Aug 2024
 07:56:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240807134819.8987-1-alejandro.vallejo@cloud.com>
 <20240807134819.8987-2-alejandro.vallejo@cloud.com> <ad72cc97-b9dd-4e7e-93f6-333805e40785@suse.com>
 <CACHz=Zh7wK58mbB762fnevHEKW9qhp-NRJ6buNe1b-qLxP0qPg@mail.gmail.com>
 <b9b40658-ff13-4240-98a2-4811411e31b6@suse.com> <CACHz=Zj8h-TeDa2Ey8EKKEOpXJqx9MnL+AGpdTBY1B8PZ0==mA@mail.gmail.com>
 <a3d901f9-0a74-4cef-b616-77d338dda314@suse.com> <CACHz=ZgCd81NV7yXZ-Lud-QP8sj05mH9N0c-1z=eBv3pz2ENAw@mail.gmail.com>
 <f5519911-6a3a-468a-98ec-3345339847cd@suse.com>
In-Reply-To: <f5519911-6a3a-468a-98ec-3345339847cd@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Tue, 27 Aug 2024 15:56:20 +0100
Message-ID: <CACHz=ZhuFgTjbGJp-prENbPAM03SoGJ-=+8M1az_TZ3vsG2TEA@mail.gmail.com>
Subject: Re: [PATCH 1/5] x86: Put trampoline in .init.data section
To: Jan Beulich <jbeulich@suse.com>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 4:50=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 19.08.2024 17:30, Frediano Ziglio wrote:
> > On Mon, Aug 19, 2024 at 3:30=E2=80=AFPM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >> On 19.08.2024 16:16, Frediano Ziglio wrote:
> >>> On Thu, Aug 8, 2024 at 9:54=E2=80=AFAM Jan Beulich <jbeulich@suse.com=
> wrote:
> >>>> On 08.08.2024 10:00, Frediano Ziglio wrote:
> >>>>> On Thu, Aug 8, 2024 at 8:34=E2=80=AFAM Jan Beulich <jbeulich@suse.c=
om> wrote:
> >>>>>> On 07.08.2024 15:48, Alejandro Vallejo wrote:
> >>>>>>> This change allows to put the trampoline in a separate, not execu=
table
> >>>>>>> section. The trampoline contains a mix of code and data (data whi=
ch
> >>>>>>> is modified from C code during early start so must be writable).
> >>>>>>> This is in preparation for W^X patch in order to satisfy UEFI CA
> >>>>>>> memory mitigation requirements.
> >>>>>>
> >>>>>> Which, aiui, has the downside of disassembly of the section no lon=
ger
> >>>>>> happening by default, when using objdump or similar tools, which g=
o from
> >>>>>> section attributes. Why is it being in .init.text (and hence RX) n=
ot
> >>>>>> appropriate? It should - in principle at least - be possible to av=
oid
> >>>>>> all in-place writing to it, but instead only ever write to its rel=
ocated
> >>>>>> copy. Quite a bit more code churn of course.
> >>>>>>
> >>>>>> I wonder if we shouldn't put the trampoline in its own section, RW=
X in
> >>>>>> the object file, and switched to whatever appropriate in the binar=
y
> >>>>>> (which really may be RX, not RW).
> >>>>>
> >>>>> We cannot have RWX to satisfy UEFI CA memory mitigation, that's why=
 I
> >>>>> had to move it, code sections should not be writeable. We can mark
> >>>>> either RX or RW but we use the data very early so we are not able t=
o
> >>>>> change the permissions (we can try with all complications that this
> >>>>> could bring like how to report an error at so early stages).
> >>>>
> >>>> The early writing could be done away with, as indicated. There's not
> >>>> really any strict requirement to write to the trampoline region with=
in
> >>>> the Xen image. All updates to it could in principle be done after it
> >>>> was copied into low memory. Then (and of course only then) could it =
be
> >>>> part of an RX section in the image, maybe .init.text, maybe a separa=
te
> >>>> .trampoline section.
> >>>
> >>>    how strong are you on this? Is this "objdump" thing such a big
> >>> issue? The code contains a lot of 16 bit code which would require
> >>> additional options anyway. Won't be an assembly listing output more
> >>> helpful instead?
> >>
> >> Well. Whether a listing can serve as a stand-in depends on the situati=
on.
> >> Not being able to disassemble code (e.g. also in the final executable)
> >> can be pretty limiting. The need to pass extra options is related, but
> >> not really an argument against.
> >
> > If some code is inside some data section (in the final binary) you can
> > use -D option to disassemble everything, even data. For instance a
> > "objdump -D xen-syms -m i8086" and look for some "trampoline" symbols.
> > Yes, the output of -D is surely longer than -d.
>
> Well, no, I surely don't want to disassemble all data. Based on what I've
> observed in the past, I also wouldn't be surprised if objdump didn't get
> utterly confused by disassembling data, perhaps to the point of crashing.
>
> >>> Could I ouput the trampoline in a code section ("ax" instead of "aw")
> >>> and then later move it into .init.data section assuring .init.data is
> >>> writeable but not executable?
> >>
> >> Could you go into a little more detail on what you mean here? At the
> >> first glance my reaction is "yes, sure, why not", but much depends on
> >> what exactly is meant.
> >
> > For instance you could put the trampoline into a
> >     .section .init.trampoline, "awx", @progbits
> > section (having the "x" will be disassembled by objdump -d head.o).
> > Then in xen/arch/x86/xen.lds.S in the .init.data section having somethi=
ng like
> > ...
> >   DECL_SECTION(.init.data) {
> >        *(.init.bss.stack_aligned)
> >       (.init.trampoline)
> >    ...
> > this will put the trampoline in .init.data section of the final
> > object. At this point the .init.data containing code will have execute
> > permission that you would have to fix using objcopy command.
> > The final trampoline will be in a data section not executable so to
> > use objdump you will need the -D option, but not disassembling head.o.
> > In theory we could keep the temporary object file before the objcopy
> > adjustment to avoid the -D but I don't think it would save a lot of
> > burdain.
>
> Part of my "want to be able to disassemble" also applies to the final
> binaries. Since iirc one can disassemble individual sections, an option
> may be to have .trampoline be its own section even in the final (PE)
> binary?
>
> In any event, especially as long as there is no really good option, I
> think I'd like to have input from Andrew and/or Roger as well.
>
> Jan

Hi,
   what about having an extra copy in .init.data. That is, compile the
trampoline in .init.text having it readable/executable in the final
PE, at the beginning copying into .init.data and handle the changes
there then when we can allocate the final memory allocate it and copy
the temporary writable copy into final lower memory area.

On a related but not too much topic, I noted there's no .init.bss.
Maybe we could allocate .init.bss (and .init.bss.stack_aligned or
whatever .init.bss.*) at the end of normal .bss and "cut" it while we
remove .init.text and .init.data.

Frediano

