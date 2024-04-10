Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA088A0436
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 01:48:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703703.1099542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruhfV-0000XE-V1; Wed, 10 Apr 2024 23:47:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703703.1099542; Wed, 10 Apr 2024 23:47:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruhfV-0000U3-O4; Wed, 10 Apr 2024 23:47:53 +0000
Received: by outflank-mailman (input) for mailman id 703703;
 Wed, 10 Apr 2024 23:47:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IHON=LP=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1ruhfT-0007t7-Ri
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 23:47:51 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2009::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bccf6886-f794-11ee-94a3-07e782e9044d;
 Thu, 11 Apr 2024 01:47:49 +0200 (CEST)
Received: from BL0PR02CA0130.namprd02.prod.outlook.com (2603:10b6:208:35::35)
 by IA1PR12MB6114.namprd12.prod.outlook.com (2603:10b6:208:3ea::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 23:47:46 +0000
Received: from BL6PEPF0001AB59.namprd02.prod.outlook.com
 (2603:10b6:208:35:cafe::25) by BL0PR02CA0130.outlook.office365.com
 (2603:10b6:208:35::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.19 via Frontend
 Transport; Wed, 10 Apr 2024 23:47:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB59.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Wed, 10 Apr 2024 23:47:46 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 10 Apr
 2024 18:47:45 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 10 Apr
 2024 16:47:44 -0700
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 10 Apr 2024 18:47:44 -0500
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
X-Inumbo-ID: bccf6886-f794-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oCt2VsceRPGGwTVkv5rKIuNY22rB+tt+TW47EClnznBC3nOgzIsEYmXpp1sSjajBekJqfZt2uMAMJ+o03nrsvcjWTz0jS0mfvy96y9NeMcezhMHpeFtwvvjS/g5tfpgHccP/QQ16RECBWOvsGmFJL/GiSogqappvM/n9UdVC41nJIOnrGC6tnr2HwKiFlOS0DaU5aOrKS8VIDmmb3YO56N1BIiV+4nYQavTgUAH12eZ3qDKbXIGzKyAQkcLgMsRb8WMBO2e1+A7KDk4HVnTv0EwQ8eM0s01y3KDbu35lS+luU4ZBuijmdcta02K8Vysb6rJupwnQY46g317lto9Igw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FmOGjAB3JzSfwRzRe/4an+3+taCqNqKKqxNPitif1Ek=;
 b=S3u3WURuG7Kb0kcNbCDaty6TC4cFipGuG2ZXCIo3FBiAY2b7VMF0oPfrWM8zlFFd/hvxo4GojKy6SSEP3c7aFLm0zp0MGHKEpm9iFcGhqIYZ853ZLgb3sYj9exvtbLnBDNwdHBk1VMiGpO5qUqnTAWwsUwFSVqerEij8yzKkKk+EXQEyxO94SLyHyxu7g4uZWSdvyxg+z+wBwGR6R2gPG+Xe+tUU+wx81D/vPkipiY00cfo+WTDDqNh+BwMKufxAPc80/YYbU7JCBUBkDQpyU+Dq7wA+vQGRvi/6qtsT5zRevZVGA0GaFCdiy+MXFhEiHG6jMHR/6e1PSrxr9k+wag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FmOGjAB3JzSfwRzRe/4an+3+taCqNqKKqxNPitif1Ek=;
 b=K1SsA6JVEihBj3CrL87V2rq0ChTuMSYjOmKWIU1nwq6iRJjit75vpvEFIxYH38zN0OPo2mGP2N4Vyj4Pn73tuGMGat9TSU4znSKCWxGXsbInfiLI0yR2BgI1P2AXG8TAZzTYvhn7NVFEcZjaYTuGooXUy/vfVNLsLSqurN4MGaE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <andrew.cooper3@citrix.com>,
	<bertrand.marquis@arm.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<julien@xen.org>, <michal.orzel@amd.com>, <roger.pau@citrix.com>, "Stefano
 Stabellini" <stefano.stabellini@amd.com>
Subject: [PATCH v2 4/4] xen/public: replace remaining int and long
Date: Wed, 10 Apr 2024 16:47:40 -0700
Message-ID: <20240410234740.994001-4-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2404101644130.976094@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2404101644130.976094@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB59:EE_|IA1PR12MB6114:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f58f3be-e1b1-4b97-ab04-08dc59b89f7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Fr4CchXOYuS83nGdBpTLeun5R7IT8jLYTlZlxp9fvt+EYBTn/0ikTSHrpSnnnMVaony15D5rbhGvOHdK+TR4jEGcp4lZ4OrQ0wjZMpWd6HXbPycr1zFAxb/aMcT0/eba5hjI65cNqJemlBFe5hR/1dehY0aPkpKlRPpNm5Hn/8Fu2HMBaNGyJhsolMNJkhzogfi1hDM8QiihrZNa0tFZ/jnF3c1bZQ04HH6O+GPTA2lIV/Kmw+wgaquAZYI3EPBCEWHBuo6AMzmftpTijq+i8psKfVZkGTkPatcaC5nztyMF9dWgyqqXyIk8tAVd+gMmWxfx7WlKwz4LAVVCRREx7BCIkK0+KS7qXNmDNVIOrwX7TetjGpaUCoQkXXzcAQx8fHWi/jlLH5IV9ML7olDxLgBx2M2u+DBZSlqWk8Gc/+bKDbDYpQ+Wx67ejOP0jpkzzx5yhYWgs+2LKA6Atn4RyurExwDd//0R1qo+K2XpuP34CA/LyJ2UATPkjycBTv2M7YNY0Qp/9+NpX1cfn8aKgf1l0yKsnpgGzxR4R+J8UTGJ1WamaNv5xeBTwzyfgTDbRRjCUbrwY3k8kfGZ6/vRcqQdgh5mdUxDP+KGWNCsuAOm1wrCcmNo3P3kZRgQkPBq1ZDzD4WHFo8ZIPoydQSd4HvquQlm60LZZYToFhSF771RVhdlTqLkPuV+ELBT4b5bZERuF1Dcr/R91cC0pRYSfN4/IFlWKJXrCR8cyDOBAAV3D5jz1mrn/MWRiXqhn28R
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(82310400014)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 23:47:46.3901
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f58f3be-e1b1-4b97-ab04-08dc59b89f7c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB59.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6114

Replace all int and long in few remaining x86-specific headers and
x86-specific hypercalls.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 xen/include/public/arch-x86/hvm/save.h   |  4 +-
 xen/include/public/arch-x86/xen-x86_32.h | 10 ++---
 xen/include/public/arch-x86/xen-x86_64.h | 10 ++---
 xen/include/public/arch-x86/xen.h        | 50 ++++++++++++------------
 xen/include/public/xen.h                 | 24 ++++++------
 5 files changed, 49 insertions(+), 49 deletions(-)

diff --git a/xen/include/public/arch-x86/hvm/save.h b/xen/include/public/arch-x86/hvm/save.h
index 7ecacadde1..8e3dfcf439 100644
--- a/xen/include/public/arch-x86/hvm/save.h
+++ b/xen/include/public/arch-x86/hvm/save.h
@@ -415,7 +415,7 @@ struct hvm_hw_pci_irqs {
      * Indexed by: device*4 + INTx#.
      */
     union {
-        unsigned long i[16 / sizeof (unsigned long)]; /* DECLARE_BITMAP(i, 32*4); */
+        xen_ulong_t i[16 / sizeof (xen_ulong_t)]; /* DECLARE_BITMAP(i, 32*4); */
         uint64_t pad[2];
     };
 };
@@ -428,7 +428,7 @@ struct hvm_hw_isa_irqs {
      * Indexed by ISA IRQ (assumes no ISA-device IRQ sharing).
      */
     union {
-        unsigned long i[1];  /* DECLARE_BITMAP(i, 16); */
+        xen_ulong_t i[1];  /* DECLARE_BITMAP(i, 16); */
         uint64_t pad[1];
     };
 };
diff --git a/xen/include/public/arch-x86/xen-x86_32.h b/xen/include/public/arch-x86/xen-x86_32.h
index 9e3bf06b12..0b2671ab65 100644
--- a/xen/include/public/arch-x86/xen-x86_32.h
+++ b/xen/include/public/arch-x86/xen-x86_32.h
@@ -68,7 +68,7 @@
 #define MACH2PHYS_VIRT_END    xen_mk_ulong(__MACH2PHYS_VIRT_END)
 #define MACH2PHYS_NR_ENTRIES  ((MACH2PHYS_VIRT_END-MACH2PHYS_VIRT_START)>>2)
 #ifndef machine_to_phys_mapping
-#define machine_to_phys_mapping ((unsigned long *)MACH2PHYS_VIRT_START)
+#define machine_to_phys_mapping ((xen_ulong_t *)MACH2PHYS_VIRT_START)
 #endif
 
 /* 32-/64-bit invariability for control interfaces (domctl/sysctl). */
@@ -151,14 +151,14 @@ DEFINE_XEN_GUEST_HANDLE(cpu_user_regs_t);
 #define xen_cr3_to_pfn(cr3) (((unsigned)(cr3) >> 12) | ((unsigned)(cr3) << 20))
 
 struct arch_vcpu_info {
-    unsigned long cr2;
-    unsigned long pad[5]; /* sizeof(vcpu_info_t) == 64 */
+    xen_ulong_t cr2;
+    xen_ulong_t pad[5]; /* sizeof(vcpu_info_t) == 64 */
 };
 typedef struct arch_vcpu_info arch_vcpu_info_t;
 
 struct xen_callback {
-    unsigned long cs;
-    unsigned long eip;
+    xen_ulong_t cs;
+    xen_ulong_t eip;
 };
 typedef struct xen_callback xen_callback_t;
 
diff --git a/xen/include/public/arch-x86/xen-x86_64.h b/xen/include/public/arch-x86/xen-x86_64.h
index 43f6e3d220..bd27fc59fe 100644
--- a/xen/include/public/arch-x86/xen-x86_64.h
+++ b/xen/include/public/arch-x86/xen-x86_64.h
@@ -67,7 +67,7 @@
 #define MACH2PHYS_VIRT_END    xen_mk_ulong(__MACH2PHYS_VIRT_END)
 #define MACH2PHYS_NR_ENTRIES  ((MACH2PHYS_VIRT_END-MACH2PHYS_VIRT_START)>>3)
 #ifndef machine_to_phys_mapping
-#define machine_to_phys_mapping ((unsigned long *)HYPERVISOR_VIRT_START)
+#define machine_to_phys_mapping ((xen_ulong_t *)HYPERVISOR_VIRT_START)
 #endif
 
 /*
@@ -198,12 +198,12 @@ DEFINE_XEN_GUEST_HANDLE(cpu_user_regs_t);
 #undef __DECL_REG_LO16
 #undef __DECL_REG_HI
 
-#define xen_pfn_to_cr3(pfn) ((unsigned long)(pfn) << 12)
-#define xen_cr3_to_pfn(cr3) ((unsigned long)(cr3) >> 12)
+#define xen_pfn_to_cr3(pfn) ((xen_ulong_t)(pfn) << 12)
+#define xen_cr3_to_pfn(cr3) ((xen_ulong_t)(cr3) >> 12)
 
 struct arch_vcpu_info {
-    unsigned long cr2;
-    unsigned long pad; /* sizeof(vcpu_info_t) == 64 */
+    xen_ulong_t cr2;
+    xen_ulong_t pad; /* sizeof(vcpu_info_t) == 64 */
 };
 typedef struct arch_vcpu_info arch_vcpu_info_t;
 
diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-x86/xen.h
index a9a87d9b50..90710c1230 100644
--- a/xen/include/public/arch-x86/xen.h
+++ b/xen/include/public/arch-x86/xen.h
@@ -141,7 +141,7 @@ struct trap_info {
     uint8_t       vector;  /* exception vector                              */
     uint8_t       flags;   /* 0-3: privilege level; 4: clear event enable?  */
     uint16_t      cs;      /* code selector                                 */
-    unsigned long address; /* code offset                                   */
+    xen_ulong_t address;   /* code offset                                   */
 };
 typedef struct trap_info trap_info_t;
 DEFINE_XEN_GUEST_HANDLE(trap_info_t);
@@ -174,36 +174,36 @@ struct vcpu_guest_context {
 #define VGCF_syscall_disables_events   (1<<_VGCF_syscall_disables_events)
 #define _VGCF_online                   5
 #define VGCF_online                    (1<<_VGCF_online)
-    unsigned long flags;                    /* VGCF_* flags                 */
-    struct cpu_user_regs user_regs;         /* User-level CPU registers     */
-    struct trap_info trap_ctxt[256];        /* Virtual IDT                  */
-    unsigned long ldt_base, ldt_ents;       /* LDT (linear address, # ents) */
-    unsigned long gdt_frames[16], gdt_ents; /* GDT (machine frames, # ents) */
-    unsigned long kernel_ss, kernel_sp;     /* Virtual TSS (only SS1/SP1)   */
+    xen_ulong_t flags;                    /* VGCF_* flags                 */
+    struct cpu_user_regs user_regs;       /* User-level CPU registers     */
+    struct trap_info trap_ctxt[256];      /* Virtual IDT                  */
+    xen_ulong_t ldt_base, ldt_ents;       /* LDT (linear address, # ents) */
+    xen_ulong_t gdt_frames[16], gdt_ents; /* GDT (machine frames, # ents) */
+    xen_ulong_t kernel_ss, kernel_sp;     /* Virtual TSS (only SS1/SP1)   */
     /* NB. User pagetable on x86/64 is placed in ctrlreg[1]. */
-    unsigned long ctrlreg[8];               /* CR0-CR7 (control registers)  */
-    unsigned long debugreg[8];              /* DB0-DB7 (debug registers)    */
+    xen_ulong_t ctrlreg[8];               /* CR0-CR7 (control registers)  */
+    xen_ulong_t debugreg[8];              /* DB0-DB7 (debug registers)    */
 #ifdef __i386__
-    unsigned long event_callback_cs;        /* CS:EIP of event callback     */
-    unsigned long event_callback_eip;
-    unsigned long failsafe_callback_cs;     /* CS:EIP of failsafe callback  */
-    unsigned long failsafe_callback_eip;
+    xen_ulong_t event_callback_cs;        /* CS:EIP of event callback     */
+    xen_ulong_t event_callback_eip;
+    xen_ulong_t failsafe_callback_cs;     /* CS:EIP of failsafe callback  */
+    xen_ulong_t failsafe_callback_eip;
 #else
-    unsigned long event_callback_eip;
-    unsigned long failsafe_callback_eip;
+    xen_ulong_t event_callback_eip;
+    xen_ulong_t failsafe_callback_eip;
 #ifdef __XEN__
     union {
-        unsigned long syscall_callback_eip;
+        xen_ulong_t syscall_callback_eip;
         struct {
-            unsigned int event_callback_cs;    /* compat CS of event cb     */
-            unsigned int failsafe_callback_cs; /* compat CS of failsafe cb  */
+            uint32_t event_callback_cs;    /* compat CS of event cb     */
+            uint32_t failsafe_callback_cs; /* compat CS of failsafe cb  */
         };
     };
 #else
-    unsigned long syscall_callback_eip;
+    xen_ulong_t syscall_callback_eip;
 #endif
 #endif
-    unsigned long vm_assist;                /* VMASST_TYPE_* bitmap */
+    xen_ulong_t vm_assist;                /* VMASST_TYPE_* bitmap */
 #ifdef __x86_64__
     /* Segment base addresses. */
     uint64_t      fs_base;
@@ -219,7 +219,7 @@ struct arch_shared_info {
      * Number of valid entries in the p2m table(s) anchored at
      * pfn_to_mfn_frame_list_list and/or p2m_vaddr.
      */
-    unsigned long max_pfn;
+    xen_ulong_t max_pfn;
     /*
      * Frame containing list of mfns containing list of mfns containing p2m.
      * A value of 0 indicates it has not yet been set up, ~0 indicates it has
@@ -228,7 +228,7 @@ struct arch_shared_info {
      * is to be used.
      */
     xen_pfn_t     pfn_to_mfn_frame_list_list;
-    unsigned long nmi_reason;
+    xen_ulong_t nmi_reason;
     /*
      * Following three fields are valid if p2m_cr3 contains a value different
      * from 0.
@@ -247,9 +247,9 @@ struct arch_shared_info {
      * Modifying a p2m element in the linear p2m list is allowed via an atomic
      * write only.
      */
-    unsigned long p2m_cr3;         /* cr3 value of the p2m address space */
-    unsigned long p2m_vaddr;       /* virtual address of the p2m list */
-    unsigned long p2m_generation;  /* generation count of p2m mapping */
+    xen_ulong_t p2m_cr3;         /* cr3 value of the p2m address space */
+    xen_ulong_t p2m_vaddr;       /* virtual address of the p2m list */
+    xen_ulong_t p2m_generation;  /* generation count of p2m mapping */
 #ifdef __i386__
     /* There's no room for this field in the generic structure. */
     uint32_t wc_sec_hi;
diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
index b47d48d0e2..2444e752ab 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -430,17 +430,17 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
 
 #ifndef __ASSEMBLY__
 struct mmuext_op {
-    unsigned int cmd; /* => enum mmuext_cmd */
+    uint32_t cmd; /* => enum mmuext_cmd */
     union {
         /* [UN]PIN_TABLE, NEW_BASEPTR, NEW_USER_BASEPTR
          * CLEAR_PAGE, COPY_PAGE, [UN]MARK_SUPER */
         xen_pfn_t     mfn;
         /* INVLPG_LOCAL, INVLPG_ALL, SET_LDT */
-        unsigned long linear_addr;
+        xen_ulong_t linear_addr;
     } arg1;
     union {
         /* SET_LDT */
-        unsigned int nr_ents;
+        uint32_t nr_ents;
         /* TLB_FLUSH_MULTI, INVLPG_MULTI */
 #if __XEN_INTERFACE_VERSION__ >= 0x00030205
         XEN_GUEST_HANDLE(const_void) vcpumask;
@@ -832,8 +832,8 @@ typedef struct shared_info shared_info_t;
 struct start_info {
     /* THE FOLLOWING ARE FILLED IN BOTH ON INITIAL BOOT AND ON RESUME.    */
     char magic[32];             /* "xen-<version>-<platform>".            */
-    unsigned long nr_pages;     /* Total pages allocated to this domain.  */
-    unsigned long shared_info;  /* MACHINE address of shared info struct. */
+    xen_ulong_t nr_pages;     /* Total pages allocated to this domain.  */
+    xen_ulong_t shared_info;  /* MACHINE address of shared info struct. */
     uint32_t flags;             /* SIF_xxx flags.                         */
     xen_pfn_t store_mfn;        /* MACHINE page number of shared page.    */
     uint32_t store_evtchn;      /* Event channel for store communication. */
@@ -848,18 +848,18 @@ struct start_info {
         } dom0;
     } console;
     /* THE FOLLOWING ARE ONLY FILLED IN ON INITIAL BOOT (NOT RESUME).     */
-    unsigned long pt_base;      /* VIRTUAL address of page directory.     */
-    unsigned long nr_pt_frames; /* Number of bootstrap p.t. frames.       */
-    unsigned long mfn_list;     /* VIRTUAL address of page-frame list.    */
-    unsigned long mod_start;    /* VIRTUAL address of pre-loaded module   */
+    xen_ulong_t pt_base;      /* VIRTUAL address of page directory.     */
+    xen_ulong_t nr_pt_frames; /* Number of bootstrap p.t. frames.       */
+    xen_ulong_t mfn_list;     /* VIRTUAL address of page-frame list.    */
+    xen_ulong_t mod_start;    /* VIRTUAL address of pre-loaded module   */
                                 /* (PFN of pre-loaded module if           */
                                 /*  SIF_MOD_START_PFN set in flags).      */
-    unsigned long mod_len;      /* Size (bytes) of pre-loaded module.     */
+    xen_ulong_t mod_len;      /* Size (bytes) of pre-loaded module.     */
 #define MAX_GUEST_CMDLINE 1024
     int8_t cmd_line[MAX_GUEST_CMDLINE];
     /* The pfn range here covers both page table and p->m table frames.   */
-    unsigned long first_p2m_pfn;/* 1st pfn forming initial P->M table.    */
-    unsigned long nr_p2m_frames;/* # of pfns forming initial P->M table.  */
+    xen_ulong_t first_p2m_pfn;/* 1st pfn forming initial P->M table.    */
+    xen_ulong_t nr_p2m_frames;/* # of pfns forming initial P->M table.  */
 };
 typedef struct start_info start_info_t;
 
-- 
2.25.1


