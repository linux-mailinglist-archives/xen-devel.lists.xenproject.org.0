Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE55EA1AD9F
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2025 00:51:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876462.1286856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tb6yR-000664-98; Thu, 23 Jan 2025 23:50:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876462.1286856; Thu, 23 Jan 2025 23:50:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tb6yR-00063v-5Z; Thu, 23 Jan 2025 23:50:59 +0000
Received: by outflank-mailman (input) for mailman id 876462;
 Thu, 23 Jan 2025 23:50:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QxCy=UP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tb6st-0007hN-R9
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 23:45:15 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 175196d6-d9e4-11ef-99a4-01e77a169b0f;
 Fri, 24 Jan 2025 00:45:14 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43618283dedso15514455e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2025 15:45:14 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd54c04bsm6412735e9.27.2025.01.23.15.45.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Jan 2025 15:45:12 -0800 (PST)
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
X-Inumbo-ID: 175196d6-d9e4-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737675913; x=1738280713; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9nZeRXAiaA5TpZm6lq5Kgnlq642/zMUBUZPLj6lypP8=;
        b=zOoCTYz4CxkPOVKnpTHv6t3P4ZL/ySg13Oysr6zXEoDUOKhoUud9UIk22rWlvbUqUS
         7kepcbo0fd+G6VUlehI/ITWzJV1hrrjg13A8EaLI5Tq/ht0DTrXCG0Ze2U81gq/UtQZY
         XGdU61ktqiNfANpNGR9DwDijBZK6MK3hA2Dr7FQjJAwgZ4+cceO4JVKE2t2JEs52lUzl
         vTvodMINGarMf42hDRz7oggZWFQkHg2mX9G0tbkxZD/r1yjJB7yzx0He1yy3MUBCWOJK
         e9SR9PLKQk4Y81N0uIKAAB43oxMWOfbgN1W5/w24FAUiEL8RnWJu+PBBwajV9mJRFmfz
         Idig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737675913; x=1738280713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9nZeRXAiaA5TpZm6lq5Kgnlq642/zMUBUZPLj6lypP8=;
        b=hEX5m78JQgOAPt9J1UZjOvLiM90qKH4MzECg7t4KpYPU2v8p7SDuk57qYEkQERd6V9
         G4K/wy+YtuyG9yyCThWIup1msIxQ4aiAb9CzQYKJ4wnWCrAHGa+6xoJ0COHsD71BsuA6
         T5/oRx9rcz+Oa864R7haFdZvtQG03dUdhq89kP10/yxrZVBqxgyPvMqslUxUGXrHehqy
         voPpHpD139JiCXfmbxflSYRpoO58oue/MI+1n/nFJx8yrJBM3egUrUEo0jLNq238KN1J
         a22B68ZEPQQne0e6j+yyRkwPjVS+Udjkcrmss6snh48L1ehBIyfcvaKztwCU11SAaEE0
         hmOg==
X-Forwarded-Encrypted: i=1; AJvYcCUU3nJEE0GzCNl2HE5yrFa+PcdVf3F9zowYdBls4XuA7a6adJH1lqFrjA/JGv+66ENldNJBwEXCRP0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyApg/XN8f6NmsFIz8CotECLtz1/ZAU31mn15PUu8cbjVjj+H1c
	Z7vV1j9j42rW2UVfPn5njoDIjaIVvWPW4vipqDKEnSDxZx5b3KxW+fwnrREs0KA=
X-Gm-Gg: ASbGnctqBWnsEuqAuVgTtxYk2lXhtZ39hqvjGMsWiFfGA5YSo8TywVSvbIrc5auTS96
	a2K5xy2MvfO6y8q7BHnKcpFOxJ6+BFnDoibvXB/oozGm/RrttYtnabjTOKSEEuDoykwbrjhBI9+
	HMcS7cQ02zICU4/9vtS4pKYXBkvcUgbw6WAXwh3tpA+xYt4xhFSgyPX2zx9AxrE00q4hjHd1/cH
	l8tpUYfU0gX2uwVSe9M1N0HBM08hxpoSTihlC8cRafm8/6KDUjt6rP+yo61AGw6DZ0B1qHvRQ4H
	3oMkIE8tgUuDhrfom9q9Ko+sAyDGPENlJ6oHAiDJxybFMP5QPPMrJ+CMKCghyFnI4w==
X-Google-Smtp-Source: AGHT+IEDiDQdxrx2jB8os0igTQ7OuBNE672qZpSpts43JKLj6+qBPVdV+5rplNMJaEPLV2MbkLotbw==
X-Received: by 2002:a05:600c:4713:b0:436:9227:915 with SMTP id 5b1f17b1804b1-438913caa3cmr222825345e9.9.1737675913369;
        Thu, 23 Jan 2025 15:45:13 -0800 (PST)
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
Subject: [PATCH 10/20] accel/tcg: Rename 'hw/core/tcg-cpu-ops.h' -> 'accel/tcg/cpu-ops.h'
Date: Fri, 24 Jan 2025 00:44:04 +0100
Message-ID: <20250123234415.59850-11-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

TCGCPUOps structure makes more sense in the accelerator context
rather than hardware emulation. Move it under the accel/tcg/ scope.

Mechanical change doing:

 $  sed -i -e 's,hw/core/tcg-cpu-ops.h,accel/tcg/cpu-ops.h,g' \
   $(git grep -l hw/core/tcg-cpu-ops.h)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS                                            | 2 +-
 include/{hw/core/tcg-cpu-ops.h => accel/tcg/cpu-ops.h} | 0
 accel/tcg/cpu-exec.c                                   | 4 ++--
 accel/tcg/cputlb.c                                     | 2 +-
 accel/tcg/translate-all.c                              | 2 +-
 accel/tcg/user-exec.c                                  | 2 +-
 accel/tcg/watchpoint.c                                 | 2 +-
 bsd-user/signal.c                                      | 2 +-
 hw/mips/jazz.c                                         | 2 +-
 linux-user/signal.c                                    | 2 +-
 system/physmem.c                                       | 2 +-
 target/alpha/cpu.c                                     | 2 +-
 target/arm/cpu.c                                       | 2 +-
 target/arm/tcg/cpu-v7m.c                               | 2 +-
 target/arm/tcg/cpu32.c                                 | 2 +-
 target/arm/tcg/mte_helper.c                            | 2 +-
 target/arm/tcg/sve_helper.c                            | 2 +-
 target/avr/cpu.c                                       | 2 +-
 target/avr/helper.c                                    | 2 +-
 target/hexagon/cpu.c                                   | 2 +-
 target/hppa/cpu.c                                      | 2 +-
 target/i386/tcg/tcg-cpu.c                              | 2 +-
 target/loongarch/cpu.c                                 | 2 +-
 target/m68k/cpu.c                                      | 2 +-
 target/microblaze/cpu.c                                | 2 +-
 target/mips/cpu.c                                      | 2 +-
 target/openrisc/cpu.c                                  | 2 +-
 target/ppc/cpu_init.c                                  | 2 +-
 target/riscv/tcg/tcg-cpu.c                             | 2 +-
 target/rx/cpu.c                                        | 2 +-
 target/s390x/cpu.c                                     | 2 +-
 target/s390x/tcg/mem_helper.c                          | 2 +-
 target/sh4/cpu.c                                       | 2 +-
 target/sparc/cpu.c                                     | 2 +-
 target/tricore/cpu.c                                   | 2 +-
 target/xtensa/cpu.c                                    | 2 +-
 36 files changed, 36 insertions(+), 36 deletions(-)
 rename include/{hw/core/tcg-cpu-ops.h => accel/tcg/cpu-ops.h} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7be3d8f431a..fa46d077d30 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -175,7 +175,7 @@ F: include/exec/helper-info.c.inc
 F: include/exec/page-protection.h
 F: include/system/cpus.h
 F: include/system/tcg.h
-F: include/hw/core/tcg-cpu-ops.h
+F: include/accel/tcg/cpu-ops.h
 F: host/include/*/host/cpuinfo.h
 F: util/cpuinfo-*.c
 F: include/tcg/
diff --git a/include/hw/core/tcg-cpu-ops.h b/include/accel/tcg/cpu-ops.h
similarity index 100%
rename from include/hw/core/tcg-cpu-ops.h
rename to include/accel/tcg/cpu-ops.h
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index be2ba199d3d..8ee76e14b0d 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -22,7 +22,7 @@
 #include "qapi/error.h"
 #include "qapi/type-helpers.h"
 #include "hw/core/cpu.h"
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 #include "trace.h"
 #include "disas/disas.h"
 #include "exec/cpu-common.h"
@@ -39,7 +39,7 @@
 #include "exec/replay-core.h"
 #include "system/tcg.h"
 #include "exec/helper-proto-common.h"
-#include "tb-jmp-cache.h"
+//#include "tb-jmp-cache.h"
 #include "tb-hash.h"
 #include "tb-context.h"
 #include "tb-internal.h"
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index b4ccf0cdcb7..d68401b35c3 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -19,7 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/main-loop.h"
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 #include "exec/exec-all.h"
 #include "exec/page-protection.h"
 #include "exec/memory.h"
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index d4189c73860..786e2f6f1a7 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -58,7 +58,7 @@
 #include "system/cpu-timers.h"
 #include "system/tcg.h"
 #include "qapi/error.h"
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 #include "tb-jmp-cache.h"
 #include "tb-hash.h"
 #include "tb-context.h"
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 0561c4f6dc7..c4454100ad7 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -17,7 +17,7 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 #include "disas/disas.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg.h"
diff --git a/accel/tcg/watchpoint.c b/accel/tcg/watchpoint.c
index af57d182d5b..40112b2b2e7 100644
--- a/accel/tcg/watchpoint.c
+++ b/accel/tcg/watchpoint.c
@@ -26,7 +26,7 @@
 #include "tb-internal.h"
 #include "system/tcg.h"
 #include "system/replay.h"
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 #include "hw/core/cpu.h"
 #include "internal-common.h"
 
diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index b4e1458237a..088fe775c05 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -28,7 +28,7 @@
 #include "gdbstub/user.h"
 #include "signal-common.h"
 #include "trace.h"
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 #include "host-signal.h"
 
 /* target_siginfo_t must fit in gdbstub's siginfo save area. */
diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index c89610639a9..1700c3765de 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -50,7 +50,7 @@
 #include "qemu/error-report.h"
 #include "qemu/help_option.h"
 #ifdef CONFIG_TCG
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 #endif /* CONFIG_TCG */
 #include "cpu.h"
 
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 087c4d270e4..b9e9b0a6c03 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -21,7 +21,7 @@
 #include "qemu/cutils.h"
 #include "gdbstub/user.h"
 #include "exec/page-protection.h"
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 
 #include <sys/ucontext.h>
 #include <sys/resource.h>
diff --git a/system/physmem.c b/system/physmem.c
index c76503aea82..8638f8817e6 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -28,7 +28,7 @@
 #include "qemu/lockable.h"
 
 #ifdef CONFIG_TCG
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 #endif /* CONFIG_TCG */
 
 #include "exec/exec-all.h"
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index e1b898e5755..da21f99a6ac 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -220,7 +220,7 @@ static const struct SysemuCPUOps alpha_sysemu_ops = {
 };
 #endif
 
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 
 static const TCGCPUOps alpha_tcg_ops = {
     .initialize = alpha_translate_init,
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index dc0231233a6..d59433e33fb 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -29,7 +29,7 @@
 #include "cpu.h"
 #ifdef CONFIG_TCG
 #include "exec/translation-block.h"
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 #endif /* CONFIG_TCG */
 #include "internals.h"
 #include "cpu-features.h"
diff --git a/target/arm/tcg/cpu-v7m.c b/target/arm/tcg/cpu-v7m.c
index 03acdf83e00..29a41fde694 100644
--- a/target/arm/tcg/cpu-v7m.c
+++ b/target/arm/tcg/cpu-v7m.c
@@ -10,7 +10,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 #include "internals.h"
 
 #if !defined(CONFIG_USER_ONLY)
diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
index 2ad21825255..c5913665d12 100644
--- a/target/arm/tcg/cpu32.c
+++ b/target/arm/tcg/cpu32.c
@@ -10,7 +10,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 #include "internals.h"
 #include "target/arm/idau.h"
 #if !defined(CONFIG_USER_ONLY)
diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index f72ce2ae0d4..5d6d8a17ae8 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -31,7 +31,7 @@
 #endif
 #include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 #include "qapi/error.h"
 #include "qemu/guest-random.h"
 #include "mte_helper.h"
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index d0865dece35..2268fcd41b0 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -28,7 +28,7 @@
 #include "tcg/tcg.h"
 #include "vec_internal.h"
 #include "sve_ldst_internal.h"
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 #ifdef CONFIG_USER_ONLY
 #include "user/page-protection.h"
 #endif
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 8a126ff3222..5a0e21465e5 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -203,7 +203,7 @@ static const struct SysemuCPUOps avr_sysemu_ops = {
     .get_phys_page_debug = avr_cpu_get_phys_page_debug,
 };
 
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 
 static const TCGCPUOps avr_tcg_ops = {
     .initialize = avr_cpu_tcg_init,
diff --git a/target/avr/helper.c b/target/avr/helper.c
index 345708a1b39..9ea6870e44d 100644
--- a/target/avr/helper.c
+++ b/target/avr/helper.c
@@ -22,7 +22,7 @@
 #include "qemu/log.h"
 #include "qemu/error-report.h"
 #include "cpu.h"
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 #include "exec/exec-all.h"
 #include "exec/page-protection.h"
 #include "exec/cpu_ldst.h"
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index 0b7fc98f6ce..238e63bcea4 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -321,7 +321,7 @@ static void hexagon_cpu_init(Object *obj)
 {
 }
 
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 
 static const TCGCPUOps hexagon_tcg_ops = {
     .initialize = hexagon_translate_init,
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index b0bc9d35e4c..f2441d4d7fb 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -235,7 +235,7 @@ static const struct SysemuCPUOps hppa_sysemu_ops = {
 };
 #endif
 
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 
 static const TCGCPUOps hppa_tcg_ops = {
     .initialize = hppa_translate_init,
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 14ee038079a..f09ee813ac9 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -105,7 +105,7 @@ static bool x86_debug_check_breakpoint(CPUState *cs)
 }
 #endif
 
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 
 static const TCGCPUOps x86_tcg_ops = {
     .initialize = tcg_x86_init,
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index d611a604704..ecfd6edefbe 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -813,7 +813,7 @@ static void loongarch_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 }
 
 #ifdef CONFIG_TCG
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 
 static const TCGCPUOps loongarch_tcg_ops = {
     .initialize = loongarch_translate_init,
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 41dfdf58045..5eac4a38c62 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -547,7 +547,7 @@ static const struct SysemuCPUOps m68k_sysemu_ops = {
 };
 #endif /* !CONFIG_USER_ONLY */
 
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 
 static const TCGCPUOps m68k_tcg_ops = {
     .initialize = m68k_tcg_init,
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index f114789abd8..13d194cef88 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -419,7 +419,7 @@ static const struct SysemuCPUOps mb_sysemu_ops = {
 };
 #endif
 
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 
 static const TCGCPUOps mb_tcg_ops = {
     .initialize = mb_tcg_init,
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 47cd7cfdcef..0b267d2e507 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -544,7 +544,7 @@ static const Property mips_cpu_properties[] = {
 };
 
 #ifdef CONFIG_TCG
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 static const TCGCPUOps mips_tcg_ops = {
     .initialize = mips_tcg_init,
     .translate_code = mips_translate_code,
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index b7bab0d7abf..0669ba2fd10 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -232,7 +232,7 @@ static const struct SysemuCPUOps openrisc_sysemu_ops = {
 };
 #endif
 
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 
 static const TCGCPUOps openrisc_tcg_ops = {
     .initialize = openrisc_translate_init,
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index c05c2dc42dc..ed85448bc7d 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7427,7 +7427,7 @@ static const struct SysemuCPUOps ppc_sysemu_ops = {
 #endif
 
 #ifdef CONFIG_TCG
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 
 static const TCGCPUOps ppc_tcg_ops = {
   .initialize = ppc_translate_init,
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 0a137281de1..e40c8e85b26 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -31,7 +31,7 @@
 #include "qemu/error-report.h"
 #include "qemu/log.h"
 #include "hw/core/accel-cpu.h"
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 #include "tcg/tcg.h"
 #ifndef CONFIG_USER_ONLY
 #include "hw/boards.h"
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 8c50c7a1bc8..d237d007023 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -192,7 +192,7 @@ static const struct SysemuCPUOps rx_sysemu_ops = {
 };
 #endif
 
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 
 static const TCGCPUOps rx_tcg_ops = {
     .initialize = rx_translate_init,
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 97d41c23de7..3bea014f9ee 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -322,7 +322,7 @@ static const Property s390x_cpu_properties[] = {
 #endif
 
 #ifdef CONFIG_TCG
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 
 void cpu_get_tb_cpu_state(CPUS390XState *env, vaddr *pc,
                           uint64_t *cs_base, uint32_t *pflags)
diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 32717acb7d1..4ce7aa8127f 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -28,7 +28,7 @@
 #include "exec/exec-all.h"
 #include "exec/page-protection.h"
 #include "exec/cpu_ldst.h"
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 #include "qemu/int128.h"
 #include "qemu/atomic128.h"
 
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 24a22724c61..e3c2aea1a64 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -247,7 +247,7 @@ static const struct SysemuCPUOps sh4_sysemu_ops = {
 };
 #endif
 
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 
 static const TCGCPUOps superh_tcg_ops = {
     .initialize = sh4_translate_init,
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index fbd38ec334a..e3b46137178 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -992,7 +992,7 @@ static const struct SysemuCPUOps sparc_sysemu_ops = {
 #endif
 
 #ifdef CONFIG_TCG
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 
 static const TCGCPUOps sparc_tcg_ops = {
     .initialize = sparc_tcg_init,
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 95202fadbfd..eb794674c8d 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -168,7 +168,7 @@ static const struct SysemuCPUOps tricore_sysemu_ops = {
     .get_phys_page_debug = tricore_cpu_get_phys_page_debug,
 };
 
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 
 static const TCGCPUOps tricore_tcg_ops = {
     .initialize = tricore_tcg_init,
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 4eb699d1f45..efbfe73fcfb 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -228,7 +228,7 @@ static const struct SysemuCPUOps xtensa_sysemu_ops = {
 };
 #endif
 
-#include "hw/core/tcg-cpu-ops.h"
+#include "accel/tcg/cpu-ops.h"
 
 static const TCGCPUOps xtensa_tcg_ops = {
     .initialize = xtensa_translate_init,
-- 
2.47.1


