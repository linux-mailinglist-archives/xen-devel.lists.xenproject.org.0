Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05267A4A384
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 21:08:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.899113.1307585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to6ei-0006yD-4o; Fri, 28 Feb 2025 20:08:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 899113.1307585; Fri, 28 Feb 2025 20:08:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to6ei-0006vW-1V; Fri, 28 Feb 2025 20:08:20 +0000
Received: by outflank-mailman (input) for mailman id 899113;
 Fri, 28 Feb 2025 20:08:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2kAP=VT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1to6eg-0005OT-Ax
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 20:08:18 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be87250b-f60f-11ef-9898-31a8f345e629;
 Fri, 28 Feb 2025 21:08:15 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aaee2c5ee6eso356506866b.1
 for <xen-devel@lists.xenproject.org>; Fri, 28 Feb 2025 12:08:15 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf1d1a84b7sm267586566b.19.2025.02.28.12.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 12:08:13 -0800 (PST)
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
X-Inumbo-ID: be87250b-f60f-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740773294; x=1741378094; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zBq3WVBFsdmRZQQQyGw+/2J4204Qtmulox99R0cFeEw=;
        b=dVt4OEblHrHF2tZIKRuDWeQu5YT6Zqigm5/gGsTYcFxq1kBigDbvcOgFOEDlg/RJ4O
         MSslL//PG7urnBSE21e38E8o/KRWmsyDh343RaineUgPX9SoqiPaPNJPwgmwzuUkL5qx
         gs0OYa+YL5V8CpgBHyApPec+iIZcxvpBiCYg/5vnl078T1TFMZLa/yrcvWu1WPM6llVf
         sDKsVbOGxzi6Lk3xUjUYQd8ryJUQ2rjcY/zBV+BXUr4lvBM36VAGPaOFG6EOoDolTjRo
         eAsiG9UWuX7rIQjg6rVXYMGhAQESWCQx8L9YJIdsWv00oVscCpfLvLeKHaNp6DryFo3A
         hALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740773294; x=1741378094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zBq3WVBFsdmRZQQQyGw+/2J4204Qtmulox99R0cFeEw=;
        b=ZqyMrdw6KXckONeyjksWJOUVbQIdetMrk/2smEamVMUgcBiHNqd+tIHOwwMWd6UWkU
         AP6sAUz34YWq6Cn2At31wHX4583M17qW1h7Xck6ScrDpsUAEdxrksomOlGyleMf0nw27
         0eeaY19QIs6RuusGzULirgNG6yehFfmDkhKcT7aDpw5D0pm8LtMmYdtSw9+/MCR3CiHm
         wdcHLTzL68MXYXfrTQWNeb504oQXGCws82YOZwr3vM+jNJBKBNNhh0atvKczY02cln/C
         dD/i2vPVpqajNiyUJhktqTrlYmbyuSLV9K2FZJn/vbgywm6SrHQ3A4zCOYhexKTGWmzt
         /BuQ==
X-Gm-Message-State: AOJu0YzY/w+/G3QF49jm6WWl3FZ+gUM9nS8tqdTdEZdp9544nsamxZxo
	iXh+8Z4fNI8H9FBXuBZB5tX2vLo8v1X6dbt4x9ISqEpNkHdFYo3W+imIvQ==
X-Gm-Gg: ASbGncsjvXF2zNclOa8DbZ5UHVVq8fKtAo3n/o+4xRQLZO386kwhCmlNRJSbUHXG6Th
	5K3UMv5aRxMnhUAwnlkdLtd3pw7NqormkDLn1CFhKFZY65T51NckzH2V6emy99Dqck1uLEQqHrE
	pFMrIZDgoc8IY/4ky2vcFSwyiVJd+MZ0n6V+NF/hKV6HqrZlVpbqn9n9CopKPA8CEjJtHmRWByY
	UpA89JlwUtTnQ7qN2nG7aYRddjhWzMQv8grJlH4d+pNBozL2CruXqcl14sFTeGMvMRJuOlhRRDZ
	wsCHC2N1/RjBILPCyUGxzekfwTE=
X-Google-Smtp-Source: AGHT+IES8q/iUJm5cNw+qjbCkMoPLxno44J9QsbtU1+OYf8anVgmVMV6PzyGR8nvoGY5cSGSqCiuKQ==
X-Received: by 2002:a17:907:3e1e:b0:abc:ca9:45af with SMTP id a640c23a62f3a-abf2642bc2bmr518755366b.18.1740773293957;
        Fri, 28 Feb 2025 12:08:13 -0800 (PST)
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
Subject: [PATCH v8 4/6] xen/riscv: make zbb as mandatory
Date: Fri, 28 Feb 2025 21:07:42 +0100
Message-ID: <052daeb00fb90416a30f1deebf42c9b6ca5ff348.1740764258.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740764258.git.oleksii.kurochko@gmail.com>
References: <cover.1740764258.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to riscv/booting.txt, it is expected that Zbb should be supported.

Drop ANDN_INSN() in asm/cmpxchg.h as Zbb is mandatory now so `andn`
instruction could be used directly.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V8:
 - Drop ANDN_INSN() in asm/cmpxchg.h as Zbb is mandatory now so andn
   instruction could be used directly.
 - Update the commit message with the text above.
---
Changes in V7:
 - new patch.
---
 xen/arch/riscv/arch.mk               |  7 ++-----
 xen/arch/riscv/include/asm/cmpxchg.h | 15 +--------------
 2 files changed, 3 insertions(+), 19 deletions(-)

diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
index 3034da76cb..236ea7c8a6 100644
--- a/xen/arch/riscv/arch.mk
+++ b/xen/arch/riscv/arch.mk
@@ -9,7 +9,7 @@ riscv-abi-$(CONFIG_RISCV_64) := -mabi=lp64
 riscv-march-$(CONFIG_RISCV_64) := rv64
 riscv-march-y += ima
 riscv-march-$(CONFIG_RISCV_ISA_C) += c
-riscv-march-y += _zicsr_zifencei
+riscv-march-y += _zicsr_zifencei_zbb
 
 riscv-generic-flags := $(riscv-abi-y) -march=$(subst $(space),,$(riscv-march-y))
 
@@ -25,13 +25,10 @@ $(eval $(1) := \
 	$(call as-insn,$(CC) $(riscv-generic-flags)_$(1),$(value $(1)-insn),_$(1)))
 endef
 
-zbb-insn := "andn t0$(comma)t0$(comma)t0"
-$(call check-extension,zbb)
-
 zihintpause-insn := "pause"
 $(call check-extension,zihintpause)
 
-extensions := $(zbb) $(zihintpause)
+extensions := $(zihintpause)
 
 extensions := $(subst $(space),,$(extensions))
 
diff --git a/xen/arch/riscv/include/asm/cmpxchg.h b/xen/arch/riscv/include/asm/cmpxchg.h
index 662d3fd5d4..7d7c89b6fa 100644
--- a/xen/arch/riscv/include/asm/cmpxchg.h
+++ b/xen/arch/riscv/include/asm/cmpxchg.h
@@ -18,19 +18,6 @@
         : "r" (new) \
         : "memory" );
 
-/*
- * To not face an issue that gas doesn't understand ANDN instruction
- * it is encoded using .insn directive.
- */
-#ifdef __riscv_zbb
-#define ANDN_INSN(rd, rs1, rs2)                 \
-    ".insn r OP, 0x7, 0x20, " rd ", " rs1 ", " rs2 "\n"
-#else
-#define ANDN_INSN(rd, rs1, rs2)                 \
-    "not " rd ", " rs2 "\n"                     \
-    "and " rd ", " rs1 ", " rd "\n"
-#endif
-
 /*
  * For LR and SC, the A extension requires that the address held in rs1 be
  * naturally aligned to the size of the operand (i.e., eight-byte aligned
@@ -61,7 +48,7 @@
     \
     asm volatile ( \
         "0: lr.w" lr_sfx " %[old], %[ptr_]\n" \
-        ANDN_INSN("%[scratch]", "%[old]", "%[mask]") \
+        "   andn  %[scratch], %[old], %[mask]\n" \
         "   or   %[scratch], %[scratch], %z[new_]\n" \
         "   sc.w" sc_sfx " %[scratch], %[scratch], %[ptr_]\n" \
         "   bnez %[scratch], 0b\n" \
-- 
2.48.1


