Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 675019ED369
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 18:28:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855081.1268155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLQVJ-0008N6-7Z; Wed, 11 Dec 2024 17:28:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855081.1268155; Wed, 11 Dec 2024 17:28:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLQVJ-0008J7-4O; Wed, 11 Dec 2024 17:28:05 +0000
Received: by outflank-mailman (input) for mailman id 855081;
 Wed, 11 Dec 2024 17:28:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ntru=TE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tLQVI-0007J6-1R
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 17:28:04 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4625b698-b7e5-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 18:28:02 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-aa69077b93fso508305166b.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 09:28:02 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa6656f306csm687297466b.61.2024.12.11.09.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 09:28:00 -0800 (PST)
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
X-Inumbo-ID: 4625b698-b7e5-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733938081; x=1734542881; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QkQK8nAgFr42ZPxstS2wi6BvRdU+OOSSDhzgllibs7Q=;
        b=CnBFBy8PDmu0f5KK4wK2HoVVxaPtrYH/R7Agj0XV7x43R/OCsGv1L+l6GJ8BalQswk
         1ZJ9CYWEpkDlKnU0syng7R/sUj7aOSYK+XjqBGxGE2iXzDeXURyN6CezvWrCEXTwMFir
         BdQfIIaH6/GpuMUcU2syTCGu4Vz3Vp/Nc4aFotZhEuGWTLBbM+zD0PYtD63klrk+DWJs
         EwvV6KWsMnJLRia/Tgrn4hk+i4pd1zqt8l69BYgxTce3+0kHlmcE6cD0a0HlK0eSQxB1
         Kcw88mzoyWWKLSA2kiqTvaq06tGtDyqx3iQcua+C1mBUEeFx/qN66iXExEBjNh/vsuJ6
         Fpsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733938081; x=1734542881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QkQK8nAgFr42ZPxstS2wi6BvRdU+OOSSDhzgllibs7Q=;
        b=GZOtDCmavkM3yvJeozXxvVkqIk8lKOPIMunUS/ynxAS9eSBKwijaoGwWjwAhCHn7ji
         3zkcoYtn7u48sTVpff1vMrxHJPYVY77JeX2bTQ+5J6KrR4e5Ye/4prQ49IGyuo04s5lX
         St6pCca2inPJxTMxlGCwbuY3UpYeBlruVHuXOBDKLulAqhOzB1YXNgm1fUdRoyqbYvCd
         2Q2uNw2KLb1J/2LDOooPESo1WSMsbuwpaPnXv5rs0QHHYNq4XGYNjtsgXOGGQFuBskOf
         bPcYzJqwN+CI2x2M8RIoIBEvgtuC7DIREnQOLl2qVgJ350dTqbFKaaxSaBUVnsNUaLhu
         QxgA==
X-Gm-Message-State: AOJu0YyL+IQcpoFpwp75roaGwF7xeLWJxdhJiMaPelmO7uh+pRtoDlMp
	9+/T00FGpyTGIWfwvUchix9z5hbVYYu4nKFHm9oq7yD0kRfeaJKC6OXGGw0z
X-Gm-Gg: ASbGncs4zYYAhF/QsOzkMjUBj4wXrW98LZgku10sH5VMHTPxTPR68tK+qTT+U33Pm6F
	oHeYZ7Uv3mhtpPDYiwztrPuPNwLyJTvqpqeFEAViAREiWFxibjLGqESWJW1hwg8k0kHG08jjdn2
	5XOSXLbJtnK06sH1KSKKSGS0mOHVmU8xNCb9zkdDQvJja0bNtOiM48b5+DhS/KvT+z1ifbnFJvw
	I8y9jyuwtBStQli327FNny7gyyvFKr+jpa+0RKcYKPfUs3TbHpfpKM=
X-Google-Smtp-Source: AGHT+IGfMe6zVWrtyyrEzVriIleXUcPcuX7PTitRVcZdUVKgvE14a22FQJgoZt9rNPki9KX736cIfw==
X-Received: by 2002:a17:906:8a42:b0:aa6:8bb4:503b with SMTP id a640c23a62f3a-aa6c1d13240mr76327066b.55.1733938080609;
        Wed, 11 Dec 2024 09:28:00 -0800 (PST)
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
Subject: [PATCH v2 5/7] xen/riscv: implement data and instruction cache operations
Date: Wed, 11 Dec 2024 18:27:49 +0100
Message-ID: <bb6191b21bd387f265e0e25322a30f4ade6e8b3b.1733937787.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733937787.git.oleksii.kurochko@gmail.com>
References: <cover.1733937787.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement following cache operations:
- clean_and_invalidate_dcache_va_range()
- clean_dcache_va_range()
- invalidate_icache()

The first two functions may require support for the CMO (Cache Management
Operations) extension and/or hardware-specific instructions.
Currently, only QEMU is supported, which does not model cache behavior.
Therefore, clean_and_invalidate_dcache_va_range() and clean_dcache_va_range()
are implemented to simply return 0. For other cases, -ENOTSUPP is returned.
If hardware supports CMO or hardware-specific instructions,
these functions should be updated accordingly. To support current
implementation of these function CONFIG_QEMU is introduced.

invalidate_icache() is implemented using fence.i instruction as
mentioned in the unpriv spec:
  The FENCE.I instruction was designed to support a wide variety of
  implementations. A simple implementation can flush the local instruction
  cache and the instruction pipeline when the FENCE.I is executed.
  A more complex implementation might snoop the instruction (data) cache
  on every data (instruction) cache miss, or use an inclusive unified
  private L2 cache to invalidate lines from the primary instruction cache
  when they are being written by a local store instruction.
  If instruction and data caches are kept coherent in this way, or if the
  memory system consists of only uncached RAMs, then just the fetch pipeline
  needs to be flushed at a FENCE.I.
The FENCE.I instruction requires the presence of the Zifencei extension,
which might not always be available. However, Xen uses the RV64G ISA, which
guarantees the presence of the Zifencei extension. According to the
unprivileged ISA specification (version 20240411):
  One goal of the RISC-V project is that it be used as a stable software
  development target. For this purpose, we define a combination of a base ISA
  (RV32I or RV64I) plus selected standard extensions (IMAFD, Zicsr, Zifencei)
  as a "general-purpose" ISA, and we use the abbreviation G for the
  IMAFDZicsr_Zifencei combination of instruction-set extensions.

Set CONFIG_QEMU=y in tiny64_defconfig to have proper implemtation of
clean_and_invalidate_dcache_va_range() and clean_dcache_va_range() for CI.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - Update the commit message and subject:
   - drop information about HAS_CMO;
   - add information about Zifencei extension;
 - Introdce platforms directory and CONFIG_QEMU; update implementation of
   data/instruction cache operations as returning 0 for CONFIG_QEMU and for
   others - return -ENOTSUPP.
 - Drop HAS_CMO config.
---
 xen/arch/riscv/Kconfig                  |  2 ++
 xen/arch/riscv/configs/tiny64_defconfig |  1 +
 xen/arch/riscv/include/asm/page.h       | 21 ++++++++++++++++++++-
 xen/arch/riscv/platforms/Kconfig        |  5 +++++
 4 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/riscv/platforms/Kconfig

diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index 1858004676..00f329054c 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -52,6 +52,8 @@ config RISCV_ISA_C
 
 endmenu
 
+source "arch/riscv/platforms/Kconfig"
+
 source "common/Kconfig"
 
 source "drivers/Kconfig"
diff --git a/xen/arch/riscv/configs/tiny64_defconfig b/xen/arch/riscv/configs/tiny64_defconfig
index fc7a04872f..47076e357c 100644
--- a/xen/arch/riscv/configs/tiny64_defconfig
+++ b/xen/arch/riscv/configs/tiny64_defconfig
@@ -10,3 +10,4 @@ CONFIG_RISCV_64=y
 CONFIG_DEBUG=y
 CONFIG_DEBUG_INFO=y
 CONFIG_EXPERT=y
+CONFIG_QEMU=y
diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index bf3f75e85d..54c6fe6515 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -7,6 +7,7 @@
 
 #include <xen/bug.h>
 #include <xen/const.h>
+#include <xen/errno.h>
 #include <xen/types.h>
 
 #include <asm/atomic.h>
@@ -148,9 +149,27 @@ static inline bool pte_is_mapping(pte_t p)
     return (p.pte & PTE_VALID) && (p.pte & PTE_ACCESS_MASK);
 }
 
+static inline int clean_and_invalidate_dcache_va_range(const void *p, unsigned long size)
+{
+#ifdef CONFIG_QEMU
+    return 0;
+#else
+    return -EOPNOTSUPP;
+#endif
+}
+
+static inline int clean_dcache_va_range(const void *p, unsigned long size)
+{
+#ifdef CONFIG_QEMU
+    return 0;
+#else
+    return -EOPNOTSUPP;
+#endif
+}
+
 static inline void invalidate_icache(void)
 {
-    BUG_ON("unimplemented");
+    asm volatile ( "fence.i" ::: "memory" );
 }
 
 #define clear_page(page) memset((void *)(page), 0, PAGE_SIZE)
diff --git a/xen/arch/riscv/platforms/Kconfig b/xen/arch/riscv/platforms/Kconfig
new file mode 100644
index 0000000000..30ed938d52
--- /dev/null
+++ b/xen/arch/riscv/platforms/Kconfig
@@ -0,0 +1,5 @@
+config QEMU
+	bool "QEMU aarch virt machine support"
+	depends on RISCV_64
+	help
+	  Enable all the required drivers for QEMU riscv64 virt emulated machine.
-- 
2.47.1


