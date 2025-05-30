Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C420AC8FCF
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 15:21:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000995.1381268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKzfb-0000Z0-QT; Fri, 30 May 2025 13:21:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000995.1381268; Fri, 30 May 2025 13:21:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKzfb-0000Wn-NP; Fri, 30 May 2025 13:21:11 +0000
Received: by outflank-mailman (input) for mailman id 1000995;
 Fri, 30 May 2025 13:21:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sDQw=YO=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uKzds-0008Jy-Lg
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 13:19:24 +0000
Received: from 5.mo561.mail-out.ovh.net (5.mo561.mail-out.ovh.net
 [87.98.178.36]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0b6fdb1-3d58-11f0-a2ff-13f23c93f187;
 Fri, 30 May 2025 15:19:18 +0200 (CEST)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.108.25.131])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4b83jd4fctz1fvP
 for <xen-devel@lists.xenproject.org>; Fri, 30 May 2025 13:19:17 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-ptgrr (unknown [10.108.54.144])
 by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 80185C06D1;
 Fri, 30 May 2025 13:19:16 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.113])
 by ghost-submission-5b5ff79f4f-ptgrr with ESMTPSA
 id xqfoDFSwOWio8AAA2loDpw
 (envelope-from <sergii.dmytruk@3mdeb.com>); Fri, 30 May 2025 13:19:16 +0000
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
X-Inumbo-ID: b0b6fdb1-3d58-11f0-a2ff-13f23c93f187
Authentication-Results:garm.ovh; auth=pass (GARM-113S0074fb95b9e-83ce-4588-b545-b055bf4ee8c1,
                    A4E380CC922F0B59227EC5DCC46884561651840B) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ross Philipson <ross.philipson@oracle.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH v3 16/22] x86/slaunch: process DRTM policy
Date: Fri, 30 May 2025 16:17:58 +0300
Message-ID: <8cce3c111a2dceaf4fcf33f8f8d5632a321dfacd.1748611041.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12706061926178534556
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvleduudculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhephfehfeehudeileeikeffgfffgfefuddtveelvedvhfffgfelvdfgtddutdehfeeinecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukeegrddvvddupdefjedrheelrddugedvrdduudefnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheeiudgmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=m5usq3QTRGIaGl8YW2FD4N9j9KXlGN9QTdRCtYRkM1M=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1748611157; v=1;
 b=E5NhPU9p90IfaVvoT6SCTtwm+E5O7xwUynvNJGN/aTYeDda9yZuC1frlOZ4jK62wXEFs043A
 Q+3NN+066PwwZGBFGvqKJHFfRouBIZFmE8mqi3CWY5qZyaxQCR2R1+b0zxJaGGZ4FPFdtkMLa/E
 dmiV+CjH12++6/sy39BzRxehL7w2ePC8lBtRgc5l9CEmCXzNQhHyMFP9Rgt4WRagUMYDPjLqVze
 SM7qQ1H05Ysl0rwM8a04FCtpASNORnBo5wVkQK0xQWVTVlCe/h2wSKajQVJCtnt59J80Y5GXkgq
 QybDRXXD2/WYM77ZNtCt2CokZOP017ej0GRTUTKSXTuYA==

Go through entires in the DRTM policy of SLRT to hash and extend data
that they describe into corresponding PCRs.

Addresses are being zeroed on measuring platform-specific data to
prevent measurements from changing when the only thing that has changed
is an address.  Addresses can vary due to bootloader, firmware or user
doing something differently or just if GRUB gets bigger in size due to
inclusion of more modules and ends up offsetting newly allocated memory.

Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---
 xen/arch/x86/include/asm/slaunch.h |  14 ++
 xen/arch/x86/setup.c               |  15 ++
 xen/arch/x86/slaunch.c             | 213 +++++++++++++++++++++++++++++
 3 files changed, 242 insertions(+)

diff --git a/xen/arch/x86/include/asm/slaunch.h b/xen/arch/x86/include/asm/slaunch.h
index 3b38045864..62ba41d56e 100644
--- a/xen/arch/x86/include/asm/slaunch.h
+++ b/xen/arch/x86/include/asm/slaunch.h
@@ -24,6 +24,8 @@
 #define DLE_EVTYPE_SLAUNCH_START   (DLE_EVTYPE_BASE + 0x103)
 #define DLE_EVTYPE_SLAUNCH_END     (DLE_EVTYPE_BASE + 0x104)
 
+struct boot_info;
+
 /* Indicates an active Secure Launch boot. */
 extern bool slaunch_active;
 
@@ -69,6 +71,18 @@ void slaunch_map_mem_regions(void);
 /* Marks regions of memory as used to avoid their corruption. */
 void slaunch_reserve_mem_regions(void);
 
+/* Measures essential parts of SLR table before making use of them. */
+void slaunch_measure_slrt(void);
+
+/*
+ * Takes measurements of DRTM policy entries except for MBI and SLRT which
+ * should have been measured by the time this is called. Also performs sanity
+ * checks of the policy and panics on failure. In particular, the function
+ * verifies that DRTM is consistent with modules obtained from MultibootInfo
+ * (MBI) and written to struct boot_info in setup.c.
+ */
+void slaunch_process_drtm_policy(const struct boot_info *bi);
+
 /*
  * This helper function is used to map memory using L2 page tables by aligning
  * mapped regions to 2MB. This way page allocator (which at this point isn't
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 87e4693a11..063ac49b8a 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1426,6 +1426,13 @@ void asmlinkage __init noreturn __start_xen(void)
     if ( slaunch_active )
     {
         slaunch_map_mem_regions();
+
+        /*
+         * SLRT needs to be measured here because it is used by init_e820(), the
+         * rest is measured slightly below by slaunch_process_drtm_policy().
+         */
+        slaunch_measure_slrt();
+
         slaunch_reserve_mem_regions();
     }
 
@@ -1447,6 +1454,14 @@ void asmlinkage __init noreturn __start_xen(void)
     /* Create a temporary copy of the E820 map. */
     memcpy(&boot_e820, &e820, sizeof(e820));
 
+    /*
+     * Process all yet unmeasured DRTM entries after E820 initialization to not
+     * do this while memory is uncached (too slow). This must also happen before
+     * modules are relocated or used.
+     */
+    if ( slaunch_active )
+        slaunch_process_drtm_policy(bi);
+
     /* Early kexec reservation (explicit static start address). */
     nr_pages = 0;
     for ( i = 0; i < e820.nr_map; i++ )
diff --git a/xen/arch/x86/slaunch.c b/xen/arch/x86/slaunch.c
index 5f91fe5ad0..2390d0a3f3 100644
--- a/xen/arch/x86/slaunch.c
+++ b/xen/arch/x86/slaunch.c
@@ -9,9 +9,11 @@
 #include <xen/macros.h>
 #include <xen/mm.h>
 #include <xen/types.h>
+#include <asm/bootinfo.h>
 #include <asm/e820.h>
 #include <asm/intel-txt.h>
 #include <asm/page.h>
+#include <asm/processor.h>
 #include <asm/slaunch.h>
 #include <asm/tpm.h>
 
@@ -107,6 +109,217 @@ void __init slaunch_reserve_mem_regions(void)
     }
 }
 
+void __init slaunch_measure_slrt(void)
+{
+    struct slr_table *slrt = slaunch_get_slrt();
+
+    if ( slrt->revision == 1 )
+    {
+        /*
+         * In revision one of the SLRT, only platform-specific info table is
+         * measured.
+         */
+        struct slr_entry_intel_info tmp;
+        struct slr_entry_intel_info *entry;
+
+        entry = (struct slr_entry_intel_info *)
+            slr_next_entry_by_tag(slrt, NULL, SLR_ENTRY_INTEL_INFO);
+        if ( entry == NULL )
+            panic("SLRT is missing Intel-specific information!\n");
+
+        tmp = *entry;
+        tmp.boot_params_base = 0;
+        tmp.txt_heap = 0;
+
+        tpm_hash_extend(DRTM_LOC, DRTM_DATA_PCR, (uint8_t *)&tmp,
+                        sizeof(tmp), DLE_EVTYPE_SLAUNCH, NULL, 0);
+    }
+    else
+    {
+        /*
+         * slaunch_get_slrt() checks that the revision is valid, so we must not get
+         * here unless the code is wrong.
+         */
+        panic("Unhandled SLRT revision: %d!\n", slrt->revision);
+    }
+}
+
+static const struct slr_entry_policy *__init
+slr_get_policy(const struct slr_table *slrt)
+{
+    struct slr_entry_policy *policy;
+
+    policy = (struct slr_entry_policy *)
+        slr_next_entry_by_tag(slrt, NULL, SLR_ENTRY_DRTM_POLICY);
+    if (policy == NULL)
+        panic("SLRT is missing DRTM policy!\n");
+
+    /* XXX: are newer revisions allowed? */
+    if ( policy->revision != SLR_POLICY_REVISION )
+        panic("DRTM policy in SLRT is of unsupported revision: %#04x!\n",
+              slrt->revision);
+
+    return policy;
+}
+
+static void __init
+check_slrt_policy_entry(struct slr_policy_entry *policy_entry,
+                        int idx,
+                        const struct slr_table *slrt)
+{
+    if ( policy_entry->entity_type != SLR_ET_SLRT )
+        panic("Expected DRTM policy entry #%d to describe SLRT, got %#04x!\n",
+              idx, policy_entry->entity_type);
+    if ( policy_entry->pcr != DRTM_DATA_PCR )
+        panic("SLRT was measured to PCR-%d instead of PCR-%d!\n", DRTM_DATA_PCR,
+              policy_entry->pcr);
+    if ( policy_entry->entity != (uint64_t)__pa(slrt) )
+        panic("SLRT address (%#08lx) differs from its DRTM entry (%#08lx)\n",
+              __pa(slrt), policy_entry->entity);
+}
+
+/* Returns number of policy entries that were already measured. */
+static unsigned int __init
+check_drtm_policy(const struct slr_table *slrt,
+                  const struct slr_entry_policy *policy,
+                  struct slr_policy_entry *policy_entry,
+                  const struct boot_info *bi)
+{
+    uint32_t i;
+    uint32_t num_mod_entries;
+
+    if ( policy->nr_entries < 2 )
+        panic("DRTM policy in SLRT contains less than 2 entries (%d)!\n",
+              policy->nr_entries);
+
+    /*
+     * MBI policy entry must be the first one, so that measuring order matches
+     * policy order.
+     */
+    if ( policy_entry[0].entity_type != SLR_ET_MULTIBOOT2_INFO )
+        panic("First entry of DRTM policy in SLRT is not MBI: %#04x!\n",
+              policy_entry[0].entity_type);
+    if ( policy_entry[0].pcr != DRTM_DATA_PCR )
+        panic("MBI was measured to %d instead of %d PCR!\n", DRTM_DATA_PCR,
+              policy_entry[0].pcr);
+
+    /* SLRT policy entry must be the second one. */
+    check_slrt_policy_entry(&policy_entry[1], 1, slrt);
+
+    for ( i = 0; i < bi->nr_modules; i++ )
+    {
+        uint16_t j;
+        const struct boot_module *mod = &bi->mods[i];
+
+        if (mod->relocated || mod->released)
+        {
+            panic("Multiboot module \"%s\" (at %d) was consumed before measurement\n",
+                  (const char *)__va(mod->cmdline_pa), i);
+        }
+
+        for ( j = 2; j < policy->nr_entries; j++ )
+        {
+            if ( policy_entry[j].entity_type != SLR_ET_MULTIBOOT2_MODULE )
+                continue;
+
+            if ( policy_entry[j].entity == mod->start &&
+                 policy_entry[j].size == mod->size )
+                break;
+        }
+
+        if ( j >= policy->nr_entries )
+        {
+            panic("Couldn't find Multiboot module \"%s\" (at %d) in DRTM of Secure Launch\n",
+                  (const char *)__va(mod->cmdline_pa), i);
+        }
+    }
+
+    num_mod_entries = 0;
+    for ( i = 0; i < policy->nr_entries; i++ )
+    {
+        if ( policy_entry[i].entity_type == SLR_ET_MULTIBOOT2_MODULE )
+            num_mod_entries++;
+    }
+
+    if ( bi->nr_modules != num_mod_entries )
+    {
+        panic("Unexpected number of Multiboot modules: %d instead of %d\n",
+              (int)bi->nr_modules, (int)num_mod_entries);
+    }
+
+    /*
+     * MBI was measured in tpm_extend_mbi().
+     * SLRT was measured in tpm_measure_slrt().
+     */
+    return 2;
+}
+
+void __init slaunch_process_drtm_policy(const struct boot_info *bi)
+{
+    const struct slr_table *slrt;
+    const struct slr_entry_policy *policy;
+    struct slr_policy_entry *policy_entry;
+    uint16_t i;
+    unsigned int measured;
+
+    slrt = slaunch_get_slrt();
+
+    policy = slr_get_policy(slrt);
+    policy_entry = (void *)policy + sizeof(*policy);
+
+    measured = check_drtm_policy(slrt, policy, policy_entry, bi);
+    for ( i = 0; i < measured; i++ )
+        policy_entry[i].flags |= SLR_POLICY_FLAG_MEASURED;
+
+    for ( i = measured; i < policy->nr_entries; i++ )
+    {
+        int rc;
+        uint64_t start = policy_entry[i].entity;
+        uint64_t size = policy_entry[i].size;
+
+        /* No already measured entries are expected here. */
+        if ( policy_entry[i].flags & SLR_POLICY_FLAG_MEASURED )
+            panic("DRTM entry at %d was measured out of order!\n", i);
+
+        switch ( policy_entry[i].entity_type )
+        {
+        case SLR_ET_MULTIBOOT2_INFO:
+            panic("Duplicated MBI entry in DRTM of Secure Launch at %d\n", i);
+        case SLR_ET_SLRT:
+            panic("Duplicated SLRT entry in DRTM of Secure Launch at %d\n", i);
+
+        case SLR_ET_UNSPECIFIED:
+        case SLR_ET_BOOT_PARAMS:
+        case SLR_ET_SETUP_DATA:
+        case SLR_ET_CMDLINE:
+        case SLR_ET_UEFI_MEMMAP:
+        case SLR_ET_RAMDISK:
+        case SLR_ET_MULTIBOOT2_MODULE:
+        case SLR_ET_TXT_OS2MLE:
+            /* Measure this entry below. */
+            break;
+
+        case SLR_ET_UNUSED:
+            /* Skip this entry. */
+            continue;
+        }
+
+        if ( policy_entry[i].flags & SLR_POLICY_IMPLICIT_SIZE )
+            panic("Unexpected implicitly-sized DRTM entry of Secure Launch at %d (type %d, info: %s)\n",
+                  i, policy_entry[i].entity_type, policy_entry[i].evt_info);
+
+        rc = slaunch_map_l2(start, size);
+        BUG_ON(rc != 0);
+
+        tpm_hash_extend(DRTM_LOC, policy_entry[i].pcr, __va(start), size,
+                        DLE_EVTYPE_SLAUNCH, (uint8_t *)policy_entry[i].evt_info,
+                        strnlen(policy_entry[i].evt_info,
+                                TPM_EVENT_INFO_LENGTH));
+
+        policy_entry[i].flags |= SLR_POLICY_FLAG_MEASURED;
+    }
+}
+
 int __init slaunch_map_l2(unsigned long paddr, unsigned long size)
 {
     unsigned long aligned_paddr = paddr & ~((1ULL << L2_PAGETABLE_SHIFT) - 1);
-- 
2.49.0


