Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D92FA0310E
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 21:03:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865905.1277216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUtJv-0003dX-2Q; Mon, 06 Jan 2025 20:03:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865905.1277216; Mon, 06 Jan 2025 20:03:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUtJu-0003bS-UU; Mon, 06 Jan 2025 20:03:26 +0000
Received: by outflank-mailman (input) for mailman id 865905;
 Mon, 06 Jan 2025 20:03:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iH3c=T6=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tUtJs-0002e6-Rz
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 20:03:24 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48821c5b-cc69-11ef-99a4-01e77a169b0f;
 Mon, 06 Jan 2025 21:03:23 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-436281c8a38so105991955e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 12:03:23 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4365c08afcbsm586765365e9.21.2025.01.06.12.03.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Jan 2025 12:03:20 -0800 (PST)
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
X-Inumbo-ID: 48821c5b-cc69-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736193803; x=1736798603; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FEstRp4e2Qb00qEl2/J4TP29Zm1C+ONgiSLe4ofc5Fw=;
        b=FFy6RLjh7TTri8MMMVzmUwJljPN7BpxZ8zdqOvSf5LoMWpP/tH8oL1Z5lJQHBIgwhM
         XTGAZFf6CyM8Tnd53E4pxXZsGpy+nN6ZTB1SLsi3Z/4fyF+oJvG+3RevFuCHgaO09CMX
         C3JR6qOYy5aueOMC1xywlNWDdtsrBGD8Lqp9xwfSuOftmQHYbXJKzGoZSkFF3yS/7Y2Y
         fGGdM/ddjrrh8h+422wnOrC2ZyX++35SUn644FyKUY+cYYmpZOeonm4uzCQwsUjBAyAh
         2RErF9PpcsQZcv70kpXarc3Ab588DYOEurLbm6P9tS6sATkOX1xXdYFv6xny2h9h0i9G
         DCFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736193803; x=1736798603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FEstRp4e2Qb00qEl2/J4TP29Zm1C+ONgiSLe4ofc5Fw=;
        b=jGW+IFInjnUL40cFpLrI20PRPbD9D2DYlZnKVkogu5CVWJzjTKjfENl3VXiNGK0MeM
         VBrfd7Fwvh3iPlCTLJsdNCvT6z19Jeq4evnybwbMn8r6flAmXtk+p6SmZFDmkK8PZmPN
         hUnYl2fIDqHiJ9QpOBFIMkET02MijIUI47SyjuoksC/CrbHeavKcTKaBYB4V9Z6Zwt+Y
         dvef4q7ArC11ODfSoZ42HK63i3sPwvIglJIBM+jc+zIPJGevFOCO4AINhlPWusyz0Ulm
         C2X3eaxSnKqsYQem3io9jBa3/KBUrCVl+xIjNzpItQtlgwsmNRkEe/kduoaqGS/zvUSE
         LjMA==
X-Forwarded-Encrypted: i=1; AJvYcCWw1gHom9BynyB4uZBkt1Np8iOWdrifhlbMfaise8EY5GZkaQnrkuOTVE46D6qYqctpAOVufRidGnk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxVv9sRkqK7PoxdGCp9qP4N3fcTqoNRtJRKSdZ06THGxXRL4K2V
	h7zQNbA+FHU0c5/dd9E+f+yoU0zQjygIi5UZjxKsDkKHYjdB7CbdZahtNEGU9NM=
X-Gm-Gg: ASbGncv/u+iS0y5up9jjzLP8+lFZrO2VrJz8AXqdlfAbauxxFlRWD78KKD8xQOrwC3o
	+2EawwYwBHv75nIJr6BB/GrjyWYR+tD1jxyQw6UE/7xN/PBGnXdx3ET+JuVneZNvE0nU//pvhi+
	dRFYq3q0saYB3sXP8JTHwNSRX2TiTlA9x+QSskxF8HwFywRK/TIUMwdtYV4T8100UZOLKgS+Vhc
	q7lLIEyp8Qw/4Eq+ibso4RWJC8Fr3G+7n8HtzYPcvqXXBj/mF7nJ5mX1ZcSY8E58dBtVeAXlKKJ
	xhYW1OuVsp5lwrtPR9i1TyZNBI0MiLg=
X-Google-Smtp-Source: AGHT+IHMet/slV/sVRHbkbSGWWghuJnC++0pCmETj2WxsmX+/fk8W7s4g7KNnMtjYH7DDkOzwohlVQ==
X-Received: by 2002:a05:600c:4f84:b0:434:fec5:4ef5 with SMTP id 5b1f17b1804b1-43668643743mr497181795e9.14.1736193801273;
        Mon, 06 Jan 2025 12:03:21 -0800 (PST)
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
Subject: [RFC PATCH 3/7] accel/tcg: Implement tcg_get_cpus_queue()
Date: Mon,  6 Jan 2025 21:02:54 +0100
Message-ID: <20250106200258.37008-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106200258.37008-1-philmd@linaro.org>
References: <20250106200258.37008-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use a specific vCPUs queue for our unique software accelerator.
Register the AccelOpsClass::get_cpus_queue() handler.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/tcg-accel-ops.h | 10 ++++++++++
 accel/tcg/tcg-accel-ops.c |  8 ++++++++
 2 files changed, 18 insertions(+)

diff --git a/accel/tcg/tcg-accel-ops.h b/accel/tcg/tcg-accel-ops.h
index 6feeb3f3e9b..7b1d6288742 100644
--- a/accel/tcg/tcg-accel-ops.h
+++ b/accel/tcg/tcg-accel-ops.h
@@ -13,10 +13,20 @@
 #define TCG_ACCEL_OPS_H
 
 #include "system/cpus.h"
+#include "hw/core/cpu.h"
 
 void tcg_cpu_destroy(CPUState *cpu);
 int tcg_cpu_exec(CPUState *cpu);
 void tcg_handle_interrupt(CPUState *cpu, int mask);
 void tcg_cpu_init_cflags(CPUState *cpu, bool parallel);
 
+#ifdef CONFIG_USER_ONLY
+#define tcg_cpus_queue cpus_queue
+#else
+/* Guard with qemu_cpu_list_lock */
+extern CPUTailQ tcg_cpus_queue;
+#endif
+
+#define CPU_FOREACH_TCG(cpu) QTAILQ_FOREACH_RCU(cpu, &tcg_cpus_queue, node)
+
 #endif /* TCG_ACCEL_OPS_H */
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 6e3f1fa92b2..1fb077f7b38 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -47,6 +47,13 @@
 
 /* common functionality among all TCG variants */
 
+CPUTailQ tcg_cpus_queue = QTAILQ_HEAD_INITIALIZER(tcg_cpus_queue);
+
+static CPUTailQ *tcg_get_cpus_queue(void)
+{
+    return &tcg_cpus_queue;
+}
+
 void tcg_cpu_init_cflags(CPUState *cpu, bool parallel)
 {
     uint32_t cflags;
@@ -199,6 +206,7 @@ static inline void tcg_remove_all_breakpoints(CPUState *cpu)
 
 static void tcg_accel_ops_init(AccelOpsClass *ops)
 {
+    ops->get_cpus_queue = tcg_get_cpus_queue;
     if (qemu_tcg_mttcg_enabled()) {
         ops->create_vcpu_thread = mttcg_start_vcpu_thread;
         ops->kick_vcpu_thread = mttcg_kick_vcpu_thread;
-- 
2.47.1


