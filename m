Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B12CD737392
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 20:13:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552203.862139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBfqu-0006Ak-1F; Tue, 20 Jun 2023 18:13:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552203.862139; Tue, 20 Jun 2023 18:13:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBfqt-00067i-UG; Tue, 20 Jun 2023 18:13:15 +0000
Received: by outflank-mailman (input) for mailman id 552203;
 Tue, 20 Jun 2023 18:13:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G5hq=CI=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qBfqs-00067X-Qa
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 18:13:14 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d1c8f7d-0f96-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 20:13:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id BA10C8285935;
 Tue, 20 Jun 2023 13:13:09 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id wWYkHwc7ggid; Tue, 20 Jun 2023 13:13:08 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 4D1AE82858A5;
 Tue, 20 Jun 2023 13:13:08 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id AC5vHRWOqcMQ; Tue, 20 Jun 2023 13:13:08 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id AA0E18285738;
 Tue, 20 Jun 2023 13:13:07 -0500 (CDT)
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
X-Inumbo-ID: 1d1c8f7d-0f96-11ee-8611-37d641c3527e
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 4D1AE82858A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1687284788; bh=yQ2jwAEuJk+JybKeQL7/geyz2pfCWamg3VHhHEztqDA=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=RR6jmtWoCYpYxjPioWz0xWSO1AjMWJD71+tXJ0Y3Ne9bSk4QsThaCcbF+G+Qy38xs
	 aZho8OzdfJxXVxLrkZSKMdy1BV6lR1fVNrRFCkpWKQb27Ut6zNMWmC3skYor2orvds
	 H6R1HSjxsvv9DAxeHo2dOgsIdaVF34S4OzQ2HBhQ=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v5 0/3] Initial support for Power
Date: Tue, 20 Jun 2023 13:12:46 -0500
Message-Id: <cover.1687283294.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello all,

This patch series adds support for building a minimal image
for Power ISA 2.07B+ (POWER8+) systems. In addition to a patch adding
support to the build system and a simple infinite loop at the
entrypoint, patches to add ppc64le support to the CI as well as a
MAINTAINERS update are included.

Since Xen previously had support for a much older version of the ISA in
version 3.2.3, we were able to carry over some headers and support
routines from that version. Unlike that initial port though, this effort
focuses solely on POWER8+ CPUs that are capable of running in Little
Endian mode.

With an appropriate powerpc64le-linux-gnu cross-toolchain, the minimal
image can be built with:

$ make XEN_TARGET_ARCH=3Dppc64 -C xen build

The resulting binary can then be booted in a standard QEMU/pseries VM:

$ qemu-system-ppc64 -M pseries-5.2 -m 256M -kernel xen/xen \
	-vga none -serial mon:stdio -nographic

Thanks,
Shawn

--
Changes from v5:
  - Rename openpower_defconfig to ppc64_defconfig
  - Clarify Kconfig ISA baseline help strings
  - Add ELF metadata annotations to head.S
  - Add dummy .got/.got.plt sections plus assertions to ld script
  - Change .align to .p2align in config.h/ENTRY()

Changes from v4:
  - Change '$(@D)/$(@F)' to '$@' in ppc/Makefile
  - Add -m64, -mlittle-endian to CFLAGS to allow using ppc{32,64be}
    toolchains
  - Change IBM-specific '$' to '.' in head.S
  - Drop unnecessary ALIGN() in linker script in .bss

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

Shawn Anastasio (3):
  xen: Add files needed for minimal ppc64le build
  automation: Add ppc64le cross-build jobs
  maintainers: Add ppc64 maintainer

 MAINTAINERS                          |   4 +
 automation/gitlab-ci/build.yaml      |  60 +++++++++
 config/ppc64.mk                      |   4 +
 xen/Makefile                         |   5 +-
 xen/arch/ppc/Kconfig                 |  42 ++++++
 xen/arch/ppc/Kconfig.debug           |   0
 xen/arch/ppc/Makefile                |  16 +++
 xen/arch/ppc/Rules.mk                |   0
 xen/arch/ppc/arch.mk                 |  12 ++
 xen/arch/ppc/configs/ppc64_defconfig |  13 ++
 xen/arch/ppc/include/asm/config.h    |  63 +++++++++
 xen/arch/ppc/include/asm/page-bits.h |   7 +
 xen/arch/ppc/ppc64/Makefile          |   1 +
 xen/arch/ppc/ppc64/asm-offsets.c     |   0
 xen/arch/ppc/ppc64/head.S            |  30 +++++
 xen/arch/ppc/xen.lds.S               | 188 +++++++++++++++++++++++++++
 16 files changed, 443 insertions(+), 2 deletions(-)
 create mode 100644 config/ppc64.mk
 create mode 100644 xen/arch/ppc/Kconfig
 create mode 100644 xen/arch/ppc/Kconfig.debug
 create mode 100644 xen/arch/ppc/Makefile
 create mode 100644 xen/arch/ppc/Rules.mk
 create mode 100644 xen/arch/ppc/arch.mk
 create mode 100644 xen/arch/ppc/configs/ppc64_defconfig
 create mode 100644 xen/arch/ppc/include/asm/config.h
 create mode 100644 xen/arch/ppc/include/asm/page-bits.h
 create mode 100644 xen/arch/ppc/ppc64/Makefile
 create mode 100644 xen/arch/ppc/ppc64/asm-offsets.c
 create mode 100644 xen/arch/ppc/ppc64/head.S
 create mode 100644 xen/arch/ppc/xen.lds.S

--
2.30.2


