Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E22D9A9701E
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 17:12:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962932.1354131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7FHt-0004E5-Tu; Tue, 22 Apr 2025 15:11:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962932.1354131; Tue, 22 Apr 2025 15:11:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7FHt-0004Ai-PF; Tue, 22 Apr 2025 15:11:53 +0000
Received: by outflank-mailman (input) for mailman id 962932;
 Tue, 22 Apr 2025 15:11:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BiSK=XI=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1u7FDf-0008SP-11
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 15:07:31 +0000
Received: from 20.mo561.mail-out.ovh.net (20.mo561.mail-out.ovh.net
 [178.33.47.94]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 809aa93f-1f8b-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 17:07:26 +0200 (CEST)
Received: from director11.ghost.mail-out.ovh.net (unknown [10.108.17.43])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4Zhlvy1SYxz1bff
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 15:07:26 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-mvlcc (unknown [10.110.101.71])
 by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id AB8761FEDA;
 Tue, 22 Apr 2025 15:07:25 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.98])
 by ghost-submission-5b5ff79f4f-mvlcc with ESMTPSA
 id on18H62wB2g6DAMAc7wzUg
 (envelope-from <sergii.dmytruk@3mdeb.com>); Tue, 22 Apr 2025 15:07:25 +0000
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
X-Inumbo-ID: 809aa93f-1f8b-11f0-9ffb-bf95429c2676
Authentication-Results:garm.ovh; auth=pass (GARM-98R0025029bdf6-a19a-43c1-ab4f-c9279025d592,
                    7E508E014E7E7C169EB13C6E22C3C4EBF1F0FDD7) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH 08/21] x86/intel_txt.c: restore boot MTRRs
Date: Tue, 22 Apr 2025 18:06:42 +0300
Message-ID: <c30b55dbb0151c670a059e1793954db72c20e52c.1745172094.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
References: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12731113198865003676
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegtdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepgeekffeiiedtveekhfdugeffveeigefgleegvdeghefftdetheefueeliedukedvnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukedurddujeekpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehiedumgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=atIJHb5u5BzMaEAqMtxR7F3lNcEkYecLrvOEGcPgaig=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1745334446; v=1;
 b=JmKQN1Ex6ipXU3g+QLVq7J8OWcVlW2MZnYEoDgYOd3PhGi0iW2XDuwKoHB/933w5YcCsig6b
 0YFdfyFA1dibsNFt2wIHlQ2iqJf8LsUY8W5zIdFCNU/GEZE4Vw6sQOHEMhqFMilkHFFtKj/PIOI
 zpUJFd67bzvl6F2CRjVF8oH2OSVLwNlFwN64bM9MbcCRmtjGDcxWEZaICK5kkcslHpwOm3Vt8Be
 BCRm7Zjzq8L5QVP+HzPWtNcO00I5yV/6y1oXYKWplnI2ecjT6w237bjZ/Qn7A29iUU30Rubj2LA
 SiRdwzdArDUapboSYD4izkb5+YdSvVdD5HJ4jNhPVmjvg==

From: Krystian Hebel <krystian.hebel@3mdeb.com>

In preparation for TXT SENTER call, GRUB had to modify MTRR settings
to be UC for everything except SINIT ACM. Old values are restored
from SLRT where they were saved by the bootloader.

Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
Signed-off-by: Michał Żygowski <michal.zygowski@3mdeb.com>
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---
 xen/arch/x86/e820.c                  |  5 ++
 xen/arch/x86/include/asm/intel_txt.h |  3 ++
 xen/arch/x86/intel_txt.c             | 75 ++++++++++++++++++++++++++++
 3 files changed, 83 insertions(+)

diff --git a/xen/arch/x86/e820.c b/xen/arch/x86/e820.c
index ca577c0bde..d105d1918a 100644
--- a/xen/arch/x86/e820.c
+++ b/xen/arch/x86/e820.c
@@ -11,6 +11,8 @@
 #include <asm/mtrr.h>
 #include <asm/msr.h>
 #include <asm/guest.h>
+#include <asm/intel_txt.h>
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
 
diff --git a/xen/arch/x86/include/asm/intel_txt.h b/xen/arch/x86/include/asm/intel_txt.h
index 85ef9f6245..9083260cf9 100644
--- a/xen/arch/x86/include/asm/intel_txt.h
+++ b/xen/arch/x86/include/asm/intel_txt.h
@@ -402,4 +402,7 @@ void txt_map_mem_regions(void);
 /* Marks TXT-specific memory as used to avoid its corruption. */
 void txt_reserve_mem_regions(void);
 
+/* Restores original MTRR values saved by a bootloader before starting DRTM. */
+void txt_restore_mtrrs(bool e820_verbose);
+
 #endif /* __ASSEMBLY__ */
diff --git a/xen/arch/x86/intel_txt.c b/xen/arch/x86/intel_txt.c
index 4a4e404007..8ffcab0e61 100644
--- a/xen/arch/x86/intel_txt.c
+++ b/xen/arch/x86/intel_txt.c
@@ -10,6 +10,8 @@
 #include <xen/types.h>
 #include <asm/e820.h>
 #include <asm/intel_txt.h>
+#include <asm/msr.h>
+#include <asm/mtrr.h>
 #include <asm/slaunch.h>
 
 static uint64_t __initdata txt_heap_base, txt_heap_size;
@@ -100,3 +102,76 @@ void __init txt_reserve_mem_regions(void)
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


