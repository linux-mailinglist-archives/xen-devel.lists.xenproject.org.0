Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09457AE5AA3
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 05:55:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022908.1398766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTukU-00064m-Cx; Tue, 24 Jun 2025 03:55:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022908.1398766; Tue, 24 Jun 2025 03:55:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTukU-00063F-AJ; Tue, 24 Jun 2025 03:55:06 +0000
Received: by outflank-mailman (input) for mailman id 1022908;
 Tue, 24 Jun 2025 03:55:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1A0Y=ZH=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uTukS-000639-7n
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 03:55:05 +0000
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch
 [109.224.244.16]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0062b6e7-50af-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 05:55:00 +0200 (CEST)
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
X-Inumbo-ID: 0062b6e7-50af-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1750737299; x=1750996499;
	bh=kgm/ahmSt27FsPZowTug9QzPxVkvQcKb8PSoXe1OzuQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=QxNEF7NarjQXhtoqwNIn/Gs4wjVTusx3nDB4GqHDHUkgJldgkd+J6/qrFWprlTjTp
	 TXlfYyA4ekY/rrLaBh/+dhDLTmXf9ZeXdeIIcP8oT8WexyXmr3CbAwuUO7d3kiH2Sa
	 okZbQ6ifganzPBOVix27XFwZbECOEsuvTaq+SiOe1jlqK/OWHbwjuLzgZVgzN2vEwj
	 Y6U09KdP4sUgqDRKdiI3V1z/w8Fy/Sw9CFknxw58W0BmOAU7cLLgUcsoE296E4ZYYu
	 eMUv36gPHrOlR0HE+nQI+fCDmd/onJKfqjCPr2EYVpKHMjTlDgd4RvUTC5LCUd4T5O
	 P7zc0aBzxRspg==
Date: Tue, 24 Jun 2025 03:54:54 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, oleksii.kurochko@gmail.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 00/16] xen: framework for UART emulators
Message-ID: <20250624035443.344099-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 1f3322f86847b85be4792570abbb73b99c01e441
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The series introduces a driver framework to abstract UART emulators in the
hypervisor under drivers/vuart.

That allows for architecture-independent handling of virtual UARTs in the
console driver and simplifies enabling new UART emulators.

The framework is gated by CONFIG_HAS_VUART, which is automatically enabled
once the user enables any UART emulator.

Current implementation supports maximum of one vUART of each kind per domai=
n.

All current UART emulators (Arm) are switched to the new framework.

This works origins from [1].

Conceptually, there are 3 parts in the series:
- PL011 emulator cleanup: patches 1-6
- Simple MMIO-based UART emulator cleanup: patches 7-10, depends on the com=
mon
  header introduced in vpl011 cleanup
- vUART driver framework: patches 11-16, depends on the cleanup part

[1] https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v1-0-c5d36b3=
1d66c@ford.com/
[2] CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/18856=
41957

Denis Mukhin (16):
  arm/vpl011: rename virtual PL011 Kconfig option
  arm/vpl011: move DT node parsing to PL011 emulator code
  arm/vpl011: use vuart_ prefix in vpl011 public calls
  arm/vpl011: use raw spin_lock_{irqrestore,irqsave}
  arm/vpl011: use void pointer in domain struct
  arm/vpl011: remove vpl011 header file
  arm/vuart: rename 'virtual UART' Kconfig option
  arm/vuart: move simple MMIO-based vUART declarations to common header
  arm/vuart: use void pointer in domain struct
  arm/vuart: merge vuart_print_char() with vuart_mmio_write()
  xen/domain: introduce common emulation flags
  xen/domain: introduce domain-emu.h
  drivers/vuart: move PL011 emulator code
  drivers/vuart: move simple MMIO-based UART emulator
  drivers/vuart: introduce framework for UART emulators
  drivers/vuart: hook simple MMIO-based UART to vUART framework

 xen/arch/arm/Kconfig                          |  15 -
 xen/arch/arm/Makefile                         |   2 -
 xen/arch/arm/configs/tiny64_defconfig         |   2 +-
 xen/arch/arm/dom0less-build.c                 |  76 +---
 xen/arch/arm/domain.c                         |  11 +-
 xen/arch/arm/domctl.c                         |  15 +-
 xen/arch/arm/include/asm/domain.h             |  20 +-
 xen/arch/arm/include/asm/kernel.h             |   3 -
 xen/arch/arm/include/asm/vpl011.h             |  91 -----
 xen/arch/arm/vuart.c                          | 139 -------
 xen/arch/arm/vuart.h                          |  54 ---
 xen/arch/arm/xen.lds.S                        |   1 +
 xen/arch/ppc/include/asm/domain.h             |   1 +
 xen/arch/ppc/xen.lds.S                        |   1 +
 xen/arch/riscv/include/asm/domain.h           |   1 +
 xen/arch/riscv/xen.lds.S                      |   1 +
 xen/arch/x86/domain.c                         |   2 +-
 xen/arch/x86/domctl.c                         |   2 +-
 xen/arch/x86/include/asm/domain.h             |  48 ++-
 xen/arch/x86/xen.lds.S                        |   1 +
 xen/common/domain.c                           |  13 +
 xen/common/keyhandler.c                       |   4 +
 xen/drivers/Kconfig                           |   2 +
 xen/drivers/Makefile                          |   1 +
 xen/drivers/char/console.c                    |  11 +-
 xen/drivers/vuart/Kconfig                     |  23 ++
 xen/drivers/vuart/Makefile                    |   3 +
 xen/drivers/vuart/vuart-mmio.c                | 189 ++++++++++
 .../vpl011.c =3D> drivers/vuart/vuart-pl011.c}  | 347 +++++++++++++-----
 xen/drivers/vuart/vuart.c                     |  95 +++++
 xen/include/xen/domain-emu.h                  |  33 ++
 xen/include/xen/domain.h                      |   2 +
 xen/include/xen/sched.h                       |   2 +
 xen/include/xen/vuart.h                       |  72 ++++
 xen/include/xen/xen.lds.h                     |  10 +
 35 files changed, 771 insertions(+), 522 deletions(-)
 delete mode 100644 xen/arch/arm/include/asm/vpl011.h
 delete mode 100644 xen/arch/arm/vuart.c
 delete mode 100644 xen/arch/arm/vuart.h
 create mode 100644 xen/drivers/vuart/Kconfig
 create mode 100644 xen/drivers/vuart/Makefile
 create mode 100644 xen/drivers/vuart/vuart-mmio.c
 rename xen/{arch/arm/vpl011.c =3D> drivers/vuart/vuart-pl011.c} (71%)
 create mode 100644 xen/drivers/vuart/vuart.c
 create mode 100644 xen/include/xen/domain-emu.h
 create mode 100644 xen/include/xen/vuart.h

--=20
2.34.1



