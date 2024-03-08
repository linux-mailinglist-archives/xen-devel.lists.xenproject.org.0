Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CE1875C2C
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 02:55:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690078.1075769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riPRy-0002zt-OF; Fri, 08 Mar 2024 01:55:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690078.1075769; Fri, 08 Mar 2024 01:55:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riPRy-0002wF-Hg; Fri, 08 Mar 2024 01:55:06 +0000
Received: by outflank-mailman (input) for mailman id 690078;
 Fri, 08 Mar 2024 01:55:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OTfa=KO=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1riPRw-0002aR-RK
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 01:55:04 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2416::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e172b442-dcee-11ee-afda-a90da7624cb6;
 Fri, 08 Mar 2024 02:55:04 +0100 (CET)
Received: from CH0PR08CA0003.namprd08.prod.outlook.com (2603:10b6:610:33::8)
 by DS0PR12MB7701.namprd12.prod.outlook.com (2603:10b6:8:133::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.27; Fri, 8 Mar
 2024 01:55:00 +0000
Received: from CH3PEPF0000000C.namprd04.prod.outlook.com
 (2603:10b6:610:33:cafe::86) by CH0PR08CA0003.outlook.office365.com
 (2603:10b6:610:33::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24 via Frontend
 Transport; Fri, 8 Mar 2024 01:54:59 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF0000000C.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Fri, 8 Mar 2024 01:54:59 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 7 Mar
 2024 19:54:56 -0600
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 7 Mar 2024 19:54:53 -0600
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
X-Inumbo-ID: e172b442-dcee-11ee-afda-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ret327N92ICMcm5oO0QKCrm/ZGhpRc9Ov+6+EkyJys/G6X5ThsABN+bJH+bT4KOSEize8/BbZ/WlId0fUZAYJfG0FDe01pS5cNn49LqlXMbfT3OlgFs8GDbig9taY4QX7Aa05BiJLCHumrN+fO+7aUq29h77OL6Zlcy6KCnwG/NFm/Fbpiq3OTzwWXuPATrXPpTf4d2N8TIbvw9JPn/HwLYrBKnkFP6CJmbTpxLX4Tew0nrRkcZV9VvoLPNNBdpt8EsKiXFXgpllhdJK+FstdkbXEOaw9FAFGCMOwmlRCKMZ+8HTYPuz9zUOiqOfR3tZ/pG4Z103zbvT/K5t0oJOHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5JLhDJckjBrTEJORORb//VfOB3M3GRvGRS0zsUFs98o=;
 b=X9Ko+PlWhRCOGTRjKwWC2G3ooiAE7PsLeEkTdqlg3A2SlAOQ6i806P2PehNJ5grMqX2xwlFeRTUKGEWPXbB2OzyAhvJmAEEERyem2Bgh/kFUGNqoaP2e7Tv3QH/b7ecwbtYMYV3tfDht/CKQTELRBY3Orc/uttRMV+xUmNegIXFj6CsRkqKNSQciPbAIkFmlEgQxskyHf1exOuPsAnD0YfcGDblncRTKZIF+SU4Pc5i4eGJUOlr+nFUQrR+DtZMEJEpCn8S+iP/AlSl27d7Q4NlBlBhPqN+wQGPDsPKJMhH33q8LcjBBtdGA1gxQ6vZHUOaN5mDGeSE1+vLqSRfPvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5JLhDJckjBrTEJORORb//VfOB3M3GRvGRS0zsUFs98o=;
 b=2jweelHA3iyHSHrP52YxQ1iTT1+9WZ253Y4xc//KG0h8hDjD9JXJrPROKyfyolK9kJ4Jqp2k5kOba1v/LsQFjbb/2uZILLqUmErnBPNy73igtkUBrrZs0GL3kWPcL+ZP4elwKWvx1a1LHnqWWcWg8SNDU/otU2aFhyVXbmOikmo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <xin.wang2@amd.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Alec Kwapis
	<alec.kwapis@medtronic.com>
Subject: [PATCH v2 3/5] xen/domctl, tools: Introduce a new domctl to get guest memory map
Date: Fri, 8 Mar 2024 09:54:33 +0800
Message-ID: <20240308015435.4044339-4-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240308015435.4044339-1-xin.wang2@amd.com>
References: <20240308015435.4044339-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000C:EE_|DS0PR12MB7701:EE_
X-MS-Office365-Filtering-Correlation-Id: 179b062c-8f68-4748-b45c-08dc3f12c319
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7ktN1Z/K0/PgOFfDzVGPYbkEwXDvsudwHWbVk5xAddK+aZqrG5MqmLLmQLfYihXrml7NrFtd1lwBipWl8nruMsVtZMPj9NFTCKHiDHHsNIM5/YaKn0jgajBCdnQ9PfJi+fo9BjzlxFdX92wSRis6pKImaTlPzhesQSoN7pwrVHMsaY2O46vSgzxzOatUse4CvsgdcE/pLMRXAyAIzXzi0/HnNgbZ95/9bsCKX3fG0hT9Ij24nGcRw9KnQTUk6kQ2QMYrTbC7S7s370rSf7BZRRxaFJgJpAowhiAVRXr+svZUQ26JjvbTfZqAZMKDFev9WNaHCAxqVu1xWbCglHP0o7CHGHI8PiQp1OaqGt2L7cweMCdfDKeu7hZgKp1iLJUUW8IuUe/x/nbNgJzyMLGNVWVWMxO2Uvd4KzO2lG6syh8w9RW/Mofc1CvilpvJyy0ddBWZnSiO5V+RWKpXa45+ADujIflTx7Vz2qLYgCo89azwkE5IXRDv0p2O9dNNdFbmo6AvaZd0Sm9KyE9NIhE2ACHrzdbw9vqzLvWTsyYbRzlLZL45QwJPWviF2N9BR3Wrn8r+fpIa2pvZ5nMHV5R3oKz50CzsDBr/PZyFtQkT+px98bBAeCxmqs/AK2zPD5RCahXMl7NgyyIS8M7OAYiQ47lVFo3wXM4VHe3C2Y58eGZuzIjIDvPTOjiqjirRuD3Lw7iMDmgHT1hrG3r9OQjiK7cTFDoSZ4DmDEoLGvCiWm3cYc3zisNWKhvuMLFgUHOA
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(376005)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 01:54:59.4345
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 179b062c-8f68-4748-b45c-08dc3f12c319
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7701

There are some use cases where the toolstack needs to know the guest
memory map. For example, the toolstack helper application
"init-dom0less" needs to know the guest magic page regions for 1:1
direct-mapped dom0less DomUs to allocate magic pages.

To address such needs, add XEN_DOMCTL_get_mem_map hypercall and
related data structures to query the hypervisor for the guest memory
map. The guest memory map is recorded in the domain structure and
currently only guest magic page region is recorded in the guest
memory map. The guest magic page region is initialized at the domain
creation time as the layout in the public header, and it is updated
for 1:1 dom0less DomUs (see the following commit) to avoid conflict
with RAM.

Take the opportunity to drop an unnecessary empty line to keep the
coding style consistent in the file.

Reported-by: Alec Kwapis <alec.kwapis@medtronic.com>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
v2:
- New patch
RFC: I think the newly introduced "struct xen_domctl_mem_map" is
quite duplicated with "struct xen_memory_map", any comment on reuse
the "struct xen_memory_map" for simplicity?
---
 tools/include/xenctrl.h           |  4 ++++
 tools/libs/ctrl/xc_domain.c       | 32 +++++++++++++++++++++++++++++++
 xen/arch/arm/domain.c             |  6 ++++++
 xen/arch/arm/domctl.c             | 19 +++++++++++++++++-
 xen/arch/arm/include/asm/domain.h |  8 ++++++++
 xen/include/public/arch-arm.h     |  4 ++++
 xen/include/public/domctl.h       | 21 ++++++++++++++++++++
 7 files changed, 93 insertions(+), 1 deletion(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 2ef8b4e054..b25e9772a2 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1195,6 +1195,10 @@ int xc_domain_setmaxmem(xc_interface *xch,
                         uint32_t domid,
                         uint64_t max_memkb);
 
+int xc_get_domain_mem_map(xc_interface *xch, uint32_t domid,
+                          struct xen_mem_region mem_regions[],
+                          uint32_t *nr_regions);
+
 int xc_domain_set_memmap_limit(xc_interface *xch,
                                uint32_t domid,
                                unsigned long map_limitkb);
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index f2d9d14b4d..64b46bdfb4 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -697,6 +697,38 @@ int xc_domain_setmaxmem(xc_interface *xch,
     return do_domctl(xch, &domctl);
 }
 
+int xc_get_domain_mem_map(xc_interface *xch, uint32_t domid,
+                          struct xen_mem_region mem_regions[],
+                          uint32_t *nr_regions)
+{
+    int rc;
+    struct xen_domctl domctl = {
+        .cmd         = XEN_DOMCTL_get_mem_map,
+        .domain      = domid,
+        .u.mem_map = {
+            .nr_mem_regions = *nr_regions,
+        },
+    };
+
+    DECLARE_HYPERCALL_BOUNCE(mem_regions,
+                             sizeof(xen_mem_region_t) * (*nr_regions),
+                             XC_HYPERCALL_BUFFER_BOUNCE_OUT);
+
+    if ( !mem_regions || xc_hypercall_bounce_pre(xch, mem_regions) ||
+         (*nr_regions) < 1 )
+        return -1;
+
+    set_xen_guest_handle(domctl.u.mem_map.buffer, mem_regions);
+
+    rc = do_domctl(xch, &domctl);
+
+    xc_hypercall_bounce_post(xch, mem_regions);
+
+    *nr_regions = domctl.u.mem_map.nr_mem_regions;
+
+    return rc;
+}
+
 #if defined(__i386__) || defined(__x86_64__)
 int xc_domain_set_memory_map(xc_interface *xch,
                                uint32_t domid,
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 5e7a7f3e7e..54f3601ab0 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -696,6 +696,7 @@ int arch_domain_create(struct domain *d,
 {
     unsigned int count = 0;
     int rc;
+    struct mem_map_domain *mem_map = &d->arch.mem_map;
 
     BUILD_BUG_ON(GUEST_MAX_VCPUS < MAX_VIRT_CPUS);
 
@@ -785,6 +786,11 @@ int arch_domain_create(struct domain *d,
     d->arch.sve_vl = config->arch.sve_vl;
 #endif
 
+    mem_map->regions[mem_map->nr_mem_regions].start = GUEST_MAGIC_BASE;
+    mem_map->regions[mem_map->nr_mem_regions].size = GUEST_MAGIC_SIZE;
+    mem_map->regions[mem_map->nr_mem_regions].type = GUEST_MEM_REGION_MAGIC;
+    mem_map->nr_mem_regions++;
+
     return 0;
 
 fail:
diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
index ad56efb0f5..92024bcaa0 100644
--- a/xen/arch/arm/domctl.c
+++ b/xen/arch/arm/domctl.c
@@ -148,7 +148,6 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
 
         return 0;
     }
-
     case XEN_DOMCTL_vuart_op:
     {
         int rc;
@@ -176,6 +175,24 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
 
         return rc;
     }
+    case XEN_DOMCTL_get_mem_map:
+    {
+        int rc;
+        /*
+         * Cap the number of regions to the minimum value between toolstack and
+         * hypervisor to avoid overflowing the buffer.
+         */
+        uint32_t nr_regions = min(d->arch.mem_map.nr_mem_regions,
+                                  domctl->u.mem_map.nr_mem_regions);
+
+        if ( copy_to_guest(domctl->u.mem_map.buffer,
+                           d->arch.mem_map.regions,
+                           nr_regions) ||
+             __copy_to_guest(u_domctl, domctl, 1) )
+            rc = -EFAULT;
+
+        return rc;
+    }
     default:
         return subarch_do_domctl(domctl, d, u_domctl);
     }
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index f1d72c6e48..a559a9e499 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -10,6 +10,7 @@
 #include <asm/gic.h>
 #include <asm/vgic.h>
 #include <asm/vpl011.h>
+#include <public/domctl.h>
 #include <public/hvm/params.h>
 
 struct hvm_domain
@@ -59,6 +60,11 @@ struct paging_domain {
     unsigned long p2m_total_pages;
 };
 
+struct mem_map_domain {
+    unsigned int nr_mem_regions;
+    struct xen_mem_region regions[XEN_MAX_MEM_REGIONS];
+};
+
 struct arch_domain
 {
 #ifdef CONFIG_ARM_64
@@ -77,6 +83,8 @@ struct arch_domain
 
     struct paging_domain paging;
 
+    struct mem_map_domain mem_map;
+
     struct vmmio vmmio;
 
     /* Continuable domain_relinquish_resources(). */
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index a25e87dbda..a06eaf2dab 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -420,6 +420,10 @@ typedef uint64_t xen_callback_t;
  * should instead use the FDT.
  */
 
+/* Guest memory region types */
+#define GUEST_MEM_REGION_DEFAULT    0
+#define GUEST_MEM_REGION_MAGIC      1
+
 /* Physical Address Space */
 
 /* Virtio MMIO mappings */
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index a33f9ec32b..77bf999651 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -946,6 +946,25 @@ struct xen_domctl_paging_mempool {
     uint64_aligned_t size; /* Size in bytes. */
 };
 
+#define XEN_MAX_MEM_REGIONS 1
+
+struct xen_mem_region {
+    uint64_t start;
+    uint64_t size;
+    unsigned int type;
+};
+typedef struct xen_mem_region xen_mem_region_t;
+DEFINE_XEN_GUEST_HANDLE(xen_mem_region_t);
+
+struct xen_domctl_mem_map {
+    /* IN & OUT */
+    uint32_t nr_mem_regions;
+    /* OUT */
+    XEN_GUEST_HANDLE(xen_mem_region_t) buffer;
+};
+typedef struct xen_domctl_mem_map xen_domctl_mem_map_t;
+DEFINE_XEN_GUEST_HANDLE(xen_domctl_mem_map_t);
+
 #if defined(__i386__) || defined(__x86_64__)
 struct xen_domctl_vcpu_msr {
     uint32_t         index;
@@ -1277,6 +1296,7 @@ struct xen_domctl {
 #define XEN_DOMCTL_vmtrace_op                    84
 #define XEN_DOMCTL_get_paging_mempool_size       85
 #define XEN_DOMCTL_set_paging_mempool_size       86
+#define XEN_DOMCTL_get_mem_map                   87
 #define XEN_DOMCTL_gdbsx_guestmemio            1000
 #define XEN_DOMCTL_gdbsx_pausevcpu             1001
 #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
@@ -1339,6 +1359,7 @@ struct xen_domctl {
         struct xen_domctl_vuart_op          vuart_op;
         struct xen_domctl_vmtrace_op        vmtrace_op;
         struct xen_domctl_paging_mempool    paging_mempool;
+        struct xen_domctl_mem_map           mem_map;
         uint8_t                             pad[128];
     } u;
 };
-- 
2.34.1


