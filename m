Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E4089D1A8
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 06:54:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702123.1096983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru3V7-000521-5v; Tue, 09 Apr 2024 04:54:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702123.1096983; Tue, 09 Apr 2024 04:54:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru3V7-000502-1h; Tue, 09 Apr 2024 04:54:29 +0000
Received: by outflank-mailman (input) for mailman id 702123;
 Tue, 09 Apr 2024 04:54:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5At3=LO=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1ru3V4-0003cc-Qd
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 04:54:26 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2414::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3cb58b57-f62d-11ee-843a-3f19d20e7db6;
 Tue, 09 Apr 2024 06:54:25 +0200 (CEST)
Received: from CH2PR10CA0027.namprd10.prod.outlook.com (2603:10b6:610:4c::37)
 by SJ2PR12MB9209.namprd12.prod.outlook.com (2603:10b6:a03:558::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 9 Apr
 2024 04:54:19 +0000
Received: from CH1PEPF0000AD77.namprd04.prod.outlook.com
 (2603:10b6:610:4c:cafe::90) by CH2PR10CA0027.outlook.office365.com
 (2603:10b6:610:4c::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.28 via Frontend
 Transport; Tue, 9 Apr 2024 04:54:18 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD77.mail.protection.outlook.com (10.167.244.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Tue, 9 Apr 2024 04:54:18 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 8 Apr
 2024 23:54:18 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 8 Apr 2024 23:54:16 -0500
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
X-Inumbo-ID: 3cb58b57-f62d-11ee-843a-3f19d20e7db6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b/2AthjBxPKlrB+mUWTrxXkzZIcuyxt7a6wUCo1JnuIBaICh27paQZZ7vSuU3iICU4buFyMJT17rGRa8wACpFWFPaMBsjMWbonsfr1yWkvao299Uj9PJ5N58ng/C6FO1Ya/4WRMxeo2ImJibFHStq0GWI5uE1ThpbMjn3pUlQPxeQK2d+F1okqDE3anWPpaGMkTa48bb7eMSR64GWunQXpiqk2otRaAbjAtKXgXVIUAppIfEoyUyY37iujEITv1WRRpmrxLJlcTalsV/c8OwUAryxB1BwYkDE38ywejGFsgW97G4lOBaf9cWDTLofz2x39nELkqox+iw0DLcIh2oqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Li9+zc6kRUe5iMzs7R2wr0uz8YAnXguSopUS5SYA47g=;
 b=OqWfeC/9Lfqj6GaqQ1MEbS8PUuklDMKThYUhLNOUeJOtegcdi33H9WYEx6jyzns+DgI0ItFk2zKXmxDFcizKB0EHDAl1k5TAbcVzhDZiVeM1lnlwOScWDf7ju7tHp9yUk8Cykam0eWXlSmPa7TEw0r9IoNqkD1Ab3SCYkgp4+vDfTi61aK5W6o6gSSRqptEO5gaEfHzoywokIcTFTq70BtM+mLNZNlJU8AV2x1IKjIG0GxHrY39hckJeGnOD51FTNH8CE9cSeF/fcgLFAT7OaobbbokmVlkseNP16OVsaWykQRodszSNFyvMLtQpn7iXVbyOZkX25yYOI1jYrO/NFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Li9+zc6kRUe5iMzs7R2wr0uz8YAnXguSopUS5SYA47g=;
 b=w6gdL+0sGsPtVfZBVjgJElGDFfj24dsXE67NCBVamrnpIk6gt7xCa7ncoah6PrkXBrQEIMSTJjgfuXtI3W1n1VDeuV/Yqz3fY3CKmGfij9FuhS7zyy6Ogz8jCzPAw2nwiIFjzw6eh9XPaQvNhmieTsXNXexsLITWswplLzCQ/KE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <xin.wang2@amd.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Jan Beulich
	<jbeulich@suse.com>
Subject: [PATCH v4 5/5] tools/libs/ctrl: Simplify xc helpers related to populate_physmap()
Date: Tue, 9 Apr 2024 12:53:57 +0800
Message-ID: <20240409045357.236802-6-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240409045357.236802-1-xin.wang2@amd.com>
References: <20240409045357.236802-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD77:EE_|SJ2PR12MB9209:EE_
X-MS-Office365-Filtering-Correlation-Id: a57aa47a-1741-4c2e-d7e6-08dc58511d75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ju7yXtu7rExQtyNrbLFzy1nLd45LH7F5tAHTYN1CEXy52IeDfhavaPKeaRL0h6WNjoshZju7efnBC1EEEj/Z+QKk1AD66FLuI5uqa905dDAhwO4U0ENC60ts7HIcg8H4FhnVRD4kGHQhfIimXoO1Gs7M1PNHgcZWWCR80kma74yMp2YBdgCOYNc7W1GFXHO+Twkj+J3cDgzs7bRlH3cZ62WGn0biRgZESLn0suDLNawx19O9gznU1xEAC2j0ZhRBgWuHHPmnbINctPGkuz/TZMYf3sHqrsarywQnjnb/VT3/B/RJWBXo6SbuhJjm9d4viui+16RMiFBydu9a6B1rFyxw47ggt/PizjLRPDjyOZPk0p6NIXeSjv5OGzWojsd49M+5d12T4oWO4WLLNvzdmCDEsRWsSt2YsXAyTmD524BUzlqz7WP+zB1/sZ/lGPjXaluJ6qG8QQ8B9JlzakSnZB80GYpXk8WoYJNnlk4xtnfcpOUc3P5BemWZpAFfsNgVLDJPWgeGjoB3LdeeXnru1T1NKfqizDiWkoNI6rSGhbY30Ihvaz7r/Xm0/Gu6xV+E9IUOWiMgOsAST+iS9hg5lthWTMqxLQtEC2/VKMpRrTK38Ubv6DG3Rcn/s1mFz0G/W3XI4xLsOFf/GGRqqESOgDOjQzOri9skOeoIJeowXAS4L9xQ4O6GRPXp6AFgGR6kWaClYHFV2TAHEKSn7/6Kqm+HuZmsxUk/GOv02BKcF/EPQDAvRWxfu0DWBAeKsHtU
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(82310400014)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 04:54:18.9000
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a57aa47a-1741-4c2e-d7e6-08dc58511d75
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD77.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9209

There are currently a lot of xc helpers to call populate_physmap()
in the hypervisor with different parameters, such as:
- xc_domain_{increase, decrease}_{reservation, reservation_exact}
- xc_domain_populate_physmap
- xc_domain_populate_{physmap_exact, physmap_heap_exact}

Most of them share the same and duplicated logic.

Extract the duplicated code of these xc helpers to local helper
functions to simplify the code.

No functional change intended.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
v4:
- New patch.
---
 tools/libs/ctrl/xc_domain.c | 178 +++++++++++++-----------------------
 1 file changed, 62 insertions(+), 116 deletions(-)

diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index 82c1554613..d023596bed 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -935,7 +935,7 @@ static int xc_populate_physmap_cmd(xc_interface *xch,
 
     if ( xc_hypercall_bounce_pre(xch, extent_start) )
     {
-        PERROR("Could not bounce memory for XENMEM_populate_physmap hypercall");
+        PERROR("Could not bounce memory for hypercall %u", cmd);
         return -1;
     }
     set_xen_guest_handle(reservation.extent_start, extent_start);
@@ -946,39 +946,8 @@ static int xc_populate_physmap_cmd(xc_interface *xch,
     return err;
 }
 
-int xc_domain_increase_reservation(xc_interface *xch,
-                                   uint32_t domid,
-                                   unsigned long nr_extents,
-                                   unsigned int extent_order,
-                                   unsigned int mem_flags,
-                                   xen_pfn_t *extent_start)
-{
-    int err;
-    DECLARE_HYPERCALL_BOUNCE(extent_start, nr_extents * sizeof(*extent_start), XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
-    struct xen_memory_reservation reservation = {
-        .nr_extents   = nr_extents,
-        .extent_order = extent_order,
-        .mem_flags    = mem_flags,
-        .domid        = domid
-    };
-
-    /* may be NULL */
-    if ( xc_hypercall_bounce_pre(xch, extent_start) )
-    {
-        PERROR("Could not bounce memory for XENMEM_increase_reservation hypercall");
-        return -1;
-    }
-
-    set_xen_guest_handle(reservation.extent_start, extent_start);
-
-    err = xc_memory_op(xch, XENMEM_increase_reservation, &reservation, sizeof(reservation));
-
-    xc_hypercall_bounce_post(xch, extent_start);
-
-    return err;
-}
-
-int xc_domain_increase_reservation_exact(xc_interface *xch,
+static int xc_populate_physmap_cmd_exact(xc_interface *xch,
+                                         unsigned int cmd,
                                          uint32_t domid,
                                          unsigned long nr_extents,
                                          unsigned int extent_order,
@@ -987,58 +956,75 @@ int xc_domain_increase_reservation_exact(xc_interface *xch,
 {
     int err;
 
-    err = xc_domain_increase_reservation(xch, domid, nr_extents,
-                                         extent_order, mem_flags, extent_start);
-
+    err = xc_populate_physmap_cmd(xch, cmd, domid, nr_extents,
+                                  extent_order, mem_flags, extent_start);
     if ( err == nr_extents )
         return 0;
 
     if ( err >= 0 )
     {
-        DPRINTF("Failed allocation for dom %d: "
+        switch ( cmd )
+        {
+        case XENMEM_increase_reservation:
+            DPRINTF("Failed allocation for dom %d: "
                 "%ld extents of order %d, mem_flags %x\n",
                 domid, nr_extents, extent_order, mem_flags);
-        errno = ENOMEM;
+            errno = ENOMEM;
+            break;
+        case XENMEM_decrease_reservation:
+            DPRINTF("Failed deallocation for dom %d: %ld extents of order %d\n",
+                    domid, nr_extents, extent_order);
+            errno = EINVAL;
+            break;
+        case XENMEM_populate_physmap_heap_alloc:
+        case XENMEM_populate_physmap:
+            DPRINTF("Failed allocation for dom %d: %ld extents of order %d\n",
+                    domid, nr_extents, extent_order);
+            errno = EBUSY;
+            break;
+        default:
+            DPRINTF("Invalid cmd %u\n", cmd);
+            errno = EINVAL;
+            break;
+        }
         err = -1;
     }
 
     return err;
 }
 
-int xc_domain_decrease_reservation(xc_interface *xch,
+int xc_domain_increase_reservation(xc_interface *xch,
                                    uint32_t domid,
                                    unsigned long nr_extents,
                                    unsigned int extent_order,
+                                   unsigned int mem_flags,
                                    xen_pfn_t *extent_start)
 {
-    int err;
-    DECLARE_HYPERCALL_BOUNCE(extent_start, nr_extents * sizeof(*extent_start), XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
-    struct xen_memory_reservation reservation = {
-        .nr_extents   = nr_extents,
-        .extent_order = extent_order,
-        .mem_flags    = 0,
-        .domid        = domid
-    };
-
-    if ( extent_start == NULL )
-    {
-        DPRINTF("decrease_reservation extent_start is NULL!\n");
-        errno = EINVAL;
-        return -1;
-    }
-
-    if ( xc_hypercall_bounce_pre(xch, extent_start) )
-    {
-        PERROR("Could not bounce memory for XENMEM_decrease_reservation hypercall");
-        return -1;
-    }
-    set_xen_guest_handle(reservation.extent_start, extent_start);
-
-    err = xc_memory_op(xch, XENMEM_decrease_reservation, &reservation, sizeof(reservation));
+    return xc_populate_physmap_cmd(xch, XENMEM_increase_reservation, domid,
+                                   nr_extents, extent_order, mem_flags,
+                                   extent_start);
+}
 
-    xc_hypercall_bounce_post(xch, extent_start);
+int xc_domain_increase_reservation_exact(xc_interface *xch,
+                                         uint32_t domid,
+                                         unsigned long nr_extents,
+                                         unsigned int extent_order,
+                                         unsigned int mem_flags,
+                                         xen_pfn_t *extent_start)
+{
+    return xc_populate_physmap_cmd_exact(xch, XENMEM_increase_reservation,
+                                         domid, nr_extents, extent_order,
+                                         mem_flags, extent_start);
+}
 
-    return err;
+int xc_domain_decrease_reservation(xc_interface *xch,
+                                   uint32_t domid,
+                                   unsigned long nr_extents,
+                                   unsigned int extent_order,
+                                   xen_pfn_t *extent_start)
+{
+    return xc_populate_physmap_cmd(xch, XENMEM_decrease_reservation, domid,
+                                   nr_extents, extent_order, 0, extent_start);
 }
 
 int xc_domain_decrease_reservation_exact(xc_interface *xch,
@@ -1047,23 +1033,9 @@ int xc_domain_decrease_reservation_exact(xc_interface *xch,
                                          unsigned int extent_order,
                                          xen_pfn_t *extent_start)
 {
-    int err;
-
-    err = xc_domain_decrease_reservation(xch, domid, nr_extents,
-                                         extent_order, extent_start);
-
-    if ( err == nr_extents )
-        return 0;
-
-    if ( err >= 0 )
-    {
-        DPRINTF("Failed deallocation for dom %d: %ld extents of order %d\n",
-                domid, nr_extents, extent_order);
-        errno = EINVAL;
-        err = -1;
-    }
-
-    return err;
+    return xc_populate_physmap_cmd_exact(xch, XENMEM_decrease_reservation,
+                                         domid, nr_extents, extent_order,
+                                         0, extent_start);
 }
 
 int xc_domain_add_to_physmap(xc_interface *xch,
@@ -1177,22 +1149,9 @@ int xc_domain_populate_physmap_exact(xc_interface *xch,
                                      unsigned int mem_flags,
                                      xen_pfn_t *extent_start)
 {
-    int err;
-
-    err = xc_domain_populate_physmap(xch, domid, nr_extents,
-                                     extent_order, mem_flags, extent_start);
-    if ( err == nr_extents )
-        return 0;
-
-    if ( err >= 0 )
-    {
-        DPRINTF("Failed allocation for dom %d: %ld extents of order %d\n",
-                domid, nr_extents, extent_order);
-        errno = EBUSY;
-        err = -1;
-    }
-
-    return err;
+    return xc_populate_physmap_cmd_exact(xch, XENMEM_populate_physmap,
+                                         domid, nr_extents, extent_order,
+                                         mem_flags, extent_start);
 }
 
 int xc_domain_populate_physmap_heap_exact(xc_interface *xch,
@@ -1202,23 +1161,10 @@ int xc_domain_populate_physmap_heap_exact(xc_interface *xch,
                                           unsigned int mem_flags,
                                           xen_pfn_t *extent_start)
 {
-    int err;
-
-    err = xc_populate_physmap_cmd(xch, XENMEM_populate_physmap_heap_alloc,
-                                  domid, nr_extents, extent_order, mem_flags,
-                                  extent_start);
-    if ( err == nr_extents )
-        return 0;
-
-    if ( err >= 0 )
-    {
-        DPRINTF("Failed allocation for dom %d: %ld extents of order %d\n",
-                domid, nr_extents, extent_order);
-        errno = EBUSY;
-        err = -1;
-    }
-
-    return err;
+    return xc_populate_physmap_cmd_exact(xch,
+                                         XENMEM_populate_physmap_heap_alloc,
+                                         domid, nr_extents, extent_order,
+                                         mem_flags, extent_start);
 }
 
 int xc_domain_memory_exchange_pages(xc_interface *xch,
-- 
2.34.1


