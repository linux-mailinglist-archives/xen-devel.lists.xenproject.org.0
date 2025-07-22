Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C02B0CEB1
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 02:22:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051888.1420341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue0lV-0007nS-21; Tue, 22 Jul 2025 00:21:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051888.1420341; Tue, 22 Jul 2025 00:21:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue0lU-0007kz-VO; Tue, 22 Jul 2025 00:21:52 +0000
Received: by outflank-mailman (input) for mailman id 1051888;
 Tue, 22 Jul 2025 00:21:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kPIU=2D=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ue0lT-0007Wn-Nz
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 00:21:51 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2412::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc0ff7fe-6691-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 02:21:51 +0200 (CEST)
Received: from MN0PR04CA0030.namprd04.prod.outlook.com (2603:10b6:208:52d::29)
 by SA3PR12MB9178.namprd12.prod.outlook.com (2603:10b6:806:396::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 00:21:44 +0000
Received: from BN2PEPF000044AC.namprd04.prod.outlook.com
 (2603:10b6:208:52d:cafe::d1) by MN0PR04CA0030.outlook.office365.com
 (2603:10b6:208:52d::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Tue,
 22 Jul 2025 00:21:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044AC.mail.protection.outlook.com (10.167.243.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Tue, 22 Jul 2025 00:21:43 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Jul
 2025 19:21:43 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Jul
 2025 19:21:42 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 21 Jul 2025 19:21:42 -0500
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
X-Inumbo-ID: dc0ff7fe-6691-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gFjdgDHiHs1tUzCoeYYsqPszXyxR9OdaV1Gn0dpoIqsdnc1Ketzp/hmPoBY8NTDgWQ8ZMp/jDG84CQAM0l7kMKffQkpoUiXtck9bCMR8Df9O5qO4pGMzqZBx3h4tC9h45mqsUhQJqi2+fCT9q74bhoXO9j45VWOTKg0rwSicoMjBQBZR4vgHvN2mJGmn3EKkegBlexdEWNbrQrwhUc5NkO7rdpd7qq7SZ4RwRjNQMjwlWmZibgaj71MUZkUAf7emvhSzpqshCxKWNGtCS0bmAEgVAF7gttzqt+qUb5Uim9mmfMpYau3uEmHif75pb6zj117jexTsudCYNGrmB29U8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zsySDYkOolkoADalZ9dV3T28Txw0iA1RiUk37Ldbnck=;
 b=hlD74L/dmQQ9fTFt+NbAtexE/tVA3gtF2uqvbG4/8NO4gc8u5949VugELa3BjLtEka68WfP2CIYKf7IHoro3VGbEY+vPKzSDkjrY2lvSB6A5ycG3ZDwacvq85f/Nl7FtBU3PmakdYE/GRaTQUaGSqViI8DEBFSY7vxtZul/CR892qAM2ShhIYWwW0EiY8ZBM40Y9Y5+tmzCpS7mVB81v/pNGxRW1XR/5SEHF9FXLz1Czp67hZXW7S15jgqxC/1yJZH9h8OkF7T05+bwhM+FDRpTObhmC0R/DlSiYzP6QNM8MviDqouaAMYN0ihj0s62YoOD7FowZvGKVjvDEUXgSUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsySDYkOolkoADalZ9dV3T28Txw0iA1RiUk37Ldbnck=;
 b=r2A7A6ij2g8ox7zz2gbpS4zfkBWfdW0DVKFN5Gjzq4laPaLR6f79fui25C6mFxbHwzYtQGhVA5hPZQOk8Hb5yq74KyP4Jojgk+W2zmN6ba8EGe0izCDr/SAOcidbAv6SJbj+UdSZRccF1aukFenIZ5ofAysAmPAWPQtZnxnV5NU=
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
Subject: [PATCH v3 2/2] tools/manage: Expose domain capabilities
Date: Mon, 21 Jul 2025 20:19:58 -0400
Message-ID: <20250722001958.174294-3-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250722001958.174294-1-jason.andryuk@amd.com>
References: <20250722001958.174294-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AC:EE_|SA3PR12MB9178:EE_
X-MS-Office365-Filtering-Correlation-Id: 0afff553-3b3e-4a5c-12d1-08ddc8b5bc7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IRI62enX/JNZTidcFo9vOdutIXrP+PF5qh7asKBtkXQcIk5tHVIqrDUNf8V4?=
 =?us-ascii?Q?LS4zw8QVzp+UoO32mRfseK4Wvl1oYsVBR8ODaVGv4CAzkcxmanY1nFxCCj0W?=
 =?us-ascii?Q?ZoS36IewrmKbNpnMr4uRSiqCosrRbLHEI2wfXzwfUrQLAgjP/FibBoGeN/Dy?=
 =?us-ascii?Q?XakIeHa4TP3ZUnnWOORmSlXVKFPXzQmuqh6CyPcsE5ph84v3bIa4TfXI1yql?=
 =?us-ascii?Q?BI7VrwGZVke4GZG0wDA8i/gALhVQhWuusRW73++Jte5wFvY8EbC7IOXDZMMo?=
 =?us-ascii?Q?IegDTmc+jsnkIBZOK+QGnBV0YrJgsEiwOHyCgLqoLULsEuNhZ4RgCfXx7ZSW?=
 =?us-ascii?Q?seKDpm/gVZ6bEphi4YT9rNosI30nBhdaV3hvL8xTDqVFUOBADrvdKG0j5PNx?=
 =?us-ascii?Q?OmYt7o/yHL9bzN875dFXXwccPly1qXqkusIY1yHaFHi5qAnO2r7QWKEo7fRW?=
 =?us-ascii?Q?R29pKBHqCfo6B+227OVxH5/VO0ZAtB9E0t8gm20uldmTme2WmAniu9HVMIgU?=
 =?us-ascii?Q?ZdfPanx0OFLN7AYfwOnJ8crTIn5n4ZPH7Nteijltl9PxI0Se4zM/FstAS4+R?=
 =?us-ascii?Q?m8vYeQAIdVkmlc69V66sYXqVsaWaNNhriIywMQGFRy73+K7zu3J5WfPrzM2b?=
 =?us-ascii?Q?xFzJ8KKDA1IyLDEtFKoLH3gvi4dD0V+o5UZCCApVjtrYUpnjXmea1/ACnkQI?=
 =?us-ascii?Q?FoEExAVL+tkBZxgg8yjZF5w8qKLWv3ZXtLhaxThjpeN/b5SyoJhwnEBsUTHL?=
 =?us-ascii?Q?/RirREbhsgdb9QiAcMeYyMUce6mtmpop5p0oMzCYELs2CxaDyucKS+FKjzq9?=
 =?us-ascii?Q?RgPPKGl7AWbFaZTk3H/HRugW/HCqiXB+THjrguOE1RDcSucHRmX7v/5izvAA?=
 =?us-ascii?Q?R7a2b28I8wQhw/j5T8HnwVQAHm4DBVeFkfMHAuUH99ivcpLwjQJm8akoHvle?=
 =?us-ascii?Q?QyKDWonOmdqRmBEfYg53+sFC8G+KR3ptn54Hqo+J+PuiAFlWvHOS84cOJLeH?=
 =?us-ascii?Q?11RAfCf/gPe4XVFlXfh5mNr7N8Ywxww4ovlXiZJhijIo2vE/14hI9TRsrQyW?=
 =?us-ascii?Q?OObNWXmut7SrADy38D940e4FMGu/bQuOkUMoel/cf5HbBQEjUtYKqUWjEdEL?=
 =?us-ascii?Q?GN32gq5uH/mJvonG8VbXJuq5E9QzDBHRmgbX9Pp5qjcglPm0yCiWnNpgr09n?=
 =?us-ascii?Q?IUz/1p7cDd4gyJX94r8tAeGSQLqbKNkv4nrvQRQAMSkvlPwcX8C3WFb56C2l?=
 =?us-ascii?Q?hqAPBtmw7SNictXwCkmnki6VhB6zVhsbCC7kwBWargjTnOGv/aLN+gXsnnD9?=
 =?us-ascii?Q?AjKxws6v6/2Oo9TPdx3Zmf+20JN6iVMas1FjZNZzDSJ3qw/oCkROpoEKnjbt?=
 =?us-ascii?Q?MV9ntrWbpQaNimD3pH5NeaZxp0mE8KJSKjvCOM6I7qKDsxZu9eQaOCvhWj4w?=
 =?us-ascii?Q?AD9KhCEb3QqMgrapOoNtTrJfoh9Iri2+fNUdc4rbT67lQDgJs7s2vxOc4Vt3?=
 =?us-ascii?Q?JRk/lI4KlTDHVUhzUASpQ9uvQRktC8MJHXph?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 00:21:43.3066
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0afff553-3b3e-4a5c-12d1-08ddc8b5bc7e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9178

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
index 5ca40e7d6b..1241f8c73e 100644
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
@@ -1381,7 +1381,7 @@ int domain_alloc_permrefs(struct node_perms *perms)
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


