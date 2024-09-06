Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D58396F690
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 16:21:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791864.1201874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smZpR-0003lx-0D; Fri, 06 Sep 2024 14:20:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791864.1201874; Fri, 06 Sep 2024 14:20:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smZpQ-0003jn-Tl; Fri, 06 Sep 2024 14:20:48 +0000
Received: by outflank-mailman (input) for mailman id 791864;
 Fri, 06 Sep 2024 14:20:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CpH2=QE=cloud.com=andrii.sultanov@srs-se1.protection.inumbo.net>)
 id 1smZpP-0003jd-7F
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2024 14:20:47 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3462e91a-6c5b-11ef-99a1-01e77a169b0f;
 Fri, 06 Sep 2024 16:20:44 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2f50f1d864fso24708621fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 06 Sep 2024 07:20:44 -0700 (PDT)
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
X-Inumbo-ID: 3462e91a-6c5b-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725632444; x=1726237244; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CSGw+yMSlXriUrFp1E9kFzuHytbvzTOxCF6WK9bRlns=;
        b=ZpF1w8BAzAPiKjR7PGZMTACkj0RR+fql/wHMoXH4cy4XWHP0Rwxj3wnWNPJGnnv/dK
         z6Sg+joH+qmA4luyaDFDW+rGBqNFYW2gBQFe/cHgeqn3DMs6eijEJ3pA1W7PEJmDP3hU
         PhGB/raum9DZcdVoN+Vj7+Pq5vUf5cIYJskFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725632444; x=1726237244;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CSGw+yMSlXriUrFp1E9kFzuHytbvzTOxCF6WK9bRlns=;
        b=VjAlgdbUAW1r/PsG7BZsRjXzJJfPqGt5PSy+dAnpj1M9SCIY7fvao9n7Xk62lnjNnH
         13I+jSEnLbCBX34pjGLRMnj9sAtMWJe3lpP0QAK4Q8rmK5v2HOsW7ylZx9eJl3MvpEmH
         ZZXC6ZMDFW9C9YraOK7kxbw6KkDeYYfZBnGINX19sdl6CdNykj8rj/nwQUBti1uLVb1K
         H6l3sno2RfMJyBi+7jkg+Nt22JptUiMedx1jdpAK9U6bFLwNjmJUycN5zi+4TGaBmC3y
         PK25xaVaLEcbBg5C//H9EGID1Vg14ETpZIVafMUuBjk5sjo84T1yRE2sYc8s0GHpmS6y
         wHKQ==
X-Gm-Message-State: AOJu0YyBv15l1WTFIdSVqAvhOUp1ABcBR4LowegMXdIRWqonIC/IokzX
	H5vCFFZQ5bRj5aN7UDADjy1j8wmyvEeJipqtCeYLY21AuNc0gKERx5rgRrtSCDW0wBxZ3TIV+NM
	jGKP+FCpsksHnUMPRNf8dpCnFzNOEoonsxAsrvg==
X-Google-Smtp-Source: AGHT+IGY4LI/U7KFMJOcGo17bqB4aSUp3Q5hhBIuNHE8hubFAF/SAQ+iq5jCrn8l9aNPaxawfE/c+06cYpz5tiqK4vc=
X-Received: by 2002:a2e:4c12:0:b0:2ef:2b05:2ab3 with SMTP id
 38308e7fff4ca-2f751ec80dcmr17204771fa.10.1725632443907; Fri, 06 Sep 2024
 07:20:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1725363427.git.andrii.sultanov@cloud.com>
 <e146c0e378f81aee0789dd472aae5f0ed09d8301.1725363427.git.andrii.sultanov@cloud.com>
 <d4985052-a229-48e5-9294-c8392ee74ab5@citrix.com>
In-Reply-To: <d4985052-a229-48e5-9294-c8392ee74ab5@citrix.com>
From: Andrii Sultanov <andrii.sultanov@cloud.com>
Date: Fri, 6 Sep 2024 15:20:31 +0100
Message-ID: <CAAa3AOMLrpSGQR7bthqvmW7RNbyOWKXG-iYhdATJGVOxyn5VGg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] ocaml/libs: Implement a dynamically-loaded plugin
 for Xenctrl.domain_getinfo
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, 
	Anthony PERARD <anthony.perard@vates.tech>
Content-Type: multipart/alternative; boundary="000000000000d51d2d0621741c3f"

--000000000000d51d2d0621741c3f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> > diff --git
a/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/Makefile
b/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/Makefile
> > new file mode 100644
> > index 0000000000..9c40026cab
> > --- /dev/null
> > +++ b/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/Makefile
> > @@ -0,0 +1,38 @@
> > +OCAML_TOPLEVEL=3D$(CURDIR)/../../..
> > +XEN_ROOT=3D$(OCAML_TOPLEVEL)/../..
> > +include $(OCAML_TOPLEVEL)/common.make
> > +
> > +CFLAGS +=3D -I $(OCAML_TOPLEVEL)/libs -I
$(OCAML_TOPLEVEL)/libs/xenstoredglue
> > +CFLAGS +=3D $(CFLAGS_libxenctrl) $(CFLAGS_xeninclude) $(APPEND_CFLAGS)
> > +OCAMLOPTFLAGS +=3D -opaque
> > +OCAMLINCLUDE +=3D -I ./ -I ../
>
> I think we only need "-I ../" here.  xen-caml-compat.h is the only local
> header used.

With only "-I ../", the build fails:
```
ocamlopt -g -ccopt "   " -dtypes -I ../ -w F -warn-error F -opaque -shared
-linkall -o domain_getinfo_v1.cmxs  domain_getinfo_v1.cmxa
/usr/bin/ld: cannot find -ldomain_getinfo_v1_stubs: No such file or
directory
collect2: error: ld returned 1 exit status
```

Thank you very much for the rest, I will submit a new version of the patch
series shortly.

On Fri, Sep 6, 2024 at 2:38=E2=80=AFPM Andrew Cooper <andrew.cooper3@citrix=
.com>
wrote:

> On 03/09/2024 12:44 pm, Andrii Sultanov wrote:
> > This plugin intends to hide the unstable Xenctrl interface under a
> > stable one. In case of the change in the interface, a V2 of this plugin
> > would need to be produced, but V1 with the old interface would
> > need to be kept (with potential change in the implementation) in the
> > meantime.
> >
> > To reduce the need for such changes in the future, this plugin only
> > provides the absolute minimum functionality that Oxenstored uses - only
> > three fields of the domaininfo struct are used and presented here.
> >
> > Oxenstored currently uses the single-domain domain_getinfo function,
> > whereas Cxenstored uses the more-efficient domain_getinfolist. Both of
> > these are provided in the plugin to allow a transition from one to the
> > other without modifying the interface in the future. Both return
> > identical structures and rely on the same fields in xenctrl, thus if on=
e
> > of them breaks, both will break, and a new version of the interface wou=
ld
> > need to be issued.
> >
> > Signed-off-by: Andrii Sultanov <andrii.sultanov@cloud.com>
> > ---
>
> Normally you should put a short set of notes here (under --- in the
> commit message) about what has changed from the prior version you posted.
>
> >  tools/ocaml/Makefile                          |   1 +
> >  tools/ocaml/libs/Makefile                     |   2 +-
> >  tools/ocaml/libs/xenstoredglue/META.in        |   4 +
> >  tools/ocaml/libs/xenstoredglue/Makefile       |  46 +++++
> >  .../domain_getinfo_plugin_v1/META.in          |   5 +
> >  .../domain_getinfo_plugin_v1/Makefile         |  38 ++++
> >  .../domain_getinfo_stubs_v1.c                 | 172 ++++++++++++++++++
> >  .../domain_getinfo_v1.ml                      |  36 ++++
> >  .../domain_getinfo_v1.mli                     |   0
> >  .../libs/xenstoredglue/plugin_interface_v1.ml |  28 +++
> >  .../xenstoredglue/plugin_interface_v1.mli     |  36 ++++
> >  11 files changed, 367 insertions(+), 1 deletion(-)
> >  create mode 100644 tools/ocaml/libs/xenstoredglue/META.in
> >  create mode 100644 tools/ocaml/libs/xenstoredglue/Makefile
> >  create mode 100644
> tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/META.in
> >  create mode 100644
> tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/Makefile
> >  create mode 100644
> tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_st=
ubs_v1.c
> >  create mode 100644
> tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/
> domain_getinfo_v1.ml
> >  create mode 100644
> tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_v1=
.mli
> >  create mode 100644 tools/ocaml/libs/xenstoredglue/
> plugin_interface_v1.ml
> >  create mode 100644
> tools/ocaml/libs/xenstoredglue/plugin_interface_v1.mli
>
> We still have a mix of names even within this patch.  xenstoredglue,
> xenstored_glue, xsglue
>
> Could we see about using xsd_glue as the top level name here, to get it
> a bit shorter and easier to read?
>
> > diff --git
> a/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/Makefile
> b/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/Makefile
> > new file mode 100644
> > index 0000000000..9c40026cab
> > --- /dev/null
> > +++ b/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/Makefile
> > @@ -0,0 +1,38 @@
> > +OCAML_TOPLEVEL=3D$(CURDIR)/../../..
> > +XEN_ROOT=3D$(OCAML_TOPLEVEL)/../..
> > +include $(OCAML_TOPLEVEL)/common.make
> > +
> > +CFLAGS +=3D -I $(OCAML_TOPLEVEL)/libs -I
> $(OCAML_TOPLEVEL)/libs/xenstoredglue
> > +CFLAGS +=3D $(CFLAGS_libxenctrl) $(CFLAGS_xeninclude) $(APPEND_CFLAGS)
> > +OCAMLOPTFLAGS +=3D -opaque
> > +OCAMLINCLUDE +=3D -I ./ -I ../
>
> I think we only need "-I ../" here.  xen-caml-compat.h is the only local
> header used.
>
> > diff --git
> a/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_=
stubs_v1.c
> b/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_=
stubs_v1.c
> > new file mode 100644
> > index 0000000000..69eddd6412
> > --- /dev/null
> > +++
> b/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_=
stubs_v1.c
> > @@ -0,0 +1,172 @@
>
> Sorry for missing this before, but new files want to contain SDPX
> headers.  For this,
>
> /* SPDX-License-Identifier: LGPL-2.1-only WITH
> OCaml-LGPL-linking-exception */
>
> which I had to go and research when sorting out xen-caml-compat.h
>
>
> For Ocaml files, suppose we want.
>
> (* SPDX-License-Identifier: LGPL-2.1-only WITH
> OCaml-LGPL-linking-exception *)
>
>
> The SPDX header should always be the first line of the file.
>
> > +#define _GNU_SOURCE
> > +
> > +#include <stdlib.h>
> > +#include <string.h>
> > +#include <errno.h>
> > +
> > +#define CAML_NAME_SPACE
> > +#include <caml/alloc.h>
> > +#include <caml/memory.h>
> > +#include <caml/signals.h>
> > +#include <caml/fail.h>
> > +#include <caml/callback.h>
> > +#include <caml/custom.h>
> > +
> > +#include <xen-tools/common-macros.h>
> > +#include <xenctrl.h>
> > +
> > +#include "xen-caml-compat.h"
> > +
> > +#define ERR_MSG_LEN (XC_MAX_ERROR_MSG_LEN + 6)
> > +#define MAX_FUNC_LINE_LEN 64
>
> These two are obsolete given the rework of xsglue_failwith_xc()
>
> > +#define failwith_xc_v1(xch) xsglue_failwith_xc(xch, __FUNCTION__,
> __LINE__)
>
> This should be moved lower and adjusted.  See later.
>
> > +
> > +/* This is a minimal stub to xenctrl for oxenstored's purposes
> > +   For the full xenctrl stubs, see tools/ocaml/libs/xc/xenctrl_stubs.c
> */
>
> These comments aren't helpful IMO.  It's said many times elsewhere.
>
> > +
> > +static inline xc_interface *xsglue_xch_of_val_v1(value v)
>
> static functions don't a _v1 suffix, seeing as they're local to a file
> with a _v1 in it's name.
>
> > +{
> > +     xc_interface *xch =3D *(xc_interface **)Data_custom_val(v);
> > +
> > +     return xch;
> > +}
> > +
> > +static void xsglue_xenctrl_finalize(value v)
> > +{
> > +     xc_interface *xch =3D xsglue_xch_of_val_v1(v);
> > +
> > +     xc_interface_close(xch);
> > +}
> > +
> > +static struct custom_operations xsglue_xenctrl_ops =3D {
> > +     .identifier  =3D "xenctrl",
>
> I presume this identifier gets elsewhere?  Perhaps
> "xsd_glue.domain_getinfo_v1.xenctrl" or so?
>
> > +     .finalize    =3D xsglue_xenctrl_finalize,
> > +     .compare     =3D custom_compare_default,     /* Can't compare    =
 */
> > +     .hash        =3D custom_hash_default,        /* Can't hash       =
 */
> > +     .serialize   =3D custom_serialize_default,   /* Can't serialize  =
 */
> > +     .deserialize =3D custom_deserialize_default, /* Can't deserialize=
 */
> > +     .compare_ext =3D custom_compare_ext_default, /* Can't compare    =
 */
> > +};
> > +
>
> There's a trick with the C preprocessor where you can
>
> #define xsglue_failwith(xch) xsglue_failwith(xch, __func__, __LINE__)
>
> to add extra arguments to callsites.  The only requirement is that it
> either needs to be after the function of the same name, or that you
> define the function using:
>
> static void Noreturn (xsglue_failwith)(xc_interface *xch ...)
>
>
> I'd put the macro and the declaration together here.  Also, use __func__
> rather than __FUNCTION__.
>
> > +static void Noreturn xsglue_failwith_xc(xc_interface *xch,
> > +             const char* func,
> > +             unsigned int line)
>
> The _xc() suffix isn't very helpful when there's also an xsglue_ prefix.
>
> I'd simply name this xsglue_failwith(...) which is clear enough when used=
.
>
> Also, 'const char *fun' with the * to the right of the space.
>
> > +{
> > +     const xc_error *error =3D xch ? xc_get_last_error(xch) : NULL;
> > +        char *str =3D NULL;
> > +     CAMLparam0();
> > +        CAMLlocal1(msg);
>
> Mixing tabs and spaces.
>
> > <snip>
> >
> > +static value xsglue_alloc_domaininfo_v1(const xc_domaininfo_t *info)
> > +{
> > +     CAMLparam0();
> > +     CAMLlocal1(result);
>
> We try to split declarations from regular logic, so a blank line here
> please.
>
> > +     result =3D caml_alloc_tuple(4);
> > +
> > +     Store_field(result,  0, Val_int(info->domain));
> > +     Store_field(result,  1, Val_bool(info->flags & XEN_DOMINF_dying))=
;
> > +     Store_field(result,  2, Val_bool(info->flags &
> XEN_DOMINF_shutdown));
> > +     Store_field(result,  3, Val_int(MASK_EXTR(info->flags,
> XEN_DOMINF_shutdownmask)));
> > +
> > +     CAMLreturn(result);
> > +}
> > +
> > +CAMLprim value stub_xsglue_xc_domain_getinfo(value xch_val, value domi=
d)
> > +{
> > +     CAMLparam2(xch_val, domid);
> > +     CAMLlocal1(result);
> > +     xc_interface *xch =3D xsglue_xch_of_val_v1(xch_val);
> > +     xc_domaininfo_t info;
> > +     int ret, domid_c;
> > +
> > +     domid_c =3D Int_val(domid);
>
> I'd suggests a blank line here, or to initialise domid_c at declaration.
>
> > +     caml_enter_blocking_section();
> > +     ret =3D xc_domain_getinfo_single(xch, domid_c, &info);
> > +     caml_leave_blocking_section();
> > +
> > +     if (ret < 0)
> > +             failwith_xc_v1(xch);
> > +
> > +     result =3D xsglue_alloc_domaininfo_v1(&info);
> > +
> > +     CAMLreturn(result);
> > +}
> > +
> > +CAMLprim value stub_xsglue_xc_domain_getinfolist(value xch_val, value
> first_domain)
> > +{
> > +     CAMLparam2(xch_val, first_domain);
> > +     CAMLlocal1(result);
> > +     xc_interface *xch =3D xsglue_xch_of_val_v1(xch_val);
> > +     xc_domaininfo_t *info;
> > +     int i, ret, toalloc, retval;
> > +     uint32_t num_domains;
> > +     uint32_t c_first_domain;
> > +
> > +     /* get the minimum number of allocate byte we need and bump it up
> to page boundary */
> > +     c_first_domain =3D Int_val(first_domain);
>
> Passing a first_domain of anything other than 0 breaks the atomicity
> that we're trying to create by asking for all domains together.
>
> It wants dropping from here, and the plugin interface.
>
> > +     num_domains =3D DOMID_FIRST_RESERVED - c_first_domain;
> > +     toalloc =3D (sizeof(xc_domaininfo_t) * num_domains) | 0xfff;
> > +     ret =3D posix_memalign((void **) ((void *) &info), 4096, toalloc)=
;
>
> This is nonsense, and appears to have been so for ages in the Xenctrl
> stubs.
>
> xc_domain_getinfolist() bounce-buffers the array anyway (to get
> hypercall-safe buffers from the kernel), so there's no point doing any
> local trickery.  Simply:
>
>     info =3D malloc(sizeof(xc_domaininfo_t) * DOMID_FIRST_RESERVED);
>     if ( !info )
>         caml_raise_out_of_memory();
>
> will be fine.
>
> > +     if (ret)
> > +             caml_raise_out_of_memory();
> > +
> > +     caml_enter_blocking_section();
> > +     retval =3D xc_domain_getinfolist(xch, c_first_domain, num_domains=
,
> info);
> > +     caml_leave_blocking_section();
> > +
> > +     if (retval < 0) {
> > +             free(info);
> > +             failwith_xc_v1(xch);
> > +     } else if (retval > 0) {
> > +             result =3D caml_alloc(retval, 0);
> > +             for (i =3D 0; i < retval; i++) {
> > +                     caml_modify(&Field(result, i),
> xsglue_alloc_domaininfo_v1(info + i));
> > +             }
> > +     } else {
> > +             result =3D Atom(0);
> > +     }
>
> While this works, there are better ways of writing the logic.
> failwith() is Noreturn, so it's easier to follow as:
>
>     if (retval < 0) {
>         ...
>     }
>
>     if (retval > 0) {
>         ...
>
> but...  You're dom0, asking for all domains.  Getting a retval of 0 is
> also some kind of error, so I'd suggest:
>
>     if (retval <=3D 0) {
>         free(info);
>         xsglue_failwith(xch);
>     }
>
>     result =3D caml_alloc(retval, 0);
>     for (i =3D 0; i < retval; i++) {
>         caml_modify(&Field(result, i), xsglue_alloc_domaininfo_v1(info +
> i));
>     }
>
>     free(info);
>     Camlreturn(result);
>
> which is simpler still.
>
>
> > diff --git a/tools/ocaml/libs/xenstoredglue/plugin_interface_v1.mli
> b/tools/ocaml/libs/xenstoredglue/plugin_interface_v1.mli
> > new file mode 100644
> > index 0000000000..d073a44d0f
> > --- /dev/null
> > +++ b/tools/ocaml/libs/xenstoredglue/plugin_interface_v1.mli
> > @@ -0,0 +1,36 @@
> > +(** To avoid breaking the plugin interface, this module needs to be
> > +    standalone and can't rely on any other Xen library. Even unrelated
> > +    changes in the interfaces of those modules would change the hash
> > +    of this interface and break the plugin system.
> > +    It can only depend on Stdlib, therefore all of the types (domid,
> > +    domaininfo etc.) are redefined here instead of using alternatives
> > +    defined elsewhere.
> > +
> > +    NOTE: The signature of this interface should not be changed (no
> > +    functions or types can be added, modified, or removed). If
> > +    underlying Xenctrl changes require a new interface, a V2 with a
> > +    corresponding plugin should be created.
> > + *)
>
> There's a rune to run ocp-indent in the Xen tree, in lieu of the full
> Ocaml dev stack.
>
> make -C tools/ocaml format
>
> and the delta for this patch is just:
>
> --- a/tools/ocaml/libs/xenstoredglue/plugin_interface_v1.mli
> +++ b/tools/ocaml/libs/xenstoredglue/plugin_interface_v1.mli
> @@ -10,7 +10,7 @@
>      functions or types can be added, modified, or removed). If
>      underlying Xenctrl changes require a new interface, a V2 with a
>      corresponding plugin should be created.
> - *)
> +*)
>
>  module type Domain_getinfo_V1 =3D sig
>    exception Error of string
>
> ~Andrew
>

--000000000000d51d2d0621741c3f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt; &gt; diff --git a/tools/ocaml/libs/xenstoredglue/doma=
in_getinfo_plugin_v1/Makefile b/tools/ocaml/libs/xenstoredglue/domain_getin=
fo_plugin_v1/Makefile<br>&gt; &gt; new file mode 100644<br>&gt; &gt; index =
0000000000..9c40026cab<br>&gt; &gt; --- /dev/null<br>&gt; &gt; +++ b/tools/=
ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/Makefile<br>&gt; &gt; @@ =
-0,0 +1,38 @@<br>&gt; &gt; +OCAML_TOPLEVEL=3D$(CURDIR)/../../..<br>&gt; &gt=
; +XEN_ROOT=3D$(OCAML_TOPLEVEL)/../..<br>&gt; &gt; +include $(OCAML_TOPLEVE=
L)/common.make<br>&gt; &gt; +<br>&gt; &gt; +CFLAGS +=3D -I $(OCAML_TOPLEVEL=
)/libs -I $(OCAML_TOPLEVEL)/libs/xenstoredglue<br>&gt; &gt; +CFLAGS +=3D $(=
CFLAGS_libxenctrl) $(CFLAGS_xeninclude) $(APPEND_CFLAGS)<br>&gt; &gt; +OCAM=
LOPTFLAGS +=3D -opaque<br>&gt; &gt; +OCAMLINCLUDE +=3D -I ./ -I ../<br>&gt;=
<br>&gt; I think we only need &quot;-I ../&quot; here. =C2=A0xen-caml-compa=
t.h is the only local<br>&gt; header used.<br><div><br></div><div>With only=
 &quot;-I ../&quot;, the build fails:</div><div>```</div><div>ocamlopt -g -=
ccopt &quot; =C2=A0 &quot; -dtypes -I ../ -w F -warn-error F -opaque -share=
d -linkall -o domain_getinfo_v1.cmxs =C2=A0domain_getinfo_v1.cmxa<br>/usr/b=
in/ld: cannot find -ldomain_getinfo_v1_stubs: No such file or directory</di=
v><div>collect2: error: ld returned 1 exit status</div><div>```</div><div><=
br></div><div>Thank you very much for the rest, I will submit a new version=
 of the patch series shortly.<br></div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 6, 2024 at 2:38=E2=80=AF=
PM Andrew Cooper &lt;<a href=3D"mailto:andrew.cooper3@citrix.com">andrew.co=
oper3@citrix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">On 03/09/2024 12:44 pm, Andrii Sultanov wrote:<br>
&gt; This plugin intends to hide the unstable Xenctrl interface under a<br>
&gt; stable one. In case of the change in the interface, a V2 of this plugi=
n<br>
&gt; would need to be produced, but V1 with the old interface would<br>
&gt; need to be kept (with potential change in the implementation) in the<b=
r>
&gt; meantime.<br>
&gt;<br>
&gt; To reduce the need for such changes in the future, this plugin only<br=
>
&gt; provides the absolute minimum functionality that Oxenstored uses - onl=
y<br>
&gt; three fields of the domaininfo struct are used and presented here.<br>
&gt;<br>
&gt; Oxenstored currently uses the single-domain domain_getinfo function,<b=
r>
&gt; whereas Cxenstored uses the more-efficient domain_getinfolist. Both of=
<br>
&gt; these are provided in the plugin to allow a transition from one to the=
<br>
&gt; other without modifying the interface in the future. Both return<br>
&gt; identical structures and rely on the same fields in xenctrl, thus if o=
ne<br>
&gt; of them breaks, both will break, and a new version of the interface wo=
uld<br>
&gt; need to be issued.<br>
&gt;<br>
&gt; Signed-off-by: Andrii Sultanov &lt;<a href=3D"mailto:andrii.sultanov@c=
loud.com" target=3D"_blank">andrii.sultanov@cloud.com</a>&gt;<br>
&gt; ---<br>
<br>
Normally you should put a short set of notes here (under --- in the<br>
commit message) about what has changed from the prior version you posted.<b=
r>
<br>
&gt;=C2=A0 tools/ocaml/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 tools/ocaml/libs/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 tools/ocaml/libs/xenstoredglue/META.in=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A04 +<br>
&gt;=C2=A0 tools/ocaml/libs/xenstoredglue/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 46 +++++<br>
&gt;=C2=A0 .../domain_getinfo_plugin_v1/META.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A05 +<br>
&gt;=C2=A0 .../domain_getinfo_plugin_v1/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 38 ++++<br>
&gt;=C2=A0 .../domain_getinfo_stubs_v1.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 172 ++++++++++++++++++<br>
&gt;=C2=A0 .../<a href=3D"http://domain_getinfo_v1.ml" rel=3D"noreferrer" t=
arget=3D"_blank">domain_getinfo_v1.ml</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 36 ++++<br>
&gt;=C2=A0 .../domain_getinfo_v1.mli=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A00<br>
&gt;=C2=A0 .../libs/xenstoredglue/<a href=3D"http://plugin_interface_v1.ml"=
 rel=3D"noreferrer" target=3D"_blank">plugin_interface_v1.ml</a> |=C2=A0 28=
 +++<br>
&gt;=C2=A0 .../xenstoredglue/plugin_interface_v1.mli=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 36 ++++<br>
&gt;=C2=A0 11 files changed, 367 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 create mode 100644 tools/ocaml/libs/xenstoredglue/META.in<br>
&gt;=C2=A0 create mode 100644 tools/ocaml/libs/xenstoredglue/Makefile<br>
&gt;=C2=A0 create mode 100644 tools/ocaml/libs/xenstoredglue/domain_getinfo=
_plugin_v1/META.in<br>
&gt;=C2=A0 create mode 100644 tools/ocaml/libs/xenstoredglue/domain_getinfo=
_plugin_v1/Makefile<br>
&gt;=C2=A0 create mode 100644 tools/ocaml/libs/xenstoredglue/domain_getinfo=
_plugin_v1/domain_getinfo_stubs_v1.c<br>
&gt;=C2=A0 create mode 100644 tools/ocaml/libs/xenstoredglue/domain_getinfo=
_plugin_v1/<a href=3D"http://domain_getinfo_v1.ml" rel=3D"noreferrer" targe=
t=3D"_blank">domain_getinfo_v1.ml</a><br>
&gt;=C2=A0 create mode 100644 tools/ocaml/libs/xenstoredglue/domain_getinfo=
_plugin_v1/domain_getinfo_v1.mli<br>
&gt;=C2=A0 create mode 100644 tools/ocaml/libs/xenstoredglue/<a href=3D"htt=
p://plugin_interface_v1.ml" rel=3D"noreferrer" target=3D"_blank">plugin_int=
erface_v1.ml</a><br>
&gt;=C2=A0 create mode 100644 tools/ocaml/libs/xenstoredglue/plugin_interfa=
ce_v1.mli<br>
<br>
We still have a mix of names even within this patch.=C2=A0 xenstoredglue,<b=
r>
xenstored_glue, xsglue<br>
<br>
Could we see about using xsd_glue as the top level name here, to get it<br>
a bit shorter and easier to read?<br>
<br>
&gt; diff --git a/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/M=
akefile b/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/Makefile<=
br>
&gt; new file mode 100644<br>
&gt; index 0000000000..9c40026cab<br>
&gt; --- /dev/null<br>
&gt; +++ b/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/Makefile=
<br>
&gt; @@ -0,0 +1,38 @@<br>
&gt; +OCAML_TOPLEVEL=3D$(CURDIR)/../../..<br>
&gt; +XEN_ROOT=3D$(OCAML_TOPLEVEL)/../..<br>
&gt; +include $(OCAML_TOPLEVEL)/common.make<br>
&gt; +<br>
&gt; +CFLAGS +=3D -I $(OCAML_TOPLEVEL)/libs -I $(OCAML_TOPLEVEL)/libs/xenst=
oredglue<br>
&gt; +CFLAGS +=3D $(CFLAGS_libxenctrl) $(CFLAGS_xeninclude) $(APPEND_CFLAGS=
)<br>
&gt; +OCAMLOPTFLAGS +=3D -opaque<br>
&gt; +OCAMLINCLUDE +=3D -I ./ -I ../<br>
<br>
I think we only need &quot;-I ../&quot; here.=C2=A0 xen-caml-compat.h is th=
e only local<br>
header used.<br>
<br>
&gt; diff --git a/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/d=
omain_getinfo_stubs_v1.c b/tools/ocaml/libs/xenstoredglue/domain_getinfo_pl=
ugin_v1/domain_getinfo_stubs_v1.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..69eddd6412<br>
&gt; --- /dev/null<br>
&gt; +++ b/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_g=
etinfo_stubs_v1.c<br>
&gt; @@ -0,0 +1,172 @@<br>
<br>
Sorry for missing this before, but new files want to contain SDPX<br>
headers.=C2=A0 For this,<br>
<br>
/* SPDX-License-Identifier: LGPL-2.1-only WITH<br>
OCaml-LGPL-linking-exception */<br>
<br>
which I had to go and research when sorting out xen-caml-compat.h<br>
<br>
<br>
For Ocaml files, suppose we want.<br>
<br>
(* SPDX-License-Identifier: LGPL-2.1-only WITH<br>
OCaml-LGPL-linking-exception *)<br>
<br>
<br>
The SPDX header should always be the first line of the file.<br>
<br>
&gt; +#define _GNU_SOURCE<br>
&gt; +<br>
&gt; +#include &lt;stdlib.h&gt;<br>
&gt; +#include &lt;string.h&gt;<br>
&gt; +#include &lt;errno.h&gt;<br>
&gt; +<br>
&gt; +#define CAML_NAME_SPACE<br>
&gt; +#include &lt;caml/alloc.h&gt;<br>
&gt; +#include &lt;caml/memory.h&gt;<br>
&gt; +#include &lt;caml/signals.h&gt;<br>
&gt; +#include &lt;caml/fail.h&gt;<br>
&gt; +#include &lt;caml/callback.h&gt;<br>
&gt; +#include &lt;caml/custom.h&gt;<br>
&gt; +<br>
&gt; +#include &lt;xen-tools/common-macros.h&gt;<br>
&gt; +#include &lt;xenctrl.h&gt;<br>
&gt; +<br>
&gt; +#include &quot;xen-caml-compat.h&quot;<br>
&gt; +<br>
&gt; +#define ERR_MSG_LEN (XC_MAX_ERROR_MSG_LEN + 6)<br>
&gt; +#define MAX_FUNC_LINE_LEN 64<br>
<br>
These two are obsolete given the rework of xsglue_failwith_xc()<br>
<br>
&gt; +#define failwith_xc_v1(xch) xsglue_failwith_xc(xch, __FUNCTION__, __L=
INE__)<br>
<br>
This should be moved lower and adjusted.=C2=A0 See later.<br>
<br>
&gt; +<br>
&gt; +/* This is a minimal stub to xenctrl for oxenstored&#39;s purposes<br=
>
&gt; +=C2=A0 =C2=A0For the full xenctrl stubs, see tools/ocaml/libs/xc/xenc=
trl_stubs.c */<br>
<br>
These comments aren&#39;t helpful IMO.=C2=A0 It&#39;s said many times elsew=
here.<br>
<br>
&gt; +<br>
&gt; +static inline xc_interface *xsglue_xch_of_val_v1(value v)<br>
<br>
static functions don&#39;t a _v1 suffix, seeing as they&#39;re local to a f=
ile<br>
with a _v1 in it&#39;s name.<br>
<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0xc_interface *xch =3D *(xc_interface **)Data_cust=
om_val(v);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return xch;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void xsglue_xenctrl_finalize(value v)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0xc_interface *xch =3D xsglue_xch_of_val_v1(v);<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0xc_interface_close(xch);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static struct custom_operations xsglue_xenctrl_ops =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.identifier=C2=A0 =3D &quot;xenctrl&quot;,<br>
<br>
I presume this identifier gets elsewhere?=C2=A0 Perhaps<br>
&quot;xsd_glue.domain_getinfo_v1.xenctrl&quot; or so?<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.finalize=C2=A0 =C2=A0 =3D xsglue_xenctrl_finaliz=
e,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.compare=C2=A0 =C2=A0 =C2=A0=3D custom_compare_de=
fault,=C2=A0 =C2=A0 =C2=A0/* Can&#39;t compare=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D custom_hash_=
default,=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Can&#39;t hash=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.serialize=C2=A0 =C2=A0=3D custom_serialize_defau=
lt,=C2=A0 =C2=A0/* Can&#39;t serialize=C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.deserialize =3D custom_deserialize_default, /* C=
an&#39;t deserialize */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.compare_ext =3D custom_compare_ext_default, /* C=
an&#39;t compare=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +};<br>
&gt; +<br>
<br>
There&#39;s a trick with the C preprocessor where you can<br>
<br>
#define xsglue_failwith(xch) xsglue_failwith(xch, __func__, __LINE__)<br>
<br>
to add extra arguments to callsites.=C2=A0 The only requirement is that it<=
br>
either needs to be after the function of the same name, or that you<br>
define the function using:<br>
<br>
static void Noreturn (xsglue_failwith)(xc_interface *xch ...)<br>
<br>
<br>
I&#39;d put the macro and the declaration together here.=C2=A0 Also, use __=
func__<br>
rather than __FUNCTION__.<br>
<br>
&gt; +static void Noreturn xsglue_failwith_xc(xc_interface *xch,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char* func,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int line)<br=
>
<br>
The _xc() suffix isn&#39;t very helpful when there&#39;s also an xsglue_ pr=
efix.<br>
<br>
I&#39;d simply name this xsglue_failwith(...) which is clear enough when us=
ed.<br>
<br>
Also, &#39;const char *fun&#39; with the * to the right of the space.<br>
<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const xc_error *error =3D xch ? xc_get_last_error=
(xch) : NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *str =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0CAMLparam0();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 CAMLlocal1(msg);<br>
<br>
Mixing tabs and spaces.<br>
<br>
&gt; &lt;snip&gt;<br>
&gt;<br>
&gt; +static value xsglue_alloc_domaininfo_v1(const xc_domaininfo_t *info)<=
br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0CAMLparam0();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0CAMLlocal1(result);<br>
<br>
We try to split declarations from regular logic, so a blank line here<br>
please.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0result =3D caml_alloc_tuple(4);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0Store_field(result,=C2=A0 0, Val_int(info-&gt;dom=
ain));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0Store_field(result,=C2=A0 1, Val_bool(info-&gt;fl=
ags &amp; XEN_DOMINF_dying));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0Store_field(result,=C2=A0 2, Val_bool(info-&gt;fl=
ags &amp; XEN_DOMINF_shutdown));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0Store_field(result,=C2=A0 3, Val_int(MASK_EXTR(in=
fo-&gt;flags, XEN_DOMINF_shutdownmask)));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0CAMLreturn(result);<br>
&gt; +}<br>
&gt; +<br>
&gt; +CAMLprim value stub_xsglue_xc_domain_getinfo(value xch_val, value dom=
id)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0CAMLparam2(xch_val, domid);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0CAMLlocal1(result);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0xc_interface *xch =3D xsglue_xch_of_val_v1(xch_va=
l);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0xc_domaininfo_t info;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret, domid_c;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0domid_c =3D Int_val(domid);<br>
<br>
I&#39;d suggests a blank line here, or to initialise domid_c at declaration=
.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0caml_enter_blocking_section();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D xc_domain_getinfo_single(xch, domid_c, &a=
mp;info);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0caml_leave_blocking_section();<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0failwith_xc_v1(xch);<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0result =3D xsglue_alloc_domaininfo_v1(&amp;info);=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0CAMLreturn(result);<br>
&gt; +}<br>
&gt; +<br>
&gt; +CAMLprim value stub_xsglue_xc_domain_getinfolist(value xch_val, value=
 first_domain)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0CAMLparam2(xch_val, first_domain);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0CAMLlocal1(result);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0xc_interface *xch =3D xsglue_xch_of_val_v1(xch_va=
l);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0xc_domaininfo_t *info;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int i, ret, toalloc, retval;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0uint32_t num_domains;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0uint32_t c_first_domain;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* get the minimum number of allocate byte we nee=
d and bump it up to page boundary */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0c_first_domain =3D Int_val(first_domain);<br>
<br>
Passing a first_domain of anything other than 0 breaks the atomicity<br>
that we&#39;re trying to create by asking for all domains together.<br>
<br>
It wants dropping from here, and the plugin interface.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0num_domains =3D DOMID_FIRST_RESERVED - c_first_do=
main;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0toalloc =3D (sizeof(xc_domaininfo_t) * num_domain=
s) | 0xfff;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D posix_memalign((void **) ((void *) &amp;i=
nfo), 4096, toalloc);<br>
<br>
This is nonsense, and appears to have been so for ages in the Xenctrl stubs=
.<br>
<br>
xc_domain_getinfolist() bounce-buffers the array anyway (to get<br>
hypercall-safe buffers from the kernel), so there&#39;s no point doing any<=
br>
local trickery.=C2=A0 Simply:<br>
<br>
=C2=A0=C2=A0=C2=A0 info =3D malloc(sizeof(xc_domaininfo_t) * DOMID_FIRST_RE=
SERVED);<br>
=C2=A0=C2=A0=C2=A0 if ( !info )<br>
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 caml_raise_out_of_memory();<br>
<br>
will be fine.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0caml_raise_out_of_mem=
ory();<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0caml_enter_blocking_section();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0retval =3D xc_domain_getinfolist(xch, c_first_dom=
ain, num_domains, info);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0caml_leave_blocking_section();<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (retval &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(info);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0failwith_xc_v1(xch);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else if (retval &gt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D caml_alloc=
(retval, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; =
retval; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0caml_modify(&amp;Field(result, i), xsglue_alloc_domaininfo_v1(info +=
 i));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D Atom(0);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
<br>
While this works, there are better ways of writing the logic.=C2=A0<br>
failwith() is Noreturn, so it&#39;s easier to follow as:<br>
<br>
=C2=A0=C2=A0=C2=A0 if (retval &lt; 0) {<br>
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 ...<br>
=C2=A0=C2=A0=C2=A0 }<br>
<br>
=C2=A0=C2=A0=C2=A0 if (retval &gt; 0) {<br>
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 ...<br>
<br>
but...=C2=A0 You&#39;re dom0, asking for all domains.=C2=A0 Getting a retva=
l of 0 is<br>
also some kind of error, so I&#39;d suggest:<br>
<br>
=C2=A0=C2=A0=C2=A0 if (retval &lt;=3D 0) {<br>
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 free(info);<br>
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 xsglue_failwith(xch);<br>
=C2=A0=C2=A0=C2=A0 }<br>
<br>
=C2=A0=C2=A0=C2=A0 result =3D caml_alloc(retval, 0);<br>
=C2=A0=C2=A0=C2=A0 for (i =3D 0; i &lt; retval; i++) {<br>
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 caml_modify(&amp;Field(result, i), xs=
glue_alloc_domaininfo_v1(info +<br>
i));<br>
=C2=A0=C2=A0=C2=A0 }<br>
<br>
=C2=A0=C2=A0=C2=A0 free(info);<br>
=C2=A0=C2=A0=C2=A0 Camlreturn(result);<br>
<br>
which is simpler still.<br>
<br>
<br>
&gt; diff --git a/tools/ocaml/libs/xenstoredglue/plugin_interface_v1.mli b/=
tools/ocaml/libs/xenstoredglue/plugin_interface_v1.mli<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..d073a44d0f<br>
&gt; --- /dev/null<br>
&gt; +++ b/tools/ocaml/libs/xenstoredglue/plugin_interface_v1.mli<br>
&gt; @@ -0,0 +1,36 @@<br>
&gt; +(** To avoid breaking the plugin interface, this module needs to be<b=
r>
&gt; +=C2=A0 =C2=A0 standalone and can&#39;t rely on any other Xen library.=
 Even unrelated<br>
&gt; +=C2=A0 =C2=A0 changes in the interfaces of those modules would change=
 the hash<br>
&gt; +=C2=A0 =C2=A0 of this interface and break the plugin system.<br>
&gt; +=C2=A0 =C2=A0 It can only depend on Stdlib, therefore all of the type=
s (domid,<br>
&gt; +=C2=A0 =C2=A0 domaininfo etc.) are redefined here instead of using al=
ternatives<br>
&gt; +=C2=A0 =C2=A0 defined elsewhere.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 NOTE: The signature of this interface should not be cha=
nged (no<br>
&gt; +=C2=A0 =C2=A0 functions or types can be added, modified, or removed).=
 If<br>
&gt; +=C2=A0 =C2=A0 underlying Xenctrl changes require a new interface, a V=
2 with a<br>
&gt; +=C2=A0 =C2=A0 corresponding plugin should be created.<br>
&gt; + *)<br>
<br>
There&#39;s a rune to run ocp-indent in the Xen tree, in lieu of the full<b=
r>
Ocaml dev stack.<br>
<br>
make -C tools/ocaml format<br>
<br>
and the delta for this patch is just:<br>
<br>
--- a/tools/ocaml/libs/xenstoredglue/plugin_interface_v1.mli<br>
+++ b/tools/ocaml/libs/xenstoredglue/plugin_interface_v1.mli<br>
@@ -10,7 +10,7 @@<br>
=C2=A0=C2=A0=C2=A0=C2=A0 functions or types can be added, modified, or remo=
ved). If<br>
=C2=A0=C2=A0=C2=A0=C2=A0 underlying Xenctrl changes require a new interface=
, a V2 with a<br>
=C2=A0=C2=A0=C2=A0=C2=A0 corresponding plugin should be created.<br>
- *)<br>
+*)<br>
=C2=A0<br>
=C2=A0module type Domain_getinfo_V1 =3D sig<br>
=C2=A0=C2=A0 exception Error of string<br>
<br>
~Andrew<br>
</blockquote></div>

--000000000000d51d2d0621741c3f--

