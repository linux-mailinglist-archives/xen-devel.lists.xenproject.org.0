Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKMpOCvdqWnzGgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 20:44:43 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BC1217B71
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 20:44:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1247091.1545975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyEcN-00014A-Bb; Thu, 05 Mar 2026 19:44:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247091.1545975; Thu, 05 Mar 2026 19:44:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyEcN-00012a-8p; Thu, 05 Mar 2026 19:44:19 +0000
Received: by outflank-mailman (input) for mailman id 1247091;
 Thu, 05 Mar 2026 19:44:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a8fi=BF=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1vyEcK-00011h-RZ
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 19:44:17 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b09bb82f-18cb-11f1-b164-2bf370ae4941;
 Thu, 05 Mar 2026 20:44:14 +0100 (CET)
Received: from BL1P223CA0036.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:5b6::18)
 by DM4PR12MB6325.namprd12.prod.outlook.com (2603:10b6:8:a4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 19:44:08 +0000
Received: from BL02EPF0001A0F9.namprd03.prod.outlook.com
 (2603:10b6:208:5b6:cafe::ea) by BL1P223CA0036.outlook.office365.com
 (2603:10b6:208:5b6::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18 via Frontend Transport; Thu,
 5 Mar 2026 19:44:08 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF0001A0F9.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 19:44:07 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 5 Mar
 2026 13:44:07 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via
 Frontend Transport; Thu, 5 Mar 2026 13:44:06 -0600
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
X-Inumbo-ID: b09bb82f-18cb-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ygCc+P3S/NQ8T9z9+hCwE2uKUx3hn5jKjxKFvdYq6iTfY0towwtHDSreh7F4lpAJAAsDCpspD007DQoPgRlr/EyttubNIToF08a9kV5iosQimxLckj1mAnDarZNrGVoKeIiMXXTopXMuol5jn5KVwPTA7qB48YE+KsQWmrh7c5VMOVgx2q81Nq+TezUCaRLEz+XhcKVsOLWiBPfpUrAKSr1/PeCPOPQKHOPAgSOJx+HQaUHWhnw2TeYHpjeV0is+1ZbRx8lJhFdz2YYHAjvYetL+hmXRYH0ja87yjc/g8ROCaEmlXfebt+3RWxFs6zq8/r50sp7ZLSzLwAoAcwKIUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1C9rMu+hKSXbM2T3s0AbPGeJ1AJKoa1R2N+QJToS5B0=;
 b=ThNWkQSksf/62DdSHd4HUD6M5cvLDIDTcdmobqM/lbOIoG4PwkaTWD1qrcvD8td/KAUBXjp3q4shQkmP9I5qr8dX10n6DoWug2clY5K4JhnIxUNW0whnM4wDEh8SV24W1zwtUY/sMl5nUiTgeEGMlZbgSMTqqveLVwsXwNpWlJUm/ER/0EvWeQfzGOglFQwTx0qOKlIeEGcGovhbyHgI7Dsc2dxkSLFvoSk80Gt64tlRL/g6I+uXRRq4xyJyBg8A9g3h1HvrXLbc3ZDMTN6+bs7mpYng3VkITZzCroitgQw0N/mgj2nFpiplD/9T+0CCeHReTawQXM94BJ8ESxJtmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1C9rMu+hKSXbM2T3s0AbPGeJ1AJKoa1R2N+QJToS5B0=;
 b=3ZhRcLQUz29S1pDn0dxfAHqeU8NX9rGdJm41Z8xKIVS+ZrlQWQ2hoD6RhrTy8cdREVgqmxRAUvd/Ro6MXbU53LZl9NT3BdkKZ1XBfeCsm15St15Cshqxg6Nz4FzIS1XcKsS2PrG8CBmw5lUGJmkeWL6O3PCykNZnNzZHBNHd7hc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH] xen: gic-v3: Introduce CONFIG_GICV3_NR_LRS
Date: Thu, 5 Mar 2026 19:43:58 +0000
Message-ID: <20260305194358.2564387-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0F9:EE_|DM4PR12MB6325:EE_
X-MS-Office365-Filtering-Correlation-Id: d367120a-247b-43e1-17bd-08de7aef90c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	KvIAc8BL5NLRh6k07DYrPE9Hr656zkG29PwS2b9Ie8x1TgzxHGiuuUh7jyGAe2waBkiUssYhJQTU+H3+lJxobKc4Wd6pSS1ZLgDveTRDNftS9mWVjZmSkX5MZl7ELNL0dDcrckIEKnlAlw8F+e7BTZK5kncTx2JkzXf7whoALhlaYPoTh+5lGV4x8fB3lILteAzPqVdhkpePWUTxjVRV6oyp0U5pBa6oxkHAxMlPKdnPsAfyc9e1mIOkVrppeHFZ1qKq3JHwubWE8UaMLrL4NkknKeLJM2AT7jyNC2ofSxC0itLMSo0qIoGVBkCFAUV5/Y9fCcfRXhYcByGK2Jjb4XKk5beO3I+cIHmtm9rlIr2QcvabJQJqSe+J3mjyEDX++kjQrykDhFiZ0r6gbsB/JfAYP/IGOEHWgdZl6bc86bZPfZr01u2semcZONGQo15KGw2nqp0CrYtuKKl6TQiUB++wfvtMqN8HL2ShZG/KU7R8bU/LrVOiuFcIPqcWG3Gc1Y/czw3r7TBGNohg44a92qAJE4BsfLOKJt5FY4OvkwLfIPdPpuY3KABVirG7ugH7iEgEzksEjXcemWWHzXeh7kbv/P5DFwMM6l3ZYBKGmZHEXtxYZ08ydiG6qMquzEEZOkrn9fAVnSX3prnSxeWq9THt9wJRAPHpZD2LI84BU7WHMcohFRIar5D2iKHb3EbLZTeko20obSNA7gta1XO16PTfhUgXp0JnhUgXF3oM0saIHOK84gzYebkSIhrMKRtyp/PuNYKrlX/zJd3dq8h/ww==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ottV+oYcwRT4Fb9fh5IfNOXPqFpsJyWRpe+TS1KoxCFNaxeJhDbwzY2lYsjskRzCKuE13RLk10AGGY9iDjB6E5jNKGr6F+/zpPuLNOtu/3QZl3BAa0J9lKLOA9PXemvhXlIaNao9Ie7uCKUbqTdf/s9M09hr8w0/7ovUzMqvcs6YBPpc2NHz+6SR7mS/3kk8K1p446SGf566sQRr2a9QBH7grDPTJCuS4bVZMc/+CPDCQ/E2xLC9Uw9HbQ0KxXj9J1iXfMJyzWfVRJkUnBfmW5lHZ/TSJd1LaT10qYS5X+/mNaFoNbdqLX4JY4R6cOpUH0vMpvAmxb4MdM+l4kdB/oic3A2RrxEUnIALIf6GZLI6tw94ulNX/1lRwTBM/xCtDaIrFc90JKQcrt3LHqxUZF9xCXjZLuM1jIzwWf7DmZk/DQt8K5kPqrax0RdURj3+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 19:44:07.7164
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d367120a-247b-43e1-17bd-08de7aef90c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0F9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6325
X-Rspamd-Queue-Id: 52BC1217B71
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:ayan.kumar.halder@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ayan.kumar.halder@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ayan.kumar.halder@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,amd.com:dkim,amd.com:email,amd.com:mid];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Action: no action

Set GICV3_NR_LRS as per the number of list registers in the supported
hardware. This ensures:

1. In gicv3_save_lrs()/gicv3_restore_lrs(), use the number of list
registers from GICV3_NR_LRS (if defined) instead of gicv3_info.nr_lrs.
This ensures that if the hardware does not support more than 4 LRs
(for example), the code accessing LR 4-15 is never reached. The
compiler can eliminate the unsupported cases as the switch case uses a
constant conditional.

2. Similarly In gicv3_ich_read_lr()/gicv3_ich_write_lr() , we can
justify that the unsupported LRs (4-15) will never be reached as Xen
will panic if the runtime value (lr) exceeds GICV3_NR_LRS. Some
compiler can eliminate the code accessing LR 4-15.
In this situation, using panic() is better than accessing a list
register which is not present in the hardware

3. Whenever GICV3_NR_LRS is defined, the default condition and the
related BUG() cannot be reached at all.

As part of functional safety effort, we are trying to enable system
integrator to configure Xen for a specific platform with a predefind
set of GICv3 list registers. So that we can minimize the chance of
runtime issues and reduce the codesize that will execute.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/Kconfig  |  9 +++++++++
 xen/arch/arm/gic-v3.c | 12 ++++++++++--
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 2f2b501fda..6540013f97 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -276,6 +276,15 @@ config PCI_PASSTHROUGH
 
 endmenu
 
+config GICV3_NR_LRS
+	int "Number of GICv3 Link Registers supported" if EXPERT
+	depends on GICV3
+	range 0 16
+	default 0
+	help
+	  Controls the number of Link registers to be accessed.
+	  Keep it set to 0 to use a value obtained from a hardware register.
+
 menu "ARM errata workaround via the alternative framework"
 	depends on HAS_ALTERNATIVE
 
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index bc07f97c16..fb2985fd52 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -51,6 +51,8 @@ static DEFINE_PER_CPU(void __iomem*, rbase);
 #define GICD                   (gicv3.map_dbase)
 #define GICD_RDIST_BASE        (this_cpu(rbase))
 #define GICD_RDIST_SGI_BASE    (GICD_RDIST_BASE + SZ_64K)
+#define lrs                    (CONFIG_GICV3_NR_LRS ?: \
+                                gicv3_info.nr_lrs)
 
 /*
  * Saves all 16(Max) LR registers. Though number of LRs implemented
@@ -59,7 +61,7 @@ static DEFINE_PER_CPU(void __iomem*, rbase);
 static inline void gicv3_save_lrs(struct vcpu *v)
 {
     /* Fall through for all the cases */
-    switch ( gicv3_info.nr_lrs )
+    switch ( lrs )
     {
     case 16:
         v->arch.gic.v3.lr[15] = READ_SYSREG_LR(15);
@@ -121,7 +123,7 @@ static inline void gicv3_save_lrs(struct vcpu *v)
 static inline void gicv3_restore_lrs(const struct vcpu *v)
 {
     /* Fall through for all the cases */
-    switch ( gicv3_info.nr_lrs )
+    switch ( lrs )
     {
     case 16:
         WRITE_SYSREG_LR(v->arch.gic.v3.lr[15], 15);
@@ -178,6 +180,9 @@ static inline void gicv3_restore_lrs(const struct vcpu *v)
 
 static uint64_t gicv3_ich_read_lr(int lr)
 {
+    if ( lr >= lrs )
+        panic("Unsupported number of LRs\n");
+
     switch ( lr )
     {
     case 0: return READ_SYSREG_LR(0);
@@ -203,6 +208,9 @@ static uint64_t gicv3_ich_read_lr(int lr)
 
 static void gicv3_ich_write_lr(int lr, uint64_t val)
 {
+    if ( lr >= lrs )
+        panic("Unsupported number of LRs\n");
+
     switch ( lr )
     {
     case 0:
-- 
2.25.1


