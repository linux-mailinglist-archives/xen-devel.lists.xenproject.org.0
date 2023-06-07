Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FE37263EA
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 17:16:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544850.850918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6ut1-0004zs-T0; Wed, 07 Jun 2023 15:15:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544850.850918; Wed, 07 Jun 2023 15:15:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6ut1-0004xO-NG; Wed, 07 Jun 2023 15:15:47 +0000
Received: by outflank-mailman (input) for mailman id 544850;
 Wed, 07 Jun 2023 15:06:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/iFR=B3=anastas.io=shawn@srs-se1.protection.inumbo.net>)
 id 1q6ukJ-0003xK-Fv
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 15:06:47 +0000
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea0dfbbf-0544-11ee-8611-37d641c3527e;
 Wed, 07 Jun 2023 17:06:45 +0200 (CEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id 695F03F060;
 Wed,  7 Jun 2023 08:06:41 -0700 (PDT)
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
X-Inumbo-ID: ea0dfbbf-0544-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=anastas.io; s=mail;
	t=1686150402; bh=rtdgOgaEuLkzOn+6Czh7oy86GIqcCqilxzRpoDRtYzQ=;
	h=From:To:Cc:Subject:Date:From;
	b=HiUC6aNRJqtqu+vsbzJsqqkPTweHYZe4EoWUuA6MaYUx6DSqG3xcWrCxBrVCCc0nG
	 mqfj8K9s96Icvm95wThwTZAMTPhz+HFh/Ag1TRziSGWtDPAkDVGQ1bClqxcv7q5gxx
	 pc3EZTYZiA7PaaoPB+CtymlqpPZeQsIWYPKaGqnW35BOJnP3mne38W+9jteWILQQP6
	 Z2Nhj4dZVF+8tRHbSNhePn8C8+6XsLbOmrVSg8+FIk6R3Xiblp7R+YozUEt6rYOrW7
	 Z7IuvKunEzf318/5r8yfndEojpK2xeCy9Xl0A/Lfvo+9gu0CxFPvhfuDCGiw1fXDE2
	 sBW0qOA1lOUxA==
From: Shawn Anastasio <shawn@anastas.io>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Shawn Anastasio <shawn@anastas.io>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 0/3] Initial support for Power
Date: Wed,  7 Jun 2023 10:06:31 -0500
Message-Id: <cover.1686148363.git.shawn@anastas.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello all,

This patch series adds support for building a minimal image
(head.o-only) for Power ISA 2.07B+ (POWER8+) systems. The first patch
boots to an infinite loop and the second adds early serial console
support on pseries VMs, with bare metal support planned next.

Since Xen previously had support for a much older version of the ISA in
version 3.2.3, we were able to carry over some headers and support
routines from that version. Unlike that initial port though, this effort
focuses solely on POWER8+ CPUs that are capable of running in Little
Endian mode.

With an appropriate powerpc64le-linux-gnu cross-toolchain, the minimal
image can be built with:

$ make XEN_TARGET_ARCH=ppc64 -C xen openpower_defconfig
$ make XEN_TARGET_ARCH=ppc64 SUBSYSTEMS=xen -C xen TARGET=ppc64/head.o

The resulting head.o can then be booted in a standard QEMU/pseries VM:

$ qemu-system-ppc64 -M pseries-5.2 -m 256M -kernel xen/ppc64/head.o \
	-vga none -serial mon:stdio -nographic

Thanks,
Shawn

Shawn Anastasio (3):
  xen: Add files needed for minimal Power build
  xen/ppc: Implement early serial printk on PaPR/pseries
  maintainers: Add PPC64 maintainer

 MAINTAINERS                              |   3 +
 config/ppc64.mk                          |   5 +
 xen/Makefile                             |   5 +-
 xen/arch/ppc/Kconfig                     |  42 +++++
 xen/arch/ppc/Kconfig.debug               |   5 +
 xen/arch/ppc/Makefile                    |  18 ++
 xen/arch/ppc/Rules.mk                    |   0
 xen/arch/ppc/arch.mk                     |  11 ++
 xen/arch/ppc/boot_of.c                   | 122 +++++++++++++
 xen/arch/ppc/configs/openpower_defconfig |  14 ++
 xen/arch/ppc/early_printk.c              |  36 ++++
 xen/arch/ppc/include/asm/boot.h          |  31 ++++
 xen/arch/ppc/include/asm/bug.h           |   6 +
 xen/arch/ppc/include/asm/byteorder.h     |  74 ++++++++
 xen/arch/ppc/include/asm/cache.h         |   6 +
 xen/arch/ppc/include/asm/config.h        |  66 +++++++
 xen/arch/ppc/include/asm/early_printk.h  |  14 ++
 xen/arch/ppc/include/asm/msr.h           |  67 +++++++
 xen/arch/ppc/include/asm/page-bits.h     |   7 +
 xen/arch/ppc/include/asm/processor.h     | 223 +++++++++++++++++++++++
 xen/arch/ppc/include/asm/reg_defs.h      | 218 ++++++++++++++++++++++
 xen/arch/ppc/include/asm/string.h        |   6 +
 xen/arch/ppc/include/asm/types.h         |  64 +++++++
 xen/arch/ppc/ppc64/Makefile              |   1 +
 xen/arch/ppc/ppc64/asm-offsets.c         |  55 ++++++
 xen/arch/ppc/ppc64/head.S                | 126 +++++++++++++
 xen/arch/ppc/setup.c                     |  32 ++++
 xen/arch/ppc/xen.lds.S                   | 173 ++++++++++++++++++
 28 files changed, 1428 insertions(+), 2 deletions(-)
 create mode 100644 config/ppc64.mk
 create mode 100644 xen/arch/ppc/Kconfig
 create mode 100644 xen/arch/ppc/Kconfig.debug
 create mode 100644 xen/arch/ppc/Makefile
 create mode 100644 xen/arch/ppc/Rules.mk
 create mode 100644 xen/arch/ppc/arch.mk
 create mode 100644 xen/arch/ppc/boot_of.c
 create mode 100644 xen/arch/ppc/configs/openpower_defconfig
 create mode 100644 xen/arch/ppc/early_printk.c
 create mode 100644 xen/arch/ppc/include/asm/boot.h
 create mode 100644 xen/arch/ppc/include/asm/bug.h
 create mode 100644 xen/arch/ppc/include/asm/byteorder.h
 create mode 100644 xen/arch/ppc/include/asm/cache.h
 create mode 100644 xen/arch/ppc/include/asm/config.h
 create mode 100644 xen/arch/ppc/include/asm/early_printk.h
 create mode 100644 xen/arch/ppc/include/asm/msr.h
 create mode 100644 xen/arch/ppc/include/asm/page-bits.h
 create mode 100644 xen/arch/ppc/include/asm/processor.h
 create mode 100644 xen/arch/ppc/include/asm/reg_defs.h
 create mode 100644 xen/arch/ppc/include/asm/string.h
 create mode 100644 xen/arch/ppc/include/asm/types.h
 create mode 100644 xen/arch/ppc/ppc64/Makefile
 create mode 100644 xen/arch/ppc/ppc64/asm-offsets.c
 create mode 100644 xen/arch/ppc/ppc64/head.S
 create mode 100644 xen/arch/ppc/setup.c
 create mode 100644 xen/arch/ppc/xen.lds.S

-- 
2.30.2


