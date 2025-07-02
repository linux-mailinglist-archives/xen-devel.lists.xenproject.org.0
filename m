Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7A7AF6230
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 21:00:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031481.1405312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uX2gr-0006aU-Rg; Wed, 02 Jul 2025 19:00:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031481.1405312; Wed, 02 Jul 2025 19:00:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uX2gr-0006Yb-Ng; Wed, 02 Jul 2025 19:00:17 +0000
Received: by outflank-mailman (input) for mailman id 1031481;
 Wed, 02 Jul 2025 19:00:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cCzP=ZP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1uX2gq-0004Hv-FS
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 19:00:16 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca313890-5776-11f0-a314-13f23c93f187;
 Wed, 02 Jul 2025 21:00:16 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-451ebd3d149so26705225e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 12:00:16 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a997b492sm5832775e9.13.2025.07.02.12.00.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Jul 2025 12:00:14 -0700 (PDT)
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
X-Inumbo-ID: ca313890-5776-11f0-a314-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751482815; x=1752087615; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjqfaworQi5+uUmLYrSAUcjlpIaexJI+AEwRhAoMmIE=;
        b=A7uEaqy1PtSmQJwhIfDQ0SfTujJaA7/d5YdxAUMjr/CVYqlievZ7Wbo3v6iy5h5IHO
         dbR94UJcz7sKHFM6loQwOo6XuR086BtOjzObkFerAnuonf5giTYGozHRlje36tnSNbe0
         oOGXEtAuDmXpx630Fh9GhOgEVvOumGmLOkEw9XarPijkrlwb0dRtD3mSZDf7EFCs/4Ap
         Yw2ojVGIQ26YV6XIbTQbBGInC6awidKFFfyB2hbnCmX3KvdCvYLq9ExL3ZgDtCQMQjJd
         +L5Xzg9LwsYRxDIYnAsy1TEnX2kVyAAMOxBp1Au3BYuXToSaSxhLKj0ppISx9t/JY9cf
         ytTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751482815; x=1752087615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qjqfaworQi5+uUmLYrSAUcjlpIaexJI+AEwRhAoMmIE=;
        b=Qz8XYTTA4VYwRMI/ljXBHKeUcUigfe/ZivdG+H0PrBdOFx97xqjPDpRyax1dkJq0cs
         eGDjzxsTP6Y1pvcTTz7+K4D74qqcEx9RsxxWK5vcv4u6RN4dQVZd3JBXhYz60DNNfCei
         VBDnQOC2CxN41qe03cEPoGzj/9sHI4FXKGi74DcP2fk/meH1OVKytv0h864gBZqLFjrw
         WPakP6JFMkEowFNp5aagkW0eH3jMe1BFvqyZkVfDrUnE5hbO9z/tG/7aK5E2pRO0UJwE
         9OgxFrd5HWUsuKkUAVPJ/gB+HYQi4R3BHLAr55T6MLgDo1X3REWR5dIOdVvEiP1nfBw4
         /LbA==
X-Forwarded-Encrypted: i=1; AJvYcCUMDEzoGv3gwB0Gk9slQ/WNYMNzW+c4dGD3CCSmAap5ndwEk6ysDzO0MkfptTIbU8m2JAccDG0vm5M=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzx9f45OavI2geZOwPJzIOfKksdvX0MFOTYZlPpM08Cn2HYQGjQ
	EZLacqeAT85jzUlFbPVc+yVkqiEmif4WaLO6Uv7OO2EYdaXA8G/2Oy3fuUOMALBVhiE=
X-Gm-Gg: ASbGncvhAn9X2dY1SwBMbv2J5hXrR/UsICh4yCfBdGNWIvg3vAIT3pxTv0vdiWPeH7/
	Ki/il1ya6oyWTEd7emTVbZee8UPPFHg7E59q030LwF3GNzhOH6F3dD8gIQ98Ze5M2q2SRIOIEyJ
	u7uv8xMoExi9baaVUpZsyEs2vetFcCX4t9lLFc5YjBJKCvRraBRJsZeVcpQfPOr6CDVXDSAh9r5
	dwfftpPH4xaor1vRexjU7Qw6hDkLIGWkxY28ZzSsOmzZ1lIPNx88XqqxOLHJJdTy3IHJxISNDvV
	qqzRyZHEdp1tHcjAp6ZKkkjb0Td9peQGNnzdSsMg5Mj7eWg+YooWAB8xGoKA3RITsnKVh3TqGVB
	EbjT/DfjyqVnjjU+CMypLxDoH17D1y6UmslO4
X-Google-Smtp-Source: AGHT+IEMsqDmMhc/MmoijRDQjf3Y2fDb5Gx/YmjzjJrapmNl0kjGvDhI6axGOrVibgjZIifLKxTGyg==
X-Received: by 2002:a05:600c:6309:b0:445:1984:247d with SMTP id 5b1f17b1804b1-454aa185780mr4322005e9.7.1751482815180;
        Wed, 02 Jul 2025 12:00:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
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
Subject: [PATCH v4 58/65] accel: Always register AccelOpsClass::get_elapsed_ticks() handler
Date: Wed,  2 Jul 2025 20:53:20 +0200
Message-ID: <20250702185332.43650-59-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702185332.43650-1-philmd@linaro.org>
References: <20250702185332.43650-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In order to dispatch over AccelOpsClass::get_elapsed_ticks(),
we need it always defined, not calling a hidden handler under
the hood. Make AccelOpsClass::get_elapsed_ticks() mandatory.
Register the default cpus_kick_thread() for each accelerator.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


