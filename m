Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0861F5FF889
	for <lists+xen-devel@lfdr.de>; Sat, 15 Oct 2022 07:09:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.423254.669901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojZPm-0008Uj-2t; Sat, 15 Oct 2022 05:08:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 423254.669901; Sat, 15 Oct 2022 05:08:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojZPl-0008I1-NJ; Sat, 15 Oct 2022 05:08:49 +0000
Received: by outflank-mailman (input) for mailman id 423254;
 Sat, 15 Oct 2022 05:08:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q/I2=2Q=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1ojZPj-00069z-0c
 for xen-devel@lists.xenproject.org; Sat, 15 Oct 2022 05:08:47 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2069.outbound.protection.outlook.com [40.107.212.69])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f96e632-4c47-11ed-8fd0-01056ac49cbb;
 Sat, 15 Oct 2022 07:08:42 +0200 (CEST)
Received: from DS7PR07CA0016.namprd07.prod.outlook.com (2603:10b6:5:3af::18)
 by MW4PR12MB6778.namprd12.prod.outlook.com (2603:10b6:303:1e8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Sat, 15 Oct
 2022 05:08:38 +0000
Received: from CY4PEPF0000B8EB.namprd05.prod.outlook.com
 (2603:10b6:5:3af:cafe::2f) by DS7PR07CA0016.outlook.office365.com
 (2603:10b6:5:3af::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30 via Frontend
 Transport; Sat, 15 Oct 2022 05:08:37 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000B8EB.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5676.13 via Frontend Transport; Sat, 15 Oct 2022 05:08:37 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Sat, 15 Oct
 2022 00:08:34 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 14 Oct
 2022 22:08:20 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Sat, 15 Oct 2022 00:08:20 -0500
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
X-Inumbo-ID: 6f96e632-4c47-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SIbjUIrZfqWcgfRSwu0RZDMu7lT3txi/VwInbaK8h+1010XdsgTRgMHv/1GWmRmJ9LT2IdvO2h5GCH+uo6aTRamxL9FRMbEupZdgBwB1KrojngrNL+ywKYzbIScl87BhHAPPWGi0u8IVhu7CPm68tHt9MTmez4afUBm7vCgCpWXDEbW5so+7CJ4xBC/REedVhH1/KhVSVjn/Ql1nb9L3kimd4Y3/HShAgoV0yBVrXeeGLVe4HnTVWPxZUVKbUSpttSDwPN0josf1/wUHqjry57ru09rcBqPEC8e9ChC9gNKEhYryHTM5YtdyD40KwH5RWx/lvSzS1GlmPMRqV0Oj6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSPCw7o+yxos/RT4fp3FBWtMrt+x0eWdJDWjyf9JYrA=;
 b=ZeiIXUZ80QYsDkih6qss0Sr0CSSybIHl3h+50wSReaJaxgXIog8BWKBDbVTJgjm6iIYs0lAnOqmLPzi4tfWgnorLWNsV1IWcLrD8+l+NyMpPP2CP1D3eFHhMWQdnhoseCFXOPu+YMCL53Qyfjx8icwD9Dy0dbiOu4efOmvAaMMQVYgkfJhoSZh2EvO8byEGdDrIgSinCsmNxC2D/fsEmoGGfQq91qOxH2KeR116ysSJ4jzRskQ/5LZ+xdEcY21FLbaWZ5jQB6a661lpwJLE0mDt1gkyGH2fnFlkdGApbB1/YfsRwBtzhBRlhRxH1UR0JptGbAolKfQhFmZCRylZ07Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSPCw7o+yxos/RT4fp3FBWtMrt+x0eWdJDWjyf9JYrA=;
 b=qOvEJFOuq7d+8afzqzH988FDQ14V77IX0XTUjvZAdZSvhN4JHSmVxk45pYGk6xobDkoDYL5sydur051rIDStdWhDnlgbfnCotqkv+Q2TE/3rSBTd04d7zxtJwaDKqeH8BWkfUSiMrdLlK4PCrBfdkou49ULqdZAqDlA64xF+o3M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <vikram.garhwal@amd.com>, <stefano.stabellini@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, "Paul
 Durrant" <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>, "Marcel
 Apfelbaum" <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>, Eduardo Habkost
	<eduardo@habkost.net>, "open list:X86 Xen CPUs"
	<xen-devel@lists.xenproject.org>
Subject: [PATCH v1 06/12] xen-hvm: move common functions to hw/xen/xen-hvm-common.c
Date: Fri, 14 Oct 2022 22:07:44 -0700
Message-ID: <20221015050750.4185-7-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221015050750.4185-1-vikram.garhwal@amd.com>
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000B8EB:EE_|MW4PR12MB6778:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aff2840-a08c-4044-0007-08daae6b516b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mGV0qu8kaOYm9NAwUo0JavbdDPJRLABBPlbzSSyUhkrttswDD/86lQfn7SzRvi8ZHkm3yhN9YeJZYc0KBfvQ/7M1eSjP/eyraSfoeRrHMLPr//bBoIfuVkSd8B9922IrAFYE4FvPD4c8g0aZSsJaPx/weWArLs5ml6+8WHH+uYtB6ONIea5K4edST1ly6LIESfd4PaM6RkurCnesYuf11fpmMcW9iEz7mgY8f8yPCKPPKMsekKt7j7nOrwulFvgJxSltO1oXjM2Em6XIbzN+Fk/AahKgGjN8HlF3UwmCRpFh7Uya8/x01cj1RPYbpxlSEBBTHPVoxwulfjDBrHQ5VT+of7podLWS7WDNhfjuAeMIyImVv1Uwe6w54dzBd7pAJXQYKFMjVatSge2gYBPSh/daOkV85WoxjbMeJsLnGNEwB2uL/jNqsEtgUFfUiH4GTD4VtolrNX9KqDjgVKm4xoDasHxhNScARjJ+kKO4h2a9dcZtbcrWRNpigjs9n/qX2omu2LOhYxG27OrKSChSYv8bKp1O5HWFQ0J1Z6W/OdzBm7c1J1vg+D+8ZXvS6Ij+X/o4fJrmP7L/IplMXEDsvAFFjzhW+Y4K/041VAW/FevyEWLzAgGCgAkrZXeX47J+pCtEx44NaLrS/w/OzfdB1hQm4zw6OvlzeBgKXDyoTbLB6KkmCkbmuRbVnWIQEseNHMiUfTtoTG5idc3+1doEoG7HVUoehqhNPbpAgCyecZtczK8ChS+0rNeOgW0U/vp7OMu/f7yQJx75SW3r4npwEt61yxH/iFydCgKQw5mw48GFuOJICkQNv5LFr2GN0sN8
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(36860700001)(478600001)(82310400005)(86362001)(54906003)(41300700001)(36756003)(6916009)(44832011)(83380400001)(7416002)(70206006)(30864003)(8676002)(4326008)(356005)(47076005)(26005)(70586007)(6666004)(40460700003)(336012)(8936002)(2616005)(186003)(81166007)(316002)(2906002)(40480700001)(1076003)(82740400003)(426003)(5660300002)(36900700001)(579004)(559001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2022 05:08:37.5327
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aff2840-a08c-4044-0007-08daae6b516b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000B8EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6778

Extract common functionalities from hw/i386/xen/xen-hvm.c and move them to
hw/xen/xen-hvm-common.c. These common functions are useful for creating
an IOREQ server.

xen_hvm_init_pc() contains the arch independent code for creating and mapping
a IOREQ server, connecting memory and IO listeners, initializing a xen bus and
registering backends. Moved this common xen code to a new function
xen_register_ioreq() which can be used by both x86 and ARM machines.

Following functions are moved to hw/xen/xen-hvm-common.c:
    xen_vcpu_eport(), xen_vcpu_ioreq(), xen_ram_alloc(), xen_set_memory(),
    xen_region_add(), xen_region_del(), xen_io_add(), xen_io_del(),
    xen_device_realize(), xen_device_unrealize(),
    cpu_get_ioreq_from_shared_memory(), cpu_get_ioreq(), do_inp(), do_outp(),
    rw_phys_req_item(), read_phys_req_item(), write_phys_req_item(),
    cpu_ioreq_pio(), cpu_ioreq_move(), cpu_ioreq_config(), handle_ioreq(),
    handle_buffered_iopage(), handle_buffered_io(), cpu_handle_ioreq(),
    xen_main_loop_prepare(), xen_hvm_change_state_handler(),
    xen_exit_notifier(), xen_map_ioreq_server(), destroy_hvm_domain() and
    xen_shutdown_fatal_error()

Removed static type from below functions:
1. xen_region_add()
2. xen_region_del()
3. xen_io_add()
4. xen_io_del()
5. xen_device_realize()
6. xen_device_unrealize()
7. xen_hvm_change_state_handler()
8. cpu_ioreq_pio()
9. xen_exit_notifier()

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 hw/i386/xen/trace-events        |  14 -
 hw/i386/xen/xen-hvm.c           | 930 +-------------------------------
 hw/xen/meson.build              |   5 +-
 hw/xen/trace-events             |  14 +
 hw/xen/xen-hvm-common.c         | 858 +++++++++++++++++++++++++++++
 include/hw/i386/xen_arch_hvm.h  |   1 +
 include/hw/xen/xen-hvm-common.h |  97 ++++
 7 files changed, 983 insertions(+), 936 deletions(-)
 create mode 100644 hw/xen/xen-hvm-common.c
 create mode 100644 include/hw/xen/xen-hvm-common.h

diff --git a/hw/i386/xen/trace-events b/hw/i386/xen/trace-events
index a0c89d91c4..5d0a8d6dcf 100644
--- a/hw/i386/xen/trace-events
+++ b/hw/i386/xen/trace-events
@@ -7,17 +7,3 @@ xen_platform_log(char *s) "xen platform: %s"
 xen_pv_mmio_read(uint64_t addr) "WARNING: read from Xen PV Device MMIO space (address 0x%"PRIx64")"
 xen_pv_mmio_write(uint64_t addr) "WARNING: write to Xen PV Device MMIO space (address 0x%"PRIx64")"
 
-# xen-hvm.c
-xen_ram_alloc(unsigned long ram_addr, unsigned long size) "requested: 0x%lx, size 0x%lx"
-xen_client_set_memory(uint64_t start_addr, unsigned long size, bool log_dirty) "0x%"PRIx64" size 0x%lx, log_dirty %i"
-handle_ioreq(void *req, uint32_t type, uint32_t dir, uint32_t df, uint32_t data_is_ptr, uint64_t addr, uint64_t data, uint32_t count, uint32_t size) "I/O=%p type=%d dir=%d df=%d ptr=%d port=0x%"PRIx64" data=0x%"PRIx64" count=%d size=%d"
-handle_ioreq_read(void *req, uint32_t type, uint32_t df, uint32_t data_is_ptr, uint64_t addr, uint64_t data, uint32_t count, uint32_t size) "I/O=%p read type=%d df=%d ptr=%d port=0x%"PRIx64" data=0x%"PRIx64" count=%d size=%d"
-handle_ioreq_write(void *req, uint32_t type, uint32_t df, uint32_t data_is_ptr, uint64_t addr, uint64_t data, uint32_t count, uint32_t size) "I/O=%p write type=%d df=%d ptr=%d port=0x%"PRIx64" data=0x%"PRIx64" count=%d size=%d"
-cpu_ioreq_pio(void *req, uint32_t dir, uint32_t df, uint32_t data_is_ptr, uint64_t addr, uint64_t data, uint32_t count, uint32_t size) "I/O=%p pio dir=%d df=%d ptr=%d port=0x%"PRIx64" data=0x%"PRIx64" count=%d size=%d"
-cpu_ioreq_pio_read_reg(void *req, uint64_t data, uint64_t addr, uint32_t size) "I/O=%p pio read reg data=0x%"PRIx64" port=0x%"PRIx64" size=%d"
-cpu_ioreq_pio_write_reg(void *req, uint64_t data, uint64_t addr, uint32_t size) "I/O=%p pio write reg data=0x%"PRIx64" port=0x%"PRIx64" size=%d"
-cpu_ioreq_move(void *req, uint32_t dir, uint32_t df, uint32_t data_is_ptr, uint64_t addr, uint64_t data, uint32_t count, uint32_t size) "I/O=%p copy dir=%d df=%d ptr=%d port=0x%"PRIx64" data=0x%"PRIx64" count=%d size=%d"
-xen_map_resource_ioreq(uint32_t id, void *addr) "id: %u addr: %p"
-cpu_ioreq_config_read(void *req, uint32_t sbdf, uint32_t reg, uint32_t size, uint32_t data) "I/O=%p sbdf=0x%x reg=%u size=%u data=0x%x"
-cpu_ioreq_config_write(void *req, uint32_t sbdf, uint32_t reg, uint32_t size, uint32_t data) "I/O=%p sbdf=0x%x reg=%u size=%u data=0x%x"
-
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 3cd1808f9d..0406f13b35 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -10,47 +10,20 @@
 
 #include "qemu/osdep.h"
 #include "qemu/units.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-migration.h"
+#include "trace.h"
 
-#include "cpu.h"
-#include "hw/pci/pci.h"
-#include "hw/pci/pci_host.h"
 #include "hw/i386/pc.h"
 #include "hw/irq.h"
-#include "hw/hw.h"
 #include "hw/i386/apic-msidef.h"
-#include "hw/xen/xen_common.h"
-#include "hw/xen/xen-legacy-backend.h"
-#include "hw/xen/xen-bus.h"
 #include "hw/xen/xen-x86.h"
-#include "qapi/error.h"
-#include "qapi/qapi-commands-migration.h"
-#include "qemu/error-report.h"
-#include "qemu/main-loop.h"
 #include "qemu/range.h"
-#include "sysemu/runstate.h"
-#include "sysemu/sysemu.h"
-#include "sysemu/xen.h"
-#include "sysemu/xen-mapcache.h"
-#include "trace.h"
 
-#include <xen/hvm/ioreq.h>
+#include "hw/xen/xen-hvm-common.h"
 #include "hw/xen/arch_hvm.h"
 #include <xen/hvm/e820.h>
 
-//#define DEBUG_XEN_HVM
-
-#ifdef DEBUG_XEN_HVM
-#define DPRINTF(fmt, ...) \
-    do { fprintf(stderr, "xen: " fmt, ## __VA_ARGS__); } while (0)
-#else
-#define DPRINTF(fmt, ...) \
-    do { } while (0)
-#endif
-
-static MemoryRegion ram_memory, ram_640k, ram_lo, ram_hi;
-static MemoryRegion *framebuffer;
-static bool xen_in_migration;
-
 /* Compatibility with older version */
 
 /* This allows QEMU to build on a system that has Xen 4.5 or earlier
@@ -76,26 +49,9 @@ typedef struct shared_vmport_iopage shared_vmport_iopage_t;
 #endif
 static shared_vmport_iopage_t *shared_vmport_page;
 
-static inline uint32_t xen_vcpu_eport(shared_iopage_t *shared_page, int i)
-{
-    return shared_page->vcpu_ioreq[i].vp_eport;
-}
-static inline ioreq_t *xen_vcpu_ioreq(shared_iopage_t *shared_page, int vcpu)
-{
-    return &shared_page->vcpu_ioreq[vcpu];
-}
-
-#define BUFFER_IO_MAX_DELAY  100
-
-typedef struct XenPhysmap {
-    hwaddr start_addr;
-    ram_addr_t size;
-    const char *name;
-    hwaddr phys_offset;
-
-    QLIST_ENTRY(XenPhysmap) list;
-} XenPhysmap;
-
+static MemoryRegion ram_640k, ram_lo, ram_hi;
+static MemoryRegion *framebuffer;
+static bool xen_in_migration;
 static QLIST_HEAD(, XenPhysmap) xen_physmap;
 static const XenPhysmap *log_for_dirtybit;
 /* Buffer used by xen_sync_dirty_bitmap */
@@ -103,38 +59,6 @@ static unsigned long *dirty_bitmap;
 static Notifier suspend;
 static Notifier wakeup;
 
-typedef struct XenPciDevice {
-    PCIDevice *pci_dev;
-    uint32_t sbdf;
-    QLIST_ENTRY(XenPciDevice) entry;
-} XenPciDevice;
-
-typedef struct XenIOState {
-    ioservid_t ioservid;
-    shared_iopage_t *shared_page;
-    buffered_iopage_t *buffered_io_page;
-    xenforeignmemory_resource_handle *fres;
-    QEMUTimer *buffered_io_timer;
-    CPUState **cpu_by_vcpu_id;
-    /* the evtchn port for polling the notification, */
-    evtchn_port_t *ioreq_local_port;
-    /* evtchn remote and local ports for buffered io */
-    evtchn_port_t bufioreq_remote_port;
-    evtchn_port_t bufioreq_local_port;
-    /* the evtchn fd for polling */
-    xenevtchn_handle *xce_handle;
-    /* which vcpu we are serving */
-    int send_vcpu;
-
-    struct xs_handle *xenstore;
-    MemoryListener memory_listener;
-    MemoryListener io_listener;
-    QLIST_HEAD(, XenPciDevice) dev_list;
-    DeviceListener device_listener;
-
-    Notifier exit;
-} XenIOState;
-
 /* Xen specific function for piix pci */
 
 int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
@@ -247,42 +171,6 @@ static void xen_ram_init(PCMachineState *pcms,
     }
 }
 
-void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
-                   Error **errp)
-{
-    unsigned long nr_pfn;
-    xen_pfn_t *pfn_list;
-    int i;
-
-    if (runstate_check(RUN_STATE_INMIGRATE)) {
-        /* RAM already populated in Xen */
-        fprintf(stderr, "%s: do not alloc "RAM_ADDR_FMT
-                " bytes of ram at "RAM_ADDR_FMT" when runstate is INMIGRATE\n",
-                __func__, size, ram_addr);
-        return;
-    }
-
-    if (mr == &ram_memory) {
-        return;
-    }
-
-    trace_xen_ram_alloc(ram_addr, size);
-
-    nr_pfn = size >> TARGET_PAGE_BITS;
-    pfn_list = g_malloc(sizeof (*pfn_list) * nr_pfn);
-
-    for (i = 0; i < nr_pfn; i++) {
-        pfn_list[i] = (ram_addr >> TARGET_PAGE_BITS) + i;
-    }
-
-    if (xc_domain_populate_physmap_exact(xen_xc, xen_domid, nr_pfn, 0, 0, pfn_list)) {
-        error_setg(errp, "xen: failed to populate ram at " RAM_ADDR_FMT,
-                   ram_addr);
-    }
-
-    g_free(pfn_list);
-}
-
 static XenPhysmap *get_physmapping(hwaddr start_addr, ram_addr_t size)
 {
     XenPhysmap *physmap = NULL;
@@ -472,109 +360,6 @@ static int xen_remove_from_physmap(XenIOState *state,
     return 0;
 }
 
-static void xen_set_memory(struct MemoryListener *listener,
-                           MemoryRegionSection *section,
-                           bool add)
-{
-    XenIOState *state = container_of(listener, XenIOState, memory_listener);
-
-    if (section->mr == &ram_memory) {
-        return;
-    } else {
-        if (add) {
-            xen_map_memory_section(xen_domid, state->ioservid,
-                                   section);
-        } else {
-            xen_unmap_memory_section(xen_domid, state->ioservid,
-                                     section);
-        }
-    }
-    arch_xen_set_memory(state, section, add);
-}
-
-static void xen_region_add(MemoryListener *listener,
-                           MemoryRegionSection *section)
-{
-    memory_region_ref(section->mr);
-    xen_set_memory(listener, section, true);
-}
-
-static void xen_region_del(MemoryListener *listener,
-                           MemoryRegionSection *section)
-{
-    xen_set_memory(listener, section, false);
-    memory_region_unref(section->mr);
-}
-
-static void xen_io_add(MemoryListener *listener,
-                       MemoryRegionSection *section)
-{
-    XenIOState *state = container_of(listener, XenIOState, io_listener);
-    MemoryRegion *mr = section->mr;
-
-    if (mr->ops == &unassigned_io_ops) {
-        return;
-    }
-
-    memory_region_ref(mr);
-
-    xen_map_io_section(xen_domid, state->ioservid, section);
-}
-
-static void xen_io_del(MemoryListener *listener,
-                       MemoryRegionSection *section)
-{
-    XenIOState *state = container_of(listener, XenIOState, io_listener);
-    MemoryRegion *mr = section->mr;
-
-    if (mr->ops == &unassigned_io_ops) {
-        return;
-    }
-
-    xen_unmap_io_section(xen_domid, state->ioservid, section);
-
-    memory_region_unref(mr);
-}
-
-static void xen_device_realize(DeviceListener *listener,
-                               DeviceState *dev)
-{
-    XenIOState *state = container_of(listener, XenIOState, device_listener);
-
-    if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
-        PCIDevice *pci_dev = PCI_DEVICE(dev);
-        XenPciDevice *xendev = g_new(XenPciDevice, 1);
-
-        xendev->pci_dev = pci_dev;
-        xendev->sbdf = PCI_BUILD_BDF(pci_dev_bus_num(pci_dev),
-                                     pci_dev->devfn);
-        QLIST_INSERT_HEAD(&state->dev_list, xendev, entry);
-
-        xen_map_pcidev(xen_domid, state->ioservid, pci_dev);
-    }
-}
-
-static void xen_device_unrealize(DeviceListener *listener,
-                                 DeviceState *dev)
-{
-    XenIOState *state = container_of(listener, XenIOState, device_listener);
-
-    if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
-        PCIDevice *pci_dev = PCI_DEVICE(dev);
-        XenPciDevice *xendev, *next;
-
-        xen_unmap_pcidev(xen_domid, state->ioservid, pci_dev);
-
-        QLIST_FOREACH_SAFE(xendev, &state->dev_list, entry, next) {
-            if (xendev->pci_dev == pci_dev) {
-                QLIST_REMOVE(xendev, entry);
-                g_free(xendev);
-                break;
-            }
-        }
-    }
-}
-
 static void xen_sync_dirty_bitmap(XenIOState *state,
                                   hwaddr start_addr,
                                   ram_addr_t size)
@@ -682,277 +467,6 @@ static MemoryListener xen_memory_listener = {
     .priority = 10,
 };
 
-static MemoryListener xen_io_listener = {
-    .name = "xen-io",
-    .region_add = xen_io_add,
-    .region_del = xen_io_del,
-    .priority = 10,
-};
-
-static DeviceListener xen_device_listener = {
-    .realize = xen_device_realize,
-    .unrealize = xen_device_unrealize,
-};
-
-/* get the ioreq packets from share mem */
-static ioreq_t *cpu_get_ioreq_from_shared_memory(XenIOState *state, int vcpu)
-{
-    ioreq_t *req = xen_vcpu_ioreq(state->shared_page, vcpu);
-
-    if (req->state != STATE_IOREQ_READY) {
-        DPRINTF("I/O request not ready: "
-                "%x, ptr: %x, port: %"PRIx64", "
-                "data: %"PRIx64", count: %u, size: %u\n",
-                req->state, req->data_is_ptr, req->addr,
-                req->data, req->count, req->size);
-        return NULL;
-    }
-
-    xen_rmb(); /* see IOREQ_READY /then/ read contents of ioreq */
-
-    req->state = STATE_IOREQ_INPROCESS;
-    return req;
-}
-
-/* use poll to get the port notification */
-/* ioreq_vec--out,the */
-/* retval--the number of ioreq packet */
-static ioreq_t *cpu_get_ioreq(XenIOState *state)
-{
-    MachineState *ms = MACHINE(qdev_get_machine());
-    unsigned int max_cpus = ms->smp.max_cpus;
-    int i;
-    evtchn_port_t port;
-
-    port = xenevtchn_pending(state->xce_handle);
-    if (port == state->bufioreq_local_port) {
-        timer_mod(state->buffered_io_timer,
-                BUFFER_IO_MAX_DELAY + qemu_clock_get_ms(QEMU_CLOCK_REALTIME));
-        return NULL;
-    }
-
-    if (port != -1) {
-        for (i = 0; i < max_cpus; i++) {
-            if (state->ioreq_local_port[i] == port) {
-                break;
-            }
-        }
-
-        if (i == max_cpus) {
-            hw_error("Fatal error while trying to get io event!\n");
-        }
-
-        /* unmask the wanted port again */
-        xenevtchn_unmask(state->xce_handle, port);
-
-        /* get the io packet from shared memory */
-        state->send_vcpu = i;
-        return cpu_get_ioreq_from_shared_memory(state, i);
-    }
-
-    /* read error or read nothing */
-    return NULL;
-}
-
-static uint32_t do_inp(uint32_t addr, unsigned long size)
-{
-    switch (size) {
-        case 1:
-            return cpu_inb(addr);
-        case 2:
-            return cpu_inw(addr);
-        case 4:
-            return cpu_inl(addr);
-        default:
-            hw_error("inp: bad size: %04x %lx", addr, size);
-    }
-}
-
-static void do_outp(uint32_t addr,
-        unsigned long size, uint32_t val)
-{
-    switch (size) {
-        case 1:
-            return cpu_outb(addr, val);
-        case 2:
-            return cpu_outw(addr, val);
-        case 4:
-            return cpu_outl(addr, val);
-        default:
-            hw_error("outp: bad size: %04x %lx", addr, size);
-    }
-}
-
-/*
- * Helper functions which read/write an object from/to physical guest
- * memory, as part of the implementation of an ioreq.
- *
- * Equivalent to
- *   cpu_physical_memory_rw(addr + (req->df ? -1 : +1) * req->size * i,
- *                          val, req->size, 0/1)
- * except without the integer overflow problems.
- */
-static void rw_phys_req_item(hwaddr addr,
-                             ioreq_t *req, uint32_t i, void *val, int rw)
-{
-    /* Do everything unsigned so overflow just results in a truncated result
-     * and accesses to undesired parts of guest memory, which is up
-     * to the guest */
-    hwaddr offset = (hwaddr)req->size * i;
-    if (req->df) {
-        addr -= offset;
-    } else {
-        addr += offset;
-    }
-    cpu_physical_memory_rw(addr, val, req->size, rw);
-}
-
-static inline void read_phys_req_item(hwaddr addr,
-                                      ioreq_t *req, uint32_t i, void *val)
-{
-    rw_phys_req_item(addr, req, i, val, 0);
-}
-static inline void write_phys_req_item(hwaddr addr,
-                                       ioreq_t *req, uint32_t i, void *val)
-{
-    rw_phys_req_item(addr, req, i, val, 1);
-}
-
-
-static void cpu_ioreq_pio(ioreq_t *req)
-{
-    uint32_t i;
-
-    trace_cpu_ioreq_pio(req, req->dir, req->df, req->data_is_ptr, req->addr,
-                         req->data, req->count, req->size);
-
-    if (req->size > sizeof(uint32_t)) {
-        hw_error("PIO: bad size (%u)", req->size);
-    }
-
-    if (req->dir == IOREQ_READ) {
-        if (!req->data_is_ptr) {
-            req->data = do_inp(req->addr, req->size);
-            trace_cpu_ioreq_pio_read_reg(req, req->data, req->addr,
-                                         req->size);
-        } else {
-            uint32_t tmp;
-
-            for (i = 0; i < req->count; i++) {
-                tmp = do_inp(req->addr, req->size);
-                write_phys_req_item(req->data, req, i, &tmp);
-            }
-        }
-    } else if (req->dir == IOREQ_WRITE) {
-        if (!req->data_is_ptr) {
-            trace_cpu_ioreq_pio_write_reg(req, req->data, req->addr,
-                                          req->size);
-            do_outp(req->addr, req->size, req->data);
-        } else {
-            for (i = 0; i < req->count; i++) {
-                uint32_t tmp = 0;
-
-                read_phys_req_item(req->data, req, i, &tmp);
-                do_outp(req->addr, req->size, tmp);
-            }
-        }
-    }
-}
-
-static void cpu_ioreq_move(ioreq_t *req)
-{
-    uint32_t i;
-
-    trace_cpu_ioreq_move(req, req->dir, req->df, req->data_is_ptr, req->addr,
-                         req->data, req->count, req->size);
-
-    if (req->size > sizeof(req->data)) {
-        hw_error("MMIO: bad size (%u)", req->size);
-    }
-
-    if (!req->data_is_ptr) {
-        if (req->dir == IOREQ_READ) {
-            for (i = 0; i < req->count; i++) {
-                read_phys_req_item(req->addr, req, i, &req->data);
-            }
-        } else if (req->dir == IOREQ_WRITE) {
-            for (i = 0; i < req->count; i++) {
-                write_phys_req_item(req->addr, req, i, &req->data);
-            }
-        }
-    } else {
-        uint64_t tmp;
-
-        if (req->dir == IOREQ_READ) {
-            for (i = 0; i < req->count; i++) {
-                read_phys_req_item(req->addr, req, i, &tmp);
-                write_phys_req_item(req->data, req, i, &tmp);
-            }
-        } else if (req->dir == IOREQ_WRITE) {
-            for (i = 0; i < req->count; i++) {
-                read_phys_req_item(req->data, req, i, &tmp);
-                write_phys_req_item(req->addr, req, i, &tmp);
-            }
-        }
-    }
-}
-
-static void cpu_ioreq_config(XenIOState *state, ioreq_t *req)
-{
-    uint32_t sbdf = req->addr >> 32;
-    uint32_t reg = req->addr;
-    XenPciDevice *xendev;
-
-    if (req->size != sizeof(uint8_t) && req->size != sizeof(uint16_t) &&
-        req->size != sizeof(uint32_t)) {
-        hw_error("PCI config access: bad size (%u)", req->size);
-    }
-
-    if (req->count != 1) {
-        hw_error("PCI config access: bad count (%u)", req->count);
-    }
-
-    QLIST_FOREACH(xendev, &state->dev_list, entry) {
-        if (xendev->sbdf != sbdf) {
-            continue;
-        }
-
-        if (!req->data_is_ptr) {
-            if (req->dir == IOREQ_READ) {
-                req->data = pci_host_config_read_common(
-                    xendev->pci_dev, reg, PCI_CONFIG_SPACE_SIZE,
-                    req->size);
-                trace_cpu_ioreq_config_read(req, xendev->sbdf, reg,
-                                            req->size, req->data);
-            } else if (req->dir == IOREQ_WRITE) {
-                trace_cpu_ioreq_config_write(req, xendev->sbdf, reg,
-                                             req->size, req->data);
-                pci_host_config_write_common(
-                    xendev->pci_dev, reg, PCI_CONFIG_SPACE_SIZE,
-                    req->data, req->size);
-            }
-        } else {
-            uint32_t tmp;
-
-            if (req->dir == IOREQ_READ) {
-                tmp = pci_host_config_read_common(
-                    xendev->pci_dev, reg, PCI_CONFIG_SPACE_SIZE,
-                    req->size);
-                trace_cpu_ioreq_config_read(req, xendev->sbdf, reg,
-                                            req->size, tmp);
-                write_phys_req_item(req->data, req, 0, &tmp);
-            } else if (req->dir == IOREQ_WRITE) {
-                read_phys_req_item(req->data, req, 0, &tmp);
-                trace_cpu_ioreq_config_write(req, xendev->sbdf, reg,
-                                             req->size, tmp);
-                pci_host_config_write_common(
-                    xendev->pci_dev, reg, PCI_CONFIG_SPACE_SIZE,
-                    tmp, req->size);
-            }
-        }
-    }
-}
-
 static void regs_to_cpu(vmware_regs_t *vmport_regs, ioreq_t *req)
 {
     X86CPU *cpu;
@@ -996,223 +510,6 @@ static void handle_vmport_ioreq(XenIOState *state, ioreq_t *req)
     current_cpu = NULL;
 }
 
-static void handle_ioreq(XenIOState *state, ioreq_t *req)
-{
-    trace_handle_ioreq(req, req->type, req->dir, req->df, req->data_is_ptr,
-                       req->addr, req->data, req->count, req->size);
-
-    if (!req->data_is_ptr && (req->dir == IOREQ_WRITE) &&
-            (req->size < sizeof (target_ulong))) {
-        req->data &= ((target_ulong) 1 << (8 * req->size)) - 1;
-    }
-
-    if (req->dir == IOREQ_WRITE)
-        trace_handle_ioreq_write(req, req->type, req->df, req->data_is_ptr,
-                                 req->addr, req->data, req->count, req->size);
-
-    switch (req->type) {
-        case IOREQ_TYPE_PIO:
-            cpu_ioreq_pio(req);
-            break;
-        case IOREQ_TYPE_COPY:
-            cpu_ioreq_move(req);
-            break;
-        case IOREQ_TYPE_TIMEOFFSET:
-            break;
-        case IOREQ_TYPE_INVALIDATE:
-            xen_invalidate_map_cache();
-            break;
-        case IOREQ_TYPE_PCI_CONFIG:
-            cpu_ioreq_config(state, req);
-            break;
-        default:
-            arch_handle_ioreq(state, req);
-    }
-    if (req->dir == IOREQ_READ) {
-        trace_handle_ioreq_read(req, req->type, req->df, req->data_is_ptr,
-                                req->addr, req->data, req->count, req->size);
-    }
-}
-
-static bool handle_buffered_iopage(XenIOState *state)
-{
-    buffered_iopage_t *buf_page = state->buffered_io_page;
-    buf_ioreq_t *buf_req = NULL;
-    bool handled_ioreq = false;
-    ioreq_t req;
-    int qw;
-
-    if (!buf_page) {
-        return 0;
-    }
-
-    memset(&req, 0x00, sizeof(req));
-    req.state = STATE_IOREQ_READY;
-    req.count = 1;
-    req.dir = IOREQ_WRITE;
-
-    for (;;) {
-        uint32_t rdptr = buf_page->read_pointer, wrptr;
-
-        xen_rmb();
-        wrptr = buf_page->write_pointer;
-        xen_rmb();
-        if (rdptr != buf_page->read_pointer) {
-            continue;
-        }
-        if (rdptr == wrptr) {
-            break;
-        }
-        buf_req = &buf_page->buf_ioreq[rdptr % IOREQ_BUFFER_SLOT_NUM];
-        req.size = 1U << buf_req->size;
-        req.addr = buf_req->addr;
-        req.data = buf_req->data;
-        req.type = buf_req->type;
-        xen_rmb();
-        qw = (req.size == 8);
-        if (qw) {
-            if (rdptr + 1 == wrptr) {
-                hw_error("Incomplete quad word buffered ioreq");
-            }
-            buf_req = &buf_page->buf_ioreq[(rdptr + 1) %
-                                           IOREQ_BUFFER_SLOT_NUM];
-            req.data |= ((uint64_t)buf_req->data) << 32;
-            xen_rmb();
-        }
-
-        handle_ioreq(state, &req);
-
-        /* Only req.data may get updated by handle_ioreq(), albeit even that
-         * should not happen as such data would never make it to the guest (we
-         * can only usefully see writes here after all).
-         */
-        assert(req.state == STATE_IOREQ_READY);
-        assert(req.count == 1);
-        assert(req.dir == IOREQ_WRITE);
-        assert(!req.data_is_ptr);
-
-        qatomic_add(&buf_page->read_pointer, qw + 1);
-        handled_ioreq = true;
-    }
-
-    return handled_ioreq;
-}
-
-static void handle_buffered_io(void *opaque)
-{
-    XenIOState *state = opaque;
-
-    if (handle_buffered_iopage(state)) {
-        timer_mod(state->buffered_io_timer,
-                BUFFER_IO_MAX_DELAY + qemu_clock_get_ms(QEMU_CLOCK_REALTIME));
-    } else {
-        timer_del(state->buffered_io_timer);
-        xenevtchn_unmask(state->xce_handle, state->bufioreq_local_port);
-    }
-}
-
-static void cpu_handle_ioreq(void *opaque)
-{
-    XenIOState *state = opaque;
-    ioreq_t *req = cpu_get_ioreq(state);
-
-    handle_buffered_iopage(state);
-    if (req) {
-        ioreq_t copy = *req;
-
-        xen_rmb();
-        handle_ioreq(state, &copy);
-        req->data = copy.data;
-
-        if (req->state != STATE_IOREQ_INPROCESS) {
-            fprintf(stderr, "Badness in I/O request ... not in service?!: "
-                    "%x, ptr: %x, port: %"PRIx64", "
-                    "data: %"PRIx64", count: %u, size: %u, type: %u\n",
-                    req->state, req->data_is_ptr, req->addr,
-                    req->data, req->count, req->size, req->type);
-            destroy_hvm_domain(false);
-            return;
-        }
-
-        xen_wmb(); /* Update ioreq contents /then/ update state. */
-
-        /*
-         * We do this before we send the response so that the tools
-         * have the opportunity to pick up on the reset before the
-         * guest resumes and does a hlt with interrupts disabled which
-         * causes Xen to powerdown the domain.
-         */
-        if (runstate_is_running()) {
-            ShutdownCause request;
-
-            if (qemu_shutdown_requested_get()) {
-                destroy_hvm_domain(false);
-            }
-            request = qemu_reset_requested_get();
-            if (request) {
-                qemu_system_reset(request);
-                destroy_hvm_domain(true);
-            }
-        }
-
-        req->state = STATE_IORESP_READY;
-        xenevtchn_notify(state->xce_handle,
-                         state->ioreq_local_port[state->send_vcpu]);
-    }
-}
-
-static void xen_main_loop_prepare(XenIOState *state)
-{
-    int evtchn_fd = -1;
-
-    if (state->xce_handle != NULL) {
-        evtchn_fd = xenevtchn_fd(state->xce_handle);
-    }
-
-    state->buffered_io_timer = timer_new_ms(QEMU_CLOCK_REALTIME, handle_buffered_io,
-                                                 state);
-
-    if (evtchn_fd != -1) {
-        CPUState *cpu_state;
-
-        DPRINTF("%s: Init cpu_by_vcpu_id\n", __func__);
-        CPU_FOREACH(cpu_state) {
-            DPRINTF("%s: cpu_by_vcpu_id[%d]=%p\n",
-                    __func__, cpu_state->cpu_index, cpu_state);
-            state->cpu_by_vcpu_id[cpu_state->cpu_index] = cpu_state;
-        }
-        qemu_set_fd_handler(evtchn_fd, cpu_handle_ioreq, NULL, state);
-    }
-}
-
-
-static void xen_hvm_change_state_handler(void *opaque, bool running,
-                                         RunState rstate)
-{
-    XenIOState *state = opaque;
-
-    if (running) {
-        xen_main_loop_prepare(state);
-    }
-
-    xen_set_ioreq_server_state(xen_domid,
-                               state->ioservid,
-                               (rstate == RUN_STATE_RUNNING));
-}
-
-static void xen_exit_notifier(Notifier *n, void *data)
-{
-    XenIOState *state = container_of(n, XenIOState, exit);
-
-    xen_destroy_ioreq_server(xen_domid, state->ioservid);
-    if (state->fres != NULL) {
-        xenforeignmemory_unmap_resource(xen_fmem, state->fres);
-    }
-
-    xenevtchn_close(state->xce_handle);
-    xs_daemon_close(state->xenstore);
-}
-
 #ifdef XEN_COMPAT_PHYSMAP
 static void xen_read_physmap(XenIOState *state)
 {
@@ -1272,178 +569,17 @@ static void xen_wakeup_notifier(Notifier *notifier, void *data)
     xc_set_hvm_param(xen_xc, xen_domid, HVM_PARAM_ACPI_S_STATE, 0);
 }
 
-static int xen_map_ioreq_server(XenIOState *state)
-{
-    void *addr = NULL;
-    xen_pfn_t ioreq_pfn;
-    xen_pfn_t bufioreq_pfn;
-    evtchn_port_t bufioreq_evtchn;
-    int rc;
-
-    /*
-     * Attempt to map using the resource API and fall back to normal
-     * foreign mapping if this is not supported.
-     */
-    QEMU_BUILD_BUG_ON(XENMEM_resource_ioreq_server_frame_bufioreq != 0);
-    QEMU_BUILD_BUG_ON(XENMEM_resource_ioreq_server_frame_ioreq(0) != 1);
-    state->fres = xenforeignmemory_map_resource(xen_fmem, xen_domid,
-                                         XENMEM_resource_ioreq_server,
-                                         state->ioservid, 0, 2,
-                                         &addr,
-                                         PROT_READ | PROT_WRITE, 0);
-    if (state->fres != NULL) {
-        trace_xen_map_resource_ioreq(state->ioservid, addr);
-        state->buffered_io_page = addr;
-        state->shared_page = addr + TARGET_PAGE_SIZE;
-    } else if (errno != EOPNOTSUPP) {
-        error_report("failed to map ioreq server resources: error %d handle=%p",
-                     errno, xen_xc);
-        return -1;
-    }
-
-    rc = xen_get_ioreq_server_info(xen_domid, state->ioservid,
-                                   (state->shared_page == NULL) ?
-                                   &ioreq_pfn : NULL,
-                                   (state->buffered_io_page == NULL) ?
-                                   &bufioreq_pfn : NULL,
-                                   &bufioreq_evtchn);
-    if (rc < 0) {
-        error_report("failed to get ioreq server info: error %d handle=%p",
-                     errno, xen_xc);
-        return rc;
-    }
-
-    if (state->shared_page == NULL) {
-        DPRINTF("shared page at pfn %lx\n", ioreq_pfn);
-
-        state->shared_page = xenforeignmemory_map(xen_fmem, xen_domid,
-                                                  PROT_READ | PROT_WRITE,
-                                                  1, &ioreq_pfn, NULL);
-        if (state->shared_page == NULL) {
-            error_report("map shared IO page returned error %d handle=%p",
-                         errno, xen_xc);
-        }
-    }
-
-    if (state->buffered_io_page == NULL) {
-        DPRINTF("buffered io page at pfn %lx\n", bufioreq_pfn);
-
-        state->buffered_io_page = xenforeignmemory_map(xen_fmem, xen_domid,
-                                                       PROT_READ | PROT_WRITE,
-                                                       1, &bufioreq_pfn,
-                                                       NULL);
-        if (state->buffered_io_page == NULL) {
-            error_report("map buffered IO page returned error %d", errno);
-            return -1;
-        }
-    }
-
-    if (state->shared_page == NULL || state->buffered_io_page == NULL) {
-        return -1;
-    }
-
-    DPRINTF("buffered io evtchn is %x\n", bufioreq_evtchn);
-
-    state->bufioreq_remote_port = bufioreq_evtchn;
-
-    return 0;
-}
-
 void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory)
 {
     MachineState *ms = MACHINE(pcms);
     unsigned int max_cpus = ms->smp.max_cpus;
-    int i, rc;
+    int rc;
     xen_pfn_t ioreq_pfn;
     XenIOState *state;
 
     state = g_new0(XenIOState, 1);
 
-    state->xce_handle = xenevtchn_open(NULL, 0);
-    if (state->xce_handle == NULL) {
-        perror("xen: event channel open");
-        goto err;
-    }
-
-    state->xenstore = xs_daemon_open();
-    if (state->xenstore == NULL) {
-        perror("xen: xenstore open");
-        goto err;
-    }
-
-    xen_create_ioreq_server(xen_domid, &state->ioservid);
-
-    state->exit.notify = xen_exit_notifier;
-    qemu_add_exit_notifier(&state->exit);
-
-    /*
-     * Register wake-up support in QMP query-current-machine API
-     */
-    qemu_register_wakeup_support();
-
-    rc = xen_map_ioreq_server(state);
-    if (rc < 0) {
-        goto err;
-    }
-
-    /* Note: cpus is empty at this point in init */
-    state->cpu_by_vcpu_id = g_new0(CPUState *, max_cpus);
-
-    rc = xen_set_ioreq_server_state(xen_domid, state->ioservid, true);
-    if (rc < 0) {
-        error_report("failed to enable ioreq server info: error %d handle=%p",
-                     errno, xen_xc);
-        goto err;
-    }
-
-    state->ioreq_local_port = g_new0(evtchn_port_t, max_cpus);
-
-    /* FIXME: how about if we overflow the page here? */
-    for (i = 0; i < max_cpus; i++) {
-        rc = xenevtchn_bind_interdomain(state->xce_handle, xen_domid,
-                                        xen_vcpu_eport(state->shared_page, i));
-        if (rc == -1) {
-            error_report("shared evtchn %d bind error %d", i, errno);
-            goto err;
-        }
-        state->ioreq_local_port[i] = rc;
-    }
-
-    rc = xenevtchn_bind_interdomain(state->xce_handle, xen_domid,
-                                    state->bufioreq_remote_port);
-    if (rc == -1) {
-        error_report("buffered evtchn bind error %d", errno);
-        goto err;
-    }
-    state->bufioreq_local_port = rc;
-
-    /* Init RAM management */
-#ifdef XEN_COMPAT_PHYSMAP
-    xen_map_cache_init(xen_phys_offset_to_gaddr, state);
-#else
-    xen_map_cache_init(NULL, state);
-#endif
-
-    qemu_add_vm_change_state_handler(xen_hvm_change_state_handler, state);
-
-    state->memory_listener = xen_memory_listener;
-    memory_listener_register(&state->memory_listener, &address_space_memory);
-
-    state->io_listener = xen_io_listener;
-    memory_listener_register(&state->io_listener, &address_space_io);
-
-    state->device_listener = xen_device_listener;
-    QLIST_INIT(&state->dev_list);
-    device_listener_register(&state->device_listener);
-
-    xen_bus_init();
-
-    /* Initialize backend core & drivers */
-    if (xen_be_init() != 0) {
-        error_report("xen backend core setup failed");
-        goto err;
-    }
-    xen_be_register_common();
+    xen_register_ioreq(state, max_cpus, xen_memory_listener);
 
     QLIST_INIT(&xen_physmap);
     xen_read_physmap(state);
@@ -1483,59 +619,11 @@ err:
     exit(1);
 }
 
-void destroy_hvm_domain(bool reboot)
-{
-    xc_interface *xc_handle;
-    int sts;
-    int rc;
-
-    unsigned int reason = reboot ? SHUTDOWN_reboot : SHUTDOWN_poweroff;
-
-    if (xen_dmod) {
-        rc = xendevicemodel_shutdown(xen_dmod, xen_domid, reason);
-        if (!rc) {
-            return;
-        }
-        if (errno != ENOTTY /* old Xen */) {
-            perror("xendevicemodel_shutdown failed");
-        }
-        /* well, try the old thing then */
-    }
-
-    xc_handle = xc_interface_open(0, 0, 0);
-    if (xc_handle == NULL) {
-        fprintf(stderr, "Cannot acquire xenctrl handle\n");
-    } else {
-        sts = xc_domain_shutdown(xc_handle, xen_domid, reason);
-        if (sts != 0) {
-            fprintf(stderr, "xc_domain_shutdown failed to issue %s, "
-                    "sts %d, %s\n", reboot ? "reboot" : "poweroff",
-                    sts, strerror(errno));
-        } else {
-            fprintf(stderr, "Issued domain %d %s\n", xen_domid,
-                    reboot ? "reboot" : "poweroff");
-        }
-        xc_interface_close(xc_handle);
-    }
-}
-
 void xen_register_framebuffer(MemoryRegion *mr)
 {
     framebuffer = mr;
 }
 
-void xen_shutdown_fatal_error(const char *fmt, ...)
-{
-    va_list ap;
-
-    va_start(ap, fmt);
-    vfprintf(stderr, fmt, ap);
-    va_end(ap);
-    fprintf(stderr, "Will destroy the domain.\n");
-    /* destroy the domain */
-    qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_ERROR);
-}
-
 void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
 {
     if (unlikely(xen_in_migration)) {
diff --git a/hw/xen/meson.build b/hw/xen/meson.build
index 19d0637c46..008e036d63 100644
--- a/hw/xen/meson.build
+++ b/hw/xen/meson.build
@@ -25,4 +25,7 @@ specific_ss.add_all(when: ['CONFIG_XEN', xen], if_true: xen_specific_ss)
 
 xen_ss = ss.source_set()
 
-xen_ss.add(when: 'CONFIG_XEN', if_true: files('xen-mapcache.c'))
+xen_ss.add(when: 'CONFIG_XEN', if_true: files(
+  'xen-mapcache.c',
+  'xen-hvm-common.c',
+))
diff --git a/hw/xen/trace-events b/hw/xen/trace-events
index 2c8f238f42..02ca1183da 100644
--- a/hw/xen/trace-events
+++ b/hw/xen/trace-events
@@ -42,6 +42,20 @@ xs_node_vscanf(char *path, char *value) "%s %s"
 xs_node_watch(char *path) "%s"
 xs_node_unwatch(char *path) "%s"
 
+# xen-hvm.c
+xen_ram_alloc(unsigned long ram_addr, unsigned long size) "requested: 0x%lx, size 0x%lx"
+xen_client_set_memory(uint64_t start_addr, unsigned long size, bool log_dirty) "0x%"PRIx64" size 0x%lx, log_dirty %i"
+handle_ioreq(void *req, uint32_t type, uint32_t dir, uint32_t df, uint32_t data_is_ptr, uint64_t addr, uint64_t data, uint32_t count, uint32_t size) "I/O=%p type=%d dir=%d df=%d ptr=%d port=0x%"PRIx64" data=0x%"PRIx64" count=%d size=%d"
+handle_ioreq_read(void *req, uint32_t type, uint32_t df, uint32_t data_is_ptr, uint64_t addr, uint64_t data, uint32_t count, uint32_t size) "I/O=%p read type=%d df=%d ptr=%d port=0x%"PRIx64" data=0x%"PRIx64" count=%d size=%d"
+handle_ioreq_write(void *req, uint32_t type, uint32_t df, uint32_t data_is_ptr, uint64_t addr, uint64_t data, uint32_t count, uint32_t size) "I/O=%p write type=%d df=%d ptr=%d port=0x%"PRIx64" data=0x%"PRIx64" count=%d size=%d"
+cpu_ioreq_pio(void *req, uint32_t dir, uint32_t df, uint32_t data_is_ptr, uint64_t addr, uint64_t data, uint32_t count, uint32_t size) "I/O=%p pio dir=%d df=%d ptr=%d port=0x%"PRIx64" data=0x%"PRIx64" count=%d size=%d"
+cpu_ioreq_pio_read_reg(void *req, uint64_t data, uint64_t addr, uint32_t size) "I/O=%p pio read reg data=0x%"PRIx64" port=0x%"PRIx64" size=%d"
+cpu_ioreq_pio_write_reg(void *req, uint64_t data, uint64_t addr, uint32_t size) "I/O=%p pio write reg data=0x%"PRIx64" port=0x%"PRIx64" size=%d"
+cpu_ioreq_move(void *req, uint32_t dir, uint32_t df, uint32_t data_is_ptr, uint64_t addr, uint64_t data, uint32_t count, uint32_t size) "I/O=%p copy dir=%d df=%d ptr=%d port=0x%"PRIx64" data=0x%"PRIx64" count=%d size=%d"
+xen_map_resource_ioreq(uint32_t id, void *addr) "id: %u addr: %p"
+cpu_ioreq_config_read(void *req, uint32_t sbdf, uint32_t reg, uint32_t size, uint32_t data) "I/O=%p sbdf=0x%x reg=%u size=%u data=0x%x"
+cpu_ioreq_config_write(void *req, uint32_t sbdf, uint32_t reg, uint32_t size, uint32_t data) "I/O=%p sbdf=0x%x reg=%u size=%u data=0x%x"
+
 # xen-mapcache.c
 xen_map_cache(uint64_t phys_addr) "want 0x%"PRIx64
 xen_remap_bucket(uint64_t index) "index 0x%"PRIx64
diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
new file mode 100644
index 0000000000..f848f9e625
--- /dev/null
+++ b/hw/xen/xen-hvm-common.c
@@ -0,0 +1,858 @@
+#include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "qapi/error.h"
+#include "trace.h"
+
+#include "hw/pci/pci_host.h"
+#include "hw/xen/xen-hvm-common.h"
+#include "hw/xen/xen-legacy-backend.h"
+#include "hw/xen/xen-bus.h"
+#include "hw/boards.h"
+#include "hw/xen/arch_hvm.h"
+
+MemoryRegion ram_memory;
+
+void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
+                   Error **errp)
+{
+    unsigned long nr_pfn;
+    xen_pfn_t *pfn_list;
+    int i;
+
+    if (runstate_check(RUN_STATE_INMIGRATE)) {
+        /* RAM already populated in Xen */
+        fprintf(stderr, "%s: do not alloc "RAM_ADDR_FMT
+                " bytes of ram at "RAM_ADDR_FMT" when runstate is INMIGRATE\n",
+                __func__, size, ram_addr);
+        return;
+    }
+
+    if (mr == &ram_memory) {
+        return;
+    }
+
+    trace_xen_ram_alloc(ram_addr, size);
+
+    nr_pfn = size >> TARGET_PAGE_BITS;
+    pfn_list = g_malloc(sizeof (*pfn_list) * nr_pfn);
+
+    for (i = 0; i < nr_pfn; i++) {
+        pfn_list[i] = (ram_addr >> TARGET_PAGE_BITS) + i;
+    }
+
+    if (xc_domain_populate_physmap_exact(xen_xc, xen_domid, nr_pfn, 0, 0, pfn_list)) {
+        error_setg(errp, "xen: failed to populate ram at " RAM_ADDR_FMT,
+                   ram_addr);
+    }
+
+    g_free(pfn_list);
+}
+
+
+static void xen_set_memory(struct MemoryListener *listener,
+                           MemoryRegionSection *section,
+                           bool add)
+{
+    XenIOState *state = container_of(listener, XenIOState, memory_listener);
+
+    if (section->mr == &ram_memory) {
+        return;
+    } else {
+        if (add) {
+            xen_map_memory_section(xen_domid, state->ioservid,
+                                   section);
+        } else {
+            xen_unmap_memory_section(xen_domid, state->ioservid,
+                                     section);
+        }
+    }
+    arch_xen_set_memory(state, section, add);
+}
+
+void xen_region_add(MemoryListener *listener,
+                           MemoryRegionSection *section)
+{
+    memory_region_ref(section->mr);
+    xen_set_memory(listener, section, true);
+}
+
+void xen_region_del(MemoryListener *listener,
+                           MemoryRegionSection *section)
+{
+    xen_set_memory(listener, section, false);
+    memory_region_unref(section->mr);
+}
+
+void xen_io_add(MemoryListener *listener,
+                       MemoryRegionSection *section)
+{
+    XenIOState *state = container_of(listener, XenIOState, io_listener);
+    MemoryRegion *mr = section->mr;
+
+    if (mr->ops == &unassigned_io_ops) {
+        return;
+    }
+
+    memory_region_ref(mr);
+
+    xen_map_io_section(xen_domid, state->ioservid, section);
+}
+
+void xen_io_del(MemoryListener *listener,
+                       MemoryRegionSection *section)
+{
+    XenIOState *state = container_of(listener, XenIOState, io_listener);
+    MemoryRegion *mr = section->mr;
+
+    if (mr->ops == &unassigned_io_ops) {
+        return;
+    }
+
+    xen_unmap_io_section(xen_domid, state->ioservid, section);
+
+    memory_region_unref(mr);
+}
+
+void xen_device_realize(DeviceListener *listener,
+                               DeviceState *dev)
+{
+    XenIOState *state = container_of(listener, XenIOState, device_listener);
+
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        PCIDevice *pci_dev = PCI_DEVICE(dev);
+        XenPciDevice *xendev = g_new(XenPciDevice, 1);
+
+        xendev->pci_dev = pci_dev;
+        xendev->sbdf = PCI_BUILD_BDF(pci_dev_bus_num(pci_dev),
+                                     pci_dev->devfn);
+        QLIST_INSERT_HEAD(&state->dev_list, xendev, entry);
+
+        xen_map_pcidev(xen_domid, state->ioservid, pci_dev);
+    }
+}
+
+void xen_device_unrealize(DeviceListener *listener,
+                                 DeviceState *dev)
+{
+    XenIOState *state = container_of(listener, XenIOState, device_listener);
+
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        PCIDevice *pci_dev = PCI_DEVICE(dev);
+        XenPciDevice *xendev, *next;
+
+        xen_unmap_pcidev(xen_domid, state->ioservid, pci_dev);
+
+        QLIST_FOREACH_SAFE(xendev, &state->dev_list, entry, next) {
+            if (xendev->pci_dev == pci_dev) {
+                QLIST_REMOVE(xendev, entry);
+                g_free(xendev);
+                break;
+            }
+        }
+    }
+}
+
+MemoryListener xen_io_listener = {
+    .region_add = xen_io_add,
+    .region_del = xen_io_del,
+    .priority = 10,
+};
+
+DeviceListener xen_device_listener = {
+    .realize = xen_device_realize,
+    .unrealize = xen_device_unrealize,
+};
+
+/* get the ioreq packets from share mem */
+static ioreq_t *cpu_get_ioreq_from_shared_memory(XenIOState *state, int vcpu)
+{
+    ioreq_t *req = xen_vcpu_ioreq(state->shared_page, vcpu);
+
+    if (req->state != STATE_IOREQ_READY) {
+        DPRINTF("I/O request not ready: "
+                "%x, ptr: %x, port: %"PRIx64", "
+                "data: %"PRIx64", count: %u, size: %u\n",
+                req->state, req->data_is_ptr, req->addr,
+                req->data, req->count, req->size);
+        return NULL;
+    }
+
+    xen_rmb(); /* see IOREQ_READY /then/ read contents of ioreq */
+
+    req->state = STATE_IOREQ_INPROCESS;
+    return req;
+}
+
+/* use poll to get the port notification */
+/* ioreq_vec--out,the */
+/* retval--the number of ioreq packet */
+static ioreq_t *cpu_get_ioreq(XenIOState *state)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+    unsigned int max_cpus = ms->smp.max_cpus;
+    int i;
+    evtchn_port_t port;
+
+    port = xenevtchn_pending(state->xce_handle);
+    if (port == state->bufioreq_local_port) {
+        timer_mod(state->buffered_io_timer,
+                BUFFER_IO_MAX_DELAY + qemu_clock_get_ms(QEMU_CLOCK_REALTIME));
+        return NULL;
+    }
+
+    if (port != -1) {
+        for (i = 0; i < max_cpus; i++) {
+            if (state->ioreq_local_port[i] == port) {
+                break;
+            }
+        }
+
+        if (i == max_cpus) {
+            hw_error("Fatal error while trying to get io event!\n");
+        }
+
+        /* unmask the wanted port again */
+        xenevtchn_unmask(state->xce_handle, port);
+
+        /* get the io packet from shared memory */
+        state->send_vcpu = i;
+        return cpu_get_ioreq_from_shared_memory(state, i);
+    }
+
+    /* read error or read nothing */
+    return NULL;
+}
+
+static uint32_t do_inp(uint32_t addr, unsigned long size)
+{
+    switch (size) {
+        case 1:
+            return cpu_inb(addr);
+        case 2:
+            return cpu_inw(addr);
+        case 4:
+            return cpu_inl(addr);
+        default:
+            hw_error("inp: bad size: %04x %lx", addr, size);
+    }
+}
+
+static void do_outp(uint32_t addr,
+        unsigned long size, uint32_t val)
+{
+    switch (size) {
+        case 1:
+            return cpu_outb(addr, val);
+        case 2:
+            return cpu_outw(addr, val);
+        case 4:
+            return cpu_outl(addr, val);
+        default:
+            hw_error("outp: bad size: %04x %lx", addr, size);
+    }
+}
+
+/*
+ * Helper functions which read/write an object from/to physical guest
+ * memory, as part of the implementation of an ioreq.
+ *
+ * Equivalent to
+ *   cpu_physical_memory_rw(addr + (req->df ? -1 : +1) * req->size * i,
+ *                          val, req->size, 0/1)
+ * except without the integer overflow problems.
+ */
+static void rw_phys_req_item(hwaddr addr,
+                             ioreq_t *req, uint32_t i, void *val, int rw)
+{
+    /* Do everything unsigned so overflow just results in a truncated result
+     * and accesses to undesired parts of guest memory, which is up
+     * to the guest */
+    hwaddr offset = (hwaddr)req->size * i;
+    if (req->df) {
+        addr -= offset;
+    } else {
+        addr += offset;
+    }
+    cpu_physical_memory_rw(addr, val, req->size, rw);
+}
+
+static inline void read_phys_req_item(hwaddr addr,
+                                      ioreq_t *req, uint32_t i, void *val)
+{
+    rw_phys_req_item(addr, req, i, val, 0);
+}
+static inline void write_phys_req_item(hwaddr addr,
+                                       ioreq_t *req, uint32_t i, void *val)
+{
+    rw_phys_req_item(addr, req, i, val, 1);
+}
+
+
+void cpu_ioreq_pio(ioreq_t *req)
+{
+    uint32_t i;
+
+    trace_cpu_ioreq_pio(req, req->dir, req->df, req->data_is_ptr, req->addr,
+                         req->data, req->count, req->size);
+
+    if (req->size > sizeof(uint32_t)) {
+        hw_error("PIO: bad size (%u)", req->size);
+    }
+
+    if (req->dir == IOREQ_READ) {
+        if (!req->data_is_ptr) {
+            req->data = do_inp(req->addr, req->size);
+            trace_cpu_ioreq_pio_read_reg(req, req->data, req->addr,
+                                         req->size);
+        } else {
+            uint32_t tmp;
+
+            for (i = 0; i < req->count; i++) {
+                tmp = do_inp(req->addr, req->size);
+                write_phys_req_item(req->data, req, i, &tmp);
+            }
+        }
+    } else if (req->dir == IOREQ_WRITE) {
+        if (!req->data_is_ptr) {
+            trace_cpu_ioreq_pio_write_reg(req, req->data, req->addr,
+                                          req->size);
+            do_outp(req->addr, req->size, req->data);
+        } else {
+            for (i = 0; i < req->count; i++) {
+                uint32_t tmp = 0;
+
+                read_phys_req_item(req->data, req, i, &tmp);
+                do_outp(req->addr, req->size, tmp);
+            }
+        }
+    }
+}
+
+static void cpu_ioreq_move(ioreq_t *req)
+{
+    uint32_t i;
+
+    trace_cpu_ioreq_move(req, req->dir, req->df, req->data_is_ptr, req->addr,
+                         req->data, req->count, req->size);
+
+    if (req->size > sizeof(req->data)) {
+        hw_error("MMIO: bad size (%u)", req->size);
+    }
+
+    if (!req->data_is_ptr) {
+        if (req->dir == IOREQ_READ) {
+            for (i = 0; i < req->count; i++) {
+                read_phys_req_item(req->addr, req, i, &req->data);
+            }
+        } else if (req->dir == IOREQ_WRITE) {
+            for (i = 0; i < req->count; i++) {
+                write_phys_req_item(req->addr, req, i, &req->data);
+            }
+        }
+    } else {
+        uint64_t tmp;
+
+        if (req->dir == IOREQ_READ) {
+            for (i = 0; i < req->count; i++) {
+                read_phys_req_item(req->addr, req, i, &tmp);
+                write_phys_req_item(req->data, req, i, &tmp);
+            }
+        } else if (req->dir == IOREQ_WRITE) {
+            for (i = 0; i < req->count; i++) {
+                read_phys_req_item(req->data, req, i, &tmp);
+                write_phys_req_item(req->addr, req, i, &tmp);
+            }
+        }
+    }
+}
+
+static void cpu_ioreq_config(XenIOState *state, ioreq_t *req)
+{
+    uint32_t sbdf = req->addr >> 32;
+    uint32_t reg = req->addr;
+    XenPciDevice *xendev;
+
+    if (req->size != sizeof(uint8_t) && req->size != sizeof(uint16_t) &&
+        req->size != sizeof(uint32_t)) {
+        hw_error("PCI config access: bad size (%u)", req->size);
+    }
+
+    if (req->count != 1) {
+        hw_error("PCI config access: bad count (%u)", req->count);
+    }
+
+    QLIST_FOREACH(xendev, &state->dev_list, entry) {
+        if (xendev->sbdf != sbdf) {
+            continue;
+        }
+
+        if (!req->data_is_ptr) {
+            if (req->dir == IOREQ_READ) {
+                req->data = pci_host_config_read_common(
+                    xendev->pci_dev, reg, PCI_CONFIG_SPACE_SIZE,
+                    req->size);
+                trace_cpu_ioreq_config_read(req, xendev->sbdf, reg,
+                                            req->size, req->data);
+            } else if (req->dir == IOREQ_WRITE) {
+                trace_cpu_ioreq_config_write(req, xendev->sbdf, reg,
+                                             req->size, req->data);
+                pci_host_config_write_common(
+                    xendev->pci_dev, reg, PCI_CONFIG_SPACE_SIZE,
+                    req->data, req->size);
+            }
+        } else {
+            uint32_t tmp;
+
+            if (req->dir == IOREQ_READ) {
+                tmp = pci_host_config_read_common(
+                    xendev->pci_dev, reg, PCI_CONFIG_SPACE_SIZE,
+                    req->size);
+                trace_cpu_ioreq_config_read(req, xendev->sbdf, reg,
+                                            req->size, tmp);
+                write_phys_req_item(req->data, req, 0, &tmp);
+            } else if (req->dir == IOREQ_WRITE) {
+                read_phys_req_item(req->data, req, 0, &tmp);
+                trace_cpu_ioreq_config_write(req, xendev->sbdf, reg,
+                                             req->size, tmp);
+                pci_host_config_write_common(
+                    xendev->pci_dev, reg, PCI_CONFIG_SPACE_SIZE,
+                    tmp, req->size);
+            }
+        }
+    }
+}
+
+static void handle_ioreq(XenIOState *state, ioreq_t *req)
+{
+    trace_handle_ioreq(req, req->type, req->dir, req->df, req->data_is_ptr,
+                       req->addr, req->data, req->count, req->size);
+
+    if (!req->data_is_ptr && (req->dir == IOREQ_WRITE) &&
+            (req->size < sizeof (target_ulong))) {
+        req->data &= ((target_ulong) 1 << (8 * req->size)) - 1;
+    }
+
+    if (req->dir == IOREQ_WRITE)
+        trace_handle_ioreq_write(req, req->type, req->df, req->data_is_ptr,
+                                 req->addr, req->data, req->count, req->size);
+
+    switch (req->type) {
+        case IOREQ_TYPE_PIO:
+            cpu_ioreq_pio(req);
+            break;
+        case IOREQ_TYPE_COPY:
+            cpu_ioreq_move(req);
+            break;
+        case IOREQ_TYPE_TIMEOFFSET:
+            break;
+        case IOREQ_TYPE_INVALIDATE:
+            xen_invalidate_map_cache();
+            break;
+        case IOREQ_TYPE_PCI_CONFIG:
+            cpu_ioreq_config(state, req);
+            break;
+        default:
+            arch_handle_ioreq(state, req);
+    }
+    if (req->dir == IOREQ_READ) {
+        trace_handle_ioreq_read(req, req->type, req->df, req->data_is_ptr,
+                                req->addr, req->data, req->count, req->size);
+    }
+}
+
+static int handle_buffered_iopage(XenIOState *state)
+{
+    buffered_iopage_t *buf_page = state->buffered_io_page;
+    buf_ioreq_t *buf_req = NULL;
+    ioreq_t req;
+    int qw;
+
+    if (!buf_page) {
+        return 0;
+    }
+
+    memset(&req, 0x00, sizeof(req));
+    req.state = STATE_IOREQ_READY;
+    req.count = 1;
+    req.dir = IOREQ_WRITE;
+
+    for (;;) {
+        uint32_t rdptr = buf_page->read_pointer, wrptr;
+
+        xen_rmb();
+        wrptr = buf_page->write_pointer;
+        xen_rmb();
+        if (rdptr != buf_page->read_pointer) {
+            continue;
+        }
+        if (rdptr == wrptr) {
+            break;
+        }
+        buf_req = &buf_page->buf_ioreq[rdptr % IOREQ_BUFFER_SLOT_NUM];
+        req.size = 1U << buf_req->size;
+        req.addr = buf_req->addr;
+        req.data = buf_req->data;
+        req.type = buf_req->type;
+        xen_rmb();
+        qw = (req.size == 8);
+        if (qw) {
+            if (rdptr + 1 == wrptr) {
+                hw_error("Incomplete quad word buffered ioreq");
+            }
+            buf_req = &buf_page->buf_ioreq[(rdptr + 1) %
+                                           IOREQ_BUFFER_SLOT_NUM];
+            req.data |= ((uint64_t)buf_req->data) << 32;
+            xen_rmb();
+        }
+
+        handle_ioreq(state, &req);
+
+        /* Only req.data may get updated by handle_ioreq(), albeit even that
+         * should not happen as such data would never make it to the guest (we
+         * can only usefully see writes here after all).
+         */
+        assert(req.state == STATE_IOREQ_READY);
+        assert(req.count == 1);
+        assert(req.dir == IOREQ_WRITE);
+        assert(!req.data_is_ptr);
+
+        qatomic_add(&buf_page->read_pointer, qw + 1);
+    }
+
+    return req.count;
+}
+
+static void handle_buffered_io(void *opaque)
+{
+    XenIOState *state = opaque;
+
+    if (handle_buffered_iopage(state)) {
+        timer_mod(state->buffered_io_timer,
+                BUFFER_IO_MAX_DELAY + qemu_clock_get_ms(QEMU_CLOCK_REALTIME));
+    } else {
+        timer_del(state->buffered_io_timer);
+        xenevtchn_unmask(state->xce_handle, state->bufioreq_local_port);
+    }
+}
+
+static void cpu_handle_ioreq(void *opaque)
+{
+    XenIOState *state = opaque;
+    ioreq_t *req = cpu_get_ioreq(state);
+
+    handle_buffered_iopage(state);
+    if (req) {
+        ioreq_t copy = *req;
+
+        xen_rmb();
+        handle_ioreq(state, &copy);
+        req->data = copy.data;
+
+        if (req->state != STATE_IOREQ_INPROCESS) {
+            fprintf(stderr, "Badness in I/O request ... not in service?!: "
+                    "%x, ptr: %x, port: %"PRIx64", "
+                    "data: %"PRIx64", count: %u, size: %u, type: %u\n",
+                    req->state, req->data_is_ptr, req->addr,
+                    req->data, req->count, req->size, req->type);
+            destroy_hvm_domain(false);
+            return;
+        }
+
+        xen_wmb(); /* Update ioreq contents /then/ update state. */
+
+        /*
+         * We do this before we send the response so that the tools
+         * have the opportunity to pick up on the reset before the
+         * guest resumes and does a hlt with interrupts disabled which
+         * causes Xen to powerdown the domain.
+         */
+        if (runstate_is_running()) {
+            ShutdownCause request;
+
+            if (qemu_shutdown_requested_get()) {
+                destroy_hvm_domain(false);
+            }
+            request = qemu_reset_requested_get();
+            if (request) {
+                qemu_system_reset(request);
+                destroy_hvm_domain(true);
+            }
+        }
+
+        req->state = STATE_IORESP_READY;
+        xenevtchn_notify(state->xce_handle,
+                         state->ioreq_local_port[state->send_vcpu]);
+    }
+}
+
+static void xen_main_loop_prepare(XenIOState *state)
+{
+    int evtchn_fd = -1;
+
+    if (state->xce_handle != NULL) {
+        evtchn_fd = xenevtchn_fd(state->xce_handle);
+    }
+
+    state->buffered_io_timer = timer_new_ms(QEMU_CLOCK_REALTIME, handle_buffered_io,
+                                                 state);
+
+    if (evtchn_fd != -1) {
+        CPUState *cpu_state;
+
+        DPRINTF("%s: Init cpu_by_vcpu_id\n", __func__);
+        CPU_FOREACH(cpu_state) {
+            DPRINTF("%s: cpu_by_vcpu_id[%d]=%p\n",
+                    __func__, cpu_state->cpu_index, cpu_state);
+            state->cpu_by_vcpu_id[cpu_state->cpu_index] = cpu_state;
+        }
+        qemu_set_fd_handler(evtchn_fd, cpu_handle_ioreq, NULL, state);
+    }
+}
+
+
+void xen_hvm_change_state_handler(void *opaque, bool running,
+                                         RunState rstate)
+{
+    XenIOState *state = opaque;
+
+    if (running) {
+        xen_main_loop_prepare(state);
+    }
+
+    xen_set_ioreq_server_state(xen_domid,
+                               state->ioservid,
+                               (rstate == RUN_STATE_RUNNING));
+}
+
+void xen_exit_notifier(Notifier *n, void *data)
+{
+    XenIOState *state = container_of(n, XenIOState, exit);
+
+    xen_destroy_ioreq_server(xen_domid, state->ioservid);
+
+    xenevtchn_close(state->xce_handle);
+    xs_daemon_close(state->xenstore);
+}
+
+static int xen_map_ioreq_server(XenIOState *state)
+{
+    void *addr = NULL;
+    xenforeignmemory_resource_handle *fres;
+    xen_pfn_t ioreq_pfn;
+    xen_pfn_t bufioreq_pfn;
+    evtchn_port_t bufioreq_evtchn;
+    int rc;
+
+    /*
+     * Attempt to map using the resource API and fall back to normal
+     * foreign mapping if this is not supported.
+     */
+    QEMU_BUILD_BUG_ON(XENMEM_resource_ioreq_server_frame_bufioreq != 0);
+    QEMU_BUILD_BUG_ON(XENMEM_resource_ioreq_server_frame_ioreq(0) != 1);
+    fres = xenforeignmemory_map_resource(xen_fmem, xen_domid,
+                                         XENMEM_resource_ioreq_server,
+                                         state->ioservid, 0, 2,
+                                         &addr,
+                                         PROT_READ | PROT_WRITE, 0);
+    if (fres != NULL) {
+        trace_xen_map_resource_ioreq(state->ioservid, addr);
+        state->buffered_io_page = addr;
+        state->shared_page = addr + TARGET_PAGE_SIZE;
+    } else if (errno != EOPNOTSUPP) {
+        error_report("failed to map ioreq server resources: error %d handle=%p",
+                     errno, xen_xc);
+        return -1;
+    }
+
+    rc = xen_get_ioreq_server_info(xen_domid, state->ioservid,
+                                   (state->shared_page == NULL) ?
+                                   &ioreq_pfn : NULL,
+                                   (state->buffered_io_page == NULL) ?
+                                   &bufioreq_pfn : NULL,
+                                   &bufioreq_evtchn);
+    if (rc < 0) {
+        error_report("failed to get ioreq server info: error %d handle=%p",
+                     errno, xen_xc);
+        return rc;
+    }
+
+    if (state->shared_page == NULL) {
+        DPRINTF("shared page at pfn %lx\n", ioreq_pfn);
+
+        state->shared_page = xenforeignmemory_map(xen_fmem, xen_domid,
+                                                  PROT_READ | PROT_WRITE,
+                                                  1, &ioreq_pfn, NULL);
+        if (state->shared_page == NULL) {
+            error_report("map shared IO page returned error %d handle=%p",
+                         errno, xen_xc);
+        }
+    }
+
+    if (state->buffered_io_page == NULL) {
+        DPRINTF("buffered io page at pfn %lx\n", bufioreq_pfn);
+
+        state->buffered_io_page = xenforeignmemory_map(xen_fmem, xen_domid,
+                                                       PROT_READ | PROT_WRITE,
+                                                       1, &bufioreq_pfn,
+                                                       NULL);
+        if (state->buffered_io_page == NULL) {
+            error_report("map buffered IO page returned error %d", errno);
+            return -1;
+        }
+    }
+
+    if (state->shared_page == NULL || state->buffered_io_page == NULL) {
+        return -1;
+    }
+
+    DPRINTF("buffered io evtchn is %x\n", bufioreq_evtchn);
+
+    state->bufioreq_remote_port = bufioreq_evtchn;
+
+    return 0;
+}
+
+void destroy_hvm_domain(bool reboot)
+{
+    xc_interface *xc_handle;
+    int sts;
+    int rc;
+
+    unsigned int reason = reboot ? SHUTDOWN_reboot : SHUTDOWN_poweroff;
+
+    if (xen_dmod) {
+        rc = xendevicemodel_shutdown(xen_dmod, xen_domid, reason);
+        if (!rc) {
+            return;
+        }
+        if (errno != ENOTTY /* old Xen */) {
+            perror("xendevicemodel_shutdown failed");
+        }
+        /* well, try the old thing then */
+    }
+
+    xc_handle = xc_interface_open(0, 0, 0);
+    if (xc_handle == NULL) {
+        fprintf(stderr, "Cannot acquire xenctrl handle\n");
+    } else {
+        sts = xc_domain_shutdown(xc_handle, xen_domid, reason);
+        if (sts != 0) {
+            fprintf(stderr, "xc_domain_shutdown failed to issue %s, "
+                    "sts %d, %s\n", reboot ? "reboot" : "poweroff",
+                    sts, strerror(errno));
+        } else {
+            fprintf(stderr, "Issued domain %d %s\n", xen_domid,
+                    reboot ? "reboot" : "poweroff");
+        }
+        xc_interface_close(xc_handle);
+    }
+}
+
+void xen_shutdown_fatal_error(const char *fmt, ...)
+{
+    va_list ap;
+
+    va_start(ap, fmt);
+    vfprintf(stderr, fmt, ap);
+    va_end(ap);
+    fprintf(stderr, "Will destroy the domain.\n");
+    /* destroy the domain */
+    qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_ERROR);
+}
+
+void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
+                        MemoryListener xen_memory_listener)
+{
+    int i, rc;
+
+    state->xce_handle = xenevtchn_open(NULL, 0);
+    if (state->xce_handle == NULL) {
+        perror("xen: event channel open");
+        goto err;
+    }
+
+    state->xenstore = xs_daemon_open();
+    if (state->xenstore == NULL) {
+        perror("xen: xenstore open");
+        goto err;
+    }
+
+    xen_create_ioreq_server(xen_domid, &state->ioservid);
+
+    state->exit.notify = xen_exit_notifier;
+    qemu_add_exit_notifier(&state->exit);
+
+    /*
+     * Register wake-up support in QMP query-current-machine API
+     */
+    qemu_register_wakeup_support();
+
+    rc = xen_map_ioreq_server(state);
+    if (rc < 0) {
+        goto err;
+    }
+
+    /* Note: cpus is empty at this point in init */
+    state->cpu_by_vcpu_id = g_malloc0(max_cpus * sizeof(CPUState *));
+
+    rc = xen_set_ioreq_server_state(xen_domid, state->ioservid, true);
+    if (rc < 0) {
+        error_report("failed to enable ioreq server info: error %d handle=%p",
+                     errno, xen_xc);
+        goto err;
+    }
+
+    state->ioreq_local_port = g_malloc0(max_cpus * sizeof (evtchn_port_t));
+
+    /* FIXME: how about if we overflow the page here? */
+    for (i = 0; i < max_cpus; i++) {
+        rc = xenevtchn_bind_interdomain(state->xce_handle, xen_domid,
+                                        xen_vcpu_eport(state->shared_page, i));
+        if (rc == -1) {
+            error_report("shared evtchn %d bind error %d", i, errno);
+            goto err;
+        }
+        state->ioreq_local_port[i] = rc;
+    }
+
+    rc = xenevtchn_bind_interdomain(state->xce_handle, xen_domid,
+                                    state->bufioreq_remote_port);
+    if (rc == -1) {
+        error_report("buffered evtchn bind error %d", errno);
+        goto err;
+    }
+    state->bufioreq_local_port = rc;
+
+    /* Init RAM management */
+#ifdef XEN_COMPAT_PHYSMAP
+    xen_map_cache_init(xen_phys_offset_to_gaddr, state);
+#else
+    xen_map_cache_init(NULL, state);
+#endif
+
+    qemu_add_vm_change_state_handler(xen_hvm_change_state_handler, state);
+
+    state->memory_listener = xen_memory_listener;
+    memory_listener_register(&state->memory_listener, &address_space_memory);
+
+    state->io_listener = xen_io_listener;
+    memory_listener_register(&state->io_listener, &address_space_io);
+
+    state->device_listener = xen_device_listener;
+    QLIST_INIT(&state->dev_list);
+    device_listener_register(&state->device_listener);
+
+    xen_bus_init();
+
+    /* Initialize backend core & drivers */
+    if (xen_be_init() != 0) {
+        error_report("xen backend core setup failed");
+        goto err;
+    }
+    xen_be_register_common();
+
+    return;
+err:
+    error_report("xen hardware virtual machine initialisation failed");
+    exit(1);
+}
diff --git a/include/hw/i386/xen_arch_hvm.h b/include/hw/i386/xen_arch_hvm.h
index 1b2c71ba4f..1000f8f543 100644
--- a/include/hw/i386/xen_arch_hvm.h
+++ b/include/hw/i386/xen_arch_hvm.h
@@ -2,6 +2,7 @@
 #define HW_XEN_ARCH_I386_HVM_H
 
 #include <xen/hvm/ioreq.h>
+#include "hw/xen/xen-hvm-common.h"
 
 void arch_handle_ioreq(XenIOState *state, ioreq_t *req);
 void arch_xen_set_memory(XenIOState *state,
diff --git a/include/hw/xen/xen-hvm-common.h b/include/hw/xen/xen-hvm-common.h
new file mode 100644
index 0000000000..c16057835f
--- /dev/null
+++ b/include/hw/xen/xen-hvm-common.h
@@ -0,0 +1,97 @@
+#ifndef HW_XEN_HVM_COMMON_H
+#define HW_XEN_HVM_COMMON_H
+
+#include "qemu/osdep.h"
+#include "qemu/units.h"
+
+#include "cpu.h"
+#include "hw/pci/pci.h"
+#include "hw/hw.h"
+#include "hw/xen/xen_common.h"
+#include "sysemu/runstate.h"
+#include "sysemu/sysemu.h"
+#include "sysemu/xen.h"
+#include "sysemu/xen-mapcache.h"
+
+#include <xen/hvm/ioreq.h>
+
+extern MemoryRegion ram_memory;
+extern MemoryListener xen_io_listener;
+extern DeviceListener xen_device_listener;
+
+//#define DEBUG_XEN_HVM
+
+#ifdef DEBUG_XEN_HVM
+#define DPRINTF(fmt, ...) \
+    do { fprintf(stderr, "xen: " fmt, ## __VA_ARGS__); } while (0)
+#else
+#define DPRINTF(fmt, ...) \
+    do { } while (0)
+#endif
+
+static inline uint32_t xen_vcpu_eport(shared_iopage_t *shared_page, int i)
+{
+    return shared_page->vcpu_ioreq[i].vp_eport;
+}
+static inline ioreq_t *xen_vcpu_ioreq(shared_iopage_t *shared_page, int vcpu)
+{
+    return &shared_page->vcpu_ioreq[vcpu];
+}
+
+#define BUFFER_IO_MAX_DELAY  100
+
+typedef struct XenPhysmap {
+    hwaddr start_addr;
+    ram_addr_t size;
+    const char *name;
+    hwaddr phys_offset;
+
+    QLIST_ENTRY(XenPhysmap) list;
+} XenPhysmap;
+
+typedef struct XenPciDevice {
+    PCIDevice *pci_dev;
+    uint32_t sbdf;
+    QLIST_ENTRY(XenPciDevice) entry;
+} XenPciDevice;
+
+typedef struct XenIOState {
+    ioservid_t ioservid;
+    shared_iopage_t *shared_page;
+    buffered_iopage_t *buffered_io_page;
+    QEMUTimer *buffered_io_timer;
+    CPUState **cpu_by_vcpu_id;
+    /* the evtchn port for polling the notification, */
+    evtchn_port_t *ioreq_local_port;
+    /* evtchn remote and local ports for buffered io */
+    evtchn_port_t bufioreq_remote_port;
+    evtchn_port_t bufioreq_local_port;
+    /* the evtchn fd for polling */
+    xenevtchn_handle *xce_handle;
+    /* which vcpu we are serving */
+    int send_vcpu;
+
+    struct xs_handle *xenstore;
+    MemoryListener memory_listener;
+    MemoryListener io_listener;
+    QLIST_HEAD(, XenPciDevice) dev_list;
+    DeviceListener device_listener;
+
+    Notifier exit;
+} XenIOState;
+
+void xen_exit_notifier(Notifier *n, void *data);
+
+void xen_region_add(MemoryListener *listener, MemoryRegionSection *section);
+void xen_region_del(MemoryListener *listener, MemoryRegionSection *section);
+void xen_io_add(MemoryListener *listener, MemoryRegionSection *section);
+void xen_io_del(MemoryListener *listener, MemoryRegionSection *section);
+void xen_device_realize(DeviceListener *listener, DeviceState *dev);
+void xen_device_unrealize(DeviceListener *listener, DeviceState *dev);
+
+void xen_hvm_change_state_handler(void *opaque, bool running, RunState rstate);
+void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
+                        MemoryListener xen_memory_listener);
+
+void cpu_ioreq_pio(ioreq_t *req);
+#endif /* HW_XEN_HVM_COMMON_H */
-- 
2.17.0


