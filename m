Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 458497D7693
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 23:25:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623324.971097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvlMv-0002v1-Em; Wed, 25 Oct 2023 21:24:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623324.971097; Wed, 25 Oct 2023 21:24:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvlMv-0002ss-BS; Wed, 25 Oct 2023 21:24:49 +0000
Received: by outflank-mailman (input) for mailman id 623324;
 Wed, 25 Oct 2023 21:24:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sdGm=GH=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qvlMt-0002bQ-Cw
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 21:24:47 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20625.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb545dc6-737c-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 23:24:46 +0200 (CEST)
Received: from DS7PR03CA0276.namprd03.prod.outlook.com (2603:10b6:5:3ad::11)
 by CH3PR12MB7521.namprd12.prod.outlook.com (2603:10b6:610:143::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Wed, 25 Oct
 2023 21:24:43 +0000
Received: from DS3PEPF000099DF.namprd04.prod.outlook.com
 (2603:10b6:5:3ad:cafe::94) by DS7PR03CA0276.outlook.office365.com
 (2603:10b6:5:3ad::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19 via Frontend
 Transport; Wed, 25 Oct 2023 21:24:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DF.mail.protection.outlook.com (10.167.17.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Wed, 25 Oct 2023 21:24:43 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 25 Oct
 2023 16:24:36 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Wed, 25 Oct 2023 16:24:35 -0500
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
X-Inumbo-ID: eb545dc6-737c-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNHzO9TyKadNN4QBBREyhymOu+T/Y/ljmaZLCrc+U4Ej4XzayaXJ1i6FecbbQUnW4lqqHmIkmdzVoYCO4UpJvY3oQlZd21l2kKI3a8k5ArZg+ZFnpXiZVfZkbMtjGaufMhyo3tOnnzyz/cHUFHJIOYri3ttYsPr6nqKgYqxfV5Rf1M70+fjh4donHPk57YDaXjIJZYDMIKdN/CldmQt0IuDx8n1a9ekOSyNwcwJgbNvQWftVifWPJBlLwlymSYyB8vUQqkA+tDj8AssTFhm3hucs5mQVo/jg9GKiUI1LXpCtQXNmY43PKv1tYuJJJmr9wipuGyZ98YrJ8lQk9zi5rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ut7Scrh7dAWVSwNqnu8r7sO55DGW8qB7WwwfhcTT7kA=;
 b=aQMN6hWaQqf0VxKaEwyXQJiuabPme8anIA1HIzIA0inF7m1OLwVqNTCadYl/kzbHJsFSssOlecKLytoXrHgY4ewe12hOMulnTHYoRKbpU33Y+/amwtP+3gvQeZZlpgogRM1Cf+tDmVxgCFdchCMR3WcKEWPzPJb/068R5Ooj5DlVnOAAo8J5AxqeQBfMjeD+4Eku8BvuFG6w+vjRTF7zcZYGAk6s/JyUcmqP/EQwVlKYSzkelZPe/UyGmJaQQPBiBVK7Cri4OIPMG6dA1U4dgBWg2AxldFYhdVbkidvS98gTtNw/gQAOsddSr7PTmwAqSJTdInMv0sfrTwzKxp20Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ut7Scrh7dAWVSwNqnu8r7sO55DGW8qB7WwwfhcTT7kA=;
 b=2o12FFLUsQvSTs5van85adZmy333PZR6n9L742jWG/e8dmRZ0RpolXWeyzONFFAcEs9YQTcN+6QG/0NBFIBrRhkzz43o2EXivBrz45s/KfIgEYkV0Q5fhwtsv0V1jKaE/R/PAQGCKEU+EGoLN/QIbtGedAig3ylMb/ZE5s3XOLY=
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
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
	<richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum
	<marcel.apfelbaum@gmail.com>, "open list:X86 Xen CPUs"
	<xen-devel@lists.xenproject.org>
Subject: [QEMU][PATCHv2 3/8] xen: add pseudo RAM region for grant mappings
Date: Wed, 25 Oct 2023 14:24:16 -0700
Message-ID: <20231025212422.30371-4-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231025212422.30371-1-vikram.garhwal@amd.com>
References: <20231025212422.30371-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DF:EE_|CH3PR12MB7521:EE_
X-MS-Office365-Filtering-Correlation-Id: b82c8f39-c33d-4f43-1b3b-08dbd5a0ce49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PEQAVun/RHDzu01SmZbK8teY3/In0sqKYfSrofRRPwlajAUwd7Hja0RI27fkyOfJKxgbFuirYIJmrJa8GArREyLUPfBKzid9paMQxGP1NJAwuoKpcFyrYqDvmHGnnQrYV+uqLDZLE6Cg8BS2yPZCxaZN/bPhaqtSA0pfiQJZcLrbg1xUXYZZcO2gparTQqiYi6MEVHXL3qpTWLg77q0MkuTKmkqP9z+sKzOu6j6C+f7i48ILA6BA+cwsoFKqvAq54GJySsgotECj1j8mCpJNgX3DbSlwTCNk/ePoTGFpNDT7Ob02U06z9Nc0VU1uGR46jwcqsL+aI9VpUpOKw49/Sa0rah4NrMSe25XK7PRh4d84/pzErJZNuW4gZwcLpfMAQunJ+f91Doq2uqxcO/hL01rVVNw87pF9BiKFe8hF83gpA4wV8AahsSW4aNu5N1xE7s1PSsG9bgorDo8eEzBjCbk2jg3ForMZk6B+nUKLALwf2FO20sDdzVBiXiaSnJjZgru8cdMjbquZ8u/ZuX5AqDGqNEWL7zZHRZKbg6FcTbvXnO2hVOuLpqb0GPgkto1WzOr8HqJH81NyzSk1sCcYj0RGvHoOtjEsGfuBx3lXxVFKIYdq1HvT9zGrvg79QeXMdaCst0w1WzkZVnotSBdRya3i8LBtiX9ZVSsvg0GIZpLoX25OwZAptnde6ugbe+r0UmSVjmXoFx6vOxHzRyurtdE+zF7YyhSFwaFN3wYYyM9HDA+fjlO3wWeeTvZ6flp84zuaXj4oaZ0m9NfQQFoLCA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(376002)(346002)(396003)(230922051799003)(64100799003)(451199024)(82310400011)(186009)(1800799009)(40470700004)(46966006)(36840700001)(2906002)(44832011)(81166007)(36860700001)(478600001)(70586007)(70206006)(356005)(316002)(1076003)(6916009)(47076005)(40480700001)(336012)(426003)(83380400001)(54906003)(41300700001)(40460700003)(4326008)(36756003)(86362001)(5660300002)(7416002)(6666004)(2616005)(8676002)(82740400003)(8936002)(26005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 21:24:43.3718
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b82c8f39-c33d-4f43-1b3b-08dbd5a0ce49
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7521

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
 hw/i386/xen/xen-hvm.c           |  3 +++
 hw/xen/xen-hvm-common.c         |  4 ++--
 hw/xen/xen-mapcache.c           | 27 +++++++++++++++++++++++++++
 include/hw/xen/xen-hvm-common.h |  2 ++
 include/hw/xen/xen_pvdev.h      |  3 +++
 include/sysemu/xen-mapcache.h   |  3 +++
 6 files changed, 40 insertions(+), 2 deletions(-)

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
-- 
2.17.1


