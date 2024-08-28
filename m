Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 701BC9629FD
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 16:16:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784863.1194261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjJSG-0000id-14; Wed, 28 Aug 2024 14:15:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784863.1194261; Wed, 28 Aug 2024 14:15:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjJSF-0000gB-U5; Wed, 28 Aug 2024 14:15:23 +0000
Received: by outflank-mailman (input) for mailman id 784863;
 Wed, 28 Aug 2024 14:15:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8VpF=P3=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1sjJSD-0000g5-RB
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 14:15:21 +0000
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [2001:4860:4864:20::2a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f503d3e5-6547-11ef-a0b0-8be0dac302b0;
 Wed, 28 Aug 2024 16:15:20 +0200 (CEST)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-268eec6c7c1so4535705fac.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 07:15:20 -0700 (PDT)
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
X-Inumbo-ID: f503d3e5-6547-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724854519; x=1725459319; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJZNtG3bBFxdf+oxP206xMOBzxraOp+5kHD+xYJrLc4=;
        b=WWVscQc5L6uoagundfjv9YHUphxRusSaSwVBch6JHvfmvbffwWS6o/mfzSMSBEN6YM
         m2J5ZNjnAxn07hnpjx9LZ4I6m3EbZQ/6wC87MArRIKKnEEa0u7clbWr0Aj0O5fQxiVkV
         4btBRnjzhw8HErHcKgh2e01Un3kh+YV3NlX2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724854519; x=1725459319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sJZNtG3bBFxdf+oxP206xMOBzxraOp+5kHD+xYJrLc4=;
        b=i+/nSXWhqShvbCjnpfLjHQ1jvJJy3xs5lvS7LiXGmpxoKXFdoNszIhhDw6Zk9JoOV1
         2+8mKo5O6tC5thhO7owmG2SbFsBSXwNJld+3y3X8PBRCiIWELCkdTwKh76gwmj/7usDl
         sYTI458Nhw05MX3SeQdfqiNnmCB2+3Pql7Pcztk2GeuI27N+T8bLpW/omr+1d1jwwnGM
         Pload8qx8XmNw324WxxvZygZzDNfdwDKjpLJmW2iAdP6CPJFah8rj/OM+1AXyb9YAVe+
         K0p7/Z/t6QzE66+eXl2c/jiZ11qNFZdN5Q9unif7yzzrYyX3EuYZU5dDrHhScKhGPsCX
         f24g==
X-Gm-Message-State: AOJu0Ywf2s8aGJxqHuS9UIoF0EFmRVZGMdJZZpCR40/p2rLnFefiOKYc
	7tvNh3Brad2TK9xeJ5dNKqAJq2u6qwkZ3qgjTpWn1irgSAQlaojcpCcJVRumnygJ4sxIBy213tc
	Su50qCRSllSM0/YNOKBt3F78kOggVwvKbHgeKfQ==
X-Google-Smtp-Source: AGHT+IEZHo9aVUAyCmyAsLyIUacC91+qeimCIe146baUuugw2F5R5hmhIENi++R5BhS0YuAX4oPDilK24t7y7+dq6vE=
X-Received: by 2002:a05:6870:8a25:b0:261:1dfb:3f35 with SMTP id
 586e51a60fabf-273e672a2a0mr19620923fac.48.1724854519241; Wed, 28 Aug 2024
 07:15:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240828133033.2378322-1-andrew.cooper3@citrix.com>
In-Reply-To: <20240828133033.2378322-1-andrew.cooper3@citrix.com>
From: Edwin Torok <edwin.torok@cloud.com>
Date: Wed, 28 Aug 2024 15:15:08 +0100
Message-ID: <CAEfZLvmJAw5wiKu5BZokgpbHdAv6Msro_ANgJ06NmATWuHiMNA@mail.gmail.com>
Subject: Re: [PATCH] tools/ocaml: Factor out compatiblity handling
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, 
	Rob Hoes <Rob.Hoes@citrix.com>, Andrii Sultanov <andrii.sultanov@cloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 2:30=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> ... rather than having each library implement its own subset.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Christian Lindig <christian.lindig@citrix.com>
> CC: David Scott <dave@recoil.org>
> CC: Edwin T=C3=B6r=C3=B6k <edwin.torok@cloud.com>
> CC: Rob Hoes <Rob.Hoes@citrix.com>
> CC: Andrii Sultanov <andrii.sultanov@cloud.com>
>
> Broken out of a larger series, to help Andrii with his dynlib work.
> ---
>  tools/ocaml/libs/xc/Makefile        |  2 +-
>  tools/ocaml/libs/xc/xenctrl_stubs.c | 13 +++----------
>  tools/ocaml/libs/xen-caml-compat.h  | 23 +++++++++++++++++++++++
>  3 files changed, 27 insertions(+), 11 deletions(-)
>  create mode 100644 tools/ocaml/libs/xen-caml-compat.h
>
> diff --git a/tools/ocaml/libs/xc/Makefile b/tools/ocaml/libs/xc/Makefile
> index 1d9fecb06ef2..cdf4d01dac52 100644
> --- a/tools/ocaml/libs/xc/Makefile
> +++ b/tools/ocaml/libs/xc/Makefile
> @@ -2,7 +2,7 @@ OCAML_TOPLEVEL=3D$(CURDIR)/../..
>  XEN_ROOT=3D$(OCAML_TOPLEVEL)/../..
>  include $(OCAML_TOPLEVEL)/common.make
>
> -CFLAGS +=3D -I../mmap $(CFLAGS_libxenctrl) $(CFLAGS_libxenguest)
> +CFLAGS +=3D -I../ -I../mmap $(CFLAGS_libxenctrl) $(CFLAGS_libxenguest)
>  CFLAGS +=3D $(APPEND_CFLAGS)
>  OCAMLINCLUDE +=3D -I ../mmap -I ../eventchn
>
> diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xe=
nctrl_stubs.c
> index a52908012960..c78191f95abc 100644
> --- a/tools/ocaml/libs/xc/xenctrl_stubs.c
> +++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
> @@ -25,6 +25,8 @@
>  #include <caml/fail.h>
>  #include <caml/callback.h>
>
> +#include "xen-caml-compat.h"
> +
>  #include <sys/mman.h>
>  #include <stdint.h>
>  #include <string.h>
> @@ -37,14 +39,6 @@
>
>  #include "mmap_stubs.h"
>
> -#ifndef Val_none
> -#define Val_none (Val_int(0))
> -#endif
> -
> -#ifndef Tag_some
> -#define Tag_some 0
> -#endif
> -
>  static inline xc_interface *xch_of_val(value v)
>  {
>         xc_interface *xch =3D *(xc_interface **)Data_custom_val(v);
> @@ -744,8 +738,7 @@ CAMLprim value stub_xc_evtchn_status(value xch_val, v=
alue domid, value port)
>         Store_field(result_status, 0, Val_int(status.vcpu));
>         Store_field(result_status, 1, stat);
>
> -       result =3D caml_alloc_small(1, Tag_some);
> -       Store_field(result, 0, result_status);
> +       result =3D caml_alloc_some(result_status);
>
>         CAMLreturn(result);
>  }
> diff --git a/tools/ocaml/libs/xen-caml-compat.h b/tools/ocaml/libs/xen-ca=
ml-compat.h
> new file mode 100644
> index 000000000000..b4a0ca4ce90c
> --- /dev/null
> +++ b/tools/ocaml/libs/xen-caml-compat.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: LGPL-2.1-only WITH OCaml-LGPL-linking-except=
ion */
> +#ifndef XEN_CAML_COMPAT_H
> +#define XEN_CAML_COMPAT_H
> +
> +#ifndef Val_none /* Option handling.  Compat for Ocaml < 4.12 */
> +
> +#define Val_none Val_int(0)
> +#define Tag_some 0
> +#define Some_val(v) Field(v, 0)
> +
> +static inline value caml_alloc_some(value v)
> +{
> +    CAMLparam1(v);
> +
> +    value some =3D caml_alloc_small(1, Tag_some);
> +    Store_field(some, 0, v);

The compiler uses Field() rather than Store_field() here.
I think using Store_field here can potentially read uninitialized
data, because 'caml_alloc_small' gives you uninitialized memory
that you must immediately fill with valid values.
Looking at the implementation Store_field calls caml_modify which will
read the old value to figure out whether it was in minor or major
heap,
and doing that on uninitialized data is unpredictable.

We should follow what the manual says and use Field() when
caml_alloc_small() is used, and use Store_field() when caml_alloc() is
used,
and not attempt to mix them:
See https://ocaml.org/manual/5.2/intfc.html#ss:c-low-level-gc-harmony

> +
> +    CAMLreturn(some);
> +}
> +
> +#endif /* !Val_none */
> +
> +#endif /* XEN_CAML_COMPAT_H */
>
> base-commit: 75c64db3722f0245137a1e8cfd3435f4790d0fd7
> --
> 2.39.2
>

