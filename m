Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A98D67AD05
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 09:56:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483971.750462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKba3-0002KL-Tp; Wed, 25 Jan 2023 08:56:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483971.750462; Wed, 25 Jan 2023 08:56:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKba3-0002FS-Pw; Wed, 25 Jan 2023 08:56:31 +0000
Received: by outflank-mailman (input) for mailman id 483971;
 Wed, 25 Jan 2023 08:56:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6g1N=5W=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pKba1-00012q-K3
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 08:56:29 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7eaa::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12267ac9-9c8e-11ed-91b6-6bf2151ebd3b;
 Wed, 25 Jan 2023 09:56:28 +0100 (CET)
Received: from DM6PR08CA0036.namprd08.prod.outlook.com (2603:10b6:5:80::49) by
 MN2PR12MB4111.namprd12.prod.outlook.com (2603:10b6:208:1de::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 08:54:29 +0000
Received: from DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:80:cafe::4a) by DM6PR08CA0036.outlook.office365.com
 (2603:10b6:5:80::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Wed, 25 Jan 2023 08:54:29 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT016.mail.protection.outlook.com (10.13.173.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Wed, 25 Jan 2023 08:54:28 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 02:54:27 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 25 Jan 2023 02:54:26 -0600
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
X-Inumbo-ID: 12267ac9-9c8e-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JQ/YrdxXbBAwraVU9uU5qScpbPMmTfefIKg3RaAS/k0Q1tjvLnIhyeex3eJRUzGjBtELaVLGX5doUqYpF7m9fTwEa2B8YGitLmJA5ch/jHSclbmPlTkQgY62ebViJ6OzkVlNW13DipfGxgDjcluphGqgmFxe7GadPqhdChlMVVzdeq4GhvpD9azkWCisnuimfwKUiNB6oIIp6HxeD64YBTJoeWbkMkh2YSHGrpj+PoLdfjXvQaeNd1SOhCQpF9tW4Wwe3ojhjcJbtw7JFWlIWOYCp1T1JERX6veNT/u+4vAfP9hjZqRgT/drPiqsNmxe+n+TtT6bbMjdCqFLvjrKzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQRygdwVbnDYBJcZUcE7RFsjWA1hPALnId6WXnaDoUU=;
 b=hq2+A92pf5JiH/kPCKdTdCq6Eb+huETOJgJzldmtDkg9+Q3KNuYO54I98CacnOvbmySA5vZEcN9Yj1t0rsQmob0lTOM/oUqaO4E3h1N0SVjowQjT4KaObl7ovhfduUMLh/HB3FXFwUFXIyZwQmCdjXBgxcg20nPiEyuc8W+LOTefbXVvqfg1TsZfeVfVOGAcjni3pAGroBqIXbBGbG6o9/0Kh7Cii0AeoMPixdSn8ZMpWJqGmgJkpnYccbfhhkXIfTa/pJrLkR5AtZVKuVrA8dFxc27iJ3kOAoiQhgnCH2lGbscrExaU4Noc7XVImmiwiTGqVxbFNHgFHVEP5LU7Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQRygdwVbnDYBJcZUcE7RFsjWA1hPALnId6WXnaDoUU=;
 b=ibrq85+4pNNvO0lO2iNeJy43rqs3yV8Z/DeLrhaFQRApIJ8IDTpYZlrBMvQ6XBKaJTByN3ygbfcmP5UefnmyO3ESTvvta0CFuV7z/X3KYkplHnxXk2NNYYLBtLcWjPmVMSbMiLVGKNlKq5mhYpzFlRzcmCOYTGdqP6/EG3j10f0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, <vikram.garhwal@amd.com>,
	<stefano.stabellini@amd.com>, <alex.bennee@linaro.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, "Paul
 Durrant" <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>, "Marcel
 Apfelbaum" <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>, Eduardo Habkost
	<eduardo@habkost.net>
Subject: [QEMU][PATCH v4 02/10] hw/i386/xen: rearrange xen_hvm_init_pc
Date: Wed, 25 Jan 2023 00:53:59 -0800
Message-ID: <20230125085407.7144-3-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230125085407.7144-1-vikram.garhwal@amd.com>
References: <20230125085407.7144-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT016:EE_|MN2PR12MB4111:EE_
X-MS-Office365-Filtering-Correlation-Id: 91a567b6-f4cd-441a-df48-08dafeb1c48a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	olvmbCUD/rGjlgOvMdbQOW61JeNYXVjoNjTN0g+fcWLXzEMCOViwvhRBknhEiMg1TAC/tirgPm88rrtR1dT62eXX1fybfUfUtIGbqFlfin/h5F2/xRiVuR1QQYSl/KRqTMVbnmsUX8+01b4V7HK+a5OKkN+ERLA+y0+QETDbv+qkccByylm0+jP7DnzBEe854yeTP1b/prDEUi51B5NlwkELvzyN5LK7bN/6up4woLIy5aWeNLuEKs6/0uE3wwppShUuf2qtUA1G9TaBKnPe4YgcMMVbCkZrvNIs374pIwpSLteB7qU4zOBPkoCUzS5wJBwelhg/gmCOqbHblVKDzjsdZ9/w2lNykoOpkzYNuir3AegdF9/AzPFiyltnTdlbPMPOXandm6j92qowyg4SEOwSAs9rFapLT4azXHoXFdr88aw3HMQ7dsfdGQ9j6JeiUx+RC+vTcdqk4GOVU2yDi8w9K/BeRQ5yUSQVKrV8sGhCaZBPXcZ7sx2r4RJT0i7TSA7esdinYlbqZEJKDT5Dg5aaYxE+BqsrsfYi+gG9x/2Yvqw9eVIJF1dYuzqQXTfer/9AMfstvEZH98bddclpWsv9HRPRx46Pi4rsvrslY9XImlqgsF4WbfB/1F9enf8Ir0itQqibc7tqN1nDwrmmaqCk7y20FFFdGh+QlLCOkMgtMXE/S+eqo902GMBSZYiKlxd0hPwXDDN/AvHEOhNZlr5DHWHzuRDuQpPAeVJglxc=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(376002)(396003)(346002)(451199018)(40470700004)(36840700001)(46966006)(82310400005)(82740400003)(4326008)(86362001)(2906002)(36756003)(356005)(40460700003)(70586007)(8676002)(186003)(26005)(6916009)(81166007)(6666004)(47076005)(41300700001)(426003)(54906003)(336012)(40480700001)(1076003)(5660300002)(36860700001)(2616005)(83380400001)(44832011)(8936002)(478600001)(7416002)(70206006)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 08:54:28.5667
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91a567b6-f4cd-441a-df48-08dafeb1c48a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4111

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


