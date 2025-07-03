Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C33AF71D4
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 13:12:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032030.1405800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXHrU-0000jm-82; Thu, 03 Jul 2025 11:12:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032030.1405800; Thu, 03 Jul 2025 11:12:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXHrU-0000iF-4H; Thu, 03 Jul 2025 11:12:16 +0000
Received: by outflank-mailman (input) for mailman id 1032030;
 Thu, 03 Jul 2025 11:12:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rGZt=ZQ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1uXHgs-0003ud-VB
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 11:01:18 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0afa8adb-57fd-11f0-b894-0df219b8e170;
 Thu, 03 Jul 2025 13:01:17 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a503d9ef59so4100173f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jul 2025 04:01:17 -0700 (PDT)
Received: from localhost.localdomain ([83.247.137.20])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a892e62144sm18640340f8f.92.2025.07.03.04.01.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 03 Jul 2025 04:01:15 -0700 (PDT)
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
X-Inumbo-ID: 0afa8adb-57fd-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751540477; x=1752145277; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uKP0VLAduRG0J485sBOx50Iuc98l/po9P1xQbbf9Dzs=;
        b=vAKymo6pbdHYJ8/Mk8pTM3ZYniU8CtGJRqW+VGVtiIVFntAkS5KFLj6FXGjdfzvqCB
         xZErAN5nzBo8WqyDIDh9GU4np+60EO1YFhUZs2hdU+POOANyl+0CwI9wmlF/XoD9uODr
         qBzgQ6AVBV/7F1SV70o5wHPzgKgvllvf3q8XMk/Sde+PY+sL1AW5T/ewsHFP6d8ZttUt
         pqcyIawjpRmIi60LUdQQcM+JRNlWO4Fv2kEsAVGtBhgIPifoi9NHB1wQPoQ3hqhMYdGC
         Z+MmmOiUWWRZdqSMmOtCrPclSx0r/xC43aCLG5K8GDKhzXAQGeWpIsr1kAVuI+/VN0f5
         TINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751540477; x=1752145277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uKP0VLAduRG0J485sBOx50Iuc98l/po9P1xQbbf9Dzs=;
        b=A7/ZDK2j0xyD4bL2hH655HGE8uWUMDuKsRc5pO+BavgVxYVEWM2CB8sHO8RmcoNzNT
         fCPW9f3ekmF4k4kVTnsZBdS/FkXuce/kW3XKa+xs2ZlQAsO1hh2ZI+Vv5Pu2F/QiEdCQ
         z+OEHUNPIav4kehEzvw+eJtOlyiDfVmRoGEHaybUWwDfGXDVThXJJ/v9vigDKGHzMCW7
         ZRqlJOllV6Z9fT+sI95nB01BmSVYNKuFYf1FOEmaqP0gjrKIcEm6/TiKJKQEYMmHeVHn
         qWLjRUNVdH5ktK4aGcutHTURe48kpqWLkUX5HZ5gBS3+O7QWcbkqw4MeSEc/cRNiM+r+
         LzLw==
X-Forwarded-Encrypted: i=1; AJvYcCVlB32ITfFp0K/lIUaDEIqDF/Fl/YDzOhNxA/NYaeGVxBqzjC2fX8MK7qhcmpj36c4EiZPspyg3eQg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzx2YAWfHwD0WmyECcLZt2Y1eYUt3KdcFyQq4UO3MPpJ7umacL2
	Mn+XX/9KJNnrUPWI6OcFFfIy/JnA3GRIhshM80yp4YcIDBdLAFHgj5CXVBBGh95sG40=
X-Gm-Gg: ASbGncvRPXd20txKzZJV6DY1WKAlRlQYupcC+AYfeyQueDPOQaMhLbreAKbvRkUC7UC
	p4iqLi7yQ/Qdtobor9UpQl9BrilZYdLPEdaH3BhgTnPrGGKj06ATjIbFA6UOcpHC7K5c17IHitM
	R9P5n3XxsI2d4itLWMcSJLhPni6Kff+iLteACRIyv0g/ONG1U/iurbhzArklKmSdZC4/dKEDGri
	Wdnr3VtB4bkyv44CSlJSPBVd0Agjo4dBtP04Lzn3eu49jOMsDQMgQ6srXhADeJRBIMYKxM4h5Kr
	seGEW38BlK5mfiMZWXNNbruqjE5soUk5UjFFV4OKtCTNDyfq4Rda27SEg29K11Kimq1UvGaQcBd
	XxcSN2mtwKok=
X-Google-Smtp-Source: AGHT+IH1waIm5SnslmK1jzYHT2bCe4cwQIZPcz0opPv+3p5nz+zh7l6lVax9Sh2kElftxEKA9kEKhw==
X-Received: by 2002:a05:6000:22c3:b0:3a4:d8f2:d9d with SMTP id ffacd0b85a97d-3b200865a0amr5118820f8f.38.1751540475685;
        Thu, 03 Jul 2025 04:01:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	kvm@vger.kernel.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
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
	xen-devel@lists.xenproject.org
Subject: [PATCH v5 63/69] accel: Always register AccelOpsClass::get_elapsed_ticks() handler
Date: Thu,  3 Jul 2025 12:55:29 +0200
Message-ID: <20250703105540.67664-64-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703105540.67664-1-philmd@linaro.org>
References: <20250703105540.67664-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In order to dispatch over AccelOpsClass::get_elapsed_ticks(),
we need it always defined, not calling a hidden handler under
the hood. Make AccelOpsClass::get_elapsed_ticks() mandatory.
Register the default cpu_get_ticks() for each accelerator.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
---
 include/system/accel-ops.h        | 1 +
 accel/hvf/hvf-accel-ops.c         | 2 ++
 accel/kvm/kvm-accel-ops.c         | 3 +++
 accel/qtest/qtest.c               | 2 ++
 accel/tcg/tcg-accel-ops.c         | 3 +++
 accel/xen/xen-all.c               | 2 ++
 system/cpus.c                     | 6 ++----
 target/i386/nvmm/nvmm-accel-ops.c | 3 +++
 target/i386/whpx/whpx-accel-ops.c | 3 +++
 9 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/include/system/accel-ops.h b/include/system/accel-ops.h
index e1e6985a27c..8683cd37716 100644
--- a/include/system/accel-ops.h
+++ b/include/system/accel-ops.h
@@ -86,6 +86,7 @@ struct AccelOpsClass {
     int64_t (*get_virtual_clock)(void);
     void (*set_virtual_clock)(int64_t time);
 
+    /* get_elapsed_ticks is mandatory. */
     int64_t (*get_elapsed_ticks)(void);
 
     /* gdbstub hooks */
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 420630773c8..17776e700eb 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -54,6 +54,7 @@
 #include "gdbstub/enums.h"
 #include "exec/cpu-common.h"
 #include "system/accel-ops.h"
+#include "system/cpu-timers.h"
 #include "system/cpus.h"
 #include "system/hvf.h"
 #include "system/hvf_int.h"
@@ -367,6 +368,7 @@ static void hvf_accel_ops_class_init(ObjectClass *oc, const void *data)
     ops->remove_all_breakpoints = hvf_remove_all_breakpoints;
     ops->update_guest_debug = hvf_update_guest_debug;
 
+    ops->get_elapsed_ticks = cpu_get_ticks;
     ops->get_vcpu_stats = hvf_get_vcpu_stats;
 };
 
diff --git a/accel/kvm/kvm-accel-ops.c b/accel/kvm/kvm-accel-ops.c
index a4bcaa87c8d..f27228d4cd9 100644
--- a/accel/kvm/kvm-accel-ops.c
+++ b/accel/kvm/kvm-accel-ops.c
@@ -17,6 +17,7 @@
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "system/accel-ops.h"
+#include "system/cpu-timers.h"
 #include "system/kvm.h"
 #include "system/kvm_int.h"
 #include "system/runstate.h"
@@ -94,6 +95,8 @@ static void kvm_accel_ops_class_init(ObjectClass *oc, const void *data)
     ops->remove_breakpoint = kvm_remove_breakpoint;
     ops->remove_all_breakpoints = kvm_remove_all_breakpoints;
 #endif
+
+    ops->get_elapsed_ticks = cpu_get_ticks;
 }
 
 static const TypeInfo kvm_accel_ops_type = {
diff --git a/accel/qtest/qtest.c b/accel/qtest/qtest.c
index 8e2379d6e37..b019cf69412 100644
--- a/accel/qtest/qtest.c
+++ b/accel/qtest/qtest.c
@@ -20,6 +20,7 @@
 #include "qemu/accel.h"
 #include "system/accel-ops.h"
 #include "system/qtest.h"
+#include "system/cpu-timers.h"
 #include "system/cpus.h"
 #include "qemu/guest-random.h"
 #include "qemu/main-loop.h"
@@ -67,6 +68,7 @@ static void qtest_accel_ops_class_init(ObjectClass *oc, const void *data)
     ops->thread_precreate = dummy_thread_precreate;
     ops->cpu_thread_routine = dummy_cpu_thread_routine;
     ops->kick_vcpu_thread = cpus_kick_thread;
+    ops->get_elapsed_ticks = cpu_get_ticks;
     ops->get_virtual_clock = qtest_get_virtual_clock;
     ops->set_virtual_clock = qtest_set_virtual_clock;
     ops->handle_interrupt = generic_handle_interrupt;
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index a8c24cf8a4c..f22f5d73abe 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -27,6 +27,7 @@
 
 #include "qemu/osdep.h"
 #include "system/accel-ops.h"
+#include "system/cpu-timers.h"
 #include "system/tcg.h"
 #include "system/replay.h"
 #include "exec/icount.h"
@@ -205,6 +206,7 @@ static void tcg_accel_ops_init(AccelClass *ac)
         ops->cpu_thread_routine = mttcg_cpu_thread_routine;
         ops->kick_vcpu_thread = mttcg_kick_vcpu_thread;
         ops->handle_interrupt = tcg_handle_interrupt;
+        ops->get_elapsed_ticks = cpu_get_ticks;
     } else {
         ops->create_vcpu_thread = rr_start_vcpu_thread;
         ops->kick_vcpu_thread = rr_kick_vcpu_thread;
@@ -215,6 +217,7 @@ static void tcg_accel_ops_init(AccelClass *ac)
             ops->get_elapsed_ticks = icount_get;
         } else {
             ops->handle_interrupt = tcg_handle_interrupt;
+            ops->get_elapsed_ticks = cpu_get_ticks;
         }
     }
 
diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 18ae0d82db5..48d458bc4c7 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -20,6 +20,7 @@
 #include "qemu/accel.h"
 #include "accel/dummy-cpus.h"
 #include "system/accel-ops.h"
+#include "system/cpu-timers.h"
 #include "system/cpus.h"
 #include "system/xen.h"
 #include "system/runstate.h"
@@ -156,6 +157,7 @@ static void xen_accel_ops_class_init(ObjectClass *oc, const void *data)
     ops->cpu_thread_routine = dummy_cpu_thread_routine;
     ops->kick_vcpu_thread = cpus_kick_thread;
     ops->handle_interrupt = generic_handle_interrupt;
+    ops->get_elapsed_ticks = cpu_get_ticks;
 }
 
 static const TypeInfo xen_accel_ops_type = {
diff --git a/system/cpus.c b/system/cpus.c
index 6c64ffccbb3..d32b89ecf7b 100644
--- a/system/cpus.c
+++ b/system/cpus.c
@@ -240,10 +240,7 @@ void cpus_set_virtual_clock(int64_t new_time)
  */
 int64_t cpus_get_elapsed_ticks(void)
 {
-    if (cpus_accel->get_elapsed_ticks) {
-        return cpus_accel->get_elapsed_ticks();
-    }
-    return cpu_get_ticks();
+    return cpus_accel->get_elapsed_ticks();
 }
 
 void generic_handle_interrupt(CPUState *cpu, int old_mask, int new_mask)
@@ -668,6 +665,7 @@ void cpus_register_accel(const AccelOpsClass *ops)
     assert(ops->create_vcpu_thread || ops->cpu_thread_routine);
     assert(ops->kick_vcpu_thread);
     assert(ops->handle_interrupt);
+    assert(ops->get_elapsed_ticks);
     cpus_accel = ops;
 }
 
diff --git a/target/i386/nvmm/nvmm-accel-ops.c b/target/i386/nvmm/nvmm-accel-ops.c
index d568cc737b1..4deff57471c 100644
--- a/target/i386/nvmm/nvmm-accel-ops.c
+++ b/target/i386/nvmm/nvmm-accel-ops.c
@@ -11,6 +11,7 @@
 #include "system/kvm_int.h"
 #include "qemu/main-loop.h"
 #include "system/accel-ops.h"
+#include "system/cpu-timers.h"
 #include "system/cpus.h"
 #include "qemu/guest-random.h"
 
@@ -83,6 +84,8 @@ static void nvmm_accel_ops_class_init(ObjectClass *oc, const void *data)
     ops->synchronize_post_init = nvmm_cpu_synchronize_post_init;
     ops->synchronize_state = nvmm_cpu_synchronize_state;
     ops->synchronize_pre_loadvm = nvmm_cpu_synchronize_pre_loadvm;
+
+    ops->get_elapsed_ticks = cpu_get_ticks;
 }
 
 static const TypeInfo nvmm_accel_ops_type = {
diff --git a/target/i386/whpx/whpx-accel-ops.c b/target/i386/whpx/whpx-accel-ops.c
index fbffd952ac4..f47033a502c 100644
--- a/target/i386/whpx/whpx-accel-ops.c
+++ b/target/i386/whpx/whpx-accel-ops.c
@@ -12,6 +12,7 @@
 #include "system/kvm_int.h"
 #include "qemu/main-loop.h"
 #include "system/accel-ops.h"
+#include "system/cpu-timers.h"
 #include "system/cpus.h"
 #include "qemu/guest-random.h"
 
@@ -86,6 +87,8 @@ static void whpx_accel_ops_class_init(ObjectClass *oc, const void *data)
     ops->synchronize_post_init = whpx_cpu_synchronize_post_init;
     ops->synchronize_state = whpx_cpu_synchronize_state;
     ops->synchronize_pre_loadvm = whpx_cpu_synchronize_pre_loadvm;
+
+    ops->get_elapsed_ticks = cpu_get_ticks;
 }
 
 static const TypeInfo whpx_accel_ops_type = {
-- 
2.49.0


