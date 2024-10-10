Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5EA997B30
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 05:20:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815404.1229158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syjiF-0003Iq-A5; Thu, 10 Oct 2024 03:19:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815404.1229158; Thu, 10 Oct 2024 03:19:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syjiF-0003Ff-7H; Thu, 10 Oct 2024 03:19:39 +0000
Received: by outflank-mailman (input) for mailman id 815404;
 Thu, 10 Oct 2024 03:19:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5QbA=RG=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1syjiC-0003DE-UT
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 03:19:36 +0000
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [2607:f8b0:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7886bd79-86b6-11ef-99a2-01e77a169b0f;
 Thu, 10 Oct 2024 05:19:34 +0200 (CEST)
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-3e3e6d83138so308504b6e.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 20:19:34 -0700 (PDT)
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
X-Inumbo-ID: 7886bd79-86b6-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728530373; x=1729135173; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6owvSIVu0EHqNm1yYzc7T8GlTeeFySz1jPIyk4PefAk=;
        b=dViPvp4dMBb9bARP1tKYE2FxqvhAeYpdnyYIinPGFZtKVcjkq1A8A/owA6CK9lrYI7
         vIAiVF4lFFrSz8QWl2pVDzlL0l4cPxUHj0f0bv2UAhzLdBwRdFC1CzP/J196EATT4oI2
         r/n2g0pIrCRBGBHmAWRVFd0onXT7hI6Dw26Zg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728530373; x=1729135173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6owvSIVu0EHqNm1yYzc7T8GlTeeFySz1jPIyk4PefAk=;
        b=BIsipX+8OD5rmJPDALH5Qklvmyc3GBFQhlOjoxoG95JE14wDnoxxNIhewdvL3KuBMu
         VCF+a7HNcqqDnSs6FscXbVWx/KasuEWvwBkHdvS3VMdqeF/tVNy3AfxuuZ5EQh2fIYVn
         RG+H4MjI7+nMRrpve1av+Q2qERLMFvv29FlxJa0O4UPn8M80ubK2zbhhHINFxQLCOE0E
         1udyQEirca/cF5ghB4MoHmy5cPtSr2J+tqpwpuLc6ya8Q+h9tosargldlKu5su6dxb/w
         mgYlJKQCMqRRqEHtQJyAXoWrwdS5zupC4sm0o8CMkFlRfS5MEWLP5SpiLs6GsmrI3wO6
         6Eow==
X-Gm-Message-State: AOJu0Yxxce7Qa3kgklYgwlJCkBbFoAak+PmPbQ5pvXJxFT6m9QqPB1wW
	jDmkIH2kTd2CBOc500j/gF/N8L9G0wwc0g/FjGFMHYBQjOEMttNfCD/LrZvnXqto2bqOkUDHBOv
	9cjebYqMTlow6vLGQZVUVmuwecsKB/wMuQ8rd/A==
X-Google-Smtp-Source: AGHT+IGK2g99VinlpXuFk+7xG5Aeig7+Zj/nrgnePEnjP+3phgIn4+HdC2oVl0w/iw41hiQTL0JBYAJRilVW1zZioWQ=
X-Received: by 2002:a05:6870:e3d2:b0:260:f883:95f9 with SMTP id
 586e51a60fabf-2883450c741mr3347240fac.42.1728530372966; Wed, 09 Oct 2024
 20:19:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1728471268.git.andrii.sultanov@cloud.com> <c9b47337615168e38fb6af2a80409f0a38ead901.1728471268.git.andrii.sultanov@cloud.com>
In-Reply-To: <c9b47337615168e38fb6af2a80409f0a38ead901.1728471268.git.andrii.sultanov@cloud.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 10 Oct 2024 04:19:21 +0100
Message-ID: <CACHz=Zi82QfM0CBt+OVK3zDO_qYSUTKzGpy8NZWxXJX_EL+bLQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] ocaml/libs: Remove xsd_glue_dev package, also
 install plugin_interface_v1.a
To: Andrii Sultanov <andrii.sultanov@cloud.com>
Cc: xen-devel@lists.xenproject.org, 
	Christian Lindig <christian.lindig@citrix.com>, Edwin Torok <edwin.torok@cloud.com>, 
	David Scott <dave@recoil.org>, Anthony PERARD <anthony.perard@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 4:15=E2=80=AFPM Andrii Sultanov
<andrii.sultanov@cloud.com> wrote:
>
> xsd_glue_dev packaging is inconsistent with the rest of OCaml packages
> and isn't actually necessary. .a is needed alongside compiled bytecode

Being singular, should not be "The <NAME>.a is needed "... ?
Or are there multiple archive files?

> files during linking and was missed in the initial oxenstore plugin
> work.
>
> Specify OCAMLCFLAGS along with OCAMLOPTFLAGS.
>
> Signed-off-by: Andrii Sultanov <andrii.sultanov@cloud.com>
> ---
>  tools/ocaml/libs/xsd_glue/Makefile | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/tools/ocaml/libs/xsd_glue/Makefile b/tools/ocaml/libs/xsd_gl=
ue/Makefile
> index f84291f7fe..be68642968 100644
> --- a/tools/ocaml/libs/xsd_glue/Makefile
> +++ b/tools/ocaml/libs/xsd_glue/Makefile
> @@ -5,6 +5,7 @@ include $(OCAML_TOPLEVEL)/common.make
>  SUBDIRS=3D domain_getinfo_plugin_v1
>
>  CFLAGS +=3D $(CFLAGS_xeninclude)
> +OCAMLCFLAGS +=3D -opaque
>  OCAMLOPTFLAGS +=3D -opaque
>
>  OBJS =3D plugin_interface_v1
> @@ -28,14 +29,11 @@ OCAML_NOC_LIBRARY =3D plugin_interface_v1
>  install: $(LIBS) META subdirs-install
>         mkdir -p $(OCAMLDESTDIR)
>         $(OCAMLFIND) remove -destdir $(OCAMLDESTDIR) xsd_glue
> -       $(OCAMLFIND) install -destdir $(OCAMLDESTDIR) -ldconf ignore xsd_=
glue META $(INTF) $(LIBS)
> -       $(OCAMLFIND) remove -destdir $(OCAMLDESTDIR) xsd_glue_dev
> -       $(OCAMLFIND) install -destdir $(OCAMLDESTDIR) -ldconf ignore xsd_=
glue_dev META $(INTF) $(LIBS) *.ml *.mli
> +       $(OCAMLFIND) install -destdir $(OCAMLDESTDIR) -ldconf ignore xsd_=
glue META $(INTF) $(LIBS) *.a
>
>  .PHONY: uninstall
>  uninstall: subdirs-uninstall
>         $(OCAMLFIND) remove -destdir $(OCAMLDESTDIR) xsd_glue
> -       $(OCAMLFIND) remove -destdir $(OCAMLDESTDIR) xsd_glue_dev
>
>  .PHONY: clean
>  clean: subdirs-clean

Frediano

