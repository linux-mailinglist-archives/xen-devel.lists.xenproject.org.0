Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EC8A2B875
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 02:54:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883268.1293322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgDZ2-0003PW-UC; Fri, 07 Feb 2025 01:53:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883268.1293322; Fri, 07 Feb 2025 01:53:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgDZ2-0003Mn-Qy; Fri, 07 Feb 2025 01:53:52 +0000
Received: by outflank-mailman (input) for mailman id 883268;
 Fri, 07 Feb 2025 01:53:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yNCd=U6=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1tgDZ1-00037W-DC
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 01:53:51 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2414::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 607c06b7-e4f6-11ef-a073-877d107080fb;
 Fri, 07 Feb 2025 02:53:50 +0100 (CET)
Received: from BN9PR03CA0932.namprd03.prod.outlook.com (2603:10b6:408:108::7)
 by PH7PR12MB6660.namprd12.prod.outlook.com (2603:10b6:510:212::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 01:53:45 +0000
Received: from BL6PEPF00020E63.namprd04.prod.outlook.com
 (2603:10b6:408:108:cafe::5a) by BN9PR03CA0932.outlook.office365.com
 (2603:10b6:408:108::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.26 via Frontend Transport; Fri,
 7 Feb 2025 01:53:44 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00020E63.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 01:53:44 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Feb
 2025 19:53:43 -0600
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Feb 2025 19:53:43 -0600
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
X-Inumbo-ID: 607c06b7-e4f6-11ef-a073-877d107080fb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xhHNxHbDzCCXsN8vIx4ooUGyllbXHPtvFdejHfZc3rFGiP25tFuK9H//abRDq+6UtkyDU6MQgnI4uMgTlq9uOy7LD200A9KTdUzmyWJfxCq26WQ7WIn9z/tmHuUCUrWKVrJ6slevofSCu7rrVOfXAdA8ZZP3ojuas1Lv/cDONcWy4kaVqBOH+UAbvIbhyRb1U/jCrE7YIM5Gs+fie0d+MkD6t4uSMENvpjStTjakvJRlUzIWmS5ZFVRFJHQvJBTSir9MhJnaYyt7ElrZkXiIG2aj7Ym559U53kisWLHC7cMq6ljPEkOVs3VzH6Cj3lfxiSxsCsZ8KCLPNGboXOgMpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5E06qeBbZ3UkLus+GdYXMYW47OhjvFMpvVAs7aAOIc=;
 b=cOc2jdW8WTp9ATAZ4ZlbAK027MkcNm+E7TuiW2RwbySl8J6tPAReFcmPWOrtw8u3eEDJlnYXdm96tmpS9MVS9bV6KmXUqBzE+aaXita2htNyBXbDo5xOwCP80ivQBOiBl54d4H/28I7RUp8iV0zxTE/hzL1U7jW08z3WgAavBqvZuEAdtgOkOV6/Bzt1lwC5Fj0YiE0nae4JZ5SAWhNk327NA3qRjwxkZFF/dci7qWNIjQv6zLvV0g1GyQ/skIGDrjJCpcI66MwmhY4JSdP4Zj6PyWx7yx7HDfbrW8tTsafDXw/BQoklhG2e4kMdstXGuNWgaZesvhVw2sGin/LEow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5E06qeBbZ3UkLus+GdYXMYW47OhjvFMpvVAs7aAOIc=;
 b=XAOWLzJckBPQm57za0ZQmdB8D+niAhE4lM+kAd9KAeRp/5kV+z/3TxDn+eYl3ZHUL7Yr7by8/rSd+XOG/gLTU3BENFumVkc5jjdK5Go4VyZVjd/eH7PBDmO7U+rlxZyKCaJjglkh+E2OATFZ3dmWD9A0CUO1ChOKDtbvHrtJ5Jc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <bertrand.marquis@arm.com>, <julien@xen.org>,
	<michal.orzel@amd.com>, <Volodymyr_Babchuk@epam.com>, Henry Wang
	<xin.wang2@amd.com>, Alec Kwapis <alec.kwapis@medtronic.com>, "Stefano
 Stabellini" <stefano.stabellini@amd.com>
Subject: [PATCH v6 2/7] xen/arm: Alloc XenStore page for Dom0less DomUs from hypervisor
Date: Thu, 6 Feb 2025 17:53:36 -0800
Message-ID: <20250207015341.1208429-2-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2502061750480.619090@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2502061750480.619090@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E63:EE_|PH7PR12MB6660:EE_
X-MS-Office365-Filtering-Correlation-Id: 505557a6-3ee8-4b49-1fae-08dd471a4140
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KNtbSFMqubgosi7MDp9sPixbvgjO9tuBM+C3gN1JGCs5nYvCDM0DFU94V9zo?=
 =?us-ascii?Q?aFkJFjJN2TupVcoSbcGvrSb5GzhHBs3zyUMD2Tux6N+ujM4ExjWKlvf91A8I?=
 =?us-ascii?Q?za146iMrJ1iL9fft+STxWXm1BXelldFjH72Dck+W06fS/a5qqjXLM/q1FOCN?=
 =?us-ascii?Q?GPaGpucPdmyTlsOsqYKVWulvkRxZs0ePtrIKQJAUF2RsbjSnsNGgKXCb+0TU?=
 =?us-ascii?Q?1hbPkJWArQX//OCKtADHpGGEHFv06he1/3IczqzP42E+dTDBxhwN5Qbs22CO?=
 =?us-ascii?Q?25R+Dh7IHOZbbe5YfVatVonYurYkbo0ffeZXRLOtSxSXZCCo5BCAX391LcMl?=
 =?us-ascii?Q?gU+xFlvyCNY5cL9j3+oyQW4ylmo/4SRqvm8gX93dLZXtWkf+PbRzq+GvcCXI?=
 =?us-ascii?Q?nc34tPjrLdocAjw2RntgCG8nfCir++y+YEmaO0pWf+OahJGOVYcZYuOq+fN/?=
 =?us-ascii?Q?yTkg9zcgA/1dWEgXKRO3O0oXUc/2ypXtAw2XdvRKJkQt6ZWrv52oey/6dPd7?=
 =?us-ascii?Q?bnad5UGJpMMpHXSNOECKoPcBPmqWKyRfpzWJ+BkI1bxwILHfA/E4QFjjBYUa?=
 =?us-ascii?Q?VPPKMFYKV7V48iQ0Yt9+8gIUfwMZDkOIhzymyKDfw+8jt/IJVVYbr/ddQxn2?=
 =?us-ascii?Q?vMf6m0MMNqm6ltZ9WuNATEiHuoFMsfYelaNiulbhdL1M4SjKn5GL2L0B1N+S?=
 =?us-ascii?Q?CrNjMTKXl+4Vf0eXaA77d7RwxVBFcfG8iQuA6ncKrRIEMaDDyybdJYqTzHTW?=
 =?us-ascii?Q?ic/SAXjcDErddJ6vg+dvkaR0t0UbebOvWaRsj0AecfJGu4idO3VaPsDyyuwS?=
 =?us-ascii?Q?fmsAXRov9RD6D7N66sP5Q4/oWvw4YhUdqNSI3dlD2uU9WyXbDFNIcFskIIKX?=
 =?us-ascii?Q?zg0VjFKAoi0jmh823394mA6tuao55eE4/RetlDAPYN7dAJCBNSKsNpsJh3AA?=
 =?us-ascii?Q?7Y7rVjVpkKowgshfJJ//aaAp8A4fuX8cbYDAeTVEPI/5V94J71EpvxEdldI3?=
 =?us-ascii?Q?TS6JmbZE/15S/7dUG1hPwscusmCeFDIZX3Xy0WL4Q2QlVNQIGRREHyKmtnUp?=
 =?us-ascii?Q?8+JdjUqEhzal3YdiNRj9QXIjEErUgwsFQfiy6k4BKnHpTopgPFz3bgt6nNpd?=
 =?us-ascii?Q?mq2xqwoMZHp1CkYEkH+aRBoxZhoU0hC38jDsOUwcb3PllZeebSmxpQ2rpcur?=
 =?us-ascii?Q?cPrEuuiNp54wNPaHoZPeOA/TW7c9u4omWikyldEy7EdKEJnyQ3VYFnhuu6JL?=
 =?us-ascii?Q?sRfU/Rfji+bjGtzv8fiiLEY96WSihSWGHELwbvaxG290Qkj4YAclmimF3rCQ?=
 =?us-ascii?Q?QBNQQesgyIWLtZkNE+qS6VHbEIGzRGO9ivpFCsq3lZukuw+G+ei4xCJXGw1G?=
 =?us-ascii?Q?osVI9Uw/+MeBtALj2UqeZtoWPoiPcP80+5zkxyLEngvN1QgpU4TdEW0/yrGe?=
 =?us-ascii?Q?Kk90JkMOEBJ4hthrzmqqISZ4ng+8bMJ7744/frs99P1Sgr01icX7infVCEP2?=
 =?us-ascii?Q?KaojX7bz56my3ZU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 01:53:44.5140
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 505557a6-3ee8-4b49-1fae-08dd471a4140
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6660

From: Henry Wang <xin.wang2@amd.com>

There are use cases (for example using the PV driver) in Dom0less
setup that require Dom0less DomUs start immediately with Dom0, but
initialize XenStore later after Dom0's successful boot and call to
the init-dom0less application.

An error message can seen from the init-dom0less application on
1:1 direct-mapped domains:
```
Allocating magic pages
memory.c:238:d0v0 mfn 0x39000 doesn't belong to d1
Error on alloc magic pages
```

The "magic page" is a terminology used in the toolstack as reserved
pages for the VM to have access to virtual platform capabilities.
Currently the magic pages for Dom0less DomUs are populated by the
init-dom0less app through populate_physmap(), and populate_physmap()
automatically assumes gfn == mfn for 1:1 direct mapped domains. This
cannot be true for the magic pages that are allocated later from the
init-dom0less application executed in Dom0. For domain using statically
allocated memory but not 1:1 direct-mapped, similar error "failed to
retrieve a reserved page" can be seen as the reserved memory list is
empty at that time.

Since for init-dom0less, the magic page region is only for XenStore.
To solve above issue, this commit allocates the XenStore page for
Dom0less DomUs at the domain construction time. The PFN will be
noted and communicated to the init-dom0less application executed
from Dom0. To keep the XenStore late init protocol, set the connection
status to XENSTORE_RECONNECT.

Since the guest magic region allocation from init-dom0less is for
XenStore, and the XenStore page is now allocated from the hypervisor,
instead of hardcoding the guest magic pages region, use
xc_hvm_param_get() to get the XenStore page PFN. Rename alloc_xs_page()
to get_xs_page() to reflect the changes.

With this change, some existing code is not needed anymore, including:
(1) The definition of the XenStore page offset.
(2) Call to xc_domain_setmaxmem() and xc_clear_domain_page() as we
    don't need to set the max mem and clear the page anymore.
(3) Foreign mapping of the XenStore page, setting of XenStore interface
    status and HVM_PARAM_STORE_PFN from init-dom0less, as they are set
    by the hypervisor.

Take the opportunity to do some coding style improvements when possible.

Reported-by: Alec Kwapis <alec.kwapis@medtronic.com>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v2:
- merge patch #2 and #3
- add empty line

 tools/helpers/init-dom0less.c | 58 +++++++++--------------------------
 xen/arch/arm/dom0less-build.c | 56 ++++++++++++++++++++++++++++++++-
 2 files changed, 69 insertions(+), 45 deletions(-)

diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
index fee93459c4..2b51965fa7 100644
--- a/tools/helpers/init-dom0less.c
+++ b/tools/helpers/init-dom0less.c
@@ -16,30 +16,18 @@
 
 #include "init-dom-json.h"
 
-#define XENSTORE_PFN_OFFSET 1
 #define STR_MAX_LENGTH 128
 
-static int alloc_xs_page(struct xc_interface_core *xch,
-                         libxl_dominfo *info,
-                         uint64_t *xenstore_pfn)
+static int get_xs_page(struct xc_interface_core *xch, libxl_dominfo *info,
+                       uint64_t *xenstore_pfn)
 {
     int rc;
-    const xen_pfn_t base = GUEST_MAGIC_BASE >> XC_PAGE_SHIFT;
-    xen_pfn_t p2m = (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) + XENSTORE_PFN_OFFSET;
 
-    rc = xc_domain_setmaxmem(xch, info->domid,
-                             info->max_memkb + (XC_PAGE_SIZE/1024));
-    if (rc < 0)
-        return rc;
-
-    rc = xc_domain_populate_physmap_exact(xch, info->domid, 1, 0, 0, &p2m);
-    if (rc < 0)
-        return rc;
-
-    *xenstore_pfn = base + XENSTORE_PFN_OFFSET;
-    rc = xc_clear_domain_page(xch, info->domid, *xenstore_pfn);
-    if (rc < 0)
-        return rc;
+    rc = xc_hvm_param_get(xch, info->domid, HVM_PARAM_STORE_PFN, xenstore_pfn);
+    if (rc < 0) {
+        printf("Failed to get HVM_PARAM_STORE_PFN\n");
+        return 1;
+    }
 
     return 0;
 }
@@ -100,6 +88,7 @@ static bool do_xs_write_vm(struct xs_handle *xsh, xs_transaction_t t,
  */
 static int create_xenstore(struct xs_handle *xsh,
                            libxl_dominfo *info, libxl_uuid uuid,
+                           uint64_t xenstore_pfn,
                            evtchn_port_t xenstore_port)
 {
     domid_t domid;
@@ -145,8 +134,7 @@ static int create_xenstore(struct xs_handle *xsh,
     rc = snprintf(target_memkb_str, STR_MAX_LENGTH, "%"PRIu64, info->current_memkb);
     if (rc < 0 || rc >= STR_MAX_LENGTH)
         return rc;
-    rc = snprintf(ring_ref_str, STR_MAX_LENGTH, "%lld",
-                  (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) + XENSTORE_PFN_OFFSET);
+    rc = snprintf(ring_ref_str, STR_MAX_LENGTH, "%"PRIu64, xenstore_pfn);
     if (rc < 0 || rc >= STR_MAX_LENGTH)
         return rc;
     rc = snprintf(xenstore_port_str, STR_MAX_LENGTH, "%u", xenstore_port);
@@ -230,7 +218,6 @@ static int init_domain(struct xs_handle *xsh,
     libxl_uuid uuid;
     uint64_t xenstore_evtchn, xenstore_pfn;
     int rc;
-    struct xenstore_domain_interface *intf;
 
     printf("Init dom0less domain: %u\n", info->domid);
 
@@ -245,20 +232,11 @@ static int init_domain(struct xs_handle *xsh,
     if (!xenstore_evtchn)
         return 0;
 
-    /* Alloc xenstore page */
-    if (alloc_xs_page(xch, info, &xenstore_pfn) != 0) {
-        printf("Error on alloc magic pages\n");
-        return 1;
-    }
-
-    intf = xenforeignmemory_map(xfh, info->domid, PROT_READ | PROT_WRITE, 1,
-                                &xenstore_pfn, NULL);
-    if (!intf) {
-        printf("Error mapping xenstore page\n");
+    /* Get xenstore page */
+    if (get_xs_page(xch, info, &xenstore_pfn) != 0) {
+        printf("Error on getting xenstore page\n");
         return 1;
     }
-    intf->connection = XENSTORE_RECONNECT;
-    xenforeignmemory_unmap(xfh, intf, 1);
 
     rc = xc_dom_gnttab_seed(xch, info->domid, true,
                             (xen_pfn_t)-1, xenstore_pfn, 0, 0);
@@ -272,19 +250,11 @@ static int init_domain(struct xs_handle *xsh,
     if (rc)
         err(1, "gen_stub_json_config");
 
-    /* Now everything is ready: set HVM_PARAM_STORE_PFN */
-    rc = xc_hvm_param_set(xch, info->domid, HVM_PARAM_STORE_PFN,
-                          xenstore_pfn);
-    if (rc < 0)
-        return rc;
-
-    rc = create_xenstore(xsh, info, uuid, xenstore_evtchn);
+    rc = create_xenstore(xsh, info, uuid, xenstore_pfn, xenstore_evtchn);
     if (rc)
         err(1, "writing to xenstore");
 
-    rc = xs_introduce_domain(xsh, info->domid,
-            (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) + XENSTORE_PFN_OFFSET,
-            xenstore_evtchn);
+    rc = xs_introduce_domain(xsh, info->domid, xenstore_pfn, xenstore_evtchn);
     if (!rc)
         err(1, "xs_introduce_domain");
     return 0;
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 49d1f14d65..6c51f91999 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 #include <xen/device_tree.h>
+#include <xen/domain_page.h>
 #include <xen/err.h>
 #include <xen/event.h>
 #include <xen/grant_table.h>
@@ -11,6 +12,8 @@
 #include <xen/sizes.h>
 #include <xen/vmap.h>
 
+#include <public/io/xs_wire.h>
+
 #include <asm/arm64/sve.h>
 #include <asm/dom0less-build.h>
 #include <asm/domain_build.h>
@@ -704,6 +707,54 @@ static int __init alloc_xenstore_evtchn(struct domain *d)
     return 0;
 }
 
+#define XENSTORE_PFN_OFFSET 1
+static int __init alloc_xenstore_page(struct domain *d)
+{
+    struct page_info *xenstore_pg;
+    struct xenstore_domain_interface *interface;
+    mfn_t mfn;
+    gfn_t gfn;
+    int rc;
+
+    if ( (UINT_MAX - d->max_pages) < 1 )
+    {
+        printk(XENLOG_ERR "%pd: Over-allocation for d->max_pages by 1 page.\n",
+               d);
+        return -EINVAL;
+    }
+
+    d->max_pages += 1;
+    xenstore_pg = alloc_domheap_page(d, MEMF_bits(32));
+    if ( xenstore_pg == NULL && is_64bit_domain(d) )
+        xenstore_pg = alloc_domheap_page(d, 0);
+    if ( xenstore_pg == NULL )
+        return -ENOMEM;
+
+    mfn = page_to_mfn(xenstore_pg);
+    if ( !mfn_x(mfn) )
+        return -ENOMEM;
+
+    if ( !is_domain_direct_mapped(d) )
+        gfn = gaddr_to_gfn(GUEST_MAGIC_BASE +
+                           (XENSTORE_PFN_OFFSET << PAGE_SHIFT));
+    else
+        gfn = gaddr_to_gfn(mfn_to_maddr(mfn));
+
+    rc = guest_physmap_add_page(d, gfn, mfn, 0);
+    if ( rc )
+    {
+        free_domheap_page(xenstore_pg);
+        return rc;
+    }
+
+    d->arch.hvm.params[HVM_PARAM_STORE_PFN] = gfn_x(gfn);
+    interface = map_domain_page(mfn);
+    interface->connection = XENSTORE_RECONNECT;
+    unmap_domain_page(interface);
+
+    return 0;
+}
+
 static int __init construct_domU(struct domain *d,
                                  const struct dt_device_node *node)
 {
@@ -804,7 +855,10 @@ static int __init construct_domU(struct domain *d,
         rc = alloc_xenstore_evtchn(d);
         if ( rc < 0 )
             return rc;
-        d->arch.hvm.params[HVM_PARAM_STORE_PFN] = ~0ULL;
+
+        rc = alloc_xenstore_page(d);
+        if ( rc < 0 )
+            return rc;
     }
 
     return rc;
-- 
2.25.1


