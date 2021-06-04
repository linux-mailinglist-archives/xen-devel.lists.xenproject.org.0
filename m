Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8771539B041
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jun 2021 04:14:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136641.253259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lozLm-0004Ry-MF; Fri, 04 Jun 2021 02:14:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136641.253259; Fri, 04 Jun 2021 02:14:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lozLm-0004P3-Iw; Fri, 04 Jun 2021 02:14:18 +0000
Received: by outflank-mailman (input) for mailman id 136641;
 Fri, 04 Jun 2021 02:14:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sjsn=K6=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lozLk-0004Ox-79
 for xen-devel@lists.xenproject.org; Fri, 04 Jun 2021 02:14:16 +0000
Received: from mail-ot1-x329.google.com (unknown [2607:f8b0:4864:20::329])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5bc51c65-9bc6-4fe2-9a10-3823334f21a0;
 Fri, 04 Jun 2021 02:14:15 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 q9-20020a9d66490000b02903c741e5b703so6593905otm.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jun 2021 19:14:15 -0700 (PDT)
Received: from localhost.localdomain (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id a18sm179903oiy.24.2021.06.03.19.14.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 19:14:14 -0700 (PDT)
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
X-Inumbo-ID: 5bc51c65-9bc6-4fe2-9a10-3823334f21a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hgunR1rqgJO50MLCN5BCKZ0MZvL9Gm6nWA4qLEzbTig=;
        b=tXvwRqgGq7/qNl2XJTkhnLW73fGpB7vrch+1f8BrjC2+P/45bAsmHLZGBmPIqNLpPQ
         ENa/l5GLuUaJy7RMwEu/14bU1JnK7njvfQNb3nx+fryHd6uRrQQC9wzkbtPvWywslS9G
         Rq04iFVmMJNdGhZ1YYLfCGzPDwi15q8SK8cfu1+YmQZwll2CmcdOGKBO1Q53s7o8i4OO
         /9WX/4siVGfyoPTXTNIiDCC7iXu3umCI+WsE1vuePp7EuOtBH/mhyjF7uxKkUoy0Yily
         74a8BhYW2Wiqe5yYaVX6TtBQFpFlh5XzVrvaq6MNHxeaLA5laj1zakgGtIyhu+IVxi7W
         Xlkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hgunR1rqgJO50MLCN5BCKZ0MZvL9Gm6nWA4qLEzbTig=;
        b=sj4/rLBZCV6wxMyZx381cvl9a4vse13MFLT5XEF7F9ChFPQWUgSSViSHIATUhZoRrd
         bF6K2Meb//pENpRXfJkw46B4eWkXdo5Y/XU4N4hAvmJ2mGcG4vLY0Aka0IqCYvsqWKJW
         KFVQXB0Aw8PT2q+txP23fss9zVAXGi1QloFQbXWuE9zQw0jEWimua9oKkYoBUYhskObD
         iCLmTG91bbiwDU1lI4umWEcei6lyoytgcX6NR75K2WacyByg0g2/AyHWmDhh5iz5jpkc
         jtQf0hBozeqVPkSnsURZRPXGqwY0KBQwgklm67KjIsY4sF+wUFLLTM1L6SSqAhScjfQ+
         39zQ==
X-Gm-Message-State: AOAM531tHy7HYcnRFJHEiwjToTYrHXGliG07E9Rl6nlC2FoJE8UhUvkJ
	Zp6UO8QfLhaqCPW8Wfo6vflilwsXoFP/9w==
X-Google-Smtp-Source: ABdhPJy92YomF3LySIk2y5WOFLBGG0Dyv4tVlJeYV4sCld5dOCqH6+/XqGqJ0e+jQolKLyQRNwKihA==
X-Received: by 2002:a05:6830:4110:: with SMTP id w16mr1810147ott.372.1622772854408;
        Thu, 03 Jun 2021 19:14:14 -0700 (PDT)
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
	Wei Liu <wl@xen.org>,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v8 0/2] Minimal build for RISCV
Date: Thu,  3 Jun 2021 20:14:03 -0600
Message-Id: <cover.1622772299.git.connojdavis@gmail.com>
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
Changes since v7:
  - Default to y for RISCV_ISA_C Kconfig option (i.e. build Xen with
    compressed instructions by default)
  - Added Alistair to MAINTAINERS

Changes since v6:
  - Make sure patch versions are consistent

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

--
Connor Davis (2):
  xen/char: Default HAS_NS16550 to y only for X86 and ARM
  xen: Add files needed for minimal riscv build

 MAINTAINERS                             |  9 +++++
 config/riscv64.mk                       |  5 +++
 xen/Makefile                            |  8 +++--
 xen/arch/riscv/Kconfig                  | 48 +++++++++++++++++++++++++
 xen/arch/riscv/Kconfig.debug            |  0
 xen/arch/riscv/Makefile                 |  2 ++
 xen/arch/riscv/Rules.mk                 |  0
 xen/arch/riscv/arch.mk                  | 14 ++++++++
 xen/arch/riscv/configs/tiny64_defconfig | 13 +++++++
 xen/arch/riscv/riscv64/asm-offsets.c    |  0
 xen/arch/riscv/riscv64/head.S           |  6 ++++
 xen/drivers/char/Kconfig                |  1 +
 xen/include/asm-riscv/config.h          | 47 ++++++++++++++++++++++++
 13 files changed, 151 insertions(+), 2 deletions(-)
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


