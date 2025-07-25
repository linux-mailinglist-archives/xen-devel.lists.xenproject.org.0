Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE37B11676
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 04:30:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056870.1424913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf8Cr-0006Bd-IP; Fri, 25 Jul 2025 02:30:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056870.1424913; Fri, 25 Jul 2025 02:30:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf8Cr-00068I-Dr; Fri, 25 Jul 2025 02:30:45 +0000
Received: by outflank-mailman (input) for mailman id 1056870;
 Fri, 25 Jul 2025 02:30:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFeG=2G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uf8At-0000gX-Su
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 02:28:43 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2061f.outbound.protection.outlook.com
 [2a01:111:f403:240a::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13b0b6e6-68ff-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 04:28:41 +0200 (CEST)
Received: from SA9P221CA0009.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:25::14)
 by LV8PR12MB9359.namprd12.prod.outlook.com (2603:10b6:408:1fe::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Fri, 25 Jul
 2025 02:28:36 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:806:25:cafe::18) by SA9P221CA0009.outlook.office365.com
 (2603:10b6:806:25::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.30 via Frontend Transport; Fri,
 25 Jul 2025 02:28:35 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 02:28:35 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 21:28:35 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 21:28:34 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 24 Jul 2025 21:28:34 -0500
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
X-Inumbo-ID: 13b0b6e6-68ff-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b8QE7tDa03sri4DyIIGuDXg6pyhnUUWJwA7C+NHtSwTvEXRFPqHD4EZ2ELtCJF7ePH3Lp3E0ARVCLSzBT07oHbjcliol8QxHQmkv8c3X3h3ffmc8QjjdiBJrXpHc6BrixpUnbiKAxLc9Dx/uiiC4OCXnt9rE8ELCHGqusmOv8QrFC36E7OAxang2D2+J5V6RESke8ULPWnm1AjoamkY5Y1Y30UQyUfScTcWSDXdci/YbmV3vfrA6VXDEjKbCyt6efJJceeStU3WuJ4kUGuydN9+TDvCGXSVz/tNXOPI8htNcdnOArF2t4OygtgGSjhx5KnblA+czgtZOM1+XIC5eQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oUm4Zo+YCS52ak4UX9+eKTXCeD8AZGfnkh5ga1K9MFg=;
 b=SwhdaBiclOPMzMlTdSHIHtgoOc9GXFe3H6uoihrAE1KOSdjD6M/vp2u6t1JvXuivBPEMaS5mv1LqLfiMWSHKNbkT+S50LZP0IkGYRux5uvp7zDx0PddXuxTHy5U61JvwnmfayT2U7xRaKhA+xVo0qfpO3577vkuKxJKVvYJ3/Tkn7bq0fOjGhBjzH+wccBBduwCHn6EvKvfFuequBPKvxB+EnABYuzEdOtg2PEshbEs86KUg1b6NLLxqy8V88W4UOmAaESmq1bQ2VBszpCgdO04EtUnTAs1/9eln5gO2bSxNLmfre4zf3Tggi730nZyc334OX4ysyEJIluWFBk5Rwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oUm4Zo+YCS52ak4UX9+eKTXCeD8AZGfnkh5ga1K9MFg=;
 b=5Pug9M1ZEDh6NK+f0xifwDOtdsSF7/404C1kwGMQts914v3daX5G6uo2FMF6C3HBX1wwOyTg+PsgC+PvHilehQrr17pgZ1wC1hccrYcIQZCqNdfvjG6OqXbDCvrKAkoPAOzlXU6tZDGkjgrECKT0k5kjqgGEhfJ0mxBb1GyQp/s=
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
Subject: [PATCH v4 10/12] tools/xenstored: Rename dom0_domid to store_domid
Date: Thu, 24 Jul 2025 22:28:10 -0400
Message-ID: <20250725022812.466897-11-jason.andryuk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|LV8PR12MB9359:EE_
X-MS-Office365-Filtering-Correlation-Id: cc893761-b70e-474b-ea88-08ddcb22f4ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|30052699003|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q5E+U3Hmbk0pK+e7fWbEoQtEhFVIw/TrJ3Hl7nZ+gnHySSQ/LZAVvwi5Q5vp?=
 =?us-ascii?Q?vnUmys5o0oh+LKdChdzpDkCWhdTJzPvw66I3S+XA/ynOLuifnfA5LtGaMwFM?=
 =?us-ascii?Q?WOcbyt6GP1cUaOeZ9QTh0xwpk7z6nd36cQIMBSKisfuag4WNTRdpuHH9F6Gb?=
 =?us-ascii?Q?3imvrDjv37n5t35VGDiAoGS8UlMKXGr3uCMIdDrHRiGhbCktcN3bnXvjYO4P?=
 =?us-ascii?Q?QF5EWC5XSZKTktDBfNizW7hxGQB/K8EoWxFs2TanLU01sSnKuTuJExV0BzhD?=
 =?us-ascii?Q?c0KshmYeCmmE35AUEpHnxqThpupXWqkA2EpoJMWFao1FH9WWLCtC0crcHjUH?=
 =?us-ascii?Q?HWiCasoDSjEDbyE7O9q9H9eI/v9Eva1VuSO5qx4lzH9ghfW4bBwaH16e80tv?=
 =?us-ascii?Q?PEFnw40Y8NnVTKTv/aFXJtDNSfvLUfT6deNk53wsmLo5XnKYF/St1ocfrJcm?=
 =?us-ascii?Q?7aehkREuvcNmXkUpbndtJfSTNmUK+CIITtO2nUh+r6wh03oFGEaGgXlOU3on?=
 =?us-ascii?Q?JkTYjjraAWX+KHCukd/ifMP2cW/Ei5LpJJq4lbxQIwJylTHe8W9JpIrWua/A?=
 =?us-ascii?Q?YUAavdMeE3JAQ7wwtSuOGbk3mV/1NHh5yyv4LkW7ANAUZAoZwFFBiqcUDsFv?=
 =?us-ascii?Q?2FLDsaz1FnBaitISaNq9bvG3AFjMXSv50hCfU/UrI3FqKKsoD560GvViX4yN?=
 =?us-ascii?Q?IjD0VZz2eUL3q5lFpsfU5GILVl3ZkQzGsyw3CJLXsCO36QwUM3JV+N5LMF1p?=
 =?us-ascii?Q?5LSJbPw7oDa/5kLsj09UtxNC0tAh2he+3tceOcr+sy82m4OWc5FOtIJVIaC9?=
 =?us-ascii?Q?Me/bon7id22lZ6CI2Wv8YeneyZq4ZBs5o9mZrOe1FggHxiq0FAJBChd4NGuT?=
 =?us-ascii?Q?KpVbJBclz/d58GrJ5JtO+IN/C669ewh0KOQv5kTihjFywGtOCpoT7dy6dnyc?=
 =?us-ascii?Q?+ZYqpZIEk/WKykr0Yd4zKdWFMytqfbFeIMZa6xfdizBNoHE1jyO4+pYeaBF+?=
 =?us-ascii?Q?sYQOuYwM9C/3jqY2V5l+PJ4XbgoZJJfVliudYLf9FQrXRq/vuxdKw3cQ2Umb?=
 =?us-ascii?Q?bkJ0RgLLbz3yOaIz+1yVydWUGyIyiO5+G4xEGfmYygENXXYHiZJcWrmuCinc?=
 =?us-ascii?Q?Xl9Eo9jgEUk+RdzDIXrYvmVr3aoYVa9KgsyIpNEowZsEV5cJj29OrtocGuLM?=
 =?us-ascii?Q?vSe2noYIHXLCZO83+r+qouDHvIAe3ljVjcjLp1pQrq+8Yehjm8AguQSDq5Gl?=
 =?us-ascii?Q?jYqV9+M8QgXFcUqGPt9RJRp10OTQqyWzchAv4XlfUvGd7/J0lf47NgxRZHKv?=
 =?us-ascii?Q?7iTPYpjksJb4CdUcjFoiUZw2a3inaJyeEn1HwPiyB9qTYzQ4yKzlyA6ZzZKi?=
 =?us-ascii?Q?2ZgRSopSldfj0DJAEnOzgDWYskMl9ejbHXcvqQ6Nn6V/Y2T+/bmAKEwGeM/H?=
 =?us-ascii?Q?HtYLBzE4hY/yDa7LzcJfTFEXFwv+WsvZCkHXdP0qMtmMZLM1+kWf9Jqf16MW?=
 =?us-ascii?Q?C7tTrFrQdff/HLF2uAzhdA9/KWpLfeCx5R5l?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(30052699003)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 02:28:35.4181
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc893761-b70e-474b-ea88-08ddcb22f4ea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9359

The dom0_domid variable is misnamed and conflates purposes.  If we have
xenstored running in a Linux domain that is not dom0, this variable
controls the lookup of /proc/xen/xsd_kva and the event channel.

One implication of this change is that the xenstore domain is not
privileged by virtue of considering store_domid as privileged.

Rename to store_domid to better show its purpose.

No functional change.

Add a description of the -m/--master-domid options while
doing this.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 tools/xenstored/core.c   | 9 ++++++---
 tools/xenstored/core.h   | 6 +++---
 tools/xenstored/domain.c | 8 ++++----
 tools/xenstored/posix.c  | 2 +-
 4 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index 19edd75bc3..981907ec28 100644
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
 
-int dom0_domid = 0;
+int store_domid = 0;
 int dom0_event = 0;
 int priv_domid = 0;
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
index 1ba9592d16..d44cca8454 100644
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
@@ -381,11 +381,11 @@ uint64_t get_now_msec(void);
 void *xenbus_map(void);
 void unmap_xenbus(void *interface);
 
-static inline int xenbus_master_domid(void) { return dom0_domid; }
+static inline int xenbus_master_domid(void) { return store_domid; }
 
 static inline bool domid_is_unprivileged(unsigned int domid)
 {
-	return domid != dom0_domid && domid != priv_domid;
+	return domid != store_domid && domid != priv_domid;
 }
 
 static inline bool domain_is_unprivileged(const struct connection *conn)
diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index dbeacaa93e..d9144e97a1 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -1139,7 +1139,7 @@ static struct domain *onearg_domain(struct connection *conn,
 		return ERR_PTR(-EINVAL);
 
 	domid = atoi(domid_str);
-	if (domid == dom0_domid)
+	if (domid == store_domid)
 		return ERR_PTR(-EINVAL);
 
 	return find_connected_domain(domid);
@@ -1267,7 +1267,7 @@ evtchn_port_t get_domain_evtchn(domid_t domid)
 		return get_xenbus_evtchn();
 	}
 #else
-	if (domid == xenbus_master_domid()) {
+	if (domid == store_domid) {
 		return get_xenbus_evtchn();
 	}
 #endif
@@ -1295,13 +1295,13 @@ void init_domains(void)
 		domids[nr_domids - 1] = domid;
 
 		if (caps & XENMANAGE_GETDOMSTATE_CAP_XENSTORE) {
-			dom0_domid = domid;
+			store_domid = domid;
 		}
 
 		if (caps & XENMANAGE_GETDOMSTATE_CAP_CONTROL) {
 			memmove(&domids[1], domids, (nr_domids - 1) * sizeof(*domids));
 			/*
-			 * Local domid must be first to setup structures for
+			 * priv domid must be first to setup structures for
 			 * firing the special watches.
 			 */
 			domids[0] = domid;
diff --git a/tools/xenstored/posix.c b/tools/xenstored/posix.c
index 6037d739d0..d0622dc05f 100644
--- a/tools/xenstored/posix.c
+++ b/tools/xenstored/posix.c
@@ -266,7 +266,7 @@ static void accept_connection(int sock)
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


