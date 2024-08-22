Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C1495B871
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2024 16:32:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781893.1191399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh8qL-0006CP-G5; Thu, 22 Aug 2024 14:31:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781893.1191399; Thu, 22 Aug 2024 14:31:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh8qL-0006Au-DM; Thu, 22 Aug 2024 14:31:17 +0000
Received: by outflank-mailman (input) for mailman id 781893;
 Thu, 22 Aug 2024 14:31:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R3RO=PV=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1sh8qJ-0006Ao-Mo
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2024 14:31:15 +0000
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [2001:4860:4864:20::34])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ebf3e93-6093-11ef-a50a-bb4a2ccca743;
 Thu, 22 Aug 2024 16:31:14 +0200 (CEST)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-2702ed1054fso578130fac.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Aug 2024 07:31:13 -0700 (PDT)
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
X-Inumbo-ID: 2ebf3e93-6093-11ef-a50a-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724337073; x=1724941873; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RY74Mxj/2wmPmwUp1NjOvHV4cp/o/DJFi8b1s+2pXY4=;
        b=WSFpHtwY3ujO4NSVS8pKbDJZwGzFCpd8uG3rZ/KCg9Yk8qTEc1weWySrBWjkMX/dvh
         d9Nz9nU+Z/AV26OBK538Su5tgoU0DaX8bVw/gEnNzi67P48KP/p9WDG2EBxHFRd0JR28
         RnRGEtc11weV3Wkevqy3Ejn/BBV7NHjQD5bHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724337073; x=1724941873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RY74Mxj/2wmPmwUp1NjOvHV4cp/o/DJFi8b1s+2pXY4=;
        b=CPr1hZVm/6TbUDQtggRFZ48L3G2+mDGpeAmCnwAqjBrjreiIhn00UjM+TzUakmocEr
         cvq5cQ0KFMJPNIye0U3l/F8RQTEouATQbtDKGlBlmobJvq0Eu0Ky+lNCrdiDvP+DgvKa
         Xh5TBuBiyDg21vg+dJcGF7WZhQ7WlVrLSGFQ7VM0wLFA3Sg79BPaAwPhnN6NtOk0C7W2
         ajWzviVDPJFl/P4S1r2TS/vbp7tzaB+Nztak8j+kqGryecrj29nu1tFFUNLf5nZWDOfy
         WzH2dqSAH6kos62N+MQ2n3XO+mFMuAKjFUpSAcX0vVcLDjLiHWu3f/Ib2vOLaiGs/9dP
         OCXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpIp8LQmEuXmzl6EiWBN/5LQ/bOwIFP3R2LuXFB2txDWROqOY3VmWyrX4q93fFhRl3ml3ohwIOeUc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yypl5uO6Jx3pNFkfpmMaKBtWGOwwbT2IHc0ZOGz+NT6+7XTEwh+
	I0sOGcSIeE+PQyzqmIA/ARyY0KzlGjJYfT+PFYXuhDBWvQaPfJDJDDq8Xbjie5UMwOkHnOTvJNt
	3pu4x/8HrovSR449nSlHerGuwwUeR3FeeulXV9Q==
X-Google-Smtp-Source: AGHT+IEdztJOlEZd3Om0EFjg166QHgA6ZJFhf1ue2oW00p23YZqS0xJvvOXKym3fFgPFE7VDiaUlpgc0Sv13Nmrih7c=
X-Received: by 2002:a05:6870:82a8:b0:25e:e6d:5247 with SMTP id
 586e51a60fabf-273cfc55beamr2449508fac.14.1724337072652; Thu, 22 Aug 2024
 07:31:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1724314239.git.andrii.sultanov@cloud.com>
 <110f63b76a12e8a9fead09f47319a35229222953.1724314239.git.andrii.sultanov@cloud.com>
 <e184ccf6-47da-443f-9170-dd503d225bf6@citrix.com>
In-Reply-To: <e184ccf6-47da-443f-9170-dd503d225bf6@citrix.com>
From: Edwin Torok <edwin.torok@cloud.com>
Date: Thu, 22 Aug 2024 15:31:01 +0100
Message-ID: <CAEfZLvm3m_UprvhCbgG2+jLas_Oi_mFsGqUC2gOBr_ZPssbqCw@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] tools/ocaml/common.make: Remove '-cc $(CC)' flag
 from OCAMLOPTFLAGS
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Andrii Sultanov <andrii.sultanov@cloud.com>, xen-devel@lists.xenproject.org, 
	Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, 
	Anthony PERARD <anthony.perard@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2024 at 1:25=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> On 22/08/2024 10:06 am, Andrii Sultanov wrote:
> > This flag does not work as assumed and will not pass
> > options (such as -shared) to the C compiler:
> > https://github.com/ocaml/ocaml/issues/12284
> >
> > Signed-off-by: Andrii Sultanov <andrii.sultanov@cloud.com>
> > ---
> >  tools/ocaml/common.make | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tools/ocaml/common.make b/tools/ocaml/common.make
> > index 0c8a597d5b..cc126b749f 100644
> > --- a/tools/ocaml/common.make
> > +++ b/tools/ocaml/common.make
> > @@ -12,7 +12,7 @@ OCAMLFIND ?=3D ocamlfind
> >  CFLAGS +=3D -fPIC -I$(shell ocamlc -where)
> >
> >  OCAMLOPTFLAG_G :=3D $(shell $(OCAMLOPT) -h 2>&1 | sed -n 's/^  *\(-g\)=
 .*/\1/p')
> > -OCAMLOPTFLAGS =3D $(OCAMLOPTFLAG_G) -ccopt "$(LDFLAGS)" -dtypes $(OCAM=
LINCLUDE) -cc $(CC) -w F -warn-error F
> > +OCAMLOPTFLAGS =3D $(OCAMLOPTFLAG_G) -ccopt "$(LDFLAGS)" -dtypes $(OCAM=
LINCLUDE) -w F -warn-error F
> >  OCAMLCFLAGS +=3D -g $(OCAMLINCLUDE) -w F -warn-error F
> >
> >  VERSION :=3D 4.1
>
> This patch itself is fine, and I'll commit it in due course, but then I
> got looking at the surrounding context...
>
> `$(OCAMLOPT) -h` tells you on stderr to try `--help instead`, so
> OCAMLOPTFLAG_G is never going to contain -g.
>
> Also, why is -g conditional for OCAMLOPTFLAGS but unconditional for
> OCAMLCFLAGS?  I think we can safely drop OCAMLOPTFLAG_G

I'm not aware of a version of OCaml that didn't support -g, but maybe
a very old version (that wouldn't pass the minimum version check)
didn't have it.
I agree that we can safely drop the conditional and always pass `-g`.
>
>
> Next, there's VERSION and git grep says its only used in META files.
>
> xen.git/tools/ocaml$ git grep -w VERSION
> Makefile.rules:43:      sed 's/@VERSION@/$(VERSION)/g' < $< $o
> common.make:18:VERSION :=3D 4.1
> libs/eventchn/META.in:1:version =3D "@VERSION@"
> libs/mmap/META.in:1:version =3D "@VERSION@"
> libs/xb/META.in:1:version =3D "@VERSION@"
> libs/xc/META.in:1:version =3D "@VERSION@"
> libs/xenstoredglue/META.in:1:version =3D "@VERSION@"
> libs/xenstoredglue/domain_getinfo_plugin_v1/META.in:1:version =3D "@VERSI=
ON@"
> libs/xs/META.in:1:version =3D "@VERSION@"
>
> 4.1 is very very stale and should say 4.19 these days (definitely for
> xc, and whatever else is using an unstable API), yet should definitely
> not be 4.19 for xenstoredglue.
>
> Are there any ABI/API implication from changing the META file?

It is purely informational (e.g. show up in the output of `ocamlfind
list`), dependency resolution is done using `opam` files (which Xen
doesn't have), not `META` files.
You can link some code into an executable that lists the versions of
all the libraries that it got linked with (using an OCamlfind module),
and in that case it might be nice to have correct information there,
but I don't think any of our code does that.

>
> ~Andrew

