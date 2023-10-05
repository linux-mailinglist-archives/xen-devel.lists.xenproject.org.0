Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1647E7BA8E8
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 20:18:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613095.953408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoSub-0005cW-Tp; Thu, 05 Oct 2023 18:17:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613095.953408; Thu, 05 Oct 2023 18:17:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoSub-0005Yq-Q0; Thu, 05 Oct 2023 18:17:25 +0000
Received: by outflank-mailman (input) for mailman id 613095;
 Thu, 05 Oct 2023 18:17:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JwJB=FT=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qoSua-0005Wp-CX
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 18:17:24 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e88::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c15a3f7-63ab-11ee-9b0d-b553b5be7939;
 Thu, 05 Oct 2023 20:17:21 +0200 (CEST)
Received: from DM6PR02CA0102.namprd02.prod.outlook.com (2603:10b6:5:1f4::43)
 by SJ0PR12MB6926.namprd12.prod.outlook.com (2603:10b6:a03:485::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.22; Thu, 5 Oct
 2023 18:17:17 +0000
Received: from DS1PEPF00017095.namprd03.prod.outlook.com
 (2603:10b6:5:1f4:cafe::15) by DM6PR02CA0102.outlook.office365.com
 (2603:10b6:5:1f4::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33 via Frontend
 Transport; Thu, 5 Oct 2023 18:17:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017095.mail.protection.outlook.com (10.167.17.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Thu, 5 Oct 2023 18:17:16 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 5 Oct
 2023 13:17:16 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 5 Oct
 2023 11:17:15 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 5 Oct 2023 13:17:14 -0500
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
X-Inumbo-ID: 6c15a3f7-63ab-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hqup0mrfddn+Vuc+pEEWS4oIkm26XNUReLwqQz/u7LX0s8P6pvqT/MeZQsFbuzhYf2aB0dSMgkUlo3l7USR55mPn3pxt0m+Z67EytKnEJwotGCVkC7Tq1n3QxZBqMwa3SXgX5Q3A54tMUE2jbAIQ1zu1cBKGDgmYr2Aeb2HIAKEKOAjwDa+YgFkbHpx3Nb+mKrbGikfL0daNGtd7NY4r3KNmsC2QvVipWEklWW0M47W9eyF+BjF8lSnBnY3qQtvdUZEBvmw7SneO5qfKLeQJ2CWMsq4fMoeLNOSl7OXSqXfVynlOGuqhH7+2CGLijYEWNZSL2Vp5/p6/plzoD45QCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=drk4vNje31iUchZYqFtsf2J08S9ncFF0JR2CCRunqKc=;
 b=MTkyB3AtXkIDi3JnFrqi+G9xLYA5yrxuuE4kSTWdJ9OiBqDlHhYEy0Y2ilIwz7JEPO58xok1OpG18koiTRaYY5GoYsy9kqHuTMyiXBnvaayut+4dV0EE75qo1LCSk4ifAuMylfnG1AZB2IC9wqn2JegeDITRySx5NZALNy2loo6cGmy8Nzq2J1qTojh4ZIcfUPxBQQ66kNIVpCwpWTpkGRLOxTx3p3VRnz03i6TlgdDAs5yIiPpaRi4SllLvRbeEs7yQ2jJrJ6OUV8mS996PPUP5WNVBEKR7HgvCdITxf0CvFW8lITkD/AccebizF++5YVQqogDMhDp8T+7LA6k6Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=drk4vNje31iUchZYqFtsf2J08S9ncFF0JR2CCRunqKc=;
 b=kzMbfV3GX2sHZrgvom2ILxlASZiXBA94YO+3eHzSz2Su2ygr7vg8Zjup1TggzAcxdNhp9DlAgqSxxrrBdCCy4KfMHqyoJG3/Cm+ngqs3Up9sJI+Mtp6vGyssupfNhkSfOaqTyEo1aKlKsd3CO1tuRsieRE4BphlNaFayEkulzmA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>, Vikram Garhwal
	<vikram.garhwal@amd.com>, Anthony Perard <anthony.perard@citrix.com>, "Paul
 Durrant" <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>, Peter Xu
	<peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, "open list:X86
 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: [QEMU][PATCH v1 6/7] xen: add map and unmap callbacks for grant region
Date: Thu, 5 Oct 2023 11:16:28 -0700
Message-ID: <20231005181629.4046-7-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231005181629.4046-1-vikram.garhwal@amd.com>
References: <20231005181629.4046-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017095:EE_|SJ0PR12MB6926:EE_
X-MS-Office365-Filtering-Correlation-Id: 30a38abe-ecbe-4f11-23a0-08dbc5cf4e4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	13hZQItJ3wOE6AIoodsgUmW+M/rtsUY0ODjSk1x/J+BzeR0LZMSQwxItLngYiad3yxklbD0QrTteqog/WtRygm7ptMr491gLDGIuqanNRALRrD5Wkbhy6ofI73HKABsvwRWb7r40aVWiTR/C9JVt8biBKgL5SKyDxjqKoQHV9AHYPvYXm0mAfYbEP+FpMCkKRE/QOZdiNSqpdZmmX6HrthkIlxX+/prFayDsl70aiDZLT+Oh+xMWH7SMycQUhkQ4pRZh0e6uph3ym/hQ2D6Fhv88MoQXHAMaWFs/MD+nanC6knRejipnhMAQU6s7GHkmzYGthDc7ZkBbJHS0Mm+0WkjCzNj34wlkkxZvKV88S3m+G5j2tP/TmNTj0h9uND9FGqS6imm4IfZmoS4wEeeBZqJHQpcmpS4oBrEUJSAKyuuMnPYg2YGd+lLkFKPR+lowtqBaKQOjdvz5enGWsJXJd5VokH47QFib/ont/1vzCobovUibJq0f6nETPcVOjwHcylvt378/56Qks4JZP1SCXzaCNvSB+T1fV609ziTBYACrtVCFOO5bzGky4EpFYvDeqYHPcIfs4nAIKUI/uPESaEtYXJWv6Wm7i+jR+7H+fDvdjTDVtfejSL2ny6Sy/2JsyYvrE7D8VHwVEPWxK4HNLHY6Bf0BQZnPImTVDHsAL+UhAqKYbvlhbmFhZ8pZgJy/qlld/SfrnY27hqoMflXPReCmzw7n5mTctYs/AhgKwex/0VAR7RlDZQ1ksaimMosPviTYB0NFCn0TB49jVoC0RQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(376002)(346002)(136003)(230922051799003)(186009)(1800799009)(451199024)(82310400011)(64100799003)(36840700001)(40470700004)(46966006)(44832011)(2616005)(5660300002)(1076003)(40480700001)(81166007)(40460700003)(356005)(82740400003)(316002)(6666004)(47076005)(478600001)(86362001)(6916009)(36756003)(36860700001)(70206006)(54906003)(83380400001)(7416002)(70586007)(2906002)(41300700001)(26005)(336012)(426003)(8936002)(8676002)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 18:17:16.4921
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30a38abe-ecbe-4f11-23a0-08dbc5cf4e4e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6926

From: Juergen Gross <jgross@suse.com>

Add the callbacks for mapping/unmapping guest memory via grants to the
special grant memory region.

Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 hw/xen/xen-mapcache.c | 167 +++++++++++++++++++++++++++++++++++++++++-
 softmmu/physmem.c     |  11 ++-
 2 files changed, 173 insertions(+), 5 deletions(-)

diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
index 8a61c7dde6..52844a6a9d 100644
--- a/hw/xen/xen-mapcache.c
+++ b/hw/xen/xen-mapcache.c
@@ -9,6 +9,8 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/queue.h"
+#include "qemu/thread.h"
 #include "qemu/units.h"
 #include "qemu/error-report.h"
 
@@ -23,6 +25,8 @@
 #include "sysemu/xen-mapcache.h"
 #include "trace.h"
 
+#include <xenevtchn.h>
+#include <xengnttab.h>
 
 //#define MAPCACHE_DEBUG
 
@@ -385,7 +389,7 @@ uint8_t *xen_map_cache(hwaddr phys_addr, hwaddr size,
     return p;
 }
 
-ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
+static ram_addr_t xen_ram_addr_from_mapcache_try(void *ptr)
 {
     MapCacheEntry *entry = NULL;
     MapCacheRev *reventry;
@@ -594,10 +598,170 @@ uint8_t *xen_replace_cache_entry(hwaddr old_phys_addr,
     return p;
 }
 
+struct XENMappedGrantRegion {
+    void *addr;
+    unsigned int pages;
+    unsigned int refs;
+    unsigned int prot;
+    uint32_t idx;
+    QLIST_ENTRY(XENMappedGrantRegion) list;
+};
+
+static xengnttab_handle *xen_region_gnttabdev;
+static QLIST_HEAD(GrantRegionList, XENMappedGrantRegion) xen_grant_mappings =
+    QLIST_HEAD_INITIALIZER(xen_grant_mappings);
+static QemuMutex xen_map_mutex;
+
+static void *xen_map_grant_dyn(MemoryRegion **mr, hwaddr addr, hwaddr *plen,
+                               bool is_write, MemTxAttrs attrs)
+{
+    unsigned int page_off = addr & (XC_PAGE_SIZE - 1);
+    unsigned int i;
+    unsigned int nrefs = (page_off + *plen + XC_PAGE_SIZE - 1) >> XC_PAGE_SHIFT;
+    uint32_t ref = (addr - XEN_GRANT_ADDR_OFF) >> XC_PAGE_SHIFT;
+    uint32_t *refs = NULL;
+    unsigned int prot = PROT_READ;
+    struct XENMappedGrantRegion *mgr = NULL;
+
+    if (is_write) {
+        prot |= PROT_WRITE;
+    }
+
+    qemu_mutex_lock(&xen_map_mutex);
+
+    QLIST_FOREACH(mgr, &xen_grant_mappings, list) {
+        if (mgr->idx == ref &&
+            mgr->pages == nrefs &&
+            (mgr->prot & prot) == prot) {
+            break;
+        }
+    }
+    if (!mgr) {
+        mgr = g_new(struct XENMappedGrantRegion, 1);
+
+        if (nrefs == 1) {
+            refs = &ref;
+        } else {
+            refs = g_new(uint32_t, nrefs);
+            for (i = 0; i < nrefs; i++) {
+                refs[i] = ref + i;
+            }
+        }
+        mgr->addr = xengnttab_map_domain_grant_refs(xen_region_gnttabdev, nrefs,
+                                                    xen_domid, refs, prot);
+        if (mgr->addr) {
+            mgr->pages = nrefs;
+            mgr->refs = 1;
+            mgr->prot = prot;
+            mgr->idx = ref;
+
+            QLIST_INSERT_HEAD(&xen_grant_mappings, mgr, list);
+        } else {
+            g_free(mgr);
+            mgr = NULL;
+        }
+    } else {
+        mgr->refs++;
+    }
+
+    qemu_mutex_unlock(&xen_map_mutex);
+
+    if (nrefs > 1) {
+        g_free(refs);
+    }
+
+    return mgr ? mgr->addr + page_off : NULL;
+}
+
+static void xen_unmap_grant_dyn(MemoryRegion *mr, void *buffer, ram_addr_t addr,
+                                hwaddr len, bool is_write, hwaddr access_len)
+{
+    unsigned int page_off = (unsigned long)buffer & (XC_PAGE_SIZE - 1);
+    unsigned int nrefs = (page_off + len + XC_PAGE_SIZE - 1) >> XC_PAGE_SHIFT;
+    unsigned int prot = PROT_READ;
+    struct XENMappedGrantRegion *mgr = NULL;
+
+    if (is_write) {
+        prot |= PROT_WRITE;
+    }
+
+    qemu_mutex_lock(&xen_map_mutex);
+
+    QLIST_FOREACH(mgr, &xen_grant_mappings, list) {
+        if (mgr->addr == buffer - page_off &&
+            mgr->pages == nrefs &&
+            (mgr->prot & prot) == prot) {
+            break;
+        }
+    }
+    if (mgr) {
+        mgr->refs--;
+        if (!mgr->refs) {
+            xengnttab_unmap(xen_region_gnttabdev, mgr->addr, nrefs);
+
+            QLIST_REMOVE(mgr, list);
+            g_free(mgr);
+        }
+    } else {
+        error_report("xen_unmap_grant_dyn() trying to unmap unknown buffer");
+    }
+
+    qemu_mutex_unlock(&xen_map_mutex);
+}
+
+static ram_addr_t xen_ram_addr_from_grant_cache(void *ptr)
+{
+    unsigned int page_off = (unsigned long)ptr & (XC_PAGE_SIZE - 1);
+    struct XENMappedGrantRegion *mgr = NULL;
+    ram_addr_t raddr = RAM_ADDR_INVALID;
+
+    qemu_mutex_lock(&xen_map_mutex);
+
+    QLIST_FOREACH(mgr, &xen_grant_mappings, list) {
+        if (mgr->addr == ptr - page_off) {
+            break;
+        }
+    }
+
+    if (mgr) {
+        raddr = (mgr->idx << XC_PAGE_SHIFT) + page_off + XEN_GRANT_ADDR_OFF;
+    }
+
+    qemu_mutex_unlock(&xen_map_mutex);
+
+    return raddr;
+}
+
+ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
+{
+    ram_addr_t raddr;
+
+    raddr = xen_ram_addr_from_mapcache_try(ptr);
+    if (raddr == RAM_ADDR_INVALID) {
+        raddr = xen_ram_addr_from_grant_cache(ptr);
+    }
+
+    return raddr;
+}
+
+static const struct MemoryRegionOps xen_grant_mr_ops = {
+    .map = xen_map_grant_dyn,
+    .unmap = xen_unmap_grant_dyn,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+};
+
 MemoryRegion *xen_init_grant_ram(void)
 {
     RAMBlock *block;
 
+    qemu_mutex_init(&xen_map_mutex);
+
+    xen_region_gnttabdev = xengnttab_open(NULL, 0);
+    if (xen_region_gnttabdev == NULL) {
+        fprintf(stderr, "can't open gnttab device\n");
+        return NULL;
+    }
+
     memory_region_init(&ram_grants, NULL, "xen.grants",
                        XEN_MAX_VIRTIO_GRANTS * XC_PAGE_SIZE);
     block = g_malloc0(sizeof(*block));
@@ -612,6 +776,7 @@ MemoryRegion *xen_init_grant_ram(void)
     ram_grants.ram_block = block;
     ram_grants.ram = true;
     ram_grants.terminates = true;
+    ram_grants.ops = &xen_grant_mr_ops;
     ram_block_add_list(block);
     memory_region_add_subregion(get_system_memory(), XEN_GRANT_ADDR_OFF,
                                 &ram_grants);
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 5f425bea1c..e5346386db 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2250,13 +2250,16 @@ RAMBlock *qemu_ram_block_from_host(void *ptr, bool round_offset,
 
     if (xen_enabled()) {
         ram_addr_t ram_addr;
+
         RCU_READ_LOCK_GUARD();
         ram_addr = xen_ram_addr_from_mapcache(ptr);
-        block = qemu_get_ram_block(ram_addr);
-        if (block) {
-            *offset = ram_addr - block->offset;
+        if (ram_addr != RAM_ADDR_INVALID) {
+            block = qemu_get_ram_block(ram_addr);
+            if (block) {
+                *offset = ram_addr - block->offset;
+            }
+            return block;
         }
-        return block;
     }
 
     RCU_READ_LOCK_GUARD();
-- 
2.17.1


