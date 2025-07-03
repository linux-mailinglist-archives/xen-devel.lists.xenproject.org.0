Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B58EAF7F06
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 19:36:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032359.1406050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXNr5-0003os-HT; Thu, 03 Jul 2025 17:36:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032359.1406050; Thu, 03 Jul 2025 17:36:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXNr5-0003n3-CD; Thu, 03 Jul 2025 17:36:15 +0000
Received: by outflank-mailman (input) for mailman id 1032359;
 Thu, 03 Jul 2025 17:36:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rGZt=ZQ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1uXNr4-00021t-LA
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 17:36:14 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37512882-5834-11f0-a315-13f23c93f187;
 Thu, 03 Jul 2025 19:36:14 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-45363645a8eso893685e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jul 2025 10:36:13 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a997de2asm32406255e9.12.2025.07.03.10.36.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 03 Jul 2025 10:36:12 -0700 (PDT)
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
X-Inumbo-ID: 37512882-5834-11f0-a315-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751564173; x=1752168973; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/MPU0TKBYtEFG1xkEVwMxLJwA3rZpWlg2w7MDgOvBBA=;
        b=YgvVKIxjOKCTJBZH4vdPaACJnHnS6twhmE42Hj6Hg+8Y/s9GsFfP4JnYXvm/z2TkH0
         eR6CAD0X8Y1NI1c9BDItpf23HsPy3zRaPFwcCx8fBqht4qvQm+MV8ca3fY/7o7acC7yw
         Ykj0lqa5aLH+ou22HPZC03wq6RUbAbrnunIkWI0YtdeiuEoiBDJJo0QLooIEvMJbcoOr
         ZJcmCQ6PeiQ7EphAPRE9kj43ukvfiSNqfMiMGk50K/khixqH8AISbYvyhfqzIyuNnw6L
         Wy/JKHyKzjo8lkhbvLPVJqs2EgZ8nyPTdrz4JueuBmKL9ZyKT9MsTbUDVemLoX3rpMfp
         uHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751564173; x=1752168973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/MPU0TKBYtEFG1xkEVwMxLJwA3rZpWlg2w7MDgOvBBA=;
        b=kps9/NOHFpzW5oeglriPLGr6fljbvwTitXDgQJOUDcNQT3wOrTIrWIAx2H0/jI5Ciu
         ivhuLIczqXI8WcoqnV6DcFBIM8mLwSyGcAKKdI2xyPqyAU2XjCB0qPJ5PnJfvYsPJs7k
         XbSpT73Mb6Ve4+eIL19aLJGxJ4JUJyCmefHgRMKatENnX1wKFM8r/UqRK1yGcpmxxjaj
         FqnWT6dYQnKxij4lnNZXn0eZlPanKS8r6iopjmZFKo35OLHtxqTMM6WTjjVI80Q8XfUi
         fybZjY61RjMT1/kS8+ljRLHq18Spo5eXHjHSakrFSk0wfFT4xjUPxrfAeAIEXExe9WEo
         AegQ==
X-Forwarded-Encrypted: i=1; AJvYcCVS9EM/GJmn5B1lBCd4KBGa6aGcT2dPrXgNaHlFsXz4I9qHcbX/gYFiPA4fAuR22xHuXCCTvibJucY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwLxwogLMHOXfbKvEV0tN1Wq6SS0Drjo4KD/j7iCDrsl6Owcn6g
	JaapJCJKApzbjBVPZfW6YNVRrBdXdP202RISzl0OibfYKOVqXSJMWHjlJby6RnnUdJk=
X-Gm-Gg: ASbGnctR4MBO/5cEU99mTFxRUIeB1opzRzMkk67SgUEe9c+e5AqIjV/iogSwstxrdiP
	9ShlnQS4IznMjH/r0fzW5GOo9yNxH1RJ3I7zMWAGn00NUADDQbZQfn7Wqb/6lufMrPOJLEF1D4l
	fBwM389sbAdCcQykRr18dNeAa/9Q50I/VCdYYBmV7w0zjWITakulqReOxsAeW3HCtZ0vv3Vv92X
	Iq/NkYSrZxfdcp5m63T8LNNMnDM7nf+/mONWqQeyl+nz30M8+2wBMVHudX31lDaPA6UQIP4ct1a
	XdeJEvWYxtaiSiA32W/WedUSGmZ7Gx42KBNotCjdoRLN0sIODu0VRH9YyJDTZ7M6QSwUCM79//U
	uA3Tu26h5pNpbU2L655sfSn573n/m8GyATgH7
X-Google-Smtp-Source: AGHT+IF1KdJk6c4ueSnjnRty/oc46EojwVkf/EW5AwRmuKQECJq5AW7BgV+yFnxaCbwEOJm8eBUtQQ==
X-Received: by 2002:a05:600c:c8f:b0:453:9bf:6f79 with SMTP id 5b1f17b1804b1-454a9cd69d9mr43963695e9.26.1751564173127;
        Thu, 03 Jul 2025 10:36:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	Mads Ynddal <mads@ynddal.dk>,
	Fabiano Rosas <farosas@suse.de>,
	Laurent Vivier <lvivier@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH v6 37/39] accel: Rename 'system/accel-ops.h' -> 'accel/accel-cpu-ops.h'
Date: Thu,  3 Jul 2025 19:32:43 +0200
Message-ID: <20250703173248.44995-38-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703173248.44995-1-philmd@linaro.org>
References: <20250703173248.44995-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Unfortunately "system/accel-ops.h" handlers are not only
system-specific. For example, the cpu_reset_hold() hook
is part of the vCPU creation, after it is realized.

Mechanical rename to drop 'system' using:

  $ sed -i -e s_system/accel-ops.h_accel/accel-cpu-ops.h_g \
              $(git grep -l system/accel-ops.h)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/{system/accel-ops.h => accel/accel-cpu-ops.h} | 8 ++++----
 accel/accel-common.c                                  | 2 +-
 accel/accel-system.c                                  | 2 +-
 accel/hvf/hvf-accel-ops.c                             | 2 +-
 accel/kvm/kvm-accel-ops.c                             | 2 +-
 accel/qtest/qtest.c                                   | 2 +-
 accel/tcg/tcg-accel-ops.c                             | 2 +-
 accel/xen/xen-all.c                                   | 2 +-
 cpu-target.c                                          | 2 +-
 gdbstub/system.c                                      | 2 +-
 system/cpus.c                                         | 2 +-
 target/i386/nvmm/nvmm-accel-ops.c                     | 2 +-
 target/i386/whpx/whpx-accel-ops.c                     | 2 +-
 13 files changed, 16 insertions(+), 16 deletions(-)
 rename include/{system/accel-ops.h => accel/accel-cpu-ops.h} (96%)

diff --git a/include/system/accel-ops.h b/include/accel/accel-cpu-ops.h
similarity index 96%
rename from include/system/accel-ops.h
rename to include/accel/accel-cpu-ops.h
index 17c80887016..a045d7c5d4a 100644
--- a/include/system/accel-ops.h
+++ b/include/accel/accel-cpu-ops.h
@@ -1,5 +1,5 @@
 /*
- * Accelerator OPS, used for cpus.c module
+ * Accelerator per-vCPU handlers
  *
  * Copyright 2021 SUSE LLC
  *
@@ -7,8 +7,8 @@
  * See the COPYING file in the top-level directory.
  */
 
-#ifndef ACCEL_OPS_H
-#define ACCEL_OPS_H
+#ifndef ACCEL_CPU_OPS_H
+#define ACCEL_CPU_OPS_H
 
 #include "qemu/accel.h"
 #include "exec/vaddr.h"
@@ -88,4 +88,4 @@ struct AccelOpsClass {
 
 void generic_handle_interrupt(CPUState *cpu, int old_mask, int new_mask);
 
-#endif /* ACCEL_OPS_H */
+#endif /* ACCEL_CPU_OPS_H */
diff --git a/accel/accel-common.c b/accel/accel-common.c
index b3fbe3216aa..b490612447b 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -10,7 +10,7 @@
 #include "qemu/osdep.h"
 #include "qemu/accel.h"
 #include "qemu/target-info.h"
-#include "system/accel-ops.h"
+#include "accel/accel-cpu-ops.h"
 #include "accel/accel-cpu.h"
 #include "accel-internal.h"
 
diff --git a/accel/accel-system.c b/accel/accel-system.c
index 637e2390f35..451567e1a50 100644
--- a/accel/accel-system.c
+++ b/accel/accel-system.c
@@ -26,7 +26,7 @@
 #include "qemu/osdep.h"
 #include "qemu/accel.h"
 #include "hw/boards.h"
-#include "system/accel-ops.h"
+#include "accel/accel-cpu-ops.h"
 #include "system/cpus.h"
 #include "qemu/error-report.h"
 #include "accel-internal.h"
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index a0248942f3a..b13937b29e1 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -54,7 +54,7 @@
 #include "gdbstub/enums.h"
 #include "exec/cpu-common.h"
 #include "hw/core/cpu.h"
-#include "system/accel-ops.h"
+#include "accel/accel-cpu-ops.h"
 #include "system/cpus.h"
 #include "system/hvf.h"
 #include "system/hvf_int.h"
diff --git a/accel/kvm/kvm-accel-ops.c b/accel/kvm/kvm-accel-ops.c
index 2a744092749..2c8f4fecb17 100644
--- a/accel/kvm/kvm-accel-ops.c
+++ b/accel/kvm/kvm-accel-ops.c
@@ -16,7 +16,7 @@
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
-#include "system/accel-ops.h"
+#include "accel/accel-cpu-ops.h"
 #include "system/kvm.h"
 #include "system/kvm_int.h"
 #include "system/runstate.h"
diff --git a/accel/qtest/qtest.c b/accel/qtest/qtest.c
index 2b831260201..a7fc8bee6dd 100644
--- a/accel/qtest/qtest.c
+++ b/accel/qtest/qtest.c
@@ -18,7 +18,7 @@
 #include "qemu/option.h"
 #include "qemu/config-file.h"
 #include "qemu/accel.h"
-#include "system/accel-ops.h"
+#include "accel/accel-cpu-ops.h"
 #include "system/qtest.h"
 #include "system/cpus.h"
 #include "qemu/guest-random.h"
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index bc809ad5640..8f071d2cfeb 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -26,7 +26,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "system/accel-ops.h"
+#include "accel/accel-cpu-ops.h"
 #include "system/tcg.h"
 #include "system/replay.h"
 #include "exec/icount.h"
diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index bd0ff64befc..55a60bb42c2 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -19,7 +19,7 @@
 #include "chardev/char.h"
 #include "qemu/accel.h"
 #include "accel/dummy-cpus.h"
-#include "system/accel-ops.h"
+#include "accel/accel-cpu-ops.h"
 #include "system/cpus.h"
 #include "system/xen.h"
 #include "system/runstate.h"
diff --git a/cpu-target.c b/cpu-target.c
index 1c90a307593..2049eb1d0f6 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -19,7 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "system/accel-ops.h"
+#include "accel/accel-cpu-ops.h"
 #include "system/cpus.h"
 #include "exec/cpu-common.h"
 #include "exec/tswap.h"
diff --git a/gdbstub/system.c b/gdbstub/system.c
index 03934deed49..1c48915b6a5 100644
--- a/gdbstub/system.c
+++ b/gdbstub/system.c
@@ -20,7 +20,7 @@
 #include "gdbstub/commands.h"
 #include "exec/hwaddr.h"
 #include "exec/tb-flush.h"
-#include "system/accel-ops.h"
+#include "accel/accel-cpu-ops.h"
 #include "system/cpus.h"
 #include "system/runstate.h"
 #include "system/replay.h"
diff --git a/system/cpus.c b/system/cpus.c
index f90b8be9eee..dae66a1bc4d 100644
--- a/system/cpus.c
+++ b/system/cpus.c
@@ -31,7 +31,7 @@
 #include "qapi/qapi-events-run-state.h"
 #include "qapi/qmp/qerror.h"
 #include "exec/gdbstub.h"
-#include "system/accel-ops.h"
+#include "accel/accel-cpu-ops.h"
 #include "system/hw_accel.h"
 #include "exec/cpu-common.h"
 #include "qemu/thread.h"
diff --git a/target/i386/nvmm/nvmm-accel-ops.c b/target/i386/nvmm/nvmm-accel-ops.c
index a5517b0abf3..3799260bbde 100644
--- a/target/i386/nvmm/nvmm-accel-ops.c
+++ b/target/i386/nvmm/nvmm-accel-ops.c
@@ -10,7 +10,7 @@
 #include "qemu/osdep.h"
 #include "system/kvm_int.h"
 #include "qemu/main-loop.h"
-#include "system/accel-ops.h"
+#include "accel/accel-cpu-ops.h"
 #include "system/cpus.h"
 #include "qemu/guest-random.h"
 
diff --git a/target/i386/whpx/whpx-accel-ops.c b/target/i386/whpx/whpx-accel-ops.c
index 31cf15f0045..2b51b35bfa6 100644
--- a/target/i386/whpx/whpx-accel-ops.c
+++ b/target/i386/whpx/whpx-accel-ops.c
@@ -11,7 +11,7 @@
 #include "qemu/osdep.h"
 #include "system/kvm_int.h"
 #include "qemu/main-loop.h"
-#include "system/accel-ops.h"
+#include "accel/accel-cpu-ops.h"
 #include "system/cpus.h"
 #include "qemu/guest-random.h"
 
-- 
2.49.0


