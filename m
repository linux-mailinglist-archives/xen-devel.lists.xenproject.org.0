Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F478904B3
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 17:14:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699096.1091666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpsNy-0001uh-UO; Thu, 28 Mar 2024 16:13:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699096.1091666; Thu, 28 Mar 2024 16:13:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpsNy-0001so-RB; Thu, 28 Mar 2024 16:13:50 +0000
Received: by outflank-mailman (input) for mailman id 699096;
 Thu, 28 Mar 2024 16:13:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yxy0=LC=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rps8Q-00071m-F1
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 15:57:46 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea569b5e-ed1b-11ee-a1ef-f123f15fe8a2;
 Thu, 28 Mar 2024 16:57:44 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-56be32b9775so1376564a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 08:57:44 -0700 (PDT)
Received: from m1x-phil.lan (pas38-h02-176-184-5-52.dsl.sta.abo.bbox.fr.
 [176.184.5.52]) by smtp.gmail.com with ESMTPSA id
 p12-20020a50c94c000000b005689bfe2688sm980668edh.39.2024.03.28.08.57.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 28 Mar 2024 08:57:43 -0700 (PDT)
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
X-Inumbo-ID: ea569b5e-ed1b-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711641464; x=1712246264; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6394pyfYpf5VBXUXIwRMOR2ZbX+o8CbfYrADQtuSgY=;
        b=WvI1SBUK4fKEIdNST5Oom0UvcTyjk0JKgtMjJVPOFxIkuyfji5tAKzA8hrnw9pnA8I
         /5HQNNqXTjLs2BO7m7XiL+hadBT8bd2VbQcEoHj+/MVFJF+GbejXSkPR6OFZuzF+/um6
         pr5ScokIigQD9i+T/sI51DWty9RLBKk5OgTGt/TnfDEbD1Rz5TVwtG4wuf8TDkZAqxnU
         CZ2kLvpSEg27Va7tcgGyA6mCDdRn0i5zppb79RwwNZSCPoFYhirLQItQsqj0DR3PhwkP
         F+jSx9UBdFeIgMOXRNvUkIe594IiksN6kf7LRuOoQRCATldF9nbHP23ZxRiaY2MKzKWB
         fNBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711641464; x=1712246264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K6394pyfYpf5VBXUXIwRMOR2ZbX+o8CbfYrADQtuSgY=;
        b=H7HtCWa1lKWFwIlMV/Dwlb4Arm4vOaFOQIWq0p4Vi6EofMVjX/BBIleP9SxG1kGVxt
         9/Qnf5RH18+S07VW6RBYnJ8A9/oe/o2ufL5LwIG6N6bHgPKlAk/3IA8LfritCgKE8ten
         RO1uAr4ax4HRG5XbVLIHJxXsIca8qRW2s1BnIuwWsxGMsNpOKd7hALRvcmswSQr0sa1u
         1r+rXdrJDHVwypByhRLTU0TPWKHJu5eSjVoZb6IjgEAvhXi+uxsO7d24pUMyEuS9MHMY
         8iz/38Y3jrPKNj2mW8r1b4LFOHS1CubLBNf0N/f6l+EhgMFA4NmQNQ2OUMF3VST+ecGL
         hlfg==
X-Forwarded-Encrypted: i=1; AJvYcCUFN905sBQh/WmeaegqW4nyTHiuIGy3+xmQgOl13QXPB/ytj/5/X9Gz2AAgd7JsAlYon2D+5xQLcQ7Cnk90OF5kpEIxYfj5OcMV4BPEqBU=
X-Gm-Message-State: AOJu0YwfJIfcTlIdQwfd5+mma2MvRETMRpjuM0eBn9DsXs6xGobkM4gh
	1B0nbXL9uoR0JTW+wd3opzADDwtq57hq+Q9SU5Q7Cai+YV+v/AARMGqb+yKjjZk=
X-Google-Smtp-Source: AGHT+IHopSZ4mG4FmVwZwRyY4uEq7A+kY6caw0K60z5ZjV+GdO0roOAWBLEuOIrEv1csN4Rr2G6Jmg==
X-Received: by 2002:a50:d750:0:b0:565:e610:c358 with SMTP id i16-20020a50d750000000b00565e610c358mr2278668edj.38.1711641464364;
        Thu, 28 Mar 2024 08:57:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Bernhard Beschow <shentey@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Ani Sinha <anisinha@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH-for-9.1 29/29] hw/i386/pc: Move ISA-only PC machine to pc_isa.c
Date: Thu, 28 Mar 2024 16:54:37 +0100
Message-ID: <20240328155439.58719-30-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240328155439.58719-1-philmd@linaro.org>
References: <20240328155439.58719-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Extract the ISA-only PC machine code from pc_piix.c
to a new file, pc_isa.c.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS         |  1 +
 hw/i386/pc_isa.c    | 33 +++++++++++++++++++++++++++++++++
 hw/i386/pc_piix.c   | 23 -----------------------
 hw/i386/meson.build |  1 +
 4 files changed, 35 insertions(+), 23 deletions(-)
 create mode 100644 hw/i386/pc_isa.c

diff --git a/MAINTAINERS b/MAINTAINERS
index a07af6b9d4..a68fa813b8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1812,6 +1812,7 @@ M: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
 S: Supported
 F: include/hw/i386/
 F: hw/i386/
+X: hw/i386/pc_isa.c
 F: hw/pci-host/i440fx.c
 F: hw/pci-host/q35.c
 F: hw/pci-host/pam.c
diff --git a/hw/i386/pc_isa.c b/hw/i386/pc_isa.c
new file mode 100644
index 0000000000..a98c75f3ae
--- /dev/null
+++ b/hw/i386/pc_isa.c
@@ -0,0 +1,33 @@
+/*
+ * QEMU ISA PC System Emulator
+ *
+ * Copyright (c) 2003-2004 Fabrice Bellard
+ *
+ * SPDX-License-Identifier: MIT
+ */
+
+#include "qemu/osdep.h"
+#include "qom/object.h"
+#include "hw/boards.h"
+#include "hw/i386/pc.h"
+#include "hw/char/parallel-isa.h"
+#include "target/i386/cpu-qom.h"
+
+static void pc_init_isa(MachineState *machine)
+{
+    pc_piix_init(machine, NULL);
+}
+
+static void isapc_machine_options(MachineClass *m)
+{
+    m->desc = "ISA-only PC";
+    m->max_cpus = 1;
+    m->option_rom_has_mr = true;
+    m->rom_file_has_mr = false;
+    m->default_nic = "ne2k_isa";
+    m->default_cpu_type = X86_CPU_TYPE_NAME("486");
+    m->no_parallel = !module_object_class_by_name(TYPE_ISA_PARALLEL);
+}
+
+DEFINE_PC_MACHINE(isapc, "isapc", pc_init_isa,
+                  isapc_machine_options, TYPE_PC_MACHINE);
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 4a3ae72fe4..f94221ab92 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -434,13 +434,6 @@ static void pc_set_south_bridge(Object *obj, int value, Error **errp)
  * hw_compat_*, pc_compat_*, or * pc_*_machine_options().
  */
 
-#ifdef CONFIG_ISAPC
-static void pc_init_isa(MachineState *machine)
-{
-    pc_piix_init(machine, NULL);
-}
-#endif
-
 #ifdef CONFIG_XEN
 static void pc_xen_hvm_init_pci(MachineState *machine)
 {
@@ -820,22 +813,6 @@ static void pc_i440fx_2_4_machine_options(MachineClass *m)
 DEFINE_I440FX_MACHINE(v2_4, "pc-i440fx-2.4", NULL,
                       pc_i440fx_2_4_machine_options)
 
-#ifdef CONFIG_ISAPC
-static void isapc_machine_options(MachineClass *m)
-{
-    m->desc = "ISA-only PC";
-    m->max_cpus = 1;
-    m->option_rom_has_mr = true;
-    m->rom_file_has_mr = false;
-    m->default_nic = "ne2k_isa";
-    m->default_cpu_type = X86_CPU_TYPE_NAME("486");
-    m->no_parallel = !module_object_class_by_name(TYPE_ISA_PARALLEL);
-}
-
-DEFINE_PC_MACHINE(isapc, "isapc", pc_init_isa,
-                  isapc_machine_options, TYPE_PC_MACHINE);
-#endif
-
 #ifdef CONFIG_XEN
 static void xenfv_4_2_machine_options(MachineClass *m)
 {
diff --git a/hw/i386/meson.build b/hw/i386/meson.build
index 1a6e731196..0576fc6541 100644
--- a/hw/i386/meson.build
+++ b/hw/i386/meson.build
@@ -12,6 +12,7 @@ i386_ss.add(when: 'CONFIG_X86_IOMMU', if_true: files('x86-iommu.c'),
                                       if_false: files('x86-iommu-stub.c'))
 i386_ss.add(when: 'CONFIG_AMD_IOMMU', if_true: files('amd_iommu.c'),
                                       if_false: files('amd_iommu-stub.c'))
+i386_ss.add(when: 'CONFIG_ISAPC', if_true: files('pc_isa.c'))
 i386_ss.add(when: 'CONFIG_I440FX', if_true: files('pc_piix.c'))
 i386_ss.add(when: 'CONFIG_MICROVM', if_true: files('microvm.c', 'acpi-microvm.c', 'microvm-dt.c'))
 i386_ss.add(when: 'CONFIG_Q35', if_true: files('pc_q35.c'))
-- 
2.41.0


