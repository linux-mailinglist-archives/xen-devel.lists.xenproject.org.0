Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F0599535D
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 17:26:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813237.1226081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syC5p-00023k-VB; Tue, 08 Oct 2024 15:25:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813237.1226081; Tue, 08 Oct 2024 15:25:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syC5p-000208-RF; Tue, 08 Oct 2024 15:25:45 +0000
Received: by outflank-mailman (input) for mailman id 813237;
 Tue, 08 Oct 2024 15:25:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J5/k=RE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1syC5o-000202-PN
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 15:25:44 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94e9ca33-8589-11ef-99a2-01e77a169b0f;
 Tue, 08 Oct 2024 17:25:42 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-539908f238fso6529781e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 08:25:42 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539aff2835csm1220925e87.275.2024.10.08.08.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2024 08:25:41 -0700 (PDT)
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
X-Inumbo-ID: 94e9ca33-8589-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728401142; x=1729005942; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xei4YqvZnyECK4HqNJplQQsY2wiWAmO1gRPdYf7JWeI=;
        b=VwpcRRZew9OEOe+mjuzggy/ZkU80GU1KnZd/UPViYg7Vs8pKRs8rNk2HKcNYNavTdB
         bxj9HY0YRFZqc+lcz2G/r4WPI01LSJRNojnK0qsk30CvAtPpts7z/0VbffGgbGoJCnqU
         cb6+MH+NMDgF1seHESYzAoKR9ACOsYUsNE81kRdlXSFTUts8W1Kb8ZCIsfhA8Y8Z29M9
         XUjzHUkG4YSEH69NpPLSMok5fZl3Xw5eBCcp6TxuAsGm/DRAkRCJQnbwDeixP8znYOg8
         5jbV6o/FSZih7XryLvzqKHA0+5C94oj8XV/9WbjWt18ZPD+SchWgViBrwGS2qdOIDgOv
         vF/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728401142; x=1729005942;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xei4YqvZnyECK4HqNJplQQsY2wiWAmO1gRPdYf7JWeI=;
        b=OqJI/aPmD7zeYr4Nw3FTHYo8Bi7lVQPUHz9/6fBGCj5rUjVwkiEHT9yhCEfikBj5Ji
         yHwTz3cIb6YQEM1lKzn3ggMVmlpy1bxRD3iP9GPlPt56M0IjGLHosJvebVm74SryJYy8
         GkZCsE10xHPIiZkIA/IWrV2PZcKiGKOMLPr53ZWKzXs7Oim2IEYoT6mKbSxxv8dj9YIB
         lqNABzvxWvPwr4ZlaVAkTuW6qjeiZ7DhEA33YJLd6lS5upCFG02mFn50tzjdmD0/zQgS
         rL5I40hImlx5KO2Alr0IcUbale2MGeC3YW7rwDVULuPf36xIdA3svxjjhmH7UzLJKPB1
         h4QA==
X-Gm-Message-State: AOJu0YxKveLUInsmS2qy7c3mdVHkAOb59Q7vfCFuDXGZrRL9CdjOpoKM
	DXSUmoT6lpk97Ow3M1L+0oD6gSVdazbnA/HSUsVOeVTKpHOmjaB0VTfbrw==
X-Google-Smtp-Source: AGHT+IGB4dJp5KBsHAeoxooyJ7jWzVHuWOIfpJ1oxuz4Z9xMNsRP5DikvJOjcBQVcDt5mrQgXGBtmw==
X-Received: by 2002:a05:6512:1382:b0:52e:9cc7:4461 with SMTP id 2adb3069b0e04-539ab86253bmr8441234e87.5.1728401141567;
        Tue, 08 Oct 2024 08:25:41 -0700 (PDT)
Message-ID: <a2c4278891263ee8d3431321367a32246d7498c7.camel@gmail.com>
Subject: Re: [PATCH v5 0/6] Move {acpi_}device_init() and device_get_class()
 to common code
From: oleksii.kurochko@gmail.com
To: xen-devel@lists.xenproject.org
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Roger Pau
 =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Connor
 Davis <connojdavis@gmail.com>
Date: Tue, 08 Oct 2024 17:25:40 +0200
In-Reply-To: <cover.1727452451.git.oleksii.kurochko@gmail.com>
References: <cover.1727452451.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

Hello everyone,

Except the comments ( which Jan wrote could be adjusted while
committing ) for patch 1 everything is properly Acked/Reviewed ( if I
am not missing something ).

I also checked if the patch series rebase/apply on top of current
staging and I hadn't any issue.

Could someone please tell me what should be my next steps? Should I
resend this patch series in case I miss something?

Thanks.

~ Oleksii

On Fri, 2024-09-27 at 18:32 +0200, Oleksii Kurochko wrote:
> The {acpi_}device_init() and device_get_class() functions are
> identical across
> Arm and RISC-V, and they are likely to remain the same for other
> architectures
> like PPC.
> Since there is no architecture-specific logic within these functions,
> they are
> good candidates to be moved to the common codebase.
>=20
> This patch series refactors the code by moving these functions to the
> common
> directory, reducing code duplication and simplifying future
> maintenance.
>=20
> ---
> Changes in V5:
> =C2=A0- Rename SIMPLE_DECL_SECTION to DECL_SECTION_WITH_LADDR and update
> the other
> =C2=A0=C2=A0 patches correspondingly.
> =C2=A0- Drop macros argument for=C2=A0 ACPI_DEV_INFO and DT_DEV_INFO.
> ---
> Changes in V4:
> =C2=A0- Introduce SIMPLE_DECL_SECTION to cover the cases when an
> architecture wants
> =C2=A0=C2=A0 to use section declaration without specifying an load addres=
s.
> =C2=A0- Refactor macors ACPI_DEV_INFO and DT_DEV_INFO and update their
> defintion.
> ---
> Changes in V3:
> =C2=A0- drop _SECTIONS from the name of the macros ADEV_INFO and
> DT_DEV_INFO
> =C2=A0- update the definion of macros ADEV_INFO and DT_DEV_INFO
> =C2=A0- drop DEVICE_INIT config.
> ---
> Changes in v2:
> =C2=A0- Introduce macros for definition of ACPI and Device Tree sections.
> =C2=A0- Introduce CONFIG_DEVICE_INIT to make common/device.o compilable
> only for Arm,
> =C2=A0=C2=A0 PPC and RISC-V.
> ---
>=20
> Oleksii Kurochko (6):
> =C2=A0 xen: introduce DECL_SECTION_WITH_LADDR
> =C2=A0 xen: define ACPI and DT device info sections macros
> =C2=A0 xen/arm: use {DT,ACPI}_DEV_INFO for device info sections
> =C2=A0 xen/ppc: add section for device information in linker script
> =C2=A0 xen/riscv: add section for device information in linker script
> =C2=A0 xen/common: move device initialization code to common code
>=20
> =C2=A0xen/arch/arm/device.c=C2=A0=C2=A0=C2=A0=C2=A0 | 71 +---------------=
-----------------
> =C2=A0xen/arch/arm/xen.lds.S=C2=A0=C2=A0=C2=A0 | 14 +------
> =C2=A0xen/arch/ppc/xen.lds.S=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++
> =C2=A0xen/arch/riscv/xen.lds.S=C2=A0 |=C2=A0 2 +
> =C2=A0xen/arch/x86/xen.lds.S=C2=A0=C2=A0=C2=A0 |=C2=A0 6 ++-
> =C2=A0xen/common/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +
> =C2=A0xen/common/device.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 82
> +++++++++++++++++++++++++++++++++++++++
> =C2=A0xen/include/xen/xen.lds.h | 22 +++++++++++
> =C2=A08 files changed, 120 insertions(+), 83 deletions(-)
> =C2=A0create mode 100644 xen/common/device.c
>=20


