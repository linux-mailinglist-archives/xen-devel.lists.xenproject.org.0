Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C4FAB5ACC
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 19:10:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983241.1369596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEt9J-0000BP-0C; Tue, 13 May 2025 17:10:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983241.1369596; Tue, 13 May 2025 17:10:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEt9I-00008g-TQ; Tue, 13 May 2025 17:10:36 +0000
Received: by outflank-mailman (input) for mailman id 983241;
 Tue, 13 May 2025 17:10:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dvFL=X5=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uEt5z-0003Uz-Dp
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 17:07:11 +0000
Received: from 8.mo560.mail-out.ovh.net (8.mo560.mail-out.ovh.net
 [188.165.52.147]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b492ec12-301c-11f0-9ffb-bf95429c2676;
 Tue, 13 May 2025 19:07:09 +0200 (CEST)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.109.140.28])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4ZxjZP2y6Jz2CdG
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 17:07:09 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-5c66f (unknown [10.111.182.37])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 4BD881FEB4;
 Tue, 13 May 2025 17:07:08 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.112])
 by ghost-submission-5b5ff79f4f-5c66f with ESMTPSA
 id p/jHNjt8I2jCEgEA7ssCzg
 (envelope-from <sergii.dmytruk@3mdeb.com>); Tue, 13 May 2025 17:07:08 +0000
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
X-Inumbo-ID: b492ec12-301c-11f0-9ffb-bf95429c2676
Authentication-Results:garm.ovh; auth=pass (GARM-112S006ec180afd-be19-4646-b988-8bc4965c371d,
                    0F27B6D195039ACFBDF5EC7F2AC12BEA7E98F15C) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ross Philipson <ross.philipson@oracle.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH v2 16/22] x86/slaunch: process DRTM policy
Date: Tue, 13 May 2025 20:05:53 +0300
Message-ID: <26b47bcf5103017dc997de49904066bedf079b00.1747155790.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
References: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8952311634533528732
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdegieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgvrhhgihhiucffmhihthhruhhkuceoshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpefhheefheduieelieekfffgfffgfedutdevleevvdfhfffgledvgfdtuddtheefieenucfkphepuddvjedrtddrtddruddpudejiedrudduuddrudekuddrudejkedpfeejrdehledrudegvddrudduvdenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehiedtmgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=+X9Z9n8XXZ8AM34FtzeX1HW7feM15Wvjl9iFe+M3iTU=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1747156029; v=1;
 b=MmlD4mpqZ0r3Esi9148NHEB4KN9xanhtz+1g8xQ2FCBSyJNtu1N9BMSpZVZCqelHnE7m6xvG
 JwVVDE7IzD8aiiInSzf03UzInwS1qie+1KLn/0CYZ33qz+h7gcQAueEmQaVYMFDHxq8Mt9pAiqf
 hWjGgxJ58fFmmaC1nySIGX9Yvd6DCE0yMA9VshgI5H9pOmhlF/t0ST19rr6jlkyYGueu3pXLBTQ
 BRS8rEb3zmb+LCRqyHHjVXPEaoSZYQWxhWC+DCYAdA93/Tndu2zRystIXqj80CnVsbyAyApycta
 DGPUDdUTJwPWYwEPsrqMZRFRiOo/V7Q5p4pw9I5TOs0xg==

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
index 4ff1f9c7d5..1f98ec8de1 100644
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
index 8e79d4be23..5d88cec6fc 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1425,6 +1425,13 @@ void asmlinkage __init noreturn __start_xen(void)
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
 
@@ -1446,6 +1453,14 @@ void asmlinkage __init noreturn __start_xen(void)
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
index 5f91fe5ad0..7cc1831f15 100644
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
+static struct slr_entry_policy *__init slr_get_policy(struct slr_table *slrt)
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
+                        struct slr_table *slrt)
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
+check_drtm_policy(struct slr_table *slrt,
+                  struct slr_entry_policy *policy,
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
+    struct slr_table *slrt;
+    struct slr_entry_policy *policy;
+    struct slr_policy_entry *policy_entry;
+    uint16_t i;
+    unsigned int measured;
+
+    slrt = slaunch_get_slrt();
+
+    policy = slr_get_policy(slrt);
+    policy_entry = (struct slr_policy_entry *)
+        ((uint8_t *)policy + sizeof(*policy));
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


