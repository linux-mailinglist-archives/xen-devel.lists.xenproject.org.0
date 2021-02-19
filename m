Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A2A31FDFE
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 18:39:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87032.164012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD9kb-00011f-64; Fri, 19 Feb 2021 17:39:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87032.164012; Fri, 19 Feb 2021 17:39:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD9kb-000111-1q; Fri, 19 Feb 2021 17:39:33 +0000
Received: by outflank-mailman (input) for mailman id 87032;
 Fri, 19 Feb 2021 17:39:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ml8x=HV=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1lD9kZ-0000on-7m
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 17:39:31 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id da884f6e-5daa-4e73-a9f0-9709690b1f1a;
 Fri, 19 Feb 2021 17:39:29 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-z5WyorMzPXecboWrYOT3og-1; Fri, 19 Feb 2021 12:39:25 -0500
Received: by mail-wr1-f69.google.com with SMTP id u15so2773674wrn.3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Feb 2021 09:39:25 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v66sm12701902wme.33.2021.02.19.09.39.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 09:39:24 -0800 (PST)
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
X-Inumbo-ID: da884f6e-5daa-4e73-a9f0-9709690b1f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613756369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lw4bfUfCEZBd00BTMjyws6AoTKQiuLTiPv1ON4ccv74=;
	b=bC8+1d15noKWKx8Hh745rCDU4HZoLgZ63FobWXUUsj7+SAcwubcsmypKDkqTgOylNdtPtm
	P4hFStTViFqfv7hCZ+qC+blMi3ehAFZTISC81djndPrZbuY468grpX78lSqs76nuRdC4Yj
	D1XKjd/TqWb1c51yphRt2OgTNG0YVA8=
X-MC-Unique: z5WyorMzPXecboWrYOT3og-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Lw4bfUfCEZBd00BTMjyws6AoTKQiuLTiPv1ON4ccv74=;
        b=XqoA/EdPeRtMOT1swM/+eNzpbOxo4ZT2366PsaoMO/1bwgSq/h8wHCq7Uhm7V4EPnd
         CmcMjr+fFC/y1BZW5z1eTnSr3E9x+/pLL3A9asuNyyIGsplorquIgDAst6p9RBYqHuyq
         5rSjQIh0TUSMcamwoZCn/WIBPEjMv+RENM03ODWVYMiX5hiNujX4nfcpDk2lXFh4HK9f
         gMCAechAmiqEmAO9kZiHSHRQZD9hIRW2+PBUdCryE+ahmETKJF694N8ZSr9f3oShZouX
         pvMZbv4sqynWx2M6j0G2RqMR9CLEpf1VShlMekno+lagAs080/zXaLbkGSf4IH8WHehR
         WhoA==
X-Gm-Message-State: AOAM5313HFYRRxVv1vLuAwFAUWDaJYnx43XZ4qvmDZYJsJw0HQ9MIn9n
	JU3HlP9CmyDn4ZGpRUph9aewj0av5aGb5JolcAZb888qrKao/AJgc2HOuklAN9j33eJSzH8yodZ
	NXj2aTxOu16hjxE1bQx0zLQATvl0=
X-Received: by 2002:a1c:bb44:: with SMTP id l65mr8964746wmf.86.1613756364613;
        Fri, 19 Feb 2021 09:39:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxjqRkJ5Ff39xPwSCRnl3K5tBZjqMMFJ/FERHr0iybiVEhoAVRLgd8349suwi9XW5Y8/zboYw==
X-Received: by 2002:a1c:bb44:: with SMTP id l65mr8964730wmf.86.1613756364447;
        Fri, 19 Feb 2021 09:39:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	Halil Pasic <pasic@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	xen-devel@lists.xenproject.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	qemu-arm@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Leif Lindholm <leif@nuviainc.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Alistair Francis <alistair@alistair23.me>,
	Paul Durrant <paul@xen.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Greg Kurz <groug@kaod.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC PATCH v2 06/11] hw/ppc: Restrict KVM to various PPC machines
Date: Fri, 19 Feb 2021 18:38:42 +0100
Message-Id: <20210219173847.2054123-7-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210219173847.2054123-1-philmd@redhat.com>
References: <20210219173847.2054123-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Restrit KVM to the following PPC machines:
- 40p
- bamboo
- g3beige
- mac99
- mpc8544ds
- ppce500
- pseries
- sam460ex
- virtex-ml507

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
RFC: I'm surprise by this list, but this is the result of
     auditing calls to kvm_enabled() checks.

 hw/ppc/e500plat.c      | 5 +++++
 hw/ppc/mac_newworld.c  | 6 ++++++
 hw/ppc/mac_oldworld.c  | 5 +++++
 hw/ppc/mpc8544ds.c     | 5 +++++
 hw/ppc/ppc440_bamboo.c | 5 +++++
 hw/ppc/prep.c          | 5 +++++
 hw/ppc/sam460ex.c      | 5 +++++
 hw/ppc/spapr.c         | 5 +++++
 8 files changed, 41 insertions(+)

diff --git a/hw/ppc/e500plat.c b/hw/ppc/e500plat.c
index bddd5e7c48f..9701dbc2231 100644
--- a/hw/ppc/e500plat.c
+++ b/hw/ppc/e500plat.c
@@ -67,6 +67,10 @@ HotplugHandler *e500plat_machine_get_hotpug_handler(MachineState *machine,
 
 #define TYPE_E500PLAT_MACHINE  MACHINE_TYPE_NAME("ppce500")
 
+static const char *const valid_accels[] = {
+    "tcg", "kvm", NULL
+};
+
 static void e500plat_machine_class_init(ObjectClass *oc, void *data)
 {
     PPCE500MachineClass *pmc = PPCE500_MACHINE_CLASS(oc);
@@ -98,6 +102,7 @@ static void e500plat_machine_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = 32;
     mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("e500v2_v30");
     mc->default_ram_id = "mpc8544ds.ram";
+    mc->valid_accelerators = valid_accels;
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_ETSEC_COMMON);
  }
 
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index e991db4addb..634f5ad19a0 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -578,6 +578,11 @@ static char *core99_fw_dev_path(FWPathProvider *p, BusState *bus,
 
     return NULL;
 }
+
+static const char *const valid_accels[] = {
+    "tcg", "kvm", NULL
+};
+
 static int core99_kvm_type(MachineState *machine, const char *arg)
 {
     /* Always force PR KVM */
@@ -595,6 +600,7 @@ static void core99_machine_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = MAX_CPUS;
     mc->default_boot_order = "cd";
     mc->default_display = "std";
+    mc->valid_accelerators = valid_accels;
     mc->kvm_type = core99_kvm_type;
 #ifdef TARGET_PPC64
     mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("970fx_v3.1");
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 44ee99be886..2c58f73b589 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -424,6 +424,10 @@ static char *heathrow_fw_dev_path(FWPathProvider *p, BusState *bus,
     return NULL;
 }
 
+static const char *const valid_accels[] = {
+    "tcg", "kvm", NULL
+};
+
 static int heathrow_kvm_type(MachineState *machine, const char *arg)
 {
     /* Always force PR KVM */
@@ -444,6 +448,7 @@ static void heathrow_class_init(ObjectClass *oc, void *data)
 #endif
     /* TOFIX "cad" when Mac floppy is implemented */
     mc->default_boot_order = "cd";
+    mc->valid_accelerators = valid_accels;
     mc->kvm_type = heathrow_kvm_type;
     mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("750_v3.1");
     mc->default_display = "std";
diff --git a/hw/ppc/mpc8544ds.c b/hw/ppc/mpc8544ds.c
index 81177505f02..92b0e926c1b 100644
--- a/hw/ppc/mpc8544ds.c
+++ b/hw/ppc/mpc8544ds.c
@@ -36,6 +36,10 @@ static void mpc8544ds_init(MachineState *machine)
     ppce500_init(machine);
 }
 
+static const char *const valid_accels[] = {
+    "tcg", "kvm", NULL
+};
+
 static void e500plat_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -56,6 +60,7 @@ static void e500plat_machine_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = 15;
     mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("e500v2_v30");
     mc->default_ram_id = "mpc8544ds.ram";
+    mc->valid_accelerators = valid_accels;
 }
 
 #define TYPE_MPC8544DS_MACHINE  MACHINE_TYPE_NAME("mpc8544ds")
diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index b156bcb9990..02501f489e4 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -298,12 +298,17 @@ static void bamboo_init(MachineState *machine)
     }
 }
 
+static const char *const valid_accels[] = {
+    "tcg", "kvm", NULL
+};
+
 static void bamboo_machine_init(MachineClass *mc)
 {
     mc->desc = "bamboo";
     mc->init = bamboo_init;
     mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("440epb");
     mc->default_ram_id = "ppc4xx.sdram";
+    mc->valid_accelerators = valid_accels;
 }
 
 DEFINE_MACHINE("bamboo", bamboo_machine_init)
diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index 7e72f6e4a9b..90d884b0883 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -431,6 +431,10 @@ static void ibm_40p_init(MachineState *machine)
     }
 }
 
+static const char *const valid_accels[] = {
+    "tcg", "kvm", NULL
+};
+
 static void ibm_40p_machine_init(MachineClass *mc)
 {
     mc->desc = "IBM RS/6000 7020 (40p)",
@@ -441,6 +445,7 @@ static void ibm_40p_machine_init(MachineClass *mc)
     mc->default_boot_order = "c";
     mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("604");
     mc->default_display = "std";
+    mc->valid_accelerators = valid_accels;
 }
 
 DEFINE_MACHINE("40p", ibm_40p_machine_init)
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index e459b43065b..79adb3352f0 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -506,6 +506,10 @@ static void sam460ex_init(MachineState *machine)
     boot_info->entry = entry;
 }
 
+static const char *const valid_accels[] = {
+    "tcg", "kvm", NULL
+};
+
 static void sam460ex_machine_init(MachineClass *mc)
 {
     mc->desc = "aCube Sam460ex";
@@ -513,6 +517,7 @@ static void sam460ex_machine_init(MachineClass *mc)
     mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("460exb");
     mc->default_ram_size = 512 * MiB;
     mc->default_ram_id = "ppc4xx.sdram";
+    mc->valid_accelerators = valid_accels;
 }
 
 DEFINE_MACHINE("sam460ex", sam460ex_machine_init)
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 85fe65f8947..c5f985f0187 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4397,6 +4397,10 @@ static void spapr_cpu_exec_exit(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu)
     }
 }
 
+static const char *const valid_accels[] = {
+    "tcg", "kvm", NULL
+};
+
 static void spapr_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -4426,6 +4430,7 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
     mc->default_ram_size = 512 * MiB;
     mc->default_ram_id = "ppc_spapr.ram";
     mc->default_display = "std";
+    mc->valid_accelerators = valid_accels;
     mc->kvm_type = spapr_kvm_type;
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_SPAPR_PCI_HOST_BRIDGE);
     mc->pci_allow_0_address = true;
-- 
2.26.2


