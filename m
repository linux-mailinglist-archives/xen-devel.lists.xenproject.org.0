Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B699BD271
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2024 17:36:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830464.1245468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8MWn-0007Jq-EM; Tue, 05 Nov 2024 16:35:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830464.1245468; Tue, 05 Nov 2024 16:35:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8MWn-0007IG-BY; Tue, 05 Nov 2024 16:35:37 +0000
Received: by outflank-mailman (input) for mailman id 830464;
 Tue, 05 Nov 2024 16:35:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yqe/=SA=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t8MWl-0007IA-W4
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2024 16:35:36 +0000
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [2607:f8b0:4864:20::c2a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f97b7378-9b93-11ef-a0c5-8be0dac302b0;
 Tue, 05 Nov 2024 17:35:32 +0100 (CET)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-5ebc52deca0so2815225eaf.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2024 08:35:32 -0800 (PST)
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
X-Inumbo-ID: f97b7378-9b93-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjpjMmEiLCJoZWxvIjoibWFpbC1vbzEteGMyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImY5N2I3Mzc4LTliOTMtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODI0NTMyLjgwMzAxMiwic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730824531; x=1731429331; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DHSNsItkeMc9V33qT9vmmS+NKC98iXsj1rhTVxg4nyU=;
        b=BqDk2+sgNn6ZtLNu8qrsZgbvJWGue0DNm3NqCBwNEVoOcBuRs7dmLF+blSXz0GLs4m
         V/r1IOYxUfcbJkiR0fK73nPD7PN5LaCOnhmmfy2c+ud7+kn0tMWIIryZjgtG6W12KhoT
         NaqZYEIfhu+A681OTF0NVqivwZSDyYB+XdNMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730824531; x=1731429331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DHSNsItkeMc9V33qT9vmmS+NKC98iXsj1rhTVxg4nyU=;
        b=LwrUBLB5YV3MFuzgWDryNUG1TU7/UI3IwVmeSrxmGYcQCZr8F/NPVQDa/8567P6HU8
         gIkzphUiLh/Dwy4GBlwlD9nie2fNBfDZNkqJPt9RkPYxqvSeIewcZ2q26wLPT+S5MHLc
         6yStl4vp3YgZ1niWlbxWYaYJtFVyq6jTrsGTQ9xjUH0BfSLixGZ/lmytdRa0uze6vqWo
         OIQ9em1+hQ9HWLrNSRLQprPMazYPwvEDQAfuYT1Pfl3P/SkSyIy21M3OqSAxKCvEEqlG
         FP6/oKYHm5fhDoKDzyHdwZnneTCmaTdrjV8/lCn3LWb9PjyNpX9BrDHqTiTbt5ZGG+O7
         IxIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWu9ndGtT4VVuO3bButLkl+Ng8YBDcBunzHNFAYBKCv0V1NY6D9PJCgAZqoSANUZ0SSeuPo081zUNQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy2HldKdaNnBIqAiJc/ve7xotEiXjOcEcDpBmIs50jYKiI0WFLH
	03dAMw8O0fofMYQCiaOMAoo/36SBmDK6dPFUrP6bKULbUrnbphc1uZJKozoLqjj6ujfKSYyXnJ+
	G16pTnK/ghyFrlXDIpJE69004DkSl1TWR4GoYFA==
X-Google-Smtp-Source: AGHT+IFzj1yK6Fr2cdeTmtxrvPoJA7VJgDkOW/Co3LOMTxBvY7w2hcel8FF69xRDeP3sQ6CDQdxaV8qnbLjGbKBDKPo=
X-Received: by 2002:a05:6820:1b81:b0:5e5:c517:4d88 with SMTP id
 006d021491bc7-5ede61a15dcmr9755086eaf.0.1730824531427; Tue, 05 Nov 2024
 08:35:31 -0800 (PST)
MIME-Version: 1.0
References: <20241105145507.613981-1-frediano.ziglio@cloud.com> <48a22295-f3ac-496b-bdfb-ee17b0ada994@suse.com>
In-Reply-To: <48a22295-f3ac-496b-bdfb-ee17b0ada994@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Tue, 5 Nov 2024 16:35:20 +0000
Message-ID: <CACHz=ZhrxTSYGyWMQSE0Xi6sW2BZiLDuKkP2508CBRELD-USgQ@mail.gmail.com>
Subject: Re: [PATCH] x86/boot: Fix build with LLVM toolchain
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 5, 2024 at 3:32=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 05.11.2024 15:55, Frediano Ziglio wrote:
> > This toolchain generates different object and map files.
> > Account for these changes.
>
> At least briefly mentioning what exactly the differences are would be
> quite nice, imo.
>

What about.

Object have 3 additional sections which must be handled by the linker scrip=
t.
Map file has 7 columns: VMA, LMA, size, alignment, output section,
definition, symbols, for our symbols output section and definition are
empty.

> > --- a/xen/tools/combine_two_binaries.py
> > +++ b/xen/tools/combine_two_binaries.py
> > @@ -67,13 +67,22 @@ if args.exports is not None:
> >
> >  # Parse mapfile, look for ther symbols we want to export.
> >  if args.mapfile is not None:
> > -    symbol_re =3D re.compile(r'\s{15,}0x([0-9a-f]+)\s+(\S+)\n')
> > +    symbol_re_clang =3D \
>
> Is "clang" really appropriate to use here? Even without the alternative
> being named "gnu", I'd expect "llvm" to be more to the point, as at
> the linking stage the original language (encoded in "clang") shouldn't
> matter much anymore.
>

I'll change to "llvm".

> > +        re.compile(r'\s+([0-9a-f]+)\s+([0-9a-f]+)\s+([0-9a-f]+)\s+([0-=
9a-f]+)\s{15,}(\S+)\n')
>
> Just wondering:
> - How stable is their map file format?

No idea, unfortunately, map files are not really standard.

> - Do they not have an option to write GNU-compatible map files?

I try to search, but I could not find such an option.

> - Why do you declare 5 groups, when you're only after the 1st and last,
> which would then allow to ...
>
> > +    symbol_re_gnu =3D re.compile(r'\s{15,}0x([0-9a-f]+)\s+(\S+)\n')
> >      for line in open(args.mapfile):
> > -        m =3D symbol_re.match(line)
> > -        if not m or m.group(2) not in exports:
> > +        name =3D None
> > +        m =3D symbol_re_clang.match(line)
> > +        if m:
> > +            name =3D m.group(5)
> > +        else:
> > +            m =3D symbol_re_gnu.match(line)
> > +            if m:
> > +                name =3D m.group(2)
>
> ... uniformly use m.group(2) here (outside of the conditional)?
>

It could be done. The initial idea was testing that VMA and LMA fields
should be identical, which gives a bit more certainty about the format
used.
About map file format, both formats have some headers. Would it be
sensible to detect such headers? BTW, probably a mis-detection would
cause symbols not to be detected.

> Jan
>
> > +        if name is None or name not in exports:
> >              continue
> >          addr =3D int(m.group(1), 16)
> > -        exports[m.group(2)] =3D addr
> > +        exports[name] =3D addr
> >  for (name, addr) in exports.items():
> >      if addr is None:
> >          raise Exception("Required export symbols %s not found" % name)
>

Frediano

