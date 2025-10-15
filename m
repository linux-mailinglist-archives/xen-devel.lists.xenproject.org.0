Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CE2BE0C18
	for <lists+xen-devel@lfdr.de>; Wed, 15 Oct 2025 23:06:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1143987.1477557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v98gS-00007d-Kt; Wed, 15 Oct 2025 21:05:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1143987.1477557; Wed, 15 Oct 2025 21:05:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v98gS-0008Vm-HY; Wed, 15 Oct 2025 21:05:20 +0000
Received: by outflank-mailman (input) for mailman id 1143987;
 Wed, 15 Oct 2025 21:05:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nzz5=4Y=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1v98gQ-0008Tw-NR
 for xen-devel@lists.xenproject.org; Wed, 15 Oct 2025 21:05:18 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a59f3e83-aa0a-11f0-9d15-b5c5bf9af7f9;
 Wed, 15 Oct 2025 23:05:16 +0200 (CEST)
Received: from BLAPR05CA0003.namprd05.prod.outlook.com (2603:10b6:208:36e::10)
 by CH2PR12MB4039.namprd12.prod.outlook.com (2603:10b6:610:a8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Wed, 15 Oct
 2025 21:05:11 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com
 (2603:10b6:208:36e:cafe::56) by BLAPR05CA0003.outlook.office365.com
 (2603:10b6:208:36e::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.10 via Frontend Transport; Wed,
 15 Oct 2025 21:05:11 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.0 via Frontend Transport; Wed, 15 Oct 2025 21:05:11 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 15 Oct
 2025 14:05:04 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Oct
 2025 16:05:03 -0500
Received: from fedora.mshome.net (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 15 Oct 2025 14:05:03 -0700
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
X-Inumbo-ID: a59f3e83-aa0a-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N7tsEZuDwPiUwbWsJ1ybGLfaV7tl1ua1MuZUci9PGxD8mamG7Dmdo/jarPYx2VtuFYgOMJpAkxUm+z+AovqYIbVLgRgIzOUiABvHBr8Z79z1Fd9CFn2Yn+UTS9XvtIdiZuGV8G/PyNkU/yTCPiMqpgU7k4QufzeZ8ekmopVIu48i8nNM9Qs68Ix4BobrKwwb4Egce8WdXS4w/GO8vQ2g8FLuJu9nmmlnOSgBbwVsZj6Bx/BjZxengMoUsAuKAMgJhdGK4moYTL4DTMO7Z+bBfVFoZD0M/9rEJ4rtZrkcTohnHsj+i7I9nh3YdIo3JWorsOOyGjkyX6JZtQoKlaJDFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZGeo/e1d2CnjxUHTHRgQ0Hf7kBlFkyxGjZ13Xcn7gIg=;
 b=VgZy4xWxDlbQLGpEbpVisrh5BZs0Cca3CprXu23eP7fbLvq9hVsc8boPR7F9wfFxVtKzdWix0aSJDb0ccv3KnG15Jc1IaPqEKxNCglAu+LkF8BquI6+6yS5t1CSH/PQonX4NVoH+38mK+/Ia1kGOGPT7Z76O0osH34ZjvTN6NJF/LxUAmAmFe1SGjR5sXH3ppHdifCPwo7od3x8QS4YvfcRti5urGIsIttOksRIlAPpluMBZhHb/DX6Jz0A7OR6aukAOzy9R1rCFo0SFNct2rHGfbdUt52TRV98eDuyd+/pCutnXenNpPPBzjNIBsUsaf9PPKn1zChWIYvVHL4oNOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGeo/e1d2CnjxUHTHRgQ0Hf7kBlFkyxGjZ13Xcn7gIg=;
 b=vq8L5mtt0p7AgCLYaZpiPgPVi8GN6C2oxyxJo+vAriBDumx9UccCFTH/v6PV6pD+xfcJi5RT6iiJExcYbu6nJJGohgNaf3GsxuxqGbWyunoj9BTFCpzC6mYhEiZaGaj4/j+ujaMJ2/EuzBWFggZGsEvm0ff9hHSuOeN0Jth9bmg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH for-4.22 v3 2/2] x86/io_apic: Use next_entry() in loops
Date: Wed, 15 Oct 2025 17:04:54 -0400
Message-ID: <20251015210454.95381-3-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015210454.95381-1-jason.andryuk@amd.com>
References: <20251015210454.95381-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|CH2PR12MB4039:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a5eaa92-e304-403d-a343-08de0c2e876a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PV8uM+1lrVp8fEdv5NsPyiSz85u+806CLDvN6M+bu12z8iRwDTpPEqCTdY5r?=
 =?us-ascii?Q?8m0WrqfM2ID9vNRxZKjlrj2AgDiXfeboaYV6SICvRvgxKwNIPK63xTV7Uq71?=
 =?us-ascii?Q?iCWdaomh+8Ke0Ti1fbipMCfkXD8cnAfU0boNgL4z9C0NXhEE0pwcEStSEd09?=
 =?us-ascii?Q?xeK+e+mvB0WUSdceY3dvd3HP4OqQ/EmKg5OxF4n9RV2Haf2gNpG2FCUF872+?=
 =?us-ascii?Q?Yoah1LWi1lLlr1bIoXxuaZfS6kkaTbTCzPTiuZuuJtnNXKiIWpj2uJ/NsLye?=
 =?us-ascii?Q?4O/9DiGzUSqB+/12PzsswUc1HyoLuz8zMKoCCGqjAKDjDoK910U3dr8hCu9U?=
 =?us-ascii?Q?z4KgOI3piiGO3djlimlQ+45eUGgBzHfgz2nv/XIy2XI+ZMt3rxAN7rlX5TUF?=
 =?us-ascii?Q?3YaM7487NO8tN8WZuTdm32NSf1NT2NZeUltkPF1vRE19z+Hy9q2c8mJR4psM?=
 =?us-ascii?Q?pSalLryAcfHBm82eADkmYWmUMlOvWGfrO06XwPz8i1K8hGZRtVgZznbA+6/Q?=
 =?us-ascii?Q?uGeZNvVAnvB82pXGtnk02tQLGZ1AJC9AvJBlcBlJWPb7VKavhLC4MiF3oXZM?=
 =?us-ascii?Q?MT3yW02BSO+T24uAsfcdYChzT0z9BeZ7UIL5jausVUzT1rdSuRrGjNtpwpoJ?=
 =?us-ascii?Q?fGhx+giV2mhx0UwkaGyJ/tsGkH9eOv/9Ay2ed8qqkaEj1kYoORO6J5BPFE50?=
 =?us-ascii?Q?Cepaz/Kkh8Lq4Hq99omLXUlR3Fc89k9fVWEo8t2ZCLr8KVW8+JYqXqYYk/7o?=
 =?us-ascii?Q?ozVdEQZiHbQWO76mXynD8i2pV2kGQ8ge2t98gQ9RABlOjDvFZOFrxXhOPFm3?=
 =?us-ascii?Q?13Xn1f0iYROZq+yqFQ1cmAlb8oP8zv5SQ+vr5J2HfPTluObediX14t/XqRg+?=
 =?us-ascii?Q?1p8891iShGf9u26NUH6LmvpDB+5iEGhrSu6PPzG3aAkF3/v36QjVaNMjKU3N?=
 =?us-ascii?Q?skxx6lZkgcMDPm4aUq+ZhZHl0UgDl6zLbFpQ41qJKEJRllDQu2ljEcEgIsQq?=
 =?us-ascii?Q?JHjVWt1/7w/7LssBDx2lDX7bErVkvUki1zZcFi0UsN1YNN2Lll0Cg74RD5uu?=
 =?us-ascii?Q?zFTO2Nf7DRTqhg+2ttRRsVyhRJwNS3UNB4w+Ej7qp/Rr0tErHsIagATnC1U3?=
 =?us-ascii?Q?2KAF9vDhczT8pttrcDUlDnRy5oIdKB2PFBSYqxXEElDLumeXTdc8psjl5xRh?=
 =?us-ascii?Q?WUfLRJ0Bq7hfZI02wcemyBli7AfgUHnBOIZZGW04B3oRHbHl+6hNNvXS+u2/?=
 =?us-ascii?Q?9qtJvVxtNquDI4SdykDvIWFbrJArfj2Z1aoPtyzBGbXQ6Hl8zFRF2lEZ9QOY?=
 =?us-ascii?Q?QwWEsaCm5QiTdi7Xiy/8z5lOqAWPikMK8Y1mCX7buoASlXfrUN21myPhXSbd?=
 =?us-ascii?Q?yiQmNZ6yYGtuzXnBUN0Ju+Zx6SdFDM/toOoUar8X7DSCL43EGXO85fEVi252?=
 =?us-ascii?Q?NkmGgi0au/iDqekSjOrcv8OakZW6mpg9PsOSwTswVX/9onIyWGLF95kA2Xkr?=
 =?us-ascii?Q?6Qe266jn48GL5eLLFQJsrGmFWOv+UkPwg/EVfJT4eiv67zWIlmRjuYK5FU42?=
 =?us-ascii?Q?YAFF+tanUxE/aSr0Txc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 21:05:11.2705
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a5eaa92-e304-403d-a343-08de0c2e876a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4039

io_apic.c has a lot of ad-hoc for(;;) and while(1) loops for iterating
over irq_pin_list entries.  Replace them with a standardized
for loop using next_entry() to advance entry.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/arch/x86/io_apic.c | 49 ++++++++++++------------------------------
 1 file changed, 14 insertions(+), 35 deletions(-)

diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index c35d611ecf..73b48a9cb8 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -191,6 +191,14 @@ static void remove_pin_from_irq(unsigned int irq, int apic, int pin)
     irq_2_pin_free_entry = entry - irq_2_pin;
 }
 
+static struct irq_pin_list *next_entry(const struct irq_pin_list *entry)
+{
+    if ( !entry->next )
+        return NULL;
+
+    return irq_2_pin + entry->next;
+}
+
 /*
  * Reroute an IRQ to a different pin.
  */
@@ -200,15 +208,12 @@ static void __init replace_pin_at_irq(unsigned int irq,
 {
     struct irq_pin_list *entry = irq_2_pin + irq;
 
-    while (1) {
+    for (; entry; entry = next_entry(entry)) {
         if (entry->apic == oldapic && entry->pin == oldpin) {
             entry->apic = newapic;
             entry->pin = newpin;
             share_vector_maps(oldapic, newapic);
         }
-        if (!entry->next)
-            break;
-        entry = irq_2_pin + entry->next;
     }
 }
 
@@ -482,7 +487,7 @@ static void modify_IO_APIC_irq(unsigned int irq, unsigned int enable,
 {
     struct irq_pin_list *entry = irq_2_pin + irq;
 
-    for (;;) {
+    for (; entry; entry = next_entry(entry)) {
         unsigned int pin = entry->pin;
         struct IO_APIC_route_entry rte;
 
@@ -492,9 +497,6 @@ static void modify_IO_APIC_irq(unsigned int irq, unsigned int enable,
         rte.raw &= ~(uint64_t)disable;
         rte.raw |= enable;
         __ioapic_write_entry(entry->apic, pin, false, rte);
-        if (!entry->next)
-            break;
-        entry = irq_2_pin + entry->next;
     }
 }
 
@@ -545,14 +547,11 @@ static void __eoi_IO_APIC_irq(struct irq_desc *desc)
     struct irq_pin_list *entry = irq_2_pin + desc->irq;
     unsigned int pin, vector = desc->arch.vector;
 
-    for (;;) {
+    for (; entry; entry = next_entry(entry)) {
         pin = entry->pin;
         if (pin == -1)
             break;
         __io_apic_eoi(entry->apic, vector, pin);
-        if (!entry->next)
-            break;
-        entry = irq_2_pin + entry->next;
     }
 }
 
@@ -632,7 +631,7 @@ set_ioapic_affinity_irq(struct irq_desc *desc, const cpumask_t *mask)
         if ( !iommu_intremap || !x2apic_enabled )
             dest = SET_APIC_LOGICAL_ID(dest);
         entry = irq_2_pin + irq;
-        for (;;) {
+        for (; entry; entry = next_entry(entry)) {
             struct IO_APIC_route_entry rte;
 
             pin = entry->pin;
@@ -643,10 +642,6 @@ set_ioapic_affinity_irq(struct irq_desc *desc, const cpumask_t *mask)
             rte.dest.dest32 = dest;
             rte.vector = desc->arch.vector;
             __ioapic_write_entry(entry->apic, pin, false, rte);
-
-            if (!entry->next)
-                break;
-            entry = irq_2_pin + entry->next;
         }
     }
 
@@ -1308,12 +1303,8 @@ static void /*__init*/ __print_IO_APIC(bool boot)
         if (entry->pin < 0)
             continue;
         printk(KERN_DEBUG "IRQ%d ", irq_to_desc(i)->arch.vector);
-        for (;;) {
+        for (; entry; entry = next_entry(entry))
             printk("-> %d:%d", entry->apic, entry->pin);
-            if (!entry->next)
-                break;
-            entry = irq_2_pin + entry->next;
-        }
         printk("\n");
     }
 
@@ -1586,14 +1577,6 @@ static int __init cf_check setup_ioapic_ack(const char *s)
 }
 custom_param("ioapic_ack", setup_ioapic_ack);
 
-static struct irq_pin_list *next_entry(const struct irq_pin_list *entry)
-{
-    if ( !entry->next )
-        return NULL;
-
-    return irq_2_pin + entry->next;
-}
-
 static bool io_apic_level_ack_pending(unsigned int irq)
 {
     struct irq_pin_list *entry;
@@ -2415,7 +2398,7 @@ void dump_ioapic_irq_info(void)
 
         printk("    IRQ%3d Vec%3d:\n", irq, irq_to_vector(irq));
 
-        for ( ; ; )
+        for ( ; entry; entry = next_entry(entry))
         {
             pin = entry->pin;
 
@@ -2432,10 +2415,6 @@ void dump_ioapic_irq_info(void)
                    (x2apic_enabled && iommu_intremap) ? 8 : 2,
                    (x2apic_enabled && iommu_intremap) ?
                        rte.dest.dest32 : rte.dest.logical.logical_dest);
-
-            if ( entry->next == 0 )
-                break;
-            entry = &irq_2_pin[entry->next];
         }
     }
 }
-- 
2.51.0


