Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E89E69C1D5B
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 13:52:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832549.1247836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9OT5-0003zv-Q4; Fri, 08 Nov 2024 12:52:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832549.1247836; Fri, 08 Nov 2024 12:52:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9OT5-0003yc-Mr; Fri, 08 Nov 2024 12:52:03 +0000
Received: by outflank-mailman (input) for mailman id 832549;
 Fri, 08 Nov 2024 12:52:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pwxj=SD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1t9OT3-0003yG-Hr
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 12:52:01 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3dc19d59-9dd0-11ef-a0c6-8be0dac302b0;
 Fri, 08 Nov 2024 13:51:58 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-539fb49c64aso3028772e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 04:51:58 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ff179d1cd3sm6441261fa.94.2024.11.08.04.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 04:51:57 -0800 (PST)
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
X-Inumbo-ID: 3dc19d59-9dd0-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMmQiLCJoZWxvIjoibWFpbC1sZjEteDEyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjNkYzE5ZDU5LTlkZDAtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMDcwMzE4LjgyOTkwMywic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731070318; x=1731675118; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/KF/4uaLg9OGUJ36n8jOjIhEvlDeSBqlRVNpRQDpJbs=;
        b=ciPmbsfTqSCo7JcfY0mbWmNcTNN3CiUAHImNvvnrmtCRyuwJ1JwX4tMCmHwiCdGql2
         0UMDFyaYgdvF0zhWi0eMuiCTDaL76Li4mHjf+S1Ade/qGkdz9f9NLbCj4biMtcyQcvZ9
         UD9WVv+QmIC8N8lhxmOe8VFm9eXKytNaeNZQLQdP7OFZdeHkK9mRUwB+T/VB3k41qY8P
         LuM+v+xTFGUsyyT5PvDlKNVRjHU+cOkQXcYBZEb+f25zo+7CVy02X6RUPEwCidzQki1x
         011/st1tCnpLGpf6YQ0BCEDjITr6wGhwwmfBWNF0fbU0Jzp6/Sw0bqN3JAv/3GnpFFOg
         Htlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731070318; x=1731675118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/KF/4uaLg9OGUJ36n8jOjIhEvlDeSBqlRVNpRQDpJbs=;
        b=Lj5zgbrmXHhvoTNGo+8L/X5Eezt9YBkJL8rAJUGpf5gvMQTReiZKHvc7OnpllNzez4
         +2PCB/rcFCbeTIIzIy8W0D31sN/aPPmzG8PEgrMGrJdtFe0BvuRCJaDwCToclWcP6fj1
         X1pPcMs0VowrXVKEGo+6XZGis+pB+FATw3QOoPalnKM08WTIP53yntR8X6WGVIdE7ODb
         Zmq/9ZjJfs1xaY3Z7htmMl1BFfCU+Iy/TkGb5Gx1b92o9Tx+ykx1Mdc/qKfjZKCMp9q1
         0v0+NF9SxCD+wXXsdtc85HONCnvKs6f9VN5TIebdefGnHjpSxiEV5TABhbPAB6Apk8J9
         ymwg==
X-Gm-Message-State: AOJu0YzSvME9sZMEVQW9wnWUyxd9E6BwZyp8uCX4gzYTFrRWnzEExtvE
	rqZyjK7QsWLVm60jAO9sN0aMprWeE7f7+/vprBAJkc9KAsDVTsDdOSqqHQ64
X-Google-Smtp-Source: AGHT+IGAJUKMLuLRL7Lnd220yIKLpKMVZdrpEVRz9MwVzCVo/ULoMZelGU0dHajCGZaXVsPr7TMkdA==
X-Received: by 2002:a2e:a58c:0:b0:2fa:c0c2:d311 with SMTP id 38308e7fff4ca-2ff20162607mr25520611fa.5.1731070317607;
        Fri, 08 Nov 2024 04:51:57 -0800 (PST)
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
Subject: [PATCH v4 0/3] Setup memory management for RISC-V
Date: Fri,  8 Nov 2024 13:51:51 +0100
Message-ID: <cover.1731069334.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Finish initializing the memory subsystem by mapping the direct map and
frame table.

The frametable_virt_start variable is introduced with substracting
of an offest ( taking into account that RAM start could be not 0 ) to save
virtual address space of FRAMETABLE. Also it simplifies the
calculations and thereby improves performance for page_to_mfn(), mfn_to_page()
as there is no frametable_base_pdx or frametable_base_mfn ( if CONFIG_PDX_COMPRESSION=n);

The directmap_virt_start is introduced and shifted lower in the VA space to
(DIRECTMAP_VIRT_START - masked_low_bits_of_ram_start_address) to avoid
wasting a large portion of the directmap space, this also allows for simple
VA <-> PA translations. Also aligns DIRECTMAP_VIRT_START to a GB boundary
(for Sv39; for other MMU mode boundaries will be bigger ) by masking the
higher bits of the RAM start address to enable the use of superpages in
map_pages_to_xen().

In addition, initialize the VMAP_DEFAULT region, finalize the boot allocator,
and update the system state from early_boot to boot.

Introduce share_xen_page_with_guest() to deal with linkage error which occurs
because of DCE:
  riscv64-linux-gnu-ld: prelink.o: in function `tasklet_kill':
  /build/xen/common/tasklet.c:176: undefined reference to
     `share_xen_page_with_guest'
  riscv64-linux-gnu-ld: ./.xen-syms.0: hidden symbol `share_xen_page_with_guest'
    isn't defined riscv64-linux-gnu-ld: final link failed: bad value

The function maddr_to_virt() is introduced as part of this patch series.

virt_to_maddr() is updated as it is started to use direct_virt_start which is
introduced in this patch series.

---
Changes in V4:
 - Rebase on top of current staging.
 - Fix issues with setup_frametable_mappings() and setup_directmap_mappings().
 - Drop unnecessary local variables.
 - Minor log messsages fixes.
---
Changes in V3:
 - Update the cover letter message as DIRECTMAP connected things were changed.
 - Update setup_mm(), setup_{directmap,frametable}_mappings.
 - Introduce ROUNDDOWN in <xen/macros.h>
 - All other details please look at the specific patch.
---
Changes in V2:
 - update the cover letter message.
 - merge first 3 patches to "introduce setup_mm()" patch as after setup_mm()
   rework all the things in first two patches of v1 started to use changes
   introduced in "introduce setup_mm()" patch.
 - add Acked-by for some patch series.
 - All other details please look at the specific patch.
---

Oleksii Kurochko (3):
  xen/riscv: introduce setup_mm()
  xen/riscv: initialize the VMAP_DEFAULT virtual range
  xen/riscv: finalize boot allocator and transition to boot state

 xen/arch/riscv/include/asm/mm.h    |  19 ++--
 xen/arch/riscv/include/asm/setup.h |   2 +
 xen/arch/riscv/mm.c                | 154 +++++++++++++++++++++++++++--
 xen/arch/riscv/pt.c                |   6 ++
 xen/arch/riscv/setup.c             |  14 +++
 xen/include/xen/macros.h           |   1 +
 6 files changed, 184 insertions(+), 12 deletions(-)

-- 
2.47.0


