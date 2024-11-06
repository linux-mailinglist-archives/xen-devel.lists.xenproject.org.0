Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4690E9BDF0A
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 07:57:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830589.1245646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8ZyN-0001Y9-Od; Wed, 06 Nov 2024 06:56:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830589.1245646; Wed, 06 Nov 2024 06:56:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8ZyN-0001VK-Le; Wed, 06 Nov 2024 06:56:59 +0000
Received: by outflank-mailman (input) for mailman id 830589;
 Wed, 06 Nov 2024 06:56:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6nbp=SB=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t8ZyM-0001VE-KD
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 06:56:58 +0000
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [2607:f8b0:4864:20::c30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e27274d-9c0c-11ef-99a3-01e77a169b0f;
 Wed, 06 Nov 2024 07:56:54 +0100 (CET)
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-5edf76cd843so1874258eaf.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2024 22:56:54 -0800 (PST)
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
X-Inumbo-ID: 4e27274d-9c0c-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjpjMzAiLCJoZWxvIjoibWFpbC1vbzEteGMzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjRlMjcyNzRkLTljMGMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwODc2MjE0LjUxMTM3MSwic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730876213; x=1731481013; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+jgd88ZK3qq5xRmAbZHFebwmYfOkWBHFgyGpvETKNY=;
        b=O/Rz3NDtsM5ZaK/ANXPDBQMhsyG9rO8aoa749JHyyGOJwaCiQCTN13RG9ABLl/jkBb
         nSW3rRZIzDCQgcoXl6pWtChYV8+WlGd4hzpkWN3cM084YpBZxczfuf9em6PjV6mi7t/Q
         64DC3urbUgRJRdUWBmCLkw/e+po/koVPrYr7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730876213; x=1731481013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V+jgd88ZK3qq5xRmAbZHFebwmYfOkWBHFgyGpvETKNY=;
        b=NZAVBaZvMh45nT8u9BI36qU3OI2hy9kT+CwZ8O6j0KVu9TJYKsrWDvTJFTMkC/knV9
         bSdBNu7kby8FjUVh4xpf/JSyuqEW48KUNjyPWSqqHFx40gtK48V3DrFcDNiI9YwA5Dqh
         iTGH9IkSMGTjrHeLejSc//UQWZwlGwVT3tNoyCWg2DWGWR5Tl+m8cJeFZqepwKLpcmHP
         UR7cvzakvAup+3vtUp8G/a8LkNjFSAv4lFQaPHLf0UvFdCoAgQvsK5iVXsAWweKEqQet
         uU4fH2PCxwkk++qyOaD1otRU3QvXJkzBgz5qR/MHqBLgyiRX94WieP52GoQvbCbrBMyp
         mt5A==
X-Forwarded-Encrypted: i=1; AJvYcCW8aWkNnNOVCa1ys8st5WE58akhVh/o26gdZR+zYtDNdY37qFYPwL1VoBZQk3YTLPmfxcU5gtIRWkU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxXa9tK95p+GkPIg42Aw/HuOKSNeBIBpQTJGAxDDbn92KkHl3IA
	/I1yPv2YAqI+9A6P5y4nhTCgAhsSlgFf7ReKv1+RJK0JPbKC5kzKQm/nMdBsOJwoBwinX2MRyzn
	DscQeISWM8/E4h9p5BgdoGSQB33i4LOLnSjNaoQ==
X-Google-Smtp-Source: AGHT+IEyX2Iyn0+b5+oCPN05+d+JwZ0VTVG9rHvVEN9DDSxyet5nrsgJMSEcAdMYNA8zaSKlVtHb1I8WZ/7Yi/dvIa4=
X-Received: by 2002:a05:6820:80b:b0:5e5:c489:6f3c with SMTP id
 006d021491bc7-5ede651022fmr11044664eaf.5.1730876213137; Tue, 05 Nov 2024
 22:56:53 -0800 (PST)
MIME-Version: 1.0
References: <20241105145507.613981-1-frediano.ziglio@cloud.com>
 <48a22295-f3ac-496b-bdfb-ee17b0ada994@suse.com> <CACHz=ZhrxTSYGyWMQSE0Xi6sW2BZiLDuKkP2508CBRELD-USgQ@mail.gmail.com>
 <816ae079-378b-4bfd-93f2-83c5a281eb01@suse.com>
In-Reply-To: <816ae079-378b-4bfd-93f2-83c5a281eb01@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Wed, 6 Nov 2024 06:56:42 +0000
Message-ID: <CACHz=ZhzrZO5o8EarXewC6BzrX4acSyAFsAO2hHBvm9xYRecqg@mail.gmail.com>
Subject: Re: [PATCH] x86/boot: Fix build with LLVM toolchain
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 5, 2024 at 5:06=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 05.11.2024 17:35, Frediano Ziglio wrote:
> > On Tue, Nov 5, 2024 at 3:32=E2=80=AFPM Jan Beulich <jbeulich@suse.com> =
wrote:
> >>
> >> On 05.11.2024 15:55, Frediano Ziglio wrote:
> >>> This toolchain generates different object and map files.
> >>> Account for these changes.
> >>
> >> At least briefly mentioning what exactly the differences are would be
> >> quite nice, imo.
> >>
> >
> > What about.
> >
> > Object have 3 additional sections which must be handled by the linker s=
cript.
>
> I expect these sections are there in both cases. The difference, I assume=
,
> is that for the GNU linker they don't need mentioning in the linker scrip=
t.
> Maybe that's what you mean to say, but to me at least the sentence can al=
so
> be interpreted differently.
>

Why do you expect such sections? They are used for dynamic symbols in
shared objects, we don't use shared objects here. Normal object
symbols are not handled by these sections. GNU compiler+linker (we
link multiple objects together) do not generate these sections. So the
comment looks correct to me.

> >>> +    symbol_re_gnu =3D re.compile(r'\s{15,}0x([0-9a-f]+)\s+(\S+)\n')
> >>>      for line in open(args.mapfile):
> >>> -        m =3D symbol_re.match(line)
> >>> -        if not m or m.group(2) not in exports:
> >>> +        name =3D None
> >>> +        m =3D symbol_re_clang.match(line)
> >>> +        if m:
> >>> +            name =3D m.group(5)
> >>> +        else:
> >>> +            m =3D symbol_re_gnu.match(line)
> >>> +            if m:
> >>> +                name =3D m.group(2)
> >>
> >> ... uniformly use m.group(2) here (outside of the conditional)?
> >>
> >
> > It could be done. The initial idea was testing that VMA and LMA fields
> > should be identical, which gives a bit more certainty about the format
> > used.
> > About map file format, both formats have some headers. Would it be
> > sensible to detect such headers? BTW, probably a mis-detection would
> > cause symbols not to be detected.
>
> Not sure either way, to be honest.
>
> Jan

Mumble... I'm looking for an alternative, maybe I can avoid using map files=
.

Frediano

