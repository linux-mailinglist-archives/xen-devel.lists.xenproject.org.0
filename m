Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 553A6ABFA9B
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 18:04:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992138.1375929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHlvI-0004nP-6n; Wed, 21 May 2025 16:04:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992138.1375929; Wed, 21 May 2025 16:04:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHlvI-0004lr-3C; Wed, 21 May 2025 16:04:04 +0000
Received: by outflank-mailman (input) for mailman id 992138;
 Wed, 21 May 2025 16:04:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hkAn=YF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uHlvG-0004Wm-TD
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 16:04:02 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35c55240-365d-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 18:04:01 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-60236e3d093so1573669a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 09:04:01 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6004d502736sm9152513a12.25.2025.05.21.09.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 09:03:59 -0700 (PDT)
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
X-Inumbo-ID: 35c55240-365d-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747843440; x=1748448240; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shglBms3cAYrXtkagIZN9N+XVCLYlAM3GBQ8WROjCv4=;
        b=mZrN6r2fPHSISpLslWZngLYwmK0y5nAMxIn26CogtZpnGRs7j3uYJGgVRcSxxOK3Ov
         CafF80a/yiJXYSycNHCSP5BzUp2fdwDmUiAHAh4vmjZH2vfYI33HeI/P+14e8SJ0xpwq
         pCabSaeaNCWFLyCaL0NzGfHaTU4hgXWHfRlhajpTScIhl+VPUiXO89YTKPydlNhKlVwg
         7qykmMSduMtbykvwrgY0aA+kQzN3ugTxugk88923DvidhVUbvGl1IL2aYYxgmvlr0RFg
         7wIlMXCRCjThGGMFvmrL3EIlxy4SNrQA1mjUP5qURoQ4WASgIvpofmeuMVKRHIzIM0CR
         iLcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747843440; x=1748448240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=shglBms3cAYrXtkagIZN9N+XVCLYlAM3GBQ8WROjCv4=;
        b=iZ96X5iZAvqZyQ4ZInX2N0FyuUtFA1n3CsVyn9zK+QimKtQKw5Uo561dJMn+NKiag3
         ccklRQfSAwL6DvOXrkYErKxY9xIfqMp0aWwyXdDCnCmWs0MFOcsfjejk9NTxYAFQTPB0
         WfF+d1qFkNX378lmTAwjq0VnXH/8hZJM9kNK86pnB7zgDoJTVsIqP3xXirVjmLMzIjSm
         qomgFa2pKTQtoynNFKsjZUr/whcWCWjlNa47u9zgwgazfrEck37d+G4j6UssgTaqkyND
         NWIPhkrIhg9H5beRIFTwKbDLLX84iSJoxLp/xwT7nExUm/+bX1ncTRV30YAOT0WNczzF
         US+A==
X-Gm-Message-State: AOJu0YzIpNNXXK12rAH4u+qQy9sqAECnU1sHDUZeLUWOSF8Co4kxqc8I
	wI3xgoM6+94oBxXHqS7ZP4n0nEdXsXqnlRY0WJmHG9USA+59MAo6aGLj8Or3fQ==
X-Gm-Gg: ASbGncvKY39fDuF1JNqOL2U6AptC3KOGktXCXKx+k4+5oUNlqRmuj/vYkvPlG9CZ1s3
	muYKaOuSVGzsD/ZFWU4nqinPWi9HNQNKW7mGyqKRgQgKlZ3LHnZ2UWWCza+Z2PNdUXVUz+2bGlE
	Jwgu4PWx8jEeXQQ7aLrf/7OiIAwDDmAr3XxMJiws9D/40RVMZE2gmzyESeLwh4MWHjk85SQIyMn
	ydmFR02YQqXMNRuSUaCFwCEXvaAjXU/qCy3I1+Yz+HXMZ7NRHIqNKButJYX4P9TEkrTNJEhamBq
	vQ0SfT0INZUFuVslrlh4s+j1l23LljX6IMMCyzV4Xfm0zwUxkDtwzgJ48N2SGJNKyKbfW4MNuA3
	Xy/aYxpXcH6Qfx1Z7Dw==
X-Google-Smtp-Source: AGHT+IGXKA2S9+ecIE6syxuKTBTXlChTOcT8GX4dk5kuzybbiWRvidQud5EUiYkHTkrzJvp6rSGEcw==
X-Received: by 2002:a05:6402:3492:b0:601:ef7e:fb49 with SMTP id 4fb4d7f45d1cf-601ef7efe12mr8735000a12.12.1747843439705;
        Wed, 21 May 2025 09:03:59 -0700 (PDT)
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
Subject: [PATCH v3 01/14] xen/riscv: introduce smp_prepare_boot_cpu()
Date: Wed, 21 May 2025 18:03:41 +0200
Message-ID: <33f3e8378631f6b73148402bbb0b6bb3c64bf754.1747843009.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747843009.git.oleksii.kurochko@gmail.com>
References: <cover.1747843009.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initialize cpu_{possible, online}_map by using smp_prepare_boot_cpu().

Drop DEFINE_PER_CPU(unsigned int, cpu_id) from stubs.c as this variable isn't
expected to be used in RISC-V at all.

Move declaration of cpu_{possible,online}_map from stubs.c to smpboot.c
as now smpboot.c is now introduced.
Other defintions keep in stubs.c as they are not initialized and not needed, at
the moment.

Drop cpu_present_map as it is enough to have cpu_possible_map. Also, ask
linker to provide symbol for cpu_present_map as common code references it.

Move call of set_processor_id(0) to smp_prepare_boot_cpu().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
 - Move call of set_processor_id(0) inside smp_prepare_boot_cpu().
 - Update the commit message.
---
Changes in v2:
 - Add __read_mostly for cpu_online_map.
 - Add __ro_after_init for cpu_possible_map.
 - Drop cpu_present_map and cpumask_copy(&cpu_present_map, &cpu_possible_map);
 - Drop cpumask_clear() for cpu_{possible,online}_map.
 - Ask the linker provide the symbol for cpu_present_map as common code uses
   it.
 - s/smp_clear_cpu_maps/smp_prepare_boot_cpu.
 - Include <xen/smp.h> in setup.c as smp_prepare_boot_cpu() is declare in that
   header now.
   Also, drop inclusion of asm/smp.h in setup.c asm xen/smp.h has inclusion of
   asm/smp.h.
 - Update the commit message.
---
 xen/arch/riscv/Makefile  |  1 +
 xen/arch/riscv/setup.c   |  4 ++--
 xen/arch/riscv/smpboot.c | 16 ++++++++++++++++
 xen/arch/riscv/stubs.c   |  6 ------
 xen/arch/riscv/xen.lds.S |  2 ++
 5 files changed, 21 insertions(+), 8 deletions(-)
 create mode 100644 xen/arch/riscv/smpboot.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index d882c57528..f42cf3dfa6 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -10,6 +10,7 @@ obj-y += sbi.o
 obj-y += setup.o
 obj-y += shutdown.o
 obj-y += smp.o
+obj-y += smpboot.o
 obj-y += stubs.o
 obj-y += time.o
 obj-y += traps.o
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 4e416f6e44..a9c0c61fb6 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -8,6 +8,7 @@
 #include <xen/init.h>
 #include <xen/mm.h>
 #include <xen/shutdown.h>
+#include <xen/smp.h>
 #include <xen/vmap.h>
 #include <xen/xvmalloc.h>
 
@@ -19,7 +20,6 @@
 #include <asm/intc.h>
 #include <asm/sbi.h>
 #include <asm/setup.h>
-#include <asm/smp.h>
 #include <asm/traps.h>
 
 /* Xen stack for bringing up the first CPU. */
@@ -72,7 +72,7 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     remove_identity_mapping();
 
-    set_processor_id(0);
+    smp_prepare_boot_cpu();
 
     set_cpuid_to_hartid(0, bootcpu_id);
 
diff --git a/xen/arch/riscv/smpboot.c b/xen/arch/riscv/smpboot.c
new file mode 100644
index 0000000000..0f9c2cc54a
--- /dev/null
+++ b/xen/arch/riscv/smpboot.c
@@ -0,0 +1,16 @@
+#include <xen/cpumask.h>
+#include <xen/init.h>
+#include <xen/sections.h>
+
+#include <asm/current.h>
+
+cpumask_t __read_mostly cpu_online_map;
+cpumask_t __ro_after_init cpu_possible_map;
+
+void __init smp_prepare_boot_cpu(void)
+{
+    set_processor_id(0);
+
+    cpumask_set_cpu(0, &cpu_possible_map);
+    cpumask_set_cpu(0, &cpu_online_map);
+}
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index 83416d3350..fdcf91054e 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -11,12 +11,6 @@
 
 /* smpboot.c */
 
-cpumask_t cpu_online_map;
-cpumask_t cpu_present_map;
-cpumask_t cpu_possible_map;
-
-/* ID of the PCPU we're running on */
-DEFINE_PER_CPU(unsigned int, cpu_id);
 /* XXX these seem awfully x86ish... */
 /* representing HT siblings of each logical CPU */
 DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, cpu_sibling_mask);
diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index 818aa43669..8c3c06de01 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -165,6 +165,8 @@ SECTIONS
     ELF_DETAILS_SECTIONS
 }
 
+PROVIDE(cpu_present_map = cpu_possible_map);
+
 ASSERT(IS_ALIGNED(__bss_start,      POINTER_ALIGN), "__bss_start is misaligned")
 ASSERT(IS_ALIGNED(__bss_end,        POINTER_ALIGN), "__bss_end is misaligned")
 
-- 
2.49.0


