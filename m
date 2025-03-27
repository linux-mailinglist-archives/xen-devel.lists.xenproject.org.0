Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4072CA7417C
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 00:23:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930015.1332748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txwYY-0005YT-8G; Thu, 27 Mar 2025 23:22:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930015.1332748; Thu, 27 Mar 2025 23:22:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txwYY-0005WO-4I; Thu, 27 Mar 2025 23:22:38 +0000
Received: by outflank-mailman (input) for mailman id 930015;
 Thu, 27 Mar 2025 23:22:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZXwx=WO=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1txwYW-0005WG-Ae
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 23:22:36 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20614.outbound.protection.outlook.com
 [2a01:111:f403:2417::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c50fe8a-0b62-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 00:22:33 +0100 (CET)
Received: from PH7P220CA0073.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32c::20)
 by DM4PR12MB5819.namprd12.prod.outlook.com (2603:10b6:8:63::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 23:22:28 +0000
Received: from CY4PEPF0000FCC5.namprd03.prod.outlook.com
 (2603:10b6:510:32c:cafe::94) by PH7P220CA0073.outlook.office365.com
 (2603:10b6:510:32c::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Thu,
 27 Mar 2025 23:22:28 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000FCC5.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Thu, 27 Mar 2025 23:22:27 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Mar
 2025 18:22:26 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 27 Mar 2025 18:22:26 -0500
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
X-Inumbo-ID: 5c50fe8a-0b62-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=auVgPOF7gueB8Ll9Q1Wbc7VKZBsGPxuBi64GXQrB7quiYyqam7QpgWPgRQd+Gw3r8QXdwPSni32rYnbTbIedBthIz313yuNodOs6GnH1jKzxAOysLN5b5XRU3DbNx/ff8i1miphPW1VvNLJonIf1bi4svBbXPAhaIUSTWfpGWhS9ihNTMLI/6ORJmKVnqx1FTNRuoQizM4IpNXfGoKyYEjMtLFgHdaAqL5zcJbUa6u31AwK0pqNjcI7TuhQaAnPNwiNevrxRZeUJDIwWgdxjFDUSuXSN+r4g6ArePBoDHLW3i8HkFm3LFSQ+l2lPzPfJP+R6nwYK4O70nCZ/iHr5ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8dgxLLLfoXL5Yr5Rx6rdlyc7YVFLFzXW7oBOjB4xBxo=;
 b=TsxxA1+0IHmjgPU/Z8OtFDgyoE7vL+wzKaCv3ZKjKPz3qU/3FROK0JPj0+bc5wDh1lJdpzqBEOHyLnfWqIP6eaNSzXVHGSFsZ4EjJYa3SOdtZXsKJeI/6KRYgrLsomN/C7N4Xe7jn40Xc9xHQFGY5e3Fq6W3G3uoajkXFHVTMevjZM5iNyWbnO3hVIJzRjgMKSKgEGwkBmtuX59Z1ljTmN7aCvVuvBtR+GweAyC2jubuLNzV1IWhND0n/yqvbuVsEupXCD4uhNbMt+BxtNupueYQJkJsqPRkqPbBng5h76SBadw46sADrL1uuzMTZ9FKeaYOfp/eb9ZXNFa0oPU0rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8dgxLLLfoXL5Yr5Rx6rdlyc7YVFLFzXW7oBOjB4xBxo=;
 b=Hc1eypUyxeY1Xry8re4nbkSrFozut/y23tWc3MXJInjbGgbKSPLONctLqFKfezz1uiFUVM1ud8RhCckJOE7iNsiLvg5yVb9JrK3btt5QvG3G6Xo9bxenxLW1NMvtlHONwJgPlHqe7Lc9rHpoe3c34UEvyayiF932hyhqf36uHfA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <andrew.cooper3@citrix.com>,
	<jbeulich@suse.com>, <roger.pau@citrix.com>, <julien@xen.org>,
	<michal.orzel@amd.com>, <bertrand.marquis@arm.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>
Subject: [PATCH v2] xen: add kconfig for event_fifo
Date: Thu, 27 Mar 2025 16:22:25 -0700
Message-ID: <20250327232225.1114007-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC5:EE_|DM4PR12MB5819:EE_
X-MS-Office365-Filtering-Correlation-Id: ea88bb1c-f8e6-480f-373e-08dd6d863d44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jvsCGbSunoK6E1TVyrHcGjy/GEWnDtipd0ZDnQHVSGakxK2TB8nHUftD7Hik?=
 =?us-ascii?Q?dsg8nn9VgNeMwvnR/DaSse/bGX+ZfaAY/Bamed+7zqG8GUfX4uTpaUFvZHWz?=
 =?us-ascii?Q?elSYkWDto00x7Rhh14fVesaWPmzkVFxyBL9tRLT+l4O2jYPPPuOxUtF8BdB+?=
 =?us-ascii?Q?ReKIBDrvxPW3i3DjCfOtJky61rTr5dkeNhcUfsnyoyHF6ef9spkvSuVZ9Eo9?=
 =?us-ascii?Q?5inLJQNkh0Vaix7xeb7Y/LctwX9Er8rYzTYuHtdvTBEz2ksBIO386PeOO4Gs?=
 =?us-ascii?Q?+stHHwKLpWOrguZ/5yK3aL/M8PsTjKQxWeXmtF75+/jKRS22WmTQFfKYxu/V?=
 =?us-ascii?Q?T3g+MHVuTq0K3JlyGE98WZ9vCirE8/t3PpzM4gVCqULKhToXv87WKkLwleuN?=
 =?us-ascii?Q?d1JCa80M+xYzuyHZVEuTNfMg9tO9w1EzjJ2ObHp5XrtjwTu+2V+kRP7bVQ6G?=
 =?us-ascii?Q?gkYHpNLBpFzMIY4CKJLoXSip5BkUvjHBt0UQyYDZuE9deBfzwZgSuGjyx3rV?=
 =?us-ascii?Q?UoKRbC81aUlbEDwbNayjwN+FaW6Msikm4hLyhne4Pg5vHibpAZppZm8nbIh2?=
 =?us-ascii?Q?S7QNA3T46hbsWFhxnWLmO78hEseiYjvxy9lJA4RmuP+Vpot3KN/o5utGm+IU?=
 =?us-ascii?Q?adg6EBCMPsM8KOojaaJLtKoneN8g3MFCzsGtm02dJbcfcyWElDCoRe6o/Je0?=
 =?us-ascii?Q?WusP1pzpKlrrGbZ4/uZuXK+dnHm+JmE5MT67HzTGnpzYFG1pYa+4hUjegiFU?=
 =?us-ascii?Q?VEZ1NSzwKfVrukMdPQJo4HmHXq7CQ5+YdiPFsDVnLf/QOAXz2XUYCDAHBdDy?=
 =?us-ascii?Q?OOAMa/y5ooXRhw6fJhezkKlBUkQjT9eP1i9tcIF2GSERM3NZSSPoAxuLOG48?=
 =?us-ascii?Q?MbHpcCHWfHWPlJKpz4VGlBoUvsZKKzaU/S9HBeUVDILyIpRLLPLDP5OzEMU0?=
 =?us-ascii?Q?LTrbCiIDV3K8kiG+i+Uq8iVz78ps8Q6kz6nUCHsvjd1Lhw5IunDsiZq6HVG8?=
 =?us-ascii?Q?FWAyJzXH56YmgzQvpFSYs88E0lpqZctDm49Sq9uEwLxhUqHGzGB5z2n9jCQU?=
 =?us-ascii?Q?8qaVW/43fX4hcsYPABc1kdcxfJvPlW6ld+IvGMbNscZqFdP2Se0pio/xbI92?=
 =?us-ascii?Q?eCUsAd34vmS4R0r60KtPlYSP/dFC6+Mn3POFIlmZIHUecyN9MSIyv9vo/QwS?=
 =?us-ascii?Q?+JqVNI1yrvv0f8YTSlUL+VJLtB0vHIfw4xMF+9Vj8dE4GkorFdmbFU9Gx2kw?=
 =?us-ascii?Q?TLKP1ZSDBnfuhA0PBaZHf5G/tLjOal+DjeYS+JGzWYQmDT+/mGTskEBMnhEz?=
 =?us-ascii?Q?qyYCqpHgj43y8hvGhbCZ4SQYfqQ7nDeOqf877GNUOg9p3tmGVfLM05HK8rJp?=
 =?us-ascii?Q?kxzT+Oos8Hqoxo5LwpHBotWy563u9DI4kc0WLXWzsTUp/UQ9SIdpBeYbyNUk?=
 =?us-ascii?Q?BwH75D4Xiu7hIyb5vnSk1r+1NWckCx4ZuWb8m0gc8UvQUOrOIZZAtsbCFeIU?=
 =?us-ascii?Q?/amHn8c508rKkM8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 23:22:27.5841
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea88bb1c-f8e6-480f-373e-08dd6d863d44
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5819

Evtchn fifos are not needed on smaller systems; the older interface is
lightweight and sufficient. Also, event_fifo causes runtime anonymous
memory allocations, which are undesirable.  Additionally, it exposes an
extra interface to the guest, which is also undesirable unless
necessary.

Make it possible to disable evtchn fifo.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v2:
- improve description and commit message
---
 xen/common/Kconfig         | 14 ++++++++++++++
 xen/common/Makefile        |  2 +-
 xen/common/event_channel.h | 15 +++++++++++++++
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index a6aa2c5c14..0e51076c05 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -23,6 +23,20 @@ config GRANT_TABLE
 
 	  If unsure, say Y.
 
+config EVTCHN_FIFO
+	bool "Event Channel Fifo support" if EXPERT
+	default y
+	help
+	  The Event channel Fifo extends support for event channels
+	  beyond 1024 event channels for 32-bit guests and 4096 for
+	  64-bit guests.
+
+	  Cons: They cause runtime anonymous memory allocations and expose
+	  an additional interface to the guest. For smaller systems, you
+	  might consider disabling this feature.
+
+	  If unsure, say Y.
+
 config PDX_COMPRESSION
 	bool "PDX (Page inDeX) compression" if EXPERT && !X86 && !RISCV
 	default ARM || PPC
diff --git a/xen/common/Makefile b/xen/common/Makefile
index ac23120d7d..9da8a7244d 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -13,7 +13,7 @@ obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-y += domain.o
 obj-y += event_2l.o
 obj-y += event_channel.o
-obj-y += event_fifo.o
+obj-$(CONFIG_EVTCHN_FIFO) += event_fifo.o
 obj-$(CONFIG_GRANT_TABLE) += grant_table.o
 obj-y += guestcopy.o
 obj-y += gzip/
diff --git a/xen/common/event_channel.h b/xen/common/event_channel.h
index 45219ca67c..a778ae775b 100644
--- a/xen/common/event_channel.h
+++ b/xen/common/event_channel.h
@@ -45,12 +45,27 @@ void evtchn_2l_init(struct domain *d);
 
 /* FIFO */
 
+#ifdef CONFIG_EVTCHN_FIFO
 struct evtchn_init_control;
 struct evtchn_expand_array;
 
 int evtchn_fifo_init_control(struct evtchn_init_control *init_control);
 int evtchn_fifo_expand_array(const struct evtchn_expand_array *expand_array);
 void evtchn_fifo_destroy(struct domain *d);
+#else
+static inline int evtchn_fifo_init_control(struct evtchn_init_control *init_control)
+{
+    return -EOPNOTSUPP;
+}
+static inline int evtchn_fifo_expand_array(const struct evtchn_expand_array *expand_array)
+{
+    return -EOPNOTSUPP;
+}
+static inline void evtchn_fifo_destroy(struct domain *d)
+{
+    return;
+}
+#endif /* CONFIG_EVTCHN_FIFO */
 
 /*
  * Local variables:
-- 
2.25.1


