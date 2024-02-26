Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA77786677B
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 02:20:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685245.1065655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rePes-0004Lp-IR; Mon, 26 Feb 2024 01:19:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685245.1065655; Mon, 26 Feb 2024 01:19:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rePes-0004J1-FO; Mon, 26 Feb 2024 01:19:54 +0000
Received: by outflank-mailman (input) for mailman id 685245;
 Mon, 26 Feb 2024 01:19:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fECz=KD=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rePer-0004Iv-S6
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 01:19:53 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20618.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 230c73b8-d445-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 02:19:52 +0100 (CET)
Received: from DM6PR04CA0027.namprd04.prod.outlook.com (2603:10b6:5:334::32)
 by IA1PR12MB6092.namprd12.prod.outlook.com (2603:10b6:208:3ec::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 01:19:47 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:5:334:cafe::4b) by DM6PR04CA0027.outlook.office365.com
 (2603:10b6:5:334::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 01:19:47 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 01:19:46 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 25 Feb
 2024 19:19:46 -0600
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Sun, 25 Feb 2024 19:19:42 -0600
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
X-Inumbo-ID: 230c73b8-d445-11ee-8a58-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e7ClIod9/T+1uLPj74NWlg5VZUwLxUwK+i2tAteqpYaD+SQe46ClpeKIDuO7oeo25lenf8FfLriAzDywCYYt//icJRwjk17VUgtGcNigITM9VysKM//BoTB+4Z2bM+iTR1FeRhd2kR4YrWI/R/r5COt95j/KpP0EfJAvHM4GZI1obmwr59luL5rapDIw2H8yhtQZUsV/ODnySkClTMExDSQ1GYt8MfFC6riYHtS2rX0gBbGKypfpIWurEj9PnWVMkqTYeeEWtd16e+jUZ2tQFGYC4JXQg0NbEHWyI7Qr9OcRVaCNIqCY+/56u1kGgPt6V/eTO64rN/ltMkfabV6PsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SbHROJquyYqurmbhug7zXj703l2PSAlL8189exDZXOA=;
 b=BL24vCh8KL2RX8d0DTfksMMknxn3C+1MG4PyvAkHGhF7yX9F8uf1oDRfMp1gw3ftcx17gb5Qg9WiNQTdyCiGVYXTs7BoeQ+abB3YWFdSXplqKylD6ykUkZxze5GHT7WnF0o9zrOArBEA0MOLQxjPT1ohGUsZz47NItQhneCbmvK1LSRgUKtHAFK4/3g5FpAHdymd8LpvfIIRiOtRvTGNOr/b2gmqfSKbqJXw/nPJ+oa9pzmkAPOUXRlG0/4JRbr8/GWFiKOHM5gAmoa03T0lH2RxBUnllrMSEljR4P2KSNZGVxTF3q4p/ZVfIqCA0DsNcAN+/fr4bfbTusX0NaZwqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SbHROJquyYqurmbhug7zXj703l2PSAlL8189exDZXOA=;
 b=KNzUkG1FueEvtx1+jD24lm5xZ3SAUglMBqV8J4kD3GJQQJZbX2+Y8sKo3fL6UxgfuGnmAiOgUJ6aVRsBDdDUZ8qiyAMzzUN1nEdeAfOrzqjwPWW3CrB7T8kxhrI8jw+sc9eRFJtD5eT/Ag9OyAs5uthr4jLO89wUJVQmXNFKiDg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <xin.wang2@amd.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Alec Kwapis <alec.kwapis@medtronic.com>
Subject: [PATCH] xen/common: Do not allocate magic pages 1:1 for direct mapped domains
Date: Mon, 26 Feb 2024 09:19:35 +0800
Message-ID: <20240226011935.169462-1-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|IA1PR12MB6092:EE_
X-MS-Office365-Filtering-Correlation-Id: 391c704a-55fe-4af5-1076-08dc3669056e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eyn99XQB/SQCOD1e7A2jwMzKjbEdV1qri+tm5VsMuP/YzgHHM6szpAVr1iaY1g3XcjhGCNUc0sB95ZtO0xVwhqTHhAgo4LhHahAxF8hUtDmVVgnz9gf41+PBoLxq9YFgwvSX+lDCDRMds3X841YIWgt7KivAgFLN253Mq+j4uzh+rbfcwj08hqCEG6Z2TlgXwkjYT433lGWXdevf66Ndn2eOwuQK3w6TJLA0YS6uidzzXKELlquCtNDuhfMDJ/UrDVTRs0R/XVa0Wd+7dSl4S5iC4AzT1cmhquTmwO5Or8iZdwvZPg9So4t1wZksDCydjbTNh4ulCRVnumitmwT3oN8nZWXyFgY+3ePMxg04RV+AKFnFPDnAt9H7MTxYe40Kmq5/o5MquP3zo2X1Bod0SWPPxK6/ih98D7Hm0q846r0rL1eCcudIYugQoa+0+w0wveXSdauxcygb3KTXlgcw9MgmEwtt2pwqcQsfEUr9g1fUnJAbDtK9/DJvcrLEbN9hA4Gf7X6UnG0godr6IrsB5k/mgld+RfPx+ghMjZm7FreHetlwkxoQ1Zfowcf4r159FmkXwx7pavn86lF/ds68G+ZCl8pos1InnQNSOTHC48EKD5MaTzoJqUkvqUNB7dRkuo1hyaWawXA0C7rv83tfj7qaJMN7sz+8yJEbM16sbua+1bygqGc9LLQohSLAYU5wCUtLVsyD4/sE8oOmt2AwhytzndPsGUhp5n0pxd1FvyhoRS8VpDTcJ0OwokgtZo8C
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 01:19:46.9395
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 391c704a-55fe-4af5-1076-08dc3669056e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6092

An error message can seen from the init-dom0less application on
direct-mapped 1:1 domains:
```
Allocating magic pages
memory.c:238:d0v0 mfn 0x39000 doesn't belong to d1
Error on alloc magic pages
```

This is because populate_physmap() automatically assumes gfn == mfn
for direct mapped domains. This cannot be true for the magic pages
that are allocated later for Dom0less DomUs from the init-dom0less
helper application executed in Dom0.

Force populate_physmap to take the "normal" memory allocation route for
the magic pages even for 1:1 Dom0less DomUs. This should work as long
as the 1:1 Dom0less DomU doesn't have anything else mapped at the same
guest address as the magic pages:
- gfn 0x39000 address 0x39000000
- gfn 0x39001 address 0x39001000
- gfn 0x39002 address 0x39002000
- gfn 0x39003 address 0x39003000
Create helper is_magic_gpfn() for Arm to assist this and stub helpers
for non-Arm architectures to avoid #ifdef. Move the definition of the
magic pages on Arm to a more common place.

Note that the init-dom0less application of the diffenent Xen version
may allocate all or part of four magic pages for each DomU.

Reported-by: Alec Kwapis <alec.kwapis@medtronic.com>
Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
 tools/libs/guest/xg_dom_arm.c   |  6 ------
 xen/arch/arm/include/asm/mm.h   | 13 +++++++++++++
 xen/arch/ppc/include/asm/mm.h   |  5 +++++
 xen/arch/riscv/include/asm/mm.h |  6 ++++++
 xen/arch/x86/include/asm/mm.h   |  5 +++++
 xen/common/memory.c             |  2 +-
 xen/include/public/arch-arm.h   |  6 ++++++
 7 files changed, 36 insertions(+), 7 deletions(-)

diff --git a/tools/libs/guest/xg_dom_arm.c b/tools/libs/guest/xg_dom_arm.c
index 2fd8ee7ad4..8c579d7576 100644
--- a/tools/libs/guest/xg_dom_arm.c
+++ b/tools/libs/guest/xg_dom_arm.c
@@ -25,12 +25,6 @@
 
 #include "xg_private.h"
 
-#define NR_MAGIC_PAGES 4
-#define CONSOLE_PFN_OFFSET 0
-#define XENSTORE_PFN_OFFSET 1
-#define MEMACCESS_PFN_OFFSET 2
-#define VUART_PFN_OFFSET 3
-
 #define LPAE_SHIFT 9
 
 #define PFN_4K_SHIFT  (0)
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index cbcf3bf147..17149b4635 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -428,6 +428,19 @@ static inline void page_set_xenheap_gfn(struct page_info *p, gfn_t gfn)
     } while ( (y = cmpxchg(&p->u.inuse.type_info, x, nx)) != x );
 }
 
+#define MAGIC_PAGE_N_GPFN(n)     ((GUEST_MAGIC_BASE >> PAGE_SHIFT) + n)
+static inline bool is_magic_gpfn(xen_pfn_t gpfn)
+{
+    unsigned int i;
+    for ( i = 0; i < NR_MAGIC_PAGES; i++ )
+    {
+        if ( gpfn == MAGIC_PAGE_N_GPFN(i) )
+            return true;
+    }
+
+    return false;
+}
+
 #endif /*  __ARCH_ARM_MM__ */
 /*
  * Local variables:
diff --git a/xen/arch/ppc/include/asm/mm.h b/xen/arch/ppc/include/asm/mm.h
index a433936076..8ad81d9552 100644
--- a/xen/arch/ppc/include/asm/mm.h
+++ b/xen/arch/ppc/include/asm/mm.h
@@ -256,4 +256,9 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
     return true;
 }
 
+static inline bool is_magic_gpfn(xen_pfn_t gpfn)
+{
+    return false;
+}
+
 #endif /* _ASM_PPC_MM_H */
diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 07c7a0abba..a376a77e29 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -3,6 +3,7 @@
 #ifndef _ASM_RISCV_MM_H
 #define _ASM_RISCV_MM_H
 
+#include <public/xen.h>
 #include <asm/page-bits.h>
 
 #define pfn_to_paddr(pfn) ((paddr_t)(pfn) << PAGE_SHIFT)
@@ -20,4 +21,9 @@ unsigned long calc_phys_offset(void);
 
 void turn_on_mmu(unsigned long ra);
 
+static inline bool is_magic_gpfn(xen_pfn_t gpfn)
+{
+    return false;
+}
+
 #endif /* _ASM_RISCV_MM_H */
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 7d26d9cd2f..f385f36d78 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -628,4 +628,9 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
     return (mfn + nr) <= (virt_to_mfn(eva - 1) + 1);
 }
 
+static inline bool is_magic_gpfn(xen_pfn_t gpfn)
+{
+    return false;
+}
+
 #endif /* __ASM_X86_MM_H__ */
diff --git a/xen/common/memory.c b/xen/common/memory.c
index b3b05c2ec0..ab4bad79e2 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -219,7 +219,7 @@ static void populate_physmap(struct memop_args *a)
         }
         else
         {
-            if ( is_domain_direct_mapped(d) )
+            if ( is_domain_direct_mapped(d) && !is_magic_gpfn(gpfn) )
             {
                 mfn = _mfn(gpfn);
 
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index a25e87dbda..58aa6ff05b 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -476,6 +476,12 @@ typedef uint64_t xen_callback_t;
 #define GUEST_MAGIC_BASE  xen_mk_ullong(0x39000000)
 #define GUEST_MAGIC_SIZE  xen_mk_ullong(0x01000000)
 
+#define NR_MAGIC_PAGES 4
+#define CONSOLE_PFN_OFFSET 0
+#define XENSTORE_PFN_OFFSET 1
+#define MEMACCESS_PFN_OFFSET 2
+#define VUART_PFN_OFFSET 3
+
 #define GUEST_RAM_BANKS   2
 
 /*
-- 
2.34.1


