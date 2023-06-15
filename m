Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D317730BE1
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 02:05:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549301.857750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9aTg-00069u-UM; Thu, 15 Jun 2023 00:04:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549301.857750; Thu, 15 Jun 2023 00:04:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9aTg-00066k-RD; Thu, 15 Jun 2023 00:04:40 +0000
Received: by outflank-mailman (input) for mailman id 549301;
 Thu, 15 Jun 2023 00:04:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WANU=CD=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1q9aTf-00066e-Jk
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 00:04:39 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20619.outbound.protection.outlook.com
 [2a01:111:f400:7eab::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35d4c57a-0b10-11ee-8611-37d641c3527e;
 Thu, 15 Jun 2023 02:04:36 +0200 (CEST)
Received: from SA0PR11CA0032.namprd11.prod.outlook.com (2603:10b6:806:d0::7)
 by SJ2PR12MB8941.namprd12.prod.outlook.com (2603:10b6:a03:542::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Thu, 15 Jun
 2023 00:04:32 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10b6:806:d0:cafe::81) by SA0PR11CA0032.outlook.office365.com
 (2603:10b6:806:d0::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.38 via Frontend
 Transport; Thu, 15 Jun 2023 00:04:31 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.27 via Frontend Transport; Thu, 15 Jun 2023 00:04:31 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 14 Jun
 2023 19:04:28 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 14 Jun
 2023 17:04:28 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Wed, 14 Jun 2023 19:04:27 -0500
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
X-Inumbo-ID: 35d4c57a-0b10-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/qta4WYWXT02KogmyjfQQpRKsyTRszJrDON3IJ0SeXQsHQTRghisuwZWFiBoDVupk7R9qyTjrOa4tMxiPIyBa/sNnrPJNmSNEtO4SUxaF9z0U3WG7TTi2U1CKoHolIu2szQq4+FlHECiju7sxsqI2b+pzrGHXhoehuuRNtQp8fBX98SOxkwpFWaVbyLjFD1zJNokj1Mdks3dfE8JdXSYew8XzXjERZnSEuERvSx+1piK4GgFlClCah0H5JdWkc9UQOTKD70NBD1nsZGaxKV+uet9lwPzJ00C6HmkAePvqAjyVuNWVmXnbfUn+pcxf74Ou1kPOA6fZ2yJHOm7OlpGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+esgy4HuztqSu8ROePQWFE/nHzxIBFggZqfdRu8CEMM=;
 b=j/7OMMSkJVV2YMpqSY+J0HclyzhCHV6omdoZZq2UC/du9E9pDNHO2FSfy4Bb2lRUzUVpWbAZ1V8AwWiKB0mMdt7MfB40LiQZIVTHPFfrpkLcclstcMJ8/vGBfCSjQ/wE+VTFWfgPixV3XoMPdRrpjj2KnUoSbAoB1FPnXPIj2nW8JH3CmoIhsCP82DC+wobOIbk1JR6nqaYpnr0iym8K6Lq2XadMWaA9dAxwOt+v3+76XPuoz45ypV5dvsTu3DAIvpEs5qerkwYuv34GASxrsPw1ciWv2VtYjwA/aHv3bHZ/6/9NoVQdaZImLoRRl/zDWYca3UZZbJZJF1pQtB2tkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+esgy4HuztqSu8ROePQWFE/nHzxIBFggZqfdRu8CEMM=;
 b=gCHYgMNfnXSjBSgQHMf/oiXTef1nJOk7eqq1vh4Bm1i0jcAWvtHgj84Iv6STH2rIYyAKyBbVPsJYjQvZV5Od/xKiydwMU2RUG4n/WMeKC8NGsZmlnMr9i6n7tsTyQTDxh/TlQhb8H4DK4V/msLis2mGiJgajA5+d9sF6KjgPqFY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <sstabellini@kernel.org>, Vikram Garhwal <vikram.garhwal@amd.com>, Stefano
 Stabellini <stefano.stabellini@amd.com>, Anthony Perard
	<anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, "Michael S.
 Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
	<richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, "open
 list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: [QEMU][PATCH v8 02/11] hw/i386/xen: rearrange xen_hvm_init_pc
Date: Wed, 14 Jun 2023 17:03:30 -0700
Message-ID: <20230615000340.1135-3-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230615000340.1135-1-vikram.garhwal@amd.com>
References: <20230615000340.1135-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|SJ2PR12MB8941:EE_
X-MS-Office365-Filtering-Correlation-Id: b09b3bdf-e70e-46e4-7dae-08db6d341839
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9jsnC67hpUXGZWke6fRSpm7C1mDgAs5mVsc7mjh3Wh+L4Y329hHXu8ORYBqqqdS3BpDRV5KcOKtOdL75wJggEuzeBWZVho/cHaQ/MDzj3BXzvOS2glbVtQTKsIkNGK+r8U+sdm1xGo7zIU0dWFHXeXrm6+/Ij8GVECWgLjsKhjoN+xfcowBWSeLc86NcvgfMMBzp5cifF5hAhMkV4tybyAtmmf5H1JqpRRgv04OZMat/QsdJOl/arQxi0lxNfAKrXoF8PAvNn1totMCSSFPxLmxSjPIZR3TcQ6W6Uu4J2L78Ga4Fb44mEY0HYvEKWCqM6syniq1nopVHteLvuBGM8EImS38mHd9AhkDKVTEyvXUGM/teEezE1S7xvei33BRbO/dNOw3wWQ2VcgI6d3MCSlYNoxacdwP+lnxr7t15TG1T+ng7QVam7vKXNmz8maQ48cFOB2fymhA/5lJbNYBttD2t9o4FBtF1nyEzLUqxEbEdmT4/A9HhtNeONyUxvVQnhXkhxzuG85seJQGh3Tvd2ArFCDctyTUd+88gGXf9FG6KMiuULXY2Q5vaQvskZnXOJF11ZYaNPZl0nuTq6K+pmSpcsL0370SRmOJT7hBLweLvzdQJw9fpm12eBpJGqR3PE8oPL9L0ssxlFM+5SO8/FBUWehoV05eUGrTsLT/8hi80TtmFtTEFgYh7IVDcF998wII9fRTTLcKZlQO7gu6P5TOG5XiyEsnN/bVN4Hh/TnXBj893M5JstlNp6ebtlkGxS97wZG6TxL7I+MgD7VGm4A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(376002)(396003)(451199021)(46966006)(40470700004)(36840700001)(70586007)(4326008)(70206006)(8936002)(8676002)(5660300002)(36756003)(6666004)(6916009)(478600001)(54906003)(41300700001)(40480700001)(40460700003)(316002)(81166007)(82740400003)(356005)(186003)(1076003)(7416002)(47076005)(26005)(86362001)(36860700001)(44832011)(2616005)(336012)(426003)(83380400001)(82310400005)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 00:04:31.4423
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b09b3bdf-e70e-46e4-7dae-08db6d341839
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8941

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
index ab8f1b61ee..7a7764240e 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -1419,12 +1419,6 @@ void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory)
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
@@ -1435,23 +1429,6 @@ void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory)
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
 
@@ -1490,7 +1467,6 @@ void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory)
 #else
     xen_map_cache_init(NULL, state);
 #endif
-    xen_ram_init(pcms, ms->ram_size, ram_memory);
 
     qemu_add_vm_change_state_handler(xen_hvm_change_state_handler, state);
 
@@ -1511,6 +1487,31 @@ void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory)
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
2.17.1


