Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 787EAA03110
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 21:03:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865922.1277245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUtKA-00055Q-SN; Mon, 06 Jan 2025 20:03:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865922.1277245; Mon, 06 Jan 2025 20:03:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUtKA-00052h-Oz; Mon, 06 Jan 2025 20:03:42 +0000
Received: by outflank-mailman (input) for mailman id 865922;
 Mon, 06 Jan 2025 20:03:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iH3c=T6=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tUtK9-0002e6-26
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 20:03:41 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52257aff-cc69-11ef-99a4-01e77a169b0f;
 Mon, 06 Jan 2025 21:03:39 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43634b570c1so106121915e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 12:03:39 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4367086e40esm543882975e9.30.2025.01.06.12.03.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Jan 2025 12:03:38 -0800 (PST)
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
X-Inumbo-ID: 52257aff-cc69-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736193819; x=1736798619; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQToL39oc1IIGRZ4x4DJpAbte9qYHUOsWxQUB+w3STI=;
        b=HnqsJLY5AhpCusyHICdrnD9l2+FE6W4BU5T/X9zrZ7qLjjHfQ9f46rVUrUQjVW63pm
         G0Wn4dFFWuDuIfzGJ3ZfqOK3kRUHkxUEWdFNxMXLbsUL2f+XGgvGChMXucFLyagnzQD9
         PfTV5dYPLE9a2wUMN31ttgZwCB+tb7Qzwyxx066ceG+1/ec/c/o+3C5zPwaxP4lWirlQ
         JJnE3OvN9Vj1/JWbIHr5r/VxSc8b01tGOh+Um/LBjLOBxJ/W2xG6oIfQr2lJpZn+sL9N
         RR/CY2wD4mm+YsWe0ybROGt5HiQJnS7qkCqgIcvAZcqVCrdvyjYPPKhCVcMQjm94SOlA
         ZKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736193819; x=1736798619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sQToL39oc1IIGRZ4x4DJpAbte9qYHUOsWxQUB+w3STI=;
        b=nKkm3VF7Mmc+4hCQvVpZpCX2kIB0u27lQEo+5C6vDiA8M11o/kWn2fviZyricED/6A
         3ehbJhY7IWC93xZNFpWYnjNRcG4mNdZctrTavO4aue6YGGoTaWVvxU7ySJ+hBW49BPz/
         u4N9Trzq2cBvVuvaVDv8u2oZe1JYNWRwW9iDUCiHkaR84Qu/qkUqP5ZZpCBKtFB057UJ
         pGLUIQZnNOuR6KoXhMlDI5wuCteKagZU1xNHHjl6liWK5YwgcbLvByLm13m7VR4tvknW
         Qj8Ey6Ih/NIXPm1XouECU9LYBy7vFaFH9xn5QFo4O2eZtC+U/d0x17G0M1FPrwL3jk0o
         NJrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWSxqcku9QthEC58td0ig9rH8803QMxBlISvRqWg+XOirBqeuPejB1WIf/iKvVWI67GYIexU3HGHQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzk0R0fBiUZrvt0fp286EKr+uqjDx/mgh/1n9NMy3yOaiYf1cNv
	MB+mEEt1YRGlg4HSMctEWmv1gOIpKJia6MzFkjWxNri8EYA54P/M5N8iJ8S5auU=
X-Gm-Gg: ASbGncsnJwKZZP2Q+L/OpsXqXwEtJK9y8VHbWCu9fWGxCtnzlcNSVUOO9IOYxu45pBs
	HPsTPh2rmxpdhgD5yGiDP4A6KzjeDK02WwiGHgiD8b5PGLrPzHVx8XrWmwaa/gURae7kOiGqHxl
	gDIsqaNnQPWqmSkhihkedl53QIY/9ChHEiREYiJRFmfrpVH9TC+GZyp8DMycuIRwfk6YohCZVPH
	x2RuFNydphYUBkkUazj4pX9xLAP1TDLn1nIbRGjZKkOK6YwzL0gsrYMy3nKFULyabruNbT5K1v7
	MEukR9hqNJ9QKqu7ot1sXkcu80qsK4w=
X-Google-Smtp-Source: AGHT+IFXiDdVgmnTH4sfktC8/xKNinP6K1bHXh0LE5bFlepNSrMiJFLvtHvHs4neclwfX3Zl5Vm/Iw==
X-Received: by 2002:a05:600c:5112:b0:434:faa9:5266 with SMTP id 5b1f17b1804b1-436c2b5b491mr121041605e9.13.1736193818909;
        Mon, 06 Jan 2025 12:03:38 -0800 (PST)
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
Subject: [RFC PATCH 6/7] accel/hvf: Use CPU_FOREACH_HVF()
Date: Mon,  6 Jan 2025 21:02:57 +0100
Message-ID: <20250106200258.37008-7-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106200258.37008-1-philmd@linaro.org>
References: <20250106200258.37008-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Only iterate over HVF vCPUs when running HVF specific code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/system/hvf_int.h  | 4 ++++
 accel/hvf/hvf-accel-ops.c | 9 +++++----
 target/arm/hvf/hvf.c      | 4 ++--
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/include/system/hvf_int.h b/include/system/hvf_int.h
index 42ae18433f0..3cf64faabd1 100644
--- a/include/system/hvf_int.h
+++ b/include/system/hvf_int.h
@@ -11,6 +11,8 @@
 #ifndef HVF_INT_H
 #define HVF_INT_H
 
+#include "system/hw_accel.h"
+
 #ifdef __aarch64__
 #include <Hypervisor/Hypervisor.h>
 typedef hv_vcpu_t hvf_vcpuid;
@@ -74,4 +76,6 @@ int hvf_put_registers(CPUState *);
 int hvf_get_registers(CPUState *);
 void hvf_kick_vcpu_thread(CPUState *cpu);
 
+#define CPU_FOREACH_HVF(cpu) CPU_FOREACH_HWACCEL(cpu)
+
 #endif
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 945ba720513..bbbe2f8d45b 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -504,7 +504,7 @@ static int hvf_insert_breakpoint(CPUState *cpu, int type, vaddr addr, vaddr len)
         }
     }
 
-    CPU_FOREACH(cpu) {
+    CPU_FOREACH_HVF(cpu) {
         err = hvf_update_guest_debug(cpu);
         if (err) {
             return err;
@@ -543,7 +543,7 @@ static int hvf_remove_breakpoint(CPUState *cpu, int type, vaddr addr, vaddr len)
         }
     }
 
-    CPU_FOREACH(cpu) {
+    CPU_FOREACH_HVF(cpu) {
         err = hvf_update_guest_debug(cpu);
         if (err) {
             return err;
@@ -560,7 +560,7 @@ static void hvf_remove_all_breakpoints(CPUState *cpu)
     QTAILQ_FOREACH_SAFE(bp, &hvf_state->hvf_sw_breakpoints, entry, next) {
         if (hvf_arch_remove_sw_breakpoint(cpu, bp) != 0) {
             /* Try harder to find a CPU that currently sees the breakpoint. */
-            CPU_FOREACH(tmpcpu)
+            CPU_FOREACH_HVF(tmpcpu)
             {
                 if (hvf_arch_remove_sw_breakpoint(tmpcpu, bp) == 0) {
                     break;
@@ -572,7 +572,7 @@ static void hvf_remove_all_breakpoints(CPUState *cpu)
     }
     hvf_arch_remove_all_hw_breakpoints();
 
-    CPU_FOREACH(cpu) {
+    CPU_FOREACH_HVF(cpu) {
         hvf_update_guest_debug(cpu);
     }
 }
@@ -581,6 +581,7 @@ static void hvf_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
+    ops->get_cpus_queue = hw_accel_get_cpus_queue;
     ops->create_vcpu_thread = hvf_start_vcpu_thread;
     ops->kick_vcpu_thread = hvf_kick_vcpu_thread;
 
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 0afd96018e0..13400ff0d5f 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -2269,10 +2269,10 @@ static void hvf_arch_set_traps(void)
 
     /* Check whether guest debugging is enabled for at least one vCPU; if it
      * is, enable exiting the guest on all vCPUs */
-    CPU_FOREACH(cpu) {
+    CPU_FOREACH_HVF(cpu) {
         should_enable_traps |= cpu->accel->guest_debug_enabled;
     }
-    CPU_FOREACH(cpu) {
+    CPU_FOREACH_HVF(cpu) {
         /* Set whether debug exceptions exit the guest */
         r = hv_vcpu_set_trap_debug_exceptions(cpu->accel->fd,
                                               should_enable_traps);
-- 
2.47.1


