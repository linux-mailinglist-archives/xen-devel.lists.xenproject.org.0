Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AA8A59077
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 10:57:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906358.1313804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trZt3-0001Bd-6n; Mon, 10 Mar 2025 09:57:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906358.1313804; Mon, 10 Mar 2025 09:57:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trZt3-00019g-2n; Mon, 10 Mar 2025 09:57:29 +0000
Received: by outflank-mailman (input) for mailman id 906358;
 Mon, 10 Mar 2025 09:57:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B6N5=V5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1trZt2-0000tO-6T
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 09:57:28 +0000
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [2607:f8b0:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1260798b-fd96-11ef-9ab8-95dc52dad729;
 Mon, 10 Mar 2025 10:57:27 +0100 (CET)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-22113560c57so72753425ad.2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 02:57:27 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-736985151e7sm7785151b3a.127.2025.03.10.02.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 02:57:25 -0700 (PDT)
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
X-Inumbo-ID: 1260798b-fd96-11ef-9ab8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741600645; x=1742205445; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/DDOUj51mfixPLtIBcnzUer7UVzDVkCCw+oNHP2Q+kM=;
        b=vKAL9VzmChgX9nuG/2kl1DiNtcDN+TbkhA7ydY2EdVh+NlgfnI/DyejqizvoS7DFXN
         f+GqEpjGY5c7fouk8WK28GbMSYdBLS4KwkyWBAX7QZmdKudo7wp65TPS3+Y7C61aoJcq
         G+BC5bU52kqw+SXpCj87VD3oFREJ9gFvXLn3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741600646; x=1742205446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/DDOUj51mfixPLtIBcnzUer7UVzDVkCCw+oNHP2Q+kM=;
        b=qU+wikiOpxDFJmju86V019+AU1h/3FhC8ly3gDWi+d7xVuYfOm7k9ZvSzFSFfjsVy2
         u20Mu/NRH5UW9xXYqxg5YhjbFBtNc5a9haWVdJPfURgMIt8l1Xa+68rAfZfrFqYA+eBd
         8D1lqF6O4DRfM3R9l9ayx/0DRuQncCtMYix7Cm9JBHWm8t1Zoso3dyaKEkcdnai2tA1K
         lkCWoj28asaoUZH9tabDwqs92meHYSj/MqtaEX621nGhWTxA+A8jG1u8hsi//xFwYClT
         L490lcL8j6ssCjHZv76l1ssxr/cRjinDdS3kmO5hOCpo2x6a8cyto64nMVfAtqCnzj5e
         WnqQ==
X-Gm-Message-State: AOJu0YxAN4+T27fFKpsO/62BTppowNAyUClp6wafcuB3w1a7R2zpszTS
	06NGTC0p6TtvThN+Ro3ZyghhUY59/pLJqDxinH9IxwzIWZU/L/nzdbpP0aoDiDPQDT+zyYzuDrV
	t
X-Gm-Gg: ASbGncvPGVTig6M65J0ZfPHbNbiydIdz6FgqcfyBLyUSPCO+ErpeVoeUL2BumdSWRMr
	sGWWxa6/IgGeYUgHJejHdqko/Whcc8Xh35k6/yTMnpu2qx4oOZ8ZAGkKwIzUlKIyq+A9vEmYCgg
	J25Xngt4K8fkVVoiYi/ZQHuEOm53kr4ZdEWz+5TtjGxNrBRdrncbwv5Db+ZmrWQwFRQ0c9KeC7C
	duhIhQe9oxBZ9x8J3XQ9sAhjbfP5dsko7ebX8cC0friFWfLlGxYGQTzgjND0OOC1VFLjxPcfdDK
	rfUpbcZLriLxBerYAZrGJnvykN0VInNaTSP8ITPG47+HRVrjP7V2VBs=
X-Google-Smtp-Source: AGHT+IHucP9m32vTdDz7lZEccwPf/TZ85VO670nznjAwqXgr4SYPQoeth1R3ej5EsF8socST/AKh8Q==
X-Received: by 2002:a05:6a21:1583:b0:1f5:8622:5ed5 with SMTP id adf61e73a8af0-1f5862261c2mr2188975637.3.1741600645645;
        Mon, 10 Mar 2025 02:57:25 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 1/2] x86/apic: remove delivery and destination mode fields from drivers
Date: Mon, 10 Mar 2025 10:55:34 +0100
Message-ID: <20250310095535.46033-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250310095535.46033-1-roger.pau@citrix.com>
References: <20250310095535.46033-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All local APIC drivers use physical destination and fixed delivery modes,
remove the fields from the genapic struct and simplify the logic.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Changes since v2:
 - Add comment about dest_mode setting.
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
index 776dd57720a2..c6cf94481129 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -1080,8 +1080,8 @@ static void __init setup_IO_APIC_irqs(void)
              */
             memset(&entry,0,sizeof(entry));
 
-            entry.delivery_mode = INT_DELIVERY_MODE;
-            entry.dest_mode = INT_DEST_MODE;
+            entry.delivery_mode = dest_Fixed;
+            entry.dest_mode = 0; /* physical delivery */
             entry.mask = 0;                /* enable IRQ */
 
             idx = find_irq_entry(apic,pin,mp_INT);
@@ -1150,10 +1150,10 @@ static void __init setup_ExtINT_IRQ0_pin(unsigned int apic, unsigned int pin, in
      * We use logical delivery to get the timer IRQ
      * to the first CPU.
      */
-    entry.dest_mode = INT_DEST_MODE;
+    entry.dest_mode = 0; /* physical delivery */
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
+    entry.dest_mode = 0; /* physical delivery */
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
+    rte.dest_mode     = 0; /* physical delivery */
 
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


