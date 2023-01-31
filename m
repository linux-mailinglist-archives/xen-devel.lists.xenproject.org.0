Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B115E6839A1
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 23:52:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487900.755713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMzUE-0000oE-OX; Tue, 31 Jan 2023 22:52:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487900.755713; Tue, 31 Jan 2023 22:52:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMzUE-0000lO-Kx; Tue, 31 Jan 2023 22:52:22 +0000
Received: by outflank-mailman (input) for mailman id 487900;
 Tue, 31 Jan 2023 22:52:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=skZt=54=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pMzUC-0008Hj-La
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 22:52:20 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20606.outbound.protection.outlook.com
 [2a01:111:f400:7e89::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9cbc5e5-a1b9-11ed-933c-83870f6b2ba8;
 Tue, 31 Jan 2023 23:52:20 +0100 (CET)
Received: from MW4P222CA0002.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::7)
 by PH7PR12MB6857.namprd12.prod.outlook.com (2603:10b6:510:1af::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 22:52:15 +0000
Received: from CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:114:cafe::9a) by MW4P222CA0002.outlook.office365.com
 (2603:10b6:303:114::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38 via Frontend
 Transport; Tue, 31 Jan 2023 22:52:15 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT066.mail.protection.outlook.com (10.13.175.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.17 via Frontend Transport; Tue, 31 Jan 2023 22:52:13 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 31 Jan
 2023 16:52:12 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 31 Jan
 2023 14:52:12 -0800
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 31 Jan 2023 16:52:11 -0600
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
X-Inumbo-ID: e9cbc5e5-a1b9-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f68m9saXZEpw4fzGqfUGzhbFO+BjPRbUvRlW/N3EntBOdIqblOy4XCLeC50B6hqPHgeaBJSNYEoSSi7XxLlS0YcN0Ki9+sjbSt7kN9ILZRZ6k5UJo6ZcWJSlYWnJ9D1JiWno0Q1YroKZuJ/4Qz6K18037ijX1RkYbZDdL6np18Frqt6yAStUlHdI0pFrfhMKSoaBA7E6wuDYJYSteQvgkaPuU2uXPNaFRrl9qVCnyAh81MsrOfR0VhdALtA8PxlGdmv+TCfBMXW4ttRiNF9psGD/+jA8e+bTYuDLkXtvmgqJ/tw351epf2chqBpAIlxCTcvhaz/hvrEc//rAMnbxhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pArBdHE6pupZI0iEmfLZok1fiWO0kN2Oo56dAzFs5Q=;
 b=KlkQUO3+U2dkJfZM0txeKTpAyvQyfZSDypXOKu6kwm9gh7O8I01QH7paDD58z7pcyueKs/18kMSrm71WZ8YH/Fvx60/Me/IjxqWXx2laQ8A0ZlcNKZsktoyinrASFGoyC6IV3+l5RUbxWRD4htgmuJW9DEB8kSBwoprg2YvrKzeRGBRWVa4r/AgYPtOR/4wMYVmMUYfs7hSvbCFAeh+tjhnMa6FHUZ4yQDp8Qh5jPQpxgf0G849H+l+xrGDqRtxKC1Ev7zrgm3XGfKy78Ywky76B+GJt80U6f4SGOlRgfyR1renc99WlxRVGfNpc+Sgg0vSyieywgcNYltJt9QfWHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pArBdHE6pupZI0iEmfLZok1fiWO0kN2Oo56dAzFs5Q=;
 b=e6fijxWOMnF5eYEoC2iysRvmzZr0MHgH9Oi0rdouPtFDOpzfRHOKWvXN2W46HK6fcXvD8xeu4a1yWNm1I5i8m6ORyLKPHqZ/nBRVO2HzzAhJRNDVGtNjaEh94RMDnPooQuXwceeriZp0GG+ueKc5vIl+5P/NpxDHuYwcFV38DUY=
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
Subject: [QEMU][PATCH v5 03/10] hw/i386/xen/xen-hvm: move x86-specific fields out of XenIOState
Date: Tue, 31 Jan 2023 14:51:42 -0800
Message-ID: <20230131225149.14764-4-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230131225149.14764-1-vikram.garhwal@amd.com>
References: <20230131225149.14764-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT066:EE_|PH7PR12MB6857:EE_
X-MS-Office365-Filtering-Correlation-Id: c5a632be-6f78-46c0-07e8-08db03ddcb70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+8XOw0n08GypojEth6Ap7WO6i77NEtgLru79/4jqcpj26NvFhBRHhWjDP8L+G7XTKM4l+MjFBFRCDyzIj3w4GEfh4pVOTfyidHLM7aWWM1QM4S4d4ySaO5vcQN3SKVRzwO34RaqXwT9/+PgFnAewJe2fP4WsOcFE2RU7Qx1mQkeOv8IxjILoA6Ucu7VqGxDUB7i9TiC3Xms6LPAqEo29OUKR/4NgxJpZmnmImZZofdk1KdWHXRldpp//PRShd8zFcF2EcwzRRqvIcFaoj62G+VvFp+B4AoM4f80f8uk+oNll6fZsB9bEuOsesUmRCdzGJJfO9chRmaRnzeXGg3HxfAY/6P4TTgbf5C154Et6RdmRfmYgAyrkYqJoUrwEkyegj97fv4CUej/ljSFZ/dgfeyi3dPY4ghAjAbepDXjZ+4fR4Qt+TXpacoJ0gkENbKIiI/oUPh+7ZS6nA7kmGzBVtdAEonuATu+DlzVKULPX07EaXTRm4TTFOvluC6lWXnN5GeBCnX0D0jNyCpZNxpe7NpwkDdMj91vrVYQ8yHgSazct5sxNOtYsAXVaVxCb3Ka8kplUiYL4dUdU2hsDW6vXMIoySvfX6QAYjlfAceWak5Fzzaz5us8mG2LY9MO2Ui/quem11AP/ib8AzD6ikmw20JNwNLz/3L1z118K+p42bKcvAw2yfuCL3foJafolPxaJ3b9Cqu2eh2t8WD7HLM5O6NO4pH4dy7gEuc5PPfvbGx8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(136003)(396003)(39860400002)(451199018)(36840700001)(46966006)(40470700004)(44832011)(2906002)(36756003)(82310400005)(66574015)(426003)(2616005)(54906003)(83380400001)(336012)(47076005)(6666004)(316002)(26005)(186003)(478600001)(1076003)(40460700003)(70586007)(4326008)(70206006)(8676002)(6916009)(356005)(40480700001)(5660300002)(8936002)(7416002)(86362001)(41300700001)(81166007)(36860700001)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 22:52:13.7267
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5a632be-6f78-46c0-07e8-08db03ddcb70
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6857

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


