Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD7FB1166F
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 04:29:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056833.1424879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf8Ao-0001zE-Gc; Fri, 25 Jul 2025 02:28:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056833.1424879; Fri, 25 Jul 2025 02:28:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf8Ao-0001wT-AV; Fri, 25 Jul 2025 02:28:38 +0000
Received: by outflank-mailman (input) for mailman id 1056833;
 Fri, 25 Jul 2025 02:28:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFeG=2G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uf8Am-0000gX-RW
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 02:28:36 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20620.outbound.protection.outlook.com
 [2a01:111:f403:240a::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10737a31-68ff-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 04:28:35 +0200 (CEST)
Received: from BL1P223CA0013.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::18)
 by DS4PR12MB9818.namprd12.prod.outlook.com (2603:10b6:8:2a9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 02:28:30 +0000
Received: from BL02EPF0002992E.namprd02.prod.outlook.com
 (2603:10b6:208:2c4:cafe::93) by BL1P223CA0013.outlook.office365.com
 (2603:10b6:208:2c4::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Fri,
 25 Jul 2025 02:28:30 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0002992E.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 02:28:30 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 21:28:30 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 21:28:29 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 24 Jul 2025 21:28:29 -0500
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
X-Inumbo-ID: 10737a31-68ff-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JcqYwpQ+nQt4RD56CJeq0KPcaPrtOUUkWMEBd+BDt+imRpcBuQijHfKgbuDt/c2rMwqKotR3IVfLueoDgcmS8RuPYk+4Fwq51HBS12KZ3NvtVEOXXTBVcd2grNzlgzWeq1c+Pug/GePvyPotLN/UyLfyxtJozMSn8bDRDMuBY4zJrTNKbZi2axIxLl+LPWI3LlgLhdiLKT2eAuv005igJZXaXJMIkmjGBGMRdAOZzBJdKnyeRo/HIdxwMkMC5jsEMa9/FGVx28d8yJmP/UDYQ+eEAf0TwoLUbSk/nKSqEDkE2Hvoc1Aa+nM+WQ1S8BKVO9LT6a121b3bKZRh15DR6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sGYc+CzgLIdlHzSBks2AkycShqESzRnLK23aeY0dc18=;
 b=Edhb32DHO9GhCtYRNNtirvLJJEJSBrvsj7pn2zaAv2fqHXDc6qRVLHR41aubBZxp2v2K2XHKGtjTzwjD3cgkBjHxZaWEyzxfCZGlu+27LLXrDBOEBsSzgRKHOb8kGKP2duSavZd7OIejiRqWPktVx4qiF4LAkj/EwMcsVjO/UggUZU4QwBdPN0NGzo83kOXxCtuCutArU9AfGarY4YxN7K+iv3tbNiMF+6w03d+8r5mhLerMFUm/5nBnFiilxbIveZ2pfLNRAsRDvwU0epUHomwEM4scQ1YYKnLpws+dW0XQgogWdLwLDCCUAtaqL/ExrA/6CCydk5eYRt9QjBvgdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sGYc+CzgLIdlHzSBks2AkycShqESzRnLK23aeY0dc18=;
 b=rWfKgQX8WlO7QoOk2aFnPyAk9H9IWS9dVAXAJZ9zhaNzLP+NpXZhJK3WzhR0Lzpwsi1YCftSHpV0g+b9g/f7hA4jAfdnhAxTibFVyOUUbEoQNblL9njYVBYMM91FYo1UarFVkwVMTzpgoGpThY+e27ogMV2Joh3xOJ6GExD2b3s=
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
Subject: [PATCH v4 06/12] tools/xenstored: Add get_domain_evtchn() to find evtchn
Date: Thu, 24 Jul 2025 22:28:06 -0400
Message-ID: <20250725022812.466897-7-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250725022812.466897-1-jason.andryuk@amd.com>
References: <20250725022812.466897-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992E:EE_|DS4PR12MB9818:EE_
X-MS-Office365-Filtering-Correlation-Id: f8735f0c-b543-4e95-6661-08ddcb22f22a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?X83vXQJ+xwEScIVs74IgxPRFaYX6vzkaWYrnDwsg7eKxmhiZJl6OkgfYSysy?=
 =?us-ascii?Q?7JZcaNUhtFOBgcEIT8R5Ah9FaqD6r+d+UgMUkZE8EfTxkVAK/mcAw3jcX+f6?=
 =?us-ascii?Q?oiRubXcWHnd2zsP+5jjZ4lcqG2DAX51vVgMtcjHTSrDG+c66UM2wCvhSq48R?=
 =?us-ascii?Q?LCi/tiA5d2gDstb8LpXdqkK84jF7Z8ECvHpBc/nMwEJY1ZtGXAuIWfZj/Tk9?=
 =?us-ascii?Q?g4WuisGCgEt3yl2ieHv6iiyGKj+9E7WzrQG//P/PXdmqkUuNaViE0y8ZyHUd?=
 =?us-ascii?Q?JRCUrwQbO6zyFKTrVDPnaS3kDvWzM+rMpauwnfTGJW2NjqrrqIepyntrwS5Q?=
 =?us-ascii?Q?HYYBNh+Ziy6+psbj8MCJmtkBsO4TeMK31Tj9DRnGpWh17UQQHzZkAE/AVP+3?=
 =?us-ascii?Q?dk1zB+C2q6oIfdX+btsYjVeHJkopTFPIkibgFoKY+2lhbj2GP2STdMxlcETS?=
 =?us-ascii?Q?cJgx18wM+nDbY2tNXhL+j/FdlayliccuXujnXPA3gK0/UEmwk4HGMX11xTsE?=
 =?us-ascii?Q?Bw9GdUYU6x+PWzCISLg4I5FzGzeSdmuI0xV97PHmS3ZhiKUccEls2YUTC3fx?=
 =?us-ascii?Q?huczVN+uskknr4sbNdGA05MLyOyz5xBAMES8T4pPc+6IkXmhQMA3cz/bRGrw?=
 =?us-ascii?Q?r1IMcCWcKIy4KXhMFHVMl4u5YIn+R/gDwVcSQxJzs+bXqxLNayPfw/MlgjAE?=
 =?us-ascii?Q?OW+jge9DLXgWYnpQjGd8owC2m5NnfrtIlwkBi6FgYTvl5e7lhsDSNuXINeHp?=
 =?us-ascii?Q?AM/cONtab0NGWuKknjrqVvOTPtMVIEF08CxVosZ7ffJjbaCO2PsyYMdxE0/M?=
 =?us-ascii?Q?1MbjWdVSUWFQc+pzdUjbwDIEK2B8xidlHQlx3vr/odiDKC4ANVWneKMsrdWH?=
 =?us-ascii?Q?12vkP/si2m1ndakAzRvgFVy8EPKsZWx4KvCbJ8tPbu8hArvWVW9C04qRRK8z?=
 =?us-ascii?Q?CrpHc6FeNLyjDBlgWGvIbY/bwJInu63+EfhJH/LuAV5jj8UnW4Osm+2lT2D3?=
 =?us-ascii?Q?W+xN7o5cvAN88fvh896u8OUuaE70WyiMr6VgMhyB0wuz+JR2bej6N5U+qV2K?=
 =?us-ascii?Q?8S/RwjaMGY22/rgmEKAM6qBN+j/oxQbzfSq3sWJ0/5jLbih8asBUjiJPjrQi?=
 =?us-ascii?Q?u05EAO9VytMAwjzC+JNwluGwqlq7AjLNQSu8ebifeftt6EgoT2eN8vgTSM4s?=
 =?us-ascii?Q?oxiD2g4PE/MA/uAhJSly2Yt/EGpTftxx4c2Me9Lu1oghsr/qWNaf1rLN2W4m?=
 =?us-ascii?Q?sqiVZY1AX9xcrMR4HXHb3QlF9m74KyYqI7ZNGBY88cORLoHQLuAfsycxASeZ?=
 =?us-ascii?Q?1FFYu1Pml/IGRtE7TIcr3EgJaMRu4/z8Ye5wNqTubLYgwET9AkW4nPZLk5wV?=
 =?us-ascii?Q?lBQ+FDWxMgdthuFS4G3WKU4tq4+Lwq2hPQPixOsJ2tKknKFIDh6oPUwqoRge?=
 =?us-ascii?Q?U9rYHqoKAkyL6oKEte/l8m7yf4fpjbu1KNcz7IwRUVbC+7BBnj78JQ/hXR0x?=
 =?us-ascii?Q?NHTccIKxZpKkeHg/MtuP1Vtmphiwyb0kJf2i?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 02:28:30.8231
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8735f0c-b543-4e95-6661-08ddcb22f22a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9818

Add a helper to lookup the event channel for a domid.  This hides some
of the differences between dom0 and stubdom xenstored.

It highlights the different meanings between get_xenbus_evtchn() in a
stubdom, where it looks up dom0's event channel, and dom0, where it
looks up the local event channel.

The default return 0 will be fine as any other auto-introduced domain
will needs the event channel populated in the grant.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 tools/xenstored/domain.c | 38 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index 1241f8c73e..1c52254ba8 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -1251,12 +1251,41 @@ const char *get_implicit_path(const struct connection *conn)
 	return conn->domain->path;
 }
 
+/*
+ * dom0 xenstored (posix.c) uses get_xenbus_evtchn() to lookup with
+ * XENSTORED_PORT_DEV.
+ *
+ * minios stubdom uses get_xenbus_evtchn() to look up dom0's event channel
+ * from the command line (--event).  The stubdom's own event channel is
+ * returned directly.
+ *
+ * Any other existing domains from dom0less/Hyperlaunch will have
+ * the event channel in the xenstore page, so lookup here isn't necessary.
+ * --event would not be set, so it would default to 0.
+ */
+evtchn_port_t get_domain_evtchn(domid_t domid)
+{
+#ifdef __MINIOS__
+	if (domid == stub_domid) {
+		return xenbus_evtchn;
+	} else if (domid == priv_domid) {
+		return get_xenbus_evtchn();
+	}
+#else
+	if (domid == xenbus_master_domid()) {
+		return get_xenbus_evtchn();
+	}
+#endif
+
+	return 0;
+}
+
 void dom0_init(void)
 {
 	evtchn_port_t port;
 	struct domain *dom0;
 
-	port = get_xenbus_evtchn();
+	port = get_domain_evtchn(xenbus_master_domid());
 	if (port == -1)
 		barf_perror("Failed to initialize dom0 port");
 
@@ -1271,11 +1300,16 @@ void stubdom_init(void)
 {
 #ifdef __MINIOS__
 	struct domain *stubdom;
+	evtchn_port_t port;
 
 	if (stub_domid < 0)
 		return;
 
-	stubdom = introduce_domain(NULL, stub_domid, xenbus_evtchn, false);
+	port = get_domain_evtchn(stub_domid);
+	if (port == -1)
+		barf_perror("Failed to initialize dom0 port");
+
+	stubdom = introduce_domain(NULL, stub_domid, port, false);
 	if (!stubdom)
 		barf_perror("Failed to initialize stubdom");
 
-- 
2.50.1


