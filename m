Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A257D6DE776
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 00:48:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519968.807113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmMmR-0005BO-Hx; Tue, 11 Apr 2023 22:48:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519968.807113; Tue, 11 Apr 2023 22:48:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmMmR-000595-EH; Tue, 11 Apr 2023 22:48:03 +0000
Received: by outflank-mailman (input) for mailman id 519968;
 Tue, 11 Apr 2023 22:48:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOX4=AC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pmMmP-0004tk-E8
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 22:48:01 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20625.outbound.protection.outlook.com
 [2a01:111:f400:7e88::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e876fe83-d8ba-11ed-8611-37d641c3527e;
 Wed, 12 Apr 2023 00:47:59 +0200 (CEST)
Received: from CYZPR12CA0006.namprd12.prod.outlook.com (2603:10b6:930:8b::22)
 by PH7PR12MB5830.namprd12.prod.outlook.com (2603:10b6:510:1d5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.35; Tue, 11 Apr
 2023 22:47:56 +0000
Received: from CY4PEPF0000C97D.namprd02.prod.outlook.com
 (2603:10b6:930:8b:cafe::d6) by CYZPR12CA0006.outlook.office365.com
 (2603:10b6:930:8b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36 via Frontend
 Transport; Tue, 11 Apr 2023 22:47:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C97D.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.25 via Frontend Transport; Tue, 11 Apr 2023 22:47:55 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 17:47:55 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 17:47:54 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 11 Apr 2023 17:47:53 -0500
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
X-Inumbo-ID: e876fe83-d8ba-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ml8IWApAM/Y+CpPbi26hXoz1YL4wM93WnZqBELl/H4zJX5i5gZPZt2DOponO8axbIp3noPREdbZVku680ZxyyfHNFQmPW6BtMkeTjLYfCUAt9kt4iMV8Y72rNrTy1LLP9o2PHlbmnNzpgniIcGFUDBzE2shlBGaFeWZHr54F4xJbgBEtCnkKNwBsRS/y1Q/550xuYNs/3hMAR5S5O0g3MMqTBKP7OQUPidlmczNMzZI4YO5/g+Wz3keXqq4aO9IxDBK0mrbVwKsGMODjCgRaKdejCxKBBZ20ZqHBMCddJrS1U/10ARozQt+cKYhtdnCf8GcPsqsszEoWzi2kBtzARQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gNOkxasZFjLHtu5kunUMzoJvRLjjI2EYoAqF9wsm5vg=;
 b=lW9OBEfC+geE5ZV8JuGUvImaLGKjHO5xconbE/vP4EhPW9GMouL43COlAOhNyLO69dLnXv2JsXbJfQT7cf9tTUfM+gcZcC4oVirwMyZ00TmtgLGaSmKHZ3lXJyQ3SAHpJK/x96SjNOJH90f8aIiMOOWtGpxNUhtxAX5YhxAeZkoBawFtukWDBs758C79vuO7DaT0hh6r2daxyD/vhn60Y9fB2AYuRUSMEOV9kzOEnRkkc7bXapO1QBNyiQyOlq0SVKIT2u/P6RR+UHopjm60BePnfJfcHCe88cd4d7ugwC5pBSZ4zC3ZqYicH73BhMfnZxezmuXbB5Cop3cicw39nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gNOkxasZFjLHtu5kunUMzoJvRLjjI2EYoAqF9wsm5vg=;
 b=oKegRFjWBYeZxVDIZ+8JT+EP2sK3MNCEH7wS0/YCp3OjDYhRN2qzW38YpxBU7Oo9kXzAymrxv9i/6JmQfXC4TdX6cKfFNmzpAlZytU9k4vstKCym6SVx2WUNQXwSx5KUcsUgFwzKuFRMkT6ZZJJmREmvXZNDEEhnsPvXsm1Ytag=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, <vikram.garhwal@amd.com>,
	<stefano.stabellini@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum
	<marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, "Richard
 Henderson" <richard.henderson@linaro.org>, Eduardo Habkost
	<eduardo@habkost.net>
Subject: [QEMU][PATCH v6 02/10] hw/i386/xen: rearrange xen_hvm_init_pc
Date: Tue, 11 Apr 2023 15:47:38 -0700
Message-ID: <20230411224746.16152-3-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230411224746.16152-1-vikram.garhwal@amd.com>
References: <20230411224746.16152-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C97D:EE_|PH7PR12MB5830:EE_
X-MS-Office365-Filtering-Correlation-Id: dbb9fae0-3dc9-4b6c-28fc-08db3adeca75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1DUA5dfU5ZEonWalEs4FC78dDWo+c5tHirqd+i1O168JJlsmlPIuXgEyTi/NGrKTt7sdxa9Up+mh1cDVTXHlUn8OfHw2gtVSGpkFjMd5ZKrwUiWvOw/EY2/JFQPXfYFGQUn8Ko79yK3o35i/wB4NioiKWdoVwbuw/60BGvLcsoCjxpsB0rFwClgbaofON4E33YMdmyCEsg+4W8JEePvyyKvuAPMGf10tmWo3Zj4fOOiJHMzae2VthQJjN4gEemN+69Bhadw0QwNgnAHZ3zUMmDGTBDdqe5LBr5b/JVAqzUQ/LqFukieK1v8vLjr842DaQG+CzERxkb7+iwwkbvEwb5QW88DH6h68ZxDhQf5q6C3Jq2kQSgWXfdWYyejk4XAUps3g2y+IV+CKitw40RPzsHpsn2Uzu/oWXqQMP7LJJEp/fnpfN1skxwacp1AgvghmWuNAX6FvXb+3KDD6dnLd3zbBT04CKZ5fRmOq0MO9UlbNrDJsNzBCQQtXfIeG6JYsA3CpuHXMyiWnkcZ8bMQ+GZ770DQA5+qfc8GvyGjAgMELqP6X8UqEuI8UOhlx2HgJ+YM7KyXbB0ZmwI6vTQnk43fxBYGiRA9bg3oE3K231yOdbH5d+Bq8lVKaHdXctX00opiGD3TXOY+/h7mks6yeSSRAQMVR1OApryO7aia/m4fU/uFC7E98EEl/mybZHxrtuS9xS1OD3eYY+kum7PQ8iQvcmWGaUYVT+mqLs5qR3LM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(346002)(376002)(451199021)(40470700004)(46966006)(36840700001)(2906002)(86362001)(36756003)(82310400005)(40480700001)(6666004)(2616005)(426003)(83380400001)(186003)(336012)(47076005)(36860700001)(26005)(1076003)(70586007)(478600001)(6916009)(4326008)(316002)(70206006)(40460700003)(7416002)(8936002)(356005)(82740400003)(41300700001)(8676002)(81166007)(5660300002)(44832011)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 22:47:55.5946
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbb9fae0-3dc9-4b6c-28fc-08db3adeca75
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000C97D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5830

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
index 56641a550e..5403ac4b89 100644
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
2.17.0


