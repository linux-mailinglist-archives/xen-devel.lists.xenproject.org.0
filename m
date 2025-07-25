Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C019AB127BF
	for <lists+xen-devel@lfdr.de>; Sat, 26 Jul 2025 01:59:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058730.1426306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufSKL-0001Xg-Fb; Fri, 25 Jul 2025 23:59:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058730.1426306; Fri, 25 Jul 2025 23:59:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufSKL-0001Rk-7Z; Fri, 25 Jul 2025 23:59:49 +0000
Received: by outflank-mailman (input) for mailman id 1058730;
 Fri, 25 Jul 2025 23:59:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFeG=2G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ufSKJ-0007YZ-1L
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 23:59:47 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20613.outbound.protection.outlook.com
 [2a01:111:f403:200a::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 700ed991-69b3-11f0-b895-0df219b8e170;
 Sat, 26 Jul 2025 01:59:45 +0200 (CEST)
Received: from BN0PR04CA0068.namprd04.prod.outlook.com (2603:10b6:408:ea::13)
 by BL1PR12MB5897.namprd12.prod.outlook.com (2603:10b6:208:395::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 23:59:36 +0000
Received: from BL6PEPF00020E66.namprd04.prod.outlook.com
 (2603:10b6:408:ea:cafe::85) by BN0PR04CA0068.outlook.office365.com
 (2603:10b6:408:ea::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.24 via Frontend Transport; Fri,
 25 Jul 2025 23:59:36 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00020E66.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 23:59:35 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 18:59:35 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 18:59:35 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 25 Jul 2025 18:59:34 -0500
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
X-Inumbo-ID: 700ed991-69b3-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w+gDYA7JrCwrAXH10ErsbD9ixPIhK/S9hSaJKUWApPHYeFuLYAqujcCvmyjdoTk/k/BscR1kausV6vJb1UPCHUdbg6PEplExJiX2853nFNCg/hsaSMJpEI6c+BmruO5vgDqksAIlho12vRleFFmsteyY55A5rvbCh/U15ctKVZ20tT72j+8ewkqRGhqqikzBUbaIn+K149HCbQw0JgJJ7eJXXOOsfXYFTQfJbASHufHR6W4mdM71Wpne1WkDz+tWiVZygZ8b7pqumiorFfq2m3J3y8Tk3QqaSW6mijp7myDv0W1S5uTkWYaUl1cJv7OLkUigY57ouql6FscIUKNHlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bu6qy110dZsnS4i5GXYzfa2hnOIRH0xP9Njjyy2eshE=;
 b=Mv6Pf0g13VUCq0of8tVQlAO94C6eNeQUpDLNwckpVWGNAv2nPmpM1NaD2+drYvXBbVhAAz5T3wY1O0j755d4JaQRdenIvsKT2oKCZbrcTdBAaDFfWHW0xXYCBC8iO9xGHIcpOse0232acHuYeiBEhYnyVsh183YbyxkPiKdNEMwvOkAMu1Kd6ccnEHIy6EdSZ7f+xR0OVhp3eUVjVRSo1FOCvBaB2HNPsuBbjjaQPWMTozy/GtSUwjsX/K2cJktlGXki/GOuS/Ykx/KBJjClEEcJXFXpEEl79Lq2rIoNZxi5v+QJjvo0ovmbqi/Tw4tgOVquTITvM7y2QVkmIZ7R/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bu6qy110dZsnS4i5GXYzfa2hnOIRH0xP9Njjyy2eshE=;
 b=4avj68Vwu5ykCyBHFzxAkkde5WQ5ko6Di5vSxZgC/KQgaJFhjbStc/F8W/g/TE7cnBEaancNgabKzg1sFCW7x0RhJ5qNsrYBxYsguOWAtlQrls609uWKe0/sAjpZTXWIEwocw+w7M75obhd7WEZ2p/CfVIDRIAdNFAA3nuQK6vo=
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
Subject: [PATCH v5 07/11] tools/xenstored: Auto-introduce domains
Date: Fri, 25 Jul 2025 19:58:54 -0400
Message-ID: <20250725235858.666813-8-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250725235858.666813-1-jason.andryuk@amd.com>
References: <20250725235858.666813-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E66:EE_|BL1PR12MB5897:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a119b14-2c6a-4ec5-e52a-08ddcbd74ef4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SzEQ7orWL2nwIJ9CuFMf51OBv6HvKlSApvdCFufsY0lhrIv5lrfaTpt8zAip?=
 =?us-ascii?Q?VrpZQiszgBHqxFC/6cG1rOctF/UOZ7VXGakEK26BePB22e+5NYmClL6SWq66?=
 =?us-ascii?Q?+rtUxI1xM/aKccfNUiCIR7I8Q4NRb61+9Bqs2Cy1tUeqsXfFrvQTbu6Z6naF?=
 =?us-ascii?Q?vntiTp0Pq0e+zv9dkueCbeQTpkYWnGR7qTT+Ek5mNdTBrIQra0D6gCS7umwB?=
 =?us-ascii?Q?ccymryPQKreXQiwSvo53OAx+qXcPJ/j5LHHgGhOmR0n3kxE8hh13RQdbrh+u?=
 =?us-ascii?Q?bcdXpvb4SIagBsYxXf2sAMzGHqebRS698ePRsuLY/RDQ9vExXPewat8h/+6j?=
 =?us-ascii?Q?rsYz/Z72UHzPlf9rhQarrbm8A2GGzSCJSgLbkkC49xT/x5yHvm/C98b3EDNW?=
 =?us-ascii?Q?ofjfYRh3r7bNeISOVJ49+2yA05KmLe6QA2nr81mZfD6eCGNdDbvu43PNk0Dz?=
 =?us-ascii?Q?jHLBO2t+UWyv8lUMjxLDo4bgeyB+i9u+o8bVtado1fglo0okzyoW94it9LsN?=
 =?us-ascii?Q?+zMUTjjF2qfdM1/+hL2kj5pDbmEUz5jFdGpjFHwnLWqBfhPfvYzRc37T0Axq?=
 =?us-ascii?Q?cJibVu0JA3vgNqd5xv/0XnOakcaF5g0o5RFswfpXwtmk3AsJj0+GHeaXeolH?=
 =?us-ascii?Q?4PvLIBAoNXv/p/DBojroTzlyrwzU9+avEvJ7nSYKMIUjWwmFtsJcVS/lHGwy?=
 =?us-ascii?Q?7QJtjcurbIM67va3RwJb4A0xlzlVhWXtXCw0ef/o8oOybP/IRh3TDH2jXzgg?=
 =?us-ascii?Q?Znc/YZT1HJkNPdoklOpFQkqZPk//ShNt99MAUoPhUeqDJ1Uogh5Dal0i73wB?=
 =?us-ascii?Q?KYQMtQ/h/Cmz5MG5HrQRnWr5WA5rhPcIQUv/Pe5ZCuTCVM9DHFp8rcxaEQHR?=
 =?us-ascii?Q?+wzgc4yu64jJO9bGfdDA2r/lF4g1v0ZRbn9DECW7mp2sQYN3N3mIVHuMfh0r?=
 =?us-ascii?Q?qzM+xkSRehmXWRttWBnKoTImMa4v3kV5us/JR9tgEeIbQADCsYxNoIs/1RsX?=
 =?us-ascii?Q?wVcVK3BLf3+eQn206Vcb3yIlwV+4+YoXymtd8vTjnuF18NmfWwXq04oFevuy?=
 =?us-ascii?Q?blDCFz+AjqLHYDfitEieL2xgRBoG3AE9ZfXqvshyHMr2SaR2UvNZq3OXoq7v?=
 =?us-ascii?Q?4NucC8SjuXGqoxzUkXcXPmz6SPWfsbHo/nwJ9SguCoaqjpW4G6wPWci39hiD?=
 =?us-ascii?Q?Z9dX49uKtoHlX+TEhK6yi6SKpqQ1j2t00FA2ZGs781lkng9+NWHzCrS1FgRD?=
 =?us-ascii?Q?J++QhSWO/F24oMbXj0Kd20jZoWrHc9It2mf9Ur/hoHI+APr29QVZ1g5oaO8D?=
 =?us-ascii?Q?R6xM2uBA8bbKw2JLpODEfsqpc2XBE97tiyzWXXSUZ3TfGeu3Z3SvWWGkAey4?=
 =?us-ascii?Q?98tpQ6vaAA+wD5/08hKH1gUGotptBS1UxwIUWitY4b3r3/KRmcbdJKa18MvY?=
 =?us-ascii?Q?iT/lAznK+mDEqLRgQ+p7r1hs2URhzBJJ0FGhJYCChZY6/mb+qM2BSapOAbr6?=
 =?us-ascii?Q?mXr3xtWWjANQMrqSBDxVrTDhcu2xJDqlfk98?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 23:59:35.9109
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a119b14-2c6a-4ec5-e52a-08ddcbd74ef4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5897

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
HVM_PARAM_STORE_EVTCHN is used to identify .

priv_domid from the command line is used, or the first control domain is
used.

dom0_domid will set to the last xenstore found.  This will handle dom0
or dom0less, where only 1 xenstore domain can exist, or stubdom, where
dom0 and dom1 exist, and we want to take the stubdom.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v5:
Add init_domain() helper and call for dom0_domid first outside loop.
Fix HVM_PARAM_STORE_EVTCHN typo
Only take first priv_domid and respect command line setting
Take last dom0_domid
Set priv_domid & dom0_domid default values - bail if both unset
Use talloc_realloc
Remove domain_conn_reset()
---
 tools/xenstored/core.c   |   6 +--
 tools/xenstored/domain.c | 100 ++++++++++++++++++++++++++++++---------
 tools/xenstored/domain.h |   2 +-
 3 files changed, 82 insertions(+), 26 deletions(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index 37e4dd5a5b..dbf3548a8e 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -2564,9 +2564,9 @@ static struct option options[] = {
 #endif
 	{ NULL, 0, NULL, 0 } };
 
-int dom0_domid = 0;
+int dom0_domid = DOMID_INVALID;
 int dom0_event = 0;
-int priv_domid = 0;
+int priv_domid = DOMID_INVALID;
 domid_t stub_domid = DOMID_INVALID;
 
 static unsigned int get_optval_uint(const char *arg)
@@ -2757,7 +2757,7 @@ int main(int argc, char *argv[])
 	/* Listen to hypervisor. */
 	if (!live_update) {
 		domain_init(-1);
-		dom0_init();
+		init_domains();
 	}
 
 	/* redirect to /dev/null now we're ready to accept connections */
diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index 71ab7aaad3..5e53fe8736 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -1251,41 +1251,97 @@ const char *get_implicit_path(const struct connection *conn)
 	return conn->domain->path;
 }
 
-void dom0_init(void)
+static bool init_domain(unsigned int domid)
 {
 	evtchn_port_t port;
-	struct domain *dom0;
+	struct domain *domain;
 
-	port = get_domain_evtchn(xenbus_master_domid());
+	port = get_domain_evtchn(domid);
 	if (port == -1)
-		barf_perror("Failed to initialize dom0 port");
+		barf_perror("Failed to initialize dom%u port", domid);
 
-	dom0 = introduce_domain(NULL, xenbus_master_domid(), port, false);
-	if (!dom0)
-		barf_perror("Failed to initialize dom0");
+	domain = introduce_domain(NULL, domid, port, false);
+	if (!domain) {
+		xprintf("Could not initialize dom%u", domid);
+		return false;
+	}
 
-	xenevtchn_notify(xce_handle, dom0->port);
-}
+	if (domain->interface)
+		domain->interface->connection = XENSTORE_CONNECTED;
 
-void stubdom_init(void)
+	xenevtchn_notify(xce_handle, domain->port);
+
+	return true;
+}
+void init_domains(void)
 {
-#ifdef __MINIOS__
-	struct domain *stubdom;
-	evtchn_port_t port;
+	unsigned int *domids = NULL;
+	unsigned int nr_domids = 0;
+	unsigned int domid;
+	unsigned int state;
+	unsigned int caps;
+	uint64_t unique_id;
+	int introduce_count = 0;
 
-	if (stub_domid < 0)
-		return;
+	while (!xenmanage_poll_changed_domain(xm_handle, &domid, &state, &caps,
+					      &unique_id)) {
+		nr_domids++;
+		domids = talloc_realloc(NULL, domids, unsigned int, nr_domids);
+		if (!domids)
+			barf_perror("Failed to reallocate domids");
+
+		domids[nr_domids - 1] = domid;
+
+		if (caps & XENMANAGE_GETDOMSTATE_CAP_CONTROL) {
+			/*
+			 * Only update with first found - otherwise use command
+			 * line.
+			 */
+			if (priv_domid == DOMID_INVALID)
+				priv_domid = domid;
+		}
 
-	port = get_domain_evtchn(stub_domid);
-	if (port == -1)
-		barf_perror("Failed to initialize stubdom port");
+		if (caps & XENMANAGE_GETDOMSTATE_CAP_XENSTORE) {
+			/*
+			 * Update with last found.  dom0 or dom0less will only
+			 * have 1 domain.  stubdom there will be dom0 and dom1,
+			 * so this will take the second for stubdom.
+			 */
+			dom0_domid = domid;
+		}
+	}
+
+	if (dom0_domid == DOMID_INVALID)
+		dom0_domid = priv_domid;
 
-	stubdom = introduce_domain(NULL, stub_domid, port, false);
-	if (!stubdom)
-		barf_perror("Failed to initialize stubdom");
+	if (dom0_domid == DOMID_INVALID)
+		barf("Could not determine xenstore domid\n");
 
-	xenevtchn_notify(xce_handle, stubdom->port);
+	/*
+	 * Local domid must be first to setup structures for firing the special
+	 * watches.
+	 */
+	if (init_domain(dom0_domid))
+		introduce_count++;
+
+	for (unsigned int i = 0; i < nr_domids; i++) {
+		domid = domids[i];
+		if (domid == dom0_domid)
+			continue;
 
+		if (init_domain(domid))
+			introduce_count++;
+	}
+
+	talloc_free(domids);
+
+	if (introduce_count == 0)
+		barf("Did not initialize any domains");
+}
+
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


