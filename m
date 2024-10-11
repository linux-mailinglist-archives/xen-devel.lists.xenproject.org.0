Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B751399A477
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 15:09:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.817055.1231156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szFO0-0000vQ-Ah; Fri, 11 Oct 2024 13:08:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 817055.1231156; Fri, 11 Oct 2024 13:08:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szFO0-0000sW-82; Fri, 11 Oct 2024 13:08:52 +0000
Received: by outflank-mailman (input) for mailman id 817055;
 Fri, 11 Oct 2024 13:08:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rkux=RH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1szFNy-0000sM-I3
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2024 13:08:50 +0000
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [2607:f8b0:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f413fd8d-87d1-11ef-a0bd-8be0dac302b0;
 Fri, 11 Oct 2024 15:08:49 +0200 (CEST)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3e3dfc24a80so1228436b6e.2
 for <xen-devel@lists.xenproject.org>; Fri, 11 Oct 2024 06:08:49 -0700 (PDT)
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
X-Inumbo-ID: f413fd8d-87d1-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728652128; x=1729256928; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X48ueAHwz7VxKcFkVFTW2si4nTfK/LalP9YXmYZDgWg=;
        b=OYS6713C36j0mew7JMYYoG6hPGHQxDy7bgjwiMUXgkIwX2hZ0bYZDXg0F+G5uyvmPF
         C5gz9Vobi/emSJxFioWOjxQQjyTsMZNcujc7wX3zNgR5hoY5GBoCcA1Gg1IlOwkSxp7h
         L5bvERutv2QYvzOlaEuF+vG9rjPRDa9nyCWQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728652128; x=1729256928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X48ueAHwz7VxKcFkVFTW2si4nTfK/LalP9YXmYZDgWg=;
        b=KM+3lQe4rcDC7xXRWNCWg5YwgH5f7v1LdaoSkhj8RbLKbIsmNMv59urOkj0XauIRR9
         2v2h63707lWB4IORJiAZwdgW83vaQdoq/Kn/7bvVXR8zLC+E4JLtC71RRKcnz9nHjQX9
         T3ffpOjjsYzrsayiYnCTAvyV0Bnjsg/DcuC5b7RPH4q1pqNYoYZPoiRyw7JPD7EKrGUo
         35diAKxzUGCWVdNHwpeXIXYJiCy7nskiAQi+aFMznqFENWZn52Q5IRQvd3TA1SRfs3t7
         /BXBP1tllu5kulpoH4djh1EeEQgd0VmlBrTlQk/tCpM/bEIhTpccN5ouyEqIWF9OyFNo
         HxuA==
X-Gm-Message-State: AOJu0YwBWrya0xKiDO8hECShca7qjunFrgAMpc0DCeU45dXsysn6gLfk
	f6PpEtLdfOoWp6MfOoZp7qV3aydIyjYWMHhCWCzPL3g4ivoLuH/VKZ5uKrF3J5zmGyT0lPzFKJ+
	3g8PEXzEY8LsFf9xtJ4rAPUk1aAJiiVCaHAsQTg==
X-Google-Smtp-Source: AGHT+IEHpgi/eTrqQ3LIzLDIuWos/9ENsh0mYVt+AQHR1LowIWqeE+ldRSmwPQRYUfglfP3XdmrZHtJkrO8O3FarKYw=
X-Received: by 2002:a05:6870:a54d:b0:278:222c:98c4 with SMTP id
 586e51a60fabf-2886ddd90a2mr2442284fac.21.1728652127871; Fri, 11 Oct 2024
 06:08:47 -0700 (PDT)
MIME-Version: 1.0
References: <20241011085244.432368-1-frediano.ziglio@cloud.com>
 <20241011085244.432368-6-frediano.ziglio@cloud.com> <uvlmtx752sl45xmsy7o2unxa7rxwwen7eu4lutszfsoprre4sj@b5wre6lirrpf>
In-Reply-To: <uvlmtx752sl45xmsy7o2unxa7rxwwen7eu4lutszfsoprre4sj@b5wre6lirrpf>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Fri, 11 Oct 2024 14:08:37 +0100
Message-ID: <CACHz=ZgUbDEJOo0f5SBzOZCVDNkaGBrbkBAPSND8Sby0bkJ8+Q@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] x86/boot: Clarify comment
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2024 at 1:56=E2=80=AFPM Alejandro Vallejo
<alejandro.vallejo@cloud.com> wrote:
>
> On Fri, Oct 11, 2024 at 09:52:44AM +0100, Frediano Ziglio wrote:
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > ---
> >  xen/arch/x86/boot/reloc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
> > index e50e161b27..e725cfb6eb 100644
> > --- a/xen/arch/x86/boot/reloc.c
> > +++ b/xen/arch/x86/boot/reloc.c
> > @@ -65,7 +65,7 @@ typedef struct memctx {
> >      /*
> >       * Simple bump allocator.
> >       *
> > -     * It starts from the base of the trampoline and allocates downwar=
ds.
> > +     * It starts on top of space reserved for the trampoline and alloc=
ates downwards.
>
> nit: Not sure this is much clearer. The trampoline is not a stack (and ev=
en if
> it was, I personally find "top" and "bottom" quite ambiguous when it grow=
s
> backwards), so calling top to its lowest address seems more confusing tha=
n not.
>
> If anything clarification ought to go in the which direction it takes. Le=
aving
> "base" instead of "top" and replacing "downwards" by "backwards" to make =
it
> crystal clear that it's a pointer that starts where the trampoline starts=
, but
> moves in the opposite direction.
>

Base looks confusing to me, but surely that comment could be confusing.
For the trampoline 64 KB are reserved. Last 4 KB are used as a normal
stack (push/pop/call/whatever), first part gets a copy of the
trampoline code/data (about 6 Kb) the rest (so 64 - 4 - ~6 =3D ~54 kb)
is used for the copy of MBI information. That "rest" is what we are
talking about here.

> My .02 anyway.
>
> >       */
> >      uint32_t ptr;
> >  } memctx;
> > --
> > 2.34.1
> >
> >
>
> Cheers,
> Alejandro

Frediano

