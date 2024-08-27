Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4AA960523
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 11:09:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783706.1192968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sisBp-0005rI-Vy; Tue, 27 Aug 2024 09:08:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783706.1192968; Tue, 27 Aug 2024 09:08:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sisBp-0005pf-TI; Tue, 27 Aug 2024 09:08:37 +0000
Received: by outflank-mailman (input) for mailman id 783706;
 Tue, 27 Aug 2024 09:08:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PF0L=P2=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1sisBo-0005pZ-SB
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 09:08:36 +0000
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [2001:4860:4864:20::34])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef3ce3df-6453-11ef-99a0-01e77a169b0f;
 Tue, 27 Aug 2024 11:08:33 +0200 (CEST)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-27020fca39aso4517398fac.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 02:08:33 -0700 (PDT)
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
X-Inumbo-ID: ef3ce3df-6453-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724749712; x=1725354512; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c5anN8pL18L8tSoQYTb+4CpfoLT4xYPOaqVzwD+GN78=;
        b=FREMffk/8fFv+wnWsT8/oW+wfM82qHMxdZe5gy/yqfYIN8uYx/9TFuDLKn72P0vwMM
         XZbjeto7m/FCSlLys3iGk9mQANTakzZVz+AfXrUKXT1ezgNop0pFysVQ0/IIjn/vXh5I
         6LRPqOB7NURhasKB0+GFRF4s0wMGEq3FgFUbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724749712; x=1725354512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c5anN8pL18L8tSoQYTb+4CpfoLT4xYPOaqVzwD+GN78=;
        b=PF262gCCGE/kNPklvLddxvRX4aKKjl9pxLtMZmULJzW3j6UtoOWkFrKCqNDQxOxpXT
         99L1cGV/OVLCbO8hI/vpT+oSajhsre02ZQck/yYk7q2uVeoPmoBJlR63X8MbPi5+jSir
         ve8tACmi3FwcQlzwgoWKP44dKkqUUhNOCspFC8UnNv6l0PRsGbN94JEZzDFhmoHcKC86
         hHXN751k11+wfxpimNuTX0TS9WsKeSFkQFN2/D2ImDg5MwuhxQGHaUgIe6z2VSmT2mbz
         l7RoQwoO53H7OWygu/TAWfpC7TZLAtfVczU61wmRJl+X0kz0b5tW9asxuL65urVhkS55
         cnSA==
X-Forwarded-Encrypted: i=1; AJvYcCVbgRBZWXvLuB4Blud2Yx1621sNez7yNxHtXLnhes2iOXO/xTa1lA//HGkSy4XLweHXGJ5b3TqzUrw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwntbC5rG8nPyVGcZ1QGSRmVLRowtIt44UcpXeXh88DATjdg0sn
	G2ViDEThivdH0p4ptrMm+qZZW784ka4chg7P/FkliBN5T1QTz/qTxO4dsM45Iy/D9F9yQBvBhjQ
	HAJ8OO/0iT1yMIbvjEtxTsC/pvOsCmhslZnMLgw==
X-Google-Smtp-Source: AGHT+IEHZNfJt6Ace4k1KuancEQx2ptrvKEPk80LcCQ5GCy05V4+Zc95u6Ory6ZNki6f5LBtlHSR0CZfJjmM/mf4Sas=
X-Received: by 2002:a05:6870:d14f:b0:254:b337:eebc with SMTP id
 586e51a60fabf-273e6686dfamr14142353fac.35.1724749712267; Tue, 27 Aug 2024
 02:08:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1724314239.git.andrii.sultanov@cloud.com>
 <6d4b94939c8910ffd7d70301b1d26c828f72ad86.1724314239.git.andrii.sultanov@cloud.com>
 <da0e9836-33f3-42c3-bda7-53d868a99ae1@citrix.com>
In-Reply-To: <da0e9836-33f3-42c3-bda7-53d868a99ae1@citrix.com>
From: Edwin Torok <edwin.torok@cloud.com>
Date: Tue, 27 Aug 2024 10:08:21 +0100
Message-ID: <CAEfZLvkL0Rcs=Tk_VxTxKwSj8wQben+jJ8Uay5iexBNNXYfwFQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] ocaml/libs: Implement a dynamically-loaded plugin
 for Xenctrl.domain_getinfo
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Andrii Sultanov <andrii.sultanov@cloud.com>, xen-devel@lists.xenproject.org, 
	Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, 
	Anthony PERARD <anthony.perard@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 6:19=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> On 22/08/2024 10:06 am, Andrii Sultanov wrote:
> > This plugin intends to hide the unstable Xenctrl interface under a
> > stable one. In case of the change in the interface, a V2 of this plugin
> > would need to be produced, but V1 with the old interface would
> > need to be kept (with potential change in the implementation) in the
> > meantime.
> >
> > To reduce the need for such changes in the future, this plugin only
> > provides the absolute minimum functionality that Oxenstored uses - only
> > four fields of the domaininfo struct are used and presented here.
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
> >  tools/ocaml/Makefile                          |   1 +
> >  tools/ocaml/Makefile.rules                    |  17 +-
>
> This patch is already very big.  One minor way to help would be to split
> out the changes to Makefile.rules as a separate "build infrastructure
> for Ocaml dynamic libraries".
>
> >  tools/ocaml/libs/Makefile                     |   2 +-
> >  tools/ocaml/libs/xenstoredglue/META.in        |   4 +
> >  tools/ocaml/libs/xenstoredglue/Makefile       |  39 ++++
> >  .../domain_getinfo_plugin_v1/META.in          |   5 +
> >  .../domain_getinfo_plugin_v1/Makefile         |  38 ++++
> >  .../domain_getinfo_stubs_v1.c                 | 169 ++++++++++++++++++
> >  .../domain_getinfo_v1.ml                      |  51 ++++++
> >  .../domain_getinfo_v1.mli                     |   0
> >  .../libs/xenstoredglue/plugin_interface_v1.ml |  25 +++
> >  .../xenstoredglue/plugin_interface_v1.mli     |  34 ++++
> >  12 files changed, 383 insertions(+), 2 deletions(-)
> >  create mode 100644 tools/ocaml/libs/xenstoredglue/META.in
> >  create mode 100644 tools/ocaml/libs/xenstoredglue/Makefile
> >  create mode 100644 tools/ocaml/libs/xenstoredglue/domain_getinfo_plugi=
n_v1/META.in
> >  create mode 100644 tools/ocaml/libs/xenstoredglue/domain_getinfo_plugi=
n_v1/Makefile
> >  create mode 100644 tools/ocaml/libs/xenstoredglue/domain_getinfo_plugi=
n_v1/domain_getinfo_stubs_v1.c
> >  create mode 100644 tools/ocaml/libs/xenstoredglue/domain_getinfo_plugi=
n_v1/domain_getinfo_v1.ml
> >  create mode 100644 tools/ocaml/libs/xenstoredglue/domain_getinfo_plugi=
n_v1/domain_getinfo_v1.mli
> >  create mode 100644 tools/ocaml/libs/xenstoredglue/plugin_interface_v1.=
ml
> >  create mode 100644 tools/ocaml/libs/xenstoredglue/plugin_interface_v1.=
mli
>
> Peeking at your specfile change for XenServer too, I see that the only
> new file packaged is:
>
> %{_libexecdir}/%{name}/bin/xenctrl_plugin/domain_getinfo_v1.cmxs
>
> So does this mean that the rest of xenstoredglue is just a build-time
> requirement for oxenstored?

The .mli file needs to be packaged too, it is oxenstored that
"exposes" the interface and the plugin that uses it to register
themselves.

For simplicity we can package the whole plugin_interface_v1* library
(technically the plugin_interface_v1.ml could live in oxenstored, but
it'd be more difficult to update that way).
domain_get_info_plugin_v1 doesn't need to be otherwise packaged,
except the plugin (so .cma and .cmxs, although we only support native
builds, not bytecode builds, so .cmxs suffices for most purposes).

The domain_get_info_plugin_v1 will link against the plugin_interface_v1.mli=
.

>
> If so, then surely we'll still need to package it in
> xen-ocaml-{libs,devel}, so an out-of-tree oxenstored can build?
>
>
> Who should own plugin ABIs?  Logically it ought to oxenstored, but the
> way this is structured, it's looks like its Xen which would end up
> owning it.

The OCaml plugin ABI is owned by the executable that loads the plugin.
The plugin then registers itself as an implementation for an interface
exposed by the hosting application.
Due to how static linking works the ABI will be owned by this glue
library, which will be part of Xen (and its interface cannot be
changed once released, any changes require a v2 of the interface),
then oxenstored gets linked with a particular version of the glue
library at build time, and it'll be compatible with those plugin
versions at runtime.

>
>
> Are we expecting to get one cmxs per $THING-$VERSION?

Yes

> xenctrl_plugin is
> a bit generic, and it probably ought to have xenstoredglue somewhere in
> the path.
>
> Talking of, can we call it xenstored-glue or perhaps just xsd-glue?  Or
> will Ocaml's sensitivity around names get in our way?

A '-' in the name is problematic, it can be part of an 'opam' package
name, but not an 'ocamlfind' package NAME.
There are libraries that have '-' in their name on opam, but they are
named with _ at build time, it gets confusing, best to avoid a '-' in
the name.
If you want it can be xenstored_glue.

>
> Are there any standards on Ocaml dynamic libraries, or are we playing in
> rare waters here?

Looking through Git the Dynlink module has existed since 1995.

The use of plugins is documented for Dune here
https://dune.readthedocs.io/en/stable/sites.html#plugins-and-dynamic-loadin=
g-of-packages

There are other packages that use plugins, for example:
* https://github.com/BinaryAnalysisPlatform/bap/blob/aa2165ef1fb8c458f7cad6=
050ba81aa38d2c9226/lib/bap_plugins/bap_plugins.ml#L89
and plugins here https://github.com/BinaryAnalysisPlatform/bap-plugins
* https://ocaml.org/p/satML-plugin/latest
* https://github.com/Frama-C/Frama-C-snapshot/blob/639a3647736bf8ac127d00eb=
e4c4c259f75f9b87/src/kernel_services/plugin_entry_points/dynamic.mli

(there are probably more, these are just what I could find with a quick sea=
rch)

>
>
> > diff --git a/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/do=
main_getinfo_stubs_v1.c b/tools/ocaml/libs/xenstoredglue/domain_getinfo_plu=
gin_v1/domain_getinfo_stubs_v1.c
> > new file mode 100644
> > index 0000000000..a29ac7c877
> > --- /dev/null
> > +++ b/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_ge=
tinfo_stubs_v1.c
> > @@ -0,0 +1,169 @@
> > +#define _XOPEN_SOURCE 600
>
> This is very unlikely to be relevant.  It probably wants dropping from
> elsewhere in Xen too.
>
> > +#include <stdlib.h>
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
> > +
> > +#include <string.h>
>
> Given the other sorting, this wants to be up by stdlib.
>
> > +#define XC_WANT_COMPAT_MAP_FOREIGN_API
>
> This is definitely not needed by this stub.
>
> > +#include <xenctrl.h>
> > +
> > +#define ERR_MSG_LEN (XC_MAX_ERROR_MSG_LEN + 6)
> > +#define MAX_FUNC_LINE_LEN 64
> > +#define failwith_xc_v1(xch) xsglue_failwith_xc(xch, __FUNCTION__, __LI=
NE__)
> > +
> > +// This is a minimal stub to xenctrl for oxenstored's purposes
> > +// For the full xenctrl stubs, see tools/ocaml/libs/xc/xenctrl_stubs.c
>
> Xen style is to use /* */ uniformly.  (Xen really does predate C++
> comments being commonly supported in C compilers.)
>
> > +
> > +static inline xc_interface *xsglue_xch_of_val_v1(value v)
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
> > +static void Noreturn xsglue_failwith_xc(xc_interface *xch,
> > +             char const* func,
> > +             int line)
>
> const char *func, unsigned int line)
>
> Unless you think there's a likelyhood that we'll get errors from a
> negative line number.

I think this function got copied from the one in xenctrl.

>
> > +{
> > +     char error_str[ERR_MSG_LEN + MAX_FUNC_LINE_LEN];
> > +     size_t str_len =3D 0;
> > +     if (xch) {
> > +             const xc_error *error =3D xc_get_last_error(xch);
> > +             if (error->code =3D=3D XC_ERROR_NONE)
> > +                     str_len =3D snprintf(error_str, ERR_MSG_LEN,
> > +                                        "%d: %s", errno, strerror(errn=
o));
> > +             else
> > +                     str_len =3D snprintf(error_str, ERR_MSG_LEN,
> > +                                        "%d: %s: %s", error->code,
> > +                                        xc_error_code_to_desc(error->c=
ode),
> > +                                        error->message);
> > +     } else {
> > +             str_len =3D snprintf(error_str, ERR_MSG_LEN,
> > +                                "Unable to open XC interface");
> > +     }
> > +     str_len =3D str_len < ERR_MSG_LEN ? str_len : ERR_MSG_LEN;
> > +     // Log caller's source code function and line
> > +     snprintf(error_str+str_len, MAX_FUNC_LINE_LEN,
> > +                 " - called from %s:%d", func, line);
> > +     caml_raise_with_string(*caml_named_value("xsg.error"), error_str)=
;
>
> There's a lot of complexity here, not least because of trying to handle
> the !xch special case.
>
> But, to begin with, what is xsg.error?  I see there's a registration of
> something by that name.  Is the Error referenced there the `exception
> Error of string` from the module?
>
> If so, what happens if we get a v2 module?  Won't we get a clash on the
> name of this exception?

The V2 module will have to declare a v2 of the exception.

>
>
> For the string handling, life is too short for fixed bounds like this.
> I'd recommend something more of the form:
>
> ...
>         const xc_error *error =3D xch ? xc_get_last_error(xch) : NULL;
>         char *str =3D NULL;
>         CAMLlocal1(msg);
>
> #define ERR (error && error->code !=3D XC_ERROR_NONE)
>
>         asprintf(&str,
>                  "%d: %s%s%s - called from %s:%u"
>                  ERR ? error->code : errno,
>                  ERR ? xc_error_code_to_desc(error->code) : strerror(errn=
o),
>                  ERR ? ": " : "",
>                  ERR ? error->message : "",
>                  func, line);
>
> #endif
>
>         if (!*str)
>                 caml_raise_out_of_memory();
>
>         msg =3D caml_copy_string(str);
>         free(str);
>
>         caml_raise_with_arg(*caml_named_value("xsg.error"), msg);
> }
>
> This has the property that even in the !xsh special case, it still
> renders errno which might be helpful when debugging.
>
> > +}
> > +
> > +CAMLprim value stub_xsglue_xc_interface_open(value unit)
> > +{
> > +     CAMLparam1(unit);
> > +     CAMLlocal1(result);
> > +     xc_interface *xch;
> > +
> > +     result =3D caml_alloc_custom(&xsglue_xenctrl_ops, sizeof(xch), 0,=
 1);
> > +
> > +     caml_enter_blocking_section();
> > +     xch =3D xc_interface_open(NULL, NULL, 0);
> > +     caml_leave_blocking_section();
> > +
> > +     if ( !xch )
>
> This wants to be `if (!xch)` to match the rest of the file style.
>
> > +             failwith_xc_v1(xch);
> > +
> > +     *(xc_interface **)Data_custom_val(result) =3D xch;
> > +
> > +     CAMLreturn(result);
> > +}
> > +
> > +static value xsglue_alloc_domaininfo_v1(xc_domaininfo_t * info)
>
> xc_domaininfo_t *info
>
> And probably a const for good measure.
>
> > +{
> > +     CAMLparam0();
> > +     CAMLlocal1(result);
> > +     result =3D caml_alloc_tuple(4);
> > +
> > +     Store_field(result,  0, Val_int(info->domain));
> > +     Store_field(result,  1, Val_bool(info->flags & XEN_DOMINF_dying))=
;
> > +     Store_field(result,  2, Val_bool(info->flags & XEN_DOMINF_shutdow=
n));
> > +     Store_field(result,  3, Val_int(MASK_EXTR(info->flags, XEN_DOMINF=
_shutdownmask)));
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
> > +     int ret;
> > +
> > +     ret =3D xc_domain_getinfo_single(xch, Int_val(domid), &info);
> > +     if (ret < 0)
> > +             failwith_xc_v1(xch);
> > +
> > +     result =3D xsglue_alloc_domaininfo_v1(&info);
> > +
> > +     CAMLreturn(result);
> > +}
> > +
> > +CAMLprim value stub_xsglue_xc_domain_getinfolist(value xch_val, value =
first_domain, value nb)
> > +{
> > +     CAMLparam3(xch_val, first_domain, nb);
> > +     CAMLlocal2(result, temp);
> > +     xc_interface *xch =3D xsglue_xch_of_val_v1(xch_val);
> > +     xc_domaininfo_t * info;
> > +     int i, ret, toalloc, retval;
> > +     unsigned int c_max_domains;
> > +     uint32_t c_first_domain;
> > +
> > +     /* get the minimum number of allocate byte we need and bump it up=
 to page boundary */
> > +     toalloc =3D (sizeof(xc_domaininfo_t) * Int_val(nb)) | 0xfff;
> > +     ret =3D posix_memalign((void **) ((void *) &info), 4096, toalloc)=
;
> > +     if (ret)
> > +             caml_raise_out_of_memory();
> > +
> > +     result =3D temp =3D Val_emptylist;
> > +
> > +     c_first_domain =3D Int_val(first_domain);
> > +     c_max_domains =3D Int_val(nb);
> > +     caml_enter_blocking_section();
> > +     retval =3D xc_domain_getinfolist(xch, c_first_domain,
> > +                                    c_max_domains, info);
> > +     caml_leave_blocking_section();
> > +
> > +     if (retval < 0) {
> > +             free(info);
> > +             failwith_xc_v1(xch);
> > +     }
> > +     for (i =3D 0; i < retval; i++) {
> > +             result =3D caml_alloc_small(2, Tag_cons);
> > +             Field(result, 0) =3D Val_int(0);
>
> The is Val_none, isn't it?

It is a temporary value that will be overwritten later (to stop the GC
from crashing should it run inbetween and see a dangling pointer).
It needs to be an integer, not a pointer so the GC doesn't go on
chasing something else. 'Val_int' retains that intention more clearly,
although Val_none is equivalent (but is not used with that meaning
here, because the first element is NOT the list element,
and it'd be confusing if it was, it is the actual record, we just
temporarily store the wrong type there, but a valid OCaml value).

>
> I've got a patch I should dust off to provide some C stub compatibility
> for Ocaml < 4.12, which at least introduces some of the more common namin=
g.
>
> > +             Field(result, 1) =3D temp;
> > +             temp =3D result;
> > +
> > +             Store_field(result, 0, xsglue_alloc_domaininfo_v1(info + =
i));
> > +     }
> > +
> > +     free(info);
> > +     CAMLreturn(result);
> > +}
> > diff --git a/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/do=
main_getinfo_v1.ml b/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v=
1/domain_getinfo_v1.ml
> > new file mode 100644
> > index 0000000000..d8947b618f
> > --- /dev/null
> > +++ b/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_ge=
tinfo_v1.ml
> > @@ -0,0 +1,51 @@
> > +(** Minimal interface on top of unstable Xenctrl for Oxenstored's usag=
e *)
> > +
> > +(** For the full Xenctrl interface, see: tools/ocaml/libs/xc/ *)
> > +
> > +module M : Plugin_interface_v1.Domain_getinfo_V1 =3D struct
> > +  exception Error of string
> > +
> > +  type domid =3D int
> > +  type handle
> > +
> > +  type domaininfo =3D {
> > +    domid : domid;
> > +    dying : bool;
> > +    shutdown : bool;
> > +    shutdown_code : int;
>
> I see Xenctrl uses this as an int too, but do we want to consider
>
> type shutdown_code =3D
>   | SHUTDOWN_poweroff
>   | SHUTDOWN_reboot
>   | SHUTDOWN_suspend
>   | SHUTDOWN_crash
>   | SHUTDOWN_watchdog
>   | SHUTDOWN_soft_reset
>
> One awkward thing is that the shutdown_code isn't valid unless the
> shutdown bool is true, but we could fix this by having:


>
> type domaininfo =3D {
>   domid : domind;
>   shutdown : Some shutdown_code;
> }
>
> One downside is that we'd have to bump the interface version when adding
> new constants, and we'd have to be very careful not to generate a bad
> SHUTDOWN_* constant as far as Ocaml is concerned.

To be compatible we'd also need a 'SHUTDOWN_unknown of int' at the end
to stop us from having to raise an exception.
This is how 'errno' is handled in Unix (it has a fairly large list of
errors, but of course a system could always define a new one, so it
has a fallback to 'unknown').
The application can then decide how it wants to handle the unknown, if
it wants to know more it can upgrade to a V2, if it doesn't care it
can stay on V1.

All that oxenstored does with the shutdown code is log it (so if we
add the enum we also need to add a way to stringify it), it doesn't
care about the actual value.
I'd keep it as an int for simplicity, we want to minimize dependencies
on ABIs, unless we actually want to use it.

>
> I'm on the fence, but it's something to consider before we set the ABI
> in stone.
>
> > +  }
> > +
> > +  external interface_open : unit -> handle =3D "stub_xsglue_xc_interfa=
ce_open"
> > +
> > +  external domain_getinfo : handle -> domid -> domaininfo
> > +    =3D "stub_xsglue_xc_domain_getinfo"
> > +
> > +  external __domain_getinfolist : handle -> domid -> int -> domaininfo=
 list
> > +    =3D "stub_xsglue_xc_domain_getinfolist"
> > +
> > +  let domain_getinfolist handle first_domain =3D
> > +    (* [rev_concat lst] is equivalent to [lst |> List.concat |> List.r=
ev]
> > +     * except it is tail recursive, whereas [List.concat] isn't.
> > +     * Example:
> > +     * rev_concat [[10;9;8];[7;6];[5]]] =3D [5; 6; 7; 8; 9; 10]
> > +     *)
> > +    let rev_append_fold acc e =3D List.rev_append e acc in
> > +    let rev_concat lst =3D List.fold_left rev_append_fold [] lst in
> > +
> > +    let nb =3D 1024 in
> > +    let rec __getlist lst from =3D
> > +      (* _domain_getinfolist returns domains in reverse order, largest=
 first *)
> > +      match __domain_getinfolist handle from nb with
> > +      | [] -> rev_concat lst
> > +      | hd :: _ as l -> __getlist (l :: lst) (hd.domid + 1)
> > +    in
> > +    __getlist [] first_domain
>
> This (and the C) was a hack to avoid being too invasive at the time
> (iirc, it was a Xenctrl interface used by Xenopsd and we didn't want to
> change the API), but it's racy when there are more than @nb domains runni=
ng.
>
> The problem is that in between the multiple hypercalls, you've dropped
> Xen's domlist lock, and e.g. a new domain with a lower domid could have
> come into existence.  This doesn't matter for most things, but
> Oxenstored is the authoritative source of which domains are alive or
> not, and it does need to be accurate.
>
> Oxenstored really does need to make a single hypercall asking for all
> 32k domains in order to get a coherent view.  This is how Cxenstored work=
s.
>
> However, we can do this from within C and also not double-process the
> resulting list.
>
> On that subject, is list the right thing here, or would an array be
> better?  One has less in the way of pointer chasing than the other,
> although whether it makes any appreciable difference is a different
> question.

Array might be slightly better, but is also mutable, a list is immutable.
This gets called fairly often though, not sure that copying the state
of 32k domains on the C side when you only have 1 or 2 domains running
would be worth it.
Wouldn't we be better off querying the domains we know about one at a
time in that case?
Querying all 32k is probably only worth it when you run a large number
of domains, and a performance hit for every normal user, but I haven't
measured where the cutoff point would be.
If it matters the application can make that decision based on the
number of domains it is monitoring (for a small number of domains
query individually, for large numbers query everything, even
non-existent domains).

>
> > +
> > +  let _ =3D Callback.register_exception "xsg.error" (Error "register_c=
allback")
> > +end
> > +
> > +let () =3D
> > +  Printf.printf "Registration of %s plugin started\n%!" __MODULE__;
> > +  Plugin_interface_v1.register_plugin_v1
> > +    (module M : Plugin_interface_v1.Domain_getinfo_V1);
> > +  Printf.printf "Registration of %s plugin successful\n%!" __MODULE__
>
> Its rude for libraries to make assumptions about stdout.  Indeed,
> oxenstored uses syslog() rather than stdout.
>
> If this can't be hooked into Oxenstored's logging infrastructure, then
> the printf() want gating on some kind of debug setting, most likely an
> environment variable.

I think we didn't use syslog to avoid introducing more dependencies
(in particular oxenstored will very likely change its logging
infrastructure in the future to something more standard in the OCaml
ecosystem instead of a hand rolled one, and we don't want to update
the plugin interface every time we do that).

However the plugin interface itself could expose a logging function.
Oxenstored can then implement it as it pleases, but that requires
rearranging the code a bit, in particular plugin_interface_v1.ml would
have to live in oxenstored, not in the glue (and just the mli to stay
in the glue).
For simplicity we could have a global logger in plugin_interface_v1 as
a ref set to ignore initially, that oxenstored could set on startup
(before it loads any plugins), that would retain most flexibility I
think. Then we could use the 'kprintf' variant that calls a '(string
-> unit)' function and that '(string -> unit)' would be configurable.

>
> ~Andrew

