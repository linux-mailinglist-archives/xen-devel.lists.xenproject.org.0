Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2A15FF883
	for <lists+xen-devel@lfdr.de>; Sat, 15 Oct 2022 07:08:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.423246.669853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojZPh-0007NK-IZ; Sat, 15 Oct 2022 05:08:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 423246.669853; Sat, 15 Oct 2022 05:08:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojZPh-0007Kr-Dm; Sat, 15 Oct 2022 05:08:45 +0000
Received: by outflank-mailman (input) for mailman id 423246;
 Sat, 15 Oct 2022 05:08:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q/I2=2Q=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1ojZPe-00070V-VK
 for xen-devel@lists.xenproject.org; Sat, 15 Oct 2022 05:08:42 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2046.outbound.protection.outlook.com [40.107.95.46])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6eb883b0-4c47-11ed-91b4-6bf2151ebd3b;
 Sat, 15 Oct 2022 07:08:41 +0200 (CEST)
Received: from DS7PR07CA0024.namprd07.prod.outlook.com (2603:10b6:5:3af::6) by
 MN2PR12MB4189.namprd12.prod.outlook.com (2603:10b6:208:1d8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Sat, 15 Oct
 2022 05:08:37 +0000
Received: from CY4PEPF0000B8EB.namprd05.prod.outlook.com
 (2603:10b6:5:3af:cafe::35) by DS7PR07CA0024.outlook.office365.com
 (2603:10b6:5:3af::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30 via Frontend
 Transport; Sat, 15 Oct 2022 05:08:37 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000B8EB.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5676.13 via Frontend Transport; Sat, 15 Oct 2022 05:08:36 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Sat, 15 Oct
 2022 00:08:34 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 14 Oct
 2022 22:08:19 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Sat, 15 Oct 2022 00:08:18 -0500
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
X-Inumbo-ID: 6eb883b0-4c47-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jjuDUwzM4P8rdlW/Q59R3VctBTf3fSxrkjAaDuyfIIOPHgNyuE8aiajZ3pfS+IPQ/oDBwOSJhwkyX1HvGqPYOCf0TRzwcNAX1uSkeX1BGV2tLGjzZKTzcuU4UnStnJi0lIJIpujAYtzF5KYucblHCFdi9/jtTYZuRLCEN7RmZtOag36l10t7iA5VjToKZDSBoAhk2zxWSOB3XU3/fNM7zBgGh/J5bt5mZ66Eql4FaEN4ORbHFaOjlDrvo+7HK4eMvpuTQM2zjtmF1SPpfpJk61sm8sRAZcm7W8L5i+ECZeFuEdMtGVwS/D19RfnMO0WiBZ04LWmgHZUTK07NSIRY3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X1NjHZ0yK62G8GNTviz6TNax2Ydr/8jixQjnLhYwxRk=;
 b=b6KRnSiF04SkRJHWN0y8HaSpfmgjPMl+ue+BHfKFkGWVluDdfnFw5EgO88WU9NfRoncW1SRkBitkzfg3KXij9D/0xdPPXEgTIrzl8wBA9CEsnyn94+9oQ62+k5d3B7Z5zQICkFsIeHdk+zGk9hpRdrahABQ22cItApSR68QqPQ6SQp9XOPvS4LlqDNzafQuZZ3hgNVu5dTuA+oO3HobL2yNUKpV6VcQH1YINz9Yl8P/M8lrenHpuHfmh/tAj6NX/ORHsJGg64DCzSntreCip6oBU93o5mApQvE+C++Wb7/xIrcEYG+47nV3CNZPCIo34VfUJGQFk0OCXXtVcMo3jkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1NjHZ0yK62G8GNTviz6TNax2Ydr/8jixQjnLhYwxRk=;
 b=VyHrTKyxgfHrV7MfmlaMcln28pd8M6hHs5jNvzd1xYOGkHkKrQ6y05Kvegwo+ce1GCSzmRcqh37wfER0igSRaiI+0mx0ObGvPwMZAw4fz6aTKDYdJ1SjHI7zTtP5Qxy5jk13aHk4BaSpzZXldBDP9BoPBe1EkQHpUkAiP0Z1IGs=
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
 Durrant" <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>, "Marcel
 Apfelbaum" <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>, Eduardo Habkost
	<eduardo@habkost.net>, "open list:X86 Xen CPUs"
	<xen-devel@lists.xenproject.org>
Subject: [PATCH v1 05/12] hw/i386/xen/xen-hvm: create arch_handle_ioreq and arch_xen_set_memory
Date: Fri, 14 Oct 2022 22:07:43 -0700
Message-ID: <20221015050750.4185-6-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221015050750.4185-1-vikram.garhwal@amd.com>
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000B8EB:EE_|MN2PR12MB4189:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b0db0a7-9113-42c1-03d1-08daae6b510e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OpAkJZDynduWIcH8nKIzHHqOevCssvJYuJ7dOPT+tivdqhoButvdm8LsQKaMOmVXWJeEJH9fOyX+2XDih8/6NN8yqbovlH9VnLKsX78F+CmTI3gCJA2dlFlRK3+/nR9dVfBv7/MQMi9GOLvjrrAxGLV//6lpaem2bp4aCJVKa0PnSJUEScNaLqew1wz8Q10KYoNFlCSXN3t8sc/Q95/LIEUNlsQ8Rmx8IUOdJCFM4Z2G5uEWf+qmL6tGT0WpZP31cYDd6DhQBsa8d7psqeFHHMaSv9nBqMcX0XtnULriK1ECgOq8gJXoxkXNj1NFNAj+FA2kiwyCubdmUBhzEv53XkUn69Twbw4R1v5cvq+CYLG4DNRGW64ihzOnQAlL6EAHqQLQSIWPeCRhpJZknS1ZcgN8/nSYPVpgM3rO6FuzyB+Atx5C2XIkpakSs9TOsBfQkNM7dYbjISgX20wtWgzVC1PAeztXm467cSDUU5I5TeF3E6u3kyK+PaGLwS1R/6AW7832t9D7N2t1cSELZuEjBAeh21y9b4VgF8eJSj3z+Wjr4dgLt/J4gJkocXC6iXGIOdpT0UZmSV8Wfxu4noxfG+HvNr3DAjRRcsHZSTJcwKjYhKlfTqZPe5MIzZCkwQ9wedlbai6+kS4DyOKKaI0K45cBU9FOg4sHQXh7i2zFevovOYetlGyWJZIaEua0gSJJUMv+jWDEKhhcmjnnw7VToX42T2zMrsXwZ4QBKcHWan7I0rODMR4w5yyPLacfrRKenK05vCUIdPGR5eq7j3nMHFbxDcqQ4CzRoUS4P2i/xBWvcV4n1zRHBI8zziYMCQLi
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(396003)(376002)(451199015)(36840700001)(40470700004)(46966006)(336012)(44832011)(7416002)(186003)(5660300002)(8936002)(2906002)(2616005)(1076003)(26005)(41300700001)(356005)(82310400005)(81166007)(82740400003)(86362001)(40460700003)(40480700001)(83380400001)(47076005)(426003)(36756003)(36860700001)(316002)(478600001)(6916009)(54906003)(6666004)(8676002)(4326008)(70586007)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2022 05:08:36.9234
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b0db0a7-9113-42c1-03d1-08daae6b510e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000B8EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4189

From: Stefano Stabellini <stefano.stabellini@amd.com>

In preparation to moving most of xen-hvm code to an arch-neutral location,
move the x86-specific portion of xen_set_memory to arch_xen_set_memory.

Also move handle_vmport_ioreq to arch_handle_ioreq.

NOTE: This patch breaks the build. Next patch fixes the build issue.
Reason behind creating this patch is because there is lot of new code addition
and pure code movement done for enabling Xen on ARM. Keeping the this patch
separate is done to make it easier to review.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 hw/i386/xen/xen-hvm.c          | 97 ++++++++++++++++++++--------------
 include/hw/i386/xen_arch_hvm.h | 10 ++++
 include/hw/xen/arch_hvm.h      |  3 ++
 3 files changed, 70 insertions(+), 40 deletions(-)
 create mode 100644 include/hw/i386/xen_arch_hvm.h
 create mode 100644 include/hw/xen/arch_hvm.h

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index e169de16c4..3cd1808f9d 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -34,6 +34,7 @@
 #include "trace.h"
 
 #include <xen/hvm/ioreq.h>
+#include "hw/xen/arch_hvm.h"
 #include <xen/hvm/e820.h>
 
 //#define DEBUG_XEN_HVM
@@ -476,10 +477,6 @@ static void xen_set_memory(struct MemoryListener *listener,
                            bool add)
 {
     XenIOState *state = container_of(listener, XenIOState, memory_listener);
-    hwaddr start_addr = section->offset_within_address_space;
-    ram_addr_t size = int128_get64(section->size);
-    bool log_dirty = memory_region_is_logging(section->mr, DIRTY_MEMORY_VGA);
-    hvmmem_type_t mem_type;
 
     if (section->mr == &ram_memory) {
         return;
@@ -492,38 +489,7 @@ static void xen_set_memory(struct MemoryListener *listener,
                                      section);
         }
     }
-
-    if (!memory_region_is_ram(section->mr)) {
-        return;
-    }
-
-    if (log_dirty != add) {
-        return;
-    }
-
-    trace_xen_client_set_memory(start_addr, size, log_dirty);
-
-    start_addr &= TARGET_PAGE_MASK;
-    size = TARGET_PAGE_ALIGN(size);
-
-    if (add) {
-        if (!memory_region_is_rom(section->mr)) {
-            xen_add_to_physmap(state, start_addr, size,
-                               section->mr, section->offset_within_region);
-        } else {
-            mem_type = HVMMEM_ram_ro;
-            if (xen_set_mem_type(xen_domid, mem_type,
-                                 start_addr >> TARGET_PAGE_BITS,
-                                 size >> TARGET_PAGE_BITS)) {
-                DPRINTF("xen_set_mem_type error, addr: "TARGET_FMT_plx"\n",
-                        start_addr);
-            }
-        }
-    } else {
-        if (xen_remove_from_physmap(state, start_addr, size) < 0) {
-            DPRINTF("physmapping does not exist at "TARGET_FMT_plx"\n", start_addr);
-        }
-    }
+    arch_xen_set_memory(state, section, add);
 }
 
 static void xen_region_add(MemoryListener *listener,
@@ -1051,9 +1017,6 @@ static void handle_ioreq(XenIOState *state, ioreq_t *req)
         case IOREQ_TYPE_COPY:
             cpu_ioreq_move(req);
             break;
-        case IOREQ_TYPE_VMWARE_PORT:
-            handle_vmport_ioreq(state, req);
-            break;
         case IOREQ_TYPE_TIMEOFFSET:
             break;
         case IOREQ_TYPE_INVALIDATE:
@@ -1063,7 +1026,7 @@ static void handle_ioreq(XenIOState *state, ioreq_t *req)
             cpu_ioreq_config(state, req);
             break;
         default:
-            hw_error("Invalid ioreq type 0x%x\n", req->type);
+            arch_handle_ioreq(state, req);
     }
     if (req->dir == IOREQ_READ) {
         trace_handle_ioreq_read(req, req->type, req->df, req->data_is_ptr,
@@ -1604,3 +1567,57 @@ void qmp_xen_set_global_dirty_log(bool enable, Error **errp)
         memory_global_dirty_log_stop(GLOBAL_DIRTY_MIGRATION);
     }
 }
+
+void arch_xen_set_memory(XenIOState *state, MemoryRegionSection *section,
+                                bool add)
+{
+    hwaddr start_addr = section->offset_within_address_space;
+    ram_addr_t size = int128_get64(section->size);
+    bool log_dirty = memory_region_is_logging(section->mr, DIRTY_MEMORY_VGA);
+    hvmmem_type_t mem_type;
+
+    if (!memory_region_is_ram(section->mr)) {
+        return;
+    }
+
+    if (log_dirty != add) {
+        return;
+    }
+
+    trace_xen_client_set_memory(start_addr, size, log_dirty);
+
+    start_addr &= TARGET_PAGE_MASK;
+    size = TARGET_PAGE_ALIGN(size);
+
+    if (add) {
+        if (!memory_region_is_rom(section->mr)) {
+            xen_add_to_physmap(state, start_addr, size,
+                               section->mr, section->offset_within_region);
+        } else {
+            mem_type = HVMMEM_ram_ro;
+            if (xen_set_mem_type(xen_domid, mem_type,
+                                 start_addr >> TARGET_PAGE_BITS,
+                                 size >> TARGET_PAGE_BITS)) {
+                DPRINTF("xen_set_mem_type error, addr: "TARGET_FMT_plx"\n",
+                        start_addr);
+            }
+        }
+    } else {
+        if (xen_remove_from_physmap(state, start_addr, size) < 0) {
+            DPRINTF("physmapping does not exist at "TARGET_FMT_plx"\n", start_addr);
+        }
+    }
+}
+
+void arch_handle_ioreq(XenIOState *state, ioreq_t *req)
+{
+    switch (req->type) {
+    case IOREQ_TYPE_VMWARE_PORT:
+            handle_vmport_ioreq(state, req);
+        break;
+    default:
+        hw_error("Invalid ioreq type 0x%x\n", req->type);
+    }
+
+    return;
+}
diff --git a/include/hw/i386/xen_arch_hvm.h b/include/hw/i386/xen_arch_hvm.h
new file mode 100644
index 0000000000..1b2c71ba4f
--- /dev/null
+++ b/include/hw/i386/xen_arch_hvm.h
@@ -0,0 +1,10 @@
+#ifndef HW_XEN_ARCH_I386_HVM_H
+#define HW_XEN_ARCH_I386_HVM_H
+
+#include <xen/hvm/ioreq.h>
+
+void arch_handle_ioreq(XenIOState *state, ioreq_t *req);
+void arch_xen_set_memory(XenIOState *state,
+                         MemoryRegionSection *section,
+                         bool add);
+#endif
diff --git a/include/hw/xen/arch_hvm.h b/include/hw/xen/arch_hvm.h
new file mode 100644
index 0000000000..26674648d8
--- /dev/null
+++ b/include/hw/xen/arch_hvm.h
@@ -0,0 +1,3 @@
+#if defined(TARGET_I386) || defined(TARGET_X86_64)
+#include "hw/i386/xen_arch_hvm.h"
+#endif
-- 
2.17.0


