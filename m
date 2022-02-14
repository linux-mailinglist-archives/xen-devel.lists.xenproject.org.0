Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9474B5112
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:06:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271701.466322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb3V-00070l-G7; Mon, 14 Feb 2022 13:06:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271701.466322; Mon, 14 Feb 2022 13:06:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb3V-0006vX-3Q; Mon, 14 Feb 2022 13:06:13 +0000
Received: by outflank-mailman (input) for mailman id 271701;
 Mon, 14 Feb 2022 13:06:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb3I-00023t-II
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:06:00 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9261969-8d96-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 14:05:58 +0100 (CET)
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
X-Inumbo-ID: d9261969-8d96-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843959;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=1mxkmFvBHm9TxAw5kL2fslSWdtu5vEoGopavW5H2guc=;
  b=FdX0Bfkwo5GiZMXCWjnQkpoIffe8XjBTrhwaAAXhhvXy6W46ruhcH7fU
   9TBCGmvUbvW7f1G1UrOBAaOrafYgB0QHXdFoVyS2Bc98pRY7dEt31sa0e
   qoNkSBss6oqPs+1V0XTufDPzsfP7hroFWwhySNcKzwMxETvxZ6RwTYeJ0
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 6qVrT5YlGRLe+iB32YZTsQOWSU/VWq5wH2X4XuAUdRo7uhPMH01lQPSplGVDoye+u39HVFUsWj
 GlaznnRrjnGfI3nWFfVrpuirUGhDsQLb57yNmO3qUT6BYEXWnvvYc9O7U65Ao0fKXnfqLp/BUP
 AK3WxvcZg3D8XHjAHOpDqWsLvj/XBgvQ4xFABRuUe7J2/GnzVlyTrp2zkoDeDSqUrR4Y//wyX1
 JBbQZ7nMLS2KhzG4ebGv2jsDT+2UUKl1cDF5qwLU2Y2sAoOoJ0fgZ2wLWZaJvmIJ7kuIxI/LWK
 BbsIyjiVyyc7sDxvfswrysrR
X-SBRS: 5.1
X-MesageID: 63592665
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:mkvNcauFnnrShkkFCzfWplKis+fnVEhZMUV32f8akzHdYApBsoF/q
 tZmKTrUP/+LMGbzLt4jPIm39BkCvJeEmtZrHQI/r3o2E34R+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYy2IThWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplnpWSRF4NDIP3u8cZfD0HDHh+IqN29+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AP
 JdIM2QxMXwsZTUUZwclEsgHu9632F/jLjxTo3/E+KAOtj27IAtZj+G2bYu9lsaxbdVYmAOUq
 3zL+0z9AwoGL5qPxDyd6HWui+TT2yThV+ov+KaQr6AwxgfJnypKVUNQBQDTTeSFZlCWcNt9J
 hUwyAQVjos222j0UYD9QBOIryvR1vIDYOZ4H+o/4QCL76Pb5QeFG2QJJgJ8hMwaWNweHmJzi
 ALQ9z/9LXk26eDOFyrBnluBhW7qYUAowXk+iTjopOfvy/3qu8kNgx3GVb6P+4bl34SuSVkcL
 91nxRXSZon/b+ZWjc1XHnid2lpAQ6QlqSZvuG3qspqNtF8RWWJcT9XABaLnxfhBNp2FaVKKo
 WIJncOThMhXU83Ry3zdHbhVRerzjxpgDNE7qQQxd6TNChz3oyLzFWyuyG0WyLhV3jYsJmayP
 R67VfJ5755PJnq6BZKbkKrqY/nGOZPITIy/PtiNN4ImSsEoKGevoXE/DWbNjjuFuBV9zskC1
 WKzLJ/E4YAyUv88klJbho41jNcW+8zJ7T2PFM6rl0z9idJzphe9EN84DbdHVchhhIvsnekf2
 4832xKix0oNXevgTDPQ9IJPf1kGIWJiXcL9qtBNd/7FKQ1jQTlzB/jUyLInWopkg6UKybuYo
 iDjAhdVmAjlmHnKCQSWcXQ/Ornhaoly8CAgNis2MFf2h3V6OdSz7L0SfoccdKU88LAx1uZ9S
 vQIIp3SAvlGRjnd1S4aaJ3x8N5reBix3FrcNCu5ejkvOZVnQlWRqNPjewLu8ggIDza26pRi8
 +HxiFuDTMNaFQp4DcvQZPa+9H+LvCAQyLBoQk/FAthPY0GwooJkHDP8060sKMYWJBSdmjbDj
 1SKAQ0VrPXmqpMu9IWbnriNqoqkHrcsHkdeGGWHv7+6OTODozimyI5EFu2JYSrcRCX//6D7P
 bdZyPT1MfsmmldWstUjT+Y3nPxmv9a/9aVHyglEHWnQawX5A7xtFXCKwM1Tu/Af3bReowa3B
 hqC99Qy1W9l4y85/Ir9/DYYU9k=
IronPort-HdrOrdr: A9a23:Adm6qK7ZXP0F5SbHMgPXwMrXdLJyesId70hD6qhwISY6TiX4rb
 HWoB1173/JYVoqNE3I3OrwXZVoIkmsk6Kdg7NhXotKNTOO0ADDQb2Kr7GSpwEIcxeOkdK1vp
 0AT0ERMrLN5CBB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="63592665"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 37/70] x86/apic: CFI hardening
Date: Mon, 14 Feb 2022 12:50:54 +0000
Message-ID: <20220214125127.17985-38-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/genapic/bigsmp.c      |  4 ++--
 xen/arch/x86/genapic/delivery.c    | 12 ++++++------
 xen/arch/x86/genapic/x2apic.c      | 16 ++++++++++------
 xen/arch/x86/include/asm/genapic.h | 18 +++++++++---------
 xen/arch/x86/smp.c                 |  6 +++---
 5 files changed, 30 insertions(+), 26 deletions(-)

diff --git a/xen/arch/x86/genapic/bigsmp.c b/xen/arch/x86/genapic/bigsmp.c
index b9d976e8abf2..2000383ab0bf 100644
--- a/xen/arch/x86/genapic/bigsmp.c
+++ b/xen/arch/x86/genapic/bigsmp.c
@@ -10,7 +10,7 @@
 #include <xen/dmi.h>
 #include <asm/io_apic.h>
 
-static __init int force_bigsmp(const struct dmi_system_id *d)
+static int __init cf_check force_bigsmp(const struct dmi_system_id *d)
 {
 	printk(KERN_NOTICE "%s detected: force use of apic=bigsmp\n", d->ident);
 	def_to_bigsmp = true;
@@ -27,7 +27,7 @@ static const struct dmi_system_id __initconstrel bigsmp_dmi_table[] = {
 };
 
 
-static __init int probe_bigsmp(void)
+static int __init cf_check probe_bigsmp(void)
 { 
 	/*
 	 * We don't implement cluster mode, so force use of
diff --git a/xen/arch/x86/genapic/delivery.c b/xen/arch/x86/genapic/delivery.c
index 548c33f282dd..d1f99bf6834a 100644
--- a/xen/arch/x86/genapic/delivery.c
+++ b/xen/arch/x86/genapic/delivery.c
@@ -9,7 +9,7 @@
  * LOGICAL FLAT DELIVERY MODE (multicast via bitmask to <= 8 logical APIC IDs).
  */
 
-void init_apic_ldr_flat(void)
+void cf_check init_apic_ldr_flat(void)
 {
 	unsigned long val;
 
@@ -19,12 +19,12 @@ void init_apic_ldr_flat(void)
 	apic_write(APIC_LDR, val);
 }
 
-const cpumask_t *vector_allocation_cpumask_flat(int cpu)
+const cpumask_t *cf_check vector_allocation_cpumask_flat(int cpu)
 {
 	return &cpu_online_map;
 } 
 
-unsigned int cpu_mask_to_apicid_flat(const cpumask_t *cpumask)
+unsigned int cf_check cpu_mask_to_apicid_flat(const cpumask_t *cpumask)
 {
 	return cpumask_bits(cpumask)[0]&0xFF;
 }
@@ -33,17 +33,17 @@ unsigned int cpu_mask_to_apicid_flat(const cpumask_t *cpumask)
  * PHYSICAL DELIVERY MODE (unicast to physical APIC IDs).
  */
 
-void init_apic_ldr_phys(void)
+void cf_check init_apic_ldr_phys(void)
 {
 	/* We only deliver in phys mode - no setup needed. */
 }
 
-const cpumask_t *vector_allocation_cpumask_phys(int cpu)
+const cpumask_t *cf_check vector_allocation_cpumask_phys(int cpu)
 {
 	return cpumask_of(cpu);
 }
 
-unsigned int cpu_mask_to_apicid_phys(const cpumask_t *cpumask)
+unsigned int cf_check cpu_mask_to_apicid_phys(const cpumask_t *cpumask)
 {
 	/* As we are using single CPU as destination, pick only one CPU here */
 	return cpu_physical_id(cpumask_any(cpumask));
diff --git a/xen/arch/x86/genapic/x2apic.c b/xen/arch/x86/genapic/x2apic.c
index bd44bb753995..de5032f2020a 100644
--- a/xen/arch/x86/genapic/x2apic.c
+++ b/xen/arch/x86/genapic/x2apic.c
@@ -38,7 +38,7 @@ static inline u32 x2apic_cluster(unsigned int cpu)
     return per_cpu(cpu_2_logical_apicid, cpu) >> 16;
 }
 
-static void init_apic_ldr_x2apic_cluster(void)
+static void cf_check init_apic_ldr_x2apic_cluster(void)
 {
     unsigned int cpu, this_cpu = smp_processor_id();
 
@@ -74,12 +74,14 @@ static void init_apic_ldr_x2apic_cluster(void)
     cpumask_set_cpu(this_cpu, per_cpu(cluster_cpus, this_cpu));
 }
 
-static const cpumask_t *vector_allocation_cpumask_x2apic_cluster(int cpu)
+static const cpumask_t *cf_check vector_allocation_cpumask_x2apic_cluster(
+    int cpu)
 {
     return per_cpu(cluster_cpus, cpu);
 }
 
-static unsigned int cpu_mask_to_apicid_x2apic_cluster(const cpumask_t *cpumask)
+static unsigned int cf_check cpu_mask_to_apicid_x2apic_cluster(
+    const cpumask_t *cpumask)
 {
     unsigned int cpu = cpumask_any(cpumask);
     unsigned int dest = per_cpu(cpu_2_logical_apicid, cpu);
@@ -92,12 +94,13 @@ static unsigned int cpu_mask_to_apicid_x2apic_cluster(const cpumask_t *cpumask)
     return dest;
 }
 
-static void send_IPI_self_x2apic(uint8_t vector)
+static void cf_check send_IPI_self_x2apic(uint8_t vector)
 {
     apic_wrmsr(APIC_SELF_IPI, vector);
 }
 
-static void send_IPI_mask_x2apic_phys(const cpumask_t *cpumask, int vector)
+static void cf_check send_IPI_mask_x2apic_phys(
+    const cpumask_t *cpumask, int vector)
 {
     unsigned int cpu;
     unsigned long flags;
@@ -130,7 +133,8 @@ static void send_IPI_mask_x2apic_phys(const cpumask_t *cpumask, int vector)
     local_irq_restore(flags);
 }
 
-static void send_IPI_mask_x2apic_cluster(const cpumask_t *cpumask, int vector)
+static void cf_check send_IPI_mask_x2apic_cluster(
+    const cpumask_t *cpumask, int vector)
 {
     unsigned int cpu = smp_processor_id();
     cpumask_t *ipimask = per_cpu(scratch_mask, cpu);
diff --git a/xen/arch/x86/include/asm/genapic.h b/xen/arch/x86/include/asm/genapic.h
index 51a65d3e0f0c..beeaddf19daa 100644
--- a/xen/arch/x86/include/asm/genapic.h
+++ b/xen/arch/x86/include/asm/genapic.h
@@ -39,12 +39,12 @@ extern struct genapic genapic;
 extern const struct genapic apic_default;
 extern const struct genapic apic_bigsmp;
 
-void send_IPI_self_legacy(uint8_t vector);
+void cf_check send_IPI_self_legacy(uint8_t vector);
 
-void init_apic_ldr_flat(void);
-unsigned int cpu_mask_to_apicid_flat(const cpumask_t *cpumask);
-void send_IPI_mask_flat(const cpumask_t *mask, int vector);
-const cpumask_t *vector_allocation_cpumask_flat(int cpu);
+void cf_check init_apic_ldr_flat(void);
+unsigned int cf_check cpu_mask_to_apicid_flat(const cpumask_t *cpumask);
+void cf_check send_IPI_mask_flat(const cpumask_t *mask, int vector);
+const cpumask_t *cf_check vector_allocation_cpumask_flat(int cpu);
 #define GENAPIC_FLAT \
 	.int_delivery_mode = dest_LowestPrio, \
 	.int_dest_mode = 1 /* logical delivery */, \
@@ -54,10 +54,10 @@ const cpumask_t *vector_allocation_cpumask_flat(int cpu);
 	.send_IPI_mask = send_IPI_mask_flat, \
 	.send_IPI_self = send_IPI_self_legacy
 
-void init_apic_ldr_phys(void);
-unsigned int cpu_mask_to_apicid_phys(const cpumask_t *cpumask);
-void send_IPI_mask_phys(const cpumask_t *mask, int vector);
-const cpumask_t *vector_allocation_cpumask_phys(int cpu);
+void cf_check init_apic_ldr_phys(void);
+unsigned int cf_check cpu_mask_to_apicid_phys(const cpumask_t *cpumask);
+void cf_check send_IPI_mask_phys(const cpumask_t *mask, int vector);
+const cpumask_t *cf_check vector_allocation_cpumask_phys(int cpu);
 #define GENAPIC_PHYS \
 	.int_delivery_mode = dest_Fixed, \
 	.int_dest_mode = 0 /* physical delivery */, \
diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
index 33748e629a21..0a02086966c0 100644
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -161,13 +161,13 @@ void send_IPI_self(int vector)
  * The following functions deal with sending IPIs between CPUs.
  */
 
-void send_IPI_self_legacy(uint8_t vector)
+void cf_check send_IPI_self_legacy(uint8_t vector)
 {
     /* NMI continuation handling relies on using a shorthand here. */
     send_IPI_shortcut(APIC_DEST_SELF, vector, APIC_DEST_PHYSICAL);
 }
 
-void send_IPI_mask_flat(const cpumask_t *cpumask, int vector)
+void cf_check send_IPI_mask_flat(const cpumask_t *cpumask, int vector)
 {
     unsigned long mask = cpumask_bits(cpumask)[0];
     unsigned long cfg;
@@ -204,7 +204,7 @@ void send_IPI_mask_flat(const cpumask_t *cpumask, int vector)
     local_irq_restore(flags);
 }
 
-void send_IPI_mask_phys(const cpumask_t *mask, int vector)
+void cf_check send_IPI_mask_phys(const cpumask_t *mask, int vector)
 {
     unsigned long cfg, flags;
     unsigned int query_cpu;
-- 
2.11.0


