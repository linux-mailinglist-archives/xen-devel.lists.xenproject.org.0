Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE9F65971C
	for <lists+xen-devel@lfdr.de>; Fri, 30 Dec 2022 11:05:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.469880.729308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pBCFe-0007WQ-TG; Fri, 30 Dec 2022 10:04:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 469880.729308; Fri, 30 Dec 2022 10:04:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pBCFe-0007TM-QU; Fri, 30 Dec 2022 10:04:34 +0000
Received: by outflank-mailman (input) for mailman id 469880;
 Fri, 30 Dec 2022 10:04:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dm99=44=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pBCFe-0007TG-6q
 for xen-devel@lists.xenproject.org; Fri, 30 Dec 2022 10:04:34 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b7be362-8829-11ed-91b6-6bf2151ebd3b;
 Fri, 30 Dec 2022 11:04:33 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id ja17so14850398wmb.3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Dec 2022 02:04:32 -0800 (PST)
Received: from 2a02.2378.1095.81ae.ip.kyivstar.net
 ([2a02:2378:1095:81ae:47a5:8075:cea7:c577])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a05600c348100b003b47b80cec3sm31897853wmq.42.2022.12.30.02.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Dec 2022 02:04:31 -0800 (PST)
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
X-Inumbo-ID: 5b7be362-8829-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ABrz2Y5UC1+XupLDc4r/e+qIhm6iJGhIw1hnIJA3Cv8=;
        b=R70PlP5qgbrmpA1J+umynbTF8qcikr7eUZ6c+AIIKS80v7ufcmbSUvOYdsTasaf4sa
         qfGCqtHjbr6GymF71gGNFYt4V+G9cZF6RWstmDsCDzEoOoQuVsjBifBS5zPXmAB5Vgb7
         3zvHr5fiqVGsKnQKIAYKWLV0qHrl7tM7BCc6bYo8BE2pZ0l7lzc966Fflo3oNr+PMwBV
         YsJu1uEXtbTBN4h/PgPp5dVAHQ2ngN5BuFxNbO4EJjVC0TV5IFKPqZGewD5UJQmwody4
         6GTG67pPpqc8hfEhbjdkLpObO6bvT7DihKD/d0Ia2bLGHaS+CBLhxzsvWFlUzX1drua5
         yWKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ABrz2Y5UC1+XupLDc4r/e+qIhm6iJGhIw1hnIJA3Cv8=;
        b=IbAOIvkqkYYl/BqjLkPgnpvZjIrzGfozVcEXKZVoqMU8Ay2no96CJU4yP+p/ZGDtrE
         ZW7rDZlXwDoUUyPQCOWHJ2LU8rqzQABhktFjLovgULrlcJxaF1MHHphoGSvfrt+3DxdY
         R0JAbR6GipqFLIvyodrHMWJlGFuMMP7mLSWdDAyYQJinuISuUCdjLWydwUoQIE/InVL8
         p2JfuTSbWfvDifwHdt4ZhgmLYBQLnFWzFZdK7phbvDuqS/eoSKrN+MtJwZTIFIqicLTl
         f9GucIzi5qnbjRE+dLH2dAZlYqtGvwJb+7xnkkRZuD0gXbjW8+s6+pLDGXCa40w6LHJ6
         Ifcw==
X-Gm-Message-State: AFqh2kq5crOblFtRs5v88Bx8YFG0fSBmLbof8q1KqXv2V54/Q/Gkk2ME
	rMCkOmV0HWQep4J8hkg1lvY=
X-Google-Smtp-Source: AMrXdXtSIpTn+AAOZbaz4vTVrBJWdZxBX9BW7emAD6xLnw1VoYR+S0P/kpJn0pNBRewsAvtmtKjmFg==
X-Received: by 2002:a05:600c:358f:b0:3d1:cdf7:debf with SMTP id p15-20020a05600c358f00b003d1cdf7debfmr22725284wmq.26.1672394672392;
        Fri, 30 Dec 2022 02:04:32 -0800 (PST)
Message-ID: <7adaa5b830b6c19e61288b6271b118839e501b76.camel@gmail.com>
Subject: Re: [PATCH 4/6] CI: Express HYPERVISOR_ONLY in build.yml
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>
Date: Fri, 30 Dec 2022 12:04:30 +0200
In-Reply-To: <20221230003848.3241-5-andrew.cooper3@citrix.com>
References: <20221230003848.3241-1-andrew.cooper3@citrix.com>
	 <20221230003848.3241-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0

Hi Andrew,

This is not something critical but I would like to see HYPERVISOR_ONLY
set explicitly for all debian-unstable-gcc-arm32-* jobs as it is not
clear for end-user of build.yaml that  "the RANDCONFIG ->
HYPERVISOR_ONLY implication."

~Oleksii

On Fri, 2022-12-30 at 00:38 +0000, Andrew Cooper wrote:
> Whether to build only Xen, or everything, is a property of container,
> toolchain and/or testcase.=C2=A0 It is not a property of XEN_TARGET_ARCH.
>=20
> Capitalise HYPERVISOR_ONLY and have it set by the debian-unstable-
> gcc-arm32-*
> testcases at the point that arm32 get matched with a container that
> can only
> build Xen.
>=20
> For simplicity, retain the RANDCONFIG -> HYPERVISOR_ONLY implication.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Doug Goldstein <cardoe@cardoe.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> =C2=A0automation/gitlab-ci/build.yaml |=C2=A0 2 ++
> =C2=A0automation/scripts/build=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
| 11 ++++-------
> =C2=A02 files changed, 6 insertions(+), 7 deletions(-)
>=20
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-
> ci/build.yaml
> index 93d9ff69a9f2..e6a9357de3ef 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -516,11 +516,13 @@ debian-unstable-gcc-arm32:
> =C2=A0=C2=A0 extends: .gcc-arm32-cross-build
> =C2=A0=C2=A0 variables:
> =C2=A0=C2=A0=C2=A0=C2=A0 CONTAINER: debian:unstable-arm32-gcc
> +=C2=A0=C2=A0=C2=A0 HYPERVISOR_ONLY: y
> =C2=A0
> =C2=A0debian-unstable-gcc-arm32-debug:
> =C2=A0=C2=A0 extends: .gcc-arm32-cross-build-debug
> =C2=A0=C2=A0 variables:
> =C2=A0=C2=A0=C2=A0=C2=A0 CONTAINER: debian:unstable-arm32-gcc
> +=C2=A0=C2=A0=C2=A0 HYPERVISOR_ONLY: y
> =C2=A0
> =C2=A0debian-unstable-gcc-arm32-randconfig:
> =C2=A0=C2=A0 extends: .gcc-arm32-cross-build
> diff --git a/automation/scripts/build b/automation/scripts/build
> index f2301d08789d..4c6d1f3b70bc 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -19,7 +19,9 @@ if [[ "${RANDCONFIG}" =3D=3D "y" ]]; then
> =C2=A0=C2=A0=C2=A0=C2=A0 fi
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 make -j$(nproc) -C xen
> KCONFIG_ALLCONFIG=3Dtools/kconfig/allrandom.config randconfig
> -=C2=A0=C2=A0=C2=A0 hypervisor_only=3D"y"
> +
> +=C2=A0=C2=A0=C2=A0 # RANDCONFIG implies HYPERVISOR_ONLY
> +=C2=A0=C2=A0=C2=A0 HYPERVISOR_ONLY=3D"y"
> =C2=A0else
> =C2=A0=C2=A0=C2=A0=C2=A0 echo "CONFIG_DEBUG=3D${debug}" > xen/.config
> =C2=A0
> @@ -34,15 +36,10 @@ fi
> =C2=A0# to exit early -- bash is invoked with -e.
> =C2=A0cp xen/.config xen-config
> =C2=A0
> -# arm32 only cross-compiles the hypervisor
> -if [[ "${XEN_TARGET_ARCH}" =3D "arm32" ]]; then
> -=C2=A0=C2=A0=C2=A0 hypervisor_only=3D"y"
> -fi
> -
> =C2=A0# Directory for the artefacts to be dumped into
> =C2=A0mkdir binaries
> =C2=A0
> -if [[ "${hypervisor_only}" =3D=3D "y" ]]; then
> +if [[ "${HYPERVISOR_ONLY}" =3D=3D "y" ]]; then
> =C2=A0=C2=A0=C2=A0=C2=A0 # Xen-only build
> =C2=A0=C2=A0=C2=A0=C2=A0 make -j$(nproc) xen
> =C2=A0


