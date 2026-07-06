Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1thmClavS2r+YQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 15:36:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4398571158F
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 15:36:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=fhTYC4BO;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1355387.1610151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgjUU-0000oH-6y; Mon, 06 Jul 2026 13:36:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355387.1610151; Mon, 06 Jul 2026 13:36:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgjUU-0000mF-3b; Mon, 06 Jul 2026 13:36:06 +0000
Received: by outflank-mailman (input) for mailman id 1355387;
 Mon, 06 Jul 2026 13:36:05 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ayan.kumar.halder@amd.com>) id 1wgjUS-0000m9-Rq
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 13:36:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgjUS-00A8Vt-8W
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 15:36:04 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6a4baf3f-bab6-0a2a0a5309dd-0a2a4509819e-14
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 15:36:03 +0200
Received: from [40.93.194.61]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6a4baf42-97e6-0a2a45090019-285dc23d248a-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 15:36:03 +0200
Received: from SJ0PR05CA0066.namprd05.prod.outlook.com (2603:10b6:a03:332::11)
 by MW4PR12MB7167.namprd12.prod.outlook.com (2603:10b6:303:225::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 6 Jul
 2026 13:35:57 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:332:cafe::a2) by SJ0PR05CA0066.outlook.office365.com
 (2603:10b6:a03:332::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.7 via Frontend Transport; Mon, 6
 Jul 2026 13:35:57 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 6 Jul 2026 13:35:57 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 6 Jul
 2026 08:35:57 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 6 Jul
 2026 06:35:56 -0700
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via
 Frontend Transport; Mon, 6 Jul 2026 08:35:55 -0500
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E60gsmfncg1nmvRd6GHJVIwfikx9pnFgd3yjBY8LGE+zJekQw/OkRDgHcUUIYzAF4kV5a2zdh8q6FMhx7NA9WJEC9rCaRJwOGDRIgLtXbMRnsO0oJaVumtF3ULQQuTaEqouon9528kBy8LnJCLSgIcrAI69Tsh+qkLupinmUIWP7N9zfpFS56bSnrvpTUc/QDzKeSIg0/5PHOLsGmh0eLZECZU3TKtbqnsLpgTH8oa/hBJqXAw4yfWD5hKYFzgiiVbRL8E7IWkyYslC9HogQuxb9Ww9Ol53wVhCzyBL6mPehzR7s+dVPruPqPJha6cxjMN6IG0pUh1CGTCOFjvWwrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PIbUc3buFTq12sQv+tOHtXeOpEClYMe5fX1OvocDT60=;
 b=QYNPabMMkEZ/3VFR1APrWH70Z0yFFzPDb0RBViD/p1KWjN6mq0gSF6A/BDhac5qJmZGXo0qGDOMj20MhTE+PHbIm5cBxRUU0KYcNCvcjL20l/XbTMtXy2QT+9YFF/zugIM0yxIMnx7H6e0xVSOtwzTlDnd2JwVpbV6kJv6D2CklmBpbnAtvTqqEFkzeVwGdK+nAAiLjvbqztudUIPdZtZ1//vhZQ3nbwp4wEi/y3pm5kavwvNFlibgWCq61gIqUWGmG8uUu5F12uG9b6UGKYWV0381k8le/1PBqfj2iT0KGs98HfURwixzEmaX9w7yhjaCyspvFPn7TDOq0yE2kqzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PIbUc3buFTq12sQv+tOHtXeOpEClYMe5fX1OvocDT60=;
 b=fhTYC4BOFgVtC5eOwYhdrXdeIh+D2c/MoDwtYseXonwD9hUweaISs2ABYDM5i53Zl3UlMf/I2+31qhDSmnmYL59/kco1SX6pHIY0h/BSykUCrx387JpLqUglvQiQ1JbVlKP8C6ImRRDmKLB+pDBY5RWMNbslNeeoTKT2HSoka7s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>
Subject: [PATCH v3] xen/arm: gic-v3: Introduce CONFIG_GICV3_NR_LRS
Date: Mon, 6 Jul 2026 14:35:53 +0100
Message-ID: <20260706133553.3026786-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|MW4PR12MB7167:EE_
X-MS-Office365-Filtering-Correlation-Id: b5b34ba9-d8d6-4bfa-0d9f-08dedb6382b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	KKk1Y8wq2MgPgxsLYWbf96gCQjHnUyoT5UC1kFPaf86oRwKyMr2nIiDUQau1YeZxgm7y/jFa5jrniJfQ3SvKs3rmh7Pa31r3MDYWJDJT52URCi6RROFgDce/RJb20amYCXvQ6tfCd3WPqYq2ypeuaknG6Mb6QbarbHYZBqZVPUhMKNitxZvwWAcoc7jtT5wTqyTPkDy05jUHyVj9PPPeN0irgUgJHV+TsQLyXiAizj3mP+enDZRNzVLK6ExmSlNEi0/+vTI5Woxym+J+klUqZ2gLJGT7Ue6VozK7u6tEutWJvmTm/VU3v/r09lTa9JzEWW0epkURPB17EZYbLL60dFP76dp7IrrqHhLPwwu1Xhb0HKZk1C86bvuGzI0y09HPODY7IR+KmfC0CUHnYNBbpFpDLbb0q8ukhafwCMvPSmwsNtRPDJ+zVNa7mH108/aIuXvvtl2vnErBTUXD7kjENC+RiF/4RAcCBv5ukIslJHuA5xL0dSGyXUakYrhQnDO8oBQFPQrFLvor6JIMrikWMBA6qowrjX+BuWnBzHaXz83U8Cx4OoYNM5vssfLfzjEruQ9bo1dBwexgO0Z1PI3yGbOv8XyNI71xg5KuCEwVNPyHqCepM5Ykn06lG1HRBuukUmLqBi+rFV3fU1V4m7mJ3TDaMkpQ/m3sNkyFnPQEAvdjVFwQYu+bUpZYTO0brSIYK0vO7Etm69BxCmV+KrParg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HivPYJje2JzseAdoOs/mCNIe98SinbnN587fHcOnHr0q6V5Qw+MipMkIue+2fkUUo/nlrHHWHE+fvbBd0Y+SGMMMV/LXYdBSX97yXgtsY+uq6Ct4PV6JFHHzS0SVKJp+Jxm6VXc9Js0HKyhexr6NW8Vr6iNQ8K5VH8Us6uyN/zklQIvxWP8F1lG6NkHMfGjURGe7G3z6DS327lKx65YSLG2VrGdQwew4J3cwOtg7NqvAXxMYIsY3+pLvri128fRCDToDoQ4dq/0Tq6Xx5RcYv3WhvSMiH7xrBC4DFFr16/Om91YVfQAdNKxVqt2NTA8h0bN8I1vD5sQ9d3pwnPXad551SI4DiHzrmHeb0/4bWFBgK8cJEHOEwExXizAEdfMPzcTPnBkDLenWoKd1zZrtYB3JFUdtLCqSeVkj3wSAkNulJltP31aaGFVFUlNZVEom
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 13:35:57.3638
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5b34ba9-d8d6-4bfa-0d9f-08dedb6382b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7167
X-purgate-ID: tlsNG-bad1c0/1783344963-44F2D986-1EC06643/0/0
X-purgate-type: clean
X-purgate-size: 5079
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:ayan.kumar.halder@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ayan.kumar.halder@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_NEQ_ENVFROM(0.00)[ayan.kumar.halder@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[amd.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:from_mime,amd.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4398571158F

Add a Kconfig option that lets an integrator hard-code the number of
GICv3 Link Registers Xen uses. The default (0) keeps reading the count
from ICH_VTR_EL2.ListRegs at boot. A non-zero value is validated
against the hardware count in gicv3_hyp_init() and replaces
gicv3_info.nr_lrs.

gicv3_hyp_init() now panics if CONFIG_GICV3_NR_LRS exceeds the
hardware count, and zeroes all hardware LRs (once per CPU) as defensive
hardening, so any interrupt left in an LR that Xen will not manage
cannot be picked up by the GIC.

gicv3_ich_read_lr()/gicv3_ich_write_lr() now reject out-of-range
indices with an error message, ASSERT_UNREACHABLE() and WARN() instead
of silently returning RAZ/WI; reaching this path indicates a bug.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in 
v3:
- Validate CONFIG_GICV3_NR_LRS against the hardware count in
  gicv3_hyp_init() and panic if it exceeds it (Julien, Luca).
- Allow an integrator to select fewer LRs than the hardware supports;
  gicv3_info.nr_lrs is replaced with the clamped value (Julien).
- Zero all hardware LRs in gicv3_hyp_init() as defensive hardening.
- Replace the silent RAZ/WI out-of-range path in gicv3_ich_read_lr()/
  gicv3_ich_write_lr() with gprintk() + ASSERT_UNREACHABLE() + WARN()
  (Julien).
- Renamed the Kconfig from LRS to NR_LRS (Julien).
- The link-time dead-code-elimination guard is split out into a
  separate follow-up patch.

v2:
- s/lrs/LRS.
- Implement RAZ/WI instead of panic.

 xen/arch/arm/Kconfig  |  9 ++++++++
 xen/arch/arm/gic-v3.c | 50 ++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 5fa89fcb24..798bc8e9b2 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -143,6 +143,15 @@ config GICV3_ESPI
 	  range, from 4096 to 5119. This feature is introduced in GICv3.1
 	  architecture.
 
+config GICV3_NR_LRS
+	int "Number of GICv3 Link Registers used" if EXPERT
+	depends on GICV3
+	range 0 16
+	default 0
+	help
+	  Controls the number of Link registers to be used.
+	  Keep it set to 0 to use a value obtained from a hardware register.
+
 config HAS_ITS
         bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORTED
         depends on GICV3 && !NEW_VGIC && !ARM_32
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index acdac22953..46ab0b6329 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -178,6 +178,15 @@ static inline void gicv3_restore_lrs(const struct vcpu *v)
 
 static uint64_t gicv3_ich_read_lr(int lr)
 {
+    if ( lr < 0 || lr >= gicv3_info.nr_lrs )
+    {
+        gprintk(XENLOG_ERR, "GICv3: LR read index %d out of range (nr_lrs %u)\n",
+                lr, gicv3_info.nr_lrs);
+        ASSERT_UNREACHABLE();
+        WARN();
+        return 0;
+    }
+
     switch ( lr )
     {
     case 0: return READ_SYSREG_LR(0);
@@ -203,6 +212,15 @@ static uint64_t gicv3_ich_read_lr(int lr)
 
 static void gicv3_ich_write_lr(int lr, uint64_t val)
 {
+    if ( lr < 0 || lr >= gicv3_info.nr_lrs )
+    {
+        gprintk(XENLOG_ERR, "GICv3: LR write index %d out of range (nr_lrs %u)\n",
+                lr, gicv3_info.nr_lrs);
+        ASSERT_UNREACHABLE();
+        WARN();
+        return;
+    }
+
     switch ( lr )
     {
     case 0:
@@ -1041,9 +1059,39 @@ static void gicv3_cpu_disable(void)
 static void gicv3_hyp_init(void)
 {
     register_t vtr;
+    uint8_t hw_nr_lrs;
 
     vtr = READ_SYSREG(ICH_VTR_EL2);
-    gicv3_info.nr_lrs  = (vtr & ICH_VTR_NRLRGS) + 1;
+    hw_nr_lrs = (vtr & ICH_VTR_NRLRGS) + 1;
+
+    if ( CONFIG_GICV3_NR_LRS && CONFIG_GICV3_NR_LRS > hw_nr_lrs )
+        panic("GICv3: CONFIG_GICV3_NR_LRS (%u) exceeds hardware nr_lrs (%u)\n",
+              CONFIG_GICV3_NR_LRS, hw_nr_lrs);
+
+    gicv3_info.nr_lrs = CONFIG_GICV3_NR_LRS ?: hw_nr_lrs;
+
+    /* Zero all hardware LRs. */
+    switch ( hw_nr_lrs )
+    {
+    case 16: WRITE_SYSREG_LR(0, 15); fallthrough;
+    case 15: WRITE_SYSREG_LR(0, 14); fallthrough;
+    case 14: WRITE_SYSREG_LR(0, 13); fallthrough;
+    case 13: WRITE_SYSREG_LR(0, 12); fallthrough;
+    case 12: WRITE_SYSREG_LR(0, 11); fallthrough;
+    case 11: WRITE_SYSREG_LR(0, 10); fallthrough;
+    case 10: WRITE_SYSREG_LR(0, 9); fallthrough;
+    case 9:  WRITE_SYSREG_LR(0, 8); fallthrough;
+    case 8:  WRITE_SYSREG_LR(0, 7); fallthrough;
+    case 7:  WRITE_SYSREG_LR(0, 6); fallthrough;
+    case 6:  WRITE_SYSREG_LR(0, 5); fallthrough;
+    case 5:  WRITE_SYSREG_LR(0, 4); fallthrough;
+    case 4:  WRITE_SYSREG_LR(0, 3); fallthrough;
+    case 3:  WRITE_SYSREG_LR(0, 2); fallthrough;
+    case 2:  WRITE_SYSREG_LR(0, 1); fallthrough;
+    case 1:  WRITE_SYSREG_LR(0, 0); break;
+    default: BUG();
+    }
+
     gicv3.nr_priorities = ((vtr >> ICH_VTR_PRIBITS_SHIFT) &
                           ICH_VTR_PRIBITS_MASK) + 1;
 
-- 
2.25.1


