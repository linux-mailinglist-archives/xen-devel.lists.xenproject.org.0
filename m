Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 718529629FE
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 16:17:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784870.1194273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjJTc-00024A-Hv; Wed, 28 Aug 2024 14:16:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784870.1194273; Wed, 28 Aug 2024 14:16:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjJTc-00021L-CK; Wed, 28 Aug 2024 14:16:48 +0000
Received: by outflank-mailman (input) for mailman id 784870;
 Wed, 28 Aug 2024 14:16:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8VpF=P3=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1sjJTb-0001tx-F5
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 14:16:47 +0000
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [2607:f8b0:4864:20::c33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27bc15b8-6548-11ef-99a0-01e77a169b0f;
 Wed, 28 Aug 2024 16:16:45 +0200 (CEST)
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-5de92d2e9b3so2305701eaf.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 07:16:45 -0700 (PDT)
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
X-Inumbo-ID: 27bc15b8-6548-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724854604; x=1725459404; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6mbQVo3apXE3R6cHuuqLd86Pc8uhYEsQ0417KxFfQ8=;
        b=fEBuiO/3ZHGCNciyl02e+jkixjMj+xBgi9RFa5/KSQu7oJ4ZsOPaSzsj43BEjC6VmC
         V9eGxWzaj5keMCtJj3C74kx/xFqpO6aGym8Yb8+4EpDbfysp+GP4sdjwJ6FeJvnWHF8O
         NsxV2dVJUOFT5LutNW76Oez2DF32RrVIz/OjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724854604; x=1725459404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l6mbQVo3apXE3R6cHuuqLd86Pc8uhYEsQ0417KxFfQ8=;
        b=XwBQXl/sDwghF0g2YI9lof/LOk7oQBjYpxFzA1oc5d4/Xoz/d80JIHUm3T2Pcg1pa9
         HeVLRH4q/FkSeajq/xjhJrObQU6rbVfjfRLVRtoMIrwVtUFEp0LkBQotu4B9EvD24rYq
         ivV/p4Qr9I2BqWa6hJXwhf6ls0RzgWpMBeUaovRBvP3D4lOqLwIYDz5+hxGCN/WgasYx
         zFBbI9tct703PuecdGU9B+CAzeZlLDclTcsIIAkpPuHamaDIRa0yeREL21zeXbGePEQQ
         EeXb62h0rIjjLIkX2SQylDgE8k9K6UNITl+psUIb2y+xWqMhMSxElVtNz8d/hDmME7dL
         lyIw==
X-Gm-Message-State: AOJu0Yxr1J/rHD8ZJ+nCXDCtOsJuFgwhCQyC9Ir+7L/bVPbcre/u/rYS
	DWbXLM5oR5MeHAkt+OTrbwxhYEll9NKLZn0EPMQ5xvzSs+3AOSf3rGa4hOvK+ATNOW2BtWXHwx5
	A8+VyQ4aOLL73MgOFbNKSUAvGZL3463CqcX0QHg==
X-Google-Smtp-Source: AGHT+IFTAYJdBSbDfzqob4kRNU367vEbNkvLt7IUvnPTeOdLvUIMnH47f77F2d6yu9LNWLpfRJO6YlPlGCuDYvV86uA=
X-Received: by 2002:a05:6871:ca11:b0:270:4d48:6be2 with SMTP id
 586e51a60fabf-2777d1f3f58mr2051460fac.26.1724854604336; Wed, 28 Aug 2024
 07:16:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240828133033.2378322-1-andrew.cooper3@citrix.com> <CAEfZLvmJAw5wiKu5BZokgpbHdAv6Msro_ANgJ06NmATWuHiMNA@mail.gmail.com>
In-Reply-To: <CAEfZLvmJAw5wiKu5BZokgpbHdAv6Msro_ANgJ06NmATWuHiMNA@mail.gmail.com>
From: Edwin Torok <edwin.torok@cloud.com>
Date: Wed, 28 Aug 2024 15:16:33 +0100
Message-ID: <CAEfZLvm48sc50deiuvhoWfh0no=EHfCO4JpXKLvNPASAJZ8Whg@mail.gmail.com>
Subject: Re: [PATCH] tools/ocaml: Factor out compatiblity handling
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, 
	Rob Hoes <Rob.Hoes@citrix.com>, Andrii Sultanov <andrii.sultanov@cloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 3:15=E2=80=AFPM Edwin Torok <edwin.torok@cloud.com>=
 wrote:
>
> On Wed, Aug 28, 2024 at 2:30=E2=80=AFPM Andrew Cooper <andrew.cooper3@cit=
rix.com> wrote:
> >
> > ... rather than having each library implement its own subset.
> >
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > ---
> > CC: Christian Lindig <christian.lindig@citrix.com>
> > CC: David Scott <dave@recoil.org>
> > CC: Edwin T=C3=B6r=C3=B6k <edwin.torok@cloud.com>
> > CC: Rob Hoes <Rob.Hoes@citrix.com>
> > CC: Andrii Sultanov <andrii.sultanov@cloud.com>
> >
> > Broken out of a larger series, to help Andrii with his dynlib work.
> > ---
> >  tools/ocaml/libs/xc/Makefile        |  2 +-
> >  tools/ocaml/libs/xc/xenctrl_stubs.c | 13 +++----------
> >  tools/ocaml/libs/xen-caml-compat.h  | 23 +++++++++++++++++++++++
> >  3 files changed, 27 insertions(+), 11 deletions(-)
> >  create mode 100644 tools/ocaml/libs/xen-caml-compat.h
> >
> > diff --git a/tools/ocaml/libs/xc/Makefile b/tools/ocaml/libs/xc/Makefil=
e
> > index 1d9fecb06ef2..cdf4d01dac52 100644
> > --- a/tools/ocaml/libs/xc/Makefile
> > +++ b/tools/ocaml/libs/xc/Makefile
> > @@ -2,7 +2,7 @@ OCAML_TOPLEVEL=3D$(CURDIR)/../..
> >  XEN_ROOT=3D$(OCAML_TOPLEVEL)/../..
> >  include $(OCAML_TOPLEVEL)/common.make
> >
> > -CFLAGS +=3D -I../mmap $(CFLAGS_libxenctrl) $(CFLAGS_libxenguest)
> > +CFLAGS +=3D -I../ -I../mmap $(CFLAGS_libxenctrl) $(CFLAGS_libxenguest)
> >  CFLAGS +=3D $(APPEND_CFLAGS)
> >  OCAMLINCLUDE +=3D -I ../mmap -I ../eventchn
> >
> > diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/=
xenctrl_stubs.c
> > index a52908012960..c78191f95abc 100644
> > --- a/tools/ocaml/libs/xc/xenctrl_stubs.c
> > +++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
> > @@ -25,6 +25,8 @@
> >  #include <caml/fail.h>
> >  #include <caml/callback.h>
> >
> > +#include "xen-caml-compat.h"
> > +
> >  #include <sys/mman.h>
> >  #include <stdint.h>
> >  #include <string.h>
> > @@ -37,14 +39,6 @@
> >
> >  #include "mmap_stubs.h"
> >
> > -#ifndef Val_none
> > -#define Val_none (Val_int(0))
> > -#endif
> > -
> > -#ifndef Tag_some
> > -#define Tag_some 0
> > -#endif
> > -
> >  static inline xc_interface *xch_of_val(value v)
> >  {
> >         xc_interface *xch =3D *(xc_interface **)Data_custom_val(v);
> > @@ -744,8 +738,7 @@ CAMLprim value stub_xc_evtchn_status(value xch_val,=
 value domid, value port)
> >         Store_field(result_status, 0, Val_int(status.vcpu));
> >         Store_field(result_status, 1, stat);
> >
> > -       result =3D caml_alloc_small(1, Tag_some);
> > -       Store_field(result, 0, result_status);
> > +       result =3D caml_alloc_some(result_status);
> >
> >         CAMLreturn(result);
> >  }
> > diff --git a/tools/ocaml/libs/xen-caml-compat.h b/tools/ocaml/libs/xen-=
caml-compat.h
> > new file mode 100644
> > index 000000000000..b4a0ca4ce90c
> > --- /dev/null
> > +++ b/tools/ocaml/libs/xen-caml-compat.h
> > @@ -0,0 +1,23 @@
> > +/* SPDX-License-Identifier: LGPL-2.1-only WITH OCaml-LGPL-linking-exce=
ption */
> > +#ifndef XEN_CAML_COMPAT_H
> > +#define XEN_CAML_COMPAT_H
> > +
> > +#ifndef Val_none /* Option handling.  Compat for Ocaml < 4.12 */
> > +
> > +#define Val_none Val_int(0)
> > +#define Tag_some 0
> > +#define Some_val(v) Field(v, 0)
> > +
> > +static inline value caml_alloc_some(value v)
> > +{
> > +    CAMLparam1(v);
> > +
> > +    value some =3D caml_alloc_small(1, Tag_some);
> > +    Store_field(some, 0, v);
>
> The compiler uses Field() rather than Store_field() here.
> I think using Store_field here can potentially read uninitialized
> data, because 'caml_alloc_small' gives you uninitialized memory
> that you must immediately fill with valid values.
> Looking at the implementation Store_field calls caml_modify which will
> read the old value to figure out whether it was in minor or major
> heap,
> and doing that on uninitialized data is unpredictable.
>
> We should follow what the manual says and use Field() when
> caml_alloc_small() is used, and use Store_field() when caml_alloc() is
> used,
> and not attempt to mix them:
> See https://ocaml.org/manual/5.2/intfc.html#ss:c-low-level-gc-harmony

Which probably means we've got a bunch of other pre-existing bugs like
these that we need to fix,
as otherwise we do quite a lot of operations on uninitialized data...

>
> > +
> > +    CAMLreturn(some);
> > +}
> > +
> > +#endif /* !Val_none */
> > +
> > +#endif /* XEN_CAML_COMPAT_H */
> >
> > base-commit: 75c64db3722f0245137a1e8cfd3435f4790d0fd7
> > --
> > 2.39.2
> >

