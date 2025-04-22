Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8F8A97018
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 17:11:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962915.1354068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7FHg-0001tx-F4; Tue, 22 Apr 2025 15:11:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962915.1354068; Tue, 22 Apr 2025 15:11:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7FHg-0001nV-9c; Tue, 22 Apr 2025 15:11:40 +0000
Received: by outflank-mailman (input) for mailman id 962915;
 Tue, 22 Apr 2025 15:11:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BiSK=XI=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1u7FE6-0000lQ-6b
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 15:07:58 +0000
Received: from 9.mo575.mail-out.ovh.net (9.mo575.mail-out.ovh.net
 [46.105.78.111]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 926bccc5-1f8b-11f0-9eb0-5ba50f476ded;
 Tue, 22 Apr 2025 17:07:57 +0200 (CEST)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.109.148.164])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4ZhlwX1w9Bz248Y
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 15:07:56 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-nms5s (unknown [10.110.178.134])
 by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id B3A101FEAA;
 Tue, 22 Apr 2025 15:07:55 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.102])
 by ghost-submission-5b5ff79f4f-nms5s with ESMTPSA
 id i36RIsuwB2hUKwEAU17rnA
 (envelope-from <sergii.dmytruk@3mdeb.com>); Tue, 22 Apr 2025 15:07:55 +0000
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
X-Inumbo-ID: 926bccc5-1f8b-11f0-9eb0-5ba50f476ded
Authentication-Results:garm.ovh; auth=pass (GARM-102R004575aa24b-0849-480e-bb35-126f49a28834,
                    7E508E014E7E7C169EB13C6E22C3C4EBF1F0FDD7) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH 19/21] arch/x86: support slaunch with AMD SKINIT
Date: Tue, 22 Apr 2025 18:06:53 +0300
Message-ID: <b576150b342cb94f412cca9830c3f5549a2d071c.1745172094.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
References: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12739557450121852060
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegtdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgvrhhgihhiucffmhihthhruhhkuceoshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpefhheefheduieelieekfffgfffgfedutdevleevvdfhfffgledvgfdtuddtheefieenucfkphepuddvjedrtddrtddruddpudejiedrudduuddrudekuddrudejkedpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehjeehmgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=dN47+FKasGXf+xZ5Qn1PeaSOV8B25eq4lyTXWs7/Yrk=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1745334476; v=1;
 b=khrQcXRWhwYxdTb2OD+/e5SM8HlR7Mk9318iEEMp4LN9x9x8kFkt5TLQxp6P1CTeryGqbp/f
 91NZjPvj2Oueo+5aXYEVlFp6mMDhNF5r1BtQZ9prX5uuluNa8RcG5elD3iKUdd1m5HyjEhYSbsL
 cCero6htrSihhycrUUvLkchwYW84IFkjlX1Qg6P0iexlpkjQPkmGWSbDbQnSW34w3e2CBa5G2iO
 CB3GsCm7f65eQ6vmfN9rHalgMLDRjJ3DIs2SZQo3CxGt9b5S35vM+mqhKZ9pzQEHtwVib0Z6wZt
 LxrAYWHUIMyweXYZgHQ1QOXxHVF6opXNJvKgLt64ItR1w==

This mostly involves not running Intel-specific code when on AMD.

There are only a few new AMD-specific implementation details:
 - finding SLB start and size and then mapping and reserving it in e820
 - managing offset for adding the next TPM log entry (TXT-compatible
   data prepared by SKL is stored inside of vendor data field within TCG
   header)

Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---
 xen/arch/x86/e820.c    |  2 +-
 xen/arch/x86/slaunch.c | 90 ++++++++++++++++++++++++++++++++++--------
 xen/arch/x86/tpm.c     | 68 ++++++++++++++++++++++++++++++-
 3 files changed, 141 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/e820.c b/xen/arch/x86/e820.c
index d105d1918a..177c428883 100644
--- a/xen/arch/x86/e820.c
+++ b/xen/arch/x86/e820.c
@@ -444,7 +444,7 @@ static uint64_t __init mtrr_top_of_ram(void)
     ASSERT(paddr_bits);
     addr_mask = ((1ULL << paddr_bits) - 1) & PAGE_MASK;
 
-    if ( slaunch_active )
+    if ( slaunch_active && boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
         txt_restore_mtrrs(e820_verbose);
 
     rdmsrl(MSR_MTRRcap, mtrr_cap);
diff --git a/xen/arch/x86/slaunch.c b/xen/arch/x86/slaunch.c
index 772971119a..51a488a8e0 100644
--- a/xen/arch/x86/slaunch.c
+++ b/xen/arch/x86/slaunch.c
@@ -17,6 +17,10 @@
 #include <asm/slaunch.h>
 #include <asm/tpm.h>
 
+/* SLB is 64k, 64k-aligned */
+#define SKINIT_SLB_SIZE   0x10000
+#define SKINIT_SLB_ALIGN  0x10000
+
 /*
  * These variables are assigned to by the code near Xen's entry point.
  * slaunch_slrt is not declared in slaunch.h to facilitate accessing the
@@ -38,6 +42,8 @@ struct slr_table *__init slaunch_get_slrt(void)
 
     if (slrt == NULL) {
         int rc;
+        bool intel_cpu = (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL);
+        uint16_t slrt_architecture = intel_cpu ? SLR_INTEL_TXT : SLR_AMD_SKINIT;
 
         slrt = __va(slaunch_slrt);
 
@@ -49,9 +55,9 @@ struct slr_table *__init slaunch_get_slrt(void)
         /* XXX: are newer revisions allowed? */
         if ( slrt->revision != SLR_TABLE_REVISION )
             panic("SLRT is of unsupported revision: %#04x!\n", slrt->revision);
-        if ( slrt->architecture != SLR_INTEL_TXT )
-            panic("SLRT is for unexpected architecture: %#04x!\n",
-                  slrt->architecture);
+        if ( slrt->architecture != slrt_architecture )
+            panic("SLRT is for unexpected architecture: %#04x != %#04x!\n",
+                  slrt->architecture, slrt_architecture);
         if ( slrt->size > slrt->max_size )
             panic("SLRT is larger than its max size: %#08x > %#08x!\n",
                   slrt->size, slrt->max_size);
@@ -66,6 +72,23 @@ struct slr_table *__init slaunch_get_slrt(void)
     return slrt;
 }
 
+static uint32_t __init get_slb_start(void)
+{
+    /*
+     * The runtime computation relies on size being a power of 2 and equal to
+     * alignment. Make sure these assumptions hold.
+     */
+    BUILD_BUG_ON(SKINIT_SLB_SIZE != SKINIT_SLB_ALIGN);
+    BUILD_BUG_ON(SKINIT_SLB_SIZE == 0);
+    BUILD_BUG_ON((SKINIT_SLB_SIZE & (SKINIT_SLB_SIZE - 1)) != 0);
+
+    /*
+     * Rounding any address within SLB down to alignment gives SLB base and
+     * SLRT is inside SLB on AMD.
+     */
+    return slaunch_slrt & ~(SKINIT_SLB_SIZE - 1);
+}
+
 void __init slaunch_map_mem_regions(void)
 {
     int rc;
@@ -76,7 +99,10 @@ void __init slaunch_map_mem_regions(void)
     BUG_ON(rc != 0);
 
     /* Vendor-specific part. */
-    txt_map_mem_regions();
+    if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
+        txt_map_mem_regions();
+    else if ( boot_cpu_data.x86_vendor == X86_VENDOR_AMD )
+        slaunch_map_l2(get_slb_start(), SKINIT_SLB_SIZE);
 
     find_evt_log(slaunch_get_slrt(), &evt_log_addr, &evt_log_size);
     if ( evt_log_addr != NULL )
@@ -94,7 +120,18 @@ void __init slaunch_reserve_mem_regions(void)
     uint32_t evt_log_size;
 
     /* Vendor-specific part. */
-    txt_reserve_mem_regions();
+    if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
+    {
+        txt_reserve_mem_regions();
+    }
+    else if ( boot_cpu_data.x86_vendor == X86_VENDOR_AMD )
+    {
+        uint64_t slb_start = get_slb_start();
+        uint64_t slb_end = slb_start + SKINIT_SLB_SIZE;
+        printk("SLAUNCH: reserving SLB (%#lx - %#lx)\n", slb_start, slb_end);
+        rc = reserve_e820_ram(&e820_raw, slb_start, slb_end);
+        BUG_ON(rc == 0);
+    }
 
     find_evt_log(slaunch_get_slrt(), &evt_log_addr, &evt_log_size);
     if ( evt_log_addr != NULL )
@@ -118,20 +155,41 @@ void __init slaunch_measure_slrt(void)
          * In revision one of the SLRT, only platform-specific info table is
          * measured.
          */
-        struct slr_entry_intel_info tmp;
-        struct slr_entry_intel_info *entry;
+        if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
+        {
+            struct slr_entry_intel_info tmp;
+            struct slr_entry_intel_info *entry;
+
+            entry = (struct slr_entry_intel_info *)
+                slr_next_entry_by_tag(slrt, NULL, SLR_ENTRY_INTEL_INFO);
+            if ( entry == NULL )
+                panic("SLRT is missing Intel-specific information!\n");
 
-        entry = (struct slr_entry_intel_info *)
-            slr_next_entry_by_tag(slrt, NULL, SLR_ENTRY_INTEL_INFO);
-        if ( entry == NULL )
-            panic("SLRT is missing Intel-specific information!\n");
+            tmp = *entry;
+            tmp.boot_params_base = 0;
+            tmp.txt_heap = 0;
 
-        tmp = *entry;
-        tmp.boot_params_base = 0;
-        tmp.txt_heap = 0;
+            tpm_hash_extend(DRTM_LOC, DRTM_DATA_PCR, (uint8_t *)&tmp,
+                            sizeof(tmp), DLE_EVTYPE_SLAUNCH, NULL, 0);
+        }
+        else if ( boot_cpu_data.x86_vendor == X86_VENDOR_AMD )
+        {
+            struct slr_entry_amd_info tmp;
+            struct slr_entry_amd_info *entry;
+
+            entry = (struct slr_entry_amd_info *)
+                slr_next_entry_by_tag(slrt, NULL, SLR_ENTRY_AMD_INFO);
+            if ( entry == NULL )
+                panic("SLRT is missing AMD-specific information!\n");
 
-        tpm_hash_extend(DRTM_LOC, DRTM_DATA_PCR, (uint8_t *)&tmp,
-                        sizeof(tmp), DLE_EVTYPE_SLAUNCH, NULL, 0);
+            tmp = *entry;
+            tmp.next = 0;
+            tmp.slrt_base = 0;
+            tmp.boot_params_base = 0;
+
+            tpm_hash_extend(DRTM_LOC, DRTM_DATA_PCR, (uint8_t *)&tmp,
+                            sizeof(tmp), DLE_EVTYPE_SLAUNCH, NULL, 0);
+        }
     }
     else
     {
diff --git a/xen/arch/x86/tpm.c b/xen/arch/x86/tpm.c
index c51bd9b496..8562296681 100644
--- a/xen/arch/x86/tpm.c
+++ b/xen/arch/x86/tpm.c
@@ -10,6 +10,7 @@
 #include <asm/intel_txt.h>
 #include <asm/slaunch.h>
 #include <asm/tpm.h>
+#include <asm/x86-vendors.h>
 
 #ifdef __EARLY_SLAUNCH__
 
@@ -51,11 +52,31 @@ void *memcpy(void *dest, const void *src, size_t n)
     return dest;
 }
 
+static bool is_amd_cpu(void)
+{
+    /*
+     * asm/processor.h can't be included in early code, which means neither
+     * cpuid() function nor boot_cpu_data can be used here.
+     */
+    uint32_t eax, ebx, ecx, edx;
+    asm volatile ( "cpuid"
+          : "=a" (eax), "=b" (ebx), "=c" (ecx), "=d" (edx)
+          : "0" (0), "c" (0) );
+    return ebx == X86_VENDOR_AMD_EBX
+        && ecx == X86_VENDOR_AMD_ECX
+        && edx == X86_VENDOR_AMD_EDX;
+}
+
 #else   /* __EARLY_SLAUNCH__ */
 
 #include <xen/mm.h>
 #include <xen/pfn.h>
 
+static bool is_amd_cpu(void)
+{
+    return boot_cpu_data.x86_vendor == X86_VENDOR_AMD;
+}
+
 #endif  /* __EARLY_SLAUNCH__ */
 
 #define TPM_LOC_REG(loc, reg)   (0x1000 * (loc) + (reg))
@@ -242,6 +263,21 @@ struct TPM12_PCREvent {
     uint8_t Data[];
 };
 
+struct tpm1_spec_id_event {
+    uint32_t pcrIndex;
+    uint32_t eventType;
+    uint8_t digest[20];
+    uint32_t eventSize;
+    uint8_t signature[16];
+    uint32_t platformClass;
+    uint8_t specVersionMinor;
+    uint8_t specVersionMajor;
+    uint8_t specErrata;
+    uint8_t uintnSize;
+    uint8_t vendorInfoSize;
+    uint8_t vendorInfo[0];  /* variable number of members */
+} __packed;
+
 struct txt_ev_log_container_12 {
     char        Signature[20];      /* "TXT Event Container", null-terminated */
     uint8_t     Reserved[12];
@@ -385,6 +421,16 @@ static void *create_log_event12(struct txt_ev_log_container_12 *evt_log,
 {
     struct TPM12_PCREvent *new_entry;
 
+    if ( is_amd_cpu() )
+    {
+        /*
+         * On AMD, TXT-compatible structure is stored as vendor data of
+         * TCG-defined event log header.
+         */
+        struct tpm1_spec_id_event *spec_id = (void *)evt_log;
+        evt_log = (struct txt_ev_log_container_12 *)&spec_id->vendorInfo[0];
+    }
+
     new_entry = (void *)(((uint8_t *)evt_log) + evt_log->NextEventOffset);
 
     /*
@@ -833,11 +879,29 @@ static uint32_t tpm2_hash_extend(unsigned loc, const uint8_t *buf,
 
 #endif /* __EARLY_SLAUNCH__ */
 
-static struct heap_event_log_pointer_element2_1 *find_evt_log_ext_data(void)
+static struct heap_event_log_pointer_element2_1 *
+find_evt_log_ext_data(struct tpm2_spec_id_event *evt_log)
 {
     struct txt_os_sinit_data *os_sinit;
     struct txt_ext_data_element *ext_data;
 
+    if ( is_amd_cpu() )
+    {
+        /*
+         * Event log pointer is defined by TXT specification, but
+         * secure-kernel-loader provides a compatible structure in vendor data
+         * of the log.
+         */
+        const uint8_t *data_size =
+            (void *)&evt_log->digestSizes[evt_log->digestCount];
+
+        if ( *data_size != sizeof(struct heap_event_log_pointer_element2_1) )
+            return NULL;
+
+        /* Vendor data directly follows one-byte size. */
+        return (void *)(data_size + 1);
+    }
+
     os_sinit = txt_os_sinit_data_start(__va(read_txt_reg(TXTCR_HEAP_BASE)));
     ext_data = (void *)((uint8_t *)os_sinit + sizeof(*os_sinit));
 
@@ -871,7 +935,7 @@ create_log_event20(struct tpm2_spec_id_event *evt_log, uint32_t evt_log_size,
     unsigned i;
     uint8_t *p;
 
-    log_ext_data = find_evt_log_ext_data();
+    log_ext_data = find_evt_log_ext_data(evt_log);
     if ( log_ext_data == NULL )
         return log_hashes;
 
-- 
2.49.0


