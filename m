Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D126665EA59
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 13:04:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471866.731890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDOyw-0000JK-Jx; Thu, 05 Jan 2023 12:04:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471866.731890; Thu, 05 Jan 2023 12:04:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDOyw-0000GX-Gu; Thu, 05 Jan 2023 12:04:26 +0000
Received: by outflank-mailman (input) for mailman id 471866;
 Thu, 05 Jan 2023 12:04:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aZA+=5C=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pDOyu-0000GR-Ob
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 12:04:24 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1804023e-8cf1-11ed-91b6-6bf2151ebd3b;
 Thu, 05 Jan 2023 13:04:23 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id bn26so16422647wrb.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jan 2023 04:04:23 -0800 (PST)
Received: from [192.168.0.145] ([195.234.76.149])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a5d468d000000b00275970a85f4sm34267278wrq.74.2023.01.05.04.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 04:04:22 -0800 (PST)
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
X-Inumbo-ID: 1804023e-8cf1-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BJDrDvFPt6L3MK72KoH0Saq8Kzr+Mx5258nj+894ZnY=;
        b=U4fioNqQrhKU+OkSBh7GX0XZ4/AppZ6oWbH+gw5ezXws42D6Fbw6aX3ibvVeMdi8w+
         pjfQE/YJECPRmQ7fOePqETTutf217by7GmfzlisFlXorhlBHSjyMFIPK6f43RI2AbCl2
         KHP0+5mk8iMykygjMPTq1ih/UjxYBhA/ppL1Vm5L6cD60waefK+RK3WVarBsBDbw/h5v
         1pI33DkHjuNXV3q+pECSdz2KvwK0OfcKJGqwJxP5Hv55iFUVGG0MQoo7dAnvdsMsVCOK
         jnL4Gc14z7vbsyBqNbWKrKrdwid40GM1kQ8q5y4ZM6WvkcHKZhJbrqpR2i8cScHLWTwt
         I/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BJDrDvFPt6L3MK72KoH0Saq8Kzr+Mx5258nj+894ZnY=;
        b=SRYsny3Nunh4HRnEZwJUlUZ+KvsuVI6SKRvRAYl5DaAQ5FqIKbt6+i80Q27foMOabd
         wuP2Ydo4S+p89UB3DS92pq4vkqS9OPFxcBhoHIOCJummwHtkBeysM+JXM+GjXLGblgwN
         LdIGOwO+Vh7PJXnAx8siwcNSgrWNoaQwKANEVLfvdzSMCSxdjgM42rOvD7n2/t1BbXe1
         Ejtd1leeWvNObFXvQn0CNKh7csKrZ7xE7iAU5x0lv0POFf2tdLWAlEDCh+s7edydR4Ly
         5IHxRI4WwEDp/gIQbTObpaAF1VH3hkclOH9ppWJ2fDT5lKgHiNcqZ+yRbkFar6AWet4I
         UyOw==
X-Gm-Message-State: AFqh2kpIyIm8bOyHpinXEzjjdgfpzVvM4gMOXG0rCRwoqmdl7YHP9OGD
	fzjN+QB3b6j6yyKw53QallIyH1ppRrbCqrlB
X-Google-Smtp-Source: AMrXdXvcUk2t/09+QmXNjOMtv1LqPJHVsHvnHbRAP0Da4oAbisBu6nLsTLvKEdiTipdIbJuEqSeF+A==
X-Received: by 2002:a5d:4081:0:b0:27a:cc74:977c with SMTP id o1-20020a5d4081000000b0027acc74977cmr25261803wrp.70.1672920263074;
        Thu, 05 Jan 2023 04:04:23 -0800 (PST)
Message-ID: <0b4f63ee0d1f72a0cf566364d8be0cdf06e9fc75.camel@gmail.com>
Subject: Re: [PATCH v3 0/2] Add minimal RISC-V Xen build and build testing
From: Oleksii <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Doug
 Goldstein <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Gianluca Guida
 <gianluca@rivosinc.com>
Date: Thu, 05 Jan 2023 14:04:21 +0200
In-Reply-To: <cover.1672906559.git.oleksii.kurochko@gmail.com>
References: <cover.1672906559.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0

Sorry for flooding but please skip review of patch series v3 as
I missed comments of Andrew so only v4 should be reviewed.

On Thu, 2023-01-05 at 10:40 +0200, Oleksii Kurochko wrote:
> The patch series introduces the following:
> - provide a minimal amount of changes to add initial RISC-V support
> =C2=A0 to make Xen binary buildable and runnable for RISC-V architecture
> =C2=A0 which can be used for future development and testing.
> - add RISC-V 64 cross-compile build jobs to check if any new changes
> =C2=A0 break RISC-V build.
>=20
> Changes in V3:
> - Remove include of <asm/config.h> from head.S.
>=20
> Changes in V2:
> - Remove the patch "automation: add cross-compiler support
> =C2=A0 for the build script" because it was reworked as a part of the
> patch
> =C2=A0 series "CI: Fixes/cleanup in preparation for RISCV".
> - Remove the patch "automation: add python3 package for
> riscv64.dockerfile"
> =C2=A0 because it is not necessary for RISCV Xen binary build now.
> - Rework the patch "arch/riscv: initial RISC-V support to build/run
> =C2=A0 minimal Xen" according to the comments about v1 of the patch
> series.
> - Add HYPERVISOR_ONLY to RISCV jobs in build.yaml after rebasing on
> =C2=A0 "CI: Fixes/cleanup in preparation for RISCV" patch series.
>=20
> Oleksii Kurochko (2):
> =C2=A0 arch/riscv: initial RISC-V support to build/run minimal Xen
> =C2=A0 automation: add RISC-V 64 cross-build tests for Xen
>=20
> =C2=A0automation/gitlab-ci/build.yaml=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 45 =
++++++++
> =C2=A0xen/arch/riscv/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 16 +++
> =C2=A0xen/arch/riscv/arch.mk=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +
> =C2=A0xen/arch/riscv/include/asm/config.h |=C2=A0=C2=A0 9 +-
> =C2=A0xen/arch/riscv/riscv64/Makefile=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 2 +-
> =C2=A0xen/arch/riscv/riscv64/head.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 4 +-
> =C2=A0xen/arch/riscv/xen.lds.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 158
> ++++++++++++++++++++++++++++
> =C2=A07 files changed, 233 insertions(+), 5 deletions(-)
> =C2=A0create mode 100644 xen/arch/riscv/xen.lds.S
>=20


