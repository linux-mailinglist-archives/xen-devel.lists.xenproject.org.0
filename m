Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC9AA1ADA6
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2025 00:51:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876495.1286906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tb6ys-0000BX-1N; Thu, 23 Jan 2025 23:51:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876495.1286906; Thu, 23 Jan 2025 23:51:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tb6yr-00008M-Tp; Thu, 23 Jan 2025 23:51:25 +0000
Received: by outflank-mailman (input) for mailman id 876495;
 Thu, 23 Jan 2025 23:51:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QxCy=UP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tb6tF-0007w9-42
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 23:45:37 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24aeb204-d9e4-11ef-a0e5-8be0dac302b0;
 Fri, 24 Jan 2025 00:45:36 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4362f61757fso15535005e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2025 15:45:36 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd507d60sm6676495e9.18.2025.01.23.15.45.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Jan 2025 15:45:34 -0800 (PST)
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
X-Inumbo-ID: 24aeb204-d9e4-11ef-a0e5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737675936; x=1738280736; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QhTovaxYyVYo/iAlHiQi1CfSH3sOOBet2z8bCBrBkk0=;
        b=mfel7qfyKyl/E/IZ1YPIJc/5TClVjqBacIHQpsiXvBzya8GhqP2RXopkeVkondjWfg
         YnHRPEnusL3F/Gz7cxcrgrLaqJL8j0QjOWNbFMNlVCeSgI2v8edpfgFJUwNM/D0gHxLB
         Mc9I2GEN+nOnRlIVvFxuhVI7ZDr3P1zdFaBoNOBrZPHtFbAycj8Rll5PNQrVtnkjRmyj
         kfQohwcKBdualOPYcMP/n8BflnPZyNbnWv5dduASmo4EbeOXSdWn+ncJWuZE5FyCkG0J
         fCAfx9BW+7cAGUrS2bsqmQidhZ7w7W5QMqK5kCINvDM2d3WiTunxtdljrf1Pk4W5U/V0
         AxLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737675936; x=1738280736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QhTovaxYyVYo/iAlHiQi1CfSH3sOOBet2z8bCBrBkk0=;
        b=CjbkT8X/gs0YxfmVxmgdTY9+QIEt4hgXes9xBX2NygQztD3xMNCdg43Yt5VutNvrNU
         XNBRQ3DsitLXlLkOMbiIL0SyHaQ1yTKOmi3Ln8k+mtSxhPAlIEaiAP+YqexI/sXeqsxt
         5UqOPLeQrVpwDk3p0bIHBz6E0omXbf2BfmACIIiiqaq4hHGTCrGVHuCUz5mkhAcUagIs
         +Ye4mH2fQUAR7TU+wDlLGsyZllF2zfkAas2uO14m2Vn7/dYuGmOOnN00Cd61IuK91yJJ
         zULq94vtdk6Fu/P5Y18dni3wNXTVtvIHvhJSnkLn2VyE+AikB41WGhGMrZBBcfwBw+Hg
         Gtqw==
X-Forwarded-Encrypted: i=1; AJvYcCVMc02PLOo0GVW/9hFU7Pt9mx5HYy9d59n8pE1WSwF5X0ntxyaqBIlupillP1dClAyLm6UmPLf7/5c=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyo5RO2H2v/z/fJWXbXyttDdEd3/4bmf3qwLyS3JnHwIcNDB78N
	FoCqLLAwswU+ydfQdJFp48TgXIuBTNaJF6OfNz1MrjLgls2mvS9QcU5Ei3NPuN8=
X-Gm-Gg: ASbGncut8yu/6CVcjhO6wcXW9M0c0+huOoFcNa0NEKfTZqzJBTIIguQMc1AElYbAIXG
	9eQguBbbcLruxxoFkXHeNQx/ANyxIfjZwkF/MMR4cvVBR6/UvMLkYfdRFsyCJxRgI8Ai+CUI9vj
	FrzKsw0U0B7HqYeTbJH6AgPJfvbuJVQOEPFy9/xfzpd110m/LLpbfzzrVF0CMQ9v5aO7i8f2DTv
	rn3Qv5kvPf0+7vzlBGyj7jBfLMTuh2U4Wdd4ZCS7zS3nrzf9dD0EhQtEn8Ec7gRBkKf6en1c2eT
	BIvOhX4d1Yyc2gsyc2MObZdjGwq1ywZBlBX/emsOlPWaFXiLbqYngq4rlLFaJAwUrA==
X-Google-Smtp-Source: AGHT+IE1g5Lka6yaX7yxmvTjxCMF9sNPmOLsz1lyorKlxhPYpXBg1FExyYB9qYVhhui8O2rA+ot5eQ==
X-Received: by 2002:a05:600c:3b0a:b0:434:9c60:95a3 with SMTP id 5b1f17b1804b1-438913ca93cmr282415605e9.11.1737675935797;
        Thu, 23 Jan 2025 15:45:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	qemu-s390x@nongnu.org,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 14/20] accel/tcg: Move cpu_memory_rw_debug() user implementation to user-exec.c
Date: Fri, 24 Jan 2025 00:44:08 +0100
Message-ID: <20250123234415.59850-15-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

cpu_memory_rw_debug() system implementation is defined in
system/physmem.c. Move the user one to accel/tcg/user-exec.c
to simplify cpu-target.c maintenance.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/user-exec.c |  92 +++++++++++++++++++++++++++++++++++++
 cpu-target.c          | 102 +-----------------------------------------
 2 files changed, 94 insertions(+), 100 deletions(-)

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index c4454100ad7..e7e99a46087 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -19,6 +19,8 @@
 #include "qemu/osdep.h"
 #include "accel/tcg/cpu-ops.h"
 #include "disas/disas.h"
+#include "exec/vaddr.h"
+#include "exec/tswap.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg.h"
 #include "qemu/bitops.h"
@@ -35,6 +37,7 @@
 #include "internal-common.h"
 #include "internal-target.h"
 #include "tb-internal.h"
+#include "qemu.h"
 
 __thread uintptr_t helper_retaddr;
 
@@ -969,6 +972,95 @@ static void *cpu_mmu_lookup(CPUState *cpu, vaddr addr,
     return ret;
 }
 
+/* physical memory access (slow version, mainly for debug) */
+int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
+                        void *ptr, size_t len, bool is_write)
+{
+    int flags;
+    vaddr l, page;
+    void * p;
+    uint8_t *buf = ptr;
+    ssize_t written;
+    int ret = -1;
+    int fd = -1;
+
+    while (len > 0) {
+        page = addr & TARGET_PAGE_MASK;
+        l = (page + TARGET_PAGE_SIZE) - addr;
+        if (l > len)
+            l = len;
+        flags = page_get_flags(page);
+        if (!(flags & PAGE_VALID)) {
+            goto out_close;
+        }
+        if (is_write) {
+            if (flags & PAGE_WRITE) {
+                /* XXX: this code should not depend on lock_user */
+                p = lock_user(VERIFY_WRITE, addr, l, 0);
+                if (!p) {
+                    goto out_close;
+                }
+                memcpy(p, buf, l);
+                unlock_user(p, addr, l);
+            } else {
+                /* Bypass the host page protection using ptrace. */
+                if (fd == -1) {
+                    fd = open("/proc/self/mem", O_WRONLY);
+                    if (fd == -1) {
+                        goto out;
+                    }
+                }
+                /*
+                 * If there is a TranslationBlock and we weren't bypassing the
+                 * host page protection, the memcpy() above would SEGV,
+                 * ultimately leading to page_unprotect(). So invalidate the
+                 * translations manually. Both invalidation and pwrite() must
+                 * be under mmap_lock() in order to prevent the creation of
+                 * another TranslationBlock in between.
+                 */
+                mmap_lock();
+                tb_invalidate_phys_range(addr, addr + l - 1);
+                written = pwrite(fd, buf, l,
+                                 (off_t)(uintptr_t)g2h_untagged(addr));
+                mmap_unlock();
+                if (written != l) {
+                    goto out_close;
+                }
+            }
+        } else if (flags & PAGE_READ) {
+            /* XXX: this code should not depend on lock_user */
+            p = lock_user(VERIFY_READ, addr, l, 1);
+            if (!p) {
+                goto out_close;
+            }
+            memcpy(buf, p, l);
+            unlock_user(p, addr, 0);
+        } else {
+            /* Bypass the host page protection using ptrace. */
+            if (fd == -1) {
+                fd = open("/proc/self/mem", O_RDONLY);
+                if (fd == -1) {
+                    goto out;
+                }
+            }
+            if (pread(fd, buf, l,
+                      (off_t)(uintptr_t)g2h_untagged(addr)) != l) {
+                goto out_close;
+            }
+        }
+        len -= l;
+        buf += l;
+        addr += l;
+    }
+    ret = 0;
+out_close:
+    if (fd != -1) {
+        close(fd);
+    }
+out:
+    return ret;
+}
+
 #include "ldst_atomicity.c.inc"
 
 static uint8_t do_ld1_mmu(CPUState *cpu, vaddr addr, MemOpIdx oi,
diff --git a/cpu-target.c b/cpu-target.c
index 20933bde7d4..6d8b7825746 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -19,18 +19,12 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-
-#include "exec/target_page.h"
-#include "exec/page-protection.h"
 #include "hw/qdev-core.h"
 #include "hw/qdev-properties.h"
 #include "qemu/error-report.h"
 #include "qemu/qemu-print.h"
 #include "migration/vmstate.h"
-#ifdef CONFIG_USER_ONLY
-#include "qemu.h"
-#include "user/page-protection.h"
-#else
+#ifndef CONFIG_USER_ONLY
 #include "hw/core/sysemu-cpu-ops.h"
 #include "exec/address-spaces.h"
 #include "exec/memory.h"
@@ -38,16 +32,15 @@
 #include "system/accel-ops.h"
 #include "system/cpus.h"
 #include "system/tcg.h"
-#include "exec/tswap.h"
 #include "exec/replay-core.h"
 #include "exec/cpu-common.h"
 #include "exec/exec-all.h"
 #include "exec/tb-flush.h"
-#include "exec/translation-block.h"
 #include "exec/log.h"
 #include "accel/accel-cpu-target.h"
 #include "trace/trace-root.h"
 #include "qemu/accel.h"
+#include "hw/core/cpu.h"
 
 #ifndef CONFIG_USER_ONLY
 static int cpu_common_post_load(void *opaque, int version_id)
@@ -367,97 +360,6 @@ void cpu_abort(CPUState *cpu, const char *fmt, ...)
     abort();
 }
 
-/* physical memory access (slow version, mainly for debug) */
-#if defined(CONFIG_USER_ONLY)
-int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
-                        void *ptr, size_t len, bool is_write)
-{
-    int flags;
-    vaddr l, page;
-    void * p;
-    uint8_t *buf = ptr;
-    ssize_t written;
-    int ret = -1;
-    int fd = -1;
-
-    while (len > 0) {
-        page = addr & TARGET_PAGE_MASK;
-        l = (page + TARGET_PAGE_SIZE) - addr;
-        if (l > len)
-            l = len;
-        flags = page_get_flags(page);
-        if (!(flags & PAGE_VALID)) {
-            goto out_close;
-        }
-        if (is_write) {
-            if (flags & PAGE_WRITE) {
-                /* XXX: this code should not depend on lock_user */
-                p = lock_user(VERIFY_WRITE, addr, l, 0);
-                if (!p) {
-                    goto out_close;
-                }
-                memcpy(p, buf, l);
-                unlock_user(p, addr, l);
-            } else {
-                /* Bypass the host page protection using ptrace. */
-                if (fd == -1) {
-                    fd = open("/proc/self/mem", O_WRONLY);
-                    if (fd == -1) {
-                        goto out;
-                    }
-                }
-                /*
-                 * If there is a TranslationBlock and we weren't bypassing the
-                 * host page protection, the memcpy() above would SEGV,
-                 * ultimately leading to page_unprotect(). So invalidate the
-                 * translations manually. Both invalidation and pwrite() must
-                 * be under mmap_lock() in order to prevent the creation of
-                 * another TranslationBlock in between.
-                 */
-                mmap_lock();
-                tb_invalidate_phys_range(addr, addr + l - 1);
-                written = pwrite(fd, buf, l,
-                                 (off_t)(uintptr_t)g2h_untagged(addr));
-                mmap_unlock();
-                if (written != l) {
-                    goto out_close;
-                }
-            }
-        } else if (flags & PAGE_READ) {
-            /* XXX: this code should not depend on lock_user */
-            p = lock_user(VERIFY_READ, addr, l, 1);
-            if (!p) {
-                goto out_close;
-            }
-            memcpy(buf, p, l);
-            unlock_user(p, addr, 0);
-        } else {
-            /* Bypass the host page protection using ptrace. */
-            if (fd == -1) {
-                fd = open("/proc/self/mem", O_RDONLY);
-                if (fd == -1) {
-                    goto out;
-                }
-            }
-            if (pread(fd, buf, l,
-                      (off_t)(uintptr_t)g2h_untagged(addr)) != l) {
-                goto out_close;
-            }
-        }
-        len -= l;
-        buf += l;
-        addr += l;
-    }
-    ret = 0;
-out_close:
-    if (fd != -1) {
-        close(fd);
-    }
-out:
-    return ret;
-}
-#endif
-
 bool target_words_bigendian(void)
 {
     return TARGET_BIG_ENDIAN;
-- 
2.47.1


