Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9961E809311
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 22:08:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650176.1015436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBLaQ-0005SY-Q5; Thu, 07 Dec 2023 21:07:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650176.1015436; Thu, 07 Dec 2023 21:07:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBLaQ-0005Ow-MM; Thu, 07 Dec 2023 21:07:10 +0000
Received: by outflank-mailman (input) for mailman id 650176;
 Thu, 07 Dec 2023 21:07:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y0Pn=HS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rBLaO-0005Oa-Q9
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 21:07:08 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92d9bd95-9544-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 22:07:05 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a1f33c13ff2so90932766b.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 13:07:05 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 mm15-20020a1709077a8f00b00a1b6ec7a88asm191032ejc.113.2023.12.07.13.07.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 13:07:03 -0800 (PST)
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
X-Inumbo-ID: 92d9bd95-9544-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701983224; x=1702588024; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jDhq3biZj465qUEXPNT8h7JZlASkrEbakO4LXpiUR8M=;
        b=YB/ZWM908EWEr5dmsZZ3UjgD4mFMRHI0vq4DRm8OWswDisi7x1+IEon2KL+zFj4d+Q
         Or9ZYAA1NZpHOsYRYYSIcdFuRP9qgmFSqLdOjPlv4U1V4wxqFYrdojH0I/FvSWusCYWV
         1GUb2jmF0grSZBsRs55bxdsfiVGruzwTOanZkcUZwU2yLD45MdPt0lDAuJonUFCW//xY
         wi95ZEVnhyauj3axIpgL+RWYFSk7kX0ly8IO+KvQcTfLRyUzxaVxPqDWr82Ot1Ui7z6X
         s+OgLbnM3JFbfaDQmfssU3VlD/jQ/xZRxqlljUnKNbgNeBbzrGmTvE80GPMYfvVtQ6oT
         2ZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701983224; x=1702588024;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jDhq3biZj465qUEXPNT8h7JZlASkrEbakO4LXpiUR8M=;
        b=N7c/W4Rs6n3RmqieJ+3bO+XJmKII3hDqo4SQgtvzhYMVuVmt4MFjEFse70OuotnFGa
         EW0D2NAqj37IsgROt70zGV0fpz62sUFI9Y4rMpOeQfF7merN2uAB4i7sNdLefiR6bpgH
         3PNZCM1Q7KUJhkWqM0ilakavAQFvVl5vhwbcOebYc9w9IpPa+8YuGR2crPUIxxmB6gb5
         MiAcLq+bCgQzqRurP2Zbf3Ofq5m8qSaGJYL1Atzge2RsGawBReljFRfapSs6kNEKATdq
         SH5bh0vAPfBFJzpPFdiW+E5bOtzJLmmjGqtKku6CVV6d+CImAA9oB5q1dRI2QTAPPKI9
         oK6g==
X-Gm-Message-State: AOJu0Yxt+G7fY5cHuTQNz11teIayzHVxe1K6ESK2jiDzNk3U/vbF5ICc
	vYLOwX0sE3NnoG7yXW01aLs=
X-Google-Smtp-Source: AGHT+IHv9qYrEYhVJISYKGG6tbawAX/N9M9qp9/+0pfH5aFE+v/9GzqXJOspZTCX+nO0iDjrSK9I7A==
X-Received: by 2002:a17:907:c901:b0:a01:c31f:c90e with SMTP id ui1-20020a170907c90100b00a01c31fc90emr1878738ejc.58.1701983224214;
        Thu, 07 Dec 2023 13:07:04 -0800 (PST)
Message-ID: <6e435d2b4772e75544e9201bcfbe00e5cf5eab6e.camel@gmail.com>
Subject: Re: [RFC PATCH v1 1/1] xen/Makefile: introduce ARCH_FIXED_CONFIG
 for randconfig
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich
 <jbeulich@suse.com>,  Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Shawn Anastasio
 <sanastasio@raptorengineering.com>
Date: Thu, 07 Dec 2023 23:07:02 +0200
In-Reply-To: <f9ceb8f7-a664-452b-8b38-f74b36386e33@citrix.com>
References: <cover.1701966261.git.oleksii.kurochko@gmail.com>
	 <c95959adca794a90465abd10f579dc9159a7697f.1701966261.git.oleksii.kurochko@gmail.com>
	 <f9ceb8f7-a664-452b-8b38-f74b36386e33@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 (3.50.1-1.fc39) 
MIME-Version: 1.0

On Thu, 2023-12-07 at 20:17 +0000, Andrew Cooper wrote:
> On 07/12/2023 5:03 pm, Oleksii Kurochko wrote:
> > ARCH_FIXED_CONFIG is required in the case of randconfig
> > and CI for configs that aren't ready or are not
> > supposed to be implemented for specific architecture.
> > These configs should always be disabled to prevent randconfig
> > related tests from failing.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > =C2=A0xen/Makefile | 5 ++++-
> > =C2=A01 file changed, 4 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/xen/Makefile b/xen/Makefile
> > index ca571103c8..8ae8fe1480 100644
> > --- a/xen/Makefile
> > +++ b/xen/Makefile
> > @@ -336,11 +336,14 @@ ifeq ($(config-build),y)
> > =C2=A0# *config targets only - make sure prerequisites are updated, and
> > descend
> > =C2=A0# in tools/kconfig to make the *config target
> > =C2=A0
> > +ARCH_FORCED_CONFIG :=3D
> > $(srctree)/arch/$(SRCARCH)/configs/randomforced.config
> > +
> > =C2=A0# Create a file for KCONFIG_ALLCONFIG which depends on the
> > environment.
> > =C2=A0# This will be use by kconfig targets
> > allyesconfig/allmodconfig/allnoconfig/randconfig
> > =C2=A0filechk_kconfig_allconfig =3D \
> > =C2=A0=C2=A0=C2=A0=C2=A0 $(if $(findstring n,$(XEN_HAS_CHECKPOLICY)), e=
cho
> > 'CONFIG_XSM_FLASK_POLICY=3Dn';) \
> > -=C2=A0=C2=A0=C2=A0 $(if $(KCONFIG_ALLCONFIG), cat $(KCONFIG_ALLCONFIG)=
;) \
> > +=C2=A0=C2=A0=C2=A0 $(if $(KCONFIG_ALLCONFIG), cat $(KCONFIG_ALLCONFIG)=
; \
> > +=C2=A0=C2=A0=C2=A0 $(if $(wildcard $(ARCH_FORCED_CONFIG)), cat
> > $(ARCH_FORCED_CONFIG);) ) \
> > =C2=A0=C2=A0=C2=A0=C2=A0 :
> > =C2=A0
> > =C2=A0.allconfig.tmp: FORCE
>=20
> We already have infrastructure for this.=C2=A0 What's wrong with
> EXTRA_FIXED_RANDCONFIG?
Everything is fine; I don't know why there was only an issue with
CONFIG_GRANT_TABLE on PPC. On the RISC-V side, there were more configs
issues, prompting me to include all the configurations not implemented
for RISC-V in EXTRA_FIXED_RANDCONFIG. You can find the added
configurations in this commit:
https://lore.kernel.org/xen-devel/b4e85f8f58787b4d179022973ce25673d6b56e36.=
1700761381.git.oleksii.kurochko@gmail.com/#Z31automation:gitlab-ci:build.ya=
ml

One challenge is that the same configurations need to be added multiple
times for each build test using randconfig.

Another reason for this approach is a suggestion from Jan (probably I
misunderstood it), who proposed using a template to instruct randconfig
not to modify currently unnecessary configurations. You can find the
suggestion and discussion here:
https://lore.kernel.org/xen-devel/008d0c66-6816-4d12-9e1f-1878e982f9fc@suse=
.com/

Perhaps we could enhance the build script to fetch "fixed" configs from
the architecture-specific fixed-defconfig instead of modifying the
Makefile directly.

>=20
> ---8<---
>=20
> CI: Revert "automation: Drop ppc64le-*randconfig jobs", fix
> Randconfig
> with existing infrastructure
> =C2=A0=C2=A0 =C2=A0
> This reverts commit cbb71b95dd708b1e26899bbe1e7bf9a85081fd60.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>=20
> diff --git a/automation/gitlab-ci/build.yaml
> b/automation/gitlab-ci/build.yaml
> index 32af30ccedc9..346d0400ed09 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -538,6 +538,7 @@ archlinux-current-gcc-riscv64-randconfig:
> =C2=A0=C2=A0=C2=A0=C2=A0 RANDCONFIG: y
> =C2=A0=C2=A0=C2=A0=C2=A0 EXTRA_FIXED_RANDCONFIG:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_COVERAGE=3Dn
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_GRANT_TABLE=3Dn
> =C2=A0
> =C2=A0archlinux-current-gcc-riscv64-debug-randconfig:
> =C2=A0=C2=A0 extends: .gcc-riscv64-cross-build-debug
> @@ -547,6 +548,7 @@ archlinux-current-gcc-riscv64-debug-randconfig:
> =C2=A0=C2=A0=C2=A0=C2=A0 RANDCONFIG: y
> =C2=A0=C2=A0=C2=A0=C2=A0 EXTRA_FIXED_RANDCONFIG:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_COVERAGE=3Dn
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_GRANT_TABLE=3Dn
> =C2=A0
> =C2=A0# Power cross-build
> =C2=A0debian-bullseye-gcc-ppc64le:
> @@ -563,6 +565,26 @@ debian-bullseye-gcc-ppc64le-debug:
> =C2=A0=C2=A0=C2=A0=C2=A0 KBUILD_DEFCONFIG: ppc64_defconfig
> =C2=A0=C2=A0=C2=A0=C2=A0 HYPERVISOR_ONLY: y
> =C2=A0
> +debian-bullseye-gcc-ppc64le-randconfig:
> +=C2=A0 extends: .gcc-ppc64le-cross-build
> +=C2=A0 variables:
> +=C2=A0=C2=A0=C2=A0 CONTAINER: debian:bullseye-ppc64le
> +=C2=A0=C2=A0=C2=A0 KBUILD_DEFCONFIG: ppc64_defconfig
> +=C2=A0=C2=A0=C2=A0 RANDCONFIG: y
> +=C2=A0=C2=A0=C2=A0 EXTRA_FIXED_RANDCONFIG:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_COVERAGE=3Dn
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_GRANT_TABLE=3Dn
> +
> +debian-bullseye-gcc-ppc64le-debug-randconfig:
> +=C2=A0 extends: .gcc-ppc64le-cross-build-debug
> +=C2=A0 variables:
> +=C2=A0=C2=A0=C2=A0 CONTAINER: debian:bullseye-ppc64le
> +=C2=A0=C2=A0=C2=A0 KBUILD_DEFCONFIG: ppc64_defconfig
> +=C2=A0=C2=A0=C2=A0 RANDCONFIG: y
> +=C2=A0=C2=A0=C2=A0 EXTRA_FIXED_RANDCONFIG:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_COVERAGE=3Dn
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_GRANT_TABLE=3Dn
> +
> =C2=A0# Yocto test jobs
> =C2=A0yocto-qemuarm64:
> =C2=A0=C2=A0 extends: .yocto-test-arm64
>=20

~ Oleksii

