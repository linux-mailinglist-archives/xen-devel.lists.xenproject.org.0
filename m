Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1112239966B
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jun 2021 01:38:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136279.252744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loaRO-0005bl-Ne; Wed, 02 Jun 2021 23:38:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136279.252744; Wed, 02 Jun 2021 23:38:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loaRO-0005ZP-JN; Wed, 02 Jun 2021 23:38:26 +0000
Received: by outflank-mailman (input) for mailman id 136279;
 Wed, 02 Jun 2021 23:38:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GNUT=K4=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1loaRM-0005ZJ-Mm
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 23:38:24 +0000
Received: from mail-oi1-x236.google.com (unknown [2607:f8b0:4864:20::236])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dce48131-09a5-4356-be9d-2d4aa59caabb;
 Wed, 02 Jun 2021 23:38:23 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id u11so4459092oiv.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jun 2021 16:38:23 -0700 (PDT)
Received: from localhost.localdomain (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id z15sm301633otp.20.2021.06.02.16.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 16:38:22 -0700 (PDT)
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
X-Inumbo-ID: dce48131-09a5-4356-be9d-2d4aa59caabb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=85KPCJRDket6J5WaevzvN9WntHNCxbXkPkfTLkLbIWw=;
        b=ILt2LJXPmDifrF/NE1OgmCB1n5Pbw/1VjGPNgycVf0ZSzAPKT9sjpExW3Ho+HjLRLE
         iuR7oLxUoUydCS+PVSmFxN8w8lo0hlAuzpAeYWS2WZ4INrB2lYU1nP+fkrseuJFxv6RV
         6lzBWkBGbAxUo/1bnkq7sZdciR/ZvSOf5ozgx/gvwKtUBJXfEutMPjd8puh0s2g+xK/I
         0+a/xEX1TKU8WC47fs/we4F+vosZWDqhuy4gnZ87tPbMzUyDCLD+AXKPqpKQUV57u9Jn
         w3MPcJI4Qrcexpqb6MSluMLXlkQkLzJKQ9/wAgVtj4ED9DWiK/dVK6JkPLWp7uOvefwz
         zo9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=85KPCJRDket6J5WaevzvN9WntHNCxbXkPkfTLkLbIWw=;
        b=bI4BiolphmsuOT602TbxgYlAAbJcJNlQ5WFUrLOdVQ3KfeSkEwIsCW1FQiK18MiWi6
         iZoPaF68PI3fNWU7/IaJwxpFj3Iy2GauPIzadQDuC/poqvn/NL0HT+X2RuCPncX05OFM
         1i+/U6TzeV2nyhXpDqtdb/fXTZj8O5N7rW66OST247SHL+0ZUccjIIk5IQTr5PRUViQ4
         zrtZ57A+O5jcGi8Ea+kdnUTdGtsUsgN2dDf+zvBhmlzDzg2yBYKlGDiE6VMncT0T68Z1
         UO7J8maZgV1Bd0tUCW9a4rjpfKRJDdgbeh3h0l6Jf6cjYrC95ybwlXaK3nmBiOEIqKoS
         76zA==
X-Gm-Message-State: AOAM531qKCjLeDbzOqdL1lNHdRMQvTnHBm0LqZpGGWbrmqf9Ckv02XTE
	8Fj9v5Hvgl1vkG/k9aAHZIFrC4QzqmSg1A==
X-Google-Smtp-Source: ABdhPJzlF0vYZW61JokFIIoU9OrUEJ0HX2WAzsZzupHu8Bv2ozomKot9K2li+V3JLviBRjM8Ohy7WA==
X-Received: by 2002:aca:b506:: with SMTP id e6mr23465875oif.178.1622677102912;
        Wed, 02 Jun 2021 16:38:22 -0700 (PDT)
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
Subject: [PATCH v7 0/2] Minimal build for RISCV
Date: Wed,  2 Jun 2021 17:38:08 -0600
Message-Id: <cover.1622676439.git.connojdavis@gmail.com>
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


