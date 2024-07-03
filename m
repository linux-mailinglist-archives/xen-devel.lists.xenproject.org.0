Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68525925A04
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 12:53:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752934.1161184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOxbh-0000Dh-Ik; Wed, 03 Jul 2024 10:53:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752934.1161184; Wed, 03 Jul 2024 10:53:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOxbh-0000BB-Fs; Wed, 03 Jul 2024 10:53:01 +0000
Received: by outflank-mailman (input) for mailman id 752934;
 Wed, 03 Jul 2024 10:53:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mAj5=OD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sOxbg-0000B5-Lc
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 10:53:00 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6906b913-392a-11ef-8776-851b0ebba9a2;
 Wed, 03 Jul 2024 12:52:58 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-58ba3e38028so2476518a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 03:52:58 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a77a3aa4bd4sm35654966b.104.2024.07.03.03.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 03:52:57 -0700 (PDT)
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
X-Inumbo-ID: 6906b913-392a-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720003977; x=1720608777; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9mhonVAVC2+IQURbShxcBBFE4VtPExjfjps0/b/bgHE=;
        b=bEQ1ROM5KUlXMdqw49MTbuNpCG4T4w1TMhFvGvaVhLGVNMQULuUpSVHIubtSihhnC6
         QrOMdimwCiRNEXESieQ1Vp+0MNYW/BkUpu0HcydtgG+2cbB1otD3xUvcMjtNrCp3jyOw
         snHtObwz7IRSsPWB/pk0uRUrHVXzNxX0RpYeO6PYiG4aV9AFsbKrwu2oZtCTTQ0IvCSV
         mgi0I2Pik8C/zTTOlhXP1sBIOAWn1k0g5rW3w0EhBqk2vH09zD3Q4WeZhl+jwJEUIBfZ
         2Lqpb5nxAmCZUrXdeLfkr9ToY3D79EeH0TpWcSJ93Z357GvikA2+ZC5JmrhjTzWxViID
         sI3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720003977; x=1720608777;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9mhonVAVC2+IQURbShxcBBFE4VtPExjfjps0/b/bgHE=;
        b=s9n9NXKetihqLymYbdQUkgjEhrq8yH9jgbbNT2u4iCW5Raa1V05j/Quq4HHcyp/Azj
         nJb52KRtbH1oYbTeUBeNVlVcDFerLczOiCtnDcoXgztdL9fm4rOz3Vfr4YTTlbEpeGdk
         F28w9/ewIDt5iRUXwIcZIblT3z1yELxrHGOQZ5XKldzaP+VxlHV6BkHihU34VU2fSDGI
         oed97I2yPX4pCECV0VV3nddCtVq/SEQHzAHjRjW4pBCJPNmYcmpTCW5z3c6Yv6phlxRY
         z77NmhPAh1BZ/5oWSS8BbvUIwbd7YL48qRcd8oxXvFDaBqpWwmnrmi1NK7S6xE1FN/0+
         +hNA==
X-Gm-Message-State: AOJu0YxUDGRDpGDeZ8YI+wT19dNwPyIVqflGpO4R67NURhr/UX0BUd+y
	1Mi670LKT4ePUQEdiZXrBqtd/epQICj7N5+zYPjCv5Goutecz/V7GXnB8OnU
X-Google-Smtp-Source: AGHT+IEcjyPEimZpzGqNQnxNv1cdnHkMKw9TJLfIgo2xP7ulJBhH0QXSvZFhU4huATdXgPukYg/lZg==
X-Received: by 2002:a17:906:3b9a:b0:a72:5fe6:3f49 with SMTP id a640c23a62f3a-a7514512e14mr688407866b.75.1720003977233;
        Wed, 03 Jul 2024 03:52:57 -0700 (PDT)
Message-ID: <d735b1ff67ccdd097930b23d490f00f09c11465f.camel@gmail.com>
Subject: Re: [PATCH for 4.20 v1 0/5] RISCV device tree mapping
From: Oleksii <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>,  Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
 <dpsmith@apertussolutions.com>,  Alistair Francis
 <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Connor
 Davis <connojdavis@gmail.com>
Date: Wed, 03 Jul 2024 12:52:56 +0200
In-Reply-To: <cover.1720002425.git.oleksii.kurochko@gmail.com>
References: <cover.1720002425.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0


Missed to write in the cover letter that this patch series is based on:
  [PATCH for 4.20 v9 0/5] RISCV basic exception handling implementation

~ Oleksii
On Wed, 2024-07-03 at 12:42 +0200, Oleksii Kurochko wrote:
> Current patch series introduces device tree mapping for RISC-V.
>=20
> Also, it introduces common stuff for working with fdt which is
> based on the patches from [1]:
> =C2=A0 [PATCH v4 2/6] xen/device-tree: Move Arm's setup.c bootinfo
> functions to common
> =C2=A0 [PATCH v4 3/6] xen/common: Move Arm's bootfdt.c
> All changes which were done on top of Shawn's patches please find in
> "Changes" section
> of each patch.
>=20
> [1]
> https://lore.kernel.org/xen-devel/cover.1712893887.git.sanastasio@raptore=
ngineering.com/
>=20
> Oleksii Kurochko (3):
> =C2=A0 xen/riscv: enable CONFIG_HAS_DEVICE_TREE
> =C2=A0 xen/riscv: introduce device tree maping function
> =C2=A0 xen/riscv: map FDT
>=20
> Shawn Anastasio (2):
> =C2=A0 xen/device-tree: Move Arm's setup.c bootinfo functions to common
> =C2=A0 xen/common: Move Arm's bootfdt.c to common
>=20
> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0xen/arch/arm/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 -
> =C2=A0xen/arch/arm/bootfdt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 622 --------------------------
> -
> =C2=A0xen/arch/arm/include/asm/setup.h=C2=A0=C2=A0=C2=A0 | 200 +--------
> =C2=A0xen/arch/arm/setup.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 432 -------------------
> =C2=A0xen/arch/riscv/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0xen/arch/riscv/include/asm/config.h |=C2=A0=C2=A0 6 +
> =C2=A0xen/arch/riscv/include/asm/mm.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 2 +
> =C2=A0xen/arch/riscv/mm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 37 +-
> =C2=A0xen/arch/riscv/riscv64/head.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 3 +
> =C2=A0xen/arch/riscv/setup.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 21 +
> =C2=A0xen/common/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0xen/common/device-tree/Makefile=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 2 +
> =C2=A0xen/common/device-tree/bootfdt.c=C2=A0=C2=A0=C2=A0 | 635
> ++++++++++++++++++++++++++++
> =C2=A0xen/common/device-tree/bootinfo.c=C2=A0=C2=A0 | 459 +++++++++++++++=
+++++
> =C2=A0xen/include/xen/bootfdt.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 210 +++++++++
> =C2=A016 files changed, 1375 insertions(+), 1259 deletions(-)
> =C2=A0delete mode 100644 xen/arch/arm/bootfdt.c
> =C2=A0create mode 100644 xen/common/device-tree/Makefile
> =C2=A0create mode 100644 xen/common/device-tree/bootfdt.c
> =C2=A0create mode 100644 xen/common/device-tree/bootinfo.c
> =C2=A0create mode 100644 xen/include/xen/bootfdt.h
>=20


