Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 524EAB287C2
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 23:36:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1084084.1443505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un25g-0005M4-8A; Fri, 15 Aug 2025 21:36:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1084084.1443505; Fri, 15 Aug 2025 21:36:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un25g-0005Fz-3r; Fri, 15 Aug 2025 21:36:00 +0000
Received: by outflank-mailman (input) for mailman id 1084084;
 Fri, 15 Aug 2025 21:35:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IuPz=23=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1un25e-0005Bt-Va
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 21:35:58 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20607.outbound.protection.outlook.com
 [2a01:111:f403:200a::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d444bda3-7a1f-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 23:35:58 +0200 (CEST)
Received: from BL1P223CA0044.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:5b6::17)
 by DS7PR12MB8081.namprd12.prod.outlook.com (2603:10b6:8:e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 21:35:53 +0000
Received: from BL02EPF00021F6E.namprd02.prod.outlook.com
 (2603:10b6:208:5b6:cafe::29) by BL1P223CA0044.outlook.office365.com
 (2603:10b6:208:5b6::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.19 via Frontend Transport; Fri,
 15 Aug 2025 21:35:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00021F6E.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Fri, 15 Aug 2025 21:35:52 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 15 Aug
 2025 16:35:51 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Fri, 15 Aug
 2025 14:35:51 -0700
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 15 Aug 2025 16:35:51 -0500
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
X-Inumbo-ID: d444bda3-7a1f-11f0-a328-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t1BpfoxercyfzxMEQduwjJEPQwlgMHC4Bj2K4tOiAYikcaNQjl/YXl+Ex0maBkJMI68SG4V5g1pJv89qF2Gkg6j7kQJ0Uk0k9NQ0RCydF8uaKqLNYbQZKTKGzM9I/GrJcw/rDZ4X6CASid6/2ZJ/l+X5p7pHEGWMvmEBrLGlHBCyoSwVZgBSnjwPWNYbvyTEnV/6TU25sEqLFUIjgC9zV/8XgDDyr2yGR5lcGYCWKLD4+0snFo9OK1O2pxI8Iv1jyVi324j1C/+QAZ6yx4jv8FBz++kM0G/PIW8iLCtH4BVoG15UHEDv6kFHfKPlwguTaR0nC8dlqyNtAVlHIx/XSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yAfHh+BbqPgNLnkNywYk6LkBNqhFeDrqPgFaeMFhZ5E=;
 b=jJvgVoDBUeJK23iJ0hq3BApxZYgbBMeKsULPWRxwvaKYiqSecttPc/vOtRwLa1vYRNHO3mRZysxpSNfiVUTRXjv6+B0/bY+nMPUFKAysD5uBzLsch8lSX/0zTc8+nriYXe+/mpQg4vSGQ5s+Sr2KpwB//aGfUVJ53hTqlOoTUYKXU5DS9s63X0B0dXYAZSNZsFNTZL2WESFDfr8dPUokb4PLhInFwH752wob5e352yG2krNdWQHbzkXwhlgw5A02cG4lwxp7jdXJ1GpGK4pC1gPc96UskNHF/iaLIlPu3CwEqFx0oQ3eXENom2K4o021+RV8S71039O76SbuFkFZsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yAfHh+BbqPgNLnkNywYk6LkBNqhFeDrqPgFaeMFhZ5E=;
 b=s8oP1BYSLzAGBWiHFD1sPKIpZ5e4+IIKdMg7G+IhSpxNEKUsvTecGWGtZfaYwwwrq+eq4cPsYCv3AcUhS2LCJnuLtkEaLLQoaV7RWK2y55KQEsYGpcAgYaCnn+whszmBXax2p5L9Ukmo/VKTPh5m9fCCm79GBWeI20/AEQzV29g=
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
Subject: [PATCH v6 2/8] tools/xenstored: Add get_domain_evtchn() to find evtchn
Date: Fri, 15 Aug 2025 17:35:50 -0400
Message-ID: <20250815213556.90068-3-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250815213556.90068-1-jason.andryuk@amd.com>
References: <20250815213556.90068-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6E:EE_|DS7PR12MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: f62508f5-f0c0-4395-3c89-08dddc43b591
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AD6TJ7uTY52ynfyrXbMFj5X/k3R15bF8SvFBhA+ziofY83s2DDvQluND/+93?=
 =?us-ascii?Q?PZ8g9TnLWG6aq1gblk/O8AtJYeqzkdPwNjlXtHrR4ncqqzeOugpKes6b5gah?=
 =?us-ascii?Q?C6t96fo3s8DDQ262+oenmm1UMv+6YOvNRAe3jxxMeOc3OLnSIxmd9MIfA4YE?=
 =?us-ascii?Q?e78KtybvsaeMd8wAZR/iY8DzI+3QuYMT1MW7rbPttP7SdY8RPtb+l60rh16q?=
 =?us-ascii?Q?okwrHd1ZAmnNzd7c1CV2myudRrEy8uDxO1sV1TRIvncfV2dsngQmUiFXx9ea?=
 =?us-ascii?Q?ZUKuOL60xw9BREshS45O+8pyJTDsdwSrUWVRyJSHp98YHs/3ArSSooBJaaOR?=
 =?us-ascii?Q?aak8bvKzDZvVW9VscAo2XsfjflvnVHDKoTa1H5NeRQphlTI2v1K7JTmy8XtB?=
 =?us-ascii?Q?tV9nP3NOut963Gi4olhUn0c1yLce54HuytFRLHjiQBM0CF1WaXoYfVMDWbDO?=
 =?us-ascii?Q?2MWpbs8OUxMNWQtWLABAEHC42dZpwAZFDUXhDBsygrN3V3VzMNxMlxPkvTzU?=
 =?us-ascii?Q?HFl0NWgP74R8HxBcZiBZfU76gGcTjWHnZqFF2FfYo0+QZa8y9k19NTbd9s8f?=
 =?us-ascii?Q?avFsZR49uHeTfhmFXO/vqNstz6syelU4PVIREsWWAjwaxBXQWwiN+9bP9DO3?=
 =?us-ascii?Q?Xy1E6flO0sC/6pps/U3x2s4WtvFSmiSAw536fKP5CWcD3SMibMaxYKnwr8gU?=
 =?us-ascii?Q?8KiKXOaQgQfY3faetOIYkwc4+N/jbPYCqCQkpvVK7AzveakckEiFDYGMnM7m?=
 =?us-ascii?Q?8dbXUUzSO2C2OoZwonyNR/a9uZSJB8KMBhf8jE+A/V4cPjcUEwNhezU4X+ic?=
 =?us-ascii?Q?TicoPigS3LkZgOOq6BdVaB5qlnaNlAp9N4DYIXAP8rYASdz/+ErshL7ocj47?=
 =?us-ascii?Q?KUNMrMefNc1v3ogTu5eUpv7N11ZkaUZHpZlEN2yUbzNJgFIwZh4WEzIgL8V/?=
 =?us-ascii?Q?0EAeXzm1srnq01Cb3o0/Nt3/XeIMqw3IdSsDvWUPjJN/sN4K5Bp8MJ7Ghk4z?=
 =?us-ascii?Q?OWxAjp07eemf66b7kZB25L7PgBK9sBHmds7BjCgQLCI9k1oFrUFnx17JCLNF?=
 =?us-ascii?Q?POc78zKp2PqAeAwtNBctRjVRLqCBAB1Bc4NlsYME3FStiVfeGc0mDrl4sk4h?=
 =?us-ascii?Q?v8OcRdkT0ADlqy3m4iTLA9h60XRrZhHKhiWQt9OpsR3ZKryTxGw13cix2GDf?=
 =?us-ascii?Q?cBKtYyoO516SF0bZwFzRKArR6+djgtlYpwUlJSVcwrkYpeJcYNQ15urVgCKQ?=
 =?us-ascii?Q?6nBNBQGO6EaPvqVy+nvJtMITSLjr2O5AGjTXuVGCfkSZJpcJQKS1a19S93hY?=
 =?us-ascii?Q?I3bu6zwYLJy2bq1i6gl9WH5yxOXRAowRBkHcEZ5fwZRrE+0r77O8TOs59lkh?=
 =?us-ascii?Q?EEcxygWMxhaJjHQzoIf1NhxocMFMgEwAwiOSU6eVmLWLQxuYQSqjNddeWrqn?=
 =?us-ascii?Q?eOiAmgFApFrZdXSQcsY3PoSU1iXQMu0csokCx2UvF35tU7SLvI+1SXiAwma7?=
 =?us-ascii?Q?Cb1ECcfoPCBesYtss4ihnDsFQt4EstLR7p4S?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 21:35:52.3156
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f62508f5-f0c0-4395-3c89-08dddc43b591
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8081

Add helpers to lookup the event channel for a domid.  This hides some
of the differences between dom0 and stubdom xenstored.  Each version
defines its own.

It highlights the different meanings between get_xenbus_evtchn() in a
stubdom, where it looks up dom0's event channel, and dom0, where it
looks up the local event channel.

get_domain_evtchn() replaces get_xenbus_evtchn(), and
get_xenbus_evtchn() is removed from minios.c as it is inlined in the new
function.

The default return 0 will be fine as any other auto-introduced domain
will needs the event channel populated in the grant.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
v6:
R-b: Juergen

v5:
Split get_domain_evtchn() in minios.c and posix.c versions
s/dom0/stubdom/
---
 tools/xenstored/core.h   |  2 +-
 tools/xenstored/domain.c | 10 +++++++---
 tools/xenstored/minios.c | 19 ++++++++++++++++---
 tools/xenstored/posix.c  | 16 +++++++++++++++-
 4 files changed, 39 insertions(+), 8 deletions(-)

diff --git a/tools/xenstored/core.h b/tools/xenstored/core.h
index 5071f1dedd..cef3c71eb0 100644
--- a/tools/xenstored/core.h
+++ b/tools/xenstored/core.h
@@ -397,7 +397,7 @@ static inline bool domain_is_unprivileged(const struct connection *conn)
 extern xenevtchn_handle *xce_handle; /* in domain.c */
 
 /* Return the event channel used by xenbus. */
-evtchn_port_t get_xenbus_evtchn(void);
+evtchn_port_t get_domain_evtchn(unsigned int domid);
 void early_init(bool live_update, bool dofork, const char *pidfile);
 void late_init(bool live_update);
 
diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index 60d398682f..0866e04aa9 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -1330,7 +1330,7 @@ void dom0_init(void)
 	evtchn_port_t port;
 	struct domain *dom0;
 
-	port = get_xenbus_evtchn();
+	port = get_domain_evtchn(xenbus_master_domid());
 	if (port == -1)
 		barf_perror("Failed to initialize dom0 port");
 
@@ -1345,13 +1345,17 @@ void stubdom_init(bool live_update)
 {
 #ifdef __MINIOS__
 	struct domain *stubdom;
+	evtchn_port_t port;
 
 	if (stub_domid < 0)
 		return;
 
 	if (!live_update) {
-		stubdom = introduce_domain(NULL, stub_domid, xenbus_evtchn,
-					   false);
+		port = get_domain_evtchn(stub_domid);
+		if (port == -1)
+			barf_perror("Failed to initialize stubdom port");
+
+		stubdom = introduce_domain(NULL, stub_domid, port, false);
 		if (!stubdom)
 			barf_perror("Failed to initialize stubdom");
 
diff --git a/tools/xenstored/minios.c b/tools/xenstored/minios.c
index f04423fe09..60d921cf01 100644
--- a/tools/xenstored/minios.c
+++ b/tools/xenstored/minios.c
@@ -41,9 +41,22 @@ struct connection *add_socket_connection(int fd)
 	barf("socket based connection without sockets");
 }
 
-evtchn_port_t get_xenbus_evtchn(void)
-{
-	return dom0_event;
+/*
+ * minios stubdom looks up dom0's event channel from the command line
+ * (--event).  The stubdom's own event channel is returned directly.
+ *
+ * Any other existing domains from dom0less/Hyperlaunch will have
+ * the event channel in the xenstore page, so lookup here isn't necessary.
+ * --event would not be set, so it would default to 0.
+ */
+evtchn_port_t get_domain_evtchn(unsigned int domid)
+{
+	if (domid == stub_domid)
+		return xenbus_evtchn;
+	else if (domid == priv_domid)
+		return dom0_event;
+
+	return 0;
 }
 
 void *xenbus_map(void)
diff --git a/tools/xenstored/posix.c b/tools/xenstored/posix.c
index 97561701ae..4a97f53dc0 100644
--- a/tools/xenstored/posix.c
+++ b/tools/xenstored/posix.c
@@ -139,7 +139,7 @@ void unmap_xenbus(void *interface)
 	munmap(interface, getpagesize());
 }
 
-evtchn_port_t get_xenbus_evtchn(void)
+static evtchn_port_t get_xenbus_evtchn(void)
 {
 	int fd;
 	int rc;
@@ -166,6 +166,20 @@ evtchn_port_t get_xenbus_evtchn(void)
 	return port;
 }
 
+/*
+ * dom0 xenstored uses get_xenbus_evtchn() to lookup with XENSTORED_PORT_DEV.
+ *
+ * Any other existing domains from dom0less/Hyperlaunch will have
+ * the event channel in the xenstore page, so lookup here isn't necessary.
+ */
+evtchn_port_t get_domain_evtchn(unsigned int domid)
+{
+	if (domid == xenbus_master_domid())
+		return get_xenbus_evtchn();
+
+	return 0;
+}
+
 void *xenbus_map(void)
 {
 	int fd;
-- 
2.50.1


