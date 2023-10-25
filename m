Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D93B7D7692
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 23:25:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623325.971108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvlMw-0003AX-Rb; Wed, 25 Oct 2023 21:24:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623325.971108; Wed, 25 Oct 2023 21:24:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvlMw-00038j-Je; Wed, 25 Oct 2023 21:24:50 +0000
Received: by outflank-mailman (input) for mailman id 623325;
 Wed, 25 Oct 2023 21:24:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sdGm=GH=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qvlMu-0002mN-RZ
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 21:24:48 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb301d20-737c-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 23:24:46 +0200 (CEST)
Received: from SN6PR04CA0086.namprd04.prod.outlook.com (2603:10b6:805:f2::27)
 by IA0PR12MB7749.namprd12.prod.outlook.com (2603:10b6:208:432::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Wed, 25 Oct
 2023 21:24:42 +0000
Received: from SN1PEPF0002BA50.namprd03.prod.outlook.com
 (2603:10b6:805:f2:cafe::2c) by SN6PR04CA0086.outlook.office365.com
 (2603:10b6:805:f2::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33 via Frontend
 Transport; Wed, 25 Oct 2023 21:24:42 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002BA50.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Wed, 25 Oct 2023 21:24:42 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 25 Oct
 2023 16:24:40 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 25 Oct
 2023 16:24:40 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Wed, 25 Oct 2023 16:24:39 -0500
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
X-Inumbo-ID: eb301d20-737c-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AA+Dn7EuyK08jdrS8wUwKfGJQmK9ZduLdOaHEQSiP5yR1GFHM2XIazTq3tbGeOmqnjjWkdcJtumoR05/uMiT85nQgDBNw1Y9wlig6iiRXXidjZkHZX8OxhnY0L2BaH7Wp13ajPPyW3VJG4YS3sSg/UAyNM6KgytSOjFIh4bORbA4YP86mn1bL1MgEuoCqqVoE7SIa38lfLW3ZFRKdpFlUv54k6V2o02pv0PuEicGXvh2upvSeiJx3AzjncgqxRXYZYUaglcD+g5FP4JJD2uDw90lxdQAnqPhjt64TRSR+nB+mQr+jbeKFV1vD8cDjv2bfHvPilmCPYIKDukAx6Nr0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9OdIgauYjvZTM3NEXeDJuUyyCuwPtaokUubGW/H/Oag=;
 b=kI95msU0wRhCZZB2E8iNEDeMtaqkBx3F/sTfYPGUkFcrI1Pom/g8zNRzkNClNt2a+mPs3H3+AK0M77Ma3mtuc9LLgnpm8yc4SBgi22/7RU4Ov2yG7vNCvW69PQGKgmrvLT018kL6eweWRC4C1TWjr2EEwPNyb+kDSKd2uzSOosh89HrUJwGyHcgTLnit+A2mygYqF6H215xuY255XYwIFi0DV4Aws4X5AqEbp9xlkV7JsAkcOFXs9rMDQwYgIgYaoQ3moJomBruXSFYPtq32ZwEhUgc+MFYCJVwTiZmcmkS0McY/8uSBtl2NxsmCJ9TytvTB2Yd3fzpt/qWckj5WCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9OdIgauYjvZTM3NEXeDJuUyyCuwPtaokUubGW/H/Oag=;
 b=SWfdh0sYqpX8S5rm8t8jp006mVIZTWRcpdCIk3b2KLdLIkpj0iWZhzOz4cNy0Q7uexF7Nx9QJ+0Hx5zzWtyNs9mamjMnS43mW6QlYRH86B4jrnzzIlb+Fuxz95OMZwLxYRalVAJHEM6GmY9AW/2SQzFx/aRDslKvuQMfkdxaI4U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <sstabellini@kernel.org>, <vikram.garhwal@amd.com>, <jgross@suse.com>,
	Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>, "David
 Hildenbrand" <david@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
	<philmd@linaro.org>, "open list:X86 Xen CPUs"
	<xen-devel@lists.xenproject.org>
Subject: [QEMU][PATCHv2 7/8] xen: add map and unmap callbacks for grant region
Date: Wed, 25 Oct 2023 14:24:20 -0700
Message-ID: <20231025212422.30371-8-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231025212422.30371-1-vikram.garhwal@amd.com>
References: <20231025212422.30371-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA50:EE_|IA0PR12MB7749:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e1b8438-712f-4e8a-11bf-08dbd5a0cd9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Fcy7JXO2HJKc8M0pj/e15L/UJBG4h+ZqfXqU3JpnPz4OMf6k3rymMcVCZab8x2VhhIQkMW/28IjjO457YZEkbAn8+ayqqjfIHW4EOjW8050tLedK3Bg3Je2fBAfVkZ/Ka/N+fjA0sXLGZRc5HeTXOfXqaLsV9Fn2WBGA2Rulik/mKA9WkW5/Ejn/j5VbZqnmue+6vEN4TjtHrlrbjxc27IXPI9o6BjxQsvB9Coyrv9/3KulEcWsECRRfO9nvl/VL1sKqbBmq7hkSI+J7zeXFHvIjy38UXh1NO1Nxy+7loCx2SC7JFGDvcOeLBiHvk07gYWfrigcoI05tkfgrf8WV9VT7ckc9s0rqdaOjpJ+fboA4jEdHUzoX+Uc+hWeRTAQ4KqXFsMdv5KJQkABpySgWS0J1aHYBpyJBNtABxFR2z4xeMlzuNFKPPtV97/eOTS1CRfOjHZzDE2tqsz31H6flkADfMMLIlsxuVIuXKqT0N2RDDE9qVBBuTHKpw1aEaASzW9PY8EkWxrPyRRMXgrA8zX4/S7Poi8xnJmGNo72PNORazVDdRoZzX4ksVcaGjMbM3+pHseeYe9aSHSVl1X2YjC5f6sDTSQOTe4XUryQ3VhTHpRJPWv+If5dmQfRja8TgUFczwtU1oZWexUFdDWh4AH2DuZwn9+XpmF/Lqluh9H27Oqdc8Jfy0SdjfXy6W67cZFSzli0r/YShB51uD1PRpyiHQcY5Q93yPJO/oyR3wnlv/knu3JIDj7oCSrx27DMRqn7LB+1WUlghDe23qNDRrQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(396003)(136003)(376002)(230922051799003)(64100799003)(82310400011)(186009)(451199024)(1800799009)(46966006)(40470700004)(36840700001)(40460700003)(40480700001)(1076003)(81166007)(2616005)(82740400003)(26005)(83380400001)(426003)(336012)(356005)(6916009)(316002)(478600001)(6666004)(47076005)(70586007)(36860700001)(70206006)(54906003)(86362001)(5660300002)(36756003)(7416002)(41300700001)(8936002)(8676002)(4326008)(2906002)(44832011)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 21:24:42.3538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e1b8438-712f-4e8a-11bf-08dbd5a0cd9d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA50.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7749

From: Juergen Gross <jgross@suse.com>

Add the callbacks for mapping/unmapping guest memory via grants to the
special grant memory region.

Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 hw/xen/xen-mapcache.c | 175 +++++++++++++++++++++++++++++++++++++++++-
 system/physmem.c      |  11 ++-
 2 files changed, 181 insertions(+), 5 deletions(-)

diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
index 8a61c7dde6..feb4a3b886 100644
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
@@ -594,10 +598,178 @@ uint8_t *xen_replace_cache_entry(hwaddr old_phys_addr,
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
+    unsigned int total_grants = 0;
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
+
+        total_grants += mgr->pages;
+    }
+
+    if (!mgr) {
+        if (nrefs + total_grants >= XEN_MAX_VIRTIO_GRANTS) {
+            return NULL;
+        }
+
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
@@ -612,6 +784,7 @@ MemoryRegion *xen_init_grant_ram(void)
     ram_grants.ram_block = block;
     ram_grants.ram = true;
     ram_grants.terminates = true;
+    ram_grants.ops = &xen_grant_mr_ops;
     ram_block_add_list(block);
     memory_region_add_subregion(get_system_memory(), XEN_GRANT_ADDR_OFF,
                                 &ram_grants);
diff --git a/system/physmem.c b/system/physmem.c
index 5db1b32823..155a8c05fb 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -2233,13 +2233,16 @@ RAMBlock *qemu_ram_block_from_host(void *ptr, bool round_offset,
 
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


