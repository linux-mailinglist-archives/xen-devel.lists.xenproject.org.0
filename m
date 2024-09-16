Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 800E297A256
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 14:30:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799474.1209458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqArW-0007bJ-LU; Mon, 16 Sep 2024 12:29:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799474.1209458; Mon, 16 Sep 2024 12:29:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqArW-0007Yl-Ip; Mon, 16 Sep 2024 12:29:50 +0000
Received: by outflank-mailman (input) for mailman id 799474;
 Mon, 16 Sep 2024 12:29:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wse+=QO=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sqArU-0007Yf-N2
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 12:29:48 +0000
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [2607:f8b0:4864:20::c32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c21a83a-7427-11ef-a0b6-8be0dac302b0;
 Mon, 16 Sep 2024 14:29:47 +0200 (CEST)
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-5e5568f1baaso432059eaf.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2024 05:29:47 -0700 (PDT)
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
X-Inumbo-ID: 5c21a83a-7427-11ef-a0b6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1726489786; x=1727094586; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+FXm61nqYtBwh/T9lr/PtKylwPBhSfQ1od99mivfijc=;
        b=BNtSHd0eP2gtn7vQONOE6rCCuEGc7MiQ7KXPXOyBxhuzIEpkaD1Gg3YenXsMMgIECc
         +VGBbnP0ZcvupGfyMpnaG54H8THA7B4ciPwHlPlBUvoXSD+8JDblIxgXaMTWLqe4eQm7
         bAOgSDnJSElkzxA/EwQGzaIgU7B7opkaFjvHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726489786; x=1727094586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+FXm61nqYtBwh/T9lr/PtKylwPBhSfQ1od99mivfijc=;
        b=S6WcJp2BhP7PsfhxX/dwYfj9vifmM4+ad/fPp9gPoRXZwMaomF+7XI7cSBsxcPImzp
         edFVXpFVuZckey61t6W+rurrt/j4kriEFHqRAEokjouzqT8DYWnV8M5ls+uFEQF5+09A
         nzLGLV2XrAYBm+05sNQFEdJfbPnAFOYBeOIg0YYXsmedzyTjKGmyzXVd4xW/hO54WJfU
         9f1mIhdzfSh2ElaZv8kttufE4ToOAfwiwLIlHcF8cKdZn5DQq8GPrH5euolyOo2HTh2D
         qiNOWtGH32eQ0Nw+Ex/U3owMOFykAXcpBeyX9aPruKtSsapT0ScjNYhTX8MoJTz8EveI
         I7Dg==
X-Gm-Message-State: AOJu0YzWrODpgt76Az6WWQtqr/xJHRU7VXLMMDWq3RrqxZ3LICoFY9k3
	oSvoBEhOM19elTqMRSZU9JlKcuNh+Kv+Q7N7FPPOAWOtIMXboeeXE4h7F8pIOp9tF6QvQGXv0si
	xb8Cv1+RhETl0hwqKuAhR+vAa277+yRJKRvFlng==
X-Google-Smtp-Source: AGHT+IEl4TmhK++w8abeT4BQBEZ+hHw7XqL2xjoX+TnpvjrmTOMkmVBr7WWDzPd7Tp6VeQyEHrdFKdKJHJtOYs+M4z4=
X-Received: by 2002:a05:6820:552:b0:5e1:d741:6f04 with SMTP id
 006d021491bc7-5e201420246mr7817624eaf.3.1726489786406; Mon, 16 Sep 2024
 05:29:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240916094424.74002-1-frediano.ziglio@cloud.com> <833668bc-6a37-4cad-98bc-7754720b7606@citrix.com>
In-Reply-To: <833668bc-6a37-4cad-98bc-7754720b7606@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 16 Sep 2024 13:29:34 +0100
Message-ID: <CACHz=ZgndSWqL9QR62c9gpTisvg4CeSZu4y06J+gFprNvCDqhA@mail.gmail.com>
Subject: Re: [PATCH v3] x86: Put trampoline in separate .init.trampoline section
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Daniel Smith <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2024 at 12:11=E2=80=AFPM Andrew Cooper
<andrew.cooper3@citrix.com> wrote:
>
> On 16/09/2024 10:44 am, Frediano Ziglio wrote:
> > This change put the trampoline in a separate, not executable section.
> > The trampoline contains a mix of code and data (data which
> > is modified from C code during early start so must be writable).
> > This is in preparation for W^X patch in order to satisfy UEFI CA
> > memory mitigation requirements.
> > At the moment .init.text and .init.data in EFI mode are put together
> > so they will be in the same final section as before this patch.
> > Putting in a separate section (even in final executables) allows
> > to easily disassembly that section. As we need to have a writable
> > section and as we can't have code and data together to satisfy W^X
> > requirement we need to have a data section. However tools like objdump
> > by default do not disassemble data sections. Forcing disassembly of
> > data sections would result in a very large output and possibly crash
> > of tools. Putting in a separate section allows to selectively
> > disassemble that part of code using a command like
> >
> >     objdump -m i386 -j .init.trampoline -d xen-syms
> >
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>
> Please can we take a pause and discuss all relevant aspects before
> continuing?
>
> We need W^X in xen.efi for UEFI SecureBoot.  Sections with differing
> permissions must not share a page.
>
> Right now, the trampoline fails this because it's marked X and written
> in-to on the default EFI pagetables.
>
>
> I've got no issue creating a .init.trampoline section.  Indeed, being
> able to pull the section out in isolation is probably a good thing.
>
> However, I would very much prefer the trampoline to remain being code
> rather than data.  I spend enough time disassembling it and right now it
> does separate code&data in the disassembly by virtue of proper type
> annotations.
>
>
> The problem, as far as I'm aware, is that the trampoline is relocated in
> place within Xen (on the default EFI pagetable), then copied into low
> memory.  As relocation requires knowing the end physical address, this
> can be addressed by copying into low memory, then relocating, can it not?
>

Unfortunately, some discussions were scattered in different threads.
In theory, yes, this is possible. In practice, a lot of code is
designed around being able to patch the original trampoline in place.
Relocation is just the easier part. A lot of code in different places
changes variables and settings inside the trampoline. Allocating the
final memory earlier looks like an option. But I tried and some paths
(EFI) are assuming you can delay this phase at a much later stage (in
particular after calling ExitBootServices) due to possible firmware
bugs. I have some attempt to do that, and the commits are much larger,
complicate and introducing regression and potential failures.

> The same could be done for the 32bit boot path, although that's running
> in 32bit flat mode so doesn't have an issue with pagetables.
>

EFI application code does not go back to 32bit flat mode. That won't
be an issue with my series that allow to reuse C code for both 32 and
64 bit.

>
> Independently, given the adjustment in this patch, we should just make
> trampoline.o a proper object and take it out of head.S  That's one fewer
> non-standard moving parts in the build.
>

I think another hidden assumption is having the possibility to do some
math on trampoline symbols, and that requires having the source of the
trampoline combined with the source of head.S. But to remove the
"think" from the previous sentence, I need to do some test.

> ~Andrew

Frediano

