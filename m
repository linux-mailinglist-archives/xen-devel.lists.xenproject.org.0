Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FE5B127B7
	for <lists+xen-devel@lfdr.de>; Sat, 26 Jul 2025 01:59:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058719.1426240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufSK9-00086G-KQ; Fri, 25 Jul 2025 23:59:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058719.1426240; Fri, 25 Jul 2025 23:59:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufSK9-00083e-F3; Fri, 25 Jul 2025 23:59:37 +0000
Received: by outflank-mailman (input) for mailman id 1058719;
 Fri, 25 Jul 2025 23:59:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFeG=2G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ufSK7-0007YZ-Tu
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 23:59:36 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2415::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69205144-69b3-11f0-b895-0df219b8e170;
 Sat, 26 Jul 2025 01:59:34 +0200 (CEST)
Received: from BN8PR03CA0016.namprd03.prod.outlook.com (2603:10b6:408:94::29)
 by DS7PR12MB8202.namprd12.prod.outlook.com (2603:10b6:8:e1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 23:59:29 +0000
Received: from BL6PEPF00020E61.namprd04.prod.outlook.com
 (2603:10b6:408:94:cafe::a7) by BN8PR03CA0016.outlook.office365.com
 (2603:10b6:408:94::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.23 via Frontend Transport; Fri,
 25 Jul 2025 23:59:28 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00020E61.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 23:59:28 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 18:59:28 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 18:59:27 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 25 Jul 2025 18:59:27 -0500
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
X-Inumbo-ID: 69205144-69b3-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pAjxj6Us9duQDCI4DlijVmIjDbXlSWG1CkR8qFJ3iuc8AByiyDEpYtAm0Qz7+R+Wk4PgzRsFcFqA3c4FvX9X6aVL8dC4BgDUYtBCqa9FFgPWEclZ+samOOOXq3gnvQSOKsBuzCOvdW1fggMX/pSfFnu5NObTcpWYs3Bzjd9AL7lKYZsNtQs+B+PWMLf8QSNFZHDSGO/I+bXnm41pxHdmSa5MLfPikx5e2ifTTNV+3utty0FH335ZniXAA9KLK0fLT2l6G1s0W49eyZThqFQjcyZi5O15QhGpbFHXR4hIc7HlFE2AEOCmDi14PI2Y6Eq2Icgb/dG/kZbPnBDp3BLL8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AREAC1SCEzA+WwtsK+zwuoyjXAwPYcG9bspmaJd2m8M=;
 b=W/JVZgoqeRV1jh9+w9Rq+D7Z/cX3fDfs+HMl8HOOEL3NklwKZ08pLx9+U1f7lleayIX1+fpNYDM+bjGpRI3oKCQY9F5CijwAi0/HEI5dLF3/Fad/i4p+rjc5livm4UUoNSoXMAPrKblyZoxOhzMyVt7ComOkuChY/Awm3YtjS/X34A+R9YL+WbvcZ7eJZqX1N5jEWk/7gWNKqClw5eH0miqt0h4hUHRBPMmQFJ9Zqpftx5d4bdUrufsTcpdCpO0oD73Yi1yUtViLQpwsvEtHbWDoTjF4Rse9FWbBTW2kkko7ryCPCMivUIooiszycG1mSAUXv2U6kKp+lpy4JfwHvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AREAC1SCEzA+WwtsK+zwuoyjXAwPYcG9bspmaJd2m8M=;
 b=qqKKTija580/KUoV6InW4iHk/wu0J0/iO1qEXOYuhyyl71EiDVFRO6KQaHU1dfjxrj6Va4NV27M119hTU0mlr0oYOfn1db/qkGGPv37G7HrphQXpHBQW0vkKceF4s4YupprZ53edO05e2eHC2Oc29SxdxiBq2zajZeaVFSJqgJI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>
Subject: [PATCH v5 02/11] tools/manage: Expose domain capabilities
Date: Fri, 25 Jul 2025 19:58:49 -0400
Message-ID: <20250725235858.666813-3-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250725235858.666813-1-jason.andryuk@amd.com>
References: <20250725235858.666813-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E61:EE_|DS7PR12MB8202:EE_
X-MS-Office365-Filtering-Correlation-Id: 88f4f6be-3057-4d38-006c-08ddcbd74a72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8HyAyxs6xZ1ybZhPyUgLVGCY7gcXMB7QPfzx9NOqN6qhc6eIJrzmNym8O8Ud?=
 =?us-ascii?Q?lwU//OjZjhr7Ipke8FTeWNz5WZEc3DbEF8wd9s57mBdNy+47N5GmhJhzXT6s?=
 =?us-ascii?Q?xfs0FGG812Ejod12m0ZaX4XpcJoFE3IwyyVKi3PG6ao90ucR+cyYPFtv6Y/8?=
 =?us-ascii?Q?KwK/faI2/lZ9+dmZ1WF1y3jVBih6M/LQ43pICeb1dimQFGB8Ft5qCj+MaC83?=
 =?us-ascii?Q?4swWe2kvPFueR1Xhtm138oVGYjbrggfZAcUL0xP66B7TAKeYgRY5P874JXCY?=
 =?us-ascii?Q?iTog56GDIKXogp8sMBpyENbHoKavsUJVJaeq/HwjyBiHL9WpNt0ORkGJqbEC?=
 =?us-ascii?Q?eJ+6Gwf5p+wBJ05S4Oun7eS0nsaUjD9RBSjkEjZp2LZ/MRlemg3QEzWwhvvq?=
 =?us-ascii?Q?uPTaGUUanZWBqADKSeaJpZ9j48qqNGxDXuvrzZF6HuhRcvj+dT5j6WqUa82J?=
 =?us-ascii?Q?nWoFbAAEeN5oVLLHNDNe7puI9PUYt2+itErgjF3+QUcLaZII09PMzsv8UZYv?=
 =?us-ascii?Q?KM/qSwZ88ukWWw/PKBTjDPjzH3VUj6Q+guBGf8bjiABgS18OpnCy78c6Toxb?=
 =?us-ascii?Q?OWRVy6cg0yCfW2mY2kZkAWSGQGZ+iZoPEA/gPUNxhkcteK1e95XTaB2aO7N6?=
 =?us-ascii?Q?HPnG57iudOnxsfH6k/1RCuZpZh/ZrWhJJ9DA35CpNunk5k291I+tjncfIdmF?=
 =?us-ascii?Q?O10bz6YmtSHIR9IsNMf4KlqTyG9WkqHw5KFOBDlrMlVxrux3QTLvybWvEu3P?=
 =?us-ascii?Q?h/MhQ1pVf5UvFJJOLfZH86mUynzQbyPn7XIO0qkGPX8Qt1CgMxQYG92jEhv6?=
 =?us-ascii?Q?VZY4xum4KogN6jPy2u1wWS3nJdQAFiow7JPCE9Krbf1oTlEeu4NvYI9/S4+A?=
 =?us-ascii?Q?XSCpejz9DQfEwET+1DWgTD6gQRHSWzpIko+woeCr0oBvOmvxgjPqq+IQ1qaW?=
 =?us-ascii?Q?D2sHqKNAfQ5gUEYlyuNhEqk8xQOcbUVR//4TG0LKwufrubycnwHht7vQGUHu?=
 =?us-ascii?Q?PCGXK7AJPefCVtFbLHlE/+zubC9e3rrcmohkH9TcVfaw9W/qbR/M1LSmA5un?=
 =?us-ascii?Q?1aFal/o8ODM2fcEblJR5et6VHmACHyPH508zpF0Maxtgjx7vdICxFNMBWvjM?=
 =?us-ascii?Q?shIIn7cpzfU5NxbF+r09SEbQumZ+GG5BVpDbUTQKWj8lORWq8/Zmiah5dXY1?=
 =?us-ascii?Q?TEtfLpVjNKzpVS+M8xolSafaRsHP02Nzcpi/YQP1DmuQEofJaTjn4T2Q1ceu?=
 =?us-ascii?Q?D4VH7QcVEZ+4NH+akoQbXFYV/n9C+7CtJdWGzAOtkwNcZpoCNkHVEqFyyehe?=
 =?us-ascii?Q?2KTctAQIgb3XM8q45/KiJu4r8eoFGuIfW5pLQS2EjMVARvHzJ0rYMb0O9ZRw?=
 =?us-ascii?Q?hSSWVGwNHM9g6QDBhLJ9OTI++As3BRFSL4Vrc+CAoPCVBzCu1LQc1EalC1Vv?=
 =?us-ascii?Q?94fboR0EXct9GrAdEOok8PuS9caYll1bNUMlzPZ4FCoMkpZUb1fweybjiEOy?=
 =?us-ascii?Q?0tbIQJF4IpwRbxADfCtxs/y/xxt/BOcXbZf+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 23:59:28.3438
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88f4f6be-3057-4d38-006c-08ddcbd74a72
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8202

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


