Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D764994BE6E
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 15:18:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774107.1184598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc31v-0003ZK-AB; Thu, 08 Aug 2024 13:18:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774107.1184598; Thu, 08 Aug 2024 13:18:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc31v-0003XO-7W; Thu, 08 Aug 2024 13:18:11 +0000
Received: by outflank-mailman (input) for mailman id 774107;
 Thu, 08 Aug 2024 13:18:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vpfq=PH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sc31u-0003Wz-6O
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 13:18:10 +0000
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [2607:f8b0:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7510b3d-5588-11ef-bc04-fd08da9f4363;
 Thu, 08 Aug 2024 15:18:09 +0200 (CEST)
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3db18c4927bso700983b6e.1
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2024 06:18:09 -0700 (PDT)
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
X-Inumbo-ID: a7510b3d-5588-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723123088; x=1723727888; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1fpPuQl8cYOlzY3fFlpG5q796ahEHADyk8dq9quYXs=;
        b=ktvtWOFE2gFApY0ZHUlP9rpARAPdsb5vFU9Tngb0KJbCrEiIiW4mXnX1BILAe2zaDM
         KbXBFKUDXH7uNEdhkNpIjrLhWe/fSgsw+tene8NZJPmUmL+Xx6cfwGz11M/tr60YLP6S
         0Sg2DROFtwmxAdy5k6HQ2xpOU0CZtU2MdW+V8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723123088; x=1723727888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e1fpPuQl8cYOlzY3fFlpG5q796ahEHADyk8dq9quYXs=;
        b=ocTuGx1tXaM8AQ7ihN2gIQC10bcIdQmI0UzGMzcSJFE0o8c6Ui3eBc5j2We91Uc3tP
         NLy2P/WKoFcf8XhfelEIc/uHt+6e/a1r96bUe7u7rxhtUeSvuEFfP2Z/Bl1bD9Hckrfj
         OTQ9kPfiws6Pv+xZCiLgKZifBUuBc66hs/10Vq6BBBRQg0/sEBtFiEvusGCMuXZslkWP
         obprV8kxpS/mk6cj1Jz14U3BsJzBk2gAesrCTRuTTk9Zj7/o7syypwPmIY7lCAmTArIg
         NvmPv+4LepnkLb36FuP9h5ml0ZizIQJrCQJ1gmbdXHiqnbPu4qMQLWbtjgcCLRu2mI7t
         VYuw==
X-Gm-Message-State: AOJu0YxJgVHwxLA8OZ/DOmirT2+6usTVBTMfAVQC6VUvQNHOfjaFIZxN
	cq7GyAIY9zoY8wNV2K13f0Fuws8l5gUNVt8BIYJwdzEv1/ZZwAhFdYJKH9YLUBQzJW+zvzIPS/a
	YymPMo996KG7sIc8pH1K/TatqNfoTOE+d8rjDKQ==
X-Google-Smtp-Source: AGHT+IEzYKql+mWs+1TWxBJ9+Oo4RWDEnvEbru+4R8kVz4Zt3lL3gojMFpPFHvA79bmZMHzaqENFe6Wm1FK5D2v+3ak=
X-Received: by 2002:a54:4790:0:b0:3da:b3c2:b4c0 with SMTP id
 5614622812f47-3dc3b455a2amr1812443b6e.31.1723123087578; Thu, 08 Aug 2024
 06:18:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240807134819.8987-1-alejandro.vallejo@cloud.com>
 <20240807134819.8987-3-alejandro.vallejo@cloud.com> <7f1e17dd-d105-4f6c-87d3-69f3dca4ab82@suse.com>
 <CACHz=ZjYdBcB_S1tpXpuRQDKGAKY=SrgTEy8_0Wyq_q+bOBfHg@mail.gmail.com>
 <bd4c8ef5-a6bb-42ae-9b69-c3d14eeac55e@suse.com> <CACHz=ZgRK2DMHmiAVsBo1WJVBxbnTka3-CcpgopKB-6gWs5ZSw@mail.gmail.com>
 <57e01574-2e06-4dd3-bf7f-91b5a19477b1@suse.com>
In-Reply-To: <57e01574-2e06-4dd3-bf7f-91b5a19477b1@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 8 Aug 2024 14:17:56 +0100
Message-ID: <CACHz=Zi56VX7VE9ESRhm-3YJCqKV9z3yZKY+nWrz827e0t+rnw@mail.gmail.com>
Subject: Re: [PATCH 2/5] x86: Fix early output messages in case of EFI
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Alejandro Vallejo <alejandro.vallejo@cloud.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 8, 2024 at 1:58=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 08.08.2024 14:50, Frediano Ziglio wrote:
> > On Thu, Aug 8, 2024 at 10:29=E2=80=AFAM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >>
> >> (re-adding xen-devel@)
>
> Did you notice this in my earlier reply? You dropped the list again.
>

Yes, later, sorry for that.

> >> On 08.08.2024 10:33, Frediano Ziglio wrote:
> >>> On Thu, Aug 8, 2024 at 8:49=E2=80=AFAM Jan Beulich <jbeulich@suse.com=
> wrote:
> >>>>> This cause offsets in x86 code generated by
> >>>>> sym_offs(SYMBOL) to be relocated too (basically they won't be
> >>>>> offsets from image base). In order to get real offset the
> >>>>> formulae "sym_offs(SYMBOL) - sym_offs(__image_base__)" is
> >>>>> used instead.
> >>>>
> >>>> The main calculations of %esi are, if I'm not mistaken,
> >>>>
> >>>>         /* Store Xen image load base address in place accessible for=
 32-bit code. */
> >>>>         lea     __image_base__(%rip),%esi
> >>>>
> >>>
> >>> Which is correct
> >>>
> >>>> and
> >>>>
> >>>>         /* Calculate the load base address. */
> >>>>         call    1f
> >>>> 1:      pop     %esi
> >>>>         sub     $sym_offs(1b), %esi
> >>>>
> >>>> i.e. both deliberately %rip-relative to be position-independent. Wha=
t's
> >>>> wrong with this?
> >>>>
> >>>
> >>> This can be wrong if sym_offs(1b) was relocated and not patched by
> >>> efi_arch_relocate_image.
> >>
> >> Of course, if in the course of GrUB's loading of xen.efi base relocati=
ons
> >> are applied (unlike when loading an ELF binary, where afaik base reloc=
s
> >> would be ignored, even if there were any), then this calculation is of
> >> course going to be wrong. Can't we correct it though, to properly rese=
mble
> >> PIC code:
> >>
> >>         /* Calculate the load base address. */
> >>         call    1f
> >> 1:      pop     %esi
> >>         sub     1b - start, %esi
> >>
> >> or (because start is in a different section):
> >>
> >>         /* Calculate the load base address. */
> >>         call    1f
> >> 1:      pop     %esi
> >>         sub     $sym_offs(1b), %esi
> >>         add     $sym_offs(start), %esi
> >>
> >> (or something along these lines)?
> >>
> >
> > Yes, that works. But is a bit painfull, I mean, the %esi will point to
> > the correct address, but still you will use something like
> > syms_esi(foo) expecting to work but it won't as there will be applied
> > a relocation offset.
>
> I find your reply contradictory in itself. You first say this works, to
> then say it can't work. The underlying idea has to be to establish %esi
> such that it works uniformly.
>

The computation of %esi is correct after the additional "add" command,
in the sense it will point to the current base (under 4GB) however
then you will use syms_esi(foo) thinking "if %esi is correct then also
syms_esi is correct" and it isn't.
So either you need to add another offset to make syms_esi(foo) correct
having %esi not pointing to the base or assuming that syms_esi(foo)
would need fixing.
Potentially the first option would be better, you just need to
remember to correct %esi after rolling back relocations.

> > On 32bit PIC code you could use something like
> > foo@GOTOFF(%esi), assuing %esi is pointing to the global offset table.
> > I was trying to use that but linker is complaining a bit as generating
> > a 64bit relocation. The x64 architecture supports such relocation as
> > 32bit but I didn't find a way to tell assembler to use the 32bit
> > version instead of the 64bit one. Also I didn't find a way to set
> > _GLOBAL_OFFSET_TABLE_ where I want it to be, it looks like that if the
> > linker is not generating it is not picking up the forcedly set symbol.
>
> Even if the toolchain permitted this: We don't have and don't want to
> have any GOT. Note how the linker script actually has an assertion for
> .got to be empty (plus a few more ones for other sections).
>

I know, @GOTOFF does not generate .got entries, that's the reason I
tried to use it and tell linker my idea of _GLOBAL_OFFSET_TABLE_. It's
just that we need real offsets without relocations and I was looking
at a way to get it. That would simply solve the relocation issue
without having to offset %esi to some weird value.

> Jan

Frediano

