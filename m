Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E819BE59D
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 12:35:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830758.1245827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8eJU-0004d9-Bk; Wed, 06 Nov 2024 11:35:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830758.1245827; Wed, 06 Nov 2024 11:35:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8eJU-0004aJ-9C; Wed, 06 Nov 2024 11:35:04 +0000
Received: by outflank-mailman (input) for mailman id 830758;
 Wed, 06 Nov 2024 11:35:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6nbp=SB=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t8eJS-0004aC-KE
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 11:35:02 +0000
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [2607:f8b0:4864:20::c2f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 274c17ad-9c33-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 12:34:59 +0100 (CET)
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-5ee1e04776cso1365124eaf.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 03:34:59 -0800 (PST)
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
X-Inumbo-ID: 274c17ad-9c33-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjpjMmYiLCJoZWxvIjoibWFpbC1vbzEteGMyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjI3NGMxN2FkLTljMzMtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODkyODk5LjY0ODEyOSwic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730892898; x=1731497698; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NxCVbREjyMnEUTjnJf2lxQT8dfVrnI1B/Lw7xisk/38=;
        b=OP+G/Pj+pHTOVWZvT064doJPzZgZoNs4VZyyWEX87juvqXO27nGm3t/yZB0ZHSHT3f
         VNzww2WiaOpCdPz16Ab9Bc3eL7mVuOdkhikpaOC+1Inu42aQZ5jluRH4R1uvN5WpPlWP
         8ExB5uHe69mojy7qJd8YC3GCnQ1TRb7PWpj14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730892898; x=1731497698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NxCVbREjyMnEUTjnJf2lxQT8dfVrnI1B/Lw7xisk/38=;
        b=obJcgauBWD65SMGLJP5R6rCbzqxkua7IFFZqCeQ96EOVn8BcsaK0CSqDn/7qrtUMDz
         afPEmWV+AliLrH2IVPz5LEDf3S5xIhfxd0x+NHL3kKhh5NG2zRPUtvXwEDpoc98QmFS0
         21CR8ldErlcK/dBCdYacNUN/IMEOhOLWDwfflVGWOqAS9OEzx1ix9gHKErEECi9gp09A
         C04Yxd+rvoGxJUz2UVjRc5TE9Fa7pPXh1DSTMwUDmpEzc1VRw+SYUXU5DhZXdhSdsS2R
         8POGdCFMhLJ9blsUEz6Ziq9q91igz69igb+OAaRvz6uo9wLTsGLei9idnqnV1D/HiACU
         V7lw==
X-Forwarded-Encrypted: i=1; AJvYcCVa7UG3AaJ44fRlHXPSFnSBI3eQPbZZ4qSc15rPVhbCGXwD2gL8wPGVjg9qCH68wsv8AlLYlm+G7GQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxYEuJmIi5d0kA9jIHzQ4CTyYmTfydKCkgJlY8f78kAY9kRLGBv
	HF66m+URSE8Zkifqv7CJbmMVbpss+fXYzsdpnlRht25Icpoyr6Ta90EC1PSKCeM6H6j741Btzr4
	8C+ZfOOCgIWAcZit3zyInA3djp9as4vM5D4pukw==
X-Google-Smtp-Source: AGHT+IG3Eai53yDL7XPaUmGFPYDnnLT7jrAjW8Tf/SPBiG8epBlg3qBuq6gCBqoINyDGo776HvuoAKT2vcNK/UGIzFI=
X-Received: by 2002:a05:6820:1b94:b0:5ec:5eb6:1acc with SMTP id
 006d021491bc7-5ec6db9a003mr13608041eaf.5.1730892898272; Wed, 06 Nov 2024
 03:34:58 -0800 (PST)
MIME-Version: 1.0
References: <20241105145507.613981-1-frediano.ziglio@cloud.com>
 <48a22295-f3ac-496b-bdfb-ee17b0ada994@suse.com> <CACHz=ZhrxTSYGyWMQSE0Xi6sW2BZiLDuKkP2508CBRELD-USgQ@mail.gmail.com>
 <816ae079-378b-4bfd-93f2-83c5a281eb01@suse.com> <CACHz=ZhzrZO5o8EarXewC6BzrX4acSyAFsAO2hHBvm9xYRecqg@mail.gmail.com>
 <80296824-760a-48c4-9dce-4875fca0ed31@suse.com>
In-Reply-To: <80296824-760a-48c4-9dce-4875fca0ed31@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Wed, 6 Nov 2024 11:34:47 +0000
Message-ID: <CACHz=ZgY_O7siQUQZjxGe=gfiB-C9jw1UQqwK9ffuHUUQmRgiQ@mail.gmail.com>
Subject: Re: [PATCH] x86/boot: Fix build with LLVM toolchain
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 6, 2024 at 10:59=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 06.11.2024 07:56, Frediano Ziglio wrote:
> > On Tue, Nov 5, 2024 at 5:06=E2=80=AFPM Jan Beulich <jbeulich@suse.com> =
wrote:
> >>
> >> On 05.11.2024 17:35, Frediano Ziglio wrote:
> >>> On Tue, Nov 5, 2024 at 3:32=E2=80=AFPM Jan Beulich <jbeulich@suse.com=
> wrote:
> >>>>
> >>>> On 05.11.2024 15:55, Frediano Ziglio wrote:
> >>>>> This toolchain generates different object and map files.
> >>>>> Account for these changes.
> >>>>
> >>>> At least briefly mentioning what exactly the differences are would b=
e
> >>>> quite nice, imo.
> >>>>
> >>>
> >>> What about.
> >>>
> >>> Object have 3 additional sections which must be handled by the linker=
 script.
> >>
> >> I expect these sections are there in both cases. The difference, I ass=
ume,
> >> is that for the GNU linker they don't need mentioning in the linker sc=
ript.
> >> Maybe that's what you mean to say, but to me at least the sentence can=
 also
> >> be interpreted differently.
> >
> > Why do you expect such sections? They are used for dynamic symbols in
> > shared objects, we don't use shared objects here. Normal object
> > symbols are not handled by these sections. GNU compiler+linker (we
> > link multiple objects together) do not generate these sections. So the
> > comment looks correct to me.
>
> About every ELF object will have .symtab and .strtab, and many also a
> separate .shstrtab. There's nothing "dynamic" about them. IOW - I'm
> confused by your reply.
>
> Jan

I checked the object files and there are no such sections using GNU toolcha=
in.

Frediano

