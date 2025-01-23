Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1DCA1AD9B
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2025 00:50:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876444.1286817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tb6y2-0004Jl-6j; Thu, 23 Jan 2025 23:50:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876444.1286817; Thu, 23 Jan 2025 23:50:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tb6y2-0004HY-0S; Thu, 23 Jan 2025 23:50:34 +0000
Received: by outflank-mailman (input) for mailman id 876444;
 Thu, 23 Jan 2025 23:50:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QxCy=UP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tb6t9-0007w9-SV
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 23:45:31 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2147c1e8-d9e4-11ef-a0e5-8be0dac302b0;
 Fri, 24 Jan 2025 00:45:31 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4364a37a1d7so15354855e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2025 15:45:31 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd4b9990sm7076685e9.29.2025.01.23.15.45.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Jan 2025 15:45:28 -0800 (PST)
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
X-Inumbo-ID: 2147c1e8-d9e4-11ef-a0e5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737675930; x=1738280730; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zGO8rj66FytAuOx0HD2g/yFD3gx++HeKfsSZtvEWB0o=;
        b=E8nClg6RFIrCM/4UBFtQR5OShb40JB1lEvZEyq1u9Q53kC/olFFjMMy2v38TRtZP8i
         JbHeBiBkgCDtJkEFfrwJqG/rI1umkkMfb3JujSRueasQsTyaTmlmwORDSsZfOgOhxiPD
         9in0mir1BgYQqCiYnOmqLIWWepYfxLg4KihajUS/pPsR1v2lrnKTI1RS+JYDDTA1Qydc
         Gm0hqiecMEnshkXF9NZYoPtw/2o2BlJiF6k/guhu9nFzmLrHJLeP1ehNS2h9vipjnRcF
         VeYjkcG/iK5ZtRYCSjxWr1fNHny1kHm1ylYvaqu6U81srVGZ3j9XC/GKKPB9Pkg3ENaH
         qA1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737675930; x=1738280730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zGO8rj66FytAuOx0HD2g/yFD3gx++HeKfsSZtvEWB0o=;
        b=VGNf/6ZOiwFjic1UfT1hux/mJu1ykKDfDey2bwlst1sHHfXkj+Ju78qqcMo3/i9O6o
         EYz4ZcGJyuSxdeLO1VgTdcuau3iBrW2MKlRXn0h9ykaXfQcjxW/TO+1H/kO37RMTBgYv
         /cgJa7/sn10j6h5ZJiDgDaJvZC9UYdDtUvzOi2+9Pyimm9cx8OxDHYnBpvIT7sKlHU55
         4nvZdXa15D5ynnHRwF6s6Wf3zmBBzQV2hc1iEWrbhFJVEC0ozK8o/+d2EKIxuDY4LZio
         PmPyPk7+cwGCftFAnUndgSkb7gco+J9Lks9/5KlotMDs/+xqNFQ8hhhTMOd3zPh26bNg
         jfRg==
X-Forwarded-Encrypted: i=1; AJvYcCVDycpKS38bx0pVEQXxfgl9uIqhqc5c0ZsatB3NPDnNlz3UgG/UyScVmaND7OAQ85rVXw87WlMBwFY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwKxvyZ37RqB6h5xlzUM2FeWqEiRo93RkhWiPg57ga0DForwmwe
	gOePG0y1q6J1uujvF2ssPzkzO3ERGsYqiL2fCqt7oKVyRS1w1GLFKKvpSeVFVes=
X-Gm-Gg: ASbGncubU0OiQH7xt3EdvS2habtKs84ZtAilLA/TIUuRx4AwM9CF0uHHtO69izFW0Xs
	N84PpBrXrWTXOkGnzn9Q54x7Z3c3MGyq8qs3ONyw4e6OS3VDywslk+3Qlsa69MP47QPUmwLw9Vl
	AhIPzfxTjFDUQUVvTpPb88vKra0P5uXB15GGXB6nLSymrGhCDB+z9HyuLfJmknV8YwjqxuW8fIk
	LpgKOD3Gzz1kZXKOzCvvZ/l9YfPqTaMx8zFWc4QdZ7vvbIlypYFapm2oValPND5Muh3txilnC7c
	uoPUgT9tIGz55XvjtcR2loyitoG/Yi32HRLlRc7Fgwc1Gu/c5HwEM84=
X-Google-Smtp-Source: AGHT+IGTWWuqfdRG1OdMv1JrJhUNbIyiZqrhlB9MFbw+o6IkF6P0PGvSwNrik0HZ18U5C5r24zY0/A==
X-Received: by 2002:a05:600c:1e0e:b0:438:a20b:6a2a with SMTP id 5b1f17b1804b1-438a20b6b71mr242006995e9.14.1737675930187;
        Thu, 23 Jan 2025 15:45:30 -0800 (PST)
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
Subject: [PATCH 13/20] accel: Forward-declare AccelOpsClass in 'qemu/typedefs.h'
Date: Fri, 24 Jan 2025 00:44:07 +0100
Message-ID: <20250123234415.59850-14-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The heavily imported "system/cpus.h" header includes "accel-ops.h"
to get AccelOpsClass type declaration. Reduce headers pressure by
forward declaring it in "qemu/typedefs.h", where we already
declare the AccelCPUState type.

Reduce "system/cpus.h" inclusions by only including
"system/accel-ops.h" when necessary.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qemu/typedefs.h           | 1 +
 include/system/accel-ops.h        | 1 -
 include/system/cpus.h             | 2 --
 accel/accel-system.c              | 1 +
 accel/hvf/hvf-accel-ops.c         | 1 +
 accel/kvm/kvm-accel-ops.c         | 1 +
 accel/qtest/qtest.c               | 1 +
 accel/tcg/cpu-exec-common.c       | 1 -
 accel/tcg/cpu-exec.c              | 1 -
 accel/tcg/monitor.c               | 1 -
 accel/tcg/tcg-accel-ops.c         | 1 +
 accel/tcg/translate-all.c         | 1 -
 accel/xen/xen-all.c               | 1 +
 cpu-common.c                      | 1 -
 cpu-target.c                      | 1 +
 gdbstub/system.c                  | 1 +
 system/cpus.c                     | 1 +
 target/i386/nvmm/nvmm-accel-ops.c | 1 +
 target/i386/whpx/whpx-accel-ops.c | 1 +
 19 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 3d84efcac47..465cc501773 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -22,6 +22,7 @@
  * Please keep this list in case-insensitive alphabetical order.
  */
 typedef struct AccelCPUState AccelCPUState;
+typedef struct AccelOpsClass AccelOpsClass;
 typedef struct AccelState AccelState;
 typedef struct AddressSpace AddressSpace;
 typedef struct AioContext AioContext;
diff --git a/include/system/accel-ops.h b/include/system/accel-ops.h
index 137fb96d444..4c99d25aeff 100644
--- a/include/system/accel-ops.h
+++ b/include/system/accel-ops.h
@@ -17,7 +17,6 @@
 #define TYPE_ACCEL_OPS "accel" ACCEL_OPS_SUFFIX
 #define ACCEL_OPS_NAME(name) (name "-" TYPE_ACCEL_OPS)
 
-typedef struct AccelOpsClass AccelOpsClass;
 DECLARE_CLASS_CHECKERS(AccelOpsClass, ACCEL_OPS, TYPE_ACCEL_OPS)
 
 /**
diff --git a/include/system/cpus.h b/include/system/cpus.h
index 1cffeaaf5c4..3226c765d01 100644
--- a/include/system/cpus.h
+++ b/include/system/cpus.h
@@ -1,8 +1,6 @@
 #ifndef QEMU_CPUS_H
 #define QEMU_CPUS_H
 
-#include "system/accel-ops.h"
-
 /* register accel-specific operations */
 void cpus_register_accel(const AccelOpsClass *i);
 
diff --git a/accel/accel-system.c b/accel/accel-system.c
index a7596aef59d..5df49fbe831 100644
--- a/accel/accel-system.c
+++ b/accel/accel-system.c
@@ -26,6 +26,7 @@
 #include "qemu/osdep.h"
 #include "qemu/accel.h"
 #include "hw/boards.h"
+#include "system/accel-ops.h"
 #include "system/cpus.h"
 #include "qemu/error-report.h"
 #include "accel-system.h"
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 945ba720513..12fc30c2761 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -54,6 +54,7 @@
 #include "exec/exec-all.h"
 #include "gdbstub/enums.h"
 #include "hw/boards.h"
+#include "system/accel-ops.h"
 #include "system/cpus.h"
 #include "system/hvf.h"
 #include "system/hvf_int.h"
diff --git a/accel/kvm/kvm-accel-ops.c b/accel/kvm/kvm-accel-ops.c
index a81e8f3b03b..54ea60909e2 100644
--- a/accel/kvm/kvm-accel-ops.c
+++ b/accel/kvm/kvm-accel-ops.c
@@ -16,6 +16,7 @@
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
+#include "system/accel-ops.h"
 #include "system/kvm.h"
 #include "system/kvm_int.h"
 #include "system/runstate.h"
diff --git a/accel/qtest/qtest.c b/accel/qtest/qtest.c
index ad7e3441a5a..7fae80f6a1b 100644
--- a/accel/qtest/qtest.c
+++ b/accel/qtest/qtest.c
@@ -18,6 +18,7 @@
 #include "qemu/option.h"
 #include "qemu/config-file.h"
 #include "qemu/accel.h"
+#include "system/accel-ops.h"
 #include "system/qtest.h"
 #include "system/cpus.h"
 #include "qemu/guest-random.h"
diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
index 100746d555a..c5c513f1e4a 100644
--- a/accel/tcg/cpu-exec-common.c
+++ b/accel/tcg/cpu-exec-common.c
@@ -19,7 +19,6 @@
 
 #include "qemu/osdep.h"
 #include "exec/log.h"
-#include "system/cpus.h"
 #include "system/tcg.h"
 #include "qemu/plugin.h"
 #include "internal-common.h"
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 8ee76e14b0d..4070d532bf1 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -33,7 +33,6 @@
 #include "qemu/rcu.h"
 #include "exec/log.h"
 #include "qemu/main-loop.h"
-#include "system/cpus.h"
 #include "exec/cpu-all.h"
 #include "system/cpu-timers.h"
 #include "exec/replay-core.h"
diff --git a/accel/tcg/monitor.c b/accel/tcg/monitor.c
index ae1dbeb79f8..eeb38a4d9ce 100644
--- a/accel/tcg/monitor.c
+++ b/accel/tcg/monitor.c
@@ -13,7 +13,6 @@
 #include "qapi/type-helpers.h"
 #include "qapi/qapi-commands-machine.h"
 #include "monitor/monitor.h"
-#include "system/cpus.h"
 #include "system/cpu-timers.h"
 #include "system/tcg.h"
 #include "tcg/tcg.h"
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 6e3f1fa92b2..132c5d14613 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -26,6 +26,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "system/accel-ops.h"
 #include "system/tcg.h"
 #include "system/replay.h"
 #include "system/cpu-timers.h"
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 786e2f6f1a7..0914d6e98b2 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -54,7 +54,6 @@
 #include "qemu/cacheinfo.h"
 #include "qemu/timer.h"
 #include "exec/log.h"
-#include "system/cpus.h"
 #include "system/cpu-timers.h"
 #include "system/tcg.h"
 #include "qapi/error.h"
diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 852e9fbe5fe..7aa28b9ab93 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -18,6 +18,7 @@
 #include "hw/xen/xen_igd.h"
 #include "chardev/char.h"
 #include "qemu/accel.h"
+#include "system/accel-ops.h"
 #include "system/cpus.h"
 #include "system/xen.h"
 #include "system/runstate.h"
diff --git a/cpu-common.c b/cpu-common.c
index 4248b2d727e..f5dcc2d136b 100644
--- a/cpu-common.c
+++ b/cpu-common.c
@@ -21,7 +21,6 @@
 #include "qemu/main-loop.h"
 #include "exec/cpu-common.h"
 #include "hw/core/cpu.h"
-#include "system/cpus.h"
 #include "qemu/lockable.h"
 #include "trace/trace-root.h"
 
diff --git a/cpu-target.c b/cpu-target.c
index f97f3a14751..20933bde7d4 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -35,6 +35,7 @@
 #include "exec/address-spaces.h"
 #include "exec/memory.h"
 #endif
+#include "system/accel-ops.h"
 #include "system/cpus.h"
 #include "system/tcg.h"
 #include "exec/tswap.h"
diff --git a/gdbstub/system.c b/gdbstub/system.c
index 7f047a285c8..416c1dbe1e9 100644
--- a/gdbstub/system.c
+++ b/gdbstub/system.c
@@ -19,6 +19,7 @@
 #include "gdbstub/commands.h"
 #include "exec/hwaddr.h"
 #include "exec/tb-flush.h"
+#include "system/accel-ops.h"
 #include "system/cpus.h"
 #include "system/runstate.h"
 #include "system/replay.h"
diff --git a/system/cpus.c b/system/cpus.c
index 37e5892c240..2cc5f887ab5 100644
--- a/system/cpus.c
+++ b/system/cpus.c
@@ -31,6 +31,7 @@
 #include "qapi/qapi-events-run-state.h"
 #include "qapi/qmp/qerror.h"
 #include "exec/gdbstub.h"
+#include "system/accel-ops.h"
 #include "system/hw_accel.h"
 #include "exec/cpu-common.h"
 #include "qemu/thread.h"
diff --git a/target/i386/nvmm/nvmm-accel-ops.c b/target/i386/nvmm/nvmm-accel-ops.c
index e7b56662fee..4e4e63de78e 100644
--- a/target/i386/nvmm/nvmm-accel-ops.c
+++ b/target/i386/nvmm/nvmm-accel-ops.c
@@ -10,6 +10,7 @@
 #include "qemu/osdep.h"
 #include "system/kvm_int.h"
 #include "qemu/main-loop.h"
+#include "system/accel-ops.h"
 #include "system/cpus.h"
 #include "qemu/guest-random.h"
 
diff --git a/target/i386/whpx/whpx-accel-ops.c b/target/i386/whpx/whpx-accel-ops.c
index ab2e014c9ea..81fdd06e487 100644
--- a/target/i386/whpx/whpx-accel-ops.c
+++ b/target/i386/whpx/whpx-accel-ops.c
@@ -11,6 +11,7 @@
 #include "qemu/osdep.h"
 #include "system/kvm_int.h"
 #include "qemu/main-loop.h"
+#include "system/accel-ops.h"
 #include "system/cpus.h"
 #include "qemu/guest-random.h"
 
-- 
2.47.1


