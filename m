Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A86F772C8F2
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 16:52:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547252.854527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8itn-0000rC-Ga; Mon, 12 Jun 2023 14:52:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547252.854527; Mon, 12 Jun 2023 14:52:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8itn-0000p4-Di; Mon, 12 Jun 2023 14:52:03 +0000
Received: by outflank-mailman (input) for mailman id 547252;
 Mon, 12 Jun 2023 14:52:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=abR0=CA=anastas.io=shawn@srs-se1.protection.inumbo.net>)
 id 1q8itl-0000ov-Mr
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 14:52:01 +0000
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae33b5a7-0930-11ee-8611-37d641c3527e;
 Mon, 12 Jun 2023 16:51:59 +0200 (CEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id 55A06439D2;
 Mon, 12 Jun 2023 07:51:55 -0700 (PDT)
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
X-Inumbo-ID: ae33b5a7-0930-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=anastas.io; s=mail;
	t=1686581516; bh=D7A4d7ZM2ommNK6ie9He4O/eJo4imL2tbf/DPZ2VveE=;
	h=From:To:Cc:Subject:Date:From;
	b=EBpLmuNnDKbUwRdaLBMA1j7FwxMFRUysRwqmFF1DDR9MdLyfacJzfbf1hDfWLDy3R
	 jBlwPsc3x7C4SkcVcRml+SXjoZosI7piLOTifHavjQUYDRWA7Nmo7DI9NwqfvORH7/
	 giInl3pWsnp8DRdeJy9Q3FzTxJtGAwPdERxskT1Bl90vXXYGXA+BJEVSk06dFAMPXW
	 zJ6yhPFUruz6udAi6oqd9w7aI2GXyEcYv6/7uOyKKLcYRAUM27ZbgsUuhl4ZpEm8ID
	 81DkHijYOmqpH4OjwecIEhpgHdSFZlM4NlM74Q53expgvDrHdEelu+j26ncW5geCGt
	 stDP/SVINqmpA==
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
	Wei Liu <wl@xen.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v2 0/4] Initial support for Power
Date: Mon, 12 Jun 2023 09:51:35 -0500
Message-Id: <cover.1686580752.git.shawn@anastas.io>
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

--
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


