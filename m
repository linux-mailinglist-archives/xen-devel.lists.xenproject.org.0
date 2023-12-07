Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 541C8808968
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 14:44:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649864.1014898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBEfg-0005yC-9D; Thu, 07 Dec 2023 13:44:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649864.1014898; Thu, 07 Dec 2023 13:44:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBEfg-0005w2-63; Thu, 07 Dec 2023 13:44:08 +0000
Received: by outflank-mailman (input) for mailman id 649864;
 Thu, 07 Dec 2023 13:44:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y0Pn=HS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rBEff-0005vv-9F
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 13:44:07 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afc9cebb-9506-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 14:44:04 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-54bf9a54fe3so1324560a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 05:44:04 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 u24-20020a50a418000000b0054c77ac01f4sm813333edb.51.2023.12.07.05.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 05:44:03 -0800 (PST)
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
X-Inumbo-ID: afc9cebb-9506-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701956644; x=1702561444; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ROCimpol/rLlDeNd6pBGKJSURddmRjpgO76QnvNURCk=;
        b=EIM5U0yFpk0g4A0hyJZNTH53UUbyxi7QJl5MZZVQf/RVsLbuZvHHgpj64yORX8T/tp
         mxw0yX8D1onewcJL1groSmp1UGHGp7tRdT/MGHcFuhK31vWkIzgliMdfzcmmUYJtsMca
         fikIGHtGJKpY1qOiItSGv60GlzjZrVQaTttjRnWJw7c0oXkJ8tkRTW30CKA7FQfrQ2Fc
         HHkCwgTugC5/JYnt5bAXXRvih5hPKKOWx0pXYczFcyEX75EHZp60i+Rj9D0judOOqqIm
         l1bCUe/SBchLOpOFv4esjDzOWlbCt6iy/N5O9OPTE1wRZImp5K0ZgdtOSTYV5FNWCoqD
         ajXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701956644; x=1702561444;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ROCimpol/rLlDeNd6pBGKJSURddmRjpgO76QnvNURCk=;
        b=WEPygk7r2hxvbFhir2j6ddqu+bJ1SEPUIcnul+qnwkzJbgIDdRv2yFRsGcGiTxKsrA
         4btG97Z7TDpPOZKLjwLTmPRaBKXvZopGqPfs6nIH5i+bG3qHEpoBCQL3I4/M+qPkml/m
         ApqMMKsj9hAi8Ch2n19tPvREM8FrJ/72E1zPl80rUT0twV0hqOwqxqgqDD7NK1bX/8aD
         SdilBX0dLowULEFZ+TEoXfuoiJe0oswi/EqhdJ4hkQBQCS+Fe8d8yfPEt03KtyeAPYFe
         VdFrkfDPp/yF39PyaKhrY6t1X2P3wtOQcmhmJCvmhwKy31MkWPSSr5TCO8SN0NPXc+Rs
         f6Pg==
X-Gm-Message-State: AOJu0YyzJMcSyPrJeQw1lCBtXPOMEY1i0jZJtdQunvMqvUHDvChKP/km
	1CW1eaTcFhftU3hqelZhkcw=
X-Google-Smtp-Source: AGHT+IGql7H9Nk6OsFc7QVqahv+E/gZO/HNGJkHwMUqC2KtpRgKl89aZ4/0o7SssXP3BHgSEuYJMbw==
X-Received: by 2002:a05:6402:38b:b0:54a:f1db:c2b3 with SMTP id o11-20020a056402038b00b0054af1dbc2b3mr1808672edv.0.1701956644108;
        Thu, 07 Dec 2023 05:44:04 -0800 (PST)
Message-ID: <09d24b36380027df21d547de438da10e01eda0e0.camel@gmail.com>
Subject: Re: [PATCH v2 01/39] xen/riscv: disable unnecessary configs
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>
Cc: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	 <sstabellini@kernel.org>, Alistair Francis <alistair.francis@wdc.com>, Bob
	Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, 
	xen-devel@lists.xenproject.org
Date: Thu, 07 Dec 2023 15:44:02 +0200
In-Reply-To: <008d0c66-6816-4d12-9e1f-1878e982f9fc@suse.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
	 <b4e85f8f58787b4d179022973ce25673d6b56e36.1700761381.git.oleksii.kurochko@gmail.com>
	 <fdfda320-b73b-4830-8f1b-d261b02bcdde@suse.com>
	 <22fa451f7b165a00082443a35077e98e101c22e4.camel@gmail.com>
	 <008d0c66-6816-4d12-9e1f-1878e982f9fc@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 (3.50.1-1.fc39) 
MIME-Version: 1.0

On Thu, 2023-12-07 at 11:00 +0100, Jan Beulich wrote:
> On 07.12.2023 10:22, Oleksii wrote:
> > On Tue, 2023-12-05 at 16:38 +0100, Jan Beulich wrote:
> > > > On 24.11.2023 11:30, Oleksii Kurochko wrote:
> > > > > > The patch also fixes the build script as conf util expects
> > > > > > to have each config on separate line.
> > > >=20
> > > > The approach doesn't really scale (it's already odd that you
> > > > add
> > > > the
> > > > (apparently) same set four times. There's also zero
> > > > justification
> > > > for
> > > > this kind of an adjustment (as per discussion elsewhere I don't
> > > > think
> > > > we should go this route, and hence arguments towards convincing
> > > > me
> > > > [and
> > > > perhaps others] would be needed here).
> > I agree that this may not be the best approach, but it seems like
> > we
> > don't have too many options to turn off a config for randconfig.
> >=20
> > To be honest, in my opinion (IMO), randconfig should either be
> > removed
> > or allowed to fail until most of the functionality is ready.
> > Otherwise,
> > there should be a need to introduce HAS_* or depend on
> > 'SUPPORTED_ARCHS' for each config, or introduce a lot of stubs.
> >=20
> > Could you please suggest a better option?
>=20
> As to dropping randconfig tests, I'd like to refer you to Andrew, who
> is of the opinion that it was wrong to drop them for ppc. (I'm
> agreeing
> with him when taking a theoretical perspective, but I'm not happy
> with
> the practical consequences.)
>=20
> As to a better approach: Instead of listing the same set of options
> several times, can't there be a template config which is used to
> force
> randconfig to not touch certain settings? In fact at least for non-
> randconfig purposes I thought tiny64_defconfig / riscv64_defconfig
> already serve kind of a similar purpose. Imo the EXTRA_*CONFIG
> overrides
> are there for at most very few special case settings, not for
> purposes
> like you use them here.
The template will be the really a good option.

What do you think about the following patch which introduces arch-
specific allrandom.config?

diff --git a/xen/Makefile b/xen/Makefile
index ca571103c8..cb1eca76c2 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -336,11 +336,14 @@ ifeq ($(config-build),y)
 # *config targets only - make sure prerequisites are updated, and
descend
 # in tools/kconfig to make the *config target
=20
+ARCH_ALLRANDOM_CONFIG :=3D
$(srctree)/arch/$(SRCARCH)/configs/allrandom.config
+
 # Create a file for KCONFIG_ALLCONFIG which depends on the
environment.
 # This will be use by kconfig targets
allyesconfig/allmodconfig/allnoconfig/randconfig
 filechk_kconfig_allconfig =3D \
     $(if $(findstring n,$(XEN_HAS_CHECKPOLICY)), echo
'CONFIG_XSM_FLASK_POLICY=3Dn';) \
-    $(if $(KCONFIG_ALLCONFIG), cat $(KCONFIG_ALLCONFIG);) \
+    $(if $(KCONFIG_ALLCONFIG), cat $(KCONFIG_ALLCONFIG); \
+    $(if $(wildcard $(ARCH_ALLRANDOM_CONFIG)), cat
$(ARCH_ALLRANDOM_CONFIG);) ) \
     :

If this patch is OK then it can be reused for patches:
https://lore.kernel.org/xen-devel/cdc20255540a66ba0b6946ac6d48c11029cd3385.=
1701453087.git.oleksii.kurochko@gmail.com/
https://lore.kernel.org/xen-devel/d42a34866edc70a12736b5c6976aa1b44b4ebd8a.=
1701453087.git.oleksii.kurochko@gmail.com/

>=20
> > > > > > --- a/automation/gitlab-ci/build.yaml
> > > > > > +++ b/automation/gitlab-ci/build.yaml
> > > > > > @@ -522,6 +522,38 @@ archlinux-current-gcc-riscv64:
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 CONTAINER: archlinux:current-riscv64
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 KBUILD_DEFCONFIG: tiny64_defconfig
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 HYPERVISOR_ONLY: y
> > > > > > +=C2=A0=C2=A0=C2=A0 EXTRA_XEN_CONFIG:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_COVERAGE=3Dn
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_GRANT_TABLE=3Dn
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_SCHED_CREDIT=3Dn
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_SCHED_CREDIT2=3Dn
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_SCHED_RTDS=3Dn
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_SCHED_NULL=3Dn
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_SCHED_ARINC653=3Dn
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_TRACEBUFFER=3Dn
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_HYPFS=3Dn
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_GRANT_TABLE=3Dn
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_SPECULATIVE_HARDEN_ARRAY=
=3Dn
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_ARGO=3Dn
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_HYPFS_CONFIG=3Dn
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_CORE_PARKING=3Dn
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_DEBUG_TRACE=3Dn
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_IOREQ_SERVER=3Dn
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_CRASH_DEBUG=3Dn
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_KEXEC=3Dn
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_LIVEPATCH=3Dn
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_MEM_ACCESS=3Dn
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_NUMA=3Dn
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_PERF_COUNTERS=3Dn
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_HAS_PMAP=3Dn
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_TRACEBUFFER=3Dn
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_XENOPROF=3Dn
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_COMPAT=3Dn
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_COVERAGE=3Dn
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_UBSAN=3Dn
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_NEEDS_LIBELF=3Dn
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_XSM=3Dn
> > > > > > +
> > > > > > =C2=A0
> > > > > > =C2=A0archlinux-current-gcc-riscv64-debug:
> > > > > > =C2=A0=C2=A0 extends: .gcc-riscv64-cross-build-debug
> > > >=20
> > > > I think I've said so elsewhere before: Please avoid introducing
> > > > double
> > > > blank lines, unless entirely unavoidable (for reasons I cannot
> > > > think
> > > > of).
> > Sorry for that; I am not doing that on purpose. It's just a big
> > patch
> > series, and I missed that double blank. I will try to be more
> > attentive.
> >=20
> > Do you think it makes sense to add a script to perform basic code
> > style
> > checks, similar to what Linux has?
>=20
> Such a script would be nice, but it doesn't exist and re-using
> existing
> checkers has also proven controversial. There's actually an ongoing
> discussion on this topic which you may want to follow.
Yes, I would like to follow. I'll search the topic in ML.
Thanks.

~ Oleksii

