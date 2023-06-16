Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B427337A2
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 19:49:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550340.859373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qADYh-0002LQ-6k; Fri, 16 Jun 2023 17:48:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550340.859373; Fri, 16 Jun 2023 17:48:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qADYh-0002GL-0n; Fri, 16 Jun 2023 17:48:27 +0000
Received: by outflank-mailman (input) for mailman id 550340;
 Fri, 16 Jun 2023 17:48:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+r/i=CE=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qADYf-0001uA-8h
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 17:48:25 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa7e2d87-0c6d-11ee-8611-37d641c3527e;
 Fri, 16 Jun 2023 19:48:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 4F38482853A9;
 Fri, 16 Jun 2023 12:48:18 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id aQur3ftt4vIW; Fri, 16 Jun 2023 12:48:17 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 3FC348285513;
 Fri, 16 Jun 2023 12:48:17 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 3aVNxc9v7Oug; Fri, 16 Jun 2023 12:48:17 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 5F06D82853A9;
 Fri, 16 Jun 2023 12:48:16 -0500 (CDT)
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
X-Inumbo-ID: fa7e2d87-0c6d-11ee-8611-37d641c3527e
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 3FC348285513
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1686937697; bh=T01hWp9Kvrb2rPTP6hJvEKLl9O5IcWW35Nb6t3dSRuw=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=RI9jF3lNypUoCNwwj+cv6IZalJlzPlNRU1H1mYiVRxN8vLWcuA+T9Wqzi2DCP0oA9
	 cZgFl3lIQd3dbkiHHatfOQCXdKN9T26dEygYg5qY56um2rGUWYh2E4zevn1Z4ob04w
	 Ofrw7Dt84ji/Wx+ijXmD3+oPIferJRb5Yh4rhxYA=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 0/4] Initial support for Power
Date: Fri, 16 Jun 2023 12:47:59 -0500
Message-Id: <cover.1686936278.git.sanastasio@raptorengineering.com>
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

$ make XEN_TARGET_ARCH=3Dppc64 -C xen openpower_defconfig
$ make XEN_TARGET_ARCH=3Dppc64 SUBSYSTEMS=3Dxen -C xen build

The resulting binary can then be booted in a standard QEMU/pseries VM:

$ qemu-system-ppc64 -M pseries-5.2 -m 256M -kernel xen/xen \
	-vga none -serial mon:stdio -nographic

Thanks,
Shawn

--
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
 xen/arch/ppc/arch.mk                          |  12 ++
 xen/arch/ppc/configs/openpower_defconfig      |  13 ++
 xen/arch/ppc/include/asm/config.h             |  63 +++++++
 xen/arch/ppc/include/asm/page-bits.h          |   7 +
 xen/arch/ppc/ppc64/Makefile                   |   1 +
 xen/arch/ppc/ppc64/asm-offsets.c              |   0
 xen/arch/ppc/ppc64/head.S                     |  27 +++
 xen/arch/ppc/xen.lds.S                        | 172 ++++++++++++++++++
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


