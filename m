Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BF1333A74
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 11:44:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95961.181253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJwJk-00036v-72; Wed, 10 Mar 2021 10:43:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95961.181253; Wed, 10 Mar 2021 10:43:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJwJj-00036G-W1; Wed, 10 Mar 2021 10:43:51 +0000
Received: by outflank-mailman (input) for mailman id 95961;
 Wed, 10 Mar 2021 10:43:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iqsa=II=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1lJwJi-000348-Rg
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 10:43:50 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 2db8e24c-9196-4e4e-9cc0-77a7fde17faf;
 Wed, 10 Mar 2021 10:43:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B51C01063;
 Wed, 10 Mar 2021 02:43:42 -0800 (PST)
Received: from e123311-lin.arm.com (unknown [10.57.15.227])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C1DD73F85F;
 Wed, 10 Mar 2021 02:43:41 -0800 (PST)
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
X-Inumbo-ID: 2db8e24c-9196-4e4e-9cc0-77a7fde17faf
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	andrew.cooper3@citrix.com,
	amc96@cam.ac.uk
Subject: [XTF 0/4] Port XTF to arm64 and arm32
Date: Wed, 10 Mar 2021 11:43:31 +0100
Message-Id: <20210310104335.14855-1-michal.orzel@arm.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The goal of this patch series is to make the first step in porting
XTF to arm64 and arm32, whereby the emphasis is on arm64.
The attempt to port XTF to arm64 was originally started by Julien Grall.
The series contains:

Patch 1 performs miscellaneous code cleanup related to headers
that should be architecture independent.

Patch 2 modifies the XTF build system to be able to support multiple
architectures as the current build system is strictly made up for x86.
This is done by generalizing the common makefiles to be architecture
independent and creating architecture specific makefiles.

Patch 3 adds the initial support for arm64/arm32 by providing minimal
set of architecture specific files. Some of them are just dummy files
waiting to be properly implemented later on. This creates a base for
further implementation.

Patch 4 adds the build system support for arm64/arm32 and updates the
documentation. On arm64 one test is supported tests/example allowing
the startup code to be executed. On arm32 currently no test is supported.

Michal Orzel (4):
  xtf: Perform misc code cleanup
  build: Modify build system to support multiple architectures
  arm: Add initial architecture code for arm64 and arm32
  arm: Add build support for arm64/arm32

 .gitignore                            |   2 +-
 INSTALL                               |  18 +
 Makefile                              |  23 +-
 README                                |   7 +
 arch/arm/arm32/head.S                 |   0
 arch/arm/arm64/cache.S                |  23 ++
 arch/arm/arm64/head.S                 |  90 +++++
 arch/arm/decode.c                     |  25 ++
 arch/arm/include/arch/arm32/regs.h    |  73 +++++
 arch/arm/include/arch/arm64/regs.h    | 100 ++++++
 arch/arm/include/arch/asm_macros.h    |  21 ++
 arch/arm/include/arch/barrier.h       |  41 +++
 arch/arm/include/arch/bitops.h        |  45 +++
 arch/arm/include/arch/config.h        |  37 +++
 arch/arm/include/arch/desc.h          |  16 +
 arch/arm/include/arch/div.h           |  35 ++
 arch/arm/include/arch/extable.h       |  19 ++
 arch/arm/include/arch/hypercall.h     |  39 +++
 arch/arm/include/arch/page.h          |  23 ++
 arch/arm/include/arch/regs.h          |  25 ++
 arch/arm/include/arch/traps.h         |  22 ++
 arch/arm/include/arch/xtf.h           |  17 +
 arch/arm/link.lds.S                   |  58 ++++
 arch/arm/setup.c                      |  28 ++
 arch/arm/traps.c                      |  22 ++
 arch/x86/include/arch/asm_macros.h    |   2 +
 arch/x86/include/arch/traps.h         |   1 -
 build/arm-common-files.mk             |  14 +
 build/arm32/arch-common.mk            |   8 +
 build/arm32/arch-files.mk             |   7 +
 build/arm32/arch-tests.mk             |   4 +
 build/arm64/arch-common.mk            |  15 +
 build/arm64/arch-files.mk             |   7 +
 build/arm64/arch-tests.mk             |   4 +
 build/common.mk                       |  49 ++-
 build/gen.mk                          |  22 +-
 build/x86/arch-common.mk              |  34 ++
 build/{files.mk => x86/arch-files.mk} |  12 +-
 config/default-arm.cfg.in             |   6 +
 docs/introduction.dox                 |  16 +-
 docs/mainpage.dox                     |  34 +-
 include/xen/arch-arm.h                | 452 ++++++++++++++++++++++++++
 include/xen/xen.h                     |   2 +
 include/xtf/asm_macros.h              |   2 +-
 include/xtf/barrier.h                 |   4 -
 include/xtf/hypercall.h               |  81 +++--
 include/xtf/lib.h                     |   9 +-
 include/xtf/traps.h                   |   2 +
 48 files changed, 1502 insertions(+), 94 deletions(-)
 create mode 100644 arch/arm/arm32/head.S
 create mode 100644 arch/arm/arm64/cache.S
 create mode 100644 arch/arm/arm64/head.S
 create mode 100644 arch/arm/decode.c
 create mode 100644 arch/arm/include/arch/arm32/regs.h
 create mode 100644 arch/arm/include/arch/arm64/regs.h
 create mode 100644 arch/arm/include/arch/asm_macros.h
 create mode 100644 arch/arm/include/arch/barrier.h
 create mode 100644 arch/arm/include/arch/bitops.h
 create mode 100644 arch/arm/include/arch/config.h
 create mode 100644 arch/arm/include/arch/desc.h
 create mode 100644 arch/arm/include/arch/div.h
 create mode 100644 arch/arm/include/arch/extable.h
 create mode 100644 arch/arm/include/arch/hypercall.h
 create mode 100644 arch/arm/include/arch/page.h
 create mode 100644 arch/arm/include/arch/regs.h
 create mode 100644 arch/arm/include/arch/traps.h
 create mode 100644 arch/arm/include/arch/xtf.h
 create mode 100644 arch/arm/link.lds.S
 create mode 100644 arch/arm/setup.c
 create mode 100644 arch/arm/traps.c
 create mode 100644 build/arm-common-files.mk
 create mode 100644 build/arm32/arch-common.mk
 create mode 100644 build/arm32/arch-files.mk
 create mode 100644 build/arm32/arch-tests.mk
 create mode 100644 build/arm64/arch-common.mk
 create mode 100644 build/arm64/arch-files.mk
 create mode 100644 build/arm64/arch-tests.mk
 create mode 100644 build/x86/arch-common.mk
 rename build/{files.mk => x86/arch-files.mk} (86%)
 create mode 100644 config/default-arm.cfg.in
 create mode 100644 include/xen/arch-arm.h

-- 
2.29.0


