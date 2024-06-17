Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9828690A8EC
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 11:01:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.741976.1148711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ8Et-0003WH-GM; Mon, 17 Jun 2024 09:01:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 741976.1148711; Mon, 17 Jun 2024 09:01:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ8Et-0003U4-BM; Mon, 17 Jun 2024 09:01:23 +0000
Received: by outflank-mailman (input) for mailman id 741976;
 Mon, 17 Jun 2024 09:01:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d9pI=NT=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sJ8Er-0001sw-Vs
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 09:01:22 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2415::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 293cb3ce-2c88-11ef-b4bb-af5377834399;
 Mon, 17 Jun 2024 11:01:20 +0200 (CEST)
Received: from MN2PR16CA0043.namprd16.prod.outlook.com (2603:10b6:208:234::12)
 by CYXPR12MB9340.namprd12.prod.outlook.com (2603:10b6:930:e4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 09:01:16 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:208:234:cafe::fd) by MN2PR16CA0043.outlook.office365.com
 (2603:10b6:208:234::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31 via Frontend
 Transport; Mon, 17 Jun 2024 09:01:15 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Mon, 17 Jun 2024 09:01:14 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Jun
 2024 04:01:10 -0500
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
X-Inumbo-ID: 293cb3ce-2c88-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mQloWxxgp/tnPmIzJQgSRxIf/PiBrfeiQv7vZiorfp3eLRhRCXxRRj/RJHjCWeAQL0m5mn+fs+NnvB1EJcLj/g0VI3NLxrASKSG4+1oTJGKPsQA/8cbdrbBY0cFfYO6dMDodgKog3PGhftUk6xRYQWTMo8Rczvsr/fZiyGupjvGeeKzJMmC3BA2Pp9kxcY30WFQ7Q8wjIcn16U06somuqMg0+zyz7TQl6kRsMUeFL8isXdTZEXPwnVG10XKQlsCR7NZIFneYboDZM0fT0xxMrlpA1ogFM8ti4LB8NlgKDAKRS/CZczZ9z7weeDj2Qs19lHNOjUtMEm2f3sLqv16JPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=463TpoM27wlYpBH7sX7lVFoBS3xu4UJFDQcBcWDkB5g=;
 b=bfZDa6nNlEnxBBgkIa84aWWjbjSqeIlJBX2MsU/7WHjkw/jmH+ag/isyDjaiqJJWQb3QaKypX2vKRR6YoYul5st26i67m2EeBdXY9zK2Cm6i4xLvhshO+zq+0nQMBtt4/sMwbkWS6OK1aDQFJLHVkZv32F6vh2XzZfJbre/CXue0xhQnOvbM2gKviLflmwLPowPYdNEMzS4d5N5eImdrfzgNq38i+3MvQYFe+SEzctk+I68kPHfSJIyrA78WYe5S0hhHo4a+y0F8kO+U4WCE/vBLkgdsLGPj7typ/M/ipw2ed6XDFFK44gmsLY6s9IL4Wg61pbKpiReiMo14STgScA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=463TpoM27wlYpBH7sX7lVFoBS3xu4UJFDQcBcWDkB5g=;
 b=dqWizIQyepimPvFh/Y+dWCOe/+/8hMSLwDwL7ZjdNW2+upnpkPBQRThYa+uiked+qRJscAIEtubuR6vYhacW18k5STzKQurOC8+jvNeCDj1zUdyB9YdcLW8mwWiN1HPYc1qKGjg8x/Z5HjdsgYgnddxxpX3Dq2k4OoJe+L0Xt7Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, "Juergen
 Gross" <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>, Huang Rui
	<Ray.Huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>, Huang Rui
	<ray.huang@amd.com>
Subject: [XEN PATCH v10 5/5] domctl: Add XEN_DOMCTL_gsi_permission to grant gsi
Date: Mon, 17 Jun 2024 17:00:35 +0800
Message-ID: <20240617090035.839640-6-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240617090035.839640-1-Jiqian.Chen@amd.com>
References: <20240617090035.839640-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|CYXPR12MB9340:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e0900f9-64c4-477d-3f97-08dc8eac0ae3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|7416011|36860700010|376011|1800799021|82310400023;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zmPodllpddXMtcnY1eQBUvNL4HLh8u/sf8xOvetHb510YsQBSscZqopC7LvZ?=
 =?us-ascii?Q?Y8dT0On8ZOmnX3Az28z9YmYfAgY4v0cUQC3ekoS+oKVQjAuWwY6GVwBzqoGD?=
 =?us-ascii?Q?/uH51qigA2GuWWe17ZrBvYbXjVH/XTQfQnMWwk0WHAwHFItm6vDzfER1K6qx?=
 =?us-ascii?Q?Q8b434JuD5WGuChOi1CFGJfKqF2fIOQiuVvDw1TvWQaQPjppAPwjlY8q56lE?=
 =?us-ascii?Q?pXFVUKnGwof8tIDUlEzxBLfm1V3J1J4W0sizhmssYh5kZ50TQgrL3gcGE7YB?=
 =?us-ascii?Q?wehSMbiLUWtWtP7dYl+kre610d5q7sRN1kB2Ip4jEbagd0lu4Z03l92jnMHa?=
 =?us-ascii?Q?Ha6NVax93DlKVhuYJ96uImm6gLuwzwlHoA0Ct2lUW0eOW5lDEYmLh3adLGDS?=
 =?us-ascii?Q?p5OidkeAvuWjGgjjpnJq6rW1HW5urtXCNlq4dlLX3V/CCBfqri4yVKasuSCP?=
 =?us-ascii?Q?rS8unTelNONJCSqjPX4quR9WoAs6o3Vk9+ppwFhcfFKIacnaPB+WsFBmIzVI?=
 =?us-ascii?Q?Qu/utFxUWnyhvrUI04GsTxuXwFZnFzlBOMVqmcg44gcQO2kogVNhGYCCHu8b?=
 =?us-ascii?Q?ShlDcGukqpvlSEuVNlj3wf06IDpRxbz6i6e5aVCS3lNZjuyvCU96/9eaVHHI?=
 =?us-ascii?Q?tCNxBvptY408WEP7H9klXErH5dSGS71l5pMgWBxSayFAU1SSY5CwZuCNxNKs?=
 =?us-ascii?Q?eA6Er8cNbaI4PTl1f1Vnx2jxPme0mE1Ivq38bIUVSMXnGSGfMJSbxI2pQqDS?=
 =?us-ascii?Q?EbuUlHGFU3NORh9JKhY28edkEtDnuqKNn0L9K3RQFo9zwFpxzlM9P+CqF+09?=
 =?us-ascii?Q?AkkxZrPzEzUyK7zOd74sZkKHzz61+yBQw0VKzjapisJUcP7+YYJTtKeQKi8u?=
 =?us-ascii?Q?fIds24s3zvNETdTNkyJy9H1BM4xZ00DWnTZK+JFT33PtmvPK7lZswxbD31OA?=
 =?us-ascii?Q?eVzU03LgVOJe2s+35apFiFv9jQgu+icWUUDpRIXG6Ave0HSlUpatCCUCZTwd?=
 =?us-ascii?Q?F//f50w1KoZgTMsnUZM1+klpg1YPad0LJko0r22GRSVn+NNdzk/v/5kl0rhA?=
 =?us-ascii?Q?N7OKQ5JX4l9kSWJGDVeqF0xkcG226QB8xhaMSLo5rB1PYLkNB1mfWjuA1zeC?=
 =?us-ascii?Q?MR3GtkUdN6KDyXpR5xAJtSuuTzYwsfzf+J3v+BfcRP8G1c5zYYODnCBZmrlf?=
 =?us-ascii?Q?CopIL46w2rXSu+nqkw/D/tJ2zcZ3vBS67nrP7GG+ky2zEZ/XSF8xUzHpKu1F?=
 =?us-ascii?Q?9euCkF8d5QGBgD51BpgortdJKKlU/1LZvEtGpn2XFgxeaUvddvS4gHAD1TTI?=
 =?us-ascii?Q?Jo2tLvzdjE5Dbg1eQWfsh9whyNWTR8ds9IT+4XlhaPkZPCjHBiGlO3Q0tn6O?=
 =?us-ascii?Q?vhvaiAXP7Nd5ZfKLdFfQqWWyOt5lxF/DKoJnmG+QUrRz5bJtng=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230037)(7416011)(36860700010)(376011)(1800799021)(82310400023);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 09:01:14.7170
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e0900f9-64c4-477d-3f97-08dc8eac0ae3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9340

Some type of domain don't have PIRQs, like PVH, it doesn't do
PHYSDEVOP_map_pirq for each gsi. When passthrough a device
to guest base on PVH dom0, callstack
pci_add_dm_done->XEN_DOMCTL_irq_permission will fail at function
domain_pirq_to_irq, because PVH has no mapping of gsi, pirq and
irq on Xen side.
What's more, current hypercall XEN_DOMCTL_irq_permission requires
passing in pirq, it is not suitable for dom0 that doesn't have
PIRQs.

So, add a new hypercall XEN_DOMCTL_gsi_permission to grant the
permission of irq(translate from gsi) to dumU when dom0 has no
PIRQs.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
RFC: it needs review and needs to wait for the corresponding third patch on linux kernel side to be merged.
---
 tools/include/xenctrl.h            |  5 +++
 tools/libs/ctrl/xc_domain.c        | 15 +++++++
 tools/libs/light/libxl_pci.c       | 67 +++++++++++++++++++++++++++---
 xen/arch/x86/domctl.c              | 43 +++++++++++++++++++
 xen/arch/x86/include/asm/io_apic.h |  2 +
 xen/arch/x86/io_apic.c             | 17 ++++++++
 xen/arch/x86/mpparse.c             |  3 +-
 xen/include/public/domctl.h        |  8 ++++
 xen/xsm/flask/hooks.c              |  1 +
 9 files changed, 153 insertions(+), 8 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index a0381f74d24b..f3feb6848e25 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1382,6 +1382,11 @@ int xc_domain_irq_permission(xc_interface *xch,
                              uint32_t pirq,
                              bool allow_access);
 
+int xc_domain_gsi_permission(xc_interface *xch,
+                             uint32_t domid,
+                             uint32_t gsi,
+                             bool allow_access);
+
 int xc_domain_iomem_permission(xc_interface *xch,
                                uint32_t domid,
                                unsigned long first_mfn,
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index f2d9d14b4d9f..8540e84fda93 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -1394,6 +1394,21 @@ int xc_domain_irq_permission(xc_interface *xch,
     return do_domctl(xch, &domctl);
 }
 
+int xc_domain_gsi_permission(xc_interface *xch,
+                             uint32_t domid,
+                             uint32_t gsi,
+                             bool allow_access)
+{
+    struct xen_domctl domctl = {
+        .cmd = XEN_DOMCTL_gsi_permission,
+        .domain = domid,
+        .u.gsi_permission.gsi = gsi,
+        .u.gsi_permission.allow_access = allow_access,
+    };
+
+    return do_domctl(xch, &domctl);
+}
+
 int xc_domain_iomem_permission(xc_interface *xch,
                                uint32_t domid,
                                unsigned long first_mfn,
diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 376f91759ac6..f027f22c0028 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1431,6 +1431,9 @@ static void pci_add_dm_done(libxl__egc *egc,
     uint32_t flag = XEN_DOMCTL_DEV_RDM_RELAXED;
     uint32_t domainid = domid;
     bool isstubdom = libxl_is_stubdom(ctx, domid, &domainid);
+#ifdef CONFIG_X86
+    xc_domaininfo_t info;
+#endif
 
     /* Convenience aliases */
     bool starting = pas->starting;
@@ -1516,14 +1519,39 @@ static void pci_add_dm_done(libxl__egc *egc,
             rc = ERROR_FAIL;
             goto out;
         }
-        r = xc_domain_irq_permission(ctx->xch, domid, irq, 1);
+#ifdef CONFIG_X86
+        /* If dom0 doesn't have PIRQs, need to use xc_domain_gsi_permission */
+        r = xc_domain_getinfo_single(ctx->xch, 0, &info);
         if (r < 0) {
-            LOGED(ERROR, domainid,
-                  "xc_domain_irq_permission irq=%d (error=%d)", irq, r);
+            LOGED(ERROR, domainid, "getdomaininfo failed (error=%d)", errno);
             fclose(f);
             rc = ERROR_FAIL;
             goto out;
         }
+        if (info.flags & XEN_DOMINF_hvm_guest &&
+            !(info.arch_config.emulation_flags & XEN_X86_EMU_USE_PIRQ) &&
+            gsi > 0) {
+            r = xc_domain_gsi_permission(ctx->xch, domid, gsi, 1);
+            if (r < 0) {
+                LOGED(ERROR, domainid,
+                    "xc_domain_gsi_permission gsi=%d (error=%d)", gsi, errno);
+                fclose(f);
+                rc = ERROR_FAIL;
+                goto out;
+            }
+        }
+        else
+#endif
+        {
+            r = xc_domain_irq_permission(ctx->xch, domid, irq, 1);
+            if (r < 0) {
+                LOGED(ERROR, domainid,
+                    "xc_domain_irq_permission irq=%d (error=%d)", irq, errno);
+                fclose(f);
+                rc = ERROR_FAIL;
+                goto out;
+            }
+        }
     }
     fclose(f);
 
@@ -2200,6 +2228,10 @@ static void pci_remove_detached(libxl__egc *egc,
 #endif
     uint32_t domainid = prs->domid;
     bool isstubdom;
+#ifdef CONFIG_X86
+    int r;
+    xc_domaininfo_t info;
+#endif
 
     /* Convenience aliases */
     libxl_device_pci *const pci = &prs->pci;
@@ -2287,9 +2319,32 @@ skip_bar:
              */
             LOGED(ERROR, domid, "xc_physdev_unmap_pirq irq=%d", irq);
         }
-        rc = xc_domain_irq_permission(ctx->xch, domid, irq, 0);
-        if (rc < 0) {
-            LOGED(ERROR, domid, "xc_domain_irq_permission irq=%d", irq);
+#ifdef CONFIG_X86
+        /* If dom0 doesn't have PIRQs, need to use xc_domain_gsi_permission */
+        r = xc_domain_getinfo_single(ctx->xch, 0, &info);
+        if (r < 0) {
+            LOGED(ERROR, domid, "getdomaininfo failed (error=%d)", errno);
+            fclose(f);
+            rc = ERROR_FAIL;
+            goto skip_legacy_irq;
+        }
+        if (info.flags & XEN_DOMINF_hvm_guest &&
+            !(info.arch_config.emulation_flags & XEN_X86_EMU_USE_PIRQ) &&
+            gsi > 0) {
+            r = xc_domain_gsi_permission(ctx->xch, domid, gsi, 0);
+            if (r < 0) {
+                LOGED(ERROR, domid,
+                    "xc_domain_gsi_permission gsi=%d (error=%d)", gsi, errno);
+                rc = ERROR_FAIL;
+            }
+        }
+        else
+#endif
+        {
+            rc = xc_domain_irq_permission(ctx->xch, domid, irq, 0);
+            if (rc < 0) {
+                LOGED(ERROR, domid, "xc_domain_irq_permission irq=%d", irq);
+            }
         }
     }
 
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 335aedf46d03..6b465bbc6ec0 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -36,6 +36,7 @@
 #include <asm/xstate.h>
 #include <asm/psr.h>
 #include <asm/cpu-policy.h>
+#include <asm/io_apic.h>
 
 static int update_domain_cpu_policy(struct domain *d,
                                     xen_domctl_cpu_policy_t *xdpc)
@@ -237,6 +238,48 @@ long arch_do_domctl(
         break;
     }
 
+    case XEN_DOMCTL_gsi_permission:
+    {
+        unsigned int gsi = domctl->u.gsi_permission.gsi;
+        int irq;
+        bool allow = domctl->u.gsi_permission.allow_access;
+
+        /* Check all pads are zero */
+        ret = -EINVAL;
+        for ( i = 0;
+              i < sizeof(domctl->u.gsi_permission.pad) /
+                  sizeof(domctl->u.gsi_permission.pad[0]);
+              ++i )
+            if ( domctl->u.gsi_permission.pad[i] )
+                goto out;
+
+        /*
+         * If current domain is PV or it has PIRQ flag, it has a mapping
+         * of gsi, pirq and irq, so it should use XEN_DOMCTL_irq_permission
+         * to grant irq permission.
+         */
+        ret = -EOPNOTSUPP;
+        if ( is_pv_domain(currd) || has_pirq(currd) )
+            goto out;
+
+        ret = -EINVAL;
+        if ( gsi >= nr_irqs_gsi || (irq = gsi_2_irq(gsi)) < 0 )
+            goto out;
+
+        ret = -EPERM;
+        if ( !irq_access_permitted(currd, irq) ||
+             xsm_irq_permission(XSM_HOOK, d, irq, allow) )
+            goto out;
+
+        if ( allow )
+            ret = irq_permit_access(d, irq);
+        else
+            ret = irq_deny_access(d, irq);
+
+    out:
+        break;
+    }
+
     case XEN_DOMCTL_getpageframeinfo3:
     {
         unsigned int num = domctl->u.getpageframeinfo3.num;
diff --git a/xen/arch/x86/include/asm/io_apic.h b/xen/arch/x86/include/asm/io_apic.h
index 78268ea8f666..7e86d8337758 100644
--- a/xen/arch/x86/include/asm/io_apic.h
+++ b/xen/arch/x86/include/asm/io_apic.h
@@ -213,5 +213,7 @@ unsigned highest_gsi(void);
 
 int ioapic_guest_read( unsigned long physbase, unsigned int reg, u32 *pval);
 int ioapic_guest_write(unsigned long physbase, unsigned int reg, u32 val);
+int mp_find_ioapic(int gsi);
+int gsi_2_irq(int gsi);
 
 #endif
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index b48a64246548..23845c8cb11f 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -955,6 +955,23 @@ static int pin_2_irq(int idx, int apic, int pin)
     return irq;
 }
 
+int gsi_2_irq(int gsi)
+{
+    int ioapic, pin, irq;
+
+    ioapic = mp_find_ioapic(gsi);
+    if ( ioapic < 0 )
+        return -EINVAL;
+
+    pin = gsi - io_apic_gsi_base(ioapic);
+
+    irq = apic_pin_2_gsi_irq(ioapic, pin);
+    if ( irq <= 0 )
+        return -EINVAL;
+
+    return irq;
+}
+
 static inline int IO_APIC_irq_trigger(int irq)
 {
     int apic, idx, pin;
diff --git a/xen/arch/x86/mpparse.c b/xen/arch/x86/mpparse.c
index d8ccab2449c6..c95da0de5770 100644
--- a/xen/arch/x86/mpparse.c
+++ b/xen/arch/x86/mpparse.c
@@ -841,8 +841,7 @@ static struct mp_ioapic_routing {
 } mp_ioapic_routing[MAX_IO_APICS];
 
 
-static int mp_find_ioapic (
-	int			gsi)
+int mp_find_ioapic(int gsi)
 {
 	unsigned int		i;
 
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 2a49fe46ce25..f7ae8b19d27d 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -464,6 +464,12 @@ struct xen_domctl_irq_permission {
     uint8_t pad[3];
 };
 
+/* XEN_DOMCTL_gsi_permission */
+struct xen_domctl_gsi_permission {
+    uint32_t gsi;
+    uint8_t allow_access;    /* flag to specify enable/disable of x86 gsi access */
+    uint8_t pad[3];
+};
 
 /* XEN_DOMCTL_iomem_permission */
 struct xen_domctl_iomem_permission {
@@ -1306,6 +1312,7 @@ struct xen_domctl {
 #define XEN_DOMCTL_get_paging_mempool_size       85
 #define XEN_DOMCTL_set_paging_mempool_size       86
 #define XEN_DOMCTL_dt_overlay                    87
+#define XEN_DOMCTL_gsi_permission                88
 #define XEN_DOMCTL_gdbsx_guestmemio            1000
 #define XEN_DOMCTL_gdbsx_pausevcpu             1001
 #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
@@ -1328,6 +1335,7 @@ struct xen_domctl {
         struct xen_domctl_setdomainhandle   setdomainhandle;
         struct xen_domctl_setdebugging      setdebugging;
         struct xen_domctl_irq_permission    irq_permission;
+        struct xen_domctl_gsi_permission    gsi_permission;
         struct xen_domctl_iomem_permission  iomem_permission;
         struct xen_domctl_ioport_permission ioport_permission;
         struct xen_domctl_hypercall_init    hypercall_init;
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 5e88c71b8e22..a5b134c91101 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -685,6 +685,7 @@ static int cf_check flask_domctl(struct domain *d, int cmd)
     case XEN_DOMCTL_shadow_op:
     case XEN_DOMCTL_ioport_permission:
     case XEN_DOMCTL_ioport_mapping:
+    case XEN_DOMCTL_gsi_permission:
 #endif
 #ifdef CONFIG_HAS_PASSTHROUGH
     /*
-- 
2.34.1


