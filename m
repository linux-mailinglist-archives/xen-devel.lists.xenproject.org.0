Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33922B07F72
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 23:22:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045786.1416067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc9aH-0001Lw-Pt; Wed, 16 Jul 2025 21:22:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045786.1416067; Wed, 16 Jul 2025 21:22:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc9aH-00014q-1J; Wed, 16 Jul 2025 21:22:37 +0000
Received: by outflank-mailman (input) for mailman id 1045786;
 Wed, 16 Jul 2025 21:22:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XbuO=Z5=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uc9aD-0007F2-VB
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 21:22:33 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2417::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa61cd11-628a-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 23:22:30 +0200 (CEST)
Received: from BL1PR13CA0306.namprd13.prod.outlook.com (2603:10b6:208:2c1::11)
 by MN0PR12MB6079.namprd12.prod.outlook.com (2603:10b6:208:3c9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.36; Wed, 16 Jul
 2025 21:22:25 +0000
Received: from MN1PEPF0000F0E5.namprd04.prod.outlook.com
 (2603:10b6:208:2c1:cafe::3e) by BL1PR13CA0306.outlook.office365.com
 (2603:10b6:208:2c1::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.12 via Frontend Transport; Wed,
 16 Jul 2025 21:22:25 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0E5.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Wed, 16 Jul 2025 21:22:25 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 16:22:22 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 16 Jul 2025 16:22:22 -0500
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
X-Inumbo-ID: fa61cd11-628a-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WOBLu/ZUfnszltdA6l9fKOGUXV6Pwh9defYDPyfo58Wjy1ifZJ6JN/4LRCjECOTgq2PLW4pgUYgOtMHWI+bVheR1kcvFP3YrBRV61f9tdSiFt/Le8ge+nDvsMj4aLfHUYaLLOadwx453FZOkD8CIfPHv/L1qX6CgvKsP70VFRAk01guCzNtMf84zY+cqENlQJaDdGtpKIvxiB5P2isRnWaRF5H2ge8BD1U3Myx2UR/7OVJB9cXM0Ia6/em/z0FwzKNtypJYvZfnCmhPy6rZdh6gz0QPIVcRkqi/9fTmPJZYowQelRixBa+o80fl/0sOdu4B2kzHWIfpw3L7o5uC01w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jKTqt/XXb9MSRAqj6LYolQnFov3cpGRvILaAGq8Cm1E=;
 b=AlL0x/LZurgHbvWXPj1QWfktWyeJhRPA9wVFbuTJAJ/PZIQRh9QXrQJonUeMG419hwUyj9B7u00obvYkjfzIKUEB5natFx4qAm9ePAS9NjQQWrbSesqwoGe6w5txgPAibBHzwymumKegPwHAkYUhkkv0ot7NgQZwxdR6iYceNuMdjy2LEqtUPTRGpo5AKWQZP49JeG+9IV60E6C4vJoMxVTi14JtNXloyn0MS0DCOcvhH0tJOHzqDQ0nh5rAccOJNWpdNUzajqcyJJL4nq8hnLma6bSplVQnjWtFjVP4uX0ftiFUR/pbtrldU+xTgP6pDOAtJgMNVxrlqWiyIkkzng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jKTqt/XXb9MSRAqj6LYolQnFov3cpGRvILaAGq8Cm1E=;
 b=2VH9HUvJ7I/BBNYTtFsCROijXLGNH58BpFzfTVPt0DXUanLqJlMdawC8vscIYqLwJR82lbd+LbwB+GgZ6tHRQlxIIYkvSytM2cglsmoLnzFdcDxv7qYGW25HwT7t4/IrkzEinnZEuo8iH3nT6eUP6+f7xoEB4yzBpBiY0fRJ4sM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2 14/17] tools/xenstored: Auto-introduce domains
Date: Wed, 16 Jul 2025 17:15:01 -0400
Message-ID: <20250716211504.291104-15-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250716211504.291104-1-jason.andryuk@amd.com>
References: <20250716211504.291104-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E5:EE_|MN0PR12MB6079:EE_
X-MS-Office365-Filtering-Correlation-Id: 33c96407-6c0a-4c4e-92ce-08ddc4aedc7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JfF6xpsCt83X4+nI66lj6LDBpm619yQIHgJRN3QFJF5Bp5jEG3KHJjFh0Poi?=
 =?us-ascii?Q?q46DhRJsB3/OE8h9jpun9F3ZD3Onq3QvrSQhVMZ7FIvFlocG6z70Av9+d+jA?=
 =?us-ascii?Q?tz+60TV2ThpgvQ92tDPON6o+C35TfW0gpGXuMzABT/x1ke7XxYi0NRYshYOj?=
 =?us-ascii?Q?1C+h0YaJC4cJePtUpTE7nWLXrTcz3xQx1qKydVB7KP2r0gSE2ACvejYTTZtT?=
 =?us-ascii?Q?nu+l7BmsSNWDMAIPbAZQDWXI7AbiHriI2xdF2VQcTbQefGzYPYY69kjOlPrb?=
 =?us-ascii?Q?bknZJuhyxxuOcyph6PXEGi8/Vsevar2Ausc/JwwSn120rLXKqhzVbUQ67PrG?=
 =?us-ascii?Q?vorgJrPJmSIgEalkSPA12v6LOnaLRTgtM82AHq1dZsQYTM4zx7Jq81POtjBo?=
 =?us-ascii?Q?Y9Fezz41an/NWplWYKGkfbGoVB39oI7qZjusVJC1ljGqFuqn7CnFreW8OZKd?=
 =?us-ascii?Q?y8gcrI8MBx7FZIlpn43BiVQyFfHk8iAQPFwkXRRZ9F4p1X8ljoYbSLDLLOLv?=
 =?us-ascii?Q?WWWWETj8WJWHP7qJgJmzPpVRKaq2tIYKXkNPNUe1sghiwpJvhDCkR9p2leFu?=
 =?us-ascii?Q?yPQbe6arb+7j/NmcEE/W6o2GKxErlGOMvW4t7fpO39wbNVqV7mUyek3HWr5K?=
 =?us-ascii?Q?9ArtTOCFxF1OrQPt/0RbVri2mponj1isIzNszf5P2druQsoIUNGOjfwu1Ade?=
 =?us-ascii?Q?9SOugkcsI4T/S9At4jusOXtjd6RsqjbiRRBdgxStBLUBs1kY0NT+f9mQnINr?=
 =?us-ascii?Q?7sj33bJ2j5ondYPgiycxKOtH5wi/1l7l7aiQEOfLyt0wFx3BoHxKdTXxnJ9c?=
 =?us-ascii?Q?JFWxJ/AmUM1GyRWjj1UQJdi76+bEWs/oUnZ7g0kasN2p5ejJDNgZk0hHm/+r?=
 =?us-ascii?Q?hF+HPgicEt6q95rlZqTzVI7WTHdEKWg+pAY/kMSoganTpyxuIfXf6G3NXTKX?=
 =?us-ascii?Q?vFlDQcCSEDw+FP8ZPRogtfT8SnIWv/KWFIJtxZqd5TxkGiO1PMIdyniLKKEw?=
 =?us-ascii?Q?NK1Ix8VvqGkN5wBR1eoO+9YRYDMk+vlk+1uV3hUjNK2ey/xgM/MFUxdsBi02?=
 =?us-ascii?Q?/2S70MZoI+g3neFZXt9ZbYhICLyJW2D47Z/w8sj+ShrjJ0Jq1HMWFI/623/n?=
 =?us-ascii?Q?vW4bAcVeTjs3vAFZ53vMUqyNDdjvVyR4gY+T34zW1A52xDxHxd6xE1GwPrK0?=
 =?us-ascii?Q?r0pUUYyNrerXXtR6Y1dMn0824a8aDx7G4xhTgt3f6WlTyrSNnaitxCv0TOgy?=
 =?us-ascii?Q?VNQlZsMz4O8i253654N3XvELuoMKx2McLl7L3FyzM75mV+dt3ujWHarOJDBK?=
 =?us-ascii?Q?j3ovhCC/qUUyCbwvsfO1TtoIkhcCJny0jvkhRtxfM3Ng7xjJ8KnWRtQ4IIYa?=
 =?us-ascii?Q?pwIOQkpXvpkALKUY7oHGe4TABEF7vPzdx8DupxAfGdRNvX+BiCDWkAcbG4eP?=
 =?us-ascii?Q?1hYNms/E+J4aJGzR21KuVJ3+xYK8l7KMMUdQlOcj84pLqm32bN1YkDzDysss?=
 =?us-ascii?Q?L6G+8g552RmCdvdfgszonuhXDLnzDzny2Ll9?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 21:22:25.8383
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33c96407-6c0a-4c4e-92ce-08ddc4aedc7b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6079

Replace dom0_init() with init_domains() which uses libxenmanage to
iterate through all existing domains and introduce them.

dom0_domid is updated with the xenstore domain, since it really
indicates the local domain.

priv_domid is set to the control domain.  This makes it limited to a
single domain.

These features let xenstore automatically connect any existing domains,
which means it doesn't need to be done manually from init-dom0less.

For a legacy dom0, the result should be unchanged.

For a late xenstore stubdom it should also be the same, but priv_domid
would be set automatically to control domain (which default to 0
normally).

Always signal the event channel for initial domains.  This gets dom0 (a
local xenstored domain) to connect.

Also always write XENSTORE_CONNECTED since we know we are connected at
this point.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 tools/xenstored/core.c   |  2 +-
 tools/xenstored/domain.c | 45 +++++++++++++++++++++++++++++++---------
 tools/xenstored/domain.h |  2 +-
 3 files changed, 37 insertions(+), 12 deletions(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index 550e879a00..835402af81 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -2762,7 +2762,7 @@ int main(int argc, char *argv[])
 	/* Listen to hypervisor. */
 	if (!live_update) {
 		domain_init(-1);
-		dom0_init();
+		init_domains();
 	}
 
 	/* redirect to /dev/null now we're ready to accept connections */
diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index 5443b4e608..44e997cee4 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -1257,20 +1257,45 @@ const char *get_implicit_path(const struct connection *conn)
 	return conn->domain->path;
 }
 
-void dom0_init(void)
+void init_domains(void)
 {
-	evtchn_port_t port;
-	struct domain *dom0;
+	unsigned int domid;
+	unsigned int state;
+	unsigned int caps;
+	uint64_t unique_id;
+
+	while (!xenmanage_poll_changed_domain(xm_handle, &domid, &state, &caps,
+					      &unique_id)) {
+		evtchn_port_t port = 0;
+		struct domain *domain;
+
+		if (caps & XENMANAGE_GETDOMSTATE_CAP_XENSTORE)
+			dom0_domid = domid;
+
+		if (caps & XENMANAGE_GETDOMSTATE_CAP_CONTROL)
+			priv_domid = domid;
 
-	port = get_xenbus_evtchn();
-	if (port == -1)
-		barf_perror("Failed to initialize dom0 port");
+		if (domid == dom0_domid) {
+			port = get_xenbus_evtchn();
+			if (port == -1)
+				barf_perror("Failed to initialize dom%u port",
+					    domid);
+		}
+
+		domain = introduce_domain(NULL, domid, port, false);
+		if (!domain) {
+			xprintf("Could not initialize dom%u", domid);
+			continue;
+		}
 
-	dom0 = introduce_domain(NULL, xenbus_master_domid(), port, false);
-	if (!dom0)
-		barf_perror("Failed to initialize dom0");
+		domain_conn_reset(domain);
 
-	xenevtchn_notify(xce_handle, dom0->port);
+		if (domain->interface)
+			domain->interface->connection = XENSTORE_CONNECTED;
+
+		/* Notify the domain that xenstore is available */
+		xenevtchn_notify(xce_handle, domain->port);
+	}
 }
 
 void stubdom_init(void)
diff --git a/tools/xenstored/domain.h b/tools/xenstored/domain.h
index 844ac11510..6a78f06935 100644
--- a/tools/xenstored/domain.h
+++ b/tools/xenstored/domain.h
@@ -84,7 +84,7 @@ int do_reset_watches(const void *ctx, struct connection *conn,
 
 void domain_early_init(void);
 void domain_init(int evtfd);
-void dom0_init(void);
+void init_domains(void);
 void stubdom_init(void);
 void domain_deinit(void);
 void ignore_connection(struct connection *conn, unsigned int err);
-- 
2.50.0


