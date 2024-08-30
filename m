Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A37F9665BB
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 17:36:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786496.1196058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk3eZ-00074Y-9V; Fri, 30 Aug 2024 15:35:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786496.1196058; Fri, 30 Aug 2024 15:35:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk3eZ-00072J-5l; Fri, 30 Aug 2024 15:35:11 +0000
Received: by outflank-mailman (input) for mailman id 786496;
 Fri, 30 Aug 2024 15:35:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X2Xk=P5=cloud.com=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1sk3eX-00072D-AH
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 15:35:09 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6fdf721d-66e5-11ef-a0b1-8be0dac302b0;
 Fri, 30 Aug 2024 17:35:08 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5c210e23651so2145995a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Aug 2024 08:35:08 -0700 (PDT)
Received: from smtpclient.apple ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226ce54dbsm2130516a12.90.2024.08.30.08.35.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 Aug 2024 08:35:06 -0700 (PDT)
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
X-Inumbo-ID: 6fdf721d-66e5-11ef-a0b1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725032108; x=1725636908; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8UXBlXWH+S8PPSMlgkp60n/fC/Ac2whA4zgV7WSDV3w=;
        b=lBrDkhJJRfZYgq0WTC3io6yTx8j+GEjEBmnEj5iFd1pW5uYjVRbtjn8kWZ0MxbGhXJ
         Zciqct4XyhhMd0mpul74MmZdAYDDxh/MQwCzOYriOL0KQhVFsdJWI/FYYPW6/X1vWEgQ
         QYETJHn2AOUZLYiKbvIPqtn4oqy8Hsf1wBL9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725032108; x=1725636908;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8UXBlXWH+S8PPSMlgkp60n/fC/Ac2whA4zgV7WSDV3w=;
        b=WYMGe+48Oen0zAshOrQumaUSINjtSGFvVdCSOLRRWZE3EqYmltsup2B9j5uXNUDDz8
         6j8Dg6GN5fCjGcR7+EDw9PhzuB9qN7NulYnduvGKVjprdlqWd4XkvPAqqNHSiwoTdwDK
         pHRSI/8cVpCGMstD5terOX7XVOBLm5drB8wgRBqSeuuK1B3aOblfJnknuhDZcaX5rYHm
         lsd+eEJYgI7KGVymmhL2RiVNt3aeVmiuWF4EMsgxnXbhhQOjpFP/76f8eV6Ycy9C8cin
         CW93ug0xXv3nWCYzEFsjWD5FzSX8baV5zV3/4Upy2ifiSHy54jLzNaC+fgtXWdxqaj3N
         Y//w==
X-Gm-Message-State: AOJu0Yxt7wojBcCQRYnG3YOK+0wuYyeri0o1bcTG9VjgkHT/ayNMXqCo
	vaxUlOYH+FE+3rUTkwuzGIJ4KZsnCJdlTmdPzBqhsJJxkVMph09VKDOAiuLK8yw=
X-Google-Smtp-Source: AGHT+IGINzFEEgcqW5B1LFTx9AwAOcBiA1nutISsEOqs/y8cqOYYcFkvZqZpV0HAwSklYI5+9MdOZA==
X-Received: by 2002:a05:6402:40c8:b0:5c2:1298:35ee with SMTP id 4fb4d7f45d1cf-5c21ed33fe2mr5853149a12.2.1725032107074;
        Fri, 30 Aug 2024 08:35:07 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH] tools/ocaml: Factor out compatiblity handling
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <20240828133033.2378322-1-andrew.cooper3@citrix.com>
Date: Fri, 30 Aug 2024 16:34:54 +0100
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>,
 =?utf-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 Rob Hoes <Rob.Hoes@citrix.com>,
 Andrii Sultanov <andrii.sultanov@cloud.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <8A3B017E-662B-46C3-9105-353F2D060006@cloud.com>
References: <20240828133033.2378322-1-andrew.cooper3@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
X-Mailer: Apple Mail (2.3774.600.62)



> On 28 Aug 2024, at 14:30, Andrew Cooper <Andrew.Cooper3@citrix.com> =
wrote:
>=20
> ... rather than having each library implement its own subset.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Christian Lindig <christian.lindig@citrix.com>
> CC: David Scott <dave@recoil.org>
> CC: Edwin T=C3=B6r=C3=B6k <edwin.torok@cloud.com>
> CC: Rob Hoes <Rob.Hoes@citrix.com>
> CC: Andrii Sultanov <andrii.sultanov@cloud.com>
>=20
> Broken out of a larger series, to help Andrii with his dynlib work.
> ---
> tools/ocaml/libs/xc/Makefile        |  2 +-
> tools/ocaml/libs/xc/xenctrl_stubs.c | 13 +++----------
> tools/ocaml/libs/xen-caml-compat.h  | 23 +++++++++++++++++++++++
> 3 files changed, 27 insertions(+), 11 deletions(-)
> create mode 100644 tools/ocaml/libs/xen-caml-compat.h
>=20
> diff --git a/tools/ocaml/libs/xc/Makefile =
b/tools/ocaml/libs/xc/Makefile
> index 1d9fecb06ef2..cdf4d01dac52 100644
> --- a/tools/ocaml/libs/xc/Makefile
> +++ b/tools/ocaml/libs/xc/Makefile
> @@ -2,7 +2,7 @@ OCAML_TOPLEVEL=3D$(CURDIR)/../..
> XEN_ROOT=3D$(OCAML_TOPLEVEL)/../..
> include $(OCAML_TOPLEVEL)/common.make
>=20
> -CFLAGS +=3D -I../mmap $(CFLAGS_libxenctrl) $(CFLAGS_libxenguest)
> +CFLAGS +=3D -I../ -I../mmap $(CFLAGS_libxenctrl) =
$(CFLAGS_libxenguest)
> CFLAGS +=3D $(APPEND_CFLAGS)
> OCAMLINCLUDE +=3D -I ../mmap -I ../eventchn
>=20
> diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c =
b/tools/ocaml/libs/xc/xenctrl_stubs.c
> index a52908012960..c78191f95abc 100644
> --- a/tools/ocaml/libs/xc/xenctrl_stubs.c
> +++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
> @@ -25,6 +25,8 @@
> #include <caml/fail.h>
> #include <caml/callback.h>
>=20
> +#include "xen-caml-compat.h"
> +
> #include <sys/mman.h>
> #include <stdint.h>
> #include <string.h>
> @@ -37,14 +39,6 @@
>=20
> #include "mmap_stubs.h"
>=20
> -#ifndef Val_none
> -#define Val_none (Val_int(0))
> -#endif
> -
> -#ifndef Tag_some
> -#define Tag_some 0
> -#endif
> -
> static inline xc_interface *xch_of_val(value v)
> {
> xc_interface *xch =3D *(xc_interface **)Data_custom_val(v);
> @@ -744,8 +738,7 @@ CAMLprim value stub_xc_evtchn_status(value =
xch_val, value domid, value port)
> Store_field(result_status, 0, Val_int(status.vcpu));
> Store_field(result_status, 1, stat);
>=20
> - result =3D caml_alloc_small(1, Tag_some);
> - Store_field(result, 0, result_status);
> + result =3D caml_alloc_some(result_status);
>=20
> CAMLreturn(result);
> }
> diff --git a/tools/ocaml/libs/xen-caml-compat.h =
b/tools/ocaml/libs/xen-caml-compat.h
> new file mode 100644
> index 000000000000..b4a0ca4ce90c
> --- /dev/null
> +++ b/tools/ocaml/libs/xen-caml-compat.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: LGPL-2.1-only WITH =
OCaml-LGPL-linking-exception */
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
> +
> +    CAMLreturn(some);
> +}
> +
> +#endif /* !Val_none */
> +
> +#endif /* XEN_CAML_COMPAT_H */
>=20
> base-commit: 75c64db3722f0245137a1e8cfd3435f4790d0fd7
> --=20
> 2.39.2
>=20

Acked-by: Christian Lindig <christian.lindig@cloud.com>



