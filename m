Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C76CE398DF5
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 17:09:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136076.252482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loSUQ-0001qP-Ub; Wed, 02 Jun 2021 15:09:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136076.252482; Wed, 02 Jun 2021 15:09:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loSUQ-0001oN-Q0; Wed, 02 Jun 2021 15:09:02 +0000
Received: by outflank-mailman (input) for mailman id 136076;
 Wed, 02 Jun 2021 15:09:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GNUT=K4=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1loSUO-0001oH-NK
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 15:09:00 +0000
Received: from mail-ot1-x32f.google.com (unknown [2607:f8b0:4864:20::32f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 805fb504-e35b-422f-be1e-aac25c62ca78;
 Wed, 02 Jun 2021 15:08:59 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 i14-20020a9d624e0000b029033683c71999so2704407otk.5
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jun 2021 08:08:59 -0700 (PDT)
Received: from localhost.localdomain (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id e29sm25287oiy.53.2021.06.02.08.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 08:08:58 -0700 (PDT)
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
X-Inumbo-ID: 805fb504-e35b-422f-be1e-aac25c62ca78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gs+XbRVRzJKHyIBh7bExJpJrDXDyPX5HL5ZlmfaOeUU=;
        b=R8Kb8U2IGsyeRYCVCjI4378u+B88OtvkcxLbL4UkwddYYiyiOLMsKAcpHhvHWygmYa
         MM0W7DZ0IcHkiPjXO38TFYFYwZzzi3CKPT+Jj2H7Uop5EleK3NKNklinn40EqNo/4CxM
         81CYvcCU76R6cy5ldimQm32x7FFd0dYejQrU4VOqrbDt5sX7MoSYNAbakbIO0dQiYx1D
         kyXbNP9kIeY+dyAbFmykEtIqiSJwlwII3CuZKnp71fcfHPDV3X19COX7N5OunMHyRriD
         Wgf++g0HUgjs7GnY/fhQWq40WA370Ypl7IIE+sd4ta5otSlIakfb8W9UunmKRa4s+HwN
         pk+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gs+XbRVRzJKHyIBh7bExJpJrDXDyPX5HL5ZlmfaOeUU=;
        b=YzoYdwNOC66WfiQflnNbzsjm/VzqCnKrdWqUYSZEANGbz6SdxubKfpQeUj2Tzjv3zD
         3RfIIoY5Gtl5FOEFHjsDs1PBB8XY5eEszcX7MofgI0Kvf5lHvNDj0IJ1mSb4RSVmN9Jx
         i6/znAn0Bev8sX8HyrFrqOAgXcjxFpGxuK3aFSXt2rgVY+ITF8e5tpuTZl/4XwcGiIsd
         CA/COC9XEfs+T64bitpy00wTTC02JkA0nWGRrQgRBlIGvzbdd4ENtXcbkNJUGzfsT3gi
         /JvdqRXR9vrDbjAKjKYm7IFyPNCspEzNgnDC1T679RHQRu7NWWUEglZGICxjS4fvSUu3
         ikGA==
X-Gm-Message-State: AOAM530TXYCqREXk5RWfATfkQeTBzwVaQcY73mVWnaQRnX0k9Ey/T3FB
	15IHXyFGoq9P8kLnXE0ptrq16+rnpk9g/Q==
X-Google-Smtp-Source: ABdhPJzxWCZ/lvb95Q3G8tRhCwxdkn2xfo2HB1obTY/+bDmrn7K9WmIkhs/xE3pIbyc5XYvGTyMG2A==
X-Received: by 2002:a05:6830:10b:: with SMTP id i11mr2860169otp.240.1622646539028;
        Wed, 02 Jun 2021 08:08:59 -0700 (PDT)
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
Date: Wed,  2 Jun 2021 09:08:26 -0600
Message-Id: <cover.1622645816.git.connojdavis@gmail.com>
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


