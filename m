Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ObWGE+yumlWawIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2026 15:10:23 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B70892BCBCA
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2026 15:10:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256458.1551085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2raK-0006s4-Ge; Wed, 18 Mar 2026 14:09:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256458.1551085; Wed, 18 Mar 2026 14:09:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2raK-0006pv-Dd; Wed, 18 Mar 2026 14:09:20 +0000
Received: by outflank-mailman (input) for mailman id 1256458;
 Wed, 18 Mar 2026 14:09:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hS3n=BS=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1w2raI-0006pp-DU
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2026 14:09:18 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0bdd8969-22d4-11f1-b164-2bf370ae4941;
 Wed, 18 Mar 2026 15:09:16 +0100 (CET)
Received: from BN0PR04CA0145.namprd04.prod.outlook.com (2603:10b6:408:ed::30)
 by SJ5PPF1C7838BF6.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::98d) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Wed, 18 Mar
 2026 14:09:07 +0000
Received: from MN1PEPF0000ECD8.namprd02.prod.outlook.com
 (2603:10b6:408:ed:cafe::22) by BN0PR04CA0145.outlook.office365.com
 (2603:10b6:408:ed::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 14:08:42 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECD8.mail.protection.outlook.com (10.167.242.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Wed, 18 Mar 2026 14:09:06 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 18 Mar
 2026 09:09:03 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via
 Frontend Transport; Wed, 18 Mar 2026 09:09:02 -0500
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
X-Inumbo-ID: 0bdd8969-22d4-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MrpWwajzbVdYSn6F+40iQzIXWX9tMVtJ3+DXWQwctZyeOpLgVRB7v9sgt41sNoZmYPP1KDgAFtJdp+0dBc1ZzGAKckyt7Hdvh6U2x/nqwcEDp4LEIBKCTcPSW+CYDBWhKmk/wWnNU/A5fcp2ZtSSANhZ8fCqqubVWdBrnBXw9eaY9mn59jdAw3uHc+meK6ckRyXCD0/vw8zDM/curAibcLglYxh94IRWjHlEpmQKOOl/CZyBzodenep/a8cJWB9IsCYeqClrxtEr00W9lhpYkaXMwSo0Q1K7pv5FRsZgaUywiUUDDa5FlueCIhxYhCCAJXIEAIes6vhp8ax11CBrTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6aYC1HHbr1idJJrMJlTLs3JBJFF5ROIIc3NXYS2c74o=;
 b=pDFYgHfa8QIPVJHzEfYTnPhuZO5o0nHk/cc6ML+XPgahNjzngqcUGmA6nX2HUJf0Uhg69vgTNT93YoEjFbLmcikF32DjJyh0JFK5/OuokA6Zf6FAUa23VjVOM12CQl4w6Si97UKhahflnkQjvNFROyqd3b3aolcdKD8M/cudxs4wgluLOLbFys9Mp7sLh0X/hLRq57Cleihjd/I/c0pZawYYrvBGblBXTBlSfRx2aq2GqcB/mC6YfPqnhpmTcotb6INRjBD9SdCDoyy9HFDzJWK6KwR6L+pTwYNc1kmVbbN6P8PskawxoSs5yUt0AGHZ0pyKcDmuqwfG9ht6leo4jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6aYC1HHbr1idJJrMJlTLs3JBJFF5ROIIc3NXYS2c74o=;
 b=fzsNo4cIFCIsj8YW2thIcskBsofuk9Ibal+loA9H8Qz1paR+SwlHuhz+a1QRvuf0MOFDpJomQTf7+PxceoS/uuIHMRUqeR8R9khWu03tgdBQjvF5ds8Ub1GI7LykehmHtEu4Es2QtZXSN+f4oJvEIunLhSqLZK504e80kruJqPA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] xen: gic-v3: Introduce CONFIG_GICV3_NR_LRS
Date: Wed, 18 Mar 2026 14:09:00 +0000
Message-ID: <20260318140900.3795710-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD8:EE_|SJ5PPF1C7838BF6:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f1e9178-ddb3-420d-4a4c-08de84f7ea98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LKBmQNoafsEF0CdL1XtWlrm8Mhv9rZ9WnG54XWZeyKwlJBLXSn0ll6CBw9QQPWwqHbXmfFcKTXKNigl2iKF45NEkXwjCGw6rmy/7yWqFJXD/k6Ztl4PtX6kjxRP+l0TP8BzJCEuqgJHhLOL6ttXQTpwMobgtrJBZPdmy1mgC9LCNRkfx7SJ2hm1GkUdWEJLQH/qDBhuJxACxm01z2mJy66nDeTLgox7qxV5Uh6ft0ZAoOyTkXhbed33P+xO3OeM1z+l47RLv7xz8hOGQrozpWLljXRWwpz4Wf0N6dSTaqY/JQOmc7zGqhdjOyFjbusfrQOLWjwz9rEM78BMqaQsYpYdNBKPtRIKtoK5sj3ucGCNUMIBfONLg9/n097Rs1buDPd8MkU3o8YTcklTGo0RJ1vhSImBviwCzXmXZiSJMe9gul6d7RiqLyyDpNpwMkqlGg73B3KAV23e3sK1iNSBWEHFtAYdBLtPccgiCF2JvKPOUR6Hh/c0AeGbVl6kOLEYreU3HTUnbERKOV1IYikvDAeufwbYvl5bJirXptOvLnFifxnrCyuj6KRRixWctSzpwLOyAozRG16krrqLBoB2lOj2PnvdT8yl8Ba1BkkoFnfrpN+Mc3e3pu9ygO/fdViLv6whUcTzOCtg9VyyrFLTkOqTpJSQSE8GyEp0rysFnFbcmiYf0CR1b7tNd7nLJlOdwWxO7jyhhvbDPZ2uwCjC0nnGIKfSavqs0/EOQbwegwzcOkJn1gwPLxdD/WT2eAxtnzaaXRALkD/W6PHNRuTitQw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/HfMqN3UQ17edVRVeQEjm2L5ulT+sb/n35lNikbTFF7qGJmB75Hl8mIaTPE5IwrZfX6O7H+QBiyQErUy7LdXCPSYcEzgtz7QJLGnC+i87QDksOw8lZ3RfJ6aNkSh5iE3er2Cr1R6pHgIWxJlBPyO+kJ7yba/BzDA02HN7ABAPQPCL8l45UxsGsE4Zz7/By1Rs5rF6JL43LjLnUra/r37UAIs0KHKIg7f+ubNKw43Qyihd+wdAxt33YN0hhE5M0UxjaaGb3VKczxwdFgdsnpYJwP+9BrreAtoWz6QXGuuWt78E/iPtawC7UxxBS1q1Uq+EBnwOld67C4TRfi1LjBBslYVUVhYGkUvJxM2WSz/z9R6Zn/WSd3UHXM33LAuLuhnHOAa0m7lw8AVRi07HI8CRSyKNgq12zWp1UsKqs/jQGXgKt7a8SzLhlluuK0OQXOr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 14:09:06.0380
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f1e9178-ddb3-420d-4a4c-08de84f7ea98
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF1C7838BF6
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: B70892BCBCA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

One key requirement of Xen functional safety is to reduce the number
of lines of code to be safety certified. Besides, a safety certified
Xen requires a static hardware configuration to be defined. This static
hardware configuration is described as per the test hardware/emulator
hardware configuration against which Xen is verified.

Introduce GICV3_NR_LRS with the two aims in mind:
1. User should set the number of GICV3 list registers as per the test
hardware so that the unwanted code can be removed using GCC's dead
code elimination or preprocessor's config.
2. By doing #1, one can ensure that there is no untested code due to
unsupported hardware platform and thus there is no safety impact due
to untested code.

However if the user does not set GICV3_NR_LRS, then it is set to 0.
Thus Xen will fallback to the default scenario (i.e. read the hardware
register to determine the number of LRS).

1. In gicv3_save_lrs()/gicv3_restore_lrs(), use the number of list
registers from GICV3_NR_LRS (if defined) instead of gicv3_info.nr_lrs.
This ensures that if the hardware does not support more than 4 LRs
(for example), the code accessing LR 4-15 is never reached. The
compiler can eliminate the unsupported cases as the switch case uses a
constant conditional.

2. RAZ/WI for the unsupported LRs.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changelog:

v1 - 1. s/lrs/LRS
2. Implement RAZ/WI instead of panic

Few comments which were not addressed
1. Do "gicv3_info.nr_lrs to LRS" in gicv3_hyp_init() and keep the code
unchanged in gicv3_save_lrs()/gicv3_restore_lrs() -- This prevents the
compiler from doing dead code elimination as the switch condition cannot
be evaluated at compile time.
I am not sure how to get around this issue.

 xen/arch/arm/Kconfig  |  9 +++++++++
 xen/arch/arm/gic-v3.c | 14 ++++++++++++--
 2 files changed, 21 insertions(+), 2 deletions(-)

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
index bc07f97c16..eaae95eb4d 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -51,6 +51,8 @@ static DEFINE_PER_CPU(void __iomem*, rbase);
 #define GICD                   (gicv3.map_dbase)
 #define GICD_RDIST_BASE        (this_cpu(rbase))
 #define GICD_RDIST_SGI_BASE    (GICD_RDIST_BASE + SZ_64K)
+#define LRS                    (CONFIG_GICV3_NR_LRS ?: \
+                                gicv3_info.nr_lrs)
 
 /*
  * Saves all 16(Max) LR registers. Though number of LRs implemented
@@ -59,7 +61,7 @@ static DEFINE_PER_CPU(void __iomem*, rbase);
 static inline void gicv3_save_lrs(struct vcpu *v)
 {
     /* Fall through for all the cases */
-    switch ( gicv3_info.nr_lrs )
+    switch ( LRS )
     {
     case 16:
         v->arch.gic.v3.lr[15] = READ_SYSREG_LR(15);
@@ -121,7 +123,7 @@ static inline void gicv3_save_lrs(struct vcpu *v)
 static inline void gicv3_restore_lrs(const struct vcpu *v)
 {
     /* Fall through for all the cases */
-    switch ( gicv3_info.nr_lrs )
+    switch ( LRS )
     {
     case 16:
         WRITE_SYSREG_LR(v->arch.gic.v3.lr[15], 15);
@@ -178,6 +180,10 @@ static inline void gicv3_restore_lrs(const struct vcpu *v)
 
 static uint64_t gicv3_ich_read_lr(int lr)
 {
+    /* RAZ for unsupported LR */
+    if ( lr >= LRS )
+        return 0;
+
     switch ( lr )
     {
     case 0: return READ_SYSREG_LR(0);
@@ -203,6 +209,10 @@ static uint64_t gicv3_ich_read_lr(int lr)
 
 static void gicv3_ich_write_lr(int lr, uint64_t val)
 {
+    /* WI for unsupported LR */
+    if ( lr >= LRS )
+        return;
+
     switch ( lr )
     {
     case 0:
-- 
2.25.1


