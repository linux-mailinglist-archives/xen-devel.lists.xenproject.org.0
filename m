Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 538D396F58B
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 15:39:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791840.1201845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smZAc-0002Rj-9x; Fri, 06 Sep 2024 13:38:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791840.1201845; Fri, 06 Sep 2024 13:38:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smZAc-0002PG-74; Fri, 06 Sep 2024 13:38:38 +0000
Received: by outflank-mailman (input) for mailman id 791840;
 Fri, 06 Sep 2024 13:38:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M+R7=QE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1smZAa-0002PA-Uj
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2024 13:38:37 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f9dffee-6c55-11ef-99a1-01e77a169b0f;
 Fri, 06 Sep 2024 15:38:33 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2f3e9fb6ee9so25948941fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Sep 2024 06:38:33 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a90202851sm79494366b.144.2024.09.06.06.38.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Sep 2024 06:38:31 -0700 (PDT)
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
X-Inumbo-ID: 4f9dffee-6c55-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725629913; x=1726234713; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9O8ou+HOi7mgZfg/laL/nzbuf+4ToOjihoUbtHllkpY=;
        b=Pi8mL9cJsoXKEjXqkfOhUUBNmJF6LdrRDqSUVki1YdCXGx5fzEgXqqC9ciHdj27eB4
         b5EG4WE8T4OuTIUOVV4v36gCHDbUwF+DZe3cYbfSVX1NOOzN6L0fv5zbU82/Gfn2OFKV
         3vZ88RP5I3B1AJDyZpt1SXVm0CFmYVryUE8z8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725629913; x=1726234713;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9O8ou+HOi7mgZfg/laL/nzbuf+4ToOjihoUbtHllkpY=;
        b=K9Pc34AZQD70OvU2DZVvF1xJnibFc6IjDKFndekVTnb0o1aiCkuYLJzSZCBcev2vL7
         N4Qg7wP6GvjUOi/aRvuxitssXYuOp+rdHskyH3qFKBhIo+LmrOelApYO87NOhk1tZDYg
         J3GWIDrwClZZVCNS78AbRqhf7hkgBQoN+ivBLraud99Yr1LZ6zqPD2m4rDleiYXqm+26
         O+zxgEmcJXjuQLMALGbIWxrrWtOlyDDeV65DZrYORAjOjGFJ8Md/S39RV4J4t/3UD2PQ
         KcjzaAP+gsiGIKDfVRkNTT0FPoM69YRiIVVNmbaKJzT7j6tUmTqf87ybAGPW+r14Y6pK
         9N/w==
X-Forwarded-Encrypted: i=1; AJvYcCV6//0akExhLAd9Ax4x48hWj+rfemi6jvlnEugwbj/cVJ+5QTNyra7PmI1NO34cR5/kCQUm5ZpmZSk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxQojk58n8CFfFCfGQsaMkSbG7/oovEy8ZaG2zz9VO8oc2Trdsm
	8hKA5qYfUp5rYGsxvygRku/LKa9PGKSfXXsSiCRzhfslWl/Y0dk8B6Bs4pv4F+r3gEb/+bNVX/9
	f
X-Google-Smtp-Source: AGHT+IGJoC0OaUVqnbO8sUrnMbQk92ANZwQODN6+XkOzUSV6Mdub7KP9qx+oj+RDfzlyvExs8jph2g==
X-Received: by 2002:a05:6512:12c1:b0:52e:987f:cfe4 with SMTP id 2adb3069b0e04-536587b43aamr1573124e87.30.1725629912063;
        Fri, 06 Sep 2024 06:38:32 -0700 (PDT)
Message-ID: <d4985052-a229-48e5-9294-c8392ee74ab5@citrix.com>
Date: Fri, 6 Sep 2024 14:38:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ocaml/libs: Implement a dynamically-loaded plugin
 for Xenctrl.domain_getinfo
To: Andrii Sultanov <andrii.sultanov@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <cover.1725363427.git.andrii.sultanov@cloud.com>
 <e146c0e378f81aee0789dd472aae5f0ed09d8301.1725363427.git.andrii.sultanov@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e146c0e378f81aee0789dd472aae5f0ed09d8301.1725363427.git.andrii.sultanov@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/09/2024 12:44 pm, Andrii Sultanov wrote:
> This plugin intends to hide the unstable Xenctrl interface under a
> stable one. In case of the change in the interface, a V2 of this plugin
> would need to be produced, but V1 with the old interface would
> need to be kept (with potential change in the implementation) in the
> meantime.
>
> To reduce the need for such changes in the future, this plugin only
> provides the absolute minimum functionality that Oxenstored uses - only
> three fields of the domaininfo struct are used and presented here.
>
> Oxenstored currently uses the single-domain domain_getinfo function,
> whereas Cxenstored uses the more-efficient domain_getinfolist. Both of
> these are provided in the plugin to allow a transition from one to the
> other without modifying the interface in the future. Both return
> identical structures and rely on the same fields in xenctrl, thus if one
> of them breaks, both will break, and a new version of the interface would
> need to be issued.
>
> Signed-off-by: Andrii Sultanov <andrii.sultanov@cloud.com>
> ---

Normally you should put a short set of notes here (under --- in the
commit message) about what has changed from the prior version you posted.

>  tools/ocaml/Makefile                          |   1 +
>  tools/ocaml/libs/Makefile                     |   2 +-
>  tools/ocaml/libs/xenstoredglue/META.in        |   4 +
>  tools/ocaml/libs/xenstoredglue/Makefile       |  46 +++++
>  .../domain_getinfo_plugin_v1/META.in          |   5 +
>  .../domain_getinfo_plugin_v1/Makefile         |  38 ++++
>  .../domain_getinfo_stubs_v1.c                 | 172 ++++++++++++++++++
>  .../domain_getinfo_v1.ml                      |  36 ++++
>  .../domain_getinfo_v1.mli                     |   0
>  .../libs/xenstoredglue/plugin_interface_v1.ml |  28 +++
>  .../xenstoredglue/plugin_interface_v1.mli     |  36 ++++
>  11 files changed, 367 insertions(+), 1 deletion(-)
>  create mode 100644 tools/ocaml/libs/xenstoredglue/META.in
>  create mode 100644 tools/ocaml/libs/xenstoredglue/Makefile
>  create mode 100644 tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/META.in
>  create mode 100644 tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/Makefile
>  create mode 100644 tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_stubs_v1.c
>  create mode 100644 tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_v1.ml
>  create mode 100644 tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_v1.mli
>  create mode 100644 tools/ocaml/libs/xenstoredglue/plugin_interface_v1.ml
>  create mode 100644 tools/ocaml/libs/xenstoredglue/plugin_interface_v1.mli

We still have a mix of names even within this patch.  xenstoredglue,
xenstored_glue, xsglue

Could we see about using xsd_glue as the top level name here, to get it
a bit shorter and easier to read?

> diff --git a/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/Makefile b/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/Makefile
> new file mode 100644
> index 0000000000..9c40026cab
> --- /dev/null
> +++ b/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/Makefile
> @@ -0,0 +1,38 @@
> +OCAML_TOPLEVEL=$(CURDIR)/../../..
> +XEN_ROOT=$(OCAML_TOPLEVEL)/../..
> +include $(OCAML_TOPLEVEL)/common.make
> +
> +CFLAGS += -I $(OCAML_TOPLEVEL)/libs -I $(OCAML_TOPLEVEL)/libs/xenstoredglue
> +CFLAGS += $(CFLAGS_libxenctrl) $(CFLAGS_xeninclude) $(APPEND_CFLAGS)
> +OCAMLOPTFLAGS += -opaque
> +OCAMLINCLUDE += -I ./ -I ../

I think we only need "-I ../" here.  xen-caml-compat.h is the only local
header used.

> diff --git a/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_stubs_v1.c b/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_stubs_v1.c
> new file mode 100644
> index 0000000000..69eddd6412
> --- /dev/null
> +++ b/tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_stubs_v1.c
> @@ -0,0 +1,172 @@

Sorry for missing this before, but new files want to contain SDPX
headers.  For this,

/* SPDX-License-Identifier: LGPL-2.1-only WITH
OCaml-LGPL-linking-exception */

which I had to go and research when sorting out xen-caml-compat.h


For Ocaml files, suppose we want.

(* SPDX-License-Identifier: LGPL-2.1-only WITH
OCaml-LGPL-linking-exception *)


The SPDX header should always be the first line of the file.

> +#define _GNU_SOURCE
> +
> +#include <stdlib.h>
> +#include <string.h>
> +#include <errno.h>
> +
> +#define CAML_NAME_SPACE
> +#include <caml/alloc.h>
> +#include <caml/memory.h>
> +#include <caml/signals.h>
> +#include <caml/fail.h>
> +#include <caml/callback.h>
> +#include <caml/custom.h>
> +
> +#include <xen-tools/common-macros.h>
> +#include <xenctrl.h>
> +
> +#include "xen-caml-compat.h"
> +
> +#define ERR_MSG_LEN (XC_MAX_ERROR_MSG_LEN + 6)
> +#define MAX_FUNC_LINE_LEN 64

These two are obsolete given the rework of xsglue_failwith_xc()

> +#define failwith_xc_v1(xch) xsglue_failwith_xc(xch, __FUNCTION__, __LINE__)

This should be moved lower and adjusted.  See later.

> +
> +/* This is a minimal stub to xenctrl for oxenstored's purposes
> +   For the full xenctrl stubs, see tools/ocaml/libs/xc/xenctrl_stubs.c */

These comments aren't helpful IMO.  It's said many times elsewhere.

> +
> +static inline xc_interface *xsglue_xch_of_val_v1(value v)

static functions don't a _v1 suffix, seeing as they're local to a file
with a _v1 in it's name.

> +{
> +	xc_interface *xch = *(xc_interface **)Data_custom_val(v);
> +
> +	return xch;
> +}
> +
> +static void xsglue_xenctrl_finalize(value v)
> +{
> +	xc_interface *xch = xsglue_xch_of_val_v1(v);
> +
> +	xc_interface_close(xch);
> +}
> +
> +static struct custom_operations xsglue_xenctrl_ops = {
> +	.identifier  = "xenctrl",

I presume this identifier gets elsewhere?  Perhaps
"xsd_glue.domain_getinfo_v1.xenctrl" or so?

> +	.finalize    = xsglue_xenctrl_finalize,
> +	.compare     = custom_compare_default,     /* Can't compare     */
> +	.hash        = custom_hash_default,        /* Can't hash        */
> +	.serialize   = custom_serialize_default,   /* Can't serialize   */
> +	.deserialize = custom_deserialize_default, /* Can't deserialize */
> +	.compare_ext = custom_compare_ext_default, /* Can't compare     */
> +};
> +

There's a trick with the C preprocessor where you can

#define xsglue_failwith(xch) xsglue_failwith(xch, __func__, __LINE__)

to add extra arguments to callsites.  The only requirement is that it
either needs to be after the function of the same name, or that you
define the function using:

static void Noreturn (xsglue_failwith)(xc_interface *xch ...)


I'd put the macro and the declaration together here.  Also, use __func__
rather than __FUNCTION__.

> +static void Noreturn xsglue_failwith_xc(xc_interface *xch,
> +		const char* func,
> +		unsigned int line)

The _xc() suffix isn't very helpful when there's also an xsglue_ prefix.

I'd simply name this xsglue_failwith(...) which is clear enough when used.

Also, 'const char *fun' with the * to the right of the space.

> +{
> +	const xc_error *error = xch ? xc_get_last_error(xch) : NULL;
> +        char *str = NULL;
> +	CAMLparam0();
> +        CAMLlocal1(msg);

Mixing tabs and spaces.

> <snip>
>
> +static value xsglue_alloc_domaininfo_v1(const xc_domaininfo_t *info)
> +{
> +	CAMLparam0();
> +	CAMLlocal1(result);

We try to split declarations from regular logic, so a blank line here
please.

> +	result = caml_alloc_tuple(4);
> +
> +	Store_field(result,  0, Val_int(info->domain));
> +	Store_field(result,  1, Val_bool(info->flags & XEN_DOMINF_dying));
> +	Store_field(result,  2, Val_bool(info->flags & XEN_DOMINF_shutdown));
> +	Store_field(result,  3, Val_int(MASK_EXTR(info->flags, XEN_DOMINF_shutdownmask)));
> +
> +	CAMLreturn(result);
> +}
> +
> +CAMLprim value stub_xsglue_xc_domain_getinfo(value xch_val, value domid)
> +{
> +	CAMLparam2(xch_val, domid);
> +	CAMLlocal1(result);
> +	xc_interface *xch = xsglue_xch_of_val_v1(xch_val);
> +	xc_domaininfo_t info;
> +	int ret, domid_c;
> +
> +	domid_c = Int_val(domid);

I'd suggests a blank line here, or to initialise domid_c at declaration.

> +	caml_enter_blocking_section();
> +	ret = xc_domain_getinfo_single(xch, domid_c, &info);
> +	caml_leave_blocking_section();
> +
> +	if (ret < 0)
> +		failwith_xc_v1(xch);
> +
> +	result = xsglue_alloc_domaininfo_v1(&info);
> +
> +	CAMLreturn(result);
> +}
> +
> +CAMLprim value stub_xsglue_xc_domain_getinfolist(value xch_val, value first_domain)
> +{
> +	CAMLparam2(xch_val, first_domain);
> +	CAMLlocal1(result);
> +	xc_interface *xch = xsglue_xch_of_val_v1(xch_val);
> +	xc_domaininfo_t *info;
> +	int i, ret, toalloc, retval;
> +	uint32_t num_domains;
> +	uint32_t c_first_domain;
> +
> +	/* get the minimum number of allocate byte we need and bump it up to page boundary */
> +	c_first_domain = Int_val(first_domain);

Passing a first_domain of anything other than 0 breaks the atomicity
that we're trying to create by asking for all domains together.

It wants dropping from here, and the plugin interface.

> +	num_domains = DOMID_FIRST_RESERVED - c_first_domain;
> +	toalloc = (sizeof(xc_domaininfo_t) * num_domains) | 0xfff;
> +	ret = posix_memalign((void **) ((void *) &info), 4096, toalloc);

This is nonsense, and appears to have been so for ages in the Xenctrl stubs.

xc_domain_getinfolist() bounce-buffers the array anyway (to get
hypercall-safe buffers from the kernel), so there's no point doing any
local trickery.  Simply:

    info = malloc(sizeof(xc_domaininfo_t) * DOMID_FIRST_RESERVED);
    if ( !info )
        caml_raise_out_of_memory();

will be fine.

> +	if (ret)
> +		caml_raise_out_of_memory();
> +
> +	caml_enter_blocking_section();
> +	retval = xc_domain_getinfolist(xch, c_first_domain, num_domains, info);
> +	caml_leave_blocking_section();
> +
> +	if (retval < 0) {
> +		free(info);
> +		failwith_xc_v1(xch);
> +	} else if (retval > 0) {
> +		result = caml_alloc(retval, 0);
> +		for (i = 0; i < retval; i++) {
> +			caml_modify(&Field(result, i), xsglue_alloc_domaininfo_v1(info + i));
> +		}
> +	} else {
> +		result = Atom(0);
> +	}

While this works, there are better ways of writing the logic. 
failwith() is Noreturn, so it's easier to follow as:

    if (retval < 0) {
        ...
    }

    if (retval > 0) {
        ...

but...  You're dom0, asking for all domains.  Getting a retval of 0 is
also some kind of error, so I'd suggest:

    if (retval <= 0) {
        free(info);
        xsglue_failwith(xch);
    }

    result = caml_alloc(retval, 0);
    for (i = 0; i < retval; i++) {
        caml_modify(&Field(result, i), xsglue_alloc_domaininfo_v1(info +
i));
    }

    free(info);
    Camlreturn(result);

which is simpler still.


> diff --git a/tools/ocaml/libs/xenstoredglue/plugin_interface_v1.mli b/tools/ocaml/libs/xenstoredglue/plugin_interface_v1.mli
> new file mode 100644
> index 0000000000..d073a44d0f
> --- /dev/null
> +++ b/tools/ocaml/libs/xenstoredglue/plugin_interface_v1.mli
> @@ -0,0 +1,36 @@
> +(** To avoid breaking the plugin interface, this module needs to be
> +    standalone and can't rely on any other Xen library. Even unrelated
> +    changes in the interfaces of those modules would change the hash
> +    of this interface and break the plugin system.
> +    It can only depend on Stdlib, therefore all of the types (domid,
> +    domaininfo etc.) are redefined here instead of using alternatives
> +    defined elsewhere.
> +
> +    NOTE: The signature of this interface should not be changed (no
> +    functions or types can be added, modified, or removed). If
> +    underlying Xenctrl changes require a new interface, a V2 with a
> +    corresponding plugin should be created.
> + *)

There's a rune to run ocp-indent in the Xen tree, in lieu of the full
Ocaml dev stack.

make -C tools/ocaml format

and the delta for this patch is just:

--- a/tools/ocaml/libs/xenstoredglue/plugin_interface_v1.mli
+++ b/tools/ocaml/libs/xenstoredglue/plugin_interface_v1.mli
@@ -10,7 +10,7 @@
     functions or types can be added, modified, or removed). If
     underlying Xenctrl changes require a new interface, a V2 with a
     corresponding plugin should be created.
- *)
+*)
 
 module type Domain_getinfo_V1 = sig
   exception Error of string

~Andrew

