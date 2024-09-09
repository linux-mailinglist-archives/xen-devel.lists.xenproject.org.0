Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E529D97195E
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 14:32:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794414.1203330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sndYI-0000CB-Lh; Mon, 09 Sep 2024 12:31:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794414.1203330; Mon, 09 Sep 2024 12:31:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sndYI-00009i-Id; Mon, 09 Sep 2024 12:31:30 +0000
Received: by outflank-mailman (input) for mailman id 794414;
 Mon, 09 Sep 2024 12:31:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/l0S=QH=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1sndYG-00009b-Ij
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 12:31:28 +0000
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [2607:f8b0:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6df74cdd-6ea7-11ef-a0b5-8be0dac302b0;
 Mon, 09 Sep 2024 14:31:26 +0200 (CEST)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-710da656c0bso1126484a34.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 05:31:26 -0700 (PDT)
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
X-Inumbo-ID: 6df74cdd-6ea7-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725885085; x=1726489885; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQBQHSKfc21lhWZX8ChuidoS8bRxEr0/mXzE66olqHc=;
        b=FOiFQ23G6ce/Hf30yob948kCht055saOmQgSIzZulpzyfLZkwRkbxS8KRUrdNKVObu
         hyQII3HdjrOLkQ8v5qHeH9HojzPdXZ2dLYRrjSkbJoTCZdzzQZ1a+xEO6+NLGlT7BJzz
         lR6kiwK9aZWNiFVQ85XfVq3uBhHmKUIU+xlUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725885085; x=1726489885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iQBQHSKfc21lhWZX8ChuidoS8bRxEr0/mXzE66olqHc=;
        b=iBEm9S4An8IM6dQKneP9o5swlDHULuSxn4v7TxCu2u2rH1PmpTai5BZmX1O4CTa5sB
         gUX/hpE1WuYp+RJAycOnrR3LK8QKTI7IAbLTM5trqg4iKS0tkKG1pAS0kzfbXp6U1QdW
         w2VDhJZP5ni7xoI1mX+IRNvzpLAzBshDrMghaDZKMS0JgYyHHPyAUbXNhp+k/Xuwhnsy
         1bJz0FDUYysExQrTyE5hM54imizSkADMEqiA24+ImEByy0JzHfZG9Q+TnFmLmmq7KCaN
         aRhMZsKqldSsw5jfvLgwHURGPe9OWUjKE633hz98gv8G4HC5w8bziIRyhADoDm4himuM
         ixeg==
X-Gm-Message-State: AOJu0Yw5MUAU/TEjgL0Nx1kxG/+REq18fM1JrGgN/wi3rTgmRMGD9oLq
	0EwMSfnZ+8fT7E6N0f+etT/AhYN3gq2HI9gHjBSs517XaIFNlgyL75EDjUhQmNyjvQ1A7KwwuDK
	rlo69iB5X2fuVjsd4QnSBbRK4j0d4NYvvXLXjAg==
X-Google-Smtp-Source: AGHT+IEfhOUMLeYx1JjK8sBJ1uoJgUvXdKVVYVaYG/WAmYtaJJdr+RZwOQ/qaQDCNoWD9oNqevqRN5hJYON0hN7TxaY=
X-Received: by 2002:a05:6870:4723:b0:277:c28c:147e with SMTP id
 586e51a60fabf-27b82ed0f49mr12093996fac.21.1725885085375; Mon, 09 Sep 2024
 05:31:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240906145524.186148-1-andrew.cooper3@citrix.com>
In-Reply-To: <20240906145524.186148-1-andrew.cooper3@citrix.com>
From: Edwin Torok <edwin.torok@cloud.com>
Date: Mon, 9 Sep 2024 13:31:14 +0100
Message-ID: <CAEfZLv=9RtB-YLCbhi9ZWVxS6_ErRg6o-CXefRdVnXwdSpX9kw@mail.gmail.com>
Subject: Re: [PATCH] tools/ocaml: Rationalise .gitignore
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, 
	Rob Hoes <Rob.Hoes@citrix.com>, Andrii Sultanov <andrii.sultanov@cloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 3:55=E2=80=AFPM Andrew Cooper <andrew.cooper3@citrix=
.com> wrote:
>
> The root .gitignore is quite stale from recent (and less recent) removals=
, but
> also fails to work for the forthcoming dynamic plugin work.
>
> Strip all Ocaml content out of the root .gitignore, and provide a more lo=
cal
> .gitignore's with up-to-date patterns.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Christian Lindig <christian.lindig@citrix.com>
> CC: David Scott <dave@recoil.org>
> CC: Edwin T=C3=B6r=C3=B6k <edwin.torok@cloud.com>
> CC: Rob Hoes <Rob.Hoes@citrix.com>
> CC: Andrii Sultanov <andrii.sultanov@cloud.com>
>
> I'm on the fence as to whether put paths.ml in the general ignore, but th=
at
> would be making an assumption about future code
> ---
>  .gitignore                       | 28 ----------------------------
>  tools/ocaml/.gitignore           |  5 +++++
>  tools/ocaml/libs/xc/.gitignore   |  1 +
>  tools/ocaml/libs/xs/.gitignore   |  1 +
>  tools/ocaml/xenstored/.gitignore |  3 +++
>  5 files changed, 10 insertions(+), 28 deletions(-)
>  create mode 100644 tools/ocaml/.gitignore
>  create mode 100644 tools/ocaml/libs/xc/.gitignore
>  create mode 100644 tools/ocaml/libs/xs/.gitignore
>  create mode 100644 tools/ocaml/xenstored/.gitignore
>
> diff --git a/.gitignore b/.gitignore
> index d8b57e32f888..d88be80b28d6 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -92,7 +92,6 @@ stubdom/mini-os-*
>  stubdom/mk-headers-*
>  stubdom/newlib-1.*
>  stubdom/newlib-x86*
> -stubdom/ocaml-*
>  stubdom/pciutils-*
>  stubdom/pkg-config/*
>  stubdom/polarssl-*
> @@ -339,33 +338,6 @@ tools/misc/xen-hvmcrash
>  tools/misc/xen-lowmemd
>  tools/vchan/vchan-node[12]
>  tools/vchan/vchan-socket-proxy
> -tools/ocaml/*/.ocamldep.make
> -tools/ocaml/*/*.cm[ixao]
> -tools/ocaml/*/*.cmxa
> -tools/ocaml/*/*.annot
> -tools/ocaml/*/*/.ocamldep.make
> -tools/ocaml/*/*/*.cm[ixao]
> -tools/ocaml/*/*/*.cmxa
> -tools/ocaml/*/*/*.annot
> -tools/ocaml/*/*/META
> -tools/ocaml/libs/xl/_libxl_types.inc
> -tools/ocaml/libs/xl/_libxl_types.ml.in
> -tools/ocaml/libs/xl/_libxl_types.mli.in
> -tools/ocaml/libs/xl/xenlight.ml
> -tools/ocaml/libs/xl/xenlight.mli
> -tools/ocaml/libs/xentoollog/_xtl_levels.*
> -tools/ocaml/libs/xentoollog/xentoollog.ml
> -tools/ocaml/libs/xentoollog/xentoollog.mli
> -tools/ocaml/libs/xs/paths.ml
> -tools/ocaml/libs/xc/xenctrl_abi_check.h
> -tools/ocaml/xenstored/oxenstored
> -tools/ocaml/xenstored/oxenstored.conf
> -tools/ocaml/xenstored/paths.ml
> -tools/ocaml/test/xtl
> -tools/ocaml/test/send_debug_keys
> -tools/ocaml/test/list_domains
> -tools/ocaml/test/dmesg
> -tools/ocaml/test/raise_exception
>  tools/debugger/kdd/kdd
>  tools/firmware/etherboot/ipxe.tar.gz
>  tools/firmware/etherboot/ipxe/
> diff --git a/tools/ocaml/.gitignore b/tools/ocaml/.gitignore
> new file mode 100644
> index 000000000000..3687c2af4f26
> --- /dev/null
> +++ b/tools/ocaml/.gitignore
> @@ -0,0 +1,5 @@
> +/**/META
> +/**/.ocamldep.make
> +/**/*.annot
> +/**/*.cm[ixao]

There is .cmt too, so:
*.cm[ioxat]

> +/**/*.cmx[as]

There is also this:
*.cmti

.cmt/.cmti files are the newer alternatives to .annot used by tools
like Merlin and the OCaml LSP server to show type information.

Looking through https://github.com/ocaml/ocaml/blob/trunk/.gitignore
we probably have the other wildcards covered in the generic .gitignore
(like *.o, *.a and *.so),
and also it doesn't use the leading **/ either, just '*.cmti' for
example, not sure which is better.

> diff --git a/tools/ocaml/libs/xc/.gitignore b/tools/ocaml/libs/xc/.gitign=
ore
> new file mode 100644
> index 000000000000..1b26ad32b6c3
> --- /dev/null
> +++ b/tools/ocaml/libs/xc/.gitignore
> @@ -0,0 +1 @@
> +/xenctrl_abi_check.h
> diff --git a/tools/ocaml/libs/xs/.gitignore b/tools/ocaml/libs/xs/.gitign=
ore
> new file mode 100644
> index 000000000000..4d556ef38cac
> --- /dev/null
> +++ b/tools/ocaml/libs/xs/.gitignore
> @@ -0,0 +1 @@
> +/paths.ml
> diff --git a/tools/ocaml/xenstored/.gitignore b/tools/ocaml/xenstored/.gi=
tignore
> new file mode 100644
> index 000000000000..2b432de4fc91
> --- /dev/null
> +++ b/tools/ocaml/xenstored/.gitignore
> @@ -0,0 +1,3 @@
> +/oxenstored
> +/oxenstored.conf
> +/paths.ml
> --
> 2.39.2
>

