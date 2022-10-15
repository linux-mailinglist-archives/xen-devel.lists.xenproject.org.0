Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2505FF882
	for <lists+xen-devel@lfdr.de>; Sat, 15 Oct 2022 07:08:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.423244.669843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojZPf-000749-50; Sat, 15 Oct 2022 05:08:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 423244.669843; Sat, 15 Oct 2022 05:08:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojZPe-00072E-W9; Sat, 15 Oct 2022 05:08:42 +0000
Received: by outflank-mailman (input) for mailman id 423244;
 Sat, 15 Oct 2022 05:08:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q/I2=2Q=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1ojZPd-00070V-3e
 for xen-devel@lists.xenproject.org; Sat, 15 Oct 2022 05:08:41 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2046.outbound.protection.outlook.com [40.107.95.46])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d42b266-4c47-11ed-91b4-6bf2151ebd3b;
 Sat, 15 Oct 2022 07:08:39 +0200 (CEST)
Received: from DS7PR07CA0002.namprd07.prod.outlook.com (2603:10b6:5:3af::8) by
 BL1PR12MB5047.namprd12.prod.outlook.com (2603:10b6:208:31a::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.29; Sat, 15 Oct 2022 05:08:35 +0000
Received: from CY4PEPF0000B8EB.namprd05.prod.outlook.com
 (2603:10b6:5:3af:cafe::ad) by DS7PR07CA0002.outlook.office365.com
 (2603:10b6:5:3af::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30 via Frontend
 Transport; Sat, 15 Oct 2022 05:08:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000B8EB.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5676.13 via Frontend Transport; Sat, 15 Oct 2022 05:08:34 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Sat, 15 Oct
 2022 00:08:33 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 14 Oct
 2022 22:08:16 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Sat, 15 Oct 2022 00:08:16 -0500
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
X-Inumbo-ID: 6d42b266-4c47-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+AE3OkgPbwBfj3t38zglfg/PDpZgKrbjJ0KLaYq1QYXjtcBvCq/kTFbd3vVeYiP7e+MFm2yCNd3lBF6gfGqjUaF3ceYMF6k3/buQYJWxrdhZQWElrL0y0/V1bKmXv3xIQZT6a83ljaJsvR/IBFHaaHhKLVUKvLKONJEuZpCp7jY59+z7MbfmEwu2gwoqela1hU8f4t5Vmbd6aBp6iGd7JW+D85U7d7NF3tm9RBB4tLdC7KlYt+88uUvBMZJkFQmsfc1BdAe7Qiu54D5L58oOhfh6GFMyFAF7pLz7Gb2bvZmGJTiR1e2kc57pMsaW9qQJkOOceVLG2NklJhQ4Za3NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LGGPbwlxtXacFwh2uK/QMY1MogeH7b96FjloSfMq4Q8=;
 b=m1E/ZGdAAjc275Ev1alZUXLG6u+5oLL/A9zn6Bo7Z7fr2Mq8m7hOCQSm2nZcd7KYeBO2qjeuxa52wfqMeZXtBKG2C11cJn6k/eAadTn0WwL1YRjYnXAnzp5zvkl60fgJTjbV9bhQL6hWKEwUqbt/pW9rFQOl+S6/w5Xts2ljuokkPoMuz5q4LuppHAypv7Mlc47Y4+BvR/PkjVhOhoxFDHNnSCICy2VKXeRtfdAN9ng3l6JyXKleSa9FW9EiPKQumXIJRT5qfkKn0W40bkxb47acDIb988EysAsjPQIQ9CDp/AmVj7T7fetTrKHNb4zVHTqqoijRqUb5BiLFrWD8mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LGGPbwlxtXacFwh2uK/QMY1MogeH7b96FjloSfMq4Q8=;
 b=CAFrhLZ0X1uuFuuzW4EiU2BkQPg87AQvelymr6lx8v0ci65rV8WDw1sFro1E6TzlXO+rhw+5UZwl2bumpVUSkfq83junuZF5+2oWpbQUuSPIioJMGZJo0WiRXjxXKKMQmetEP2+U16CbmXveRNUxIh+tuZdqaqyivk9IAym43HM=
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
 Durrant" <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>, "Richard
 Henderson" <richard.henderson@linaro.org>, Eduardo Habkost
	<eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, "Marcel
 Apfelbaum" <marcel.apfelbaum@gmail.com>, "open list:X86 Xen CPUs"
	<xen-devel@lists.xenproject.org>
Subject: [PATCH v1 03/12] hw/i386/xen: rearrange xen_hvm_init_pc
Date: Fri, 14 Oct 2022 22:07:41 -0700
Message-ID: <20221015050750.4185-4-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221015050750.4185-1-vikram.garhwal@amd.com>
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000B8EB:EE_|BL1PR12MB5047:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a8883f7-e004-4919-c63c-08daae6b4faa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o9TV7nhnl0o+h+uJL8TgzZBIceQA5JP0h5HTBdDcx3jk2o0jWbcRTzoFDqtFh5VJm0ox7kULqFxsNlQaENR8t6EjpeqOeb6C2fJHqOU/ZN5SmwGm/gag5WENXNVHV9mXU11HibAWFoI8ulIPyvFU06NYndX4vNk33c0zpZ4J7PXzseKntcC6MwyPS219ThW+B8TQCxyh8NG+xxEz4oP+wFBDjxHx80iLsXJQ5Gw1kRfg2YAfXq4VL8KsJ4SvnhlMi9vmR+FNEuoKPVdKl4NFZjbVsw5pBXYQz9bElc2++q9ApgiV1u1BnA77/rkESrJirOsTeDlGrvHlll4C1q/SzshULTPuZ5MNZB/YadHSXVsQvGWGNjyOQDjXq9wDluVXm8Z8iRo0Pi1nES50a1BbSeI2FgCK+P4ewn8o+NLbPV0AU4ywjbvFjIuejTFBpy6l1VtcDSEKbmJOooKSJwrU8n33rroZR7hKpqkA9P782nCA6Y2INiVlAvSh+pynf+cuMYoFEhOuX4moTQPmBaLDE0y9UqAJLeZSp2UT2R7OwtkQTOS6+202jQc/jObgHG8MNpr/zrdy3+C2HjTbJz3pTjXkV1IbSi3If63fRBcD0JvCdMw4WcEg5CgxGRCBMYfywxOG+gHK4VvuNEtBsW3JW/y2I8AZLnC46G1pOGbj96099eYwABE9Za85chPsxANX9nn5kVHLobrRu69VXV6URbWb2rVmxEfswVHuf3iyHumfFmEyWqC+tfWIFXY9UtepYaSQJm9oxFNR98Hrzedf06p1LG7mqrbC8Nq3ukXZ7ZaUJoKxFK3BWebz72INkKOi
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(376002)(136003)(396003)(451199015)(40470700004)(36840700001)(46966006)(5660300002)(1076003)(336012)(7416002)(426003)(44832011)(186003)(2616005)(2906002)(41300700001)(8936002)(356005)(47076005)(81166007)(82740400003)(82310400005)(40480700001)(86362001)(36756003)(40460700003)(26005)(83380400001)(36860700001)(54906003)(478600001)(316002)(6916009)(6666004)(4326008)(8676002)(70206006)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2022 05:08:34.5953
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a8883f7-e004-4919-c63c-08daae6b4faa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000B8EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5047

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


