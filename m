Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8681AC8FCA
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 15:20:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000975.1381229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKzfF-00074M-Kn; Fri, 30 May 2025 13:20:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000975.1381229; Fri, 30 May 2025 13:20:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKzfF-00071l-Gp; Fri, 30 May 2025 13:20:49 +0000
Received: by outflank-mailman (input) for mailman id 1000975;
 Fri, 30 May 2025 13:20:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sDQw=YO=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uKzdO-0008Jy-S3
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 13:18:54 +0000
Received: from 7.mo582.mail-out.ovh.net (7.mo582.mail-out.ovh.net
 [46.105.59.196]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a217e06e-3d58-11f0-a2ff-13f23c93f187;
 Fri, 30 May 2025 15:18:53 +0200 (CEST)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.109.140.39])
 by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4b83j91wPNz1V3B
 for <xen-devel@lists.xenproject.org>; Fri, 30 May 2025 13:18:53 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-jf7jg (unknown [10.110.96.35])
 by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 2563980257;
 Fri, 30 May 2025 13:18:52 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.106])
 by ghost-submission-5b5ff79f4f-jf7jg with ESMTPSA
 id W9soOzuwOWg3twAAMsIQHg
 (envelope-from <sergii.dmytruk@3mdeb.com>); Fri, 30 May 2025 13:18:52 +0000
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
X-Inumbo-ID: a217e06e-3d58-11f0-a2ff-13f23c93f187
Authentication-Results:garm.ovh; auth=pass (GARM-106R00679701ec5-0cea-4536-851d-f45d9eef6760,
                    A4E380CC922F0B59227EC5DCC46884561651840B) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ross Philipson <ross.philipson@oracle.com>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH v3 08/22] x86/slaunch: restore boot MTRRs after Intel TXT DRTM
Date: Fri, 30 May 2025 16:17:50 +0300
Message-ID: <5b6b9bf165a4fd9444dc53848fb8faa2cea30781.1748611041.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12699306524953392284
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvleduudculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepufgvrhhgihhiucffmhihthhruhhkuceoshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeegkeffieeitdevkefhudegffevieeggfelgedvgeehffdtteehfeeuleeiudekvdenucfkphepuddvjedrtddrtddruddpudejiedrudduuddrudekgedrvddvuddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehkedvmgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=wR1hVbpxxN9SQ0YmcXd59qUIZ1ZgOyrRB96NJpE74ts=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1748611133; v=1;
 b=PMvC/81ouczRL8OJeS1H4LvnV8SeaCAuNjd/xU5Yh7XEGSmZGOqtbxQJQGVoekhjaZjNWsy7
 ywWqXeVEcu/tPro4xHpuUGEuwoHsS1fhuEISU57LwjwhqiyHLhphw8w4nmQtFsWoFXArUajhx24
 vs6W6srHf1ZXBrCW7r5IqpJjdjyBGF0jDTa8qu+HDMSGyKj/+mFwwGDN/tx5mVa7/YGNOfWboPK
 gWLFyZ0/CENTGXGeGRpPVZbN8mw9lXP/S5OQHLrB7slBtHqPXCp+FgeJYh4AK0QSdOJc99osmah
 z2yWgMo/vIjX3KFbAdqV0r9dPcgbjAfNRiZNl3jNev+nQ==

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
index ad3c41d86c..0b0bdc1bb2 100644
--- a/xen/arch/x86/include/asm/intel-txt.h
+++ b/xen/arch/x86/include/asm/intel-txt.h
@@ -426,6 +426,9 @@ void txt_map_mem_regions(void);
 /* Marks TXT-specific memory as used to avoid its corruption. */
 void txt_reserve_mem_regions(void);
 
+/* Restores original MTRR values saved by a bootloader before starting DRTM. */
+void txt_restore_mtrrs(bool e820_verbose);
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* X86_INTEL_TXT_H */
diff --git a/xen/arch/x86/intel-txt.c b/xen/arch/x86/intel-txt.c
index 163383b262..0c14d84486 100644
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


