Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F04D292E99B
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 15:34:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757492.1166462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRtvZ-00008Z-Uh; Thu, 11 Jul 2024 13:33:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757492.1166462; Thu, 11 Jul 2024 13:33:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRtvZ-00006D-Qv; Thu, 11 Jul 2024 13:33:41 +0000
Received: by outflank-mailman (input) for mailman id 757492;
 Thu, 11 Jul 2024 13:33:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xIkU=OL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sRtvY-000067-K1
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 13:33:40 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ea9a013-3f8a-11ef-bbfb-fd08da9f4363;
 Thu, 11 Jul 2024 15:33:39 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2eaafda3b5cso7761291fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 06:33:39 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-594bda3096dsm3445429a12.96.2024.07.11.06.33.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 06:33:38 -0700 (PDT)
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
X-Inumbo-ID: 2ea9a013-3f8a-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720704819; x=1721309619; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0a4dg2EPZXF849hx339SrAGOvGkV7Wo4rcsXkXk9UpI=;
        b=DolphPqiB1fm1XLd00uaSM0csRK+Jp0KZmKgJO/zVKURvms3Vtm1Ywd0IaPYjSRuEY
         7b2x7PWWJnehZipv9INviq1reR+ZeoN3HdEuIziQ2TTKEqwQKj8Rd8uFasvLfHLJaipv
         iSt8l/pK/2Ib+sHdkuBQWicvjMDfNf9c/aHO1R43DUyuiWkfeythaycCWjNhxiySXGCe
         Ay6nj9kKuCmsZoWImJJ/eALmzMe0V+0g+j8SqLzZ7X0PSX72JoT2KTSnoGBFrPt8Mop+
         P1dXKQZp889EjT1GbQgY8rVAZaObAv20p2Ns5cvPrMjfbHTNsAzSveT+zq1IH43vZsdq
         WYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720704819; x=1721309619;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0a4dg2EPZXF849hx339SrAGOvGkV7Wo4rcsXkXk9UpI=;
        b=iQe2uG1t7xFCDBShHyTGto5CW2v9wjVD4SFCTvMfYKw9fC7yzQ1U5jaXoNHxHq1F3B
         m+/SjOOF8ATDOJ4FTWVVGa3aUDWdWuZxaNoWxV3t3O0Zv5Oyjm91E9ZqopqGXywwTN3Q
         nYbYjNN+i+ragXJtKWUxeS5OPrZqQhB6qOz1gBlpNUVmBJSDWwcMRb7i/F9Tx3IZuixo
         qW3IDtcECdjYCudW3uG3YkA8B9GA4X9bxr9oFXaTwA5Zw2YtN+2JrCu76+h+0UqNY/fF
         5K2elJvYsb0fA3FgFs5r1NZ4AsUKLM6pAOv4vHqvYtus/RNJQQY09qHj1nRRq+1crh9X
         q5QA==
X-Forwarded-Encrypted: i=1; AJvYcCUZm7AC30PDeIaxID4js0xdiPMhiSQDr96tHSTyPKL5J/P8UgGzIY+9a/IIWgAfVrx4Uoen8K6w/xESI5C4AoJaPXcNn7RGCusqTCvhJew=
X-Gm-Message-State: AOJu0YwWMoizRQfkoTg1Om8fzBTTaPS7sQvAG1P4pIx2D21bEA5Tc4+8
	LvRYuOeGBS7SoOx52FZK76yH3Sri3d2z6sLX+OGLWJo3pcCB4CTaDV16UiiD
X-Google-Smtp-Source: AGHT+IFftyQ0/aE6V7YmL2LmvQQBXpzhT4v9bbgyiGwjwhIM9aOY75ZnQ6OeZCh0EpEpykHLivNDKw==
X-Received: by 2002:a2e:9bd3:0:b0:2ee:4c2e:3d35 with SMTP id 38308e7fff4ca-2eeb30fc904mr53108741fa.23.1720704818508;
        Thu, 11 Jul 2024 06:33:38 -0700 (PDT)
Message-ID: <67d3e229733fa64e4cd9ac593c4305b605bef827.camel@gmail.com>
Subject: Re: [PATCH for-4.19 v2 00/12] CI: part 3 (slimline, and PPC/RISCV
 fixes)
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross
 <jgross@suse.com>,  Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Shawn Anastasio
 <sanastasio@raptorengineering.com>
Date: Thu, 11 Jul 2024 15:33:37 +0200
In-Reply-To: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

On Thu, 2024-07-11 at 12:15 +0100, Andrew Cooper wrote:
> Patch 1 fixes a bug in the containerize script
>=20
> Patches 2-5 remove useless/obsolete testing
>=20
> Patch 6 fixes a bug with the archlinux testing configuration
>=20
> Patches 7-9 adjust the PPC64 testing
>=20
> Patches 10-11 adjust the RISCV64 testing
>=20
> Patch 12 refreshes the custom GCC-IBT container
>=20
>=20
> All changes here follow best-guidance for dockerfiles (non-root,
> heredocs for
> improved legibility), and naming consistency improvements discussed
> previously
> on the Committers call.=C2=A0 Breifly that's:
>=20
> =C2=A0 $DISTRO-$VERSION(numeric)-$ARCH-*
>=20
> which sort more nicely and don't require e.g. people to remember
> which order
> buster/bullseye/bookworm are in terms of debain release.
>=20
> For x86, this involves inserting an $ARCH of x86_64.=C2=A0 Right now,
> x86_64 is
> implied by the absence, and all other variations have to state one.
>=20
>=20
> Still to come:
>=20
> =C2=A0* OpenSUSE container fixes (resolves the final rolling distro vs
> =C2=A0=C2=A0 allowed_failure problem)
> =C2=A0* Ubuntu/debian rename/trim
> =C2=A0* Add new jobs for latest releases (Ubuntu, Alpine, Fedora)
>=20
> Andrew Cooper (12):
> =C2=A0 CI: Fix CONTAINER_UID0=3D1 scripts/containerize
>=20
> =C2=A0 CI: Remove useless/misleading randconfig jobs
> =C2=A0 CI: Drop Debian Jessie dockerfiles
> =C2=A0 CI: Drop Debian Stretch testing
> =C2=A0 CI: Drop Ubuntu Trusty testing
>=20
> =C2=A0 CI: Mark Archlinux/x86 as allowing failures
>=20
> =C2=A0 CI: Introduce a debian:12-ppc64le container
> =C2=A0 CI: Use debian:12-ppc64le for both build and test
> =C2=A0 CI: Refresh bullseye-ppc64le as debian:11-ppc64le
>=20
> =C2=A0 CI: Introduce debian:11/12-riscv64 containers
> =C2=A0 CI: Swap to debian for riscv64 build and test
>=20
> =C2=A0 CI: Refresh and upgrade the GCC-IBT container
>=20
> =C2=A0.../archlinux/current-riscv64.dockerfile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 22 --
> =C2=A0automation/build/debian/11-ppc64le.dockerfile |=C2=A0 33 +++
> =C2=A0automation/build/debian/11-riscv64.dockerfile |=C2=A0 33 +++
> =C2=A0automation/build/debian/12-ppc64le.dockerfile |=C2=A0 36 +++
> =C2=A0automation/build/debian/12-riscv64.dockerfile |=C2=A0 36 +++
> =C2=A0...ockerfile =3D> 12-x86_64-gcc-ibt.dockerfile} |=C2=A0 81 +++---
> =C2=A0.../build/debian/bullseye-ppc64le.dockerfile=C2=A0 |=C2=A0 32 ---
> =C2=A0.../build/debian/jessie-i386.dockerfile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 55 -----
> =C2=A0automation/build/debian/jessie.dockerfile=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 52 ----
> =C2=A0.../build/debian/stretch-i386.dockerfile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 57 -----
> =C2=A0automation/build/debian/stretch.dockerfile=C2=A0=C2=A0=C2=A0 |=C2=
=A0 60 -----
> =C2=A0automation/build/ubuntu/trusty.dockerfile=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 51 ----
> =C2=A0automation/gitlab-ci/build.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 233 +++++++---------
> --
> =C2=A0automation/gitlab-ci/test.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 13 +-
> =C2=A0automation/scripts/containerize=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 15 +-
> =C2=A0automation/scripts/qemu-smoke-ppc64le.sh=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 4 +-
> =C2=A0.../qemu-system-ppc64/8.1.0-ppc64.dockerfile=C2=A0 |=C2=A0 38 ---
> =C2=A017 files changed, 282 insertions(+), 569 deletions(-)
> =C2=A0delete mode 100644 automation/build/archlinux/current-
> riscv64.dockerfile
> =C2=A0create mode 100644 automation/build/debian/11-ppc64le.dockerfile
> =C2=A0create mode 100644 automation/build/debian/11-riscv64.dockerfile
> =C2=A0create mode 100644 automation/build/debian/12-ppc64le.dockerfile
> =C2=A0create mode 100644 automation/build/debian/12-riscv64.dockerfile
> =C2=A0rename automation/build/debian/{buster-gcc-ibt.dockerfile =3D> 12-
> x86_64-gcc-ibt.dockerfile} (50%)
> =C2=A0delete mode 100644 automation/build/debian/bullseye-
> ppc64le.dockerfile
> =C2=A0delete mode 100644 automation/build/debian/jessie-i386.dockerfile
> =C2=A0delete mode 100644 automation/build/debian/jessie.dockerfile
> =C2=A0delete mode 100644 automation/build/debian/stretch-i386.dockerfile
> =C2=A0delete mode 100644 automation/build/debian/stretch.dockerfile
> =C2=A0delete mode 100644 automation/build/ubuntu/trusty.dockerfile
> =C2=A0delete mode 100644 automation/tests-artifacts/qemu-system-
> ppc64/8.1.0-ppc64.dockerfile
>=20


