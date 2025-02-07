Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD1DA2D037
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 23:01:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884033.1293853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgWPm-0003jH-2g; Fri, 07 Feb 2025 22:01:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884033.1293853; Fri, 07 Feb 2025 22:01:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgWPl-0003h8-RQ; Fri, 07 Feb 2025 22:01:33 +0000
Received: by outflank-mailman (input) for mailman id 884033;
 Fri, 07 Feb 2025 22:01:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iVmI=U6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tgWPk-0002Xy-C3
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 22:01:32 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16c9c6d2-e59f-11ef-a073-877d107080fb;
 Fri, 07 Feb 2025 23:01:31 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4361f796586so30590035e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Feb 2025 14:01:31 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dcb4410e6sm2636035f8f.8.2025.02.07.14.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 14:01:30 -0800 (PST)
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
X-Inumbo-ID: 16c9c6d2-e59f-11ef-a073-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738965691; x=1739570491; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfG9trKHavRcKvwS/VVPSA81k4RxaNBZQMG2LYDMpWI=;
        b=K0mZfp9e5F/zJZvFVpvgCkNnqqvzdHkMBqKdqE1+fgwswcHSxrFamxVlFTVc5Nuf6a
         bBGpEkEHw982QhSt9ZgbLwjVGQ9bx5CQ+loQuXFVBqY3hKsL/8mp6MF2w9T2Wvm4vIrg
         Ipdq71RkOsHHcl5/dhWom/X21ri8DPfynpJes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738965691; x=1739570491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kfG9trKHavRcKvwS/VVPSA81k4RxaNBZQMG2LYDMpWI=;
        b=wozA9iL2PkXgnwYabB13H63wdIMfkC/hg6gY+W3lzMILW+vQAAS6yvRuwCiBuh1JZ9
         f4MgZooD/elmC7IWBFNnIqpt4HmzIPruq+XpFL6Kegv7B2orn4TVsPE6nvYITlOLLo5T
         mdY7oqGtVmfOsWUvl693pVwsYfugzqvigR4UEDteyN8gHaK3io08Joq55NdY0+KwG7mw
         fl1kpQvgfJFqMzpMOJNm521cZLav1vMrGdEeZUHylIFzSqR54zNTldUU0Kq7+yNN0KhQ
         URRAoXXAkjK5vffqv+j/MBOPJ0Axeujv6IWZ+J7qYrZpzhmLZw5iQDcX5iXL2RE4YS32
         X77g==
X-Gm-Message-State: AOJu0YzlJDq2icwRhH0uxXyJVHFSPnLKGyxC75+J6psyU6zfKWh7nR4l
	KONHu1ziLcMnqIQyT/5qSbh4KdLnci1b7Xqfu7Pu3dhs0D01QcmwjvudEDwbkWGsLaDG8CDBXXL
	ljIk=
X-Gm-Gg: ASbGncsipvJn5TPNAfMCY4MIJyK8SypSnDzjGvZWu4UD5HdgEFsJJCAGjiRVMqXTGQx
	OIo2kjXQ87fIYwSisDbXTfGNP6WqWjSR5RXkQ9sAEKTuRDJo3ziCnakl9SH2H4w5rDVYiT3mTHS
	oKR1R/2byFNrmclUnHuM7CQE0cf6biZSA2Y+L7krynSzUsTAxVBaq7b1KzvcIA9CR7sC2XrAs/P
	H6q8pGpd28Y6KB/j3Bo5GFJXtSO1WvF5PMvIKWbX0CldmU7ErRvGjIKcRpZ+cn1Wk9PeM8MmaXf
	lr2soId3InZlW4T4/G44VWR5oURdz+scsbxPVwz85Hr0BWyXEhyB1gq85QBJ5dESuPxUPRo=
X-Google-Smtp-Source: AGHT+IFMeb1xIgUoExL3m08kh1+6dB+Yq92/eIA06TW9jBXgI9MFI0HbboQ4NIu32Ar6TdXigzEeHQ==
X-Received: by 2002:a05:600c:384c:b0:434:fddf:5c0c with SMTP id 5b1f17b1804b1-4392497d1d9mr51086985e9.4.1738965690955;
        Fri, 07 Feb 2025 14:01:30 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.20 2/3] RISCV/asm: Use CALL rather than JAL
Date: Fri,  7 Feb 2025 22:01:21 +0000
Message-Id: <20250207220122.380214-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250207220122.380214-1-andrew.cooper3@citrix.com>
References: <20250207220122.380214-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

JAL has a maximium displacement of 2M.  To branch further, it needs pairing
with an AUIPC instruction.  CALL is a pseudo-op which allows the linker to
pick the appropriate sequence while processing relaxations.

This avoids a build failure of the form:

  prelink.o: in function `start':
  xen/xen/arch/riscv/riscv64/head.S:28:(.text.header+0x2c):
  relocation truncated to fit: R_RISCV_JAL against symbol `calc_phys_offset' defined in .init.text section in prelink.o
  make[3]: *** [arch/riscv/Makefile:18: xen-syms] Error 1

when Xen gets large enough, e.g. with CONFIG_UBSAN enabled.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/arch/riscv/entry.S        |  2 +-
 xen/arch/riscv/riscv64/head.S | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/arch/riscv/entry.S b/xen/arch/riscv/entry.S
index bf974655f8b3..4db818ba8d24 100644
--- a/xen/arch/riscv/entry.S
+++ b/xen/arch/riscv/entry.S
@@ -49,7 +49,7 @@ save_to_stack:
         REG_S   t0, CPU_USER_REGS_SSTATUS(sp)
 
         mv      a0, sp
-        jal     do_trap
+        call    do_trap
 
 restore_registers:
         /* Restore stack_cpu_regs */
diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
index 2a1b3dad9191..9c40512e612e 100644
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -28,7 +28,7 @@ FUNC(start)
         add     t3, t3, __SIZEOF_POINTER__
         bltu    t3, t4, .L_clear_bss
 
-        jal     reset_stack
+        call    reset_stack
 
         /*
          * save hart_id ( bootcpu_id ) and dtb_base as a0 and a1 register can
@@ -37,16 +37,16 @@ FUNC(start)
         mv      s0, a0
         mv      s1, a1
 
-        jal     calc_phys_offset
+        call    calc_phys_offset
         mv      s2, a0
 
-        jal     setup_initial_pagetables
+        call    setup_initial_pagetables
 
         /* Calculate proper VA after jump from 1:1 mapping */
         la      a0, .L_primary_switched
         sub     a0, a0, s2
 
-        jal     turn_on_mmu
+        call    turn_on_mmu
 
 .L_primary_switched:
         /*
@@ -54,11 +54,11 @@ FUNC(start)
          * recalculated after jump from 1:1 mapping world as 1:1 mapping
          * will be removed soon in start_xen().
          */
-        jal     reset_stack
+        call    reset_stack
 
         /* Xen's boot cpu id is equal to 0 so setup TP register for it */
         li      a0, 0
-        jal     setup_tp
+        call    setup_tp
 
         /* restore hart_id ( bootcpu_id ) and dtb address */
         mv      a0, s0
-- 
2.39.5


