Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 216637DDE5C
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 10:25:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626192.976202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7TN-0006XK-63; Wed, 01 Nov 2023 09:25:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626192.976202; Wed, 01 Nov 2023 09:25:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7TN-0006Vf-2S; Wed, 01 Nov 2023 09:25:13 +0000
Received: by outflank-mailman (input) for mailman id 626192;
 Wed, 01 Nov 2023 09:25:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4cZ7=GO=cloud.com=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1qy7TL-0006VZ-Ok
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 09:25:11 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8cd9c3ec-7898-11ee-9b0e-b553b5be7939;
 Wed, 01 Nov 2023 10:25:09 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-32db188e254so4398208f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Nov 2023 02:25:09 -0700 (PDT)
Received: from smtpclient.apple (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 v7-20020a5d6107000000b0032da49e18fasm3665450wrt.23.2023.11.01.02.25.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 01 Nov 2023 02:25:08 -0700 (PDT)
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
X-Inumbo-ID: 8cd9c3ec-7898-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1698830709; x=1699435509; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZzZEhREAwlJcPojly8EStzKRFf+8Id9IQlGRUuni3EA=;
        b=gyjaiF2gQz9o6N2zc9EqKPZlTXlf/AU7P6zvJCs6/dTeYot5HaUnY2U3L8eo+H0NU/
         YA2pNLeZy8hyU3x/YCZvdiPxkiZc0T+w0OJpQ6EjMfVXEKa0dKCXWqvdfd5TuXae8dd5
         abr5W2O8jCsiJpLSwpB8j313AIxebD/O6Cc3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698830709; x=1699435509;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZzZEhREAwlJcPojly8EStzKRFf+8Id9IQlGRUuni3EA=;
        b=Aob2CjWGabvCc68HycbVDIny1N5BsPn2yzZEBb+TwQ/RfYwYJluSjnmnrosBuzSH4+
         Wh5JGbUozn8MtSHREFKctMlWRidCHXVr45j7qtcklSQUB5BVXO+iUpZlK1CuQOdmiY1j
         fqBdFmgiCwSRCOKe4d1BqtfvEvyjWP0QoiIvZUvhhdsbxADIZ8+CpviCsyYWm5wfadum
         MpgWl6lj4jaoDECEEG5RHFB5zqLrPrXo8W4WmspuVPJxN609JnnVetJlhjnUhCUk8pYD
         AAAA1gpba4AIOuGtZ8aQGkQRJuhBZxJEwo4zwjxX1VsclrgfzCej4JNvhFs0Op46l3Dm
         sUSQ==
X-Gm-Message-State: AOJu0YwxYiPCSx2d1q6nNgJD6o17SI0dlreUXT7gbY/LiTjTAy9fK4hh
	/UwWIk71k7iMQFtnNQQefDzZow==
X-Google-Smtp-Source: AGHT+IF5effs5dM+sbAW5iV8s6e5BK4fLf+eakIhy1McclStEk0y71tqqfkSrVt13zM5YCl+JXoQkA==
X-Received: by 2002:a5d:43c3:0:b0:32d:a476:5285 with SMTP id v3-20020a5d43c3000000b0032da4765285mr10972089wrr.31.1698830709099;
        Wed, 01 Nov 2023 02:25:09 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.3\))
Subject: Re: [PATCH v4 0/5] Kconfig for PCI passthrough on ARM
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <20231030235240.106998-1-stewart.hildebrand@amd.com>
Date: Wed, 1 Nov 2023 09:25:07 +0000
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>,
 =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>,
 Edwin Torok <edwin.torok@cloud.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <AF82D7D3-7745-475E-97C6-54016D40980D@cloud.com>
References: <20231030235240.106998-1-stewart.hildebrand@amd.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
X-Mailer: Apple Mail (2.3696.120.41.1.3)



> On 30 Oct 2023, at 23:52, Stewart Hildebrand =
<stewart.hildebrand@amd.com> wrote:
>=20
> There are multiple series in development/review [1], [2] that will =
benefit from
> having a Kconfig option for PCI passthrough on ARM. Hence I have sent =
this
> series independent from any other series.
>=20
> v3->v4:
> * rename ("xen/arm: pci: plumb xen_arch_domainconfig with pci info")
>  to ("xen/vpci: move xen_domctl_createdomain vPCI flag to common")
> * fold ("xen/arm: make has_vpci() depend on d->arch.has_vpci")
>  into ("xen/vpci: move xen_domctl_createdomain vPCI flag to common")
> * split ("xen/arm: enable vPCI for domUs") into separate hypervisor =
and
>  tools patches
>=20
> v2->v3:
> * add ("xen/arm: pci: plumb xen_arch_domainconfig with pci info")
> * rename ("xen/arm: make has_vpci depend on CONFIG_HAS_VPCI")
>      to ("xen/arm: make has_vpci() depend on d->arch.has_vpci")
> * add ("xen/arm: enable vPCI for dom0")
>=20
> v1->v2:
> * add ("[FUTURE] xen/arm: enable vPCI for domUs")
>=20
> [1] =
https://lists.xenproject.org/archives/html/xen-devel/2023-08/msg02361.html=

> [2] =
https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg00210.html=

>=20
> Rahul Singh (1):
>  xen/arm: pci: introduce PCI_PASSTHROUGH Kconfig option
>=20
> Stewart Hildebrand (4):
>  xen/vpci: move xen_domctl_createdomain vPCI flag to common
>  xen/arm: enable vPCI for dom0
>  [FUTURE] xen/arm: enable vPCI for domUs
>  [FUTURE] tools/arm: enable vPCI for domUs
>=20
> tools/libs/light/libxl_arm.c       |  3 +++
> tools/libs/light/libxl_x86.c       |  5 ++++-
> tools/ocaml/libs/xc/xenctrl.ml     |  2 +-
> tools/ocaml/libs/xc/xenctrl.mli    |  2 +-
> tools/python/xen/lowlevel/xc/xc.c  |  5 ++++-
> xen/arch/arm/Kconfig               | 10 ++++++++++
> xen/arch/arm/domain.c              |  3 ++-
> xen/arch/arm/domain_build.c        |  6 ++++++
> xen/arch/arm/include/asm/domain.h  |  3 ---
> xen/arch/arm/include/asm/pci.h     |  9 +++++++++
> xen/arch/arm/pci/pci-host-common.c | 11 ++++++++---
> xen/arch/arm/vpci.c                |  8 ++++++++
> xen/arch/x86/domain.c              | 16 ++++++++++------
> xen/arch/x86/include/asm/domain.h  |  6 +-----
> xen/arch/x86/setup.c               |  5 +++--
> xen/common/domain.c                | 10 +++++++++-
> xen/drivers/passthrough/pci.c      | 10 ++++++++++
> xen/include/public/arch-x86/xen.h  |  5 +----
> xen/include/public/domctl.h        |  7 +++++--
> xen/include/xen/domain.h           |  2 ++
> 20 files changed, 97 insertions(+), 31 deletions(-)
>=20
>=20
> base-commit: 9659b2a6d73b14620e187f9c626a09323853c459
> --=20
> 2.42.0
>=20


Acked-by: Christian Lindig <christian.lindig@cloud.com>


The changes for the OCaml part are incremental; is someone using the =
OCaml bindings on ARM seriously?=20

=E2=80=94 C=

