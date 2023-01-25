Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE44667ACBB
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 09:46:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483893.750302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKbPw-000105-6r; Wed, 25 Jan 2023 08:46:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483893.750302; Wed, 25 Jan 2023 08:46:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKbPw-0000yL-1n; Wed, 25 Jan 2023 08:46:04 +0000
Received: by outflank-mailman (input) for mailman id 483893;
 Wed, 25 Jan 2023 08:46:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6g1N=5W=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pKbPu-0000gj-Js
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 08:46:02 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20613.outbound.protection.outlook.com
 [2a01:111:f400:7eb2::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96d110d0-9c8c-11ed-b8d1-410ff93cb8f0;
 Wed, 25 Jan 2023 09:45:17 +0100 (CET)
Received: from DM6PR02CA0086.namprd02.prod.outlook.com (2603:10b6:5:1f4::27)
 by DS7PR12MB6141.namprd12.prod.outlook.com (2603:10b6:8:9b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 08:44:35 +0000
Received: from DM6NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1f4:cafe::e0) by DM6PR02CA0086.outlook.office365.com
 (2603:10b6:5:1f4::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21 via Frontend
 Transport; Wed, 25 Jan 2023 08:44:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT006.mail.protection.outlook.com (10.13.173.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.17 via Frontend Transport; Wed, 25 Jan 2023 08:44:35 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 02:44:35 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 25 Jan 2023 02:44:34 -0600
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
X-Inumbo-ID: 96d110d0-9c8c-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4KXXaQMRaejNI2NxT1L9b7SVGKe0MgvOJqGQgp6rmk/aOSXo7MV6bSz9DquPztYCcpBGq6jxVvfal4ZSe2IvSeKCXO4DHkWKb7lIhaboJz3YJxdSHQDulSpYwZXNpdylx76NSbh5lNbODQ5MioXWLfEHqIv/l+0x0NDYXTqQ+skiCSHf+XieCaWKNIe6Qk3nTrPr2cKeWaaOf3GuUd410WGXpDa3IZfKk97iu6o2Krju0Gt3i+c7tf72XJpRc3+6bAEhu2ju5TeDMaU3j0f+Kv0vptRDJv36lkJINZvAZrg5L+ZxeTgohs5TrVECNiSk0gwJXaDSZtwhfhMpr8jgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQRygdwVbnDYBJcZUcE7RFsjWA1hPALnId6WXnaDoUU=;
 b=PF/BTKfZemBKX/vU7XaCm1b8YBKuTB8Nukp4b8RVLlcAdPz9HESzvGQGR9zL6PvbbR6RN0iIDyY3SXDWlCnGrCMHz/KblIP7t+DMABQzCcnc+BMPEWmRdwLca3+Q6cOS4HqW6swxxhxVE2zvWqHWE/ZeUbUN22m4gCnihbT/6i0ILhetfYBl34CvnXJEyvFkfrJJYLfJKpFoAlW6rX28tWNHXa60LCWQWh2V6UNVeN/YismU9y05fOiIuaz0OYUYDos0EQjoIpVCilG82t2C/QrbsSotjdogD7sRR0tRJTNJ3Na4QQXFL21WpNjCPXTk6A62Z8AwvhHv/q0vvrxq5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQRygdwVbnDYBJcZUcE7RFsjWA1hPALnId6WXnaDoUU=;
 b=CCUdbyNLKzmKHDW2NvgsV7EgKKyR2ZJ9x7Bka1hrvKbNtyaALdO7CWPbhZvK/JLTp6L0AjYHfU+i4vBFA8UQvhJfWm9ogpvuGzyo+gcF2Kqj98ayDacL697OCpoZ1AcBqHZf1PTyt7dYjQ52ZEGmrSQBKz2RVixIsB+0vsom+/c=
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
 Durrant" <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>, "Richard
 Henderson" <richard.henderson@linaro.org>, Eduardo Habkost
	<eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, "Marcel
 Apfelbaum" <marcel.apfelbaum@gmail.com>
Subject: [QEMU][PATCH v3 02/10] hw/i386/xen: rearrange xen_hvm_init_pc
Date: Wed, 25 Jan 2023 00:43:47 -0800
Message-ID: <20230125084356.6684-3-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230125084356.6684-1-vikram.garhwal@amd.com>
References: <20230125084356.6684-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT006:EE_|DS7PR12MB6141:EE_
X-MS-Office365-Filtering-Correlation-Id: 866e63c7-a9a8-4a9a-c8e3-08dafeb0633a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/bbNmkVnikww/QVbtNyaUG2m/czeFkCwYQddtI3MF2oDEpgyCXsLLd+mo7Pifwx+urE0TNWvkdbnfOUgSUH6bMZAHIPyc/BU71GIdHmXrYoL23HsB2BfeFqrf8hgCimb2E+XJ6aWbUx7rSpg+kRjSynSmBHQb/DAElrEbcSePDSJ9dEistzjilH5JD4rTxtr7VRxnXgSavuK7S2E3+s273LyY4HATyAtK0EY6jlxzblDuSkPMVl0oez6dKsXzSasaWNO20bhvs3/ugYkQ6GrRK4cHqACt2DWmM30CuBE/geIuWGGu7vWeXY/EdLmCVG1v/O6tqUNdmQ7GVFnkTbZ9qQH5FvS41nNG9/l8JsqH/Cu0LVKuGif2IwtvrZmG6lFbA1TXgdLmraDMr7mDl0JURYb6fHrXxJ1o4uBXD0xdKiLIPyNL37f8BNq/l5on3R09BKYE/SyyWUz7XGD694k7HGSzAu/qnv21b2/FCvidB9vcO9mhUD5Sqh8AgiQp9B+7ISQ7WbkraKstit96SQdoFmS2BwBBrmUT5Mywz+flI6ektj/nWN+s1dXOHMql35BZmmHwGUMtVBTb5+1RkIg5ebA3S4ju5fZ9yclPnfAn9jAO6zmNF5E8QikhrpfcAMh57/5UoqXjeVW0SvLMaexlIdX7+8ViM5psSELzP/kLjfnAwnPHDHXLfr7m4a6b3iys/C7PjY0KWmY5IC8OvFvOSzgLyYcRknrUvJjWG0+Azw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(376002)(396003)(346002)(451199018)(40470700004)(36840700001)(46966006)(82310400005)(4326008)(82740400003)(86362001)(356005)(36756003)(2906002)(40460700003)(70586007)(8676002)(186003)(26005)(6916009)(81166007)(6666004)(47076005)(41300700001)(426003)(54906003)(336012)(40480700001)(1076003)(5660300002)(36860700001)(2616005)(83380400001)(44832011)(8936002)(478600001)(7416002)(70206006)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 08:44:35.8061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 866e63c7-a9a8-4a9a-c8e3-08dafeb0633a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT006.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6141

In preparation to moving most of xen-hvm code to an arch-neutral location,
move non IOREQ references to:
- xen_get_vmport_regs_pfn
- xen_suspend_notifier
- xen_wakeup_notifier
- xen_ram_init

towards the end of the xen_hvm_init_pc() function.

This is done to keep the common ioreq functions in one place which will be
moved to new function in next patch in order to make it common to both x86 and
aarch64 machines.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/xen/xen-hvm.c | 49 ++++++++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 24 deletions(-)

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index b9a6f7f538..1fba0e0ae1 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -1416,12 +1416,6 @@ void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory)
     state->exit.notify = xen_exit_notifier;
     qemu_add_exit_notifier(&state->exit);
 
-    state->suspend.notify = xen_suspend_notifier;
-    qemu_register_suspend_notifier(&state->suspend);
-
-    state->wakeup.notify = xen_wakeup_notifier;
-    qemu_register_wakeup_notifier(&state->wakeup);
-
     /*
      * Register wake-up support in QMP query-current-machine API
      */
@@ -1432,23 +1426,6 @@ void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory)
         goto err;
     }
 
-    rc = xen_get_vmport_regs_pfn(xen_xc, xen_domid, &ioreq_pfn);
-    if (!rc) {
-        DPRINTF("shared vmport page at pfn %lx\n", ioreq_pfn);
-        state->shared_vmport_page =
-            xenforeignmemory_map(xen_fmem, xen_domid, PROT_READ|PROT_WRITE,
-                                 1, &ioreq_pfn, NULL);
-        if (state->shared_vmport_page == NULL) {
-            error_report("map shared vmport IO page returned error %d handle=%p",
-                         errno, xen_xc);
-            goto err;
-        }
-    } else if (rc != -ENOSYS) {
-        error_report("get vmport regs pfn returned error %d, rc=%d",
-                     errno, rc);
-        goto err;
-    }
-
     /* Note: cpus is empty at this point in init */
     state->cpu_by_vcpu_id = g_new0(CPUState *, max_cpus);
 
@@ -1486,7 +1463,6 @@ void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory)
 #else
     xen_map_cache_init(NULL, state);
 #endif
-    xen_ram_init(pcms, ms->ram_size, ram_memory);
 
     qemu_add_vm_change_state_handler(xen_hvm_change_state_handler, state);
 
@@ -1513,6 +1489,31 @@ void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory)
     QLIST_INIT(&xen_physmap);
     xen_read_physmap(state);
 
+    state->suspend.notify = xen_suspend_notifier;
+    qemu_register_suspend_notifier(&state->suspend);
+
+    state->wakeup.notify = xen_wakeup_notifier;
+    qemu_register_wakeup_notifier(&state->wakeup);
+
+    rc = xen_get_vmport_regs_pfn(xen_xc, xen_domid, &ioreq_pfn);
+    if (!rc) {
+        DPRINTF("shared vmport page at pfn %lx\n", ioreq_pfn);
+        state->shared_vmport_page =
+            xenforeignmemory_map(xen_fmem, xen_domid, PROT_READ|PROT_WRITE,
+                                 1, &ioreq_pfn, NULL);
+        if (state->shared_vmport_page == NULL) {
+            error_report("map shared vmport IO page returned error %d handle=%p",
+                         errno, xen_xc);
+            goto err;
+        }
+    } else if (rc != -ENOSYS) {
+        error_report("get vmport regs pfn returned error %d, rc=%d",
+                     errno, rc);
+        goto err;
+    }
+
+    xen_ram_init(pcms, ms->ram_size, ram_memory);
+
     /* Disable ACPI build because Xen handles it */
     pcms->acpi_build_enabled = false;
 
-- 
2.17.0


