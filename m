Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF14963FE70
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 04:01:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451351.709088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0wI0-0008D4-BW; Fri, 02 Dec 2022 03:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451351.709088; Fri, 02 Dec 2022 03:00:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0wI0-00082W-33; Fri, 02 Dec 2022 03:00:36 +0000
Received: by outflank-mailman (input) for mailman id 451351;
 Fri, 02 Dec 2022 03:00:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VP6A=4A=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1p0wHx-000723-QT
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 03:00:33 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20631.outbound.protection.outlook.com
 [2a01:111:f400:7e89::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b22cdf2-71ed-11ed-91b6-6bf2151ebd3b;
 Fri, 02 Dec 2022 04:00:32 +0100 (CET)
Received: from DS7PR03CA0303.namprd03.prod.outlook.com (2603:10b6:8:2b::19) by
 DS0PR12MB7746.namprd12.prod.outlook.com (2603:10b6:8:135::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.10; Fri, 2 Dec 2022 03:00:23 +0000
Received: from DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2b:cafe::26) by DS7PR03CA0303.outlook.office365.com
 (2603:10b6:8:2b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8 via Frontend
 Transport; Fri, 2 Dec 2022 03:00:23 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT023.mail.protection.outlook.com (10.13.173.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.10 via Frontend Transport; Fri, 2 Dec 2022 03:00:23 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Dec
 2022 21:00:22 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Dec
 2022 19:00:22 -0800
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 1 Dec 2022 21:00:21 -0600
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
X-Inumbo-ID: 7b22cdf2-71ed-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QdBlJLUxMUReGv99AUWgMHH5lBXdu4zUp8MpB2EoaLOyvmXjJ9f5bZ8hnbpUkmBcuK0xx2uY0TMY+4mEqoCTfxUGTPzQpWtGnFjl8PEMrG8o2XPT3eZZB2hKnYpriOdhan2GtZBoZFWmt2eVk50qd4ZkRRhyCHPpm7j0Y/tUCMfXIYp1sRmRhCO7ZcHsLB6/Q5SuRODqNVhhymwt9pdPqJFSPpvwMVMlDnoC/IjY12HWwRj+A/MyR4B4K7/933XiHdhwWsy+BxG6438Mof5c7j8PZH3R/Eamg1MD43vOQNxu2Pt5x12QMEiPH2u8mj2NcJHtDnJk+nzsteXYLYqPTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bpxKo2nLW9cBRo+l2DRoyQ99s+uyNJvGuzmJSKJaypw=;
 b=LouYYjcoyyS3fIVP7vVUaqWhKqUwNnP5sRQEK13Stj+g2/jTxyIl6xno/Rh5DCb5WBOXjXNDIokjUk/V0ophE4yNTglG2BGA8zIOSZ9ChJAoP86uuklAhsOaGEgsuHeM04giD/V1P5/k71hw7AnbBt2Tt4wvksynUVJ/6qg5tTIS0DF0Wv8POHoJcJKf3+9wajlRdU6PoB4XHdL3+0cSSf+ZcfvBRmnYdzscUSIznuSb3HCxH9uUbIU5TouUbN4/f7VYYKbWa8wfGoXI7ce+BaJPVAhBy2Mlei47mqucXCDFKDUmPigOQA6VJtWOuhXXDnChrVGIBEZ6lqybK99sLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xilinx.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bpxKo2nLW9cBRo+l2DRoyQ99s+uyNJvGuzmJSKJaypw=;
 b=SNCOGWzh37+zBS5/425rs9Vett5RJGOu5iroR6UZtY+g+2cu8PxidA2OspsfSVGGLHO7CZYY5Ja7rAY4JbBnwAkBEXqNHg9i9SMdvNirdb+IDDfmXo+TsD3nj50uDRSbM89YqP5wVgab7YL1Tc7FTK6M0GI8AtduXhBPDR+1cpE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-dev@xilinx.com>
CC: <stefano.stabellini@amd.com>, <alex.bennee@linaro.org>,
	<xen-devel@lists.xenproject.org>, Vikram Garhwal <vikram.garhwal@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard
	<anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, Paolo Bonzini
	<pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, "open list:All patches CC
 here" <qemu-devel@nongnu.org>
Subject: [QEMU][PATCH v2 02/11] hw/i386/xen: rearrange xen_hvm_init_pc
Date: Thu, 1 Dec 2022 18:59:54 -0800
Message-ID: <20221202030003.11441-3-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221202030003.11441-1-vikram.garhwal@amd.com>
References: <20221202030003.11441-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT023:EE_|DS0PR12MB7746:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e4c2643-2ef4-4794-385b-08dad4115b0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SfHV5Aox+8FkzAUpwsPZANdNMIHYjOfhmE//nruGoh06k5IP1Z9WV1iNZz7BPgcgL66UHVBtj2u2x8AINpovsOxuPOuUdPJ/bLN6I4dEyofpFLOr8/xuT5TWWMXP//GE4WTG8vk1uiVF0Q3dUVrI9XsjhZPenptidP7a37oghXJhNTEkztiNu3ggZFJwmCArRjfgUtUgs/DroQkLYC2aBretreP5TNLI4XSQ96VnjW/ct4NhwzN+XVn82OyZh+CEWmg4H9biy7mjm0/Ya/n/dw1M6ZbK2SYdlSsYMGdk7szVHuvTECYlAYyyl+BL5Edh9GN17cJjoAqDZZF7gS3vxqQR/zvzHk1Q005U2KQo9CK8oVnJoKXEIo+MZj93aqkmGf5rpU4On9X3WHqBZtcIIj4UGqLJGJN1B8yNZLTQjNTJGdRbyVKDNolGeJT09K2GgJK9ii+XQD2OVjpUWKsssbrdd0MGJ7Swxk0ypBS8NIuIhbG7XGpenessmKhwGVop9KB1DW84/JOCudrAKqMhURXqJKYLiI2YqbcmgBMv8yJxLjBObjnG7zTYbcyKZ58/T4ueg3+kJVCjv6UM+wtns1aHrGNo9//OAOf7gVLewDRuBF8Zei4g+Bo19FhcGsmm6cLH7i6k6e+OMeUgXfT93YDEVqblo8SOm51dXsETH2gev3H8Y79gMP6BY0aoyyBx7ux1Dz/vEiPE+zWJ4vHIUPg/fArZ4FFcNHhmbB2mP/I=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(396003)(346002)(451199015)(40470700004)(46966006)(36840700001)(36860700001)(1076003)(36756003)(2906002)(41300700001)(2616005)(83380400001)(44832011)(8936002)(6862004)(336012)(47076005)(7416002)(426003)(5660300002)(86362001)(40480700001)(82310400005)(40460700003)(82740400003)(81166007)(356005)(478600001)(316002)(186003)(26005)(54906003)(6666004)(70206006)(70586007)(4326008)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 03:00:23.2756
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e4c2643-2ef4-4794-385b-08dad4115b0e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7746

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
index e4293d6d66..b27484ad22 100644
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


