Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA7C8C7F72
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 03:16:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723729.1128768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7mCB-00037N-UI; Fri, 17 May 2024 01:15:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723729.1128768; Fri, 17 May 2024 01:15:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7mCB-00035n-Qe; Fri, 17 May 2024 01:15:39 +0000
Received: by outflank-mailman (input) for mailman id 723729;
 Fri, 17 May 2024 01:15:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6mIz=MU=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s7mC9-00035h-TG
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 01:15:37 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:200a::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5bbd00b-13ea-11ef-b4bb-af5377834399;
 Fri, 17 May 2024 03:15:35 +0200 (CEST)
Received: from BL0PR02CA0004.namprd02.prod.outlook.com (2603:10b6:207:3c::17)
 by DM6PR12MB4121.namprd12.prod.outlook.com (2603:10b6:5:220::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30; Fri, 17 May
 2024 01:15:27 +0000
Received: from BL02EPF00021F69.namprd02.prod.outlook.com
 (2603:10b6:207:3c:cafe::f3) by BL0PR02CA0004.outlook.office365.com
 (2603:10b6:207:3c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28 via Frontend
 Transport; Fri, 17 May 2024 01:15:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00021F69.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Fri, 17 May 2024 01:15:27 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 20:15:26 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 20:15:26 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 16 May 2024 20:15:24 -0500
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
X-Inumbo-ID: f5bbd00b-13ea-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aEfwZpMIE6FUgjS+jL00zhCz24VhiSRJVHJ4r3I0xTdGX9oh1PlOgrLz6UWygvKXna1pwFNFAqWYHU9s8DBu1DgamfuMClN0FvecHKoW9RVM05JzbME2SaYShdJhnV9MiT7pdZHByatO+FCvPi5aXYJEoHYUGZSkuGCoF61aWVFQcj6TOpGzMOQ5B8sdkn3/dpY9n8gAt4HLlRsIg46pka+O0IIbi4lZxYHGEC0wMbJjCXAdQTKBZVdx5m/IfW/A2ZQowie/gIu3BTPHyX4MXhlGe97NYNkmRLBPqUZan1qNH8nEdzaa829ZJ6kCj+N9iM7EZ0EZ2tWAbJZp3X2Ouw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wk82CmnnafP/ty0a2WVhVTjambpmPt6exWQt3tANaj0=;
 b=ULrr3xHOZ9FjxAvLaTozYdZVpNrqXgYUigVo4iydmCPf5xbMsDuqLtbQspa63TpWWeZKAESww6YQHPTbddx2Zv1osEPloFAUsg/xyBoEvMFMIfBcBptiffXTuT0RUsQi9Eqw+Ut3SO+XZBm+QIaWU2UBS8dTfH4zycjz//OFt4GQv+OyZKI5fJxPItkEj/TFfRK6FhAC0ahgJrQNMz2FRe2hB/JraMSwe+i3Moqhu2bvOhrDBEpGeRx20Fl4RWCT0GfeIh0ri+08D0uZntq4XTyMOzGz2AcyEQDRvcQDoO/8MKzjtsw+Z1u8k7adH9rCFOg6h851Yqch4tXJFe2Tag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wk82CmnnafP/ty0a2WVhVTjambpmPt6exWQt3tANaj0=;
 b=jVL+PmIrq6rPiXFCfGQU9G0JzM+qL596OdyvWC1w+63KXndIHVb3pH66by2GKO1RvG+KKKbkDxMGjGpgNfM/vkbUX35Z4cmLRTku34zxCHJqcT5ROvDTNS4ngQeXrC6LJ4Vxp9hYNVLM+VPtPtdZXfRYzD7dAqBLibvw/SBoEZA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
CC: Henry Wang <xin.wang2@amd.com>, Juergen Gross <jgross@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2] drivers/xen: Improve the late XenStore init protocol
Date: Fri, 17 May 2024 09:15:16 +0800
Message-ID: <20240517011516.1451087-1-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F69:EE_|DM6PR12MB4121:EE_
X-MS-Office365-Filtering-Correlation-Id: 97b12dc7-9b4b-420f-c37a-08dc760ed603
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|1800799015|376005|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2ljjx2ZimPn2IMlx+2PP1wKTUhKyPacOVvnUwWjFenJbZKCDzp+7hPr2aoB/?=
 =?us-ascii?Q?pKvvno9m0BdNAe60rkwiH0O2gT73KyEmmYwfOAj/oEHnfaXMglPySCpM4Ylv?=
 =?us-ascii?Q?rnk2Sfc6gfzpoFh5AYXfYZeKFLvGLBp6banem0zCZzwqnrUeN7hZeWe330LM?=
 =?us-ascii?Q?G5X686EEVajH3XYXe3Ce/Ze2TkYsX+vSzP5THBHzgCv+Fz1y50uMj7hH8tAm?=
 =?us-ascii?Q?tNhQIM8PO3iN2vBEwQJy9szGowbpgDU6uu3ibWStlQmzWYxDWv9QUQkh+HLL?=
 =?us-ascii?Q?nr3QAWKRTqeZ1ZvXtGzyjZ/ANERGpB/2TXOktE1NIitNwPKq0KtvBlCsbrHY?=
 =?us-ascii?Q?id0DZQsM4ojZbEMTfW/bi4qxtC4j5S3Fn2PjfYqqmmGUcAX2nONZExh8WBes?=
 =?us-ascii?Q?Ax5geCVTyDcM68W+gvAAON9hkIpneZuc11KUMEXZWeBeezLJGuVZsnlgALHm?=
 =?us-ascii?Q?W/leEv6TTI+C5o5inTH3DpUFASIb7nqttc0qaZQGp9M57sujnvl0KO2cIzSt?=
 =?us-ascii?Q?HW9tOlSwh19UrbBD1lH9he1T8iOHs+6k5OjMrLXTVu0b/+CheGiDMxRTKF3v?=
 =?us-ascii?Q?R2Ftbw22dOQHZsjKVuAi0inac4VwJ1qUNBjf2sobkyC5XUjFDTg2BCG6yqZv?=
 =?us-ascii?Q?2syqpKO8qIQf1Xk10Zo/poDm577NfY3fqSR60ChbKLiUPgw2ZtREpjXAVgLM?=
 =?us-ascii?Q?1ks2aaHVX0i6oHy1xaieE2m5Gf7GuHjx3tnDOZJtD7zgrjDOd9TpVNraQoqW?=
 =?us-ascii?Q?LHpK5CotRY9bA1FHF9CYfZPqlixEIgI0Hz3pgMeQWc7xNDoAv87GimulGKM4?=
 =?us-ascii?Q?VqzWeKa7GzSr33C+FKSIQXrgRqkyJRnAFqq4CZtjpP8o9MQs59rIMkPmhZWT?=
 =?us-ascii?Q?kSE/jzWrlYKPt246YXfp7OmuASLiJvbARTUjhM+BOLbexPqMqQIqjvG8m7jz?=
 =?us-ascii?Q?3fMJqEcOqaiALneWb2m7mDiuCXsCbJK39OqA8yqANFqca3lBBjQNTKEyWT42?=
 =?us-ascii?Q?OXAnIe+YgzAJI1jgKpzfgp03VDaFF66YlKUkSC//PSEwI0xfKE5V4ixUajlT?=
 =?us-ascii?Q?JK5BDH+RUT4msLIXN194GEeRJcHVhGnH2q9pe/i2QbKApa0YLLVLtJx85oPa?=
 =?us-ascii?Q?DxBkJbG+1GJglo1yNkWF3hMEUJ6ybRtof6UIkSrHIsgzOGxn3DPSi4ea4jaW?=
 =?us-ascii?Q?BjR5g4xsrYwsUCeugtVEAJqiR/126tlduSFzxAxmr67HNyGVl1DTZGIPYJKE?=
 =?us-ascii?Q?rDVgtF0AETl7AhkzhAu4Wi3oKWr/NQCVmdqdqz8a6+/fjRL7o5H659YLZMmK?=
 =?us-ascii?Q?hu9Gr5oHnw5bNfGV/Zmtgm4rUQt1iVZ8Vr0rHyb/KBAKFDE9eCm9126RLqut?=
 =?us-ascii?Q?DILRIKVrajZvo6YTdiUZX+iTa5FO?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(376005)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 01:15:27.1489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97b12dc7-9b4b-420f-c37a-08dc760ed603
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F69.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4121

Currently, the late XenStore init protocol is only triggered properly
for the case that HVM_PARAM_STORE_PFN is ~0ULL (invalid). For the
case that XenStore interface is allocated but not ready (the connection
status is not XENSTORE_CONNECTED), Linux should also wait until the
XenStore is set up properly.

Introduce a macro to describe the XenStore interface is ready, use
it in xenbus_probe_initcall() to select the code path of doing the
late XenStore init protocol or not. Since now we have more than one
condition for XenStore late init, rework the check in xenbus_probe()
for the free_irq().

Take the opportunity to enhance the check of the allocated XenStore
interface can be properly mapped, and return error early if the
memremap() fails.

Fixes: 5b3353949e89 ("xen: add support for initializing xenstore later as HVM domain")
Signed-off-by: Henry Wang <xin.wang2@amd.com>
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
v2:
- Use -EINVAL for the memremap() check. (Stefano)
- Add Fixes: tag. (Stefano)
- Rework the condition for free_irq() in xenbus_probe(). (Stefano)
---
 drivers/xen/xenbus/xenbus_probe.c | 36 ++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
index 3205e5d724c8..1a9ded0cddcb 100644
--- a/drivers/xen/xenbus/xenbus_probe.c
+++ b/drivers/xen/xenbus/xenbus_probe.c
@@ -65,13 +65,17 @@
 #include "xenbus.h"
 
 
-static int xs_init_irq;
+static int xs_init_irq = -1;
 int xen_store_evtchn;
 EXPORT_SYMBOL_GPL(xen_store_evtchn);
 
 struct xenstore_domain_interface *xen_store_interface;
 EXPORT_SYMBOL_GPL(xen_store_interface);
 
+#define XS_INTERFACE_READY \
+	((xen_store_interface != NULL) && \
+	 (xen_store_interface->connection == XENSTORE_CONNECTED))
+
 enum xenstore_init xen_store_domain_type;
 EXPORT_SYMBOL_GPL(xen_store_domain_type);
 
@@ -751,19 +755,19 @@ static void xenbus_probe(void)
 {
 	xenstored_ready = 1;
 
-	if (!xen_store_interface) {
+	if (!xen_store_interface)
 		xen_store_interface = memremap(xen_store_gfn << XEN_PAGE_SHIFT,
 					       XEN_PAGE_SIZE, MEMREMAP_WB);
-		/*
-		 * Now it is safe to free the IRQ used for xenstore late
-		 * initialization. No need to unbind: it is about to be
-		 * bound again from xb_init_comms. Note that calling
-		 * unbind_from_irqhandler now would result in xen_evtchn_close()
-		 * being called and the event channel not being enabled again
-		 * afterwards, resulting in missed event notifications.
-		 */
+	/*
+	 * Now it is safe to free the IRQ used for xenstore late
+	 * initialization. No need to unbind: it is about to be
+	 * bound again from xb_init_comms. Note that calling
+	 * unbind_from_irqhandler now would result in xen_evtchn_close()
+	 * being called and the event channel not being enabled again
+	 * afterwards, resulting in missed event notifications.
+	 */
+	if (xs_init_irq >= 0)
 		free_irq(xs_init_irq, &xb_waitq);
-	}
 
 	/*
 	 * In the HVM case, xenbus_init() deferred its call to
@@ -822,7 +826,7 @@ static int __init xenbus_probe_initcall(void)
 	if (xen_store_domain_type == XS_PV ||
 	    (xen_store_domain_type == XS_HVM &&
 	     !xs_hvm_defer_init_for_callback() &&
-	     xen_store_interface != NULL))
+	     XS_INTERFACE_READY))
 		xenbus_probe();
 
 	/*
@@ -831,7 +835,7 @@ static int __init xenbus_probe_initcall(void)
 	 * started, then probe.  It will be triggered when communication
 	 * starts happening, by waiting on xb_waitq.
 	 */
-	if (xen_store_domain_type == XS_LOCAL || xen_store_interface == NULL) {
+	if (xen_store_domain_type == XS_LOCAL || !XS_INTERFACE_READY) {
 		struct task_struct *probe_task;
 
 		probe_task = kthread_run(xenbus_probe_thread, NULL,
@@ -1014,6 +1018,12 @@ static int __init xenbus_init(void)
 			xen_store_interface =
 				memremap(xen_store_gfn << XEN_PAGE_SHIFT,
 					 XEN_PAGE_SIZE, MEMREMAP_WB);
+			if (!xen_store_interface) {
+				pr_err("%s: cannot map HVM_PARAM_STORE_PFN=%llx\n",
+				       __func__, v);
+				err = -EINVAL;
+				goto out_error;
+			}
 			if (xen_store_interface->connection != XENSTORE_CONNECTED)
 				wait = true;
 		}
-- 
2.34.1


