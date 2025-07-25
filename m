Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6BCB127C8
	for <lists+xen-devel@lfdr.de>; Sat, 26 Jul 2025 02:00:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058753.1426320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufSLI-0005zI-UK; Sat, 26 Jul 2025 00:00:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058753.1426320; Sat, 26 Jul 2025 00:00:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufSLI-0005ww-Pl; Sat, 26 Jul 2025 00:00:48 +0000
Received: by outflank-mailman (input) for mailman id 1058753;
 Sat, 26 Jul 2025 00:00:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFeG=2G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ufSKO-0007YZ-2r
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 23:59:52 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20630.outbound.protection.outlook.com
 [2a01:111:f403:2412::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72800eae-69b3-11f0-b895-0df219b8e170;
 Sat, 26 Jul 2025 01:59:50 +0200 (CEST)
Received: from BN9PR03CA0919.namprd03.prod.outlook.com (2603:10b6:408:107::24)
 by PH7PR12MB5687.namprd12.prod.outlook.com (2603:10b6:510:13e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.23; Fri, 25 Jul
 2025 23:59:39 +0000
Received: from BL6PEPF00020E60.namprd04.prod.outlook.com
 (2603:10b6:408:107:cafe::52) by BN9PR03CA0919.outlook.office365.com
 (2603:10b6:408:107::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Fri,
 25 Jul 2025 23:59:38 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00020E60.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 23:59:38 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 18:59:38 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 18:59:38 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 25 Jul 2025 18:59:37 -0500
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
X-Inumbo-ID: 72800eae-69b3-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rlMiFye14dTBcptNqzQ2phX9VfDJDkhog74bcI+Hse1WCBictKhnwOYHhFYAiDEm3vy6CNyly0lv53bStOGXHNyebfHbs0W3U1HWPHHNEvUoAOn7FOMDZbnWe6YAuAviixZy4rW4ycZ5b3JmYzTabYpHeGDKKPVJT1ldVf3DQuabZXgjN7GWNBMGJbXnCxCsLLPuRZUYOYPDlMHP5yWy7676/jK+DdvbTxPmYg64nQ+PVYyGX3yiAf8kykV0vs/Ks5sk5lplshIgqgYVg405CxcqF1jBaKaPc5RHawh+J8h1KewQV9WQJjpxM1/g6F5ESEStM+SEfEOGevZhqAi+Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=es0hWgOpQ/7LGDqroUoAHeWfGdQDsmfi380WCbJdzfw=;
 b=hDIG4k5SEpAwiuLKH0853/uXHioC4c1RlOKRH7XZKqi3g2OapgSJUFawuaFnGxPtxqpK1dPYSJAE8KBinSZHf/4fBxkHA+XyZzP5N2jN+Qa6/NhmXL6S7Cdb8m/9BIltogH9ZVaUqtmcHKJL0M9iPXNJbhWwy/qmuWrC6vn1qYvFZElAdm9iUt7BlIXpHa2puQKFWhWNc5PcdwJeS0/wIgNLniIvqejjypZ8eRlahI9RKjGOw8kKd7x0zETubfWbhjEx8xeCALdg+v4GWnpt47MzOONDiDcvRzKi5F0K/Z9MdkCwJDX9pW09U+N9Ou/jG/DzhZxL7beSwmb+BFgbGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=es0hWgOpQ/7LGDqroUoAHeWfGdQDsmfi380WCbJdzfw=;
 b=KtJgVeftJzctwvR7GsGJ5/JfGEyk1TJxBU0fSWiKmHzToVUouhy1ANaUNnlIFCfx3mrcdtYMOPTNdpJdIl5+WEHt0B3lVsLlg5+vBzkscc/hRiRzP5Gs7Dmyl5eRxAxBzrQH0dRPPLXiElZ3rOHiFZXfG21pd7en2gWZ/Bqwy0M=
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
Subject: [PATCH v5 09/11] tools/xenstored: Rename dom0_domid to store_domid
Date: Fri, 25 Jul 2025 19:58:56 -0400
Message-ID: <20250725235858.666813-10-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250725235858.666813-1-jason.andryuk@amd.com>
References: <20250725235858.666813-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E60:EE_|PH7PR12MB5687:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e7b6757-c428-4d89-748b-08ddcbd75097
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|30052699003|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?btpw60D22vbzLvUK+G0HuEdtM9OUM67AE6+KOrV4U2g4InpRC2+plkNEsevI?=
 =?us-ascii?Q?K/cQKa4nCt0/igyx+QGr6MtEUjZAcQsl6tN0fzov1n0z5ds3m2muN5thTZPe?=
 =?us-ascii?Q?6Q9HaNMOCeyIYhkOsH9DuT0EbBiJGOUp6pxOOM4bXgesavzLI4H5HLwesz3b?=
 =?us-ascii?Q?ZRNFaBNDygem0ek6+nVnjvwMyJpN3rkbLvpeumpWXxCqZJIlW5KTwlrfzN/j?=
 =?us-ascii?Q?Tk9NuddClueQMiGNv+vOP4rE39QzzLJFFbgBhqiEFzD9l5FTsODyX6qb6kC0?=
 =?us-ascii?Q?ImOF7HiGNjk6U1gfsFMXmMHi7/FgT1OCD7JjcBEmnn4GbgkZDyAnv9an6BH9?=
 =?us-ascii?Q?/8v/5fmZDHTZ4ndZP/2sDgwaE5q9Hbh+cKlScxbe4MxuhMxMLpeAb8LDM1ef?=
 =?us-ascii?Q?8tXY+THvpD2ywuxSzhG1pes3M707Jt9KfVVPergVL5OlGDeEBncMAWddWHy0?=
 =?us-ascii?Q?eQsCV6eeijjUa29EB20zDDnTtlH9sNCEpv1PtMAYQRSGfJYY3ZEouv7MfTGR?=
 =?us-ascii?Q?Souu7eN57COKsUBGUcTNOmOVamxfr0lfGSB6WyVGsBJaRX9UHfxW9uEu+DlW?=
 =?us-ascii?Q?aGhswT0/gvwFQrLdeHFIZ1v9HV1B55SE/4e6aQx2GpLU+F/TksdFvm9vsJtI?=
 =?us-ascii?Q?8qpDfM8P65RQWVJkN0eI/ENfA9CyE2vvWiiJVqGLM0i8SbI6/qA9JP4oszAE?=
 =?us-ascii?Q?34n21BRDU50EAYXZIbnv2CGJr/FS+3r6RR1s+SC+ER9xuJc9gQWcRJCNccwg?=
 =?us-ascii?Q?dsq9wXOsoQfL4CCDYipwhO+yOfGC25W+HJSg5yZqZ7rQtEmJ17BmNYbg2PdF?=
 =?us-ascii?Q?QuJaiOClacjYIBdQ/uoTZFYgL9gtmd/a8qL6+7OLDNULZ9B3J4OKJxHvtf3H?=
 =?us-ascii?Q?wRu/5LTVLsj34A+WTXdrAa6/yb575pTcz3zE8Rr2IGTBdr8KxoiMa0cjcZq0?=
 =?us-ascii?Q?xI0BGrTf4K/xYjmCposY0HFUIAW1KKG8oX5/M4kSvej1Oub5I11LiOuuv0tY?=
 =?us-ascii?Q?wNil2sXJmoT/GFfHjIAs9yJf5zFoogTd6Et+h0yq5qIOYWMIB8BdLFpssgFL?=
 =?us-ascii?Q?hWP+UytsVGQFgDsy0Ux1oAJA4Qcx0DAfGF7q7+Y/oO1iyWeP1iWzyz5Qmk8b?=
 =?us-ascii?Q?kKnXqr+st3f3ythfKRZQHdWCNrrWqFp+7wkWhvbziDdi2cpwHCt5A+Z5EATs?=
 =?us-ascii?Q?HZmaL17JTQ4IvCxrFLnWzIrx/qE+9tgf+d2Qcl9kG2d8m1pjOuQxAUBw3zJH?=
 =?us-ascii?Q?eThkBC1rorn6Mk198GqG5uwjf58o9MtL+BlgyDfYzPcv2W9W1mXXZQojh4mQ?=
 =?us-ascii?Q?54tszn6mtRKwZ9wrDRN36bupofKQxj/35s+g5lXC8jDaoqg6QGGebDTiOo5h?=
 =?us-ascii?Q?U3AqCgKe6GTQA8vBsX9dFwq6TVF/bK7FviFbJ5S3291VgUFEMZbQI00pmfBU?=
 =?us-ascii?Q?NpiJdeVceLKn2M7ao2R/4BSULD2LIzubxcyWst0J9AQXqXVEBgcRYhj0oHes?=
 =?us-ascii?Q?cN8OTpJ3o/I/1Z5tt0mtroITR/012xqv+DHU?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(30052699003)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 23:59:38.6538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e7b6757-c428-4d89-748b-08ddcbd75097
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E60.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5687

The dom0_domid variable is misnamed and conflates purposes.  If we have
xenstored running in a Linux domain that is not dom0, this variable
controls the lookup of /proc/xen/xsd_kva and the event channel.

Rename to store_domid to better show its purpose.

One implication of this change is that the xenstore domain is not
privileged by virtue of considering store_domid as privileged.

domain_is_unprivileged() removes the dom0_domid/store_domid check, so
xenstore domain is no longer considered privileged.

onearg_domain() is updated to return EINVAL for store_domid or priv_domid
to maintain the ability to call XS_RESUME.

xenbus_master_domid() is removed with store_domid being used instead.

Add a description of the -m/--master-domid options while
doing this.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v5:
Remove xenbus_master_domid()
domain_is_unprivileged() drop dom0/store_domid.
XS_RESUME/onearg_domain() check store_domid || priv_domid
---
 tools/xenstored/core.c   |  9 ++++++---
 tools/xenstored/core.h   |  6 ++----
 tools/xenstored/domain.c | 10 +++++-----
 tools/xenstored/posix.c  |  4 ++--
 4 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index 098958f611..f407bec4b9 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -2536,7 +2536,10 @@ static void usage(void)
 "                          allowed timeout candidates are:\n"
 "                          watch-event: time a watch-event is kept pending\n"
 "  -K, --keep-orphans      don't delete nodes owned by a domain when the\n"
-"                          domain is deleted (this is a security risk!)\n");
+"                          domain is deleted (this is a security risk!)\n"
+"  -m, --master-domid      specify the domid of the domain where xenstored\n"
+"                          is running.  defaults to 0\n"
+);
 }
 
 
@@ -2564,7 +2567,7 @@ static struct option options[] = {
 #endif
 	{ NULL, 0, NULL, 0 } };
 
-int dom0_domid = DOMID_INVALID;
+int store_domid = DOMID_INVALID;
 int dom0_event = 0;
 int priv_domid = DOMID_INVALID;
 domid_t stub_domid = DOMID_INVALID;
@@ -2733,7 +2736,7 @@ int main(int argc, char *argv[])
 			dom0_event = get_optval_uint(optarg);
 			break;
 		case 'm':
-			dom0_domid = get_optval_uint(optarg);
+			store_domid = get_optval_uint(optarg);
 			break;
 		case 'p':
 			priv_domid = get_optval_uint(optarg);
diff --git a/tools/xenstored/core.h b/tools/xenstored/core.h
index 877b1e1103..949b812f90 100644
--- a/tools/xenstored/core.h
+++ b/tools/xenstored/core.h
@@ -364,7 +364,7 @@ do {						\
 		trace("tdb: " __VA_ARGS__);	\
 } while (0)
 
-extern int dom0_domid;
+extern int store_domid;
 extern int dom0_event;
 extern int priv_domid;
 extern domid_t stub_domid;
@@ -381,11 +381,9 @@ uint64_t get_now_msec(void);
 void *xenbus_map(void);
 void unmap_xenbus(void *interface);
 
-static inline int xenbus_master_domid(void) { return dom0_domid; }
-
 static inline bool domid_is_unprivileged(unsigned int domid)
 {
-	return domid != dom0_domid && domid != priv_domid;
+	return domid != priv_domid;
 }
 
 static inline bool domain_is_unprivileged(const struct connection *conn)
diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index 94cbe81ca5..2f79db26df 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -503,7 +503,7 @@ static const struct interface_funcs domain_funcs = {
 
 static void *map_interface(domid_t domid)
 {
-	if (domid == xenbus_master_domid())
+	if (domid == store_domid)
 		return xenbus_map();
 
 #ifdef __MINIOS__
@@ -518,7 +518,7 @@ static void *map_interface(domid_t domid)
 
 static void unmap_interface(domid_t domid, void *interface)
 {
-	if (domid == xenbus_master_domid())
+	if (domid == store_domid)
 		unmap_xenbus(interface);
 	else if (domid != stub_domid)
 		xengnttab_unmap(*xgt_handle, interface, 1);
@@ -1144,7 +1144,7 @@ static struct domain *onearg_domain(struct connection *conn,
 		return ERR_PTR(-EINVAL);
 
 	domid = atoi(domid_str);
-	if (domid == dom0_domid)
+	if (domid == store_domid || domid == priv_domid)
 		return ERR_PTR(-EINVAL);
 
 	return find_connected_domain(domid);
@@ -1307,12 +1307,12 @@ void init_domains(void)
 			 * have 1 domain.  stubdom there will be dom0 and dom1,
 			 * so this will take the second for stubdom.
 			 */
-			dom0_domid = domid;
+			store_domid = domid;
 		}
 	}
 
 	if (priv_domid == DOMID_INVALID)
-		priv_domid = dom0_domid;
+		priv_domid = store_domid;
 
 	if (priv_domid == DOMID_INVALID)
 		barf("Could not determine xenstore domid\n");
diff --git a/tools/xenstored/posix.c b/tools/xenstored/posix.c
index d850dc0da9..e8bb975115 100644
--- a/tools/xenstored/posix.c
+++ b/tools/xenstored/posix.c
@@ -174,7 +174,7 @@ static evtchn_port_t get_xenbus_evtchn(void)
  */
 evtchn_port_t get_domain_evtchn(unsigned int domid)
 {
-	if (domid == xenbus_master_domid())
+	if (domid == store_domid)
 		return get_xenbus_evtchn();
 
 	return 0;
@@ -280,7 +280,7 @@ static void accept_connection(int sock)
 	conn = new_connection(&socket_funcs);
 	if (conn) {
 		conn->fd = fd;
-		conn->id = dom0_domid;
+		conn->id = store_domid;
 	} else
 		close(fd);
 }
-- 
2.50.1


