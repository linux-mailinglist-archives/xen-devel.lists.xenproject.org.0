Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BD95FF885
	for <lists+xen-devel@lfdr.de>; Sat, 15 Oct 2022 07:08:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.423250.669878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojZPj-0007u9-JY; Sat, 15 Oct 2022 05:08:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 423250.669878; Sat, 15 Oct 2022 05:08:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojZPj-0007pZ-CX; Sat, 15 Oct 2022 05:08:47 +0000
Received: by outflank-mailman (input) for mailman id 423250;
 Sat, 15 Oct 2022 05:08:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q/I2=2Q=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1ojZPg-00070V-SV
 for xen-devel@lists.xenproject.org; Sat, 15 Oct 2022 05:08:45 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ee54926-4c47-11ed-91b4-6bf2151ebd3b;
 Sat, 15 Oct 2022 07:08:42 +0200 (CEST)
Received: from DS7PR07CA0020.namprd07.prod.outlook.com (2603:10b6:5:3af::12)
 by BL3PR12MB6380.namprd12.prod.outlook.com (2603:10b6:208:3b3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Sat, 15 Oct
 2022 05:08:36 +0000
Received: from CY4PEPF0000B8EB.namprd05.prod.outlook.com
 (2603:10b6:5:3af:cafe::64) by DS7PR07CA0020.outlook.office365.com
 (2603:10b6:5:3af::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32 via Frontend
 Transport; Sat, 15 Oct 2022 05:08:36 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000B8EB.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5676.13 via Frontend Transport; Sat, 15 Oct 2022 05:08:36 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Sat, 15 Oct
 2022 00:08:33 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 14 Oct
 2022 22:08:18 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Sat, 15 Oct 2022 00:08:17 -0500
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
X-Inumbo-ID: 6ee54926-4c47-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hbTZoC9qo361KOmshfmjFTjFOiVfJ+rRC2Ad5Ei3wfxSm7gYYFSLZcgAPikg7QrikaleAgBDJ0/LURS7ZsU2M9kMY/N8R6E+DDlQWImycWY0AtrP69Gv7EBXOjiXDiVtR4fw/VdwcYfKcN3GJTe4KYGhCcxQTms1hgjRW/Wu1sfEVex9zH+g2RwFCW00csBrNZVJeaqshXf/sMl9x7ruJhZuvKmy4JRDvnHHpxTVpiyELInQrmBdidBY+ZIChXTJZSimwN46HIetexvcJkJba+gSPbroA39QSlh8x2u8d4de9VqSf+gQrr6L24mAjDOsKdQ+BmoZROVLQa0h+oLojw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JBycLvC7LfB4SZEL+ZgccbN3If0EIaDUN/ArGkdJ54Q=;
 b=BQXYcXEXqCnYhwPUfKv47+VMYkY8ny3loZRabuXJAGxHuQXOXF86K+B0cB/trlHGO3vBYyGvuucE859ovKi77iPsIUrqK0Iz/iMgJ44pYw4KxuwT3kBmohYZ1jJFDYMkYlaBjE7b+hpamzza4Jr8mLDoNmhmXb5S0WEOmq/hqDoFY1S3Xs3S/PS1QxTuIJb6vrRSZnIUY/C4agQ9t/UM0WXqnvSJnAckBr3XM2qBkDq9anLjmF18eHGXtqGYgNGGIiS6AqE8NGMXBjtzNvimQ+wfnMu3C24kMgSyrmx310O01tWaUAumxqaWLRneIY3FGJIzUMrzmB+xSH01WGhsGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBycLvC7LfB4SZEL+ZgccbN3If0EIaDUN/ArGkdJ54Q=;
 b=Dn1GUUDac1z4o3ZQp9pjf7lV8SeziXBOsoP62j/7N1q3xa/B/6ualCDxbMx4XVvkNij2LNcDMpIRp6BQKf/UsnBs7MQchTAgDMkqkJved0uMbpVUjQOaL7eMraU6MeDbPipritMcwnfU+4IAg1FdrZBSGi43Bvs2bmORVIU8L4g=
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
Subject: [PATCH v1 04/12] hw/i386/xen/xen-hvm: move x86-specific fields out of XenIOState
Date: Fri, 14 Oct 2022 22:07:42 -0700
Message-ID: <20221015050750.4185-5-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221015050750.4185-1-vikram.garhwal@amd.com>
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000B8EB:EE_|BL3PR12MB6380:EE_
X-MS-Office365-Filtering-Correlation-Id: a97f6924-b7f1-4fd8-e0e4-08daae6b50a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d/9dTt3/7dgKZBt4Hyt7p4YeP6377EqTF6lI2L2c/IZCIxQTg9OPfRHBzUDvUFCXnOeb415G+2oYK8Z9IWT4d1U1NgxcHzYcU/QVo5V47FRHCIp+WOxJ2gkP95Ab+Zor4Cj7j/2wmKlsBY26G2t+yVwbRpG+wNLNtgCrBzoSNgOTXiBOmK1f+oOX9zF8fZKvWZLvrs5ZF5+mAWy1nRJ2o3HyM/LIcPzY758EnMuJvb+j6aZSQ8zRT/SJ1fMhCAIDMgpJt5zreqQJfwSOv+Or4dJ2VVfKSn3RE0TZXHTCrXKmffF+Q8ohaBdN95fG/RmpF4ZXLzJw5OMQB2nbhSI8ignaTV4rFj9nR9YG8lhzf/hoQ3/wlFrTAsWgJcMghpGgJ3JmvUQkeohNle82/SjRrJ9coj3zZVg4YEWy5h7ahthRr0hWUAJFyXATk2fC2nWUoq61PgFXB8kjEsbdR4acVm+dN+/0Gnj1yw8N1blSQFhp9HLbE6uWjQdv76GikYcMl3F2s6GCQCt1HbsqZIa6PoWgrVJEztsFYlIHUNU3z+74V2mYwq2TUsAPaT/VzzXKhT40u6mrWgURX8G328Ic6zzRhLGlV2R0fKyVY4c77t1mjaXCELLnjdCMdEd+e0AkIso//8pVhzAcX1HJnkWWyd76fPYxkeZW8jTjLvxx1/jGPuoTQKcuFHMvwuAB1MdGvlofQXGuwJMtx1LtcmqbLP06iPh440CNq0aCv1RgjcuU2l4tqUIybMCaeu6fK12c3aiE3ljz1Ch4VJ9AjqkgpqsuwhJu+LD5t7EsAFv0LZc8yh15rcTnI1ZfBzUVnRq6
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(39860400002)(376002)(136003)(451199015)(40470700004)(46966006)(36840700001)(47076005)(6916009)(426003)(7416002)(5660300002)(40480700001)(40460700003)(54906003)(186003)(1076003)(8936002)(356005)(81166007)(26005)(82310400005)(2906002)(86362001)(2616005)(41300700001)(336012)(478600001)(36756003)(82740400003)(4326008)(316002)(83380400001)(8676002)(70586007)(70206006)(44832011)(6666004)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2022 05:08:36.2672
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a97f6924-b7f1-4fd8-e0e4-08daae6b50a9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000B8EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6380

From: Stefano Stabellini <stefano.stabellini@amd.com>

In preparation to moving most of xen-hvm code to an arch-neutral location, move:
- shared_vmport_page
- log_for_dirtybit
- dirty_bitmap
- suspend
- wakeup

out of XenIOState struct as these are only used on x86, especially the ones
related to dirty logging.
Updated XenIOState can be used for both aarch64 and x86.

Also, remove free_phys_offset as it was unused.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 hw/i386/xen/xen-hvm.c | 58 ++++++++++++++++++++-----------------------
 1 file changed, 27 insertions(+), 31 deletions(-)

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index b27484ad22..e169de16c4 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -73,6 +73,7 @@ struct shared_vmport_iopage {
 };
 typedef struct shared_vmport_iopage shared_vmport_iopage_t;
 #endif
+static shared_vmport_iopage_t *shared_vmport_page;
 
 static inline uint32_t xen_vcpu_eport(shared_iopage_t *shared_page, int i)
 {
@@ -95,6 +96,11 @@ typedef struct XenPhysmap {
 } XenPhysmap;
 
 static QLIST_HEAD(, XenPhysmap) xen_physmap;
+static const XenPhysmap *log_for_dirtybit;
+/* Buffer used by xen_sync_dirty_bitmap */
+static unsigned long *dirty_bitmap;
+static Notifier suspend;
+static Notifier wakeup;
 
 typedef struct XenPciDevice {
     PCIDevice *pci_dev;
@@ -105,7 +111,6 @@ typedef struct XenPciDevice {
 typedef struct XenIOState {
     ioservid_t ioservid;
     shared_iopage_t *shared_page;
-    shared_vmport_iopage_t *shared_vmport_page;
     buffered_iopage_t *buffered_io_page;
     xenforeignmemory_resource_handle *fres;
     QEMUTimer *buffered_io_timer;
@@ -125,14 +130,8 @@ typedef struct XenIOState {
     MemoryListener io_listener;
     QLIST_HEAD(, XenPciDevice) dev_list;
     DeviceListener device_listener;
-    hwaddr free_phys_offset;
-    const XenPhysmap *log_for_dirtybit;
-    /* Buffer used by xen_sync_dirty_bitmap */
-    unsigned long *dirty_bitmap;
 
     Notifier exit;
-    Notifier suspend;
-    Notifier wakeup;
 } XenIOState;
 
 /* Xen specific function for piix pci */
@@ -462,10 +461,10 @@ static int xen_remove_from_physmap(XenIOState *state,
     }
 
     QLIST_REMOVE(physmap, list);
-    if (state->log_for_dirtybit == physmap) {
-        state->log_for_dirtybit = NULL;
-        g_free(state->dirty_bitmap);
-        state->dirty_bitmap = NULL;
+    if (log_for_dirtybit == physmap) {
+        log_for_dirtybit = NULL;
+        g_free(dirty_bitmap);
+        dirty_bitmap = NULL;
     }
     g_free(physmap);
 
@@ -626,16 +625,16 @@ static void xen_sync_dirty_bitmap(XenIOState *state,
         return;
     }
 
-    if (state->log_for_dirtybit == NULL) {
-        state->log_for_dirtybit = physmap;
-        state->dirty_bitmap = g_new(unsigned long, bitmap_size);
-    } else if (state->log_for_dirtybit != physmap) {
+    if (log_for_dirtybit == NULL) {
+        log_for_dirtybit = physmap;
+        dirty_bitmap = g_new(unsigned long, bitmap_size);
+    } else if (log_for_dirtybit != physmap) {
         /* Only one range for dirty bitmap can be tracked. */
         return;
     }
 
     rc = xen_track_dirty_vram(xen_domid, start_addr >> TARGET_PAGE_BITS,
-                              npages, state->dirty_bitmap);
+                              npages, dirty_bitmap);
     if (rc < 0) {
 #ifndef ENODATA
 #define ENODATA  ENOENT
@@ -650,7 +649,7 @@ static void xen_sync_dirty_bitmap(XenIOState *state,
     }
 
     for (i = 0; i < bitmap_size; i++) {
-        unsigned long map = state->dirty_bitmap[i];
+        unsigned long map = dirty_bitmap[i];
         while (map != 0) {
             j = ctzl(map);
             map &= ~(1ul << j);
@@ -676,12 +675,10 @@ static void xen_log_start(MemoryListener *listener,
 static void xen_log_stop(MemoryListener *listener, MemoryRegionSection *section,
                          int old, int new)
 {
-    XenIOState *state = container_of(listener, XenIOState, memory_listener);
-
     if (old & ~new & (1 << DIRTY_MEMORY_VGA)) {
-        state->log_for_dirtybit = NULL;
-        g_free(state->dirty_bitmap);
-        state->dirty_bitmap = NULL;
+        log_for_dirtybit = NULL;
+        g_free(dirty_bitmap);
+        dirty_bitmap = NULL;
         /* Disable dirty bit tracking */
         xen_track_dirty_vram(xen_domid, 0, 0, NULL);
     }
@@ -1021,9 +1018,9 @@ static void handle_vmport_ioreq(XenIOState *state, ioreq_t *req)
 {
     vmware_regs_t *vmport_regs;
 
-    assert(state->shared_vmport_page);
+    assert(shared_vmport_page);
     vmport_regs =
-        &state->shared_vmport_page->vcpu_vmport_regs[state->send_vcpu];
+        &shared_vmport_page->vcpu_vmport_regs[state->send_vcpu];
     QEMU_BUILD_BUG_ON(sizeof(*req) < sizeof(*vmport_regs));
 
     current_cpu = state->cpu_by_vcpu_id[state->send_vcpu];
@@ -1468,7 +1465,6 @@ void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory)
 
     state->memory_listener = xen_memory_listener;
     memory_listener_register(&state->memory_listener, &address_space_memory);
-    state->log_for_dirtybit = NULL;
 
     state->io_listener = xen_io_listener;
     memory_listener_register(&state->io_listener, &address_space_io);
@@ -1489,19 +1485,19 @@ void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory)
     QLIST_INIT(&xen_physmap);
     xen_read_physmap(state);
 
-    state->suspend.notify = xen_suspend_notifier;
-    qemu_register_suspend_notifier(&state->suspend);
+    suspend.notify = xen_suspend_notifier;
+    qemu_register_suspend_notifier(&suspend);
 
-    state->wakeup.notify = xen_wakeup_notifier;
-    qemu_register_wakeup_notifier(&state->wakeup);
+    wakeup.notify = xen_wakeup_notifier;
+    qemu_register_wakeup_notifier(&wakeup);
 
     rc = xen_get_vmport_regs_pfn(xen_xc, xen_domid, &ioreq_pfn);
     if (!rc) {
         DPRINTF("shared vmport page at pfn %lx\n", ioreq_pfn);
-        state->shared_vmport_page =
+        shared_vmport_page =
             xenforeignmemory_map(xen_fmem, xen_domid, PROT_READ|PROT_WRITE,
                                  1, &ioreq_pfn, NULL);
-        if (state->shared_vmport_page == NULL) {
+        if (shared_vmport_page == NULL) {
             error_report("map shared vmport IO page returned error %d handle=%p",
                          errno, xen_xc);
             goto err;
-- 
2.17.0


