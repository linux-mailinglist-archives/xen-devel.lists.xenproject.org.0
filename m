Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E17AE8172FF
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 15:13:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656001.1023937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFEN0-00024I-Nj; Mon, 18 Dec 2023 14:13:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656001.1023937; Mon, 18 Dec 2023 14:13:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFEN0-00021q-KZ; Mon, 18 Dec 2023 14:13:22 +0000
Received: by outflank-mailman (input) for mailman id 656001;
 Mon, 18 Dec 2023 14:13:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f46f=H5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rFEMy-00021g-Sc
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 14:13:20 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97cc133c-9daf-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 15:13:18 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2cc3f5e7451so36667611fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 06:13:18 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 be36-20020a056512252400b005007e7211f7sm2942964lfb.21.2023.12.18.06.13.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 06:13:17 -0800 (PST)
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
X-Inumbo-ID: 97cc133c-9daf-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702908798; x=1703513598; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OEa0sbauuIhV+BjML8kJrtYIpYt0Ny7P0oxI+GJW2uM=;
        b=L9WvrEn6h4RAq8E4GE/gjJycJ7YWqTfmeFA8YPLgT7DVmH8K572rGq8z6aoCvWYxwc
         nZpduq8pd19jfWMvXw+45c5zxLAGdtRKZ4yUCfdgpAIEXh++bsMTTdCNyw+F+yRgei4E
         RnRqYokFI7uUaFmZ+ujt3ydx4en7NPf42BthCI21AlakvpsKKIITa4NxOH6mgikzf1WR
         o65U4XMR0EbL1F8Jibl/X6Rj1c2FnZ3NQFUdY7CC1iA+cPAsxknjcFHuxlG404C5WYTB
         VboH2af4WXf4Sa9b1rczaL/ke9MygyyvCpf8yIEk0cMi8qRYA0Zq6w9m6Oa8VrTgVK15
         pJhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702908798; x=1703513598;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OEa0sbauuIhV+BjML8kJrtYIpYt0Ny7P0oxI+GJW2uM=;
        b=dmLrzJkNk7LnP1DbMffqUdljlKzQUX8obhapeMyDxKoUjKH9nxxjwJ0oksrJz7teRU
         XmLayJghwRl8f6st3zMFLYiNZXXaA7FC5NeBh1F3gRNMh2/6sA4TMJl+Ip0cfC+F/tG3
         lOSa3QXo7lUaKSIgL1ZEbZwx3h/oBJYMq15t1NLRrJWCgS6tjGYaWtM84aFKczg9QdLj
         EftzAqa+H9Bithtu5dJA4RAGuH5EH4TDIvb3dLwAK3/kcBa4pUQZ/szz1J0/FwBf1yF/
         BHqQO1vOs14//lYMpH4VdnjX4vyCvftuOtZ5t6ZHXXlan0y76Ah6Y7a+Dq0F7LgAsouO
         2Eqw==
X-Gm-Message-State: AOJu0YwkB1dOiFNKg8ymp8HHQaw7gd3ln0SHbjK+b4h28lqC5LP0WhMq
	xL3PAYbp8Fo5luqUkL6Yffg=
X-Google-Smtp-Source: AGHT+IE0pftetWrQgJFXJHFZABRwkm9P0cGpDxBJX53H5eh7O1gM4H1mCPM00NXbscOOIMdl9Lz+jw==
X-Received: by 2002:a05:6512:ad1:b0:50c:6b:f16b with SMTP id n17-20020a0565120ad100b0050c006bf16bmr10358439lfu.73.1702908797923;
        Mon, 18 Dec 2023 06:13:17 -0800 (PST)
Message-ID: <e84d108233562f1c7801a4c25742f6613703105e.camel@gmail.com>
Subject: Re: [RFC PATCH v1 1/1] xen/Makefile: introduce ARCH_FIXED_CONFIG
 for randconfig
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
  Wei Liu <wl@xen.org>, Shawn Anastasio <sanastasio@raptorengineering.com>, 
 xen-devel@lists.xenproject.org
Date: Mon, 18 Dec 2023 16:13:17 +0200
In-Reply-To: <7ec81395-298d-4d50-89af-d54f756ef657@suse.com>
References: <cover.1701966261.git.oleksii.kurochko@gmail.com>
	 <c95959adca794a90465abd10f579dc9159a7697f.1701966261.git.oleksii.kurochko@gmail.com>
	 <f9ceb8f7-a664-452b-8b38-f74b36386e33@citrix.com>
	 <7ec81395-298d-4d50-89af-d54f756ef657@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Mon, 2023-12-11 at 16:56 +0100, Jan Beulich wrote:
> On 07.12.2023 21:17, Andrew Cooper wrote:
> > On 07/12/2023 5:03 pm, Oleksii Kurochko wrote:
> > > ARCH_FIXED_CONFIG is required in the case of randconfig
> > > and CI for configs that aren't ready or are not
> > > supposed to be implemented for specific architecture.
> > > These configs should always be disabled to prevent randconfig
> > > related tests from failing.
> > >=20
> > > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > > ---
> > > =C2=A0xen/Makefile | 5 ++++-
> > > =C2=A01 file changed, 4 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/xen/Makefile b/xen/Makefile
> > > index ca571103c8..8ae8fe1480 100644
> > > --- a/xen/Makefile
> > > +++ b/xen/Makefile
> > > @@ -336,11 +336,14 @@ ifeq ($(config-build),y)
> > > =C2=A0# *config targets only - make sure prerequisites are updated,
> > > and descend
> > > =C2=A0# in tools/kconfig to make the *config target
> > > =C2=A0
> > > +ARCH_FORCED_CONFIG :=3D
> > > $(srctree)/arch/$(SRCARCH)/configs/randomforced.config
> > > +
> > > =C2=A0# Create a file for KCONFIG_ALLCONFIG which depends on the
> > > environment.
> > > =C2=A0# This will be use by kconfig targets
> > > allyesconfig/allmodconfig/allnoconfig/randconfig
> > > =C2=A0filechk_kconfig_allconfig =3D \
> > > =C2=A0=C2=A0=C2=A0=C2=A0 $(if $(findstring n,$(XEN_HAS_CHECKPOLICY)),=
 echo
> > > 'CONFIG_XSM_FLASK_POLICY=3Dn';) \
> > > -=C2=A0=C2=A0=C2=A0 $(if $(KCONFIG_ALLCONFIG), cat $(KCONFIG_ALLCONFI=
G);) \
> > > +=C2=A0=C2=A0=C2=A0 $(if $(KCONFIG_ALLCONFIG), cat $(KCONFIG_ALLCONFI=
G); \
> > > +=C2=A0=C2=A0=C2=A0 $(if $(wildcard $(ARCH_FORCED_CONFIG)), cat
> > > $(ARCH_FORCED_CONFIG);) ) \
> > > =C2=A0=C2=A0=C2=A0=C2=A0 :
> > > =C2=A0
> > > =C2=A0.allconfig.tmp: FORCE
> >=20
> > We already have infrastructure for this.=C2=A0 What's wrong with
> > EXTRA_FIXED_RANDCONFIG?
>=20
> What I don't understand here is why dealing with the issue would want
> limiting to gitlab-CI. Anyone could run randconfig on their own, and
> imo it would be helpful if the same issue(s) could be prevented
> there,
> too. Hence my earlier suggestion to have a snippet which can be used
> by "interested" parties. And once dealt with in e.g. the makefile
> there should not be a need for any overrides in the CI config
> anymore.
I agree with Jan's point of view that having a more universal solution
for cases where it is necessary to disable a config for randconfig
would be beneficial.

Sometimes, I test randconfig locally, especially during the RISC-V Xen
full build patch series where numerous configs are disabled. It would
be convenient to have only one place to disable configs instead of
duplicating them in two different places.

Does anyone have any objections?

~ Oleksii
>=20
> > ---8<---
> >=20
> > CI: Revert "automation: Drop ppc64le-*randconfig jobs", fix
> > Randconfig
> > with existing infrastructure
> > =C2=A0=C2=A0 =C2=A0
> > This reverts commit cbb71b95dd708b1e26899bbe1e7bf9a85081fd60.
> >=20
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >=20
> > diff --git a/automation/gitlab-ci/build.yaml
> > b/automation/gitlab-ci/build.yaml
> > index 32af30ccedc9..346d0400ed09 100644
> > --- a/automation/gitlab-ci/build.yaml
> > +++ b/automation/gitlab-ci/build.yaml
> > @@ -538,6 +538,7 @@ archlinux-current-gcc-riscv64-randconfig:
> > =C2=A0=C2=A0=C2=A0=C2=A0 RANDCONFIG: y
> > =C2=A0=C2=A0=C2=A0=C2=A0 EXTRA_FIXED_RANDCONFIG:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_COVERAGE=3Dn
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_GRANT_TABLE=3Dn
> > =C2=A0
> > =C2=A0archlinux-current-gcc-riscv64-debug-randconfig:
> > =C2=A0=C2=A0 extends: .gcc-riscv64-cross-build-debug
> > @@ -547,6 +548,7 @@ archlinux-current-gcc-riscv64-debug-randconfig:
> > =C2=A0=C2=A0=C2=A0=C2=A0 RANDCONFIG: y
> > =C2=A0=C2=A0=C2=A0=C2=A0 EXTRA_FIXED_RANDCONFIG:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_COVERAGE=3Dn
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_GRANT_TABLE=3Dn
> > =C2=A0
> > =C2=A0# Power cross-build
> > =C2=A0debian-bullseye-gcc-ppc64le:
> > @@ -563,6 +565,26 @@ debian-bullseye-gcc-ppc64le-debug:
> > =C2=A0=C2=A0=C2=A0=C2=A0 KBUILD_DEFCONFIG: ppc64_defconfig
> > =C2=A0=C2=A0=C2=A0=C2=A0 HYPERVISOR_ONLY: y
> > =C2=A0
> > +debian-bullseye-gcc-ppc64le-randconfig:
> > +=C2=A0 extends: .gcc-ppc64le-cross-build
> > +=C2=A0 variables:
> > +=C2=A0=C2=A0=C2=A0 CONTAINER: debian:bullseye-ppc64le
> > +=C2=A0=C2=A0=C2=A0 KBUILD_DEFCONFIG: ppc64_defconfig
> > +=C2=A0=C2=A0=C2=A0 RANDCONFIG: y
> > +=C2=A0=C2=A0=C2=A0 EXTRA_FIXED_RANDCONFIG:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_COVERAGE=3Dn
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_GRANT_TABLE=3Dn
> > +
> > +debian-bullseye-gcc-ppc64le-debug-randconfig:
> > +=C2=A0 extends: .gcc-ppc64le-cross-build-debug
> > +=C2=A0 variables:
> > +=C2=A0=C2=A0=C2=A0 CONTAINER: debian:bullseye-ppc64le
> > +=C2=A0=C2=A0=C2=A0 KBUILD_DEFCONFIG: ppc64_defconfig
> > +=C2=A0=C2=A0=C2=A0 RANDCONFIG: y
> > +=C2=A0=C2=A0=C2=A0 EXTRA_FIXED_RANDCONFIG:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_COVERAGE=3Dn
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_GRANT_TABLE=3Dn
> > +
> > =C2=A0# Yocto test jobs
> > =C2=A0yocto-qemuarm64:
> > =C2=A0=C2=A0 extends: .yocto-test-arm64
> >=20
>=20


