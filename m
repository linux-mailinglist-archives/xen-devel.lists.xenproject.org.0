Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AACCCAB5AD4
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 19:11:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983299.1369665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEtA2-00046B-FF; Tue, 13 May 2025 17:11:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983299.1369665; Tue, 13 May 2025 17:11:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEtA2-00042f-C3; Tue, 13 May 2025 17:11:22 +0000
Received: by outflank-mailman (input) for mailman id 983299;
 Tue, 13 May 2025 17:11:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dvFL=X5=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uEt5a-0003Mm-Bj
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 17:06:46 +0000
Received: from 6.mo576.mail-out.ovh.net (6.mo576.mail-out.ovh.net
 [46.105.50.107]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a642e806-301c-11f0-9eb6-5ba50f476ded;
 Tue, 13 May 2025 19:06:45 +0200 (CEST)
Received: from director2.ghost.mail-out.ovh.net (unknown [10.108.9.136])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4ZxjYx2fwnz1vvL
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 17:06:45 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-q2zpp (unknown [10.108.54.144])
 by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 97F541FE68;
 Tue, 13 May 2025 17:06:44 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.109])
 by ghost-submission-5b5ff79f4f-q2zpp with ESMTPSA
 id d2EBFSR8I2hnAAAAOMNtBw
 (envelope-from <sergii.dmytruk@3mdeb.com>); Tue, 13 May 2025 17:06:44 +0000
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
X-Inumbo-ID: a642e806-301c-11f0-9eb6-5ba50f476ded
Authentication-Results:garm.ovh; auth=pass (GARM-109S003cd6ad599-b8b8-4bf1-b0db-ca82d73d54a9,
                    0F27B6D195039ACFBDF5EC7F2AC12BEA7E98F15C) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ross Philipson <ross.philipson@oracle.com>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH v2 08/22] x86/slaunch: restore boot MTRRs after Intel TXT DRTM
Date: Tue, 13 May 2025 20:05:45 +0300
Message-ID: <6448e4a7535d4f74f7559e14e13c8d531cac71a0.1747155790.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
References: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8945556237201618076
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdegieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepgeekffeiiedtveekhfdugeffveeigefgleegvdeghefftdetheefueeliedukedvnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukedurddujeekpdefjedrheelrddugedvrddutdelnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheejiegmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=nB7H7bO1BJ1ApmWbD/4F5x9yGu79QzObrwHjfTYg4+c=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1747156005; v=1;
 b=Yom0lwoxH0pn1G+ymjpkZJQZOSZ3mtc9IlAvv8W2QSarlH4ihT2SiRvkRbuMH4yC1rT1q9R9
 Kl4oMrM1izbpV9vv5bnk+M8QfSzsNRDetCpya3wo2ht/OXFhV7zyAJZUYXiVd6N6fU0KgTTYeXG
 ZoXbgTsMrtf+e0B2127NPm6WRu02ekitchp62Tp3EJHmHJnezpOOut02WbbDseVJisqD15nnI2d
 mQOEmT5mbWV0nBpWPRmol01UlAA9oEF8Zs0FgyB1aAo8x/4CniiJEyIR0HH+X2vCGFLVWOdk9ND
 r8LZ+1pnTZKv0zIiops1Fa/I0JblPLz2QmorAvZMyg7FA==

From: Krystian Hebel <krystian.hebel@3mdeb.com>

In preparation for TXT SENTER call, GRUB had to modify MTRR settings
to be UC for everything except SINIT ACM. Old values are restored
from SLRT where they were saved by the bootloader.

Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
Signed-off-by: Michał Żygowski <michal.zygowski@3mdeb.com>
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---
 xen/arch/x86/e820.c                  |  5 ++
 xen/arch/x86/include/asm/intel-txt.h |  3 ++
 xen/arch/x86/intel-txt.c             | 75 ++++++++++++++++++++++++++++
 3 files changed, 83 insertions(+)

diff --git a/xen/arch/x86/e820.c b/xen/arch/x86/e820.c
index ca577c0bde..60f00e5259 100644
--- a/xen/arch/x86/e820.c
+++ b/xen/arch/x86/e820.c
@@ -11,6 +11,8 @@
 #include <asm/mtrr.h>
 #include <asm/msr.h>
 #include <asm/guest.h>
+#include <asm/intel-txt.h>
+#include <asm/slaunch.h>
 
 /*
  * opt_mem: Limit maximum address of physical RAM.
@@ -442,6 +444,9 @@ static uint64_t __init mtrr_top_of_ram(void)
     ASSERT(paddr_bits);
     addr_mask = ((1ULL << paddr_bits) - 1) & PAGE_MASK;
 
+    if ( slaunch_active )
+        txt_restore_mtrrs(e820_verbose);
+
     rdmsrl(MSR_MTRRcap, mtrr_cap);
     rdmsrl(MSR_MTRRdefType, mtrr_def);
 
diff --git a/xen/arch/x86/include/asm/intel-txt.h b/xen/arch/x86/include/asm/intel-txt.h
index 0126f56a6c..f0ec580558 100644
--- a/xen/arch/x86/include/asm/intel-txt.h
+++ b/xen/arch/x86/include/asm/intel-txt.h
@@ -405,6 +405,9 @@ void txt_map_mem_regions(void);
 /* Marks TXT-specific memory as used to avoid its corruption. */
 void txt_reserve_mem_regions(void);
 
+/* Restores original MTRR values saved by a bootloader before starting DRTM. */
+void txt_restore_mtrrs(bool e820_verbose);
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* ASM__X86__INTEL_TXT_H */
diff --git a/xen/arch/x86/intel-txt.c b/xen/arch/x86/intel-txt.c
index 67051b0917..92f3e48b49 100644
--- a/xen/arch/x86/intel-txt.c
+++ b/xen/arch/x86/intel-txt.c
@@ -10,6 +10,8 @@
 #include <xen/types.h>
 #include <asm/e820.h>
 #include <asm/intel-txt.h>
+#include <asm/msr.h>
+#include <asm/mtrr.h>
 #include <asm/slaunch.h>
 
 static uint64_t __initdata txt_heap_base, txt_heap_size;
@@ -111,3 +113,76 @@ void __init txt_reserve_mem_regions(void)
                      E820_UNUSABLE);
     BUG_ON(rc == 0);
 }
+
+void __init txt_restore_mtrrs(bool e820_verbose)
+{
+    struct slr_entry_intel_info *intel_info;
+    uint64_t mtrr_cap, mtrr_def, base, mask;
+    unsigned int i;
+    uint64_t def_type;
+    struct mtrr_pausing_state pausing_state;
+
+    rdmsrl(MSR_MTRRcap, mtrr_cap);
+    rdmsrl(MSR_MTRRdefType, mtrr_def);
+
+    if ( e820_verbose )
+    {
+        printk("MTRRs set previously for SINIT ACM:\n");
+        printk(" MTRR cap: %"PRIx64" type: %"PRIx64"\n", mtrr_cap, mtrr_def);
+
+        for ( i = 0; i < (uint8_t)mtrr_cap; i++ )
+        {
+            rdmsrl(MSR_IA32_MTRR_PHYSBASE(i), base);
+            rdmsrl(MSR_IA32_MTRR_PHYSMASK(i), mask);
+
+            printk(" MTRR[%d]: base %"PRIx64" mask %"PRIx64"\n",
+                   i, base, mask);
+        }
+    }
+
+    intel_info = (struct slr_entry_intel_info *)
+        slr_next_entry_by_tag(slaunch_get_slrt(), NULL, SLR_ENTRY_INTEL_INFO);
+
+    if ( (mtrr_cap & 0xFF) != intel_info->saved_bsp_mtrrs.mtrr_vcnt )
+    {
+        printk("Bootloader saved %ld MTRR values, but there should be %ld\n",
+               intel_info->saved_bsp_mtrrs.mtrr_vcnt, mtrr_cap & 0xFF);
+        /* Choose the smaller one to be on the safe side. */
+        mtrr_cap = (mtrr_cap & 0xFF) > intel_info->saved_bsp_mtrrs.mtrr_vcnt ?
+                   intel_info->saved_bsp_mtrrs.mtrr_vcnt : mtrr_cap;
+    }
+
+    def_type = intel_info->saved_bsp_mtrrs.default_mem_type;
+    pausing_state = mtrr_pause_caching();
+
+    for ( i = 0; i < (uint8_t)mtrr_cap; i++ )
+    {
+        base = intel_info->saved_bsp_mtrrs.mtrr_pair[i].mtrr_physbase;
+        mask = intel_info->saved_bsp_mtrrs.mtrr_pair[i].mtrr_physmask;
+        wrmsrl(MSR_IA32_MTRR_PHYSBASE(i), base);
+        wrmsrl(MSR_IA32_MTRR_PHYSMASK(i), mask);
+    }
+
+    pausing_state.def_type = def_type;
+    mtrr_resume_caching(pausing_state);
+
+    if ( e820_verbose )
+    {
+        printk("Restored MTRRs:\n"); /* Printed by caller, mtrr_top_of_ram(). */
+
+        /* If MTRRs are not enabled or WB is not a default type, MTRRs won't be printed */
+        if ( !test_bit(11, &def_type) || ((uint8_t)def_type == X86_MT_WB) )
+        {
+            for ( i = 0; i < (uint8_t)mtrr_cap; i++ )
+            {
+                rdmsrl(MSR_IA32_MTRR_PHYSBASE(i), base);
+                rdmsrl(MSR_IA32_MTRR_PHYSMASK(i), mask);
+                printk(" MTRR[%d]: base %"PRIx64" mask %"PRIx64"\n",
+                       i, base, mask);
+            }
+        }
+    }
+
+    /* Restore IA32_MISC_ENABLES */
+    wrmsrl(MSR_IA32_MISC_ENABLE, intel_info->saved_misc_enable_msr);
+}
-- 
2.49.0


