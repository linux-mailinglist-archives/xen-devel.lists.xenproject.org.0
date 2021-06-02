Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5566D399648
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jun 2021 01:21:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136249.252700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loaAQ-0002Be-BU; Wed, 02 Jun 2021 23:20:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136249.252700; Wed, 02 Jun 2021 23:20:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loaAQ-00029n-8I; Wed, 02 Jun 2021 23:20:54 +0000
Received: by outflank-mailman (input) for mailman id 136249;
 Wed, 02 Jun 2021 23:20:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GNUT=K4=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1loaAO-00029h-7N
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 23:20:52 +0000
Received: from mail-oi1-x22c.google.com (unknown [2607:f8b0:4864:20::22c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ebae24f0-1fd1-4bb1-9410-f3a5064d362c;
 Wed, 02 Jun 2021 23:20:51 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id z3so4399670oib.5
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jun 2021 16:20:51 -0700 (PDT)
Received: from localhost.localdomain (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id h7sm306175oib.49.2021.06.02.16.20.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 16:20:50 -0700 (PDT)
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
X-Inumbo-ID: ebae24f0-1fd1-4bb1-9410-f3a5064d362c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a6gIdnq4s9ju4i8wDfgtjonCew0MtQBOOecfSAaR/Y8=;
        b=RDux5V6jT9p/Hdz3xcl1dmxCpdw5uqfFdfRYZx45QRkMXGmqoaW8V2mhwnKojSE2YS
         bPfl3XmhOF5UG+CVo99IsxSqZxZxWH5hKkBtLtwTX4oJKRUAtxkzCA0jzPg4I4xqS7q9
         FxLPT/J3damlNVOxT9Kv/R+yiccHgBeOVx5Q6+zj5iy1Z9gQ+29kOHGDiPVPVxywb9TA
         ECq51qyLqK07TcRISD1UnCyxk4DJTgy7MBoEYzQoOIn0TIhQDrqd6HKGymmtwlKdRFff
         /iOLrDFUhY8JcvxScMGxPpHKa5w9u9Dlkm6TvevqgIy7EQIe7EJ/eBgHJrfVIwHrmn2H
         HyVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a6gIdnq4s9ju4i8wDfgtjonCew0MtQBOOecfSAaR/Y8=;
        b=c7Y7r00jP+C/GNxeeWMeLiu4qKndd1wfolHyQmahx2f3WI0Jwm7JrU0ElrO2WJpdzR
         eSsKMJIWStL149o5AuhrwPvIyho4S4/sLrg3xDOnm6Cx3ZMiZGBEFLydJ4ifMdKOXmcq
         g4Aa9Fn8GHxxPiIx4EJ+SAvRvOh33GtmcFRRjKs7mBXZjds4nxQe1N1DhMMu0qT0Vig0
         i18O7H3siVpSFLCAcf+vLYVc0Y2tYY8FP/hN3pYmus3gvggcWLZx3w9aldr/I0XZJNsN
         ZHIxgPCkeBv3a7CkZwgrj8r9nZnHtZBH0IEj3uxPME7mfyRv8loVcEKrsqhn3DiUv5JE
         +z0w==
X-Gm-Message-State: AOAM532V2pOtCf5/K2ptOTVCIg3nf2fA7WhHZjWne6S475HbAnwwl0IR
	6zVgfvaD2e7e9R39bDatHTDpAE3mxUgrIw==
X-Google-Smtp-Source: ABdhPJwgTETcQMos9JHgGva4urfC/93gH77w5U6X2lN6Sfnb2Ii1cOhr9ExkECAkCLudW77bkgaAAQ==
X-Received: by 2002:aca:5dc6:: with SMTP id r189mr5575738oib.164.1622676050576;
        Wed, 02 Jun 2021 16:20:50 -0700 (PDT)
From: Connor Davis <connojdavis@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair23@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 0/2] Minimal build for RISCV
Date: Wed,  2 Jun 2021 17:20:43 -0600
Message-Id: <cover.1622675569.git.connojdavis@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This series introduces a minimal build for RISCV. It is based on Bobby's
previous work from last year[0] rebased onto current Xen.

This series provides the patches necessary to get a minimal build
working. The build is "minimal" in the sense that it only supports
building TARGET=riscv64/head.o. The arch/riscv/riscv64/head.S is just
a simple while(1).

The first patch is a mod to non-RISCV bits that enable building a
config with !CONFIG_HAS_NS16550.

The second patch adds the make/Kconfig boilerplate alongside head.S and
asm-riscv/config.h (head.S references ENTRY that is defined in
asm-riscv/config.h).

[0] https://lore.kernel.org/xen-devel/cover.1579615303.git.bobbyeshleman@gmail.com/

Thanks,
Connor

--
Changes since v5:
  - Added missing A-by from Jan to patch 1

Changes since v4:
  - Dropped patches 2 and 4 as these have been applied
  - Moved arch/riscv/head.S to arch/riscv/riscv64/head.S for consistency
    with ARM.
  - Added Bob and myself to MAINTAINERS

Changes since v3:
  - Dropped "xen: Fix build when !CONFIG_GRANT_TABLE" since this was
    applied by Jan
  - Adjusted Kconfig condition for building NS16550
  - Use bool rather than bool_t
  - Removed riscv memory map, as this should probably be done later once
    the frametable size is figured out
  - Consolidated 64-bit #defines in asm-riscv/config.h
  - Renamed riscv64_defconfig to tiny64_defconfig, added CONFIG_DEBUG
    and CONFIG_DEBUG_INFO
  - Fixed logic/alignment/whitespace issues in Kconfig files
  - Use upstream archlinux riscv64 cross-compiler packages instead of
    custom built toolchain in docker container

Changes since v2:
  - Reduced number of riscv files added to ease review

Changes since v1:
  - Dropped "xen/sched: Fix build when NR_CPUS == 1" since this was
    fixed for 4.15
  - Moved #ifdef-ary around iommu_enabled to iommu.h
  - Moved struct grant_table declaration above ifdef CONFIG_GRANT_TABLE
    instead of defining an empty struct when !CONFIG_GRANT_TABLE
--
Connor Davis (2):
  xen/char: Default HAS_NS16550 to y only for X86 and ARM
  xen: Add files needed for minimal riscv build

 MAINTAINERS                             |  8 +++++
 config/riscv64.mk                       |  5 +++
 xen/Makefile                            |  8 +++--
 xen/arch/riscv/Kconfig                  | 47 +++++++++++++++++++++++++
 xen/arch/riscv/Kconfig.debug            |  0
 xen/arch/riscv/Makefile                 |  2 ++
 xen/arch/riscv/Rules.mk                 |  0
 xen/arch/riscv/arch.mk                  | 14 ++++++++
 xen/arch/riscv/configs/tiny64_defconfig | 13 +++++++
 xen/arch/riscv/riscv64/asm-offsets.c    |  0
 xen/arch/riscv/riscv64/head.S           |  6 ++++
 xen/drivers/char/Kconfig                |  1 +
 xen/include/asm-riscv/config.h          | 47 +++++++++++++++++++++++++
 13 files changed, 149 insertions(+), 2 deletions(-)
 create mode 100644 config/riscv64.mk
 create mode 100644 xen/arch/riscv/Kconfig
 create mode 100644 xen/arch/riscv/Kconfig.debug
 create mode 100644 xen/arch/riscv/Makefile
 create mode 100644 xen/arch/riscv/Rules.mk
 create mode 100644 xen/arch/riscv/arch.mk
 create mode 100644 xen/arch/riscv/configs/tiny64_defconfig
 create mode 100644 xen/arch/riscv/riscv64/asm-offsets.c
 create mode 100644 xen/arch/riscv/riscv64/head.S
 create mode 100644 xen/include/asm-riscv/config.h

-- 
2.31.1


