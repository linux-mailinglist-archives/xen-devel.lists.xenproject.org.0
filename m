Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B168B11673
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 04:29:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056826.1424840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf8Aj-0000zm-EW; Fri, 25 Jul 2025 02:28:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056826.1424840; Fri, 25 Jul 2025 02:28:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf8Aj-0000y7-7d; Fri, 25 Jul 2025 02:28:33 +0000
Received: by outflank-mailman (input) for mailman id 1056826;
 Fri, 25 Jul 2025 02:28:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFeG=2G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uf8Ai-0000gX-0B
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 02:28:32 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2416::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c9515d6-68ff-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 04:28:30 +0200 (CEST)
Received: from MN2PR10CA0034.namprd10.prod.outlook.com (2603:10b6:208:120::47)
 by DM4PR12MB8559.namprd12.prod.outlook.com (2603:10b6:8:17d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 02:28:25 +0000
Received: from BL02EPF0002992B.namprd02.prod.outlook.com
 (2603:10b6:208:120:cafe::60) by MN2PR10CA0034.outlook.office365.com
 (2603:10b6:208:120::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Fri,
 25 Jul 2025 02:28:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0002992B.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 02:28:24 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 21:28:24 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 21:28:24 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 24 Jul 2025 21:28:23 -0500
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
X-Inumbo-ID: 0c9515d6-68ff-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rRIzwpfIZrRHdhmLKPljrMH8RPLjhATDGk58E/FkcjQ8vW9cA80UKAtnEUxRx6MP9TPWjDnuUmrTEoD1Y4xQ3B+Dwz8NzU9EHvbgr2yNzmMYLkLYssu1HzEar00e2dLPWQGVwdWcFXoI0wVMhQxdz24J1nTAkSwZIdxt4QU6vrOzur5/vQ4ThSv0rcqvlQQkfp7oYw+bNE0yRcLtlPW1WSMVX1cthiDlvF4bpDYuhLM+QaBdRpRAPOG4CscBT2fdW8LHvs70MLRT32Gp8+SevdVRvMZebNW+lOUY4MGX6bAHno3Wh9dCWP3zK4nSoEUHJ3zIgHiFwENMeUZ2ZC+xMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AREAC1SCEzA+WwtsK+zwuoyjXAwPYcG9bspmaJd2m8M=;
 b=ho34A+KzLzQy7caPkQOb8oE0ZXt4hYNsK4pOtrKdNwWtTozkHzK/ittllyXr6dV/h3Yw8OeD5OzebZ6dG2C2m0KWaqAqel65OaTGmORtV7uNigCaRd+RKWJp40lQA2CBlNFNlw3QrNybd8J/EgfLKJPWGESBsPWv8Mv2D6B3ot6gVa5w+ogEcSyee3cbzyaEeWmHo75speL9gd8rIkaDx6SEvTLr13vGKCZgnaz6SamP6lN3q7IHF1LCBWT4O3lpZtR7eqjZi0Zzbr6FPNQ+U7l038kDq9h6GPoyWG72ki9pMxyI9EqqXUR1oioku1Nie3lRhjPs5nM2mx+/QWV5Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AREAC1SCEzA+WwtsK+zwuoyjXAwPYcG9bspmaJd2m8M=;
 b=JnQckSsTLlAZgW/Cyb6+/jrQOgxwiqhT7KpatG29bMbHsst4jxh1bAijwK/fY3SvSxPM1m3kLKGxcobNz38oJ2RIUmrUfxodBcoWdnxXR0kM3UGp5OePA3vXUyw4p8f16nkRP69iA0SviTUprntwubP9EYIApTKXpujDLgX38hU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>
Subject: [PATCH v4 02/12] tools/manage: Expose domain capabilities
Date: Thu, 24 Jul 2025 22:28:02 -0400
Message-ID: <20250725022812.466897-3-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250725022812.466897-1-jason.andryuk@amd.com>
References: <20250725022812.466897-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992B:EE_|DM4PR12MB8559:EE_
X-MS-Office365-Filtering-Correlation-Id: c6e8317d-7300-46dc-4191-08ddcb22ee9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CSMHlPIJgbk/sCkOlwrEXYs/jlplO36Mx5CP3pGASzhGnrJYOjTjy88vgEGE?=
 =?us-ascii?Q?xhpv+WZKqRX6MUmDLuAYK5KutvDGreCfH1ZlvITE0La21ECzhoyYmwfHuapf?=
 =?us-ascii?Q?GjIVm3Ywqf4+9TwqWTRj3OZnXJMDwYGvJvBwVanSAMxI5OP0LYpfVLq9Kqzx?=
 =?us-ascii?Q?HzkukNbtE8QhrQl3tN4CCv4RnIHM63MAqIF3Q7q3JEc29voJhkhD3UHhBMHY?=
 =?us-ascii?Q?T0LD46s8OfNSAncLR+i7114GZLg01q4h3R5nXzVOwv4xWkcNKR/pVaLW44uI?=
 =?us-ascii?Q?WEFW16pWJLiWvrbneLS0Ysbiq2Thgoj8PELoNJzd21AV5qGDI/rsxpdi11vL?=
 =?us-ascii?Q?eWDxE7OkKvy/qXsERr7E3Hr7dRiHB6yLWEr6fjmA1XmB9gZhC2J1kRyKvBf8?=
 =?us-ascii?Q?nUQwJnLskU8vMfHtFO7rKXgYvcXbvHdLua0+wGMtIjBp/A7u39dL8Wio+Eds?=
 =?us-ascii?Q?4D63SP6T/RNWiPKqjMsLnYz0KyWaQLFlpfYZ0QzIUaqmO7J0JGjtQO2tncWA?=
 =?us-ascii?Q?eL83pExlOqqoS5aKdX0GbtKNRyEuSUdHcQZIHvz3x+40QffRpIwq7yCA/s9p?=
 =?us-ascii?Q?sAMZ/Ym7cZiq/3bnruOjoKF21oy8c7pdTcE43qgJJjhPxNGiBOK1/V9WcBPK?=
 =?us-ascii?Q?CtvIwa9MdYekEEegcETNaR1PbBTtL2SIyHEJajRDBAu4GdRD0Dv/hyQTaXe7?=
 =?us-ascii?Q?FR06ysEgAVidK5IdjK6N9a7tJ9WF4RS7k9jQ1H9G4fxNMASYncxoYMuA9ZbH?=
 =?us-ascii?Q?YtFwA+GhcjGb9nL/J9tfPU6Ix7/vpcwIZ2fLLi5JO+E68RQdroCnJLI5EQ0V?=
 =?us-ascii?Q?PGV5c3iVUbI/0I+ZcM0PAgKg8uo/cY5rNOttpeffVaHA7V8/4jWDx40Cn0uL?=
 =?us-ascii?Q?FNcL1OY7+iA5x5FEgKvxkB99fPFMKcANGzi8LFMiFtzP2wi24lh/dizzgqGF?=
 =?us-ascii?Q?tsTNJY/vvbH5oONkTBJC2wwkZGq9AlgCvAuA9SJ9jlMq1L4lWDZqvZ3n2e0S?=
 =?us-ascii?Q?tdvH06oQ4eqyuOez/PzgjdY4VwvRLgJMxSYRaeFWmeDkz3QyUsGYGCbC3Qzl?=
 =?us-ascii?Q?s+NkLV8f8t4qoN4wkXrbjlpGwHPCpiDIPlNiqnMnzIYO57w4CrutGPvAsJBr?=
 =?us-ascii?Q?FMWyJbCTbQdxxs4EFEaEIHJZ4GOgEuH+S9Yw+hn0+Z9JGMLRCS9O3IK+PMLx?=
 =?us-ascii?Q?HBFmHDFZ1jJHrA4TelXcKjGXxe2v746T3/9hF2wl/01oRRY1CbQLNluvTm3S?=
 =?us-ascii?Q?yrWUczb0z1cUBZB14dwrcfNtw6ba2ITGP308Ok/9kcHQAUEjrHXd0o2FDaY2?=
 =?us-ascii?Q?y7ZMGWXxm/bUudwhxuY+PdeKSgQwdm2a0McVQ/nqeMLd9Mjci0/hvwB9Y6tO?=
 =?us-ascii?Q?sOsLmQX+gyt79uhpvA/3T2fbfI2/0CBKnQYapBKbjlLJfVfV4r6K30UM+jvM?=
 =?us-ascii?Q?kLApAUxNeJXeNTdhNJJhP2TXkcJH+J9pXrtzKZKOREplMi5yI3kfB+F7k5vJ?=
 =?us-ascii?Q?bNg3DfJxdevnCX2jPYZ0a/IcjRAb3VWltwsX?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 02:28:24.8459
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6e8317d-7300-46dc-4191-08ddcb22ee9a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8559

Add an additional "caps" argument to the libxenmanage functions to
obtain a domains capabilities - control, hardware, and xenstore.

Update the xenstored callers at the same time.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
v2:
Add Juergen's R-b
---
 tools/include/xenmanage.h | 14 ++++++++++++--
 tools/libs/manage/core.c  | 21 +++++++++++++++++----
 tools/xenstored/domain.c  |  8 ++++----
 3 files changed, 33 insertions(+), 10 deletions(-)

diff --git a/tools/include/xenmanage.h b/tools/include/xenmanage.h
index 956b7a0a44..6fc0d9fe24 100644
--- a/tools/include/xenmanage.h
+++ b/tools/include/xenmanage.h
@@ -45,6 +45,12 @@ int xenmanage_close(xenmanage_handle *hdl);
 #define XENMANAGE_GETDOMSTATE_STATE_DYING     0x0004  /* Domain dying. */
 #define XENMANAGE_GETDOMSTATE_STATE_DEAD      0x0008  /* Domain dead. */
 
+/* Control Domain capability. */
+#define XENMANAGE_GETDOMSTATE_CAP_CONTROL     0x0001
+/* Hardware Domain capability. */
+#define XENMANAGE_GETDOMSTATE_CAP_HARDWARE    0x0002
+/* Xenstore Domain capability. */
+#define XENMANAGE_GETDOMSTATE_CAP_XENSTORE    0x0004
 /*
  * Return state information of an existing domain.
  *
@@ -59,7 +65,8 @@ int xenmanage_close(xenmanage_handle *hdl);
  * Return value: 0 if information was stored, -1 else (errno is set)
  */
 int xenmanage_get_domain_info(xenmanage_handle *hdl, unsigned int domid,
-                              unsigned int *state, uint64_t *unique_id);
+                              unsigned int *state, unsigned int *caps,
+                              uint64_t *unique_id);
 
 /*
  * Return information of a domain having changed state recently.
@@ -73,12 +80,15 @@ int xenmanage_get_domain_info(xenmanage_handle *hdl, unsigned int domid,
  *   domid:     where to store the domid of the domain (not NULL)
  *   state:     where to store the state (XENMANAGE_GETDOMSTATE_STATE_ flags,
  *              nothing stored if NULL)
+ *   caps:      where to store the capabilities (XENMANAGE_GETDOMSTATE_CAP_
+ *              flags, nothing stored if NULL)
  *   unique_id: where to store the unique id of the domain (nothing stored if
  *              NULL)
  * Return value: 0 if information was stored, -1 else (errno is set)
  */
 int xenmanage_poll_changed_domain(xenmanage_handle *hdl, unsigned int *domid,
-                                  unsigned int *state, uint64_t *unique_id);
+                                  unsigned int *state, unsigned int *caps,
+                                  uint64_t *unique_id);
 #endif /* XENMANAGE_H */
 
 /*
diff --git a/tools/libs/manage/core.c b/tools/libs/manage/core.c
index 8fb421df41..2fabdecaab 100644
--- a/tools/libs/manage/core.c
+++ b/tools/libs/manage/core.c
@@ -92,6 +92,7 @@ static int xenmanage_do_domctl_get_domain_state(xenmanage_handle *hdl,
                                                 unsigned int domid_in,
                                                 unsigned int *domid_out,
                                                 unsigned int *state,
+                                                unsigned int *caps,
                                                 uint64_t *unique_id)
 {
     struct xen_domctl *buf;
@@ -130,6 +131,16 @@ static int xenmanage_do_domctl_get_domain_state(xenmanage_handle *hdl,
             if ( st->state & XEN_DOMCTL_GETDOMSTATE_STATE_DEAD )
                 *state |= XENMANAGE_GETDOMSTATE_STATE_DEAD;
         }
+        if ( caps )
+        {
+            *caps = 0;
+            if ( st->caps & XEN_DOMCTL_GETDOMSTATE_CAP_CONTROL )
+                *caps |= XENMANAGE_GETDOMSTATE_CAP_CONTROL;
+            if ( st->caps & XEN_DOMCTL_GETDOMSTATE_CAP_HARDWARE )
+                *caps |= XENMANAGE_GETDOMSTATE_CAP_HARDWARE;
+            if ( st->caps & XEN_DOMCTL_GETDOMSTATE_CAP_XENSTORE )
+                *caps |= XENMANAGE_GETDOMSTATE_CAP_XENSTORE;
+        }
         if ( unique_id )
             *unique_id = st->unique_id;
     }
@@ -142,7 +153,8 @@ static int xenmanage_do_domctl_get_domain_state(xenmanage_handle *hdl,
 }
 
 int xenmanage_get_domain_info(xenmanage_handle *hdl, unsigned int domid,
-                              unsigned int *state, uint64_t *unique_id)
+                              unsigned int *state, unsigned int *caps,
+                              uint64_t *unique_id)
 {
     if ( !hdl || domid >= DOMID_FIRST_RESERVED )
     {
@@ -150,12 +162,13 @@ int xenmanage_get_domain_info(xenmanage_handle *hdl, unsigned int domid,
         return -1;
     }
 
-    return xenmanage_do_domctl_get_domain_state(hdl, domid, NULL, state,
+    return xenmanage_do_domctl_get_domain_state(hdl, domid, NULL, state, caps,
                                                 unique_id);
 }
 
 int xenmanage_poll_changed_domain(xenmanage_handle *hdl, unsigned int *domid,
-                                  unsigned int *state, uint64_t *unique_id)
+                                  unsigned int *state, unsigned int *caps,
+                                  uint64_t *unique_id)
 {
     if ( !hdl || !domid )
     {
@@ -164,5 +177,5 @@ int xenmanage_poll_changed_domain(xenmanage_handle *hdl, unsigned int *domid,
     }
 
     return xenmanage_do_domctl_get_domain_state(hdl, DOMID_INVALID, domid,
-                                                state, unique_id);
+                                                state, caps, unique_id);
 }
diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index e1d5e8d614..f119d714ac 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -667,7 +667,7 @@ static int check_domain(const void *k, void *v, void *arg)
 	unsigned int state;
 	uint64_t unique_id;
 
-	if (xenmanage_get_domain_info(xm_handle, domain->domid, &state,
+	if (xenmanage_get_domain_info(xm_handle, domain->domid, &state, NULL,
 				      &unique_id)) {
 		unique_id = 0;
 		state = 0;
@@ -700,7 +700,7 @@ static void do_check_domains(void)
 	struct domain *domain;
 	bool notify = false;
 
-	while (!xenmanage_poll_changed_domain(xm_handle, &domid, &state,
+	while (!xenmanage_poll_changed_domain(xm_handle, &domid, &state, NULL,
 					      &unique_id)) {
 		domain = find_domain_struct(domid);
 		if (domain)
@@ -829,7 +829,7 @@ static struct domain *find_or_alloc_existing_domain(unsigned int domid)
 	domain = find_domain_struct(domid);
 	if (!domain || !domain->unique_id)
 		dom_valid = !xenmanage_get_domain_info(xm_handle, domid,
-						       NULL, &unique_id);
+						       NULL, NULL, &unique_id);
 
 	if (dom_valid) {
 		if (!domain)
@@ -1377,7 +1377,7 @@ int domain_alloc_permrefs(struct node_perms *perms)
 		domid = perms->p[i].id;
 		d = find_domain_struct(domid);
 		if (!d) {
-			if (xenmanage_get_domain_info(xm_handle, domid,
+			if (xenmanage_get_domain_info(xm_handle, domid, NULL,
 						      NULL, &unique_id))
 				perms->p[i].perms |= XS_PERM_IGNORE;
 			else if (!alloc_domain(NULL, domid, unique_id))
-- 
2.50.1


