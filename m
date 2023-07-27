Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF7976553F
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 15:38:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571117.894182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP1Bx-0003MC-CB; Thu, 27 Jul 2023 13:38:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571117.894182; Thu, 27 Jul 2023 13:38:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP1Bx-0003Hd-62; Thu, 27 Jul 2023 13:38:09 +0000
Received: by outflank-mailman (input) for mailman id 571117;
 Thu, 27 Jul 2023 13:38:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SoSB=DN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qP1Bv-0003FR-DE
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 13:38:07 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d112e3db-2c82-11ee-b248-6b7b168915f2;
 Thu, 27 Jul 2023 15:38:06 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b9b9f0387dso14802581fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jul 2023 06:38:06 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 l3-20020a2e7003000000b002b6bb68c7eesm341955ljc.110.2023.07.27.06.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 06:38:04 -0700 (PDT)
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
X-Inumbo-ID: d112e3db-2c82-11ee-b248-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690465085; x=1691069885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVrY+IwKxbHDcjyK2IpdTfw6/z7cxU09eme1nE/toW4=;
        b=qhiHRzyKb+DM4KVt4S08A6E16pb6Ox+6N+AovsfGeRC6koDzQvy8u31gZzbsI0QdZF
         wq7Zeb1RzrPBHZvdnKJqD+WleAU6SfQFGC/nVOgGGMu0ze4DSqjy+9CoHAhf2EaQTHGB
         awQzsk5U368dHpLj699dc/zwtFxXvQVt5aqdTYfaoOIE4dPhQ2GClj/x2A4wqlIJ1zT4
         ku3HuTuh+tfLf9U4B0rgyH70D+N+mLwCCDMFAYF5omxV5haH0JVLAM4OrixOaeP8Dlzw
         HODEKMVNG7hz37YGaG42hY3934JdOyVmSDNizFK749mRRptHaWXYUeXIm5hKs0mWzobi
         3ndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690465085; x=1691069885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VVrY+IwKxbHDcjyK2IpdTfw6/z7cxU09eme1nE/toW4=;
        b=Zt9T/NcePq2r5PIbaVCCQyEAOyqMO0m7rT+JQnPn3SUJ/tLDgIILyoW6P3nE+LgEO9
         JUZ50/id1bUTkiVSf5Dtkn6j4Bp1E0YQM7Yn034z7N7OwZgCtwmXlGedR0+nCky8yYhQ
         HKYghcGVItqOpmhZT88Mf059CYCgk4Eg8Z/z+fIFlGCirO8d/tzjH5gvMTD3yCpKWGtj
         kfGgk7lI1Iwb9Ba1lS9MLT+TZy1vleYY33w2eMDEBnTMwXZAhf2r2OPLs+Wo3ylK+eS4
         GxAyNTOmmQRFcU/hlSSRA6f+q43gIaO9H8pUL8y6/gzBtMeP4bwyyLxF9Lsuh4ACfILD
         +8FA==
X-Gm-Message-State: ABy/qLamFqEdAlR8o2vVdg5UluS1E+dlNGnNmortzZZNzBN4EjkT5gQU
	gn/k9Ov+1DPmS9vBvmTPRP6FQQ4qxiU=
X-Google-Smtp-Source: APBJJlGkVc0AaTUa3EEv91hubQZIzwgfwVIYP+JmrTV3JnqWEFxkbjjFMx3IXch8O8BWq0UTWhkBAQ==
X-Received: by 2002:a2e:9316:0:b0:2b7:764:3caf with SMTP id e22-20020a2e9316000000b002b707643cafmr1768721ljh.10.1690465085098;
        Thu, 27 Jul 2023 06:38:05 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v5 1/2] xen/riscv: introduce function for physical offset calculation
Date: Thu, 27 Jul 2023 16:38:00 +0300
Message-ID: <8013798bc397e5afb27d3aa3b263e06f68590b12.1690464789.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1690464789.git.oleksii.kurochko@gmail.com>
References: <cover.1690464789.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function was introduced to calculate and save physical
offset before MMU is enabled because access to start() is
PC-relative and in case of linker_addr != load_addr it will
result in incorrect value in phys_offset.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V5:
 - update prototype of calc_phys_offset(). now it returns phys_offset.
 - declare phys_offset as static.
 - save returned value of calc_phys_offset to register s2.
---
Changes in V4:
 - update the comment messages in head.S related to save/restore of a0/a1 regs.
---
Changes in V3:
 - save/restore of a0/a1 registers before C first function call.
---
Changes in V2:
  - add __ro_after_init for phys_offset variable.
  - remove double blank lines.
  - add __init for calc_phys_offset().
  - update the commit message.
  - declaring variable phys_off as non static as it will be used in head.S.
---
 xen/arch/riscv/include/asm/mm.h |  2 ++
 xen/arch/riscv/mm.c             | 19 ++++++++++++++++---
 xen/arch/riscv/riscv64/head.S   | 14 ++++++++++++++
 3 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 5e3ac5cde3..7b94cbadd7 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -15,4 +15,6 @@ void setup_initial_pagetables(void);
 void enable_mmu(void);
 void cont_after_mmu_is_enabled(void);
 
+unsigned long calc_phys_offset(void);
+
 #endif /* _ASM_RISCV_MM_H */
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index fddb3cd0bd..1df39ddf1b 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <xen/cache.h>
 #include <xen/compiler.h>
 #include <xen/init.h>
 #include <xen/kernel.h>
@@ -19,9 +20,10 @@ struct mmu_desc {
     pte_t *pgtbl_base;
 };
 
-#define PHYS_OFFSET ((unsigned long)_start - XEN_VIRT_START)
-#define LOAD_TO_LINK(addr) ((addr) - PHYS_OFFSET)
-#define LINK_TO_LOAD(addr) ((addr) + PHYS_OFFSET)
+static unsigned long __ro_after_init phys_offset;
+
+#define LOAD_TO_LINK(addr) ((unsigned long)(addr) - phys_offset)
+#define LINK_TO_LOAD(addr) ((unsigned long)(addr) + phys_offset)
 
 /*
  * It is expected that Xen won't be more then 2 MB.
@@ -273,3 +275,14 @@ void __init noreturn noinline enable_mmu()
     switch_stack_and_jump((unsigned long)cpu0_boot_stack + STACK_SIZE,
                           cont_after_mmu_is_enabled);
 }
+
+/*
+ * calc_phys_offset() should be used before MMU is enabled because access to
+ * start() is PC-relative and in case when load_addr != linker_addr phys_offset
+ * will have an incorrect value
+ */
+unsigned long __init calc_phys_offset(void)
+{
+    phys_offset = (unsigned long)start - XEN_VIRT_START;
+    return phys_offset;
+}
diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
index 2c0304646a..ae194bb099 100644
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -29,6 +29,20 @@ ENTRY(start)
 
         jal     reset_stack
 
+        /*
+         * save hart_id ( bootcpu_id ) and dtb_base as a0 and a1 register can
+         * be used by C code
+         */
+        mv      s0, a0
+        mv      s1, a1
+
+        jal     calc_phys_offset
+        mv      s2, a0
+
+        /* restore hart_id ( bootcpu_id ) and dtb address */
+        mv      a0, s0
+        mv      a1, s1
+
         tail    start_xen
 
         .section .text, "ax", %progbits
-- 
2.41.0


