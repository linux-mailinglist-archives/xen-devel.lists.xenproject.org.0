Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFDF72E644
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 16:51:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548192.856019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q95ME-0003KN-Me; Tue, 13 Jun 2023 14:50:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548192.856019; Tue, 13 Jun 2023 14:50:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q95ME-0003Hf-IS; Tue, 13 Jun 2023 14:50:54 +0000
Received: by outflank-mailman (input) for mailman id 548192;
 Tue, 13 Jun 2023 14:50:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IDdR=CB=anastas.io=shawn@srs-se1.protection.inumbo.net>)
 id 1q95MD-0002Q3-4h
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 14:50:53 +0000
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0d97158-09f9-11ee-b232-6b7b168915f2;
 Tue, 13 Jun 2023 16:50:52 +0200 (CEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id BB1133F0E4;
 Tue, 13 Jun 2023 07:50:18 -0700 (PDT)
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
X-Inumbo-ID: b0d97158-09f9-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=anastas.io; s=mail;
	t=1686667819; bh=rt61Uz/eGiHr82KWv1cG8abyiRGJCqJ1827g/fedSoc=;
	h=From:To:Cc:Subject:Date:From;
	b=HuaQp8R1i08C5RUflmlkJCtduxyw1DIMAAYYgfOaw7kjGTroxJ2L+wYAKN42mrpyq
	 iPxNYom5hcnF+rTI8nG7Ssh1ortFaquZ8uJNVnywtaIT/z1bEjYgWDqXA/JwewKah5
	 L0tcUd9xLGdPV5VbFn15WbwajzQwwLRxZ84bMTH6k9GgWRlzNeNT/W5kCWWckJ+zyx
	 +dU6YXI0bWRIUpugHCw/Cohl8boET3XWi11C9+tTtTHztUQs095x4tjvN+R8dx63Su
	 7StKjlB5q/Qf5NGJFMvSldTucVlhhhzHBf1Ix1dgSCTKZrz4hqLRULthqAH474Ea6j
	 J5CS0e8lrB9zQ==
From: Shawn Anastasio <shawn@anastas.io>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Shawn Anastasio <shawn@anastas.io>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 0/4] Initial support for Power
Date: Tue, 13 Jun 2023 09:49:58 -0500
Message-Id: <cover.1686667191.git.shawn@anastas.io>
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
$ make XEN_TARGET_ARCH=ppc64 SUBSYSTEMS=xen -C xen build

The resulting head.o can then be booted in a standard QEMU/pseries VM:

$ qemu-system-ppc64 -M pseries-5.2 -m 256M -kernel xen/xen \
	-vga none -serial mon:stdio -nographic

Thanks,
Shawn

--
Changes from v3:
  - Fix formatting of MAINTAINERS patch

Changes from v2:
  - Add ppc64le cross-build container patch
  - Add ppc64le cross build CI job patch
  - Drop serial output patch (will be in future patch series)
  - Drop setup.c and unneeded headers from minimal build patch
  - Fixed ordering of MAINTAINERS patch + add F: line
  - Fix config/ppc64.mk option names
  - Clarify Kconfig Baseline ISA option help strings

Shawn Anastasio (4):
  automation: Add container for ppc64le builds
  xen: Add files needed for minimal ppc64le build
  automation: Add ppc64le cross-build jobs
  maintainers: Add ppc64 maintainer

 MAINTAINERS                                   |   4 +
 .../build/debian/bullseye-ppc64le.dockerfile  |  28 +++
 automation/gitlab-ci/build.yaml               |  60 ++++++
 automation/scripts/containerize               |   1 +
 config/ppc64.mk                               |   5 +
 xen/Makefile                                  |   5 +-
 xen/arch/ppc/Kconfig                          |  42 +++++
 xen/arch/ppc/Kconfig.debug                    |   0
 xen/arch/ppc/Makefile                         |  16 ++
 xen/arch/ppc/Rules.mk                         |   0
 xen/arch/ppc/arch.mk                          |  11 ++
 xen/arch/ppc/configs/openpower_defconfig      |  13 ++
 xen/arch/ppc/include/asm/config.h             |  63 +++++++
 xen/arch/ppc/include/asm/page-bits.h          |   7 +
 xen/arch/ppc/ppc64/Makefile                   |   1 +
 xen/arch/ppc/ppc64/asm-offsets.c              |   0
 xen/arch/ppc/ppc64/head.S                     |  27 +++
 xen/arch/ppc/xen.lds.S                        | 173 ++++++++++++++++++
 18 files changed, 454 insertions(+), 2 deletions(-)
 create mode 100644 automation/build/debian/bullseye-ppc64le.dockerfile
 create mode 100644 config/ppc64.mk
 create mode 100644 xen/arch/ppc/Kconfig
 create mode 100644 xen/arch/ppc/Kconfig.debug
 create mode 100644 xen/arch/ppc/Makefile
 create mode 100644 xen/arch/ppc/Rules.mk
 create mode 100644 xen/arch/ppc/arch.mk
 create mode 100644 xen/arch/ppc/configs/openpower_defconfig
 create mode 100644 xen/arch/ppc/include/asm/config.h
 create mode 100644 xen/arch/ppc/include/asm/page-bits.h
 create mode 100644 xen/arch/ppc/ppc64/Makefile
 create mode 100644 xen/arch/ppc/ppc64/asm-offsets.c
 create mode 100644 xen/arch/ppc/ppc64/head.S
 create mode 100644 xen/arch/ppc/xen.lds.S

-- 
2.30.2


