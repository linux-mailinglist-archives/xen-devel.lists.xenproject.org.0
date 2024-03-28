Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3175D890461
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 17:01:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699039.1091562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpsC7-0001F4-HX; Thu, 28 Mar 2024 16:01:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699039.1091562; Thu, 28 Mar 2024 16:01:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpsC7-0001Ae-Ax; Thu, 28 Mar 2024 16:01:35 +0000
Received: by outflank-mailman (input) for mailman id 699039;
 Thu, 28 Mar 2024 16:01:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yxy0=LC=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rps8K-00071m-47
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 15:57:40 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e699f142-ed1b-11ee-a1ef-f123f15fe8a2;
 Thu, 28 Mar 2024 16:57:38 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-56c1922096cso1486560a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 08:57:38 -0700 (PDT)
Received: from m1x-phil.lan (pas38-h02-176-184-5-52.dsl.sta.abo.bbox.fr.
 [176.184.5.52]) by smtp.gmail.com with ESMTPSA id
 ek25-20020a056402371900b0056bdc4a5cd6sm959160edb.62.2024.03.28.08.57.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 28 Mar 2024 08:57:37 -0700 (PDT)
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
X-Inumbo-ID: e699f142-ed1b-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711641458; x=1712246258; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WrzkMtkcnF1yss3niHYQFeUj6lW7JvFYG513ZWQp60s=;
        b=GSd899zuFf6RMLrZBW9cClN548SHoJV4gzuiuGLbyr5ETcg/LtuoXsscBv5UZ4c0Lx
         Fq+P4k8U8pw2MCZ4I/Tn/KSw8wstTDYRpSu5kYobeQZwHySXya47Hxipi7NyqtoN8ciH
         FdyXkEd6faVR6grUZvTDzUN/xH2TuOJu79alVcwfS0PxN2AEqd7zRHptZV93C2w+OHJt
         E8q+eRCXM2LD/6bRhaxV4lDlbBNZQOwWLecUoTCJ6W/4fPGGyMVDGDBkOt1S9wOWDVHc
         gtGt/y2nUVkeQ1+PLQ4ANAyUlDAE9ehodw8uRJiF3zqjg/+XEUAwCmjBW1wm0YAO8hZa
         682A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711641458; x=1712246258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WrzkMtkcnF1yss3niHYQFeUj6lW7JvFYG513ZWQp60s=;
        b=sXoS9TbifQk2O7Oc5zlWN+fxX5Cbgx1rvPjCrItsZuJTNmVMh4ryaUzVcFmBZi+DWf
         lx70i0/na+jKAXVDR5XYhTBEEBgMwh6mmPY7TaE1z12W1KW1n1OAqAJYPJEUubsvQbwk
         QhpWGkLYGZeZkSi67Y7cHmzmB8xmyGF3bfGOXbZpsvBprb+6WdYE+F2bI4CWohVGYA0N
         2a5ZN+I172MG/KWsuPOS8Vinwj3fd/klED4I6dqJlM+tYipK1XeJc5zwdVu1TyfLgFWX
         G5g7+dbMTuBiH4GbCTPDXVkto9xhjNcizRpQXDg+ihHO+wzJbdioEFfCfajbfpZKpDG2
         n/aA==
X-Forwarded-Encrypted: i=1; AJvYcCXGg4OBvqyaYVqvzANdh/SLSmRmDKKYVrJ8iSYsL9mm6a7C7nvgAVwR8vjemcUOHVitmUaICQvN7oV/oPCCarQKZOVGeKEbVWV1m2DYBAo=
X-Gm-Message-State: AOJu0YzFAm5b2NKiMHKUFG0J8OUtu571lWH1zjijy8BlOLJcdQYMSYxq
	b6Z60Ys/YSQWy0OeqhDhoPmLf7uoRfVNXx+otV87VWGuvbQBOG6X92yjM+0Gasc=
X-Google-Smtp-Source: AGHT+IEc3JVavZ6Yb+b8wnDqhR3/uKAR+Oeu24avwh9VyWUhM3fQrZfwqOBt+dWLPG1vVVlO5yf/BQ==
X-Received: by 2002:a50:9b0b:0:b0:56b:dce0:c795 with SMTP id o11-20020a509b0b000000b0056bdce0c795mr2044180edi.4.1711641458009;
        Thu, 28 Mar 2024 08:57:38 -0700 (PDT)
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Subject: [RFC PATCH-for-9.1 28/29] hw/i386/pc: Rename pc_init1() -> pc_piix_init()
Date: Thu, 28 Mar 2024 16:54:36 +0100
Message-ID: <20240328155439.58719-29-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240328155439.58719-1-philmd@linaro.org>
References: <20240328155439.58719-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

pc_init1() is specific to the isapc and i440fx/piix machines,
rename it as pc_piix_init(). Expose it in "hw/i386/pc.h" to
be able to call it externally (see next patch).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/i386/pc.h | 1 +
 hw/i386/pc_piix.c    | 8 ++++----
 hw/isa/piix.c        | 2 +-
 hw/pci-host/i440fx.c | 2 +-
 4 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 6510914803..9a11835b7e 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -163,6 +163,7 @@ void pc_basic_device_init(struct PCMachineState *pcms,
                           bool create_fdctrl,
                           uint32_t hpet_irqs);
 void pc_nic_init(PCMachineClass *pcmc, ISABus *isa_bus, PCIBus *pci_bus);
+void pc_piix_init(MachineState *machine, const char *pci_type);
 
 void pc_i8259_create(ISABus *isa_bus, qemu_irq *i8259_irqs);
 
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 4f07476cfa..4a3ae72fe4 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -111,7 +111,7 @@ static bool gigabyte_align(PCMachineState *pcms)
 }
 
 /* PC hardware initialisation */
-static void pc_init1(MachineState *machine, const char *pci_type)
+void pc_piix_init(MachineState *machine, const char *pci_type)
 {
     PCMachineState *pcms = PC_MACHINE(machine);
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
@@ -437,7 +437,7 @@ static void pc_set_south_bridge(Object *obj, int value, Error **errp)
 #ifdef CONFIG_ISAPC
 static void pc_init_isa(MachineState *machine)
 {
-    pc_init1(machine, NULL);
+    pc_piix_init(machine, NULL);
 }
 #endif
 
@@ -447,7 +447,7 @@ static void pc_xen_hvm_init_pci(MachineState *machine)
     const char *pci_type = xen_igd_gfx_pt_enabled() ?
                 TYPE_IGD_PASSTHROUGH_I440FX_PCI_DEVICE : TYPE_I440FX_PCI_DEVICE;
 
-    pc_init1(machine, pci_type);
+    pc_piix_init(machine, pci_type);
 }
 
 static void pc_xen_hvm_init(MachineState *machine)
@@ -472,7 +472,7 @@ static void pc_xen_hvm_init(MachineState *machine)
         if (compat) { \
             compat(machine); \
         } \
-        pc_init1(machine, TYPE_I440FX_PCI_DEVICE); \
+        pc_piix_init(machine, TYPE_I440FX_PCI_DEVICE); \
     } \
     DEFINE_PC_MACHINE(suffix, name, pc_init_##suffix, optionfn, \
                       TYPE_PC_PCI_MACHINE)
diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index 2d30711b17..14dc9e78be 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -432,7 +432,7 @@ static void pci_piix_class_init(ObjectClass *klass, void *data)
     k->class_id     = PCI_CLASS_BRIDGE_ISA;
     /*
      * Reason: part of PIIX southbridge, needs to be wired up by e.g.
-     * pc_piix.c's pc_init1()
+     * pc_piix.c's pc_piix_init()
      */
     dc->user_creatable = false;
     device_class_set_props(dc, pci_piix_props);
diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
index add99e4f76..9f47d5507a 100644
--- a/hw/pci-host/i440fx.c
+++ b/hw/pci-host/i440fx.c
@@ -374,7 +374,7 @@ static void i440fx_pcihost_class_init(ObjectClass *klass, void *data)
     dc->realize = i440fx_pcihost_realize;
     dc->fw_name = "pci";
     device_class_set_props(dc, i440fx_props);
-    /* Reason: needs to be wired up by pc_init1 */
+    /* Reason: needs to be wired up by pc_piix_init */
     dc->user_creatable = false;
 
     object_class_property_add(klass, PCI_HOST_PROP_PCI_HOLE_START, "uint32",
-- 
2.41.0


