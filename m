Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 034B495B1A2
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2024 11:27:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781669.1191161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh46B-0000ov-Dj; Thu, 22 Aug 2024 09:27:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781669.1191161; Thu, 22 Aug 2024 09:27:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh46B-0000n2-Ab; Thu, 22 Aug 2024 09:27:19 +0000
Received: by outflank-mailman (input) for mailman id 781669;
 Thu, 22 Aug 2024 09:27:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/1gz=PV=cloud.com=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1sh469-0000mw-Oh
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2024 09:27:17 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7bb3ba1-6068-11ef-8776-851b0ebba9a2;
 Thu, 22 Aug 2024 11:27:15 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a867a564911so83972966b.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Aug 2024 02:27:15 -0700 (PDT)
Received: from smtpclient.apple ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f29eaadsm91011466b.67.2024.08.22.02.27.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Aug 2024 02:27:13 -0700 (PDT)
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
X-Inumbo-ID: b7bb3ba1-6068-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724318834; x=1724923634; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTclOxh+v7ilbm3yHnt/W73waZWQ1h3IwdNri8LmKFk=;
        b=FA+jiJ+f7DBYz8CkcZzhPFckwc1XNz4JLLBFfeq9WFEdmuQEC+EWhlPDwGpDd5uF4G
         u3s8k1gXcJ630ADs0+/GeL+fF/4cdwJtRlRgGpKdvKU7ZtjEYM/KL7L8ZtkcbFeW9Qnd
         YYZMD6vyPa3tR7TYiFMXMmGxeBX052mYqiVLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724318834; x=1724923634;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eTclOxh+v7ilbm3yHnt/W73waZWQ1h3IwdNri8LmKFk=;
        b=wh7s0kS4tgWPjcpLVmmog16s/vI4orKuMOvqIwNglfKqHTFJXAF+AL+g4LGhCc2KnF
         p3mk89ahoD2PD++EEcNoFxzRc5Yvb4hm6/Uhmbhrcgv/dHdlXJcf7mj4DA/tAikR3n9v
         JLM3FUqW4mEJ3uVq/4VB6+KEADN+s5QTJP286F3L6O0j7XJaTpuT3S7/IwElm9NGkc9B
         6K6c6bY9ocQAnA7uP24RLOuL5swp2p74jaKA+91DECgU37FdQq8xwZ+zMgU2eDuTB/A6
         AJ4QpFLWp2Vv581w2VSj5AMOxfWKjcVM06m5c5i58eoB1MzZWYTyjgW02TFEEbz9sAns
         Sbtw==
X-Gm-Message-State: AOJu0YzRvNp9T5nqM6gkK3aObiS7t7rTZGQopv0nsIUpkctthSi02oU+
	lamMWGZYub1FJ/+YqSI8Tj2b5w6kvKSqAvczu9iWwSOrB/ZJzwdJ9tmoIIfMSwY=
X-Google-Smtp-Source: AGHT+IHwM59NRIInGGC2Qr8V6NNY2Ud2qO8VO7Y0JqgKIC+7E8X1ZCZKkCOyMVhRAbcMPSsyAySqow==
X-Received: by 2002:a17:907:e285:b0:a86:6807:6c34 with SMTP id a640c23a62f3a-a866f40905emr406932566b.39.1724318833759;
        Thu, 22 Aug 2024 02:27:13 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH v1 0/4] Stabilize Oxenstored's interface with
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <cover.1724314239.git.andrii.sultanov@cloud.com>
Date: Thu, 22 Aug 2024 10:27:01 +0100
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E8ABAB51-1DDC-4BF3-AA46-F003CC1806BF@cloud.com>
References: <cover.1724314239.git.andrii.sultanov@cloud.com>
To: Andrii Sultanov <andrii.sultanov@cloud.com>
X-Mailer: Apple Mail (2.3774.600.62)



> On 22 Aug 2024, at 10:06, Andrii Sultanov <andrii.sultanov@cloud.com> =
wrote:
>=20
> Oxenstored depends on unstable Xenctrl, utilizing only a few of its
> functions. This patch series introduces a dynamically-loaded OCaml
> plugin that aims to stabilize 'Xenctrl.domain_getinfo' and
> 'Xenctrl.domain_getinfolist' by hiding the instability behind a =
versioned
> interface.
>=20
> This, in turn, would allow to fork Oxenstored out of the xen tree,
> speeding up its development and allowing it to transition to an
> OCaml-standard build system.
>=20
> This is only one step towards the long-term goal of being able to drop
> libxenctrl: https://gitlab.com/xen-project/xen/-/issues/190
>=20
> Commits and notes further in the patches explain the exact mechanism =
behind
> this. I've tested this oxenstored with a V2 interface and plugin, with =
V1
> plugin continuing to be compiled, loaded, and working correctly.
>=20
> A dynamic-loading approach was chosen because it allows one to easily =
review
> the remaining usages of Xenctrl and does not force oxenstored to be =
recompiled
> every time xen changes.
>=20
> This patch series passed the Gitlab CI
> =
(https://gitlab.com/xen-project/people/asultanov/xen/-/pipelines/142164337=
5),
> and was further tested on some hosts.
>=20
> Oxenstored currently uses the single-domain 'domain_getinfo' function,
> whereas Cxenstored uses the more-efficient 'domain_getinfolist'. Both =
of
> these are provided in the plugin to allow a transition from one to the
> other without modifying the interface in the future.
>=20
> A prototype of oxenstored using domain_getinfolist was also developed,
> though it is not a part of the current patch series. It also passed =
the
> Gitlab CI and was tested on hosts.
> =
(https://gitlab.com/xen-project/people/asultanov/xen/-/pipelines/142168662=
2)
>=20
> A Gitlab repository with these patches applied, if it's easier for
> anyone to review it on there:
> =
https://gitlab.com/xen-project/people/asultanov/xen/-/compare/staging...st=
aging?from_project_id=3D2336572
>=20
> Andrii Sultanov (4):
>  tools/ocaml/common.make: Remove '-cc $(CC)' flag from OCAMLOPTFLAGS
>  ocaml/libs: Implement a dynamically-loaded plugin for
>    Xenctrl.domain_getinfo
>  tools/oxenstored: Use the plugin for Xenctrl.domain_getinfo
>  Makefile.rules: Fix OCaml libs
>=20
> Config.mk                                     |   2 +-
> configure                                     |   7 +
> m4/paths.m4                                   |   4 +
> tools/configure                               |   7 +
> tools/ocaml/Makefile                          |   1 +
> tools/ocaml/Makefile.rules                    |  21 ++-
> tools/ocaml/common.make                       |   2 +-
> tools/ocaml/libs/Makefile                     |   2 +-
> tools/ocaml/libs/xenstoredglue/META.in        |   4 +
> tools/ocaml/libs/xenstoredglue/Makefile       |  39 ++++
> .../domain_getinfo_plugin_v1/META.in          |   5 +
> .../domain_getinfo_plugin_v1/Makefile         |  38 ++++
> .../domain_getinfo_stubs_v1.c                 | 169 ++++++++++++++++++
> .../domain_getinfo_v1.ml                      |  51 ++++++
> .../domain_getinfo_v1.mli                     |   0
> .../libs/xenstoredglue/plugin_interface_v1.ml |  25 +++
> .../xenstoredglue/plugin_interface_v1.mli     |  34 ++++
> tools/ocaml/xenstored/Makefile                |   5 +-
> tools/ocaml/xenstored/domains.ml              |  63 +++++--
> tools/ocaml/xenstored/paths.ml.in             |   1 +
> 20 files changed, 454 insertions(+), 26 deletions(-)
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

Acked-by: Christian Lindig <christian.lindig@cloud.com>

I fully support the direction this is taking: decoupling Oxenstore from =
the Xen tree to hopefully speed up the development cycle and to attract =
OCaml developers by moving to a more OCaml-idiomatic build system. The =
code was previously shared with me.

=E2=80=94 C=

