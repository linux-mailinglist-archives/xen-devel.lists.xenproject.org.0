Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E31F86A844
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 07:13:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686326.1068371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfDB3-000743-MR; Wed, 28 Feb 2024 06:12:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686326.1068371; Wed, 28 Feb 2024 06:12:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfDB3-0006z5-I9; Wed, 28 Feb 2024 06:12:25 +0000
Received: by outflank-mailman (input) for mailman id 686326;
 Tue, 27 Feb 2024 22:35:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SVdi=KE=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1rf62p-0002In-8Y
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 22:35:27 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2414::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e6d83e2-d5c0-11ee-a1ee-f123f15fe8a2;
 Tue, 27 Feb 2024 23:35:23 +0100 (CET)
Received: from DS7PR05CA0059.namprd05.prod.outlook.com (2603:10b6:8:2f::32) by
 SN7PR12MB6958.namprd12.prod.outlook.com (2603:10b6:806:262::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.39; Tue, 27 Feb
 2024 22:35:20 +0000
Received: from CY4PEPF0000FCC3.namprd03.prod.outlook.com
 (2603:10b6:8:2f:cafe::23) by DS7PR05CA0059.outlook.office365.com
 (2603:10b6:8:2f::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25 via Frontend
 Transport; Tue, 27 Feb 2024 22:35:20 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC3.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 27 Feb 2024 22:35:20 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 27 Feb
 2024 16:35:11 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 27 Feb 2024 16:35:11 -0600
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
X-Inumbo-ID: 7e6d83e2-d5c0-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DqrLQcdXHv/CjdR7VN/GoH4OP9IDQXk/v5FepoDm26pfAticCtxhQFi+fPPBB03EOijIbxiG/8LHK9hoetuKspl2QPNCwUim3+60QSZdE6xgm/YAMg359oBZ779RmMZpM4OYYxBhoFttf/kjkjap7i6emLLo15dKeLjYKTsUMYHV1QZvb/7Nl2V1REt7Vxd3l/OqaIQ41REoeZSxM8nrNYQpE3q1jNCurIQdt/suhAMqhjz+n8xjJmrgUs30RaeZIiAo0IrFXneGcj+l8nCf3aiHsNo9igQNMz1A6/q/YMDPQpCDng+wb4KbvNX5YBBJSCeleuOD3RxEsNsGpFX3zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4EUODE8Te6vqif3czPfW2F2AieavOD9cQNiVAhzYX3Q=;
 b=gWR3sCNOzlxD0EDklAYI5OIAZIBD0oVL0AV96BZa0H6iuznLIS3n2ZfRWRO3pTIMG35RUUZDzhnUA1IVZmF/sX3j2E9t0xJqzrMoqOMDRCfBrh0EZ3wFcYgRADhp/DwsO/+Rv/Cn9BGb6zWU4gFKVYdL/KCOJ3XuhAnS+gPVy2usQbxDHqCnGh7Zz1dTmeIu75sO9xP/nI+Rd4gKlAaC2exnto3NQ44uyMh2vz+FVgH/1Gg8bByuLmx7qUhuC7EEEji3XnJKQkVCiUT7vgC7+BOpfaTVMSQEC9Unq5gPNqs54a/jZqXDzEntw8z9f4SCU5YZ2KeHWJNihnqOY+4TsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4EUODE8Te6vqif3czPfW2F2AieavOD9cQNiVAhzYX3Q=;
 b=2fSb/J66bYWR+R761ie20WlgsZFVcQyTTMzttpi+yVoo2E41zDv7J4FWUaWt9Zb9BnXxCkaFvn77/mdo7rLPACaQoJBb/5rbdKYchOMYqjDBZGHhAuxyoPsoq7Eykm26eiU5aH3M7v16Zkr3Aw3Gi+TtOlCjMJaPolDfPNVS/9A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <sstabellini@kernel.org>, <vikram.garhwal@amd.com>, <jgross@suse.com>,
	Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>, "David
 Hildenbrand" <david@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
	<philmd@linaro.org>, "open list:X86 Xen CPUs"
	<xen-devel@lists.xenproject.org>
Subject: [QEMU][PATCH v3 6/7] xen: add map and unmap callbacks for grant region
Date: Tue, 27 Feb 2024 14:35:00 -0800
Message-ID: <20240227223501.28475-7-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240227223501.28475-1-vikram.garhwal@amd.com>
References: <20240227223501.28475-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: vikram.garhwal@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC3:EE_|SN7PR12MB6958:EE_
X-MS-Office365-Filtering-Correlation-Id: 23d5ea88-1602-40cc-631f-08dc37e46126
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	62q64bDcZSgQSaqGlQ9flbe+pzxZmlJSnIu4UO2fS1KGw3KhDoflniJQBoloCX9p22lvQ1KCLEGCLMdxS1UxoDZXxeUn7xrHm9QiFGg89IkUio8Op3ZfnxXel4GvBt+0idrGQ8XAiaYkLarHL+RWEmL0Iqn50YzdcWdf05DPcAK02lu7tG1JtuQlVQ0PFSOmlr+QWcsgyz1ldMqGva34sVv9CsyKqiC1+hX79YQvbtG06DLMiZ9xaVJi2J8+t2GsvVmAvGr86gk1vApbZdA55mBDF+mJ+xlPZgN+dlD5sLlS9spAWcdyfy3hgrGwqmXf3BBQGz1NNOb4vHyNUEDEduxEhW4WyBieKfMWWOni61DlZ04QmPi75GvwO91L2viq966nwRRe/Gq82qfVzjhOTb9zddPgp+ekVqW/wP4AcWPEnL399yHFZxONjbs0HBeh1/jwD7ozy0qPNwKbJpDoljzgi+mkkD9DpdIaDGizPlPJ20NpsHynDXlCo7n4NqghQuTNCgYMgZqmrnw5VqiHwc3evCUilampLRjoWTr4eBl9nknimwWJ4XmQ7bNUKpnLnBRVaRAGKongZaVBJB/HEb7d4ECDfoWiJOxWb/ssSpU/zpBeRqMCCZ9e6Hx28VJCUrDBzA98lMwH6TIUnn22auzWBYFaoqWP/dl3tKrOyXSS5F2KoU7m27reXVbynrW/SeePlMJUUg/ioXGCc09vJaQPJ2LDJvMMPmu1mZB6n+xABsYDKlrOOYK8TRrfyU9H
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 22:35:20.0650
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23d5ea88-1602-40cc-631f-08dc37e46126
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6958

From: Juergen Gross <jgross@suse.com>

Add the callbacks for mapping/unmapping guest memory via grants to the
special grant memory region.

Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 hw/xen/xen-mapcache.c | 176 +++++++++++++++++++++++++++++++++++++++++-
 system/physmem.c      |  11 ++-
 2 files changed, 182 insertions(+), 5 deletions(-)

diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
index 179b7e95b2..2e4c9b4947 100644
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
 
 #if HOST_LONG_BITS == 32
 #  define MCACHE_BUCKET_SHIFT 16
@@ -377,7 +381,7 @@ uint8_t *xen_map_cache(hwaddr phys_addr, hwaddr size,
     return p;
 }
 
-ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
+static ram_addr_t xen_ram_addr_from_mapcache_try(void *ptr)
 {
     MapCacheEntry *entry = NULL;
     MapCacheRev *reventry;
@@ -588,10 +592,179 @@ uint8_t *xen_replace_cache_entry(hwaddr old_phys_addr,
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
+            qemu_mutex_unlock(&xen_map_mutex);
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
@@ -606,6 +779,7 @@ MemoryRegion *xen_init_grant_ram(void)
     ram_grants.ram_block = block;
     ram_grants.ram = true;
     ram_grants.terminates = true;
+    ram_grants.ops = &xen_grant_mr_ops;
     ram_block_add_list(block);
     memory_region_add_subregion(get_system_memory(), XEN_GRANT_ADDR_OFF,
                                 &ram_grants);
diff --git a/system/physmem.c b/system/physmem.c
index d989e9fc1f..e6fc075d8f 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -2232,13 +2232,16 @@ RAMBlock *qemu_ram_block_from_host(void *ptr, bool round_offset,
 
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


