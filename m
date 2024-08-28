Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D60E962A35
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 16:27:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784892.1194301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjJe3-0005Jn-Ts; Wed, 28 Aug 2024 14:27:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784892.1194301; Wed, 28 Aug 2024 14:27:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjJe3-0005H1-Qi; Wed, 28 Aug 2024 14:27:35 +0000
Received: by outflank-mailman (input) for mailman id 784892;
 Wed, 28 Aug 2024 14:27:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8VpF=P3=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1sjJe2-0005FM-5G
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 14:27:34 +0000
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [2001:4860:4864:20::2a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9a458c6-6549-11ef-a0b0-8be0dac302b0;
 Wed, 28 Aug 2024 16:27:33 +0200 (CEST)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-27032e6dbf2so4323494fac.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 07:27:33 -0700 (PDT)
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
X-Inumbo-ID: a9a458c6-6549-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724855252; x=1725460052; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qa/H1ncEY8uYMIx0VFMRocUlTKAMW0akNfBkAXUhGJE=;
        b=LcBMOROiaW7YlEw1OY5n/0ip9HU3jc1JbBJ6bHtIsSdC4Ez+FtVHySY21Tegg1VNq/
         H3GgQVbkBW3XrfMDyaoRzGQQBi2UVAsEJyJJ8zw+G1a8VWRZ3OErzFtuAA1ai+wldCJU
         8FcEOeq5ZAqaPBTPIrqJ2fdZLKGH9UsrfJXYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724855252; x=1725460052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qa/H1ncEY8uYMIx0VFMRocUlTKAMW0akNfBkAXUhGJE=;
        b=LS9tKf8VgM4ZFPli4i6hYyNfkrQBQm0G1FW75OCb9xBBMmoWl/+FfKKaa3NpWZMyNa
         OFP/bI+9jlXnh02cU5ahBuHKzXe8UTE0FJCCs8fO9NZR/GFNc+Ks06yggAg2La9EbxyO
         G5deDrary018HG188siO0RKHDBK8psyVKZ27Owf/X7Aqv7Df4+HwkycI22AqALKjYp9T
         lJMP0QAmUEBjBR787LkOwC64DAycEz14R2oPBHgXgDMXZ6Tesan4TlguPJmdYpkOSOCn
         ebrSvxM3hf/VuZAV9/3baecKPs5PiiWY3NfNbjpf7KK3I7sCI3WFDDBCwNUsZC7U4LYA
         349w==
X-Gm-Message-State: AOJu0YxIHKnmiPjzvf+vgJWrQgVptvNZT1MOBM4WAFW3+huICccOr28D
	A6NBjKXG4aytzPnRd02gsuXDQNz4HLEjwMW/5omWAldhkQdd2zacDg11ksF1OQlK5QkV5XMC6Ov
	iQlc/DqLkP+zyJCwUgSvINVKidyxKe6wR+on6/z674On4PEjeV3c=
X-Google-Smtp-Source: AGHT+IE8dGawMqYldqAp2Sjm3ye7oP4gKigex6EsiKVHb+FX4IFg/agc+1Er4TULw/su0p3I+BLrIewhIe2UEGGxaBU=
X-Received: by 2002:a05:6871:286:b0:260:fd20:a880 with SMTP id
 586e51a60fabf-273e674bcc8mr17919272fac.42.1724855251949; Wed, 28 Aug 2024
 07:27:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240828133033.2378322-1-andrew.cooper3@citrix.com>
 <CAEfZLvmJAw5wiKu5BZokgpbHdAv6Msro_ANgJ06NmATWuHiMNA@mail.gmail.com> <a30f26be-b460-449b-a80c-f5d3a85f0550@citrix.com>
In-Reply-To: <a30f26be-b460-449b-a80c-f5d3a85f0550@citrix.com>
From: Edwin Torok <edwin.torok@cloud.com>
Date: Wed, 28 Aug 2024 15:27:20 +0100
Message-ID: <CAEfZLvkTpWxcX+3FRnWJHfwmegDPgbaCkVJCoN0hbbf7hSdvgw@mail.gmail.com>
Subject: Re: [PATCH] tools/ocaml: Factor out compatiblity handling
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, 
	Rob Hoes <Rob.Hoes@citrix.com>, Andrii Sultanov <andrii.sultanov@cloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 3:20=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> On 28/08/2024 3:15 pm, Edwin Torok wrote:
> > On Wed, Aug 28, 2024 at 2:30=E2=80=AFPM Andrew Cooper <andrew.cooper3@c=
itrix.com> wrote:
> >> ... rather than having each library implement its own subset.
> >>
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> ---
> >> CC: Christian Lindig <christian.lindig@citrix.com>
> >> CC: David Scott <dave@recoil.org>
> >> CC: Edwin T=C3=B6r=C3=B6k <edwin.torok@cloud.com>
> >> CC: Rob Hoes <Rob.Hoes@citrix.com>
> >> CC: Andrii Sultanov <andrii.sultanov@cloud.com>
> >>
> >> Broken out of a larger series, to help Andrii with his dynlib work.
> >> ---
> >>  tools/ocaml/libs/xc/Makefile        |  2 +-
> >>  tools/ocaml/libs/xc/xenctrl_stubs.c | 13 +++----------
> >>  tools/ocaml/libs/xen-caml-compat.h  | 23 +++++++++++++++++++++++
> >>  3 files changed, 27 insertions(+), 11 deletions(-)
> >>  create mode 100644 tools/ocaml/libs/xen-caml-compat.h
> >>
> >> diff --git a/tools/ocaml/libs/xc/Makefile b/tools/ocaml/libs/xc/Makefi=
le
> >> index 1d9fecb06ef2..cdf4d01dac52 100644
> >> --- a/tools/ocaml/libs/xc/Makefile
> >> +++ b/tools/ocaml/libs/xc/Makefile
> >> @@ -2,7 +2,7 @@ OCAML_TOPLEVEL=3D$(CURDIR)/../..
> >>  XEN_ROOT=3D$(OCAML_TOPLEVEL)/../..
> >>  include $(OCAML_TOPLEVEL)/common.make
> >>
> >> -CFLAGS +=3D -I../mmap $(CFLAGS_libxenctrl) $(CFLAGS_libxenguest)
> >> +CFLAGS +=3D -I../ -I../mmap $(CFLAGS_libxenctrl) $(CFLAGS_libxenguest=
)
> >>  CFLAGS +=3D $(APPEND_CFLAGS)
> >>  OCAMLINCLUDE +=3D -I ../mmap -I ../eventchn
> >>
> >> diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc=
/xenctrl_stubs.c
> >> index a52908012960..c78191f95abc 100644
> >> --- a/tools/ocaml/libs/xc/xenctrl_stubs.c
> >> +++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
> >> @@ -25,6 +25,8 @@
> >>  #include <caml/fail.h>
> >>  #include <caml/callback.h>
> >>
> >> +#include "xen-caml-compat.h"
> >> +
> >>  #include <sys/mman.h>
> >>  #include <stdint.h>
> >>  #include <string.h>
> >> @@ -37,14 +39,6 @@
> >>
> >>  #include "mmap_stubs.h"
> >>
> >> -#ifndef Val_none
> >> -#define Val_none (Val_int(0))
> >> -#endif
> >> -
> >> -#ifndef Tag_some
> >> -#define Tag_some 0
> >> -#endif
> >> -
> >>  static inline xc_interface *xch_of_val(value v)
> >>  {
> >>         xc_interface *xch =3D *(xc_interface **)Data_custom_val(v);
> >> @@ -744,8 +738,7 @@ CAMLprim value stub_xc_evtchn_status(value xch_val=
, value domid, value port)
> >>         Store_field(result_status, 0, Val_int(status.vcpu));
> >>         Store_field(result_status, 1, stat);
> >>
> >> -       result =3D caml_alloc_small(1, Tag_some);
> >> -       Store_field(result, 0, result_status);
> >> +       result =3D caml_alloc_some(result_status);
> >>
> >>         CAMLreturn(result);
> >>  }
> >> diff --git a/tools/ocaml/libs/xen-caml-compat.h b/tools/ocaml/libs/xen=
-caml-compat.h
> >> new file mode 100644
> >> index 000000000000..b4a0ca4ce90c
> >> --- /dev/null
> >> +++ b/tools/ocaml/libs/xen-caml-compat.h
> >> @@ -0,0 +1,23 @@
> >> +/* SPDX-License-Identifier: LGPL-2.1-only WITH OCaml-LGPL-linking-exc=
eption */
> >> +#ifndef XEN_CAML_COMPAT_H
> >> +#define XEN_CAML_COMPAT_H
> >> +
> >> +#ifndef Val_none /* Option handling.  Compat for Ocaml < 4.12 */
> >> +
> >> +#define Val_none Val_int(0)
> >> +#define Tag_some 0
> >> +#define Some_val(v) Field(v, 0)
> >> +
> >> +static inline value caml_alloc_some(value v)
> >> +{
> >> +    CAMLparam1(v);
> >> +
> >> +    value some =3D caml_alloc_small(1, Tag_some);
> >> +    Store_field(some, 0, v);
> > The compiler uses Field() rather than Store_field() here.
> > I think using Store_field here can potentially read uninitialized
> > data, because 'caml_alloc_small' gives you uninitialized memory
> > that you must immediately fill with valid values.
> > Looking at the implementation Store_field calls caml_modify which will
> > read the old value to figure out whether it was in minor or major
> > heap,
> > and doing that on uninitialized data is unpredictable.
> >
> > We should follow what the manual says and use Field() when
> > caml_alloc_small() is used, and use Store_field() when caml_alloc() is
> > used,
> > and not attempt to mix them:
> > See https://ocaml.org/manual/5.2/intfc.html#ss:c-low-level-gc-harmony
>
> Lovely, this got changed in Ocaml with no information or justification...
>
> https://github.com/ocaml/ocaml/pull/9819
>

Looking at the code more it only dereferences the old value if
Is_young returns false. And Is_young is done as a pointer comparison.
Newly allocated values will live in the young (minor) heap by default
and you're not allowed to have a GC run between caml_alloc_small and
Store_field anyway.
So in practice Store_field is probably OK, but is on very dangerous
ground as it relies on an implementation detail.

> I'll resync this locally, but I shaltn't repost.
>
> ~Andrew

