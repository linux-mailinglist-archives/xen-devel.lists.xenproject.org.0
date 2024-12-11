Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4369ED36C
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 18:28:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855078.1268124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLQVF-0007XX-CN; Wed, 11 Dec 2024 17:28:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855078.1268124; Wed, 11 Dec 2024 17:28:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLQVF-0007SF-7L; Wed, 11 Dec 2024 17:28:01 +0000
Received: by outflank-mailman (input) for mailman id 855078;
 Wed, 11 Dec 2024 17:28:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ntru=TE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tLQVE-0007J6-Ab
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 17:28:00 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43d25905-b7e5-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 18:27:58 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-aa6aad76beeso285149566b.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 09:27:58 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa6656f306csm687297466b.61.2024.12.11.09.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 09:27:54 -0800 (PST)
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
X-Inumbo-ID: 43d25905-b7e5-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733938077; x=1734542877; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J7P8VV/ICo4pOSmR8O3bdkrRLWJ+hz7hoMbQD+Lhjrg=;
        b=lrcJnhX7+h9P4dIdX/ktKFB8hK38X8+lsVUDDb3+8kbuUuqW9OXcAVR0F86FNAj2Fr
         lJi9WWIDM8uwWpcLEw4pIAqyOQGPgeEIzX2fRTb8r4Lz76B41waRniDATBfLf/a63lwf
         bbLBZ7LaCKopKJQQwacJ0J0Az6pRVVBN1xYSIcMkZIH1e998gIwUXYbX6PcpDlGaF9Yb
         299NIDVyUCKoliDjmkrg30Y1kgUBH/6qm0SUlz1v/r2v2Y759RgdzXlXOiFjKMRsPeGK
         ZHLMY++Y/vaseVF3eBhcxGmVOYdHT/eISC7cAuLaSJnZdnyv2eRbJ2iBQhNbaLcQrJ6M
         iX7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733938077; x=1734542877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J7P8VV/ICo4pOSmR8O3bdkrRLWJ+hz7hoMbQD+Lhjrg=;
        b=WXh6iYSRo5k0dIGNce2tIe4Uv0xLVOJuPYPbque4cDHDy3ZnyzlaNyRYw1moHeczFA
         zbpTfQGvnVd+hoxXC1EtrWNmQ58hmbcb1zHAXrYVp3sgmxhY9INMW/K1jw+o/kbN0D6f
         6m6RmI28QaEYykkoz4hzxEVuf6dXaSjpTUqyWeTIxfw5OQW4sBQmAOdLQzeITnkNYLUl
         +2/QzyrXQzY5lCYgGzjp4mYuBsR8Wbkbf1IUOgWZ6UTvChTgEAZEFhUogtfTD8M2C3Xs
         g3mldUQxXFU7tGpWcffF6UOHtmeWGdlb14AsBxHqCIYujkgpn9T67cejHSXvIc5P9gPl
         hW6A==
X-Gm-Message-State: AOJu0YxD20s9Sc3EWqv+86YLoWBMa/h2/d8bjcMTcake+9VJuogtZrIT
	5KNsAir4WGV11yEQ0UB/45/rFbJbMmIjkCPvlNRkfeG3GLooMkvQSz+ZpuvI
X-Gm-Gg: ASbGncsZ6tgX/W9ED1dom7QHBwYlOBBg4+zktDjxoWctiNdhepN1XMozv45q8BfTDBa
	eKlwD3Qjuss/bshrgXVj2j/OzVu/YMDuqG1DmY23vMiXYl8op5paq4ChyLEqgiG6jgKR6L6/bVn
	lS/52CDCmeDYbz+jliO3bPwwmuo1SXqFga1xLmFmyIzCQc4E9s47lG/44J2uuNpS4HPIgKccjnX
	H8O3KtaLqRbpORHyaQyPYVwLfux6dZ0dIBmfCr4QxnQfhohfztSBEs=
X-Google-Smtp-Source: AGHT+IGh4LyOzhjdURZwplM/eh1WgTc0kQXLviziG8oET43C97XSN+E67K9zw2LBr1swdi0RI7eUNg==
X-Received: by 2002:a17:906:1db2:b0:aa6:8b4a:46a4 with SMTP id a640c23a62f3a-aa6b139782dmr385585866b.44.1733938074689;
        Wed, 11 Dec 2024 09:27:54 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/7] Unflattening and relocation of host device tree
Date: Wed, 11 Dec 2024 18:27:44 +0100
Message-ID: <cover.1733937787.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current patch series introduces the relocation of the host device tree file
to free up low memory and also it is expected that discard_initial_modules()
will be called sooner or later, it will discard the FDT boot module,
and remove_early_mappings() will destroy the early mappings.

In addition to relocation, unflattening is introduced to create the tree of
struct device_node for the host device tree.

To implement this, several things have been introduced:
 - destroy_xen_mappings() function, which removes page mappings from Xen's
   page tables. This is necessary for clear_fixmap().
 - {set,clear}_fixmap() functions to manage mappings in the fixmap region,
   which are expected to be used in copy_from_paddr() to copy the FDT to Xen's
   heap.
 - Introduce new config CONFIG_QEMU which is going to be used to cover changes
   connected to QEMU virtual board. It will be used during introduction of stubs
   for clean_and_invalidate_dcache_va_range() and clean_dcache_va_range(),
   which are expected to be used in copy_from_paddr() and flush_page_to_ram(),
   which in turn are expected to be used during the call to xvmalloc_array() in
   relocate_fdt().
   In case of QEMU cached related functions are implemented as returning 0 as
   QEMU doesn't model cache ( and so CMO extensions ). For others cases, it is
   introduced as -ENOSUPP as h/w could support CMO extension ( or hardware
   specific insertions ) and it will need to update implementation of the
   mentioned functions.
 - The introduction of copy_from_paddr() to copy the FDT to an address
   allocated in Xen's heap.

---
Changes in v2:
 - Update the cover letter.
 - Introduce new patch with aligning of upper bounds in the layout table in
   config.h with the definitions below which are inclusive.
 - Other changes please look at the specific patch.
---

Oleksii Kurochko (7):
  xen/riscv: update layout table in config.h
  xen/riscv: add destroy_xen_mappings() to remove mappings in Xen page
    tables
  xen/riscv: reorder includes in asm/page.h alphabetically
  xen/riscv: add {set,clear}_fixmap() functions for managing fixmap
    entries
  xen/riscv: implement data and instruction cache operations
  xen/riscv: implement prereq for DTB relocation
  xen/riscv: relocating and unflattening host device tree

 xen/arch/riscv/Kconfig                  |  2 +
 xen/arch/riscv/configs/tiny64_defconfig |  1 +
 xen/arch/riscv/include/asm/config.h     | 12 +++---
 xen/arch/riscv/include/asm/fixmap.h     |  5 +++
 xen/arch/riscv/include/asm/mm.h         |  8 +++-
 xen/arch/riscv/include/asm/page.h       | 34 +++++++++++++--
 xen/arch/riscv/include/asm/setup.h      |  4 ++
 xen/arch/riscv/mm.c                     |  6 ---
 xen/arch/riscv/platforms/Kconfig        |  5 +++
 xen/arch/riscv/pt.c                     | 25 +++++++++++
 xen/arch/riscv/setup.c                  | 57 ++++++++++++++++++++++++-
 11 files changed, 139 insertions(+), 20 deletions(-)
 create mode 100644 xen/arch/riscv/platforms/Kconfig

-- 
2.47.1


