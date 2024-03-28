Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E70C889049C
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 17:09:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699078.1091606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpsJF-0005IQ-7G; Thu, 28 Mar 2024 16:08:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699078.1091606; Thu, 28 Mar 2024 16:08:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpsJF-0005Gs-3Z; Thu, 28 Mar 2024 16:08:57 +0000
Received: by outflank-mailman (input) for mailman id 699078;
 Thu, 28 Mar 2024 16:08:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yxy0=LC=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rps7C-0001AK-O7
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 15:56:30 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bdd4fcca-ed1b-11ee-afe3-a90da7624cb6;
 Thu, 28 Mar 2024 16:56:30 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-56c1922096cso1484891a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 08:56:30 -0700 (PDT)
Received: from m1x-phil.lan (pas38-h02-176-184-5-52.dsl.sta.abo.bbox.fr.
 [176.184.5.52]) by smtp.gmail.com with ESMTPSA id
 c12-20020a170906170c00b00a47464a6ee4sm907178eje.173.2024.03.28.08.56.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 28 Mar 2024 08:56:29 -0700 (PDT)
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
X-Inumbo-ID: bdd4fcca-ed1b-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711641389; x=1712246189; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yelmGOzPahdn50NTFTioUrFj9NGQyALSAi158EJljHU=;
        b=NbVIhU0HE1DDNfS1gj4xjsrTs3iMwsqqeDqC+/QzzgpHEvZIvG8GZiMIIfIphkjnFm
         Rya2O+kOJx23kzvVCriif9OfG506w3YwgEXk5tYLz/KEdDbEyisQsWpxN3x2nDHAQ89B
         sMGCgmXGEb2INgCW8KsJpQWwT3p9vucnQkKcW265I/+INQ9dGsSyiV0q1SyqBq8D0Xgi
         cYnj2ocZNn72St6r0dTAnCTNtgtz5hmXqfVUIaNNMxqjAWIufL7vrYWUeY3aWik1HxcZ
         OJRo0xHnHdU+aC77irQRu3xFGuEfpbc85OSMBGqIeBoo7N/2uH8oOrh7NwnmLZ0bKe2q
         VMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711641389; x=1712246189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yelmGOzPahdn50NTFTioUrFj9NGQyALSAi158EJljHU=;
        b=L/RJeKm5GInCGI6XdJmsNzIkvCVDojscFigePSvlbJwmk3DSpXy2JRlWT+9EX+vBtj
         KWfeqHCZf8dg2r5FCBklLbE0WLOY28S584NGH7mGRs+pg6tnR9HSUpKITTqCxhvrc3Lg
         59Mv6/QjdEkH0LKaCYKtNfQtGPYTi5RS160SBXihVEKNC3ia1cOYqyX2uWrrQTR+KYZl
         8UAygpYJMU2IC3eiyqtIu9P+QdqIIdLqLoNC5YQEFExUG+x6RMylWmWlxW4DfSNzs0Kr
         hSUH8Mt1DNeUgHsjJGMQqdo9lvxYcKgADcc/mAM4BZ4sVjMLBQWYLjrFq1+I2LO/2c2+
         Q3Hg==
X-Forwarded-Encrypted: i=1; AJvYcCXfwtR/v1keepv9ELyldp4sbYgfe06c4VwLejAD0yqWfe6GbaWdMYfkYF02FoegioUAJkBxiYQY8OJ/U6CrJw9l6gpNQId2aA9+x0IMa/k=
X-Gm-Message-State: AOJu0YwSiyo9IzbLFK7NHb5p2xlNJm5aLmMCqRgZhKq6Tq0KR7XHdgo2
	ZTxlP9UbA1+/bnWWRxHMvQ2S1EoZoQTbUQP1EePrp4i/GZSvpT+qvAXm3QntrCbXjoWoW7wSO4A
	K
X-Google-Smtp-Source: AGHT+IGcQH5U/UKgHXGMsAIRXVS3RWDUx0CNeskq1nCdFHfYMz7G0o34lBWrByXcqIlMAc9p2yI9yQ==
X-Received: by 2002:a17:906:e24e:b0:a4d:fc83:70e1 with SMTP id gq14-20020a170906e24e00b00a4dfc8370e1mr2038052ejb.56.1711641389600;
        Thu, 28 Mar 2024 08:56:29 -0700 (PDT)
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
Subject: [RFC PATCH-for-9.1 17/29] hw/i386/pc: Inline gigabyte_align()
Date: Thu, 28 Mar 2024 16:54:25 +0100
Message-ID: <20240328155439.58719-18-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240328155439.58719-1-philmd@linaro.org>
References: <20240328155439.58719-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All PCI-based machines have the gigabyte_align field
set to %true. Simplify by using an inlined helper
checking whether the machine is PCI-based or not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/i386/pc.h |  9 ---------
 hw/i386/pc.c         |  1 -
 hw/i386/pc_piix.c    | 16 +++++++++++++---
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 2db2aa03d3..758dd5f29b 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -76,14 +76,6 @@ typedef struct PcPciMachineState {
 
 /**
  * PCMachineClass:
- *
- * Compat fields:
- *
- * @gigabyte_align: Make sure that guest addresses aligned at
- *                  1Gbyte boundaries get mapped to host
- *                  addresses aligned at 1Gbyte boundaries. This
- *                  way we can use 1GByte pages in the host.
- *
  */
 typedef struct PCMachineClass {
     X86MachineClass parent_class;
@@ -99,7 +91,6 @@ typedef struct PCMachineClass {
     SmbiosEntryPointType default_smbios_ep_type;
 
     /* RAM / address space compat: */
-    bool gigabyte_align;
     bool has_reserved_memory;
     bool broken_reserved_end;
     bool enforce_amd_1tb_hole;
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index dd44df0470..093a7c35f7 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1752,7 +1752,6 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
 
     pcmc->smbios_defaults = true;
-    pcmc->gigabyte_align = true;
     pcmc->has_reserved_memory = true;
     pcmc->enforce_amd_1tb_hole = true;
     pcmc->pvh_enabled = true;
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 2043a7022a..0bc14da768 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -99,6 +99,17 @@ static void piix_intx_routing_notifier_xen(PCIDevice *dev)
     }
 }
 
+/*
+ * gigabyte_align: Make sure that guest addresses aligned at
+ *                 1Gbyte boundaries get mapped to host
+ *                 addresses aligned at 1Gbyte boundaries.
+ *                 This way we can use 1GByte pages in the host.
+ */
+static bool gigabyte_align(PCMachineState *pcms)
+{
+    return pc_machine_is_pci_enabled(pcms);
+}
+
 /* PC hardware initialisation */
 static void pc_init1(MachineState *machine, const char *pci_type)
 {
@@ -130,7 +141,7 @@ static void pc_init1(MachineState *machine, const char *pci_type)
      *  - Then, to gigabyte align the memory, we move the split to 3G
      *    (lowmem = 0xc0000000).  But only in case we have to split in
      *    the first place, i.e. ram_size is larger than (traditional)
-     *    lowmem.  And for new machine types (gigabyte_align = true)
+     *    lowmem.  And for new machine types (gigabyte_align() = true)
      *    only, for live migration compatibility reasons.
      *
      *  - Next the max-ram-below-4g option was added, which allowed to
@@ -160,7 +171,7 @@ static void pc_init1(MachineState *machine, const char *pci_type)
         }
         lowmem = pcms->max_ram_below_4g;
         if (machine->ram_size >= pcms->max_ram_below_4g) {
-            if (pcmc->gigabyte_align) {
+            if (gigabyte_align(pcms)) {
                 if (lowmem > 0xc0000000) {
                     lowmem = 0xc0000000;
                 }
@@ -818,7 +829,6 @@ static void isapc_machine_options(MachineClass *m)
     m->option_rom_has_mr = true;
     m->rom_file_has_mr = false;
     pcmc->smbios_defaults = false;
-    pcmc->gigabyte_align = false;
     pcmc->smbios_legacy_mode = true;
     pcmc->has_reserved_memory = false;
     m->default_nic = "ne2k_isa";
-- 
2.41.0


