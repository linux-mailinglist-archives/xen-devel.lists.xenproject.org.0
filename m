Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEF8A54E6A
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 15:58:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903669.1311643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqCfZ-0003bj-Ry; Thu, 06 Mar 2025 14:57:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903669.1311643; Thu, 06 Mar 2025 14:57:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqCfZ-0003ZF-Of; Thu, 06 Mar 2025 14:57:53 +0000
Received: by outflank-mailman (input) for mailman id 903669;
 Thu, 06 Mar 2025 14:57:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bSAR=VZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tqCfY-0003Ye-8V
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 14:57:52 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f72d3b3-fa9b-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 15:57:50 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5dee07e51aaso1404598a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 06:57:50 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac239736806sm107856366b.114.2025.03.06.06.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 06:57:48 -0800 (PST)
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
X-Inumbo-ID: 5f72d3b3-fa9b-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741273069; x=1741877869; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H7pow39J9Fqm1i6O6VXYZWww5I3btdSW6Ay9WFCMqtw=;
        b=rfkBSziw1v1FTEDZQ7iBZGUJlVlcf0rSThsFM02l/2Kr1u4l2OL0SRlXCUqY+Xe1LZ
         FPHtZ4RWGqZys6H1Ctk5WxUEczlHCeTmGcKUaZ33ky94WFNmyqGAcCAfP1kaCJiHWrQg
         rCuowRGw26+W+h7Hbq4rtUqBnrdMq3kJP5Yms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741273069; x=1741877869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H7pow39J9Fqm1i6O6VXYZWww5I3btdSW6Ay9WFCMqtw=;
        b=EjMWK0DOSk9ZJBivjf2BTxLp9smH7jrk4vCnLHUj7X9OsGXjzNuZcGZwytxpCrGDGW
         UizGBNeWaWXQH2xpAex4a6wyDXs5HJI64vQIMmDpdcx4A9CwkCZvmZWXTUS0hUzQ6ALa
         kZAcMEMuEUaujbkaEUX0Yevhc5zCUcJ20OcaOw71iSVSRYbBz7QhXEKPOoUlp8yGXzLa
         qN+16NVYCz/Szh7/kHp8QFoUyAka+4gSM8SpVQNebwA/DDZ+ip2o+gWRH8uXm0JjjNzw
         EDMs49MawpMACacH78LWvDAYk5feebWcMrACE7lbzpIddRLmiOCBV2ydHEN7ADQU4K0d
         o/uA==
X-Gm-Message-State: AOJu0Yzo0jO4RqRvCEPr5f1QdkoTHmwA2acwolSKO77LwKHXqo6qxItZ
	6V2yYlyW9pJMcIZKiIMgdU6nVmmpCjpIcMuOZ2f35oIB///TRG6C/hF48UwUmLaSLIYDGehyoEt
	W
X-Gm-Gg: ASbGncvlCad4YC4w4Qu1BhATls8lFoB8PsnEj2gMm6fEvrSa/ZS2JFSTsnvDQZs67Oy
	VLtOrSbCgmSopbVYxA3h3+lWiaGHBhgNSLWK+tnjLK4IzxUwXYK4bzyl7LoPFODj9n73Nrsdk3L
	lc6W6XeCFrkv7pqcTwZGVNP9ZEe0v1JBiGOb0JokRTuZ9PaeuP/wHTU1j+RIo5HPaW6B9G9iNNg
	WcaOUokh4nk/2gjyb1DcHdHOLUi554d19x/JzxvPW+aa4ghMkzGt/fZTHaAJz6LfNBfmcjmP2ym
	g+SBrlzWiITjmxx5NtpP+fhJVchS8UwFveKmjMQOSyYY4E6bhg==
X-Google-Smtp-Source: AGHT+IG4mF3y+mP2g16zoYYgZihbJs/9r+0n2H/r6BcnwQ4z1OO4c95bb6eKQRmnnXveCwH5993pYw==
X-Received: by 2002:a17:907:8b97:b0:ac1:d8a9:f853 with SMTP id a640c23a62f3a-ac20e1db11amr826930266b.48.1741273068824;
        Thu, 06 Mar 2025 06:57:48 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 1/3] x86/apic: remove delivery and destination mode fields from drivers
Date: Thu,  6 Mar 2025 15:57:31 +0100
Message-ID: <20250306145733.99927-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306145733.99927-1-roger.pau@citrix.com>
References: <20250306145733.99927-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All local APIC drivers use physical destination and fixed delivery modes,
remove the fields from the genapic struct and simplify the logic.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/genapic/bigsmp.c      |  2 --
 xen/arch/x86/genapic/default.c     |  2 --
 xen/arch/x86/genapic/x2apic.c      |  4 ----
 xen/arch/x86/include/asm/genapic.h |  5 -----
 xen/arch/x86/io_apic.c             | 16 ++++++++--------
 xen/arch/x86/msi.c                 | 11 +++--------
 6 files changed, 11 insertions(+), 29 deletions(-)

diff --git a/xen/arch/x86/genapic/bigsmp.c b/xen/arch/x86/genapic/bigsmp.c
index b2e721845275..ddb3a0b5d727 100644
--- a/xen/arch/x86/genapic/bigsmp.c
+++ b/xen/arch/x86/genapic/bigsmp.c
@@ -46,8 +46,6 @@ static int __init cf_check probe_bigsmp(void)
 
 const struct genapic __initconst_cf_clobber apic_bigsmp = {
 	APIC_INIT("bigsmp", probe_bigsmp),
-	.int_delivery_mode = dest_Fixed,
-	.int_dest_mode = 0, /* physical delivery */
 	.init_apic_ldr = init_apic_ldr_phys,
 	.vector_allocation_cpumask = vector_allocation_cpumask_phys,
 	.cpu_mask_to_apicid = cpu_mask_to_apicid_phys,
diff --git a/xen/arch/x86/genapic/default.c b/xen/arch/x86/genapic/default.c
index 59c79afdb8fa..16e1875f6378 100644
--- a/xen/arch/x86/genapic/default.c
+++ b/xen/arch/x86/genapic/default.c
@@ -16,8 +16,6 @@
 /* should be called last. */
 const struct genapic __initconst_cf_clobber apic_default = {
 	APIC_INIT("default", NULL),
-	.int_delivery_mode = dest_Fixed,
-	.int_dest_mode = 0, /* physical delivery */
 	.init_apic_ldr = init_apic_ldr_flat,
 	.vector_allocation_cpumask = vector_allocation_cpumask_phys,
 	.cpu_mask_to_apicid = cpu_mask_to_apicid_phys,
diff --git a/xen/arch/x86/genapic/x2apic.c b/xen/arch/x86/genapic/x2apic.c
index c277f4f79b0a..74a6d808ac30 100644
--- a/xen/arch/x86/genapic/x2apic.c
+++ b/xen/arch/x86/genapic/x2apic.c
@@ -140,8 +140,6 @@ static void cf_check send_IPI_mask_x2apic_cluster(
 
 static const struct genapic __initconst_cf_clobber apic_x2apic_phys = {
     APIC_INIT("x2apic_phys", NULL),
-    .int_delivery_mode = dest_Fixed,
-    .int_dest_mode = 0 /* physical delivery */,
     .init_apic_ldr = init_apic_ldr_phys,
     .vector_allocation_cpumask = vector_allocation_cpumask_phys,
     .cpu_mask_to_apicid = cpu_mask_to_apicid_phys,
@@ -163,8 +161,6 @@ static const struct genapic __initconst_cf_clobber apic_x2apic_mixed = {
      * The following fields are exclusively used by external interrupts and
      * hence are set to use Physical destination mode handlers.
      */
-    .int_delivery_mode = dest_Fixed,
-    .int_dest_mode = 0 /* physical delivery */,
     .vector_allocation_cpumask = vector_allocation_cpumask_phys,
     .cpu_mask_to_apicid = cpu_mask_to_apicid_phys,
 
diff --git a/xen/arch/x86/include/asm/genapic.h b/xen/arch/x86/include/asm/genapic.h
index cf36d48f3b07..04d3f1de7a1f 100644
--- a/xen/arch/x86/include/asm/genapic.h
+++ b/xen/arch/x86/include/asm/genapic.h
@@ -23,9 +23,6 @@ struct genapic {
 	const char *name;
 	int (*probe)(void);
 
-	/* Interrupt delivery parameters ('physical' vs. 'logical flat'). */
-	int int_delivery_mode;
-	int int_dest_mode;
 	void (*init_apic_ldr)(void);
 	const cpumask_t *(*vector_allocation_cpumask)(int cpu);
 	unsigned int (*cpu_mask_to_apicid)(const cpumask_t *cpumask);
@@ -37,8 +34,6 @@ struct genapic {
 	.name = aname, \
 	.probe = aprobe
 
-#define INT_DELIVERY_MODE (genapic.int_delivery_mode)
-#define INT_DEST_MODE (genapic.int_dest_mode)
 #define TARGET_CPUS ((const typeof(cpu_online_map) *)&cpu_online_map)
 #define init_apic_ldr() alternative_vcall(genapic.init_apic_ldr)
 #define cpu_mask_to_apicid(mask) ({ \
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 776dd57720a2..60b39827c851 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -1080,8 +1080,8 @@ static void __init setup_IO_APIC_irqs(void)
              */
             memset(&entry,0,sizeof(entry));
 
-            entry.delivery_mode = INT_DELIVERY_MODE;
-            entry.dest_mode = INT_DEST_MODE;
+            entry.delivery_mode = dest_Fixed;
+            entry.dest_mode = 0;
             entry.mask = 0;                /* enable IRQ */
 
             idx = find_irq_entry(apic,pin,mp_INT);
@@ -1150,10 +1150,10 @@ static void __init setup_ExtINT_IRQ0_pin(unsigned int apic, unsigned int pin, in
      * We use logical delivery to get the timer IRQ
      * to the first CPU.
      */
-    entry.dest_mode = INT_DEST_MODE;
+    entry.dest_mode = 0;
     entry.mask = 0;					/* unmask IRQ now */
     SET_DEST(entry, logical, cpu_mask_to_apicid(TARGET_CPUS));
-    entry.delivery_mode = INT_DELIVERY_MODE;
+    entry.delivery_mode = dest_Fixed;
     entry.polarity = 0;
     entry.trigger = 0;
     entry.vector = vector;
@@ -2338,8 +2338,8 @@ int io_apic_set_pci_routing (int ioapic, int pin, int irq, int edge_level, int a
 
     memset(&entry,0,sizeof(entry));
 
-    entry.delivery_mode = INT_DELIVERY_MODE;
-    entry.dest_mode = INT_DEST_MODE;
+    entry.delivery_mode = dest_Fixed;
+    entry.dest_mode = 0;
     entry.trigger = edge_level;
     entry.polarity = active_high_low;
     entry.mask  = 1;
@@ -2473,8 +2473,8 @@ int ioapic_guest_write(unsigned long physbase, unsigned int reg, u32 val)
      * The guest does not know physical APIC arrangement (flat vs. cluster).
      * Apply genapic conventions for this platform.
      */
-    rte.delivery_mode = INT_DELIVERY_MODE;
-    rte.dest_mode     = INT_DEST_MODE;
+    rte.delivery_mode = dest_Fixed;
+    rte.dest_mode     = 0;
 
     irq = apic_pin_2_gsi_irq(apic, pin);
     if ( irq < 0 )
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index bf5b71822ea9..6c11d76015fb 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -174,18 +174,13 @@ void msi_compose_msg(unsigned vector, const cpumask_t *cpu_mask, struct msi_msg
 
     msg->address_hi = MSI_ADDR_BASE_HI;
     msg->address_lo = MSI_ADDR_BASE_LO |
-                      (INT_DEST_MODE ? MSI_ADDR_DESTMODE_LOGIC
-                                     : MSI_ADDR_DESTMODE_PHYS) |
-                      ((INT_DELIVERY_MODE != dest_LowestPrio)
-                       ? MSI_ADDR_REDIRECTION_CPU
-                       : MSI_ADDR_REDIRECTION_LOWPRI) |
+                      MSI_ADDR_DESTMODE_PHYS |
+                      MSI_ADDR_REDIRECTION_CPU |
                       MSI_ADDR_DEST_ID(msg->dest32);
 
     msg->data = MSI_DATA_TRIGGER_EDGE |
                 MSI_DATA_LEVEL_ASSERT |
-                ((INT_DELIVERY_MODE != dest_LowestPrio)
-                 ? MSI_DATA_DELIVERY_FIXED
-                 : MSI_DATA_DELIVERY_LOWPRI) |
+                MSI_DATA_DELIVERY_FIXED |
                 MSI_DATA_VECTOR(vector);
 }
 
-- 
2.48.1


