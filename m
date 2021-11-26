Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E56A45EEBC
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:08:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232864.404060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaxK-0008QX-8S; Fri, 26 Nov 2021 13:07:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232864.404060; Fri, 26 Nov 2021 13:07:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaxJ-0008Dp-KO; Fri, 26 Nov 2021 13:07:57 +0000
Received: by outflank-mailman (input) for mailman id 232864;
 Fri, 26 Nov 2021 13:07:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqauu-0003W9-Cn
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:05:28 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 846e797f-4eb9-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 14:05:24 +0100 (CET)
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
X-Inumbo-ID: 846e797f-4eb9-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931924;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZfAMQ5gXNhkyy/7pM7nDOvtvjRuJe/w57bbDaSOyQrI=;
  b=Xrhqk4IdtcCx7hQ2kuQgiOcp5q9htQRUZeH2QtI2JQQqk2z1XSFWmStm
   k8c6bIy5H4PhQTh6PO+qyCJObS5VJorR1iT0A232ah6NViqc3aXUtIq37
   D0RVSnPwOeb6MkRrddbjvzCw2IfMvzaiS0VInXC/hLyzAU/fRZYkPitVw
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: BQqAQ9/QWNhbiSN8W9Di7v7gSxwhnlTH8wsxI5qXFyyLu8cQ5dyHiscix5irSI4vDRRJAgEvU5
 Icymn2Za8wlxSt7KMxRJv0+a8Q9c7kzG1tc0/8NMye4rV42rgdre29CnnI9FU2LGsPWf+nj+AR
 P24nxgELA5P4xnYWV3Ysd9yS8UZwalnH09ft99bmXYHLmgM9QUj7Q62Boh05shRWCjgWFPNeFU
 b2jyJxSty2JMpAhQQfr48Y0kP+JPfsm/lPkhDKSS9krctkJbMsByK5ZTvsF5KSkJc2pAmEyPHy
 iN8ywxG8tfP/SaZGtjelHaxR
X-SBRS: 5.1
X-MesageID: 59064012
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:aZ/j5qtW/DuLyak5AcGCRRXefOfnVJtZMUV32f8akzHdYApBsoF/q
 tZmKW6OPfzYMGWkf4h+bY3gp0wG75SEzt41G1E5+Sg2RCoU+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cx24bhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplj769EyFzG6z1mcsTAxRgEBxOF/MB5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6DN
 pJHNWI2NnwsZTVDMHpOVpQ8u974g0vDfzYHsg2qpok4tj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKjMwOcGbyDGF2mmxneKJliT+MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO9cY5VurkI/V2ge2CDgJdj18WPZ489BjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WsQWmoq
 w1muhTSkFn6YSQj86ygtW7KjDu3znQiZl5kv16HNo5JA+4QWWJEW2BKwQSEhRqjBNzAJrVkg
 JTis5PFhAzpJcvQ/BFhuM1XQNmUCw+taVUwe2JHEZg77CiK8HW+Z41W6zwWDB43aZlUJ2K2M
 RON5Vg5CHpv0J2CNvQfj2WZUZlC8EQdPY69CqC8giRmPvCdizNrDAkxPBXNjggBYWAnkL0lO
 IfzTCpfJS1yNEiT9xLvH711+eZynkgWnDqPLbimn0XP+efPPxa9FOZaWGZim8hktctoVi2Oq
 I0BXyZLoj0CONDDjt7/rdROcAtUdCdjXvgbaaV/L4a+H+avI0l5Y9e5/F/rU9YNc319mria8
 3ejdFVfzVaj13TLJR/TMiJoaa/1XIY5pnU+ZHR+MVGt0nklQICu8KZAKMdnIeh5rLRunaxuU
 v0IW8ScGfATGD7JzCsQMMvmp4t4eRX12Q/XZ3i5YCIydoJLThDS/oO2ZRPm8SQDV3LltcY3r
 7C6+BncRJ4PG1ZrAMrMMar9xFKtp3kN3ul1WhKQcNVUfUzt9qlsKjDw0aBrc51dd02by2LDh
 QiMABoeqe3cmKMP8YHE1fKesoOkM+piBU4GTWPV2qm7aHvB9W25zI4eDOvRJWLBVHn58bmJb
 PlOy62uK+UOmVtHvtYuE7tvyq5itdLjq6UDk1ZhFXTPKV+qFqlhMj+N2swW7v9BwbpQuA2XX
 EOT+4YFZeXVaZ29SFNBdhA4aumj1O0PnmiA5Ps4F0z2+Str8efVSk5VJRSN1HRQIbYd3FnJG
 gv9VBr6MzCCtyc=
IronPort-HdrOrdr: A9a23:L3TuBq0wT24uS1Hjva+F0QqjBIokLtp133Aq2lEZdPRUGvb3qy
 nIpoVj6faUskd2ZJhOo7C90cW7LU80sKQFhLX5Xo3SOzUO2lHYT72KhLGKq1aLdhEWtNQtsZ
 uIG5IOcOEYZmIasS+V2maF+q4bsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="59064012"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 33/65] x86/apic: Annotate fnptr targets
Date: Fri, 26 Nov 2021 12:34:14 +0000
Message-ID: <20211126123446.32324-34-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/genapic/bigsmp.c   |  4 ++--
 xen/arch/x86/genapic/delivery.c | 12 ++++++------
 xen/arch/x86/genapic/x2apic.c   | 16 ++++++++++------
 xen/arch/x86/smp.c              |  6 +++---
 xen/include/asm-x86/genapic.h   | 18 +++++++++---------
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
diff --git a/xen/include/asm-x86/genapic.h b/xen/include/asm-x86/genapic.h
index 51a65d3e0f0c..beeaddf19daa 100644
--- a/xen/include/asm-x86/genapic.h
+++ b/xen/include/asm-x86/genapic.h
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
-- 
2.11.0


