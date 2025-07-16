Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52228B07F7E
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 23:22:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045784.1416059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc9aG-00015Z-L8; Wed, 16 Jul 2025 21:22:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045784.1416059; Wed, 16 Jul 2025 21:22:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc9aF-0000zC-Vp; Wed, 16 Jul 2025 21:22:35 +0000
Received: by outflank-mailman (input) for mailman id 1045784;
 Wed, 16 Jul 2025 21:22:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XbuO=Z5=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uc9aC-0007F2-VA
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 21:22:33 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20620.outbound.protection.outlook.com
 [2a01:111:f403:2009::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa399488-628a-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 23:22:30 +0200 (CEST)
Received: from CH2PR10CA0008.namprd10.prod.outlook.com (2603:10b6:610:4c::18)
 by IA1PR12MB6387.namprd12.prod.outlook.com (2603:10b6:208:389::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.33; Wed, 16 Jul
 2025 21:22:25 +0000
Received: from DS3PEPF000099D9.namprd04.prod.outlook.com
 (2603:10b6:610:4c:cafe::ca) by CH2PR10CA0008.outlook.office365.com
 (2603:10b6:610:4c::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Wed,
 16 Jul 2025 21:22:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D9.mail.protection.outlook.com (10.167.17.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Wed, 16 Jul 2025 21:22:24 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 16:22:20 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 16 Jul 2025 16:22:19 -0500
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
X-Inumbo-ID: fa399488-628a-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D+gIJMegVvA3LdlItvvNHPiaiI7f8ClRXtZr5AFVRfnf7Ibz8/OaYGmD7J6L4a0GH27/sPhOa6Uj9qE90fHMmtB5RIziB9sQ0MWlwwSs4tswNWXa8xvaP79bk65lC+xkppKixXphCHXsErs/OjNr0DejwsDwJiJoTL+wuZsBPP0F/8C2TrJ9sElGOKIuKHhqcchzk9KLx4TcOY6UUrdMnhdlcDQLV/ioeVY9HztstaM9NtAw8GmQteHqX3DlSDekMFulGZOgi+5haVJpagIKjeEv5saebYgh17ZWTVv9X3uCZFi++dieGFLqokQy5Bu5MY0HhzA7Pn+XoP+cW8PpKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QsiFTii6WnW1lgN0+xgzujQyv5+/+TSNTj97FMWM9SQ=;
 b=DiBMSgDzJ+9Ed35SR2eUx+9qxvApPVAXEv9qiT+da2iTfbLnEggPF7eh9PG47F9QbwS400zgdZ/kXxHICVSPxhAPfx9tUFiLPqgEBxmQVa1dJqmGLE+waSsUpHpy2Kdd/ReYVkpy8S58+R0F/ui7Kp0Lah/kd4+itxh9D0p2UnDNhaoPdMMxYxXL7ZpOuoq1odUYnMghMtykvU8YyapIgacDWhEmVxExFrlGD3rfBvgkg+x7Apcyj+j8WqNBgHvNjDB/L3RyHpWZdhOM3zf23qkZ5muPQqVqb6tdLyCIMNeyjxhwsGcw/BiQ0TQAWT0W/o6kQeZmVgIhc7kOikBIxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QsiFTii6WnW1lgN0+xgzujQyv5+/+TSNTj97FMWM9SQ=;
 b=cF9OH+uQz3hLLLT6QqhzTEJkuYs4fXaC/rK9lQyhe8XA6sS/vYRfgXSzwnbWKc8k9kreiKOBDeVrB2CwvTolXgLwBxtFJBzykEXzanzDeOr+JlCz5E6Zl4DrdjCKo7ptmm4aFUvdkFAI7tEZqozYkJPaKsnOw8nA6TOR6w/Zseg=
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
Subject: [PATCH v2 12/17] tools/manage: Expose domain capabilities
Date: Wed, 16 Jul 2025 17:14:59 -0400
Message-ID: <20250716211504.291104-13-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250716211504.291104-1-jason.andryuk@amd.com>
References: <20250716211504.291104-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D9:EE_|IA1PR12MB6387:EE_
X-MS-Office365-Filtering-Correlation-Id: 12e723c3-e236-434e-9065-08ddc4aedbb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?beghXXzOKb6qwRzonIWbcqZwKSeBKKe7taDlK1hVPkS2z7Jd7sevjuLGIzys?=
 =?us-ascii?Q?GeFAQtilHteMn1wp6wrSzzGp21iRTcN0T9xzsOgXKxEO9qfRVq5gQyzoSU+0?=
 =?us-ascii?Q?0LCReHZ80hxLAphOkUD+SnkMWmTpXy/gzbHNHSHFLuS/SMTDl0Gge5eU3o0O?=
 =?us-ascii?Q?gJehwa8XUj4/WtU+SCcrkxN1v9Nq4CV87RWCHrarfKMFRGyN4O6RMQ4tJDlY?=
 =?us-ascii?Q?aJKsoQSajKcSXyZY3RU5PFhOjnNRVbUgE4x+U0oKHNxn1A+ipFYjLTs8PjY6?=
 =?us-ascii?Q?Q2X00wU8yUAyp8388VcfWY6gzle2SpCMnxUoI2aN0TqOeGfwfJdPkMESnLwM?=
 =?us-ascii?Q?iKenugoFlZp0BJIxm4HIKdkUVXIunaC0ch1Bl1DMMN48ede2nblu1poa0Q8J?=
 =?us-ascii?Q?Ef9t7XZmqHnsGU+FulnT/KZ1iKknPWUI/e3esVafyglObXnn8WU62lfkR0a1?=
 =?us-ascii?Q?AFFLZVvyMYUka5WCASds/49OEsAnWLsu1rMtzOUtvqM2Re+ctSCrfy+p+rer?=
 =?us-ascii?Q?37d64LP9SE3Qh/J0OV1zwMAY7qLpsChLwiAQ/fwhXP9sQCcliC1q2pkUWsWU?=
 =?us-ascii?Q?WWUoaxk5KO/dIHj1lQGb6SpkKWJ5aOlEnUnn7vDGeheaJQiYykG8uZU10NJi?=
 =?us-ascii?Q?Y1REOmHQ8N/zhAPPhOeli6HtlSn4AedL+gN3B/d7mXP0CyDjr498ejCs7t6m?=
 =?us-ascii?Q?hya0Mz0CBz38FL0eL7d/r6iS4LEEWrMNPJxwudzc6NebmcCljFQ6ux17k4+p?=
 =?us-ascii?Q?lLriRUFtH7adHBGcvVTwnCffnUUEsglZiInjXuKINDPhxZZPccBjh8EnvdYU?=
 =?us-ascii?Q?W7s6pmQS7wWixhjWsg4UozfJXeJYfdOU3PrQRSzDmFOBeYTKF3s0auEFQcEp?=
 =?us-ascii?Q?cqUO7IAf2SEM4C74KYAO8Hcj3P+bQeSXhwWrPxlcpuAuH2UQAVViujoh/CNC?=
 =?us-ascii?Q?XxbYfd7Z42pBvMo1bEDjEfNZheILGZVqKNJOh0KfCEkPArbPAPcopythVonP?=
 =?us-ascii?Q?M2KyOsWnDrs6nozr0FOwMTDf9fAKIznqseJoJerfP6mZijKjwEWoIxldGeW0?=
 =?us-ascii?Q?Ysc3KX15z5LpJFmGCcTmzQkUQjeFgYsn5N5DhJXYVp+VeRFI+Saclfb0e7pu?=
 =?us-ascii?Q?uuu4dHiFsfCA6w6aWijZT0FTekeUCUogn+yC47gAFI8JN68O1gx518jqHplz?=
 =?us-ascii?Q?6EJvKrkUDTVJq2IbCxPP4wdbtXhXXQpwwUFvGZXMYdXIU2PRbYDKQHJjZCmI?=
 =?us-ascii?Q?g8JqE5CCX1gE0Uk/dqvhDLrkH8t0T/DIcbDHRETyFYi5kQLcEv7ehoDoydX5?=
 =?us-ascii?Q?kZMriGZphrpjLs5DmQEc9CiXVlShQFPsT+GzUeSJFyfAckcU1yB+u7zfsOG/?=
 =?us-ascii?Q?UKLi8/fvK+f/93VfjciNfL6vQ65zvgVvuk+gMv7gb2HM71SlLzW5w4qFhv1Q?=
 =?us-ascii?Q?czv7ll8syMIdSLJawLM4X68V2q6FDAB1e+KxxctHlabtlJhou+NVXm7Je/T6?=
 =?us-ascii?Q?pT4O1R/njqK2fgY3hbKqIwn25OQSWw3EOHlS?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 21:22:24.5086
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12e723c3-e236-434e-9065-08ddc4aedbb4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6387

Add an additional "caps" argument to the libxenmanage functions to
obtain a domains capabilities - control, hardware, and xenstore.

Update the xenstored callers at the same time.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
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
index 94b2a1eaa7..d2b6fffa62 100644
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
@@ -1383,7 +1383,7 @@ int domain_alloc_permrefs(struct node_perms *perms)
 		domid = perms->p[i].id;
 		d = find_domain_struct(domid);
 		if (!d) {
-			if (xenmanage_get_domain_info(xm_handle, domid,
+			if (xenmanage_get_domain_info(xm_handle, domid, NULL,
 						      NULL, &unique_id))
 				perms->p[i].perms |= XS_PERM_IGNORE;
 			else if (!alloc_domain(NULL, domid, unique_id))
-- 
2.50.0


