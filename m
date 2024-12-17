Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C769F5119
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 17:33:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859434.1271561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNaVI-0001Kn-8L; Tue, 17 Dec 2024 16:33:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859434.1271561; Tue, 17 Dec 2024 16:33:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNaVI-0001JK-1r; Tue, 17 Dec 2024 16:33:00 +0000
Received: by outflank-mailman (input) for mailman id 859434;
 Tue, 17 Dec 2024 16:32:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BizT=TK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tNaVG-0001J8-EZ
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 16:32:58 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9235cb1a-bc94-11ef-99a3-01e77a169b0f;
 Tue, 17 Dec 2024 17:32:56 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-3022484d4e4so62054671fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 08:32:56 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30344175b51sm13179021fa.69.2024.12.17.08.32.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 08:32:54 -0800 (PST)
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
X-Inumbo-ID: 9235cb1a-bc94-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734453175; x=1735057975; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qQ1Jpu2IsZiWCTua2C+dL8+BptfxS3kI/G4frKryoZc=;
        b=Am0KGd9Cm6NIfg+bWEZ9TVF7FhHduG/oZvM9ZgRMqhZA9aXmDIx1IzUT0KFhXq8XaI
         HqFL/1+GZ7m4P3+q4SIfdLx7ldvNEN3FEXMn8W1+IdeKK9zFT91qYFx5BljLjLBr5QF7
         Vhkys3fTe/SC7R1ESFRMb09uY/aRHk+zvmOSWaHp+5FeTAHWwMVdTKYQIyAZ/WCXdJ3+
         k90DZJiqgGBZHYoaOl/BQ8VvW7s+TnfgkABZalrHuItPtY6d7kRZo299c4zah3ZDTl1c
         sh2k1TysdblaSH7vLlJoXP/wtuWz+c5SQdyMUse5AQJe6EZ9Osq/mdXechBHViF19Mtc
         0Nag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734453175; x=1735057975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qQ1Jpu2IsZiWCTua2C+dL8+BptfxS3kI/G4frKryoZc=;
        b=k5io1p0DKEHx2uYDQjlyhVhf+DjRFq05jVGNTprzeYmCSdARL1kdYr+ZETLOcSWVRj
         BzX1uQSJqJ/MQVkuHR3yojpEOu7xLR/6aCz8Y4adnYmI8lMMPmCD2+5lbvtD2kawRKij
         lxC1IN1nS3j8f+jn8a7xUhRRfdKI0D9rEaADHSAv1BCOHdZT+sKxu43vrDEqCeIVGcQ6
         TGYQ25OUWhHpKYUlKybQplVeI/1PO3ZeERGJH6TaLxr5mX3QOAlQKl2X/pj09fBsD/vX
         eDgp3kfnAnBpjBs/D5a9WKFxDyuTVXB8+yY1VT58N6Lwhi5W7Z5EQx61aZ3OZMsqLLgi
         /Acg==
X-Gm-Message-State: AOJu0Yw4TWWTkzNrb35SbuuUlzAyQDZ6eWoZVUi2P5w4LIQwK409PJAK
	PTpecjoSILtXkdwD58awmFCl/wMB/oXBUT3xTjTX8zMmC8kMetObtszVn/3a
X-Gm-Gg: ASbGncsgK3Zb9+7M2UotSiGJFi3UHezwYxKnLLWkiXfVO5+3FOK3uGT87k3izybQnjq
	fjpprTfUYvMg0kcNLkpsNyoCmHDWFwpW/SIa8qXdANV/j76/N/gB2e+XqZ2CYtWLHG8Ew7be5/b
	29Kr2anCTb7Z9QCBPX0gqgO1+QrM+ZdBxGnkjyGjssGyuLe1gmY1FftZmzNwWTVarT23xD4K/Hs
	vF49Z/V2EJ8C+0kLi34Gn+IUhU+7nkuTSJwjwphR4o1tBZdro1/62O1rQ==
X-Google-Smtp-Source: AGHT+IEx5mKuaTIp0f/NUxy7CGoF69F5ttJGVEhyTkjyv6+W8SbcosR4ZgQ94kddHWDk890ezpHxUw==
X-Received: by 2002:a2e:a781:0:b0:300:377d:2c36 with SMTP id 38308e7fff4ca-30443580621mr13670581fa.40.1734453174885;
        Tue, 17 Dec 2024 08:32:54 -0800 (PST)
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
Subject: [PATCH v3 0/7] Unflattening and relocation of host device tree
Date: Tue, 17 Dec 2024 17:32:44 +0100
Message-ID: <cover.1734452721.git.oleksii.kurochko@gmail.com>
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
Changes in v3:
 - Add some Acks for the patches. All the patches are Acked except:
     [PATCH v3 1/7] xen/riscv: update layout table in config.h
     [PATCH v3 5/7] xen/riscv: implement data and instruction cache operations
 - Other changes please look at the specific patch.
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
 xen/arch/riscv/include/asm/page.h       | 36 ++++++++++++++--
 xen/arch/riscv/include/asm/setup.h      |  4 ++
 xen/arch/riscv/mm.c                     |  6 ---
 xen/arch/riscv/platforms/Kconfig        |  5 +++
 xen/arch/riscv/pt.c                     | 24 +++++++++++
 xen/arch/riscv/setup.c                  | 57 ++++++++++++++++++++++++-
 11 files changed, 140 insertions(+), 20 deletions(-)
 create mode 100644 xen/arch/riscv/platforms/Kconfig

-- 
2.47.1


