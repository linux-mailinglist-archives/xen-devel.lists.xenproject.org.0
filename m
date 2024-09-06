Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5680D96F3F2
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 14:03:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791773.1201772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smXg3-0000Ak-LY; Fri, 06 Sep 2024 12:02:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791773.1201772; Fri, 06 Sep 2024 12:02:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smXg3-00007R-Ik; Fri, 06 Sep 2024 12:02:59 +0000
Received: by outflank-mailman (input) for mailman id 791773;
 Fri, 06 Sep 2024 12:02:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nsOW=QE=cloud.com=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1smXg2-00007K-GE
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2024 12:02:58 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f499bfce-6c47-11ef-a0b4-8be0dac302b0;
 Fri, 06 Sep 2024 14:02:57 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a8a1acb51a7so226853466b.2
 for <xen-devel@lists.xenproject.org>; Fri, 06 Sep 2024 05:02:57 -0700 (PDT)
Received: from smtpclient.apple ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a922f5b1asm59717566b.184.2024.09.06.05.02.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Sep 2024 05:02:55 -0700 (PDT)
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
X-Inumbo-ID: f499bfce-6c47-11ef-a0b4-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725624177; x=1726228977; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o8scESmPOGRl/oSoBAaGv7ohl9fTuOTTUMs/uLBcgCU=;
        b=Cktludyl6oZangGqq3IRTtL5IiQdr+apEbKpwbsiiEiZzbnZ9xwAWmn6a0D2IhaBSG
         EzUcj02r3xyftg+AK+wfzQNVouPBc0RMC4zOMijJgcYprgVREn9lg3VCnaaUhJmHXsFs
         bQHdgs+5ZoSfHvGxXlRiOB80vNva2zgv22dbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725624177; x=1726228977;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o8scESmPOGRl/oSoBAaGv7ohl9fTuOTTUMs/uLBcgCU=;
        b=GE1/6EUhF412j3GgDXD2QTRQQlXF0BJYcqMoMx6EZ11p2PvFFYztKwB6vht870twnD
         +k9MF2kd9/AvVSkGSxH3PiEDq39drUcWx663IVlvfN3KAnEmYqrS1KZjrmVlz3QMxuMC
         +73e+nhd80zhO0gUqIOBQVnwfiQ9Fr90HKlZT/wAB8aU2xzxtxcdsjAP4Vlf8Bwfl5v+
         SGJtpSY6W+hNJM0ZaJsIA9tvPborIAvT09XW3XAf7FlO7hdT2+3PTw+w3ZP4CVIKLWKk
         BpfAFXjOc8k8ok/vIPQi8EYPYaou7EulsASD0PNQ97hdFxpmCqwaXifWvt2FWB9zl6MR
         xZhA==
X-Gm-Message-State: AOJu0YwJgrGWNQd6BrMVmkCoo6Qpowv/FzO8WTcYlO80ioSbtxOKurle
	bJH6ynvjkqZoUIYqngrK0pWGl5LyaASUxZWpQTUSEexCuakqtm5RlY+YA6y8xbg=
X-Google-Smtp-Source: AGHT+IFb24XvNBC6n7WkBH11cUFVbOjRFmrg/wze+CyaEOt5jsVw0vNLgsw0IoBUG8Tn2OvW/4nWeg==
X-Received: by 2002:a17:907:3e9e:b0:a8a:7501:de39 with SMTP id a640c23a62f3a-a8a885be40emr201603566b.9.1725624175891;
        Fri, 06 Sep 2024 05:02:55 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH v2 0/3] tools/ocaml: Stabilize domain_getinfo for
 Oxenstored
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <cover.1725363427.git.andrii.sultanov@cloud.com>
Date: Fri, 6 Sep 2024 13:02:43 +0100
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1CD2249F-81C7-4E01-B102-6A169473C11F@cloud.com>
References: <cover.1725363427.git.andrii.sultanov@cloud.com>
To: Andrii Sultanov <andrii.sultanov@cloud.com>
X-Mailer: Apple Mail (2.3774.600.62)

There was some confusion about my ack for this series - my apologies. I =
intended to ack=E2=80=99 it entirely.

Acked-by: Christian Lindig <christian.lindig@cloud.com>


> On 3 Sep 2024, at 12:44, Andrii Sultanov <andrii.sultanov@cloud.com> =
wrote:
>=20
> This is a V2 of the "Stabilize Oxenstored's interface with" patch
> series, see V1's cover letter for the motivation of these changes.
>=20
> Two patches from V1 ("tools/ocaml: Fix OCaml libs rules" and
> "Remove '-cc $(CC)' from OCAMLOPTFLAGS") were commited upstream, so
> they've been dropped from here.
>=20
> V2 addresses the following review comments and suggestions:
>=20
> * Split the plugin implementation commit into two - build
>  infrastructure-related and implementation itself.
> * Package xenstored_glue interface, since it's needed for an
>  out-of-tree oxenstored to build. Additionally package =
xenstored_glue_dev
>  with .ml and .mli files.
> * Clean up unnecessary #define, #include, and fix function parameter
>  types as suggested.
> * Improve error handling in xsglue_failwith_xc, additionally version
>  xsg.error to avoid potential future conflicts.
> * Drop the GC lock around xc_domain_getinfo_single, and move Int_val
>  outside of the blocking_section.
> * Use existing logging facilities in oxenstored
> * Plugin now uses logging function provided by the plugin interface
>  (ignoring input by default)
> * domain_getinfolist gets all 32k domains at once instead of listing =
them
>  in chunks, storing information into an array. OCaml interface was =
simplified
>  appropriately. (Cxenstored does not do this at the moment - as far as =
I
>  understand, it also uses the single-domain version of the function).
>=20
> I've decided against introducing an enum for the shutdown code, as it =
adds
> additional complexity (and potential reasons for creating a new plugin =
version)
> without any benefit - oxenstored does not care about its value at the =
moment.
>=20
> Patch series on Gitlab for ease of review:
> =
https://gitlab.com/xen-project/people/asultanov/xen/-/compare/staging...pl=
ugin-v3
>=20
> V2 passed the Gitlab CI: =
https://gitlab.com/xen-project/people/asultanov/xen/-/pipelines/1437391764=

> It was also tested on some hosts.
>=20
> Andrii Sultanov (3):
>  tools/ocaml: Build infrastructure for OCaml dynamic libraries
>  ocaml/libs: Implement a dynamically-loaded plugin for
>    Xenctrl.domain_getinfo
>  tools/oxenstored: Use the plugin for Xenctrl.domain_getinfo
>=20
> Config.mk                                     |   2 +-
> configure                                     |   7 +
> m4/paths.m4                                   |   4 +
> tools/configure                               |   7 +
> tools/ocaml/Makefile                          |   1 +
> tools/ocaml/Makefile.rules                    |  17 +-
> tools/ocaml/libs/Makefile                     |   2 +-
> tools/ocaml/libs/xenstoredglue/META.in        |   4 +
> tools/ocaml/libs/xenstoredglue/Makefile       |  46 +++++
> .../domain_getinfo_plugin_v1/META.in          |   5 +
> .../domain_getinfo_plugin_v1/Makefile         |  38 ++++
> .../domain_getinfo_stubs_v1.c                 | 172 ++++++++++++++++++
> .../domain_getinfo_v1.ml                      |  36 ++++
> .../domain_getinfo_v1.mli                     |   0
> .../libs/xenstoredglue/plugin_interface_v1.ml |  28 +++
> .../xenstoredglue/plugin_interface_v1.mli     |  36 ++++
> tools/ocaml/xenstored/Makefile                |   5 +-
> tools/ocaml/xenstored/domains.ml              |  63 +++++--
> tools/ocaml/xenstored/paths.ml.in             |   1 +
> 19 files changed, 451 insertions(+), 23 deletions(-)
> create mode 100644 tools/ocaml/libs/xenstoredglue/META.in
> create mode 100644 tools/ocaml/libs/xenstoredglue/Makefile
> create mode 100644 =
tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/META.in
> create mode 100644 =
tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/Makefile
> create mode 100644 =
tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_stu=
bs_v1.c
> create mode 100644 =
tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_v1.=
ml
> create mode 100644 =
tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_v1.=
mli
> create mode 100644 =
tools/ocaml/libs/xenstoredglue/plugin_interface_v1.ml
> create mode 100644 =
tools/ocaml/libs/xenstoredglue/plugin_interface_v1.mli
>=20
> --=20
> 2.39.2
>=20


