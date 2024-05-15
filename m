Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A17288C5ED8
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 03:44:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721868.1125548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s73gS-0002f3-EM; Wed, 15 May 2024 01:43:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721868.1125548; Wed, 15 May 2024 01:43:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s73gS-0002d3-Bl; Wed, 15 May 2024 01:43:56 +0000
Received: by outflank-mailman (input) for mailman id 721868;
 Wed, 15 May 2024 01:43:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3gy8=MS=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s73gR-0002cx-Ei
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 01:43:55 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2416::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9444058c-125c-11ef-b4bb-af5377834399;
 Wed, 15 May 2024 03:43:52 +0200 (CEST)
Received: from SA9PR13CA0060.namprd13.prod.outlook.com (2603:10b6:806:22::35)
 by CY5PR12MB6273.namprd12.prod.outlook.com (2603:10b6:930:22::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Wed, 15 May
 2024 01:43:45 +0000
Received: from SA2PEPF00003AE8.namprd02.prod.outlook.com
 (2603:10b6:806:22:cafe::a2) by SA9PR13CA0060.outlook.office365.com
 (2603:10b6:806:22::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.26 via Frontend
 Transport; Wed, 15 May 2024 01:43:45 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00003AE8.mail.protection.outlook.com (10.167.248.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Wed, 15 May 2024 01:43:44 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 14 May
 2024 20:43:44 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 14 May 2024 20:43:42 -0500
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
X-Inumbo-ID: 9444058c-125c-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LFBoMyfxkhFIxIy3S7xIiehYUxmhedabpojIPA/MfYoZdY2UokTfguasUcy89r0F/WFIcLLYPN0WvEEyifpnBDCdpVJB+q94fh1qKznZGBKzjQdqPLdF78WKm2aACsrKGugBq64C5eCfbPaqFX/jWbym0Qgy44m2kjyvtAgXkxoq/gc1Kpc6s/AOcyPAX7KZCgooXbel7jkDDS8DqDUNzmMi6eAAeUxTppkdPnuS6M/uPk23QwmSsIiDJPkmCggAYc4C9HJAnGwdvN3K0WJeNDpde1IZAo91DUo3zM6cIIncAZAIHpPMRS/JeVg3arCdBRGVDO+0vOm40Fq9H1ACiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I9Mo9dcjzNCPuVSTk1Qb4E60fo4KMmya7iYoi3zTTWY=;
 b=TGLCnzRCB29j5QcYGXVlvVmfhICyUUfz0oOLZmzDUIFaadVL//H0ZeKrOLMnd0AItsfZbi4eaXoG3PS75tW9KpZbCOOXktCwd2s1VcaRy+vkeQSbcRsPglp2JidQOXkfFxzYrTaUbGIB98jwR3TMnSBSzNidZ44cz5xfo15fr5hcU6JG0HIulkVE7owAH0ynsgNCgOKLUwc1yb4K7N1wfzJush36t9Ye4sOkrb1Z2TKQb2ZdwOWsg86SK7rOk7xY1vVb444Z6XIeiSdPuVn9nSbzAnM3QfMmoKuAHeKWIaHX6HLfS7Yzd0QGDqyB8hcqI+fXU66zlLp5AlKPfkaekw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I9Mo9dcjzNCPuVSTk1Qb4E60fo4KMmya7iYoi3zTTWY=;
 b=e4/5VL1Hg/ZkmMZiWziQL/vAVLpD4gpMWEipjaIc7sTOvOrw49b1D8Z3BtAXAcB25s0g8sqGSJKvTqfofv4HivmkdWnh+4PMEztyKJkzIjigAekdhLC8DYRufURSJ73f3g0y4IoluXgVcs7Z+1AcbOqNal2LBQ3Bev5un394cjE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
CC: Henry Wang <xin.wang2@amd.com>, Juergen Gross <jgross@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH] drivers/xen: Improve the late XenStore init protocol
Date: Wed, 15 May 2024 09:43:30 +0800
Message-ID: <20240515014330.1044617-1-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE8:EE_|CY5PR12MB6273:EE_
X-MS-Office365-Filtering-Correlation-Id: c3a6b98b-32b5-4f2d-7f64-08dc7480750f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|376005|36860700004|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qaa5iZHwudBr6Y7Q5p2814qTq2Rmlqeenf++Xa2C+u6cCutSNQGZO0HNRaO/?=
 =?us-ascii?Q?kAVe5wbHqXen9F7FoG4Om4fCmqLoC/anR0Dfgw1mcBduElhp1J4mC/n7J2ts?=
 =?us-ascii?Q?q3ZXu9ipOcXDkTgYCpynQDBdbbaZUmGfCfRd0VXn7e8Je6West5rjyOazkP5?=
 =?us-ascii?Q?DFkJLTNVmXV7ls9bpFVYE/DXzYM2r1CK++wsMU287YZCTok393L4DTqdjbGm?=
 =?us-ascii?Q?kUVbpS1zCAKqvKdKv1E4JIdNlxSabIC3JXsymmJoJbQI831MgfYD+QlPPOdj?=
 =?us-ascii?Q?pSOhW18qvFjKNhBPCpyHYBBoxNcAukm/nJBCQyv24g1eKpFIuzCIH5m1929f?=
 =?us-ascii?Q?zh7pVoUiUX+Tx1UGWlocge1vPdeEs2s0kljHyzs7WZlfe5WBe3AEgwRspG0A?=
 =?us-ascii?Q?2lcQ+3yxmvr2C/t/kbuOHcF1zLmx5We24teXZ+0xtAHSO1GmjbdlYtsKEbLB?=
 =?us-ascii?Q?ZETnF9Jm44PhJk9o6UiOsIKr38HsBo5QB+HR4FIuK1cplJIL9SVtrR6vEh8D?=
 =?us-ascii?Q?oKqP0rVLvIah+2O7cnOOVwXpL4VtvacminojTUDHG0uJs+0zAe4QSzWaAPQX?=
 =?us-ascii?Q?KVfR6xD45x3C1CfqXwwfRcTuJiDYUCuSPqURwBhj/97B/SIyl/OzVdzybkIY?=
 =?us-ascii?Q?bN1s4+8iIFNQBxVVmPozaqFBhjDrW38a/2woF3qxoDmlno2YVU+yc4+OPoXC?=
 =?us-ascii?Q?eKVbNOzhY+a5ybeeo2008K3Pb3+x/ZpvZIC9/ShE4Bhycl55G97dJtIRcOB1?=
 =?us-ascii?Q?0Wk32EHdUpk1HUUHOme3fslqV4OgGimNGfY8fbdGwEBsPJDKGesB+qUdENGH?=
 =?us-ascii?Q?VGfzP8HpgO/tvayTuUPLruYp7/xOjMXm1RCWv5CKf5hG08f4YOy+7jRsIQCe?=
 =?us-ascii?Q?4b/rp2nLn0beUhx4xhKSr4my3NFxx2FAhZjBINgO5v+Ypj0I1vV1eQkKdUFV?=
 =?us-ascii?Q?okj+DebYMAO1jOW+s7yWyooabzobJGTe0ggLdUUbbJhUkfW3os3Rd72/WzX/?=
 =?us-ascii?Q?wlTyoVtiF0qnLv/Jeo+wqTbqyErnUjI/dpy2mpZfC9ccSffOlQLcgsS7aoSu?=
 =?us-ascii?Q?B5fMw8cUvgj0DsYlaKnrOVJlOkDo4u0u6YhLRIwkZCISQ2uEO0v2bxTDcVqB?=
 =?us-ascii?Q?4WoXWvc90MybBwWP7y9Y5hhEZtuC9kbkoVzjaFbvu4ea5d7CQkgHjDp20iP2?=
 =?us-ascii?Q?8Pl1acSG3PD1xL3OmMHe5Pl8Ld80abgtdydyZf6jJ4MTT8WD2uSZJPM/Tioi?=
 =?us-ascii?Q?KlbrVOLOAqoBdZHosTfsxc5/Rstk3dNJSykC9cQwvjb8b+IKHIaHf/1gwrRB?=
 =?us-ascii?Q?V3m8ugt1a76aW/ZkDGeTHSXzjxWk3P7LNz8A/0iljLpj2073jmh9aNgmbbmm?=
 =?us-ascii?Q?WHlMaA6QJ4KpgPP8lyOjGN6n76CW?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 01:43:44.7728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3a6b98b-32b5-4f2d-7f64-08dc7480750f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6273

Currently, the late XenStore init protocol is only triggered properly
for the case that HVM_PARAM_STORE_PFN is ~0ULL (invalid). For the
case that XenStore interface is allocated but not ready (the connection
status is not XENSTORE_CONNECTED), Linux should also wait until the
XenStore is set up properly.

Introduce a macro to describe the XenStore interface is ready, use
it in xenbus_probe_initcall() and xenbus_probe() to select the code
path of doing the late XenStore init protocol or not.

Take the opportunity to enhance the check of the allocated XenStore
interface can be properly mapped, and return error early if the
memremap() fails.

Signed-off-by: Henry Wang <xin.wang2@amd.com>
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 drivers/xen/xenbus/xenbus_probe.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
index 3205e5d724c8..8aec0ed1d047 100644
--- a/drivers/xen/xenbus/xenbus_probe.c
+++ b/drivers/xen/xenbus/xenbus_probe.c
@@ -72,6 +72,10 @@ EXPORT_SYMBOL_GPL(xen_store_evtchn);
 struct xenstore_domain_interface *xen_store_interface;
 EXPORT_SYMBOL_GPL(xen_store_interface);
 
+#define XS_INTERFACE_READY \
+	((xen_store_interface != NULL) && \
+	 (xen_store_interface->connection == XENSTORE_CONNECTED))
+
 enum xenstore_init xen_store_domain_type;
 EXPORT_SYMBOL_GPL(xen_store_domain_type);
 
@@ -751,9 +755,10 @@ static void xenbus_probe(void)
 {
 	xenstored_ready = 1;
 
-	if (!xen_store_interface) {
-		xen_store_interface = memremap(xen_store_gfn << XEN_PAGE_SHIFT,
-					       XEN_PAGE_SIZE, MEMREMAP_WB);
+	if (!xen_store_interface || XS_INTERFACE_READY) {
+		if (!xen_store_interface)
+			xen_store_interface = memremap(xen_store_gfn << XEN_PAGE_SHIFT,
+						       XEN_PAGE_SIZE, MEMREMAP_WB);
 		/*
 		 * Now it is safe to free the IRQ used for xenstore late
 		 * initialization. No need to unbind: it is about to be
@@ -822,7 +827,7 @@ static int __init xenbus_probe_initcall(void)
 	if (xen_store_domain_type == XS_PV ||
 	    (xen_store_domain_type == XS_HVM &&
 	     !xs_hvm_defer_init_for_callback() &&
-	     xen_store_interface != NULL))
+	     XS_INTERFACE_READY))
 		xenbus_probe();
 
 	/*
@@ -831,7 +836,7 @@ static int __init xenbus_probe_initcall(void)
 	 * started, then probe.  It will be triggered when communication
 	 * starts happening, by waiting on xb_waitq.
 	 */
-	if (xen_store_domain_type == XS_LOCAL || xen_store_interface == NULL) {
+	if (xen_store_domain_type == XS_LOCAL || !XS_INTERFACE_READY) {
 		struct task_struct *probe_task;
 
 		probe_task = kthread_run(xenbus_probe_thread, NULL,
@@ -1014,6 +1019,12 @@ static int __init xenbus_init(void)
 			xen_store_interface =
 				memremap(xen_store_gfn << XEN_PAGE_SHIFT,
 					 XEN_PAGE_SIZE, MEMREMAP_WB);
+			if (!xen_store_interface) {
+				pr_err("%s: cannot map HVM_PARAM_STORE_PFN=%llx\n",
+				       __func__, v);
+				err = -ENOMEM;
+				goto out_error;
+			}
 			if (xen_store_interface->connection != XENSTORE_CONNECTED)
 				wait = true;
 		}
-- 
2.34.1


