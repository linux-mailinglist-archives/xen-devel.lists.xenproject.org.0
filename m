Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD51A29E3A
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 02:09:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882397.1292590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfqO6-0000fD-64; Thu, 06 Feb 2025 01:09:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882397.1292590; Thu, 06 Feb 2025 01:09:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfqO5-0000WO-T1; Thu, 06 Feb 2025 01:09:01 +0000
Received: by outflank-mailman (input) for mailman id 882397;
 Thu, 06 Feb 2025 01:09:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3EC/=U5=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1tfqO4-0007da-3v
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 01:09:00 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20607.outbound.protection.outlook.com
 [2a01:111:f403:200a::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f040869d-e426-11ef-99a4-01e77a169b0f;
 Thu, 06 Feb 2025 02:08:57 +0100 (CET)
Received: from CH2PR11CA0005.namprd11.prod.outlook.com (2603:10b6:610:54::15)
 by SJ1PR12MB6339.namprd12.prod.outlook.com (2603:10b6:a03:454::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Thu, 6 Feb
 2025 01:08:52 +0000
Received: from CH1PEPF0000AD7A.namprd04.prod.outlook.com
 (2603:10b6:610:54:cafe::29) by CH2PR11CA0005.outlook.office365.com
 (2603:10b6:610:54::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.24 via Frontend Transport; Thu,
 6 Feb 2025 01:08:52 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD7A.mail.protection.outlook.com (10.167.244.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 6 Feb 2025 01:08:52 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Feb
 2025 19:08:51 -0600
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 5 Feb 2025 19:08:51 -0600
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
X-Inumbo-ID: f040869d-e426-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PD624XyZUe+0nx27efOKe5KE1uUdKd4hUTe+jWP15dOaDDk7xAyIW2VYjQr6BQRQ27I55QkQe2fTmgYXGFsD/w1K/TRHNJK7bndrxEWB87rCamY5vU+8TNodYt1iB73ULaG2mPeKAaUIKWRtk+yQK+BfsWndIayAmPFVxqhrQKrPqub6WaaqGbM84zdaxNTUuJ4bVT7xB8eW0ido740/oS/dga++J+SkV9eGUssYLOXxH9/CwxnW/ghm28HDq+qfZqqV+Kiw3pv5CjLqKBCumnM3Ug/pexHZZxIv9aeCNMgtNwmOl9MBqSPPF1hTkHuqhQw6P4gfnHCXqAO+/cdCZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6yE3UkDG2JBxdiFE2UeD3PKz4jv0din3OBPUIrMyGvY=;
 b=lr5duhwALWOUCXDof7xmlC6wkCav/i4Pp1VICXAAFJFzLIwqgoEFcjfpkmF5/skdiO9LjWvrV6Lohmq0ktlIj7myhceDriuiy6hCy3E+cxn7kG2F8PB9M+PAZB6HcmN3xys1umSL4kUCqgn4ineku8S2n8XHM+sgncHvYoeLYcBo5GRtCqspZt47Pj2FqzjuaxVenA7ZWH3cvN1qDa8cRDB3yM10G1ZN4GHUWuTLpu1frHDaR9Cb12DRRJULR3x1cDY9GE/2ktDXpF3Vxwj/3MNi4J5Y9TJycupeUTguorRetHHvdSRr+YN9Tl4sbVSqOIV3agtMA8SxFrBSaofLrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6yE3UkDG2JBxdiFE2UeD3PKz4jv0din3OBPUIrMyGvY=;
 b=43axQEV5GHwVqcd5z8MenVK952yY+MteaeQeEUmAAOFcfbOP0l9c1rpwBJt1A/3w1Gm7fCaoBwONt+GvM+2JnAUJnpXDMFSoyFm4Nx2NNpTL/uGgxZV/LpCYliutzdu/TkZ0zX+co6yZrNLPrYEXLRB1FfZ8hA0OVHIrGfhGDew=
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
Subject: [PATCH v5 8/9] xen/arm: introduce legacy dom0less option for xenstore allocation
Date: Wed, 5 Feb 2025 17:08:42 -0800
Message-ID: <20250206010843.618280-8-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2502041807070.9756@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2502041807070.9756@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7A:EE_|SJ1PR12MB6339:EE_
X-MS-Office365-Filtering-Correlation-Id: cf99e408-3981-46d8-19c7-08dd464ad26e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?woA6GVZzx7s7pQuVmsFSiclIgHsul2dDeL8znWdIVuQgELMxV3p8Ss4Lh7dv?=
 =?us-ascii?Q?dMU17bLKdNAnwsJgafgCc9o4WI3xPC649CpCBBpeiC3kNoyXBKZx/cWW5hDT?=
 =?us-ascii?Q?oeoorKcmmq0F9IxTnaU7QnfA4DvRxwK1WJUzp6xvkuBIQxuCnWlDdHUMmSC8?=
 =?us-ascii?Q?kuou3y1EgKLg52hJ0sWVDJoCdOD/FmPekPdyKj2NrRNaRX+mdidlHx/tyjxj?=
 =?us-ascii?Q?65QUqMh/UXRUtn6YyTXv2VaktkfR3GiUl+nmiW+uLFDwYm6JR/5GgQPzOeYI?=
 =?us-ascii?Q?NcAm9GxnPaa6EDPiBoaG4EYpSf3tgcmEB3WeknnaddgRYPVQlrMRmaHzhbqZ?=
 =?us-ascii?Q?+dowUrw+pD/KWQ3Bm7ZNV2roIXik4UuJMisZdDOw7mOeKneSuCSpXx6TE6O5?=
 =?us-ascii?Q?FjzPUv980bS3gMOGH6yderZyS7rLA3LVzWPuA0hxQzzHsEhv/R0QzGlJscXl?=
 =?us-ascii?Q?5OG3/oPBhvcOqfuNJ01zGdIWKCsQh4n3Dj+K2D5LdovbjfHXWzwnIJG47zAU?=
 =?us-ascii?Q?+kVkwT2LuiTpsg0uaz7ATy+aI+2wD8TaiuaHt+y95a1sf70ooe8LeGw2vLLL?=
 =?us-ascii?Q?mznVmqzSIx+3rQVYEIJJUDTrEET6CbdM+/c2k5FvE0Ii7jPYo+DYmEbQ3X4O?=
 =?us-ascii?Q?oQIegiHJXZqfLUYMNGYJAum6wn6QyX5o4gXZSARgT9/OlggNj1yr1uDU2McJ?=
 =?us-ascii?Q?D7G12ENpc5VvQ9i6sI7Oc0+kAeH+lm7T7nuC6TpkcxkuddIjIdjx7lIGtEpZ?=
 =?us-ascii?Q?TSBnIFehQu0sKxEBlNs6PElM4J1HNvEn5lU80y+0I+CRMtQOWzAhjlHSIQMy?=
 =?us-ascii?Q?yoWGRjnoGfBELlPtHtk5us6oSRMF0DyOenvnM1naH/n0ZzOgJRDuWcK7NnQw?=
 =?us-ascii?Q?Hw2+J0A8eDVroCd+TO91LbVP7cZN2HqVlVXAbmR2DxWOxuqJ+BsBtCxyRQuo?=
 =?us-ascii?Q?VK0ZGIZmtUcp4mZqGllsPDHY3n65uhzTL6v7nvfhOXs1O+vlhAwgsjK0BMqe?=
 =?us-ascii?Q?K7hkbJxtwaR2CMqsNOVLvGHjRoqOsF5rgF1gv0KUZhc+OjullZ1xiUoJdKuv?=
 =?us-ascii?Q?vJTYp8O0QHdQPruIFGLH2LIpy854lEYyTuGH1QXrFokHcNLYzEjVsxm5PJ5l?=
 =?us-ascii?Q?a5t6VBSPam1Uyfq4LRtxrUILDJBeU2zNYYAJhVc915oCkHllgd7KDpvHbVUK?=
 =?us-ascii?Q?jh2l5QWgBk6ox5ymgRUYWauQOshRutHt0EHDgntWrg4sMnlZJHct/kgrPNjf?=
 =?us-ascii?Q?Rq97r8SCayVXXfHzDENcVRQoxlVppHYu3cXKEjG02yGe2dmvzhE78TTSTiYv?=
 =?us-ascii?Q?cjaa3xbOYNmaYNqbyAVuF6H6zsff3Sb7uX5TOhwdl+OY7KiHm7F4MCcLdOAY?=
 =?us-ascii?Q?mkrjP76YmPhTN7nR0/+H6iSXU8vubgfecH0q+5DWOAAXSJnVtBWUpLDt6kxF?=
 =?us-ascii?Q?O7w7X7KzvvIn432oVPxQ2gr+JToQY+v2c25IG/C6ACPXX60E9DFHp6IPXi1E?=
 =?us-ascii?Q?x0WWJ12H5kmrCio=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 01:08:52.7652
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf99e408-3981-46d8-19c7-08dd464ad26e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6339

The new xenstore page allocation scheme might break older unpatches
Linux kernels that do not check for the Xenstore connection status
before proceeding with Xenstore initialization.

Introduce a dom0less configuration option to retain the older behavior,
which is not compatible with 1:1 mapped guests, but it will work with
older legacy kernel versions.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 docs/misc/arm/device-tree/booting.txt |  5 +++++
 xen/arch/arm/dom0less-build.c         | 13 ++++++++++++-
 xen/arch/arm/include/asm/kernel.h     | 14 +++++++++++---
 3 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index ff70d44462..8fa3da95be 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -222,6 +222,11 @@ with the following properties:
     Xen PV interfaces, including grant-table and xenstore, will be
     enabled for the VM.
 
+    - "legacy"
+    Same as above, but the way the xenstore page is allocated is not
+    compatible with 1:1 mapped guests. On the other hand, it works with
+    older Linux kernels.
+
     - "disabled"
     Xen PV interfaces are disabled.
 
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 046439eb87..9afdbca8b8 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -799,6 +799,13 @@ static int __init construct_domU(struct domain *d,
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
 
@@ -848,13 +855,17 @@ static int __init construct_domU(struct domain *d,
     if ( rc < 0 )
         return rc;
 
-    if ( kinfo.dom0less_feature & DOM0LESS_XENSTORE )
+    if ( kinfo.dom0less_feature & (DOM0LESS_XENSTORE|DOM0LESS_XS_LEGACY) )
     {
         ASSERT(hardware_domain);
         rc = alloc_xenstore_evtchn(d);
         if ( rc < 0 )
             return rc;
+        d->arch.hvm.params[HVM_PARAM_STORE_PFN] = ~0ULL;
+    }
 
+    if ( kinfo.dom0less_feature & DOM0LESS_XENSTORE )
+    {
         rc = alloc_xenstore_page(d);
         if ( rc < 0 )
             return rc;
diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
index de3f945ae5..4c2ae0b32b 100644
--- a/xen/arch/arm/include/asm/kernel.h
+++ b/xen/arch/arm/include/asm/kernel.h
@@ -17,16 +17,24 @@
  *                          default features (excluding Xenstore) will be
  *                          available. Note that an OS *must* not rely on the
  *                          availability of Xen features if this is not set.
- * DOM0LESS_XENSTORE:       Xenstore will be enabled for the VM. This feature
- *                          can't be enabled without the
- *                          DOM0LESS_ENHANCED_NO_XS.
+ * DOM0LESS_XENSTORE:       Xenstore will be enabled for the VM. The
+ *                          xenstore page allocation is done by Xen at
+ *                          domain creation. This feature can't be
+ *                          enabled without the DOM0LESS_ENHANCED_NO_XS.
+ * DOM0LESS_XS_LEGACY       Xenstore will be enabled for the VM, the
+ *                          xenstore page allocation will happen in
+ *                          init-dom0less. This feature can't be enabled
+ *                          without the DOM0LESS_ENHANCED_NO_XS.
  * DOM0LESS_ENHANCED:       Notify the OS it is running on top of Xen. All the
  *                          default features (including Xenstore) will be
  *                          available. Note that an OS *must* not rely on the
  *                          availability of Xen features if this is not set.
+ * DOM0LESS_ENHANCED_LEGACY:Same as before, but using DOM0LESS_XS_LEGACY.
  */
 #define DOM0LESS_ENHANCED_NO_XS  BIT(0, U)
 #define DOM0LESS_XENSTORE        BIT(1, U)
+#define DOM0LESS_XS_LEGACY       BIT(2, U)
+#define DOM0LESS_ENHANCED_LEGACY (DOM0LESS_ENHANCED_NO_XS | DOM0LESS_XS_LEGACY)
 #define DOM0LESS_ENHANCED        (DOM0LESS_ENHANCED_NO_XS | DOM0LESS_XENSTORE)
 
 struct kernel_info {
-- 
2.25.1


