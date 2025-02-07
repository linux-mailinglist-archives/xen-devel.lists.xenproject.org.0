Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB0FA2B87A
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 02:54:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883273.1293360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgDZ7-0004Gr-CP; Fri, 07 Feb 2025 01:53:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883273.1293360; Fri, 07 Feb 2025 01:53:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgDZ7-00042y-3Z; Fri, 07 Feb 2025 01:53:57 +0000
Received: by outflank-mailman (input) for mailman id 883273;
 Fri, 07 Feb 2025 01:53:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yNCd=U6=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1tgDZ4-00037W-Sb
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 01:53:54 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20630.outbound.protection.outlook.com
 [2a01:111:f403:2414::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62174e09-e4f6-11ef-a073-877d107080fb;
 Fri, 07 Feb 2025 02:53:54 +0100 (CET)
Received: from BN9PR03CA0935.namprd03.prod.outlook.com (2603:10b6:408:108::10)
 by IA1PR12MB7565.namprd12.prod.outlook.com (2603:10b6:208:42f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Fri, 7 Feb
 2025 01:53:48 +0000
Received: from BL6PEPF00020E63.namprd04.prod.outlook.com
 (2603:10b6:408:108:cafe::f) by BN9PR03CA0935.outlook.office365.com
 (2603:10b6:408:108::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.25 via Frontend Transport; Fri,
 7 Feb 2025 01:53:48 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00020E63.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 01:53:48 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Feb
 2025 19:53:47 -0600
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Feb 2025 19:53:46 -0600
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
X-Inumbo-ID: 62174e09-e4f6-11ef-a073-877d107080fb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MTeOt02Wwcbra0RLf5PIPQZowSpRMUYm8xvpOu1/MQJinp9iwhV8u4FvuA1CbNXQ40KvrtU/EAt2+/U7P2CmG5qUjoHY1+6Osmrms034bg3seEZbs573or6BK0Hvf+/0VofrfWg+WWLoVL39aQmiZl6YlnspvJpBr639zvpBkP+mC2QXTRtnKWEJinPlftuWaguW+DvcLSzj+ZAw6BIF73B0bzxpOi2D3xSXPkGQzdTeuae7fOPZeyulsR4EJot2X84nOx1MZjpCYS7SxyLynh7WEf8OujtEnhQa3wa9+0iLk4D+M1CSQO8ei1dlyfr1/HlTk20xuBosZmXv5OD5/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGe/XBgMugcNKASwUB0TyRCApWu2fqFJMMjLoHkb8Fo=;
 b=EcPNON3gECH+q5qarUWeB3iPvozLLgBeEkLEOHoIOdUTuf73jNVDB+y8pPzEH0sdoSaMsW4ugQOTCi98CoGL3GV9+3ubEIMzESVs+S9+JYfUA9WKIN673K9Mv8Bxpt2ZI+/s+Wt+Bp7qiHdivsGzrl1bZ7/Alt/f3QGKmbWOpYlZRLmWfMcZR1jfYfotxDwl0Wli0HBeH8RNwsAiEf3efP0undPgFd8m6LV9SJhILXDvJoJA7TvBalXb0zJMhMgG5Ni24ShlA7UpY+0q4gbOLXl22ILxbOzAuGJtQ5tg8+I6hz0n4uDAEHHW/8UFf5K2/+wygaG/EzLaEDIrEMhYmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGe/XBgMugcNKASwUB0TyRCApWu2fqFJMMjLoHkb8Fo=;
 b=NaUtHYqRPqrgTxvlNtgmqdahtw1krqNRaO5oO/YS8+vK0lqYXz21qoVjjw8ZCKTCOb0acPXIy68jvP44e022IQqJY34vQYJ6z1GoZEkMko0BPzSuqyHcO8s508R4vnPQR2/Q17ZWsPlty6IbMpC8jyyFnlye/x5vDZ06NkcdENk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <bertrand.marquis@arm.com>, <julien@xen.org>,
	<michal.orzel@amd.com>, <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>
Subject: [PATCH v6 6/7] xen/arm: introduce legacy dom0less option for xenstore allocation
Date: Thu, 6 Feb 2025 17:53:40 -0800
Message-ID: <20250207015341.1208429-6-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2502061750480.619090@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2502061750480.619090@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E63:EE_|IA1PR12MB7565:EE_
X-MS-Office365-Filtering-Correlation-Id: 30fe636c-d758-415e-79a1-08dd471a4383
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JVhhSSzBHBN15pFLFXyT5xW/aPk2afhkxwz+yDTL+x/KVMdQp0nNemyY1oFR?=
 =?us-ascii?Q?H3PHogltgIqSwGr7uRUayIHYyM5s5OWgAalRtWPt9ckM6gN3aZZXgX5W0PST?=
 =?us-ascii?Q?CBVO6aLdbNrY6G8rRAOYdp1TLkvY1OOAGhCFea/IK0LyoodAMkv0P9ZfX7T6?=
 =?us-ascii?Q?2RSUHrW8U6iZAi2aQAb+jttnB8UUAuDnMW9i6OYRmMfyK4UJRNWoS5N3SeGK?=
 =?us-ascii?Q?hGD9WYDhZIcbXxfPNe94WyWFc1MwsEeCXCkTsls3NHmhzFNqciqw0ekfFIRv?=
 =?us-ascii?Q?BlmEld50oL436QxPPwlq/Oa9lkM6CGHmYTtKOjBSE/biadq6++bIlg2up/Q5?=
 =?us-ascii?Q?AKbnmZyFa3iKG+cNxoKUBvVUzjwqOg6pfsG9Sj0HEzsxXyeuf53RjyUxQINy?=
 =?us-ascii?Q?MO81IRl4f+nkC/QRjxL0bhT261EZbuYPHDUQZX23EYAmJm5cAQegv2w75Auk?=
 =?us-ascii?Q?w7NZM54IGC28JoYqUC3E2+UGOhHxn7XTuXPO8afME6ltQsjfFStLT/25tVHC?=
 =?us-ascii?Q?1M37qV9TOKvseBLuyb29v6wj1g/sn2L7iDteyI9Lorh+GpdgDUtbXRqqXYyF?=
 =?us-ascii?Q?AJ4SSEHLEDSXJaLa6FnFWRh6hSBNg9oyABvAIBX0N/mMx0Dc4QW8M2cJiORB?=
 =?us-ascii?Q?dR3yYhZ1kAPXgbTNM8E7C4NLnkLVpyFa314k4PChAXgxUnX98UzqT/X/zEHc?=
 =?us-ascii?Q?e+UELIHxdKD+iLWoTo/p3wKbDmiHGz7+DNq9QnXJEeVo2ym4UqZuYY90Iax5?=
 =?us-ascii?Q?0mOFH4geRP3VDvItTrkdzQISJ33EXhtbpMhTIJHa3vPGbUPkRBGa35Cbure9?=
 =?us-ascii?Q?8M2r6TtbymbyyfrLmdFMX7y0Af8ckva33KOtpTt8/EejYUf9jEMuzEjdfG6g?=
 =?us-ascii?Q?9kbZX2J6KmfO0EQoFwHFE9ePVX5xow4FeVxsrnGX8Sa7077WN1aHa2tv/3F5?=
 =?us-ascii?Q?7Mah8BC6UWYDTs37ORGNa1qKHT2BpYESLfiITP8kIH+pgn4UREgXFzkexmCA?=
 =?us-ascii?Q?dSnBmoeniODGjzJPeiaI54VFm9Vsfm5dxCj0XWEduB4volThWAqU0IccXHfa?=
 =?us-ascii?Q?7qyasutA7XQ3W+RFYIH1bmI7pgOmD3glrxXrzFO1J0js4cDlo1jqAKM61d8u?=
 =?us-ascii?Q?3aicCqrfqiz4tSjOuA6pe7IL66u6biPtJegA+Xv7sFP3ziP287vi/vblPmX4?=
 =?us-ascii?Q?JCBsWCYI7aYyZ/lljC+St7oRZL1ZCByPISUVr7TDEAY6cjpEorDWW8a0bR4M?=
 =?us-ascii?Q?trQDVAUWUFA+TUITCkuUyJ7TY6l2Zlw+S3Y6zO+AMQrJDCDn0Dqob14l6b9T?=
 =?us-ascii?Q?CWqTXGGoM5hvdSTB3um4tlrdORcws9YPHeaFTxTXLLNvG0TroBEAh50lM+sl?=
 =?us-ascii?Q?bX8u6/frcPGyVsSnnlwv7HFsaN+YRcDpTaZgGTOJEQ66pfV/HJCEs6409jvb?=
 =?us-ascii?Q?fDmcHDTAKL4UR18XdCpeCDWV+9f0CZaahl8VKy1JlP1YeZi7IC+IU3Lrmt/r?=
 =?us-ascii?Q?JBl1y5LYQLX2PZo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 01:53:48.3108
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30fe636c-d758-415e-79a1-08dd471a4383
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7565

The new xenstore page allocation scheme might break older unpatches
Linux kernels that do not check for the Xenstore connection status
before proceeding with Xenstore initialization.

Introduce a dom0less configuration option to retain the older behavior.

The older behavior triggered by this option is to allocate the xenstore
page in init-dom0less. That does not work with static-mem guests.
However, it will make it possible to run as regular guests older Linux
kernel versions that are left unpatched.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v6:
- improve wording in commit message and doc
- code style
- add separate alloc_xenstore_params function

 docs/misc/arm/device-tree/booting.txt |  5 +++
 xen/arch/arm/dom0less-build.c         | 45 +++++++++++++++++++--------
 xen/arch/arm/include/asm/kernel.h     | 30 +++++++++++-------
 3 files changed, 56 insertions(+), 24 deletions(-)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 9c881baccc..4d6d859c66 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -222,6 +222,11 @@ with the following properties:
     Xen PV interfaces, including grant-table and xenstore, will be
     enabled for the VM.
 
+    - "legacy"
+    Same as above, but the way the xenstore page is allocated is not
+    compatible with static-mem guests. On the other hand, it works with
+    older Linux kernels.
+
     - "disabled"
     Xen PV interfaces are disabled.
 
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 6c51f91999..56eb5c6da6 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -755,6 +755,30 @@ static int __init alloc_xenstore_page(struct domain *d)
     return 0;
 }
 
+static int __init alloc_xenstore_params(struct domain *d,
+                                        struct kernel_info *kinfo)
+{
+    int rc = 0;
+
+    if ( kinfo->dom0less_feature & (DOM0LESS_XENSTORE | DOM0LESS_XS_LEGACY) )
+    {
+        ASSERT(hardware_domain);
+        rc = alloc_xenstore_evtchn(d);
+        if ( rc < 0 )
+            return rc;
+        d->arch.hvm.params[HVM_PARAM_STORE_PFN] = ~0ULL;
+    }
+
+    if ( kinfo->dom0less_feature & DOM0LESS_XENSTORE )
+    {
+        rc = alloc_xenstore_page(d);
+        if ( rc < 0 )
+            return rc;
+    }
+
+    return rc;
+}
+
 static int __init construct_domU(struct domain *d,
                                  const struct dt_device_node *node)
 {
@@ -800,6 +824,13 @@ static int __init construct_domU(struct domain *d,
         else
             panic("At the moment, Xenstore support requires dom0 to be present\n");
     }
+    else if ( rc == 0 && !strcmp(dom0less_enhanced, "legacy") )
+    {
+        if ( hardware_domain )
+            kinfo.dom0less_feature = DOM0LESS_ENHANCED_LEGACY;
+        else
+            panic("At the moment, Xenstore support requires dom0 to be present\n");
+    }
     else if ( rc == 0 && !strcmp(dom0less_enhanced, "no-xenstore") )
         kinfo.dom0less_feature = DOM0LESS_ENHANCED_NO_XS;
 
@@ -849,19 +880,7 @@ static int __init construct_domU(struct domain *d,
     if ( rc < 0 )
         return rc;
 
-    if ( kinfo.dom0less_feature & DOM0LESS_XENSTORE )
-    {
-        ASSERT(hardware_domain);
-        rc = alloc_xenstore_evtchn(d);
-        if ( rc < 0 )
-            return rc;
-
-        rc = alloc_xenstore_page(d);
-        if ( rc < 0 )
-            return rc;
-    }
-
-    return rc;
+    return alloc_xenstore_params(d, &kinfo);
 }
 
 void __init create_domUs(void)
diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
index de3f945ae5..bdc96f4c18 100644
--- a/xen/arch/arm/include/asm/kernel.h
+++ b/xen/arch/arm/include/asm/kernel.h
@@ -13,20 +13,28 @@
 /*
  * List of possible features for dom0less domUs
  *
- * DOM0LESS_ENHANCED_NO_XS: Notify the OS it is running on top of Xen. All the
- *                          default features (excluding Xenstore) will be
- *                          available. Note that an OS *must* not rely on the
- *                          availability of Xen features if this is not set.
- * DOM0LESS_XENSTORE:       Xenstore will be enabled for the VM. This feature
- *                          can't be enabled without the
- *                          DOM0LESS_ENHANCED_NO_XS.
- * DOM0LESS_ENHANCED:       Notify the OS it is running on top of Xen. All the
- *                          default features (including Xenstore) will be
- *                          available. Note that an OS *must* not rely on the
- *                          availability of Xen features if this is not set.
+ * DOM0LESS_ENHANCED_NO_XS:  Notify the OS it is running on top of Xen. All the
+ *                           default features (excluding Xenstore) will be
+ *                           available. Note that an OS *must* not rely on the
+ *                           availability of Xen features if this is not set.
+ * DOM0LESS_XENSTORE:        Xenstore will be enabled for the VM. The
+ *                           xenstore page allocation is done by Xen at
+ *                           domain creation. This feature can't be
+ *                           enabled without the DOM0LESS_ENHANCED_NO_XS.
+ * DOM0LESS_XS_LEGACY        Xenstore will be enabled for the VM, the
+ *                           xenstore page allocation will happen in
+ *                           init-dom0less. This feature can't be enabled
+ *                           without the DOM0LESS_ENHANCED_NO_XS.
+ * DOM0LESS_ENHANCED:        Notify the OS it is running on top of Xen. All the
+ *                           default features (including Xenstore) will be
+ *                           available. Note that an OS *must* not rely on the
+ *                           availability of Xen features if this is not set.
+ * DOM0LESS_ENHANCED_LEGACY: Same as before, but using DOM0LESS_XS_LEGACY.
  */
 #define DOM0LESS_ENHANCED_NO_XS  BIT(0, U)
 #define DOM0LESS_XENSTORE        BIT(1, U)
+#define DOM0LESS_XS_LEGACY       BIT(2, U)
+#define DOM0LESS_ENHANCED_LEGACY (DOM0LESS_ENHANCED_NO_XS | DOM0LESS_XS_LEGACY)
 #define DOM0LESS_ENHANCED        (DOM0LESS_ENHANCED_NO_XS | DOM0LESS_XENSTORE)
 
 struct kernel_info {
-- 
2.25.1


