Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BB07BA8E6
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 20:18:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613092.953376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoSuQ-0004m0-0T; Thu, 05 Oct 2023 18:17:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613092.953376; Thu, 05 Oct 2023 18:17:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoSuP-0004jv-Te; Thu, 05 Oct 2023 18:17:13 +0000
Received: by outflank-mailman (input) for mailman id 613092;
 Thu, 05 Oct 2023 18:17:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JwJB=FT=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qoSuN-0004jk-KY
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 18:17:11 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20602.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65402e04-63ab-11ee-98d3-6d05b1d4d9a1;
 Thu, 05 Oct 2023 20:17:09 +0200 (CEST)
Received: from MN2PR06CA0022.namprd06.prod.outlook.com (2603:10b6:208:23d::27)
 by DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.29; Thu, 5 Oct
 2023 18:17:05 +0000
Received: from BL6PEPF0001AB4F.namprd04.prod.outlook.com
 (2603:10b6:208:23d:cafe::4b) by MN2PR06CA0022.outlook.office365.com
 (2603:10b6:208:23d::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33 via Frontend
 Transport; Thu, 5 Oct 2023 18:17:05 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB4F.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Thu, 5 Oct 2023 18:17:05 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 5 Oct
 2023 13:17:04 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 5 Oct
 2023 13:17:04 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 5 Oct 2023 13:17:03 -0500
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
X-Inumbo-ID: 65402e04-63ab-11ee-98d3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EuUlFVxVhzxoLqFVFIqGK4wCc1UuWG4jN/R684+bClcCwhqLpq//KeJx5JROGKAHDSckIDxZZh0hEIK+mgT5yvKnDqc5Woa8omX7Y/gX7F+ICrBvshJ52Xh/oJAHGnaKkx8wJo2eaF979dQjtMxr1diSjGu27GoKPWgJaWKWdzHsER+vBX0k4ypbRkw7qAn8/K/QBHp1Kbb1MJAUjwIJOXd5JK+k9bpEsr840oixLaMBPpdX5vB7IVwZ4KY3IXT3e0ZmY6w4y54IZXM34dc7uc14tE0IrEWaKVcJJwyh1nVM8ku1Yr4IkYMuYaObWdABAkr7KwWhCGguKoO0Okm/Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8oqi3a0IooPX4pzHpvJYv6+eY6o0O3Q2hpb0iqszOV0=;
 b=GC5YTPrq0ciUDJlcHBERhJBt8roP4NpmNOqdBWWQb1TZhVZZy90xrh2v4su8Wr3YCiaU8Yfz4umx93AvC3VAJ2c0E3vypDGwLKJQ/eBT6r2qGOtcK3RROwKXDqpf5r7vAAIoyLNpDP3N4clC5D43qxSBTJuQhr6aBER2JHQPWX+RfL20UU44vp9CSHeyX9VmQnD0/LPh7Vc5zF2WrrWTzcnRNayurVd2pCrvjEAT5Rt8jn5eXTRGAFCTpWpvFTte9ZNFCZ5FFgy5ucNR7LhkvJF3I5PsptbmEQro2IT/dvCz08wImOun9rzr0Y5NzMmuzuA6PO05x8RALzgoppkwdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8oqi3a0IooPX4pzHpvJYv6+eY6o0O3Q2hpb0iqszOV0=;
 b=fva/QJ+j5EN0FncYL29OFhxoCQw/At32xz9UzVQP+zd7BXrIUSfYLYAiQoMwfZWaAOvHvKG+qULVUj+1hW1yxDH3PdMthJgp6C24cdWXY2rmD8i+RZ9/zs5jX2uwPqei0z7xn2uS96Yddo0Cjn0V0TeUUis9KPYAnyV7QoltpgY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>, Vikram Garhwal
	<vikram.garhwal@amd.com>, Anthony Perard <anthony.perard@citrix.com>, "Paul
 Durrant" <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>, "Marcel
 Apfelbaum" <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>, Eduardo Habkost
	<eduardo@habkost.net>, Peter Xu <peterx@redhat.com>, David Hildenbrand
	<david@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
	<philmd@linaro.org>, "open list:X86 Xen CPUs"
	<xen-devel@lists.xenproject.org>
Subject: [QEMU][PATCH v1 2/7] xen: add pseudo RAM region for grant mappings
Date: Thu, 5 Oct 2023 11:16:24 -0700
Message-ID: <20231005181629.4046-3-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231005181629.4046-1-vikram.garhwal@amd.com>
References: <20231005181629.4046-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4F:EE_|DM6PR12MB4123:EE_
X-MS-Office365-Filtering-Correlation-Id: c13242fa-ee1e-4ee0-3643-08dbc5cf478b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3wZ2BXBgho+mMEzE0AGW5OrYHztNM8hM4p2d99E/QdEShzgFo8OLnQR9SjPSH7pXbqUDgHYYP2CwfEsg/WtC31VvRmTQa2yTYKJcdsGOKHzRe23TYCYsNAA9IM/sHfpLGslJYSioGQ6qENtAndKkuRbLCcFLoE6IlSsaF15D2y2zTc2edFxulH185qck7wmPqCKbfWWcjPEfgYLkNhgU2OM4uc1q71rCWW8OzmkFs3K2JkZ09nocW73Qk8JyVSrLHTgpP7GPjenp8c2gKYFQwH0XIfJpueXtYfoAjB1bvyPvLozQ253O6DGTqY7v6Ii+3ntsthh3XE+Pfermo1KSwInpyDU1FVr6BXBlQAgzU/hHkN5uOS32+2oU8tfkJzrSVtW/DueHOMeNMmHqh3rPDlDoqmuzfB1NBBWmCWU7+Jq06wgxaNav1fbSl8YY6D6S65aJIXJ2ciMe/ULIb2+4EnxOcif9TldEdmTwYdz8/pDQuzvvRAXc1O8JD7dJLZNQu46by1YzZtjy8E6aD47vPnI+rtBI66LFwssbKgsbuQwLBIdL37mCOKn1ZZ9Wv49PKyPLtatEvHqrNbvvnj7l2LrLi6w+Aoaiv9JkKusdDdmMpaoPcepeXA1EZiNEY2ITBoG6t3KdUOvKRHraboTw6IW4nRabnUXJdKIknoU3H1QY3qdaUtwlthsXBGbvsi0Ywg9fdMpgFaKlezs3QOngsROQshOdJtPqKrcFnujTNh7A+rCEAzxeyNU2b8HHq0Q+CvIowbgtlCDXVvn+XsomGQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(376002)(136003)(39860400002)(230922051799003)(451199024)(82310400011)(64100799003)(1800799009)(186009)(40470700004)(46966006)(36840700001)(40460700003)(40480700001)(83380400001)(336012)(426003)(4326008)(81166007)(44832011)(356005)(82740400003)(5660300002)(86362001)(36756003)(7416002)(36860700001)(6916009)(316002)(54906003)(478600001)(70206006)(70586007)(8676002)(8936002)(47076005)(2906002)(2616005)(26005)(6666004)(41300700001)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 18:17:05.1796
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c13242fa-ee1e-4ee0-3643-08dbc5cf478b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4123

From: Juergen Gross <jgross@suse.com>

Add a memory region which can be used to automatically map granted
memory. It is starting at 0x8000000000000000ULL in order to be able to
distinguish it from normal RAM.

For this reason the xen.ram memory region is expanded, which has no
further impact as it is used just as a container of the real RAM
regions and now the grant region.

Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 hw/i386/xen/xen-hvm.c           |  3 ++
 hw/xen/xen-hvm-common.c         |  4 +--
 hw/xen/xen-mapcache.c           | 27 ++++++++++++++
 include/exec/ram_addr.h         |  1 +
 include/hw/xen/xen-hvm-common.h |  2 ++
 include/hw/xen/xen_pvdev.h      |  3 ++
 include/sysemu/xen-mapcache.h   |  3 ++
 softmmu/physmem.c               | 62 +++++++++++++++++++++------------
 8 files changed, 80 insertions(+), 25 deletions(-)

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index f42621e674..67a55558a6 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -172,6 +172,9 @@ static void xen_ram_init(PCMachineState *pcms,
                                  x86ms->above_4g_mem_size);
         memory_region_add_subregion(sysmem, 0x100000000ULL, &ram_hi);
     }
+
+    /* Add grant mappings as a pseudo RAM region. */
+    ram_grants = *xen_init_grant_ram();
 }
 
 static XenPhysmap *get_physmapping(hwaddr start_addr, ram_addr_t size)
diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index 565dc39c8f..b7255977a5 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -9,7 +9,7 @@
 #include "hw/boards.h"
 #include "hw/xen/arch_hvm.h"
 
-MemoryRegion ram_memory;
+MemoryRegion ram_memory, ram_grants;
 
 void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
                    Error **errp)
@@ -26,7 +26,7 @@ void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
         return;
     }
 
-    if (mr == &ram_memory) {
+    if (mr == &ram_memory || mr == &ram_grants) {
         return;
     }
 
diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
index f7d974677d..8115c44c00 100644
--- a/hw/xen/xen-mapcache.c
+++ b/hw/xen/xen-mapcache.c
@@ -14,7 +14,9 @@
 
 #include <sys/resource.h>
 
+#include "hw/xen/xen-hvm-common.h"
 #include "hw/xen/xen_native.h"
+#include "hw/xen/xen_pvdev.h"
 #include "qemu/bitmap.h"
 
 #include "sysemu/runstate.h"
@@ -597,3 +599,28 @@ uint8_t *xen_replace_cache_entry(hwaddr old_phys_addr,
     mapcache_unlock();
     return p;
 }
+
+MemoryRegion *xen_init_grant_ram(void)
+{
+    RAMBlock *block;
+
+    memory_region_init(&ram_grants, NULL, "xen.grants",
+                       XEN_MAX_VIRTIO_GRANTS * XC_PAGE_SIZE);
+    block = g_malloc0(sizeof(*block));
+    block->mr = &ram_grants;
+    block->used_length = XEN_MAX_VIRTIO_GRANTS * XC_PAGE_SIZE;
+    block->max_length = XEN_MAX_VIRTIO_GRANTS * XC_PAGE_SIZE;
+    block->fd = -1;
+    block->page_size = XC_PAGE_SIZE;
+    block->host = (void *)XEN_GRANT_ADDR_OFF;
+    block->offset = XEN_GRANT_ADDR_OFF;
+    block->flags = RAM_PREALLOC;
+    ram_grants.ram_block = block;
+    ram_grants.ram = true;
+    ram_grants.terminates = true;
+    ram_block_add_list(block);
+    memory_region_add_subregion(get_system_memory(), XEN_GRANT_ADDR_OFF,
+                                &ram_grants);
+
+    return &ram_grants;
+}
diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 90676093f5..c0b5f9a7d0 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -139,6 +139,7 @@ void qemu_ram_free(RAMBlock *block);
 int qemu_ram_resize(RAMBlock *block, ram_addr_t newsize, Error **errp);
 
 void qemu_ram_msync(RAMBlock *block, ram_addr_t start, ram_addr_t length);
+void ram_block_add_list(RAMBlock *new_block);
 
 /* Clear whole block of mem */
 static inline void qemu_ram_block_writeback(RAMBlock *block)
diff --git a/include/hw/xen/xen-hvm-common.h b/include/hw/xen/xen-hvm-common.h
index 4e9904f1a6..0d300ba898 100644
--- a/include/hw/xen/xen-hvm-common.h
+++ b/include/hw/xen/xen-hvm-common.h
@@ -17,6 +17,8 @@
 #include <xen/hvm/ioreq.h>
 
 extern MemoryRegion ram_memory;
+
+extern MemoryRegion ram_grants;
 extern MemoryListener xen_io_listener;
 extern DeviceListener xen_device_listener;
 
diff --git a/include/hw/xen/xen_pvdev.h b/include/hw/xen/xen_pvdev.h
index ddad4b9f36..0f1b5edfa9 100644
--- a/include/hw/xen/xen_pvdev.h
+++ b/include/hw/xen/xen_pvdev.h
@@ -80,4 +80,7 @@ int xen_pv_send_notify(struct XenLegacyDevice *xendev);
 void xen_pv_printf(struct XenLegacyDevice *xendev, int msg_level,
                    const char *fmt, ...)  G_GNUC_PRINTF(3, 4);
 
+#define XEN_GRANT_ADDR_OFF    0x8000000000000000ULL
+#define XEN_MAX_VIRTIO_GRANTS 65536
+
 #endif /* QEMU_HW_XEN_PVDEV_H */
diff --git a/include/sysemu/xen-mapcache.h b/include/sysemu/xen-mapcache.h
index c8e7c2f6cf..f4bedb1c11 100644
--- a/include/sysemu/xen-mapcache.h
+++ b/include/sysemu/xen-mapcache.h
@@ -10,6 +10,7 @@
 #define XEN_MAPCACHE_H
 
 #include "exec/cpu-common.h"
+#include "exec/ram_addr.h"
 
 typedef hwaddr (*phys_offset_to_gaddr_t)(hwaddr phys_offset,
                                          ram_addr_t size);
@@ -25,6 +26,8 @@ void xen_invalidate_map_cache(void);
 uint8_t *xen_replace_cache_entry(hwaddr old_phys_addr,
                                  hwaddr new_phys_addr,
                                  hwaddr size);
+MemoryRegion *xen_init_grant_ram(void);
+
 #else
 
 static inline void xen_map_cache_init(phys_offset_to_gaddr_t f,
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 309653c722..e182a2fa07 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1803,12 +1803,47 @@ static void dirty_memory_extend(ram_addr_t old_ram_size,
     }
 }
 
+static void ram_block_add_list_locked(RAMBlock *new_block)
+ {
+     RAMBlock *block;
+     RAMBlock *last_block = NULL;
+
+    /*
+     * Keep the list sorted from biggest to smallest block.  Unlike QTAILQ,
+     * QLIST (which has an RCU-friendly variant) does not have insertion at
+     * tail, so save the last element in last_block.
+     */
+    RAMBLOCK_FOREACH(block) {
+        last_block = block;
+        if (block->max_length < new_block->max_length) {
+            break;
+        }
+    }
+    if (block) {
+        QLIST_INSERT_BEFORE_RCU(block, new_block, next);
+    } else if (last_block) {
+        QLIST_INSERT_AFTER_RCU(last_block, new_block, next);
+    } else { /* list is empty */
+        QLIST_INSERT_HEAD_RCU(&ram_list.blocks, new_block, next);
+    }
+    ram_list.mru_block = NULL;
+
+    /* Write list before version */
+    smp_wmb();
+    ram_list.version++;
+}
+
+void ram_block_add_list(RAMBlock *new_block)
+{
+    qemu_mutex_lock_ramlist();
+    ram_block_add_list_locked(new_block);
+    qemu_mutex_unlock_ramlist();
+}
+
 static void ram_block_add(RAMBlock *new_block, Error **errp)
 {
     const bool noreserve = qemu_ram_is_noreserve(new_block);
     const bool shared = qemu_ram_is_shared(new_block);
-    RAMBlock *block;
-    RAMBlock *last_block = NULL;
     ram_addr_t old_ram_size, new_ram_size;
     Error *err = NULL;
 
@@ -1846,28 +1881,9 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
     if (new_ram_size > old_ram_size) {
         dirty_memory_extend(old_ram_size, new_ram_size);
     }
-    /* Keep the list sorted from biggest to smallest block.  Unlike QTAILQ,
-     * QLIST (which has an RCU-friendly variant) does not have insertion at
-     * tail, so save the last element in last_block.
-     */
-    RAMBLOCK_FOREACH(block) {
-        last_block = block;
-        if (block->max_length < new_block->max_length) {
-            break;
-        }
-    }
-    if (block) {
-        QLIST_INSERT_BEFORE_RCU(block, new_block, next);
-    } else if (last_block) {
-        QLIST_INSERT_AFTER_RCU(last_block, new_block, next);
-    } else { /* list is empty */
-        QLIST_INSERT_HEAD_RCU(&ram_list.blocks, new_block, next);
-    }
-    ram_list.mru_block = NULL;
 
-    /* Write list before version */
-    smp_wmb();
-    ram_list.version++;
+    ram_block_add_list_locked(new_block);
+
     qemu_mutex_unlock_ramlist();
 
     cpu_physical_memory_set_dirty_range(new_block->offset,
-- 
2.17.1


