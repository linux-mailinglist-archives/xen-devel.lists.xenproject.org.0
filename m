Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9821CA0310A
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 21:03:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865915.1277235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUtK4-0004Z0-Jh; Mon, 06 Jan 2025 20:03:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865915.1277235; Mon, 06 Jan 2025 20:03:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUtK4-0004XF-GT; Mon, 06 Jan 2025 20:03:36 +0000
Received: by outflank-mailman (input) for mailman id 865915;
 Mon, 06 Jan 2025 20:03:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iH3c=T6=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tUtK3-0002e6-Dx
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 20:03:35 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4eca07d0-cc69-11ef-99a4-01e77a169b0f;
 Mon, 06 Jan 2025 21:03:33 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-385d7f19f20so6498486f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 12:03:33 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656af6d02sm618987535e9.1.2025.01.06.12.03.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Jan 2025 12:03:32 -0800 (PST)
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
X-Inumbo-ID: 4eca07d0-cc69-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736193813; x=1736798613; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zxJ3+xb03FIgQb6HyhO+0vTNSYN1GRLEa0EnbI36swA=;
        b=CEkkqN66dB2ARecescr5cSyhsvtPCXnqGseuH9gUHCNxoHbO8Fo9UOieLzjmzmkG7r
         dFpIr8+Yuw2oXbvcBn81B+w1AMuCnQMyyBrRksgeY8TosOAi84EAm3akrOK9EpVjChWK
         UwuXfHeabkmgKPAE8Qe8iwc475XV8AwWFTNRIOc5oGclUYSMRuWgcePqsEE1ZJkRrFCZ
         2mEHSYLn4c3bRp/OmNSXVfFxP8d3YJ0AErJYlgWt1FTtUD/hvS3BdBin5euRWiGHfZo7
         ceL30qV8paeSYcdrM4Ov+HjMqa+jY6jx6FKm/orio6aAO5g8VY6hIf4n/R+yD3OdWrGI
         Vlmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736193813; x=1736798613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zxJ3+xb03FIgQb6HyhO+0vTNSYN1GRLEa0EnbI36swA=;
        b=HcbUOv61ZOEiJO6MOYPraxbyjGLIc+GNvBoWmNLfjQ0KmNkZVt4iuKi6RwaF9hv1Yn
         03oa0KsE6G1IWiv0crR/caDxcpTbYtGzh1vUp1s/z00h22LvETWtM+3Kzn9bF0yBwIuF
         VrIFOJq+TR9fAzh6nIy5TnMTxx6EBYNFLTJCmfSjFMMCZnjpS4olitcNfNGpfc5MmO7m
         hMRWhE767MOZtgNzVaZmJUgNci6Qz52HNtx35bPOe6tWpFcjMyb3UWjthFsJYGxinNaJ
         Vl6wPFEl0y51Nxavwm3Yh1nweoAPPLn/RK7PwMlx2tn0AiAf+6G0aCaF8MgmOueBBq+i
         IADg==
X-Forwarded-Encrypted: i=1; AJvYcCWzqYwUEx+pxHgW0S6UZI+wyBUUQFneOhBgjwUpWPB950sNzlgvU9JLNyGnHhcJO3mccwz+Djb0VvY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw1tuz0FXB1XT3e8tpbl/sBV9xFM4GbR0vqPDNrL3sptNTu9Sae
	nBIgsNuqHBLenk+I4ZOp8fCHgXyFIMI6WuKARsdXTyJfHiNK/MdDka/lcyzxUWM=
X-Gm-Gg: ASbGnctpNLGMQDvS8w/R1aMJP+qYNMF1dM+du4OkNLX2Bhgf/R9p1DW9w8ka5tSccaJ
	zWFfZyICX346ZRKHBY2PhYoiw2GezT/rKOURK6o+MXlf6wDVdfsDya2z3Ub1q04DFFbC1wLARLP
	yzQrv7TgbRgV+jW9/y0mfe3vOrkJrK9mnOUT03+iq6OQ7a8aBnYdUBAT5MSeMwMk8n2Nq14juSD
	mmmE9OIwBJfmoLxoQ4VINwnCxtxi6T27b6BF5Xgc9iVK3jq1YrOI536rSyJH4tsayisw7/oVpb3
	NA8eVQ3yqiDo/e9kmTkvqID4toh9WBY=
X-Google-Smtp-Source: AGHT+IGoS13s7EdoAdq3NUY+QaACk4mt67qvYvBPAyuPr3+V1znGvuXeRZNJwXBUnZIrDNw4J4+93w==
X-Received: by 2002:adf:a3d9:0:b0:38a:39ad:3e31 with SMTP id ffacd0b85a97d-38a39ad4128mr24752061f8f.57.1736193813254;
        Mon, 06 Jan 2025 12:03:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Barrat?= <fbarrat@linux.ibm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Cameron Esfahani <dirty@apple.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	Alexander Graf <agraf@csgraf.de>,
	Paul Durrant <paul@xen.org>,
	David Hildenbrand <david@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-s390x@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>,
	Anthony PERARD <anthony@xenproject.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	"Edgar E . Iglesias" <edgar.iglesias@amd.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	David Woodhouse <dwmw2@infradead.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	qemu-ppc@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Anton Johansson <anjo@rev.ng>
Subject: [RFC PATCH 5/7] accel/hw: Implement hw_accel_get_cpus_queue()
Date: Mon,  6 Jan 2025 21:02:56 +0100
Message-ID: <20250106200258.37008-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106200258.37008-1-philmd@linaro.org>
References: <20250106200258.37008-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We can only run a single hardware accelerator at a time,
so add a generic hw_accel_get_cpus_queue() helper in
accel-system.c, a file common to all HW accelerators.

Register AccelOpsClass::get_cpus_queue() for each HW
accelerator. Add a generic CPU_FOREACH_HWACCEL() macro.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/system/hw_accel.h         | 9 +++++++++
 accel/accel-system.c              | 8 ++++++++
 accel/kvm/kvm-accel-ops.c         | 1 +
 accel/xen/xen-all.c               | 1 +
 target/i386/nvmm/nvmm-accel-ops.c | 1 +
 target/i386/whpx/whpx-accel-ops.c | 1 +
 6 files changed, 21 insertions(+)

diff --git a/include/system/hw_accel.h b/include/system/hw_accel.h
index 380e9e640b6..12664cac6f9 100644
--- a/include/system/hw_accel.h
+++ b/include/system/hw_accel.h
@@ -2,6 +2,7 @@
  * QEMU Hardware accelerators support
  *
  * Copyright 2016 Google, Inc.
+ * Copyright 2025 Linaro Ltd.
  *
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
@@ -17,6 +18,14 @@
 #include "system/whpx.h"
 #include "system/nvmm.h"
 
+/* Guard with qemu_cpu_list_lock */
+extern CPUTailQ hw_accel_cpus_queue;
+
+#define CPU_FOREACH_HWACCEL(cpu) \
+            QTAILQ_FOREACH_RCU(cpu, &hw_accel_cpus_queue, node)
+
+CPUTailQ *hw_accel_get_cpus_queue(void);
+
 void cpu_synchronize_state(CPUState *cpu);
 void cpu_synchronize_post_reset(CPUState *cpu);
 void cpu_synchronize_post_init(CPUState *cpu);
diff --git a/accel/accel-system.c b/accel/accel-system.c
index a7596aef59d..60877ea7a28 100644
--- a/accel/accel-system.c
+++ b/accel/accel-system.c
@@ -27,9 +27,17 @@
 #include "qemu/accel.h"
 #include "hw/boards.h"
 #include "system/cpus.h"
+#include "system/hw_accel.h"
 #include "qemu/error-report.h"
 #include "accel-system.h"
 
+CPUTailQ hw_accel_cpus_queue = QTAILQ_HEAD_INITIALIZER(hw_accel_cpus_queue);
+
+CPUTailQ *hw_accel_get_cpus_queue(void)
+{
+    return &hw_accel_cpus_queue;
+}
+
 int accel_init_machine(AccelState *accel, MachineState *ms)
 {
     AccelClass *acc = ACCEL_GET_CLASS(accel);
diff --git a/accel/kvm/kvm-accel-ops.c b/accel/kvm/kvm-accel-ops.c
index a81e8f3b03b..5f4001860d5 100644
--- a/accel/kvm/kvm-accel-ops.c
+++ b/accel/kvm/kvm-accel-ops.c
@@ -93,6 +93,7 @@ static void kvm_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
+    ops->get_cpus_queue = hw_accel_get_cpus_queue;
     ops->create_vcpu_thread = kvm_start_vcpu_thread;
     ops->cpu_thread_is_idle = kvm_vcpu_thread_is_idle;
     ops->cpus_are_resettable = kvm_cpus_are_resettable;
diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 852e9fbe5fe..ac5ed2dfb80 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -150,6 +150,7 @@ static void xen_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
+    ops->get_cpus_queue = hw_accel_get_cpus_queue;
     ops->create_vcpu_thread = dummy_start_vcpu_thread;
 }
 
diff --git a/target/i386/nvmm/nvmm-accel-ops.c b/target/i386/nvmm/nvmm-accel-ops.c
index e7b56662fee..bb407c68e14 100644
--- a/target/i386/nvmm/nvmm-accel-ops.c
+++ b/target/i386/nvmm/nvmm-accel-ops.c
@@ -84,6 +84,7 @@ static void nvmm_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
+    ops->get_cpus_queue = hw_accel_get_cpus_queue;
     ops->create_vcpu_thread = nvmm_start_vcpu_thread;
     ops->kick_vcpu_thread = nvmm_kick_vcpu_thread;
 
diff --git a/target/i386/whpx/whpx-accel-ops.c b/target/i386/whpx/whpx-accel-ops.c
index ab2e014c9ea..191214ca81d 100644
--- a/target/i386/whpx/whpx-accel-ops.c
+++ b/target/i386/whpx/whpx-accel-ops.c
@@ -86,6 +86,7 @@ static void whpx_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
+    ops->get_cpus_queue = hw_accel_get_cpus_queue;
     ops->create_vcpu_thread = whpx_start_vcpu_thread;
     ops->kick_vcpu_thread = whpx_kick_vcpu_thread;
     ops->cpu_thread_is_idle = whpx_vcpu_thread_is_idle;
-- 
2.47.1


