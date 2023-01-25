Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4938E67ACBE
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 09:46:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483896.750323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKbQE-0001te-Pb; Wed, 25 Jan 2023 08:46:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483896.750323; Wed, 25 Jan 2023 08:46:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKbQE-0001qY-Lz; Wed, 25 Jan 2023 08:46:22 +0000
Received: by outflank-mailman (input) for mailman id 483896;
 Wed, 25 Jan 2023 08:46:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6g1N=5W=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pKbQD-0000gj-L8
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 08:46:21 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20607.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2591a8f-9c8c-11ed-b8d1-410ff93cb8f0;
 Wed, 25 Jan 2023 09:45:36 +0100 (CET)
Received: from DS7PR05CA0082.namprd05.prod.outlook.com (2603:10b6:8:57::23) by
 SA1PR12MB7343.namprd12.prod.outlook.com (2603:10b6:806:2b5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 08:44:53 +0000
Received: from DM6NAM11FT093.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:57:cafe::c3) by DS7PR05CA0082.outlook.office365.com
 (2603:10b6:8:57::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.20 via Frontend
 Transport; Wed, 25 Jan 2023 08:44:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT093.mail.protection.outlook.com (10.13.172.235) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Wed, 25 Jan 2023 08:44:52 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 02:44:52 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 25 Jan 2023 02:44:51 -0600
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
X-Inumbo-ID: a2591a8f-9c8c-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UWjzAdTG6FoBkN4VDTnTSvQz1D1OfqFDSKOveTec9XCbZiEOgMbjg7xlooci1aLAywFuG2s4609qFWzFXIOnJsJrftZDukRlBewEd+EEy5Q4A2yfXHBBplkm6+/KXR2eoyegwp1Qe+a1CEtJe9tHnaYTHq4CdI0l+v/cHF4KJb4sIVM6bANO8zVCyK71+/mlo0mCmXQT1hcPFjaEbOimjW84PDTA6XuoP3Nyk0glF7rfdQPUXxPDEv+OFLf8tz0/0Xoo62IXT/WsuqcxEk4xY7iFt6E2NZ2H9s0zlFhpKCiVGoR1EyWd9IYUqRVMoGJVPcVa1eD+e+WfBYsnuOR9YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pArBdHE6pupZI0iEmfLZok1fiWO0kN2Oo56dAzFs5Q=;
 b=FY0ZSyu8iRwp2MB6nfhOXejjO2odNeqCK59ZLMa/IQQLMC2zELC5f/W3shE4HK3XhF3GI1QLsynBj05si6BEItHkTFcMoFyYYt2gpEFBBwcMop8J7HUaOjGgDNMYYPENotf4OGOq063VVElEROoriZEXokp4IpVbA0l3uQ12/ooJddv0ek19R6n66aN+Mm9GdH8+B5w0quoXjGwyrEgKbOI/Au9MLXZpFoki8jjzapi84eHB+4SSzt4Ao44NQIXMAHBROTtPVLsJiV+JRwuQuilFXzHwdSZSmkzSmLfRJlhRixUN7BMdOm+KcNqs43fNBYMVykS57OqVf5OZ3Y56eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pArBdHE6pupZI0iEmfLZok1fiWO0kN2Oo56dAzFs5Q=;
 b=Lgdse+349LyOqGLCHcSKWqZGXX2S1rn5X36/4YUCOI+OSanxmPe23n+ZU7QqyRYLtzu9JeCnlEIdZlCwBOqxsZiMnR62PqIk3n5Ni1r4igFEJ3IegvHitbjD91B3enw1gprYOtwdRzWQYhsCBS6In5iRcBUZjKszPBi8+SOf8v8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, <vikram.garhwal@amd.com>,
	<stefano.stabellini@amd.com>, <alex.bennee@linaro.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, "Paul
 Durrant" <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>, "Marcel
 Apfelbaum" <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>, Eduardo Habkost
	<eduardo@habkost.net>
Subject: [QEMU][PATCH v3 03/10] hw/i386/xen/xen-hvm: move x86-specific fields out of XenIOState
Date: Wed, 25 Jan 2023 00:43:48 -0800
Message-ID: <20230125084356.6684-4-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230125084356.6684-1-vikram.garhwal@amd.com>
References: <20230125084356.6684-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT093:EE_|SA1PR12MB7343:EE_
X-MS-Office365-Filtering-Correlation-Id: ea2cdfe9-c8d6-43bc-1ee9-08dafeb06d75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R/+hzhp4rBaMNuv9m8sJk2mH+LF62in/hp4KvrYWVglqmqZW7BpmUYPxvlQ77K1OMQUl8Po+ZsO3jo3+nIJAEacrU1KrPRLfKOikjCC9PdBavyxzsv18moCJER2GWjHrFAYuomEcGoqIk/Ug8pytG17qpcKA9i/wZcl9fz6qZiCPDfirXiSal8W9ZRBzx415JBnwWWs+NUPXHjcQNu7Fc8WqMwgXOe5EMJON+dTMhVlx+dNTma4IicaT5RMHh2pRT+wrbRlFgN5/ipxOrc4VYA+TDTBapUS/dWT7wyK+ecPNcC+Ju2pv87CsDYnnRF3t4W5LfRVXikTG8QxfkvidUQs7R42B3iqmds5itPS4N3bU5n1YCRf5+D8sn9bPiWqXTsJ0t7TUerePJCLXXqPf/NA3lpT5zTXcwC3RcZgOUaXpuqe3Wd/s/ye1w+lTWVmqtkQ3sHVd3PJDbM7scNCmzsiwkdU3HlYu2WQenx5eVe0IA64pxcf83pOGO64diNEDcQkHhymCGTjDgjcNf2MGToVv7jowM7B8y7OsDJHe1bz8yHxgJQUtrZjVK3VwGIl92xnGKA21uPylZkNAuqHYbG+eSWNsY+acJuVVET0sPSaV42QhJV+2HMl+hqq8PrrOy0ncjs6EDpMw951UzdHVWMCCWLwScVB67pnzObhgPKMjpVIbKzN/x4GfkWYnABOMUGOCJH62/zHdzN0Nc/7ldpTIKclh3scQH/TWjTBMmRw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199018)(40470700004)(36840700001)(46966006)(83380400001)(36860700001)(426003)(336012)(54906003)(47076005)(6916009)(2616005)(478600001)(66574015)(8676002)(186003)(36756003)(1076003)(70206006)(70586007)(356005)(2906002)(86362001)(82740400003)(7416002)(41300700001)(26005)(81166007)(5660300002)(316002)(40480700001)(40460700003)(6666004)(44832011)(4326008)(82310400005)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 08:44:52.9656
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea2cdfe9-c8d6-43bc-1ee9-08dafeb06d75
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT093.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7343

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
Reviewed-by: Paul Durrant <paul@xen.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/i386/xen/xen-hvm.c | 58 ++++++++++++++++++++-----------------------
 1 file changed, 27 insertions(+), 31 deletions(-)

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 1fba0e0ae1..06c446e7be 100644
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


