Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 397639F87E8
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 23:33:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861497.1273470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOP4K-0005e5-I4; Thu, 19 Dec 2024 22:32:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861497.1273470; Thu, 19 Dec 2024 22:32:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOP4K-0005cc-Ex; Thu, 19 Dec 2024 22:32:32 +0000
Received: by outflank-mailman (input) for mailman id 861497;
 Thu, 19 Dec 2024 22:32:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GJid=TM=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tOP4J-0005cW-0T
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 22:32:31 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2414::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20282f73-be59-11ef-a0d8-8be0dac302b0;
 Thu, 19 Dec 2024 23:32:28 +0100 (CET)
Received: from CH0P221CA0044.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::27)
 by CH3PR12MB8935.namprd12.prod.outlook.com (2603:10b6:610:169::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Thu, 19 Dec
 2024 22:32:22 +0000
Received: from CH3PEPF0000000E.namprd04.prod.outlook.com
 (2603:10b6:610:11d:cafe::80) by CH0P221CA0044.outlook.office365.com
 (2603:10b6:610:11d::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.24 via Frontend Transport; Thu,
 19 Dec 2024 22:32:22 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF0000000E.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Thu, 19 Dec 2024 22:32:21 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 16:32:21 -0600
Received: from amd-BIRMANPLUS.mshome.net (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 19 Dec 2024 16:32:20 -0600
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
X-Inumbo-ID: 20282f73-be59-11ef-a0d8-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WxSEgbKs4HyUnK5Ug4Pctyy2ghD6L4HJxntrHraZQJCy3gkWuUbIG9lzzDRxpg+pmck74kW3ZF3oBSxCuAdx9paiRkAAZM2oIC0IHpejf7pRBCkJ9MSs4WGAj0KIoYuPjiTfg3sWbj44WQxMdJPlsMDA4dXpzcw5iX/5nR6wfYh2ULoKc506D6nifE4LhmQTmrBiJM5PE26+cVX0GmNS+ssjNylZ4DiaoKgPoXtUX3ldYqd5GSbXUxJDq4HNNM3pDY66NAbACrAqrwOL7BmoiA2wxUPjCHouNHPci7eBl9t9dJb/JsC38RtS/QV1Jdbje9CckmOuuiaLDPmNnWGDzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wa60DCOikA3QB2mlRsATu5N4pHRCgyKw8HMeXV1f3as=;
 b=ihk1fzJxADw4l1X1WYXm7WADc+chnYP2cftXRg1ysOZNOZsHws4hpuOUjt3PRemQfkpsRkLA7NHc+rgjfsJLSGpCWr1p/drUmAweDXwTsL16iOR/uEF0qZ/Lg7BVPLVUibBje7VQofvctfWnOmfAqW5wVqm3dYilj8xiIz2E+NQctfyrXvFEUdGAf0ncuTOw1VG2tN4DukxPD45OWqtHWo9gIJva+15TgevsDt/vzSu8ur5eF4Y21IQ4WHaFpibtfPRTFSGY2uAUCsWN5hVRPL9QtbtSNOGT+p9UFUZLicLYr9JsY/JkWivrhQMIxWy0mQ9vv60qkUItz/Gyf8/yqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wa60DCOikA3QB2mlRsATu5N4pHRCgyKw8HMeXV1f3as=;
 b=MbwnLdwaiGwawE6CVvuR8CC3gBUOKA8akvGtUknUHFQ9WleRg1KqkFF6ih/E4yAGL2LNncA1Zb5L7+3V/ITRHZAvMVoWshtZj9FMmTktDJLzupU9go7oIatZkBrg8+d219ZP0Rko9LvZLh5Xd8crA09fvx0B0K8u2f/56ybQU1Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Subject: [RFC PATCH Hyperlaunch v2] xenconsole: Add connected flag
Date: Thu, 19 Dec 2024 17:32:22 -0500
Message-ID: <20241219223222.2211-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000E:EE_|CH3PR12MB8935:EE_
X-MS-Office365-Filtering-Correlation-Id: e49d25d3-2906-4ec9-ceaf-08dd207d0124
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kURVRQdQh6e+3ir9myjcOTEFayYV1Biqpg7phNqFbTvBz/GpCU5JXvXviE4Y?=
 =?us-ascii?Q?qq2DZ3x4u/WYIrm9T7ES2ZekNpkGy8alY8R9W5i/K4rzbv20iKmh4AWkYRqI?=
 =?us-ascii?Q?NEfYO5iusv3PeJkSXxsa80g8/ejPykoFyyiBE1dtUymqnM2toKnSeXHMRfiv?=
 =?us-ascii?Q?HTnLTq+SQdVMrTDgnWkenhCTqyI8p3fj6mZrMCDdodNRZEc4oKxf70m6Y5cG?=
 =?us-ascii?Q?MNDPl4N+3OPaLzvi4f4XV7trx2g/htKvoxlKwsQtBCQv7wjlxezfyM4rix7s?=
 =?us-ascii?Q?JpIdfhOeHzmLPTtK8jaftBmrd9nIk2K/lnkJTg/lcNoJj9VhUymuTBCx73Ki?=
 =?us-ascii?Q?PMYOihKlXs+KrLybjaBPTfulbtKhr36r9gNUaimDxtKDIwXFrKGo5GKs1aLP?=
 =?us-ascii?Q?BBymGnjLwzhqx9txoQRJL1EWcaVbWnEs7GjQXtnrrDBIt9FJHGtWa00JhQpQ?=
 =?us-ascii?Q?p+kT+U8b3vQ1gm2ItXBxoxxiCovvlLuZOtmxJwOqMG5xaSxNdwxz82jU9TLj?=
 =?us-ascii?Q?h5lqHnUMimVBTbGUU2LR6mcsi1UpwNYhybu34K81dh+EVjKw4PAwe7zeMkj9?=
 =?us-ascii?Q?n6G+xKB/79mTANspPMG7LzhZfJBOO3VdfyxRtE057HBeMIBvqu6IBQKrICC4?=
 =?us-ascii?Q?RYswOdrmisxyufiSztYMU/8AXICceTupgUusGqAocF+WiEYgC3ZlBvekm0IU?=
 =?us-ascii?Q?C/bPgMl7sENSg5fdNtXKeEiB/SYSsO9FKMoc7gM6OU9574qKlcr3aP6q+dk8?=
 =?us-ascii?Q?JV9Xs5CEyS9ONNQpE9zDPsYxTgK0U0xT4yTgZ/2lRDrWqVKgvKVxClVX2XJB?=
 =?us-ascii?Q?tbMJ0q8tRRg1QuEJBCCPXBq7cmBPUlw9mvE9HHS+gGzLN8u9nXD1LCe+HNo5?=
 =?us-ascii?Q?hNtWiiFtkqbvxDUHKP2OChObx36ZkzFHWAFwrV8M9qGn1lzTyJwqTUIyfqjn?=
 =?us-ascii?Q?/tYmYLU9fT6721232L+NsUerSqjH2g6aTBsUvEYBpj0u6xFv3eJmxipcDCFh?=
 =?us-ascii?Q?kbBo+X1eEV8Po5oKIYfUABBl5mKt6yA00FWSJtH3jk7P9Wa6BaAjC19NKq1+?=
 =?us-ascii?Q?RoqPVh1dwTjw8WhQw6knKs+wRwnR+P07busvAG6V+yO5FjXCTumUyUattKI9?=
 =?us-ascii?Q?gccl+T/m8XCgSv0eNTaCyqjef9vmNzXE7qg6eQZGu4DmSYZQHo+dukrVc66V?=
 =?us-ascii?Q?YG6Wm8vS0BsWEeX6ZjDRsEAP4SWgdYahS+lpTHrg8Hmgu9wmRuYNN3ve7HCG?=
 =?us-ascii?Q?fFvIFFs8sGlvXB8W32r+4d6Gx9QPmPfgSVNPATkr+EXnfBk6kREbgHF7djM5?=
 =?us-ascii?Q?QnLcTVZ0heqjgn9FBVQbM615Y8+eZML4cMOb6rtuYRmHby4SDGJO/bF/ZAI4?=
 =?us-ascii?Q?GiYFzhgUAZmeFGpcwkrnCMS+yYuzZGc+3iJ8b7SW8kYmK23BT2AT1b4GdDGN?=
 =?us-ascii?Q?1GM6cwQ42En2r8CgiHCkUr+7keyaGeOjbSmIpFYMnnHQ2hF6cN1H5SKCJ5hH?=
 =?us-ascii?Q?cZ1uIeRoNsZny6c=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 22:32:21.7887
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e49d25d3-2906-4ec9-ceaf-08dd207d0124
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8935

Sending again with an expanded description.  RFC to have a discussion
about the approach.

With hyperlaunch, a domU can start before its console ring is connected
by xenconsoled.  With nothing emptying the ring, it can quickly fill
during boot.  In domU_write_console(), __write_console returns 0 when
the ring is full.  This loops spins until xenconsoled starts emptying
the ring:

        while (len) {
                ssize_t sent = __write_console(cons, data, len);

                if (sent < 0)
                        return sent;

                data += sent;
                len -= sent;

                if (unlikely(len))
                        HYPERVISOR_sched_op(SCHEDOP_yield, NULL);
        }

The goal of this patch is to add a way for the frontend to know when a
console is connected.  This patch adds a new flag to the end of the
console ring structure.  It is used for the backend to indicate that it
has connected and started servicing the page.  The initial value is
XENCONSOLE_DISCONNECTED (0), which matches a zero-initialized page
value.  XENCONSOLE_DISCONNECTED indicates to the guest that ring is
disconnected, so it will not be serviced.

Once the backend (xenconsoled) maps and starts servicing the
console, the flag will be set to XENCONSOLE_CONNECTED (1) to indicate
the backend state to the frontend.

A domU can use console hypercalls and only transition to the ring when
it is connected and won't fill and block.

With the flag change, the backend sends an event channel notification so
the frontend can check the state.  Though this is not strictly
necessary.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
This patch is similar to the xenstore late init in that it indicates
whether the backend is usable.  This patch is not changing existing
meaning of flags.

This does assume that existing frontends are not using the flag space
for some other use.  Also, it assumes zero-initialized memory for the
page used by xencons_interface structure.  Or at least the 32bit flag
value being not XENCONSOLE_CONNECTED.  However, this only matters for a
hyperlaunched guest - xenconsoled will normally readily connect the
console and set the value.

Disconnecting and reconnecting would not be supported.  I don't think
that is supported today, but I could be wrong.  Does soft_reset
disconnect and reconnect, or does xenconsoled maintain the connection?
The backend could set the flag to DISCONNECTED before unmapping on
garceful disconnect.  A crash would not be handled.

The idea of the event channel notification is to let the domU receive an
indication that xenconsoled is connected.  For xenstore, the xenstore
driver owns the event channel/irq and can rebind it.  For hvc_xen, the
hvc subsystem owns the irq, so it isn't readily available for rebinding.

I had the idea for the kernel to use a static key and switch writing
from the hypercall to the PV ring once connected.  It didn't actually
work in my short attempt - I think changing the static key from within
an interupt was wrong.  I fell back to just checking the flag directly
without an optimization.  That would work and would make the event
channel notification unnecessary.
---
 tools/console/daemon/io.c       |  6 ++++++
 xen/include/public/io/console.h | 13 +++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/tools/console/daemon/io.c b/tools/console/daemon/io.c
index bb739bdb8c..2a7ecc6369 100644
--- a/tools/console/daemon/io.c
+++ b/tools/console/daemon/io.c
@@ -731,6 +731,9 @@ static int console_create_ring(struct console *con)
 		con->ring_ref = ring_ref;
 	}
 
+	/* Mark the console as connected. */
+	con->interface->flag = XENCONSOLE_CONNECTED;
+
 	/* Go no further if port has not changed and we are still bound. */
 	if (remote_port == con->remote_port) {
 		xc_evtchn_status_t status = {
@@ -780,6 +783,9 @@ static int console_create_ring(struct console *con)
 	if (log_guest && (con->log_fd == -1))
 		con->log_fd = create_console_log(con);
 
+	/* Notify to check flags field. */
+	xenevtchn_notify(con->xce_handle, con->local_port);
+
  out:
 	return err;
 }
diff --git a/xen/include/public/io/console.h b/xen/include/public/io/console.h
index 4509b4b689..d847aa080f 100644
--- a/xen/include/public/io/console.h
+++ b/xen/include/public/io/console.h
@@ -19,6 +19,19 @@ struct xencons_interface {
     char out[2048];
     XENCONS_RING_IDX in_cons, in_prod;
     XENCONS_RING_IDX out_cons, out_prod;
+/*
+ * Flag values signaling from backend to frontend whether the console is
+ * connected.  i.e. Whether it will be serviced and emptied.
+ *
+ * The flag starts as disconnected.
+ */
+#define XENCONSOLE_DISCONNECTED 0
+/*
+ * The flag is set to connected when the backend connects and the console
+ * will be serviced.
+ */
+#define XENCONSOLE_CONNECTED    1
+    uint32_t flag;
 };
 
 #ifdef XEN_WANT_FLEX_CONSOLE_RING
-- 
2.34.1


