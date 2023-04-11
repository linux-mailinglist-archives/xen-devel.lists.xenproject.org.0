Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8666DE775
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 00:48:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519970.807133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmMmU-0005hg-CX; Tue, 11 Apr 2023 22:48:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519970.807133; Tue, 11 Apr 2023 22:48:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmMmU-0005fP-7B; Tue, 11 Apr 2023 22:48:06 +0000
Received: by outflank-mailman (input) for mailman id 519970;
 Tue, 11 Apr 2023 22:48:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOX4=AC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pmMmS-0004tk-VH
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 22:48:04 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e89::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e882a2ec-d8ba-11ed-8611-37d641c3527e;
 Wed, 12 Apr 2023 00:48:02 +0200 (CEST)
Received: from DM6PR13CA0038.namprd13.prod.outlook.com (2603:10b6:5:134::15)
 by PH7PR12MB8016.namprd12.prod.outlook.com (2603:10b6:510:26b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 11 Apr
 2023 22:47:57 +0000
Received: from DS1PEPF0000E651.namprd02.prod.outlook.com
 (2603:10b6:5:134:cafe::1e) by DM6PR13CA0038.outlook.office365.com
 (2603:10b6:5:134::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.28 via Frontend
 Transport; Tue, 11 Apr 2023 22:47:56 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0000E651.mail.protection.outlook.com (10.167.18.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.27 via Frontend Transport; Tue, 11 Apr 2023 22:47:56 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 17:47:56 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 17:47:55 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 11 Apr 2023 17:47:55 -0500
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
X-Inumbo-ID: e882a2ec-d8ba-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PhmBbkW6M1d9ZSz4x2jESuuyePSazESG2fD0YFKdqvuflVga/72KwMHuXUEOSbwSVXLOSCvqfC0h2i/WAWphU9EskfbMR0JeJPsh6Wu2OJfqmaZnE3ctyj3HnfunPgYOOWR9Ixr4uXPyaHGnUDQgv5X+H33khPYkzsEuCbayhSVxNQEdfY6yy388ZS10C7bUM0So+dpIquYDfTKNWXPBeSr5nifpzJdAwdiejmOeDyPBr3L2Imdd21m+XAZ2fPP6JD0206PD5CoqstcLhoIG/6nzfYIKLcmZHrCwwOSqYpnglvVL+b0evvnOBLCuox/xAnld9VD4AVsVPKnITZbItg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=moDpzrNRsIQ+F6BoWEVODEFb14KOCFj6iOm1H5bs3as=;
 b=Wans1hYuBlTzN/3t7kfC+V/wP468ERZEBREgIAB21ts2qahc6HzrknCBr+xYBYiFgQRwIzDKNm7omL4PhKhTdzV/Af5Qebpado190R2cZxbc8EEK61yjkorypyFzjEiySKJoNBu0mkiDCBkVz3oKR+YW0vT1GfM6+WN98IJvrpFXSIJiwXaz/BWgYr1TI3oT4XMRC/l+rAsi+XpOKSAhm5Zwk964bva8WsoAIhWVFigbCahY37tNfIhTn5QdrJekLOoeXhYZ9l4xAA2dxRTkCYScnsHVMs8zq2YHizVbg7afxYb4rwbH50xcSg7BXrAoQUjU12RZTeD44gUZ7aqeAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=moDpzrNRsIQ+F6BoWEVODEFb14KOCFj6iOm1H5bs3as=;
 b=gcw8KrKoSCZWiW+HFJBHzpP+cV2+8hLtl+UcIPqlnwFiACIG+QwQp4+Y+Q7PR8/v33hca1qiCdTA+YMctLeDgy2XbcspB0RI7iKmSO8koV7q2wxtWOZxXJ78qkIHLtqx1B+tCy/t8tm9a1A6amUbgY6E6OS0qV5EXnDWG7AnKWA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, <vikram.garhwal@amd.com>,
	<stefano.stabellini@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
	<richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum
	<marcel.apfelbaum@gmail.com>
Subject: [QEMU][PATCH v6 03/10] hw/i386/xen/xen-hvm: move x86-specific fields out of XenIOState
Date: Tue, 11 Apr 2023 15:47:39 -0700
Message-ID: <20230411224746.16152-4-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230411224746.16152-1-vikram.garhwal@amd.com>
References: <20230411224746.16152-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E651:EE_|PH7PR12MB8016:EE_
X-MS-Office365-Filtering-Correlation-Id: 30c9e9f2-43c7-4571-57be-08db3adecb1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hEYdzjc5CRBT+IE/TU3KP1GB1I7xQjHd/SE6vP9u3A0EP85TmaOazB2J6nii2oIu0Q/BmZTCvAM/uhDv9rks8uj3/fWn5iCZ2X+wYLXae1uoJYDMxpiyg1V6CbO8suqQYSbvzlTBlQH98Tq0M6RfVODMiVx4ISWVd9EEHZcZecapnALI3GYr3gGGTc/9Wz4ZhZDE8Hk+LefvbicrIsbWQ4HvncGjwJ3gX2WbwySgxHxUgv7ZjGixPkq7u8JjnV6VXFRiIPFm5dZFZQgebLH4SnIwnLry7tEwP4LtPnhMJhLPJpqKqD1uF2OnW2XduQ+Ki4OW4kZpdCbR/iFGaOpdOM3/kmGHr1opUyghv3ID3pFcmrq2NrmFBK0ojSzOH5+ok6DrZj+fgQjZq4IVnRRb4Qvh8RFxPRmN9SJ2raBldidCVbRTT6t9eMXApZujiRCzz05z29q/88Zh3jtVnyUIatFYqdjH41/8Rv7TT+HRn08PBQfRGf5y0ZQ5U9r1Tkz/Hordd8CHctjm2hQxNFWzWoglnifxKgaes78UqFzMC3lAKjZXdBuLSCnY4ypOLL4SZ4Bqf9hDGBke72E4EmU9OxU9Jws9haN/TF/bKsL0t5sdeNNxjV0I9RXUlSh0rBaVgTD9VnOeM1UphzXNaAwnnP9XK0sCg9nvl+WB9LeSXzWP7S5qBG85scXwgk7JeOYavMb/GM+39/8oV+ETlHVeDw8ZmvRoC8nFWe5uddlN9rs=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(396003)(376002)(39860400002)(451199021)(46966006)(36840700001)(40470700004)(5660300002)(7416002)(2906002)(41300700001)(54906003)(316002)(186003)(8936002)(8676002)(44832011)(70206006)(70586007)(478600001)(4326008)(6916009)(6666004)(47076005)(1076003)(356005)(336012)(26005)(40460700003)(81166007)(83380400001)(426003)(36756003)(40480700001)(2616005)(66574015)(82740400003)(36860700001)(82310400005)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 22:47:56.6993
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30c9e9f2-43c7-4571-57be-08db3adecb1b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E651.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8016

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
index 5403ac4b89..6be5a250a8 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -74,6 +74,7 @@ struct shared_vmport_iopage {
 };
 typedef struct shared_vmport_iopage shared_vmport_iopage_t;
 #endif
+static shared_vmport_iopage_t *shared_vmport_page;
 
 static inline uint32_t xen_vcpu_eport(shared_iopage_t *shared_page, int i)
 {
@@ -96,6 +97,11 @@ typedef struct XenPhysmap {
 } XenPhysmap;
 
 static QLIST_HEAD(, XenPhysmap) xen_physmap;
+static const XenPhysmap *log_for_dirtybit;
+/* Buffer used by xen_sync_dirty_bitmap */
+static unsigned long *dirty_bitmap;
+static Notifier suspend;
+static Notifier wakeup;
 
 typedef struct XenPciDevice {
     PCIDevice *pci_dev;
@@ -106,7 +112,6 @@ typedef struct XenPciDevice {
 typedef struct XenIOState {
     ioservid_t ioservid;
     shared_iopage_t *shared_page;
-    shared_vmport_iopage_t *shared_vmport_page;
     buffered_iopage_t *buffered_io_page;
     xenforeignmemory_resource_handle *fres;
     QEMUTimer *buffered_io_timer;
@@ -126,14 +131,8 @@ typedef struct XenIOState {
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
@@ -463,10 +462,10 @@ static int xen_remove_from_physmap(XenIOState *state,
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
 
@@ -627,16 +626,16 @@ static void xen_sync_dirty_bitmap(XenIOState *state,
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
@@ -651,7 +650,7 @@ static void xen_sync_dirty_bitmap(XenIOState *state,
     }
 
     for (i = 0; i < bitmap_size; i++) {
-        unsigned long map = state->dirty_bitmap[i];
+        unsigned long map = dirty_bitmap[i];
         while (map != 0) {
             j = ctzl(map);
             map &= ~(1ul << j);
@@ -677,12 +676,10 @@ static void xen_log_start(MemoryListener *listener,
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
@@ -1022,9 +1019,9 @@ static void handle_vmport_ioreq(XenIOState *state, ioreq_t *req)
 {
     vmware_regs_t *vmport_regs;
 
-    assert(state->shared_vmport_page);
+    assert(shared_vmport_page);
     vmport_regs =
-        &state->shared_vmport_page->vcpu_vmport_regs[state->send_vcpu];
+        &shared_vmport_page->vcpu_vmport_regs[state->send_vcpu];
     QEMU_BUILD_BUG_ON(sizeof(*req) < sizeof(*vmport_regs));
 
     current_cpu = state->cpu_by_vcpu_id[state->send_vcpu];
@@ -1472,7 +1469,6 @@ void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory)
 
     state->memory_listener = xen_memory_listener;
     memory_listener_register(&state->memory_listener, &address_space_memory);
-    state->log_for_dirtybit = NULL;
 
     state->io_listener = xen_io_listener;
     memory_listener_register(&state->io_listener, &address_space_io);
@@ -1487,19 +1483,19 @@ void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory)
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


