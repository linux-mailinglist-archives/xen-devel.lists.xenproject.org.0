Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC71BB07F78
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 23:22:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045788.1416089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc9aK-000230-Na; Wed, 16 Jul 2025 21:22:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045788.1416089; Wed, 16 Jul 2025 21:22:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc9aJ-0001qc-TZ; Wed, 16 Jul 2025 21:22:39 +0000
Received: by outflank-mailman (input) for mailman id 1045788;
 Wed, 16 Jul 2025 21:22:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XbuO=Z5=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uc9aE-0007F2-VB
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 21:22:34 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20627.outbound.protection.outlook.com
 [2a01:111:f403:2416::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb4c25b5-628a-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 23:22:31 +0200 (CEST)
Received: from CH2PR10CA0004.namprd10.prod.outlook.com (2603:10b6:610:4c::14)
 by IA0PPF864563BFB.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bd7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Wed, 16 Jul
 2025 21:22:25 +0000
Received: from DS3PEPF000099D9.namprd04.prod.outlook.com
 (2603:10b6:610:4c:cafe::29) by CH2PR10CA0004.outlook.office365.com
 (2603:10b6:610:4c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Wed,
 16 Jul 2025 21:22:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D9.mail.protection.outlook.com (10.167.17.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Wed, 16 Jul 2025 21:22:25 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 16:22:24 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 16 Jul 2025 16:22:23 -0500
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
X-Inumbo-ID: fb4c25b5-628a-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OzSVA8Q/iKphaiWrbuNC6AaqnAxqewFTmySeLSsA8q0rTHzRJsjIqaUWLn/CikT70w/TJXX3mxji8gPJ4EThgvnlbDIMZPozjsYywghXo4geIjeezZg4FA3+K4aFCqUkvRx/8BoaxsFgqnbEPnyakmm79qRhike6uyPZlcbP898VJDKMSVc5XW/9uvmqHs9WB0kuTuiNHzlrTsAkaijpKlCBYjn+vHwJSale+BgmM/XXTb7VIcvdcVro3BEoB9SezsSdXJ6HY2Jt+frVn7OHzSIVXxDyvbCvcLDmOW3SHYoeIoK6iPGeOXPL7l+eQNIanllSf1JTbnetiRCj4Fibfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9COZFGWceoTfc6y3naDMizwa1w65msAR0A5PQbH+Dzs=;
 b=DVOeCa0nKVk17A7BN93Ubx2BpMHsBVoTVxmKqBxGKok1GayHf7eNHP3sf3ipeCthK1BHyfc8slIGXEFpJv5597zhwIJJIwm3I0ttCyeKkQmmv3mX4BR6BsBahL5WJKXX1Hij2tJpTfdsTNYeYxaXkldHnsWEFHZHCwzqTj/yX6gUckTnRR7pa0XQiF1m3/qcGkXhKw2OLA+aliD06kHm61P35IZ3UWyi84y4erZ1EfPf7p4Ak/VWS3fR8QVQiXC8aEp91dhz8pL5Uvg02hk/UZwO/1sG6Zb3BKISY3YssOzlcG/4YKfh+8b0rKfZcr0ZlXc1j30oVNBvq9i6vFIF5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9COZFGWceoTfc6y3naDMizwa1w65msAR0A5PQbH+Dzs=;
 b=RXEsNtxp1r9c1LamiQPiMw70aSSK89p/JZP0Ewdnup726Jpy/ujnrBQqrloJcM2Wy5/Zlhtu9CrNZG9lWDFjPx42/mzfMkY6e5sjdoOFfjD56wH96wfUaZIPQ06TPFvj49FGwmJytUeyYzlVmZyDaeWVRPW1jbXjxbYQlIYBrwI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>
Subject: [PATCH v2 15/17] tools/init-dom0less: Factor out xenstore setup
Date: Wed, 16 Jul 2025 17:15:02 -0400
Message-ID: <20250716211504.291104-16-jason.andryuk@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D9:EE_|IA0PPF864563BFB:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f78cb91-058a-480e-0ce0-08ddc4aedc3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1aekVOOjMUPtFhpxPC5K3Fa+WsSuNoaOE4qCeOnclLoBuDyx8gO6J1BQsUJK?=
 =?us-ascii?Q?ym0kLpMnXQslQvb5LrI9RPIQihJMOcqIhtD3fm0Gz/q+Ucfsm1FxA9R8MVIL?=
 =?us-ascii?Q?omtQdOi0J0UuPjTcAPmyir0nF5BXbIqWESHkWthDvAdtM0CUKIlpbErNc1Xs?=
 =?us-ascii?Q?deaSr9dNPWRj0ixdJtIbF4k+xCNE2Fm/WE2YNMoYJFd57mmiyWmd4zIboUQO?=
 =?us-ascii?Q?QuxeexDevH21W8wD1kVHuPd8c+28qUj2sWEWoRCyfSGrJmRzXGho/UthRSVg?=
 =?us-ascii?Q?ih2Puh9+YBIRDrWchcCBCCLRn+kijlAIL2fGSgbuPQGWHceRX2rY/Fjjdjqu?=
 =?us-ascii?Q?A4XGgEenOXM+iB66i4VoKimW5y9PCpyw1lSoqhepayUM7Oe1gNncAY4dklEi?=
 =?us-ascii?Q?wwOWTXLV4Lfr/JudW9am3Qb7GsJQYZdEthMJje+Mn1Ulo+uH9GPwQpkhcHsC?=
 =?us-ascii?Q?jf6KKaf8efaGWIIkscHGyTjf1kis4DtaLm+lrveWyroLV3Yt5GxQduNq+Afw?=
 =?us-ascii?Q?SlwgBzR2LW4Bu2sFqAHILJuFoRmzrjyce1gwByvMbqM5NCmtxCLLcmymR5Sx?=
 =?us-ascii?Q?UXC1YceuNY0/KCsvtZwN6y3oGWBPENx0GQAapU/7kA9XENkz6jAeWKznZc1C?=
 =?us-ascii?Q?SC7nwi5YNGFSMb8qqEXW4eRLiHQfDYtMGJZAUG4o+cjOtOpMhQ/r6tjopQLQ?=
 =?us-ascii?Q?ZQJ+ruukQeaUBDAiU9WldmSEFcYER2MnCxCY4eade0G4CpHPJAhwIjhWejuk?=
 =?us-ascii?Q?TJ22HGTctsgJq7fM2wEowQRRN9TlB7Vgwvyumz2mx6KNzs6kOfRwvbH5hQu4?=
 =?us-ascii?Q?VlSXNlqRjspztMnwJ/e5uTEd5G4vi2La3NvXaEHp3KAfbxj60EJ76gbK4qEG?=
 =?us-ascii?Q?+oOgM7YmwE2uqc3GmFn5dSCJF+rkV6ZZQs+3dSbPv2ykTBm+yMUW/EsrFzc9?=
 =?us-ascii?Q?TUZYn4sS3gNPi2BY+KKP21dKcPe4ZHUi9AOORT2pye2/VoxBHJ0A0l83Bp94?=
 =?us-ascii?Q?f0FpOHxsP7v0+mT4d4fXGcqCOYhp8dYB/5XKIFzfgm/LUhCJoAOJkUPpaKDy?=
 =?us-ascii?Q?G/JcFRPOpjLm+QCWQ2LnuI5DMDVixj8X+5tVyfjbad4KiZYW1KyHdW9H4QsO?=
 =?us-ascii?Q?WLVKB2EJIi7TTnzAPLX0oQsBuB9WCbPsZn/lEjgcYv6Iqf/C/SHFtX9xoGvl?=
 =?us-ascii?Q?Fc0x/cjm3rN4LxGi5QWfE4efU3mfrT4NoUj/8i42EOCTQ+nm58NRCbpgAz2I?=
 =?us-ascii?Q?I++fx5YeGlkEQwgZaztZLKIVCKsFT4NfCsqKzomQRH3VClz9JyNo9N24xNJb?=
 =?us-ascii?Q?ZlhbQEsw/zs4x0HG+W5fho/GM9C2nXtASHBqDX2WMAtgvKpBS/wh8YWvwYjk?=
 =?us-ascii?Q?+0W5rPu+czVqdlcqWP8OY4uho/8dg+eXMVKw5gUUj71W0dD7wIAjNZBw4sS0?=
 =?us-ascii?Q?EpFe6dQCul81fJZSqfsB/y/GvbCkH29PYYedCmcZoqy7byKT795HgIAwme6q?=
 =?us-ascii?Q?YWi1RLz6MU6nBkj3P/Iy1ingW+wucBz4AkVn?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 21:22:25.4161
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f78cb91-058a-480e-0ce0-08ddc4aedc3f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF864563BFB

Factor out the xenstore setup code into configure_xenstore().  This is
in preparation for handling already-introduced domains.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 tools/helpers/init-dom0less.c | 51 ++++++++++++++++++++++++-----------
 1 file changed, 36 insertions(+), 15 deletions(-)

diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
index a182dce563..6ae7cf2e7e 100644
--- a/tools/helpers/init-dom0less.c
+++ b/tools/helpers/init-dom0less.c
@@ -235,43 +235,43 @@ err:
     return rc;
 }
 
-static int init_domain(struct xs_handle *xsh,
-                       struct xc_interface_core *xch,
-                       xenforeignmemory_handle *xfh,
-                       libxl_dominfo *info)
+static int configure_xenstore(struct xs_handle *xsh,
+                              struct xc_interface_core *xch,
+                              xenforeignmemory_handle *xfh,
+                              libxl_dominfo *info,
+                              uint64_t *xenstore_evtchn,
+                              uint64_t *xenstore_pfn)
 {
-    libxl_uuid uuid;
-    uint64_t xenstore_evtchn, xenstore_pfn;
     int rc;
 
-    printf("Init dom0less domain: %u\n", info->domid);
+    printf("Introduce dom0less domain: %u\n", info->domid);
 
     rc = xc_hvm_param_get(xch, info->domid, HVM_PARAM_STORE_EVTCHN,
-                          &xenstore_evtchn);
+                          xenstore_evtchn);
     if (rc != 0) {
         printf("Failed to get HVM_PARAM_STORE_EVTCHN\n");
         return 1;
     }
 
     /* no xen,enhanced; nothing to do */
-    if (!xenstore_evtchn)
+    if (!*xenstore_evtchn)
         return 0;
 
     /* Get xenstore page */
-    if (get_xs_page(xch, info, &xenstore_pfn) != 0)
+    if (get_xs_page(xch, info, xenstore_pfn) != 0)
         return 1;
 
-    if (xenstore_pfn == ~0ULL) {
+    if (*xenstore_pfn == ~0ULL) {
         struct xenstore_domain_interface *intf;
 
-        rc = alloc_xs_page(xch, info, &xenstore_pfn);
+        rc = alloc_xs_page(xch, info, xenstore_pfn);
         if (rc != 0) {
             printf("Error on getting xenstore page\n");
             return 1;
         }
 
         intf = xenforeignmemory_map(xfh, info->domid, PROT_READ | PROT_WRITE, 1,
-                                    &xenstore_pfn, NULL);
+                                    xenstore_pfn, NULL);
         if (!intf) {
             printf("Error mapping xenstore page\n");
             return 1;
@@ -282,16 +282,37 @@ static int init_domain(struct xs_handle *xsh,
 
         /* Now everything is ready: set HVM_PARAM_STORE_PFN */
         rc = xc_hvm_param_set(xch, info->domid, HVM_PARAM_STORE_PFN,
-                xenstore_pfn);
+                              *xenstore_pfn);
         if (rc < 0)
             return rc;
 
         rc = xc_dom_gnttab_seed(xch, info->domid, true,
-                                (xen_pfn_t)-1, xenstore_pfn, 0, 0);
+                                (xen_pfn_t)-1, *xenstore_pfn, 0, 0);
         if (rc)
                err(1, "xc_dom_gnttab_seed");
     }
 
+    return 0;
+}
+
+static int init_domain(struct xs_handle *xsh,
+                       struct xc_interface_core *xch,
+                       xenforeignmemory_handle *xfh,
+                       libxl_dominfo *info)
+{
+    uint64_t xenstore_evtchn, xenstore_pfn = 0;
+    libxl_uuid uuid;
+    int rc;
+
+    rc = configure_xenstore(xsh, xch, xfh, info, &xenstore_evtchn,
+                            &xenstore_pfn);
+    if (rc)
+        return rc;
+
+    if (xenstore_evtchn == 0) {
+        return 0;
+    }
+
     libxl_uuid_generate(&uuid);
     xc_domain_sethandle(xch, info->domid, libxl_uuid_bytearray(&uuid));
 
-- 
2.50.0


