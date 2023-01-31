Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 651EA6839A4
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 23:52:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487899.755703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMzUA-0000Tq-Gi; Tue, 31 Jan 2023 22:52:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487899.755703; Tue, 31 Jan 2023 22:52:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMzUA-0000Qq-D5; Tue, 31 Jan 2023 22:52:18 +0000
Received: by outflank-mailman (input) for mailman id 487899;
 Tue, 31 Jan 2023 22:52:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=skZt=54=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pMzU9-0000Ma-AA
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 22:52:17 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e76a9f97-a1b9-11ed-b63b-5f92e7d2e73a;
 Tue, 31 Jan 2023 23:52:14 +0100 (CET)
Received: from DS7PR06CA0047.namprd06.prod.outlook.com (2603:10b6:8:54::27) by
 DM4PR12MB6421.namprd12.prod.outlook.com (2603:10b6:8:b7::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.22; Tue, 31 Jan 2023 22:52:11 +0000
Received: from DM6NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::5e) by DS7PR06CA0047.outlook.office365.com
 (2603:10b6:8:54::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38 via Frontend
 Transport; Tue, 31 Jan 2023 22:52:11 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT046.mail.protection.outlook.com (10.13.172.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.28 via Frontend Transport; Tue, 31 Jan 2023 22:52:11 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 31 Jan
 2023 16:52:10 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 31 Jan
 2023 14:52:10 -0800
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 31 Jan 2023 16:52:09 -0600
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
X-Inumbo-ID: e76a9f97-a1b9-11ed-b63b-5f92e7d2e73a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iivbKjrCXRJvAxBZmTyJVqPLhBfjMWboitslgLPJ2lO340BELTypqO9cMp/kRJNKdyt6C6flRSpb6YPxf4NmGr+715budMdiSNJRTayYMTvm1A4R2wWDl3XMf1sCPsYU+9p7GUxxC9x5IO6ISHCWue8gs4VAeVSt9SBHDhzVlofP69g1Fy6XNXC5YY88gkGlrOx3IxKpOMR/vEhlQjcB5yVrUq6wGHVw0zJfwBgbXWzIQbtoaJwQCmaNWpQoY8Cw/FT1BA8wEXzCjj1OelyBnX6nch3B1jRkY8JYzABcfY92SfhoK8aeAfXGbL7xFEkMGgyEBIEWbqKHTanNMPGzeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQRygdwVbnDYBJcZUcE7RFsjWA1hPALnId6WXnaDoUU=;
 b=i25uaDQ6ERPpGGsrmvccsATGEd3kZZkAQFnENXFCZ5k0wduBxhWd6/Pv5E0mq/W36wX89n2whOp+mc9cSLPvQOMj/0EMQP3punKeQ0dLJ/LKvYgBnLaWDgNRvo08OZDiGNQheWnJQQyIEg8f2DEH8kCv4bwbLXT3EAyndzDvyBnQLqKHBxGFLpaza6b3VmAuohelGHtjoNdXQ3Khbmih1cgsq0F+8I3FDbJ//S8IViJF26klikLKXgd7630S+fvo6AmzCA5i3BpEhRFbNUzqaFaGpQd9ln+D9XP7+zMQ+Z7wkUtWYQkwUpv24GjcVxO2W3GhjSvd1GJO9Mt3RWVaIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQRygdwVbnDYBJcZUcE7RFsjWA1hPALnId6WXnaDoUU=;
 b=JJFRFgOE0KrZ6DGgH1AdXkhPOASDwhy+NQWF6rLv68T5oEOSexmtm8Q7yUCk4WhQm48EM5rHoYLDyyffqX/TqEMfMxCc/AgkpZ9UWcXYVGgWjeagbYegVzKCKEY7/zxtSc7MS4fgQdMUSjilU1UtHVlOEIWvy+tm4psrY+CEXFQ=
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
Subject: [QEMU][PATCH v5 02/10] hw/i386/xen: rearrange xen_hvm_init_pc
Date: Tue, 31 Jan 2023 14:51:41 -0800
Message-ID: <20230131225149.14764-3-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230131225149.14764-1-vikram.garhwal@amd.com>
References: <20230131225149.14764-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT046:EE_|DM4PR12MB6421:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b25cff7-d654-4181-b0c2-08db03ddc9db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kuz7sr/0bMbr3YbKZjuO3tBeSOkJtL0Ws4NIIzwqFreglodeUujDGJIX+X6QoeguFUw+HfzfHKruWNUA7QRWXIj9zCQBP6is4NnOXFRV+dqgO2BYTxz2AT/5ekQISDqqbeLB8VoajMCTzRy+62U4RSq5nMMMKsAc+PfY7zESX/PSwcjqwZ4fj+pVGiV99HsyNZuBF55pObHJFSr0TMx2Y4cAVVX61t3wCE+4tEaomN3B5p6oM2JTL46Gv6oL1uKwMTpyKedfW2dIY/nX46s2pkVDsiAu5dL0jL/jZzRLo4gdLN5ud2K0vj/bySBSHYPzqweg/3bELPjubVFQKE2PoYIzPO0AIZUYVLvwwWgenriPzEzbvtOt3puv81y56aaQmZ3hWOv/pkkr8NPXaNQcxV59/BKVdKSemLXxMWkx94JA9KhlkIniCZJZvDZ6hNXUE0XiIpbMkB5A5gRQTnvF50W/+ELIegO7WKsmS9CH2ZjodE+7adHwsPkvdF/c9fHAihjFc8nry4xm8TjngJ7SCI1V0BOsCusLcNnOlwnhr25qsRdiIp8J8zHuF1i3OTZfXK2i7GX9bSvSixMrz6wMVop/ACZL6gEepp0rKvBPmOTblTsroOnvIqoRMX87zneXZI+RHEyvlFtzktmt6830Qe4ETdvkvNKj9tvmSMek5KOCASJdIqhUAVsTWmabSmO2i2wmZaAU504AjCeF7npJNjqZLJDA8f1CEiFNqUrU2YA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199018)(40470700004)(36840700001)(46966006)(356005)(186003)(26005)(86362001)(81166007)(1076003)(2616005)(36756003)(36860700001)(426003)(83380400001)(336012)(47076005)(6666004)(478600001)(70586007)(54906003)(316002)(5660300002)(4326008)(8676002)(41300700001)(82740400003)(6916009)(2906002)(7416002)(8936002)(44832011)(70206006)(82310400005)(40480700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 22:52:11.1549
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b25cff7-d654-4181-b0c2-08db03ddc9db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6421

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


