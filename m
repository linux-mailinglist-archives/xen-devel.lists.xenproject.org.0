Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AFC9A052E
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 11:16:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819721.1233138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t108S-0004te-QI; Wed, 16 Oct 2024 09:16:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819721.1233138; Wed, 16 Oct 2024 09:16:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t108S-0004rH-NW; Wed, 16 Oct 2024 09:16:04 +0000
Received: by outflank-mailman (input) for mailman id 819721;
 Wed, 16 Oct 2024 09:16:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8GJ6=RM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1t108R-0004r9-Uf
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 09:16:03 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43978698-8b9f-11ef-99a3-01e77a169b0f;
 Wed, 16 Oct 2024 11:16:02 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-539f4d8ef84so3915211e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Oct 2024 02:16:02 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a000129eesm391451e87.259.2024.10.16.02.15.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2024 02:16:00 -0700 (PDT)
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
X-Inumbo-ID: 43978698-8b9f-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729070161; x=1729674961; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y6sPmoPpNtnsgzor6EgPdSMEs7XQH87dyj1gXZXnBDA=;
        b=J36hoA0xx9Jx8ZVnt/WWsOTlqHjRaR/Z1vHMK1P7J146XzAw6HI8BnmSC9UvrPWINX
         dYU4dZED/cifu/k2PcBtud1PEoDd8rZeTJurgh6jn6KR7IUaP4dP38FOWxIcOG0DIBNr
         kPCqGgQ4/AFPC04JAw/RPM1rXkhsR2B0Dw/TO84Yfb+9/LLOCzt+4JpxlbAly/DSSWWi
         ffUjgH4kZV9mYYFWLNOA3c8C4PxDb6/8ulnEElXT/qAnT1QvUXhsusXLm202RCv5N8PV
         lxEiy56BDuRVnqH29xpkt4cVUYaODvXTPFSRPWQqHbDpq1F5B24FQujwqSQkLIRB3YVw
         +H4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729070161; x=1729674961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y6sPmoPpNtnsgzor6EgPdSMEs7XQH87dyj1gXZXnBDA=;
        b=jUmGyuVc3xnkV/d3SBYsEIO1fHNA9K0EG2OpQlc5MsnU97tYIJQmOlTX5NTImQgLzz
         fvvFrPI9LaVAx4PmJZoCQjRwxo47NeOjjLqjGrzv0HSpz6i9kkLqDX+6YrGogi7/cbOW
         18LP+FBQzGH4pCJhHw/531ZlmingfYAzliR+ACk7MET9WanzdbKNJ/d2rxcG9hdiUPFP
         51/qt75gBM+/eq8E7WKym2Ftw5R+8UFO3vFTl1j7GquLPX/MUuHVstrHsK0cFsFMrx7F
         g2b0eb8zocr3PyQTLRJAiGT6hpP1VvCP5t9X30cHGyQPHJ8Qf7cIGq+QIQnwwt9GPGM/
         ZGng==
X-Gm-Message-State: AOJu0YxLvnNYJcYMvcw+e4aYLLAHNWj3Pep+/rQEAQsqw0hmdPgtL/pG
	RcV2pQ2WfgW+xkp82KdBNjXIgPijZ6jp7TIcTaoyh41vkf+ZbncUX4n34w==
X-Google-Smtp-Source: AGHT+IH9SK6SYJr/C80Mo++zt24odGnIGsc4pOVXsEenW1aPXY81AX2LB9YSbJgFFcLWdp21xtxPjQ==
X-Received: by 2002:a05:6512:3f29:b0:539:ee04:2321 with SMTP id 2adb3069b0e04-539ee0424e1mr5635599e87.33.1729070160458;
        Wed, 16 Oct 2024 02:16:00 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 0/5] Setup memory management
Date: Wed, 16 Oct 2024 11:15:52 +0200
Message-ID: <cover.1729068334.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Finish initializing the memory subsystem by mapping the direct map and
frame table.
In the case of RISC-V 64, which has a large virtual address space
(the minimum supported MMU mode is Sv39, providing TB of VA space),
the direct map and frame table are mapped starting from physical address
0. This simplifies the calculations and thereby improves performance for
page_to_mfn(), mfn_to_page(), and maddr_to_virt(), as there is no
need to account for {directmap, frametable}_base_pdx.
In addition, initialize the VMAP_DEFAULT region, finalize the boot allocator,
and update the system state from early_boot to boot.

Also, after patch 3 ("xen/riscv: introduce setup_mm()") of this patch series,
the linkage error mentioned in patch 1 ("xen/riscv: add stub for
share_xen_page_with_guest()") began to occur, so patch 1 addresses this issue.

The function maddr_to_virt() is introduced as part of this patch series, as
setup_directmap_mappings() uses it indirectly through mfn_to_virt().

Oleksii Kurochko (5):
  xen/riscv: add stub for share_xen_page_with_guest()
  xen/riscv: implement maddr_to_virt()
  xen/riscv: introduce setup_mm()
  xen/riscv: initialize the VMAP_DEFAULT virtual range
  xen/riscv: finalize boot allocator and transition to boot state

 xen/arch/riscv/include/asm/mm.h    |  10 ++-
 xen/arch/riscv/include/asm/setup.h |   2 +
 xen/arch/riscv/mm.c                | 104 +++++++++++++++++++++++++++--
 xen/arch/riscv/pt.c                |   6 ++
 xen/arch/riscv/setup.c             |  14 ++++
 xen/arch/riscv/stubs.c             |  10 +++
 6 files changed, 138 insertions(+), 8 deletions(-)

-- 
2.47.0


