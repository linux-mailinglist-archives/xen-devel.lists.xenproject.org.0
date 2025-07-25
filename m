Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF48B11677
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 04:30:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056866.1424900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf8Cq-0005lb-E7; Fri, 25 Jul 2025 02:30:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056866.1424900; Fri, 25 Jul 2025 02:30:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf8Cq-0005hF-4i; Fri, 25 Jul 2025 02:30:44 +0000
Received: by outflank-mailman (input) for mailman id 1056866;
 Fri, 25 Jul 2025 02:30:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFeG=2G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uf8Ao-0000gX-KV
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 02:28:38 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20626.outbound.protection.outlook.com
 [2a01:111:f403:2418::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1112f7ec-68ff-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 04:28:37 +0200 (CEST)
Received: from BN9PR03CA0607.namprd03.prod.outlook.com (2603:10b6:408:106::12)
 by SA1PR12MB9516.namprd12.prod.outlook.com (2603:10b6:806:45b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 02:28:32 +0000
Received: from BL02EPF0002992D.namprd02.prod.outlook.com
 (2603:10b6:408:106:cafe::fd) by BN9PR03CA0607.outlook.office365.com
 (2603:10b6:408:106::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Fri,
 25 Jul 2025 02:28:32 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0002992D.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 02:28:31 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 21:28:31 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 21:28:31 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 24 Jul 2025 21:28:30 -0500
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
X-Inumbo-ID: 1112f7ec-68ff-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UOXPDk72ANfvIPGHJfGMq+ylzc98siDphFG9s+ZnpL7KPcXtuESZkm9p7AdQl1mcymCahIjftnkV+khnbDdTxqLfFvnfrcTjMrwq5pHJugpp1Vu8He/dLOber5uMqd4MqBQta3UN8Za0q35KP1iY3MrjZ1M4oDnjAGncdY96t7oumbUPobTSgB7+y6WX2/JGJLJSSoOg5VVBy85dLSkXiH0W5+z2sd5R2npCzuE8vybQmCgzy7kDLtlZ4D9zL1cOMYn/zonF1mrDGI0ul3FqgjuwJO6MEqyFwetWej/6lKRp/AV30X0ISJnslSGJI622uIJMlUT2XMEw65H54wBnrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2QNNUmmRfhx/RPaCto+6O8xWC7p6XSqNEoTe97aqWYM=;
 b=TY2vnEAbE5yk5agLLvMwNz3ZwdxE7Q1LpULSMdZJUMJ9gk6LXBQvc2fHO7yTsZLB1MxhxIUdKVrJsc3SrFuogVU6CG3ge/XQdYM7ui98ynhlT7MQWx8G1LrXbE2Ex5ezmWxWsYdR1EO6AiIAa2ikfrjrByXb9Lr8BS9LfUSrA3U6R+S3BXtkVGl/g4Yq71TUnLi28B26npTPzwMm06RNiNJNGVVF9I+kDf4y3is59L71NW4T/urRwGnm0+kPsRmQKxq1mruuYpxJtFw5ssFPOTz0tcJi8DPYwQDgqWBCuQvHlt9u4rPtEkdIZ9nUWeHjYDR0FfTnt3zwPPUbK1mgqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2QNNUmmRfhx/RPaCto+6O8xWC7p6XSqNEoTe97aqWYM=;
 b=P9kdOI5EcI2u+v1Xxdi9+H5JdHcwwpJzI0KWr9AjHjIngkFp+/6Q8z4xFeonMK8t3PLSnb4BI+vYPjgMlNkoQ5dmO9vggBVFoo/XtlIspsHg3Jc+xQJ61sKEjWIFBHayMhEzqWR/uVb6ql7GxgsQORKSaJdaZa6I1tQS8dX8ASU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v4 07/12] tools/xenstored: Auto-introduce domains
Date: Thu, 24 Jul 2025 22:28:07 -0400
Message-ID: <20250725022812.466897-8-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250725022812.466897-1-jason.andryuk@amd.com>
References: <20250725022812.466897-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992D:EE_|SA1PR12MB9516:EE_
X-MS-Office365-Filtering-Correlation-Id: 5da4682e-7dee-4039-2b36-08ddcb22f2c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HA1S54X5vx7I3QOqh7lhknSoU9z5341wmb4m6hze4KBxb2JrGU8v4ahKcB+Z?=
 =?us-ascii?Q?r2D8oiJCjtRGV46cZkeIeZZVkxrm25EjYt3vxNhMnSyYCvMHJjVvN+aSgFQb?=
 =?us-ascii?Q?Ja5hxTzrfm2bZuAeWKPHMbkBJrWddtNFnydOIuyWKeJD53TjYWnMOYeUvHe2?=
 =?us-ascii?Q?bZL62dbLffNwa3ofjtBLsA1qtnlVgWM8rROJ/bw5SrVCDTVGv48ETesjHVZa?=
 =?us-ascii?Q?AIfm3TwFY0GMOms26mDSUdnCsKNXVVGA45tFfbE6jiFN1hu76bss6lpPGG/6?=
 =?us-ascii?Q?WC2tRaoQVMjRAL7yOF42i/mj+Dn4ETrBvy/NS+Y0ZOCBJREKM3r6+Qtwnqjp?=
 =?us-ascii?Q?sCy8iia7B4A0CUVHJ7rsTTrmcLMvVxA4fevWLbTLNQ1yKUVCGHpbwfyd9MnM?=
 =?us-ascii?Q?nbwA4Hbz0FFKC1ESC0Ziicqel4KrBmggHCvISyoB4rZKbHCXb2pZUvQHJrx9?=
 =?us-ascii?Q?BafCXbIrbTNZfzxLmNwdGPL9fIZ2XCQ09KVkTL11s3oLuBLx3A5LykLkkXwW?=
 =?us-ascii?Q?VWigp6/IW+eujnGxS/1YrH110ikBHeJcuNI8+gnxVlKArnsdGz4/7i/MjeXD?=
 =?us-ascii?Q?J3Bz/GT08fbquFvcnqzW7BSq6W0sQtIXcAiYJlwLkI9L2FQhg1PBjPsozXAs?=
 =?us-ascii?Q?vpmRCUMyA542v51ADcq/yEjIqNjVVuy4dG16lqwahdUWNZVhwBhIXArE8EDV?=
 =?us-ascii?Q?Bq8WuvrFJHYire7cGgRfDsFhxTf/nlPkN/zKLVuGefImu4cAssaBJ+zMt0sU?=
 =?us-ascii?Q?DOI8Z+Hqbtg0y4+pzZBDUJk2fCcnqZtT8LAlqn7LseMuQMOoI7SIy/LIEnnl?=
 =?us-ascii?Q?+1+6LNnE35HEotbc+gtOhT68CFqJgWwcooGCxON8KG4z5na9GtT/Doi0gxc/?=
 =?us-ascii?Q?QFHscYCyI1iJwjYfzbn6mX7vNN/qgc3FLy4nt3olkE0ZrI7ev9kHzo+f646B?=
 =?us-ascii?Q?PtI3p+BfTgTwVT5KrlsmMMNXwQdnX8N4vSlPpuYahmsaPiD8cvhtG+Cws1cS?=
 =?us-ascii?Q?e7guhZ7OAccDR3+OlUK6B7FEbFkkTXoUJb1rpZcmdFKe8o3uGdK2RGkRDuCh?=
 =?us-ascii?Q?Z7Vr+IOZTg+AUHvkhjpZT7qgRxN9DuJ3yQJJM1tTN0sk/qJOfNM0bqGXJSXY?=
 =?us-ascii?Q?i2NeBlWW1aWxfuaH9S2dnvcOmS85+Tab7cJuI+s4f8oIjXDt+kwBdJxN8BWO?=
 =?us-ascii?Q?s3QfQLwkFXbZfnffyLKHlOjAruN8R0JjhlZh32F+fuNAXSwGVcc7CrYDnmv1?=
 =?us-ascii?Q?Fr+xh2eXp7Eyx5nVMG7D5it6Cj054wec3Dect59gdOSH835H+eYZKb8bNzXa?=
 =?us-ascii?Q?HJ7j0TfPjSb+WYH0l8dFOe+BVxDqxvE/TPMernsuUXTQcbE9AyclqVITLEFI?=
 =?us-ascii?Q?9uIBUlTZDdVOsxhmoCq5lNzwTpRCB+2+fLrDbwV1m5S7j2L3Kc5O6KIveHn4?=
 =?us-ascii?Q?XhCN1vnjcRgHCutwq1yg+Q4jRZoAy15wytXCl1vV95rZZ19DTsOwUL+ugpt+?=
 =?us-ascii?Q?/JnLVpguCc+YAKuUXmb2N9MWKLpYVhAxkKSQ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 02:28:31.8261
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5da4682e-7dee-4039-2b36-08ddcb22f2c3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9516

Replace dom0_init() with init_domains() which uses libxenmanage to
iterate through all existing domains, storing them in a list.  The xenstore
domain is introduced first, and then all the other domains are
introduced.  The xenstore domain needs to be introduced first to setup
structures needed for firing watches.

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

To support ARM dom0less domains with xen,enhanced = "no-xenstore" a
failed introduce_domain() becomes non-fatal.  Normally,
HVM_PARAM_STORE_EVTHCN is used to identify .

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
I noticed domain_conn_reset() isn't called for the stubdom, so I added
the ifdef to special case it.  I haven't tested with a stubdom yet, and
I wanted to be conservative.  Ideally it would be dropped - the issue
would be if the stubdom queues requests before xenstore is in service.
---
 tools/xenstored/core.c   |  2 +-
 tools/xenstored/domain.c | 83 ++++++++++++++++++++++++++++------------
 tools/xenstored/domain.h |  2 +-
 3 files changed, 61 insertions(+), 26 deletions(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index 37e4dd5a5b..c2f8d20211 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -2757,7 +2757,7 @@ int main(int argc, char *argv[])
 	/* Listen to hypervisor. */
 	if (!live_update) {
 		domain_init(-1);
-		dom0_init();
+		init_domains();
 	}
 
 	/* redirect to /dev/null now we're ready to accept connections */
diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index 1c52254ba8..e9e45ed8e8 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -1280,41 +1280,76 @@ evtchn_port_t get_domain_evtchn(domid_t domid)
 	return 0;
 }
 
-void dom0_init(void)
+void init_domains(void)
 {
-	evtchn_port_t port;
-	struct domain *dom0;
+	unsigned int *domids = NULL;
+	unsigned int nr_domids = 0;
+	unsigned int domid;
+	unsigned int state;
+	unsigned int caps;
+	uint64_t unique_id;
+	int introduce_count = 0;
+
+	while (!xenmanage_poll_changed_domain(xm_handle, &domid, &state, &caps,
+					      &unique_id)) {
+		nr_domids++;
+		domids = realloc(domids, nr_domids * sizeof(*domids));
+		if (!domids)
+			barf_perror("Failed to reallocate domids");
+
+		domids[nr_domids - 1] = domid;
+
+		if (caps & XENMANAGE_GETDOMSTATE_CAP_XENSTORE) {
+			memmove(&domids[1], domids, (nr_domids - 1) * sizeof(*domids));
+			/*
+			 * Local domid must be first to setup structures for
+			 * firing the special watches.
+			 */
+			domids[0] = domid;
+			dom0_domid = domid;
+		}
 
-	port = get_domain_evtchn(xenbus_master_domid());
-	if (port == -1)
-		barf_perror("Failed to initialize dom0 port");
+		if (caps & XENMANAGE_GETDOMSTATE_CAP_CONTROL)
+			priv_domid = domid;
+	}
 
-	dom0 = introduce_domain(NULL, xenbus_master_domid(), port, false);
-	if (!dom0)
-		barf_perror("Failed to initialize dom0");
+	for (unsigned int i = 0; i < nr_domids; i++) {
+		evtchn_port_t port;
+		struct domain *domain;
+		domid = domids[i];
 
-	xenevtchn_notify(xce_handle, dom0->port);
-}
+		port = get_domain_evtchn(domid);
+		if (port == -1)
+			barf_perror("Failed to initialize dom%u port", domid);
+
+		domain = introduce_domain(NULL, domid, port, false);
+		if (!domain) {
+			xprintf("Could not initialize dom%u", domid);
+			continue;
+		}
+		introduce_count++;
 
-void stubdom_init(void)
-{
 #ifdef __MINIOS__
-	struct domain *stubdom;
-	evtchn_port_t port;
+		if (domid != stub_domid)
+#endif
+			domain_conn_reset(domain);
 
-	if (stub_domid < 0)
-		return;
+		if (domain->interface)
+			domain->interface->connection = XENSTORE_CONNECTED;
 
-	port = get_domain_evtchn(stub_domid);
-	if (port == -1)
-		barf_perror("Failed to initialize dom0 port");
+		/* Notify the domain that xenstore is available */
+		xenevtchn_notify(xce_handle, domain->port);
+	}
 
-	stubdom = introduce_domain(NULL, stub_domid, port, false);
-	if (!stubdom)
-		barf_perror("Failed to initialize stubdom");
+	free(domids);
 
-	xenevtchn_notify(xce_handle, stubdom->port);
+	if (introduce_count == 0)
+		barf("Did not initialize any domains");
+}
 
+void stubdom_init(void)
+{
+#ifdef __MINIOS__
 	mount_9pfs();
 #endif
 }
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
2.50.1


