Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A43B5B287C4
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 23:36:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1084085.1443517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un25j-0005kw-GQ; Fri, 15 Aug 2025 21:36:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1084085.1443517; Fri, 15 Aug 2025 21:36:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un25j-0005i8-D0; Fri, 15 Aug 2025 21:36:03 +0000
Received: by outflank-mailman (input) for mailman id 1084085;
 Fri, 15 Aug 2025 21:36:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IuPz=23=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1un25h-0004xK-N8
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 21:36:01 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061a.outbound.protection.outlook.com
 [2a01:111:f403:200a::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d499c129-7a1f-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 23:35:59 +0200 (CEST)
Received: from MN0PR04CA0019.namprd04.prod.outlook.com (2603:10b6:208:52d::33)
 by IA0PR12MB7723.namprd12.prod.outlook.com (2603:10b6:208:431::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Fri, 15 Aug
 2025 21:35:54 +0000
Received: from BL02EPF00021F69.namprd02.prod.outlook.com
 (2603:10b6:208:52d:cafe::ff) by MN0PR04CA0019.outlook.office365.com
 (2603:10b6:208:52d::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.19 via Frontend Transport; Fri,
 15 Aug 2025 21:35:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00021F69.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Fri, 15 Aug 2025 21:35:53 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 15 Aug
 2025 16:35:53 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Fri, 15 Aug
 2025 14:35:53 -0700
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 15 Aug 2025 16:35:52 -0500
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
X-Inumbo-ID: d499c129-7a1f-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HSqN9e8Zd3XQXuZ2+Um6F2v+huF+EF1zooBN9VK4UzTrpHpR44L74Em3NtL8CAowAnIwMUAEn2Sc2GsAmWWY6my+ga//WBdMjaNH7/BUNvz/IMrnNvvp25xXiBvFZI+rBMdIT2ps/KQJC6N/s/mFSTAYVzudPrNjftfkU08WjlTy8cOmQcmo0OnDd0OPZJVmehg/OBdF5xDPsmEYur/PBgXJKcFV5YcTvk93ktaKiu349Z13nmqD6OtnMh4TPfVe09PEQm108r1jZtzgKAuh//6Xg0tvmY50UCJADFp+jHcZRcfhFvFnpyaDZr0Hik2zKBvMkF9xXfFMMF1gds2hBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y9OMkaeEj/AsuDXHj8i2+xAiSM5DDL4gA9WvTiPcZo4=;
 b=ttZQWWyAxvb1NH1m8pwCOy6XbiKd9R4495Le8YkD6USnXRFsEhksOjJNCgbeHCCHH1oJXkxFXVCKkCeNqkKnM0wayPH5Oajp0pcjlDu1ycmdMKnac1zuH4YtcAuRRX6S7TMTN+nHycGv2J0/Vv1XP9HrbXsqU50xtLcpi5cWMfGMFchSw/igo9VgeHG65VczbALb4G8RwffUcCkkQ3VxqnCthx5iUWR3gtJ8iVLE/rbQ4tuHE/BXPt0tcsKxaGfniaF86uIyEnVcOGLV29F0nw/SrYeWwKfqVEuIql0U8SUuEKFzT5wFmGtT3YvIFIIHtg+g/BTSeB3CpmIE4Z4ppw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9OMkaeEj/AsuDXHj8i2+xAiSM5DDL4gA9WvTiPcZo4=;
 b=ie3xYLNI998GwocH2nlKH4UFWwXqAmlgdSRcz7gztgwmBzi9zC76CYJh9doXQShval65xIh9waNAZcP48XtZajnFXhgXYAlYyT2X4qMHn8vp856z128DFRk6lh60SOt4P+Ndfj3aZ4v7JYJXs9aMCETBf7R2w4S/H+8GnIx2q0Q=
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
Subject: [PATCH v6 3/8] tools/xenstored: Auto-introduce domains
Date: Fri, 15 Aug 2025 17:35:51 -0400
Message-ID: <20250815213556.90068-4-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250815213556.90068-1-jason.andryuk@amd.com>
References: <20250815213556.90068-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F69:EE_|IA0PR12MB7723:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d4b6c8b-800a-4dd4-2782-08dddc43b683
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SrVyB97rxNylzhm8pykIfhpSf47iObKdpP9v0bMqDvp/9Y5eoaSJUPQOcyoG?=
 =?us-ascii?Q?JtuJw7Pxpz0xJj3HdLBgcSehTEGVeNJXk4+dkxYmhGiQHukLanXB8NoVTFhg?=
 =?us-ascii?Q?9b0Kj1jp0TxRi2jOhad/aR7/4l8poejVEjw42JRWU51ushTlLQghM7A2PXfJ?=
 =?us-ascii?Q?5mtUQ8oq3ocIzFLww0Bj2hzlxa337M1Ur+qtwIPzHAvfDzBwdoHtIu6M0RKA?=
 =?us-ascii?Q?qxVa9kt3k61+UdnDnTooZCxzrOw3Za94sy5ad13pN91eBEBzNRATT9VevdSn?=
 =?us-ascii?Q?GNfKjWSmhR24F1+1S6+F/L9DcWkqjLu1WuAdmg2mGyKE6v00/SK8fSEAzkDi?=
 =?us-ascii?Q?gTW3uzlySaFBq77Ti/OazVdwY9xdrH5plG9F8Svko4dvlxnGyoATOj/nZn0O?=
 =?us-ascii?Q?d1D4EFgBHXzk/vW0M3YsgmJ7wzaiibBtgmvYws8FDrvXNaXDKhA6gn+GRQJM?=
 =?us-ascii?Q?/eZf2qyyUqEwh2fpgtoEAvMzjI+D5dmO3QRzVcZVilCGAt8sATZM07Zg4EF/?=
 =?us-ascii?Q?xUpPnI7BFkG7uAVOwLS6vKX0DsATh05ArOxKQtLW/cDOaniLRptUfgOsznq5?=
 =?us-ascii?Q?Zh3340VOKDNBypnkEtghwziGA0JMYFJEbyEboUA02Nv0yRhEqTK/mi4Ft5+h?=
 =?us-ascii?Q?SyZ2WKs7yusfS306tj6m7q4JYrWTNHGv+zNwmQ5HIzrmAMmmxY9ba+B4ZhFB?=
 =?us-ascii?Q?Xy04eB3kXpibjcfGfRnlsSj6Ejm0S1A11qFxEeknudbShYRF69OBzEWXhiX1?=
 =?us-ascii?Q?egLqN75/bbZWflExPCk9ue+3Vt5Rotrr9OBVed3B/x1yTbE3fQ3W9L+PunDF?=
 =?us-ascii?Q?1QrkfREUUG1C26gLV1DM+bESxDY2xjIoYhfZiDttLyFSXnuJF/yO5Oakr1Od?=
 =?us-ascii?Q?MMVKHTzPzuOuhOj/ADtd3x5JbIPYTz6rtPLSB8Bchq+zi6EVYPGB8jg1F+uN?=
 =?us-ascii?Q?eFuPXwXL0Bk64oi6UeUtk+rsLT7Rwtc838JxxN1cj1LPqDhRjBxUDp3EFNwN?=
 =?us-ascii?Q?hmZqkfqMhvyrh2Iw+SinVRBJfR1/+thva6KXuXE9jonJMZkXThOgwqLw4bjk?=
 =?us-ascii?Q?Tgu7WS0XEjSlLihPmTenPdGQN1hPIZ226OZUm4NMbHw56fCTEVhUX2CS4nHg?=
 =?us-ascii?Q?ZgKv2uw07iUE1+k9IkI69+gx8L8jSHc4UmGf/M38vnQ8XvdKzOCYzA+zUWyH?=
 =?us-ascii?Q?jaxi7cRTBBWr+6e/6zfpCNqdjdvqNYuEKgmnxohgP40ofpKckWIFDL+LOiRY?=
 =?us-ascii?Q?NCFIdFbObUwswAOptUT/HAc3GUh2KlxDzVWCwuqi3OvJ/+VAtbfxjgOjUnJD?=
 =?us-ascii?Q?nRN9O/m5yihwzlT8WFxSnRQsGSZ+SH9NTJt5sSfalcjJISLtb+i7Bw7GFOV/?=
 =?us-ascii?Q?QPJtIPlgmC4wLQVzUbbjbdQg3XKjUPBqRfwML1OdpZQNx6rA103CkKIw3v3u?=
 =?us-ascii?Q?3zN2qPSIgugyFXfNqxgvJp1Dvwvn9tjzfRJ8DmHS4axD99MTU8b/1gukXoOk?=
 =?us-ascii?Q?0YHn4eP+77y4IuOD1fZPAsWYoR4Y026Tuncz?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 21:35:53.9000
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d4b6c8b-800a-4dd4-2782-08dddc43b683
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F69.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7723

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
Reviewed-by: Juergen Gross <jgross@suse.com>
---
v6:
R-b: Juergen

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
 3 files changed, 81 insertions(+), 27 deletions(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index 5377d72f54..d447e1167e 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -2567,9 +2567,9 @@ static struct option options[] = {
 #endif
 	{ NULL, 0, NULL, 0 } };
 
-int dom0_domid = 0;
+int dom0_domid = DOMID_INVALID;
 int dom0_event = 0;
-int priv_domid = 0;
+int priv_domid = DOMID_INVALID;
 domid_t stub_domid = DOMID_INVALID;
 
 static unsigned int get_optval_uint(const char *arg)
@@ -2760,7 +2760,7 @@ int main(int argc, char *argv[])
 	/* Listen to hypervisor. */
 	if (!live_update) {
 		domain_init(-1);
-		dom0_init();
+		init_domains();
 	}
 
 	/* redirect to /dev/null now we're ready to accept connections */
diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index 0866e04aa9..051e3fd164 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -1325,43 +1325,97 @@ const char *get_implicit_path(const struct connection *conn)
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
 
-void stubdom_init(bool live_update)
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
+
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
 
-	if (!live_update) {
-		port = get_domain_evtchn(stub_domid);
-		if (port == -1)
-			barf_perror("Failed to initialize stubdom port");
+	if (dom0_domid == DOMID_INVALID)
+		barf("Could not determine xenstore domid\n");
+
+	/*
+	 * Local domid must be first to setup structures for firing the special
+	 * watches.
+	 */
+	if (init_domain(dom0_domid))
+		introduce_count++;
 
-		stubdom = introduce_domain(NULL, stub_domid, port, false);
-		if (!stubdom)
-			barf_perror("Failed to initialize stubdom");
+	for (unsigned int i = 0; i < nr_domids; i++) {
+		domid = domids[i];
+		if (domid == dom0_domid)
+			continue;
 
-		xenevtchn_notify(xce_handle, stubdom->port);
+		if (init_domain(domid))
+			introduce_count++;
 	}
 
+	talloc_free(domids);
+
+	if (introduce_count == 0)
+		barf("Did not initialize any domains");
+}
+
+void stubdom_init(bool live_update)
+{
+#ifdef __MINIOS__
 	mount_9pfs(live_update);
 #endif
 }
diff --git a/tools/xenstored/domain.h b/tools/xenstored/domain.h
index 3ca702f56d..3b1fce74cf 100644
--- a/tools/xenstored/domain.h
+++ b/tools/xenstored/domain.h
@@ -92,7 +92,7 @@ int do_set_feature(const void *ctx, struct connection *conn,
 
 void domain_early_init(void);
 void domain_init(int evtfd);
-void dom0_init(void);
+void init_domains(void);
 void stubdom_init(bool live_update);
 void domain_deinit(void);
 void ignore_connection(struct connection *conn, unsigned int err);
-- 
2.50.1


