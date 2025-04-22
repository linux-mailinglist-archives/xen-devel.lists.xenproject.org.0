Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1420AA96FEB
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 17:07:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962761.1353951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7FDW-0001Uv-Gm; Tue, 22 Apr 2025 15:07:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962761.1353951; Tue, 22 Apr 2025 15:07:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7FDW-0001RM-D2; Tue, 22 Apr 2025 15:07:22 +0000
Received: by outflank-mailman (input) for mailman id 962761;
 Tue, 22 Apr 2025 15:07:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BiSK=XI=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1u7FDU-0008SP-8g
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 15:07:20 +0000
Received: from 7.mo561.mail-out.ovh.net (7.mo561.mail-out.ovh.net
 [46.105.57.200]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7bd5597b-1f8b-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 17:07:18 +0200 (CEST)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.109.148.7])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4Zhlvp1ZgRz1bl7
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 15:07:18 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-2rjjd (unknown [10.110.96.65])
 by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 7D1F31FECD;
 Tue, 22 Apr 2025 15:07:17 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.109])
 by ghost-submission-5b5ff79f4f-2rjjd with ESMTPSA
 id LdyRDaWwB2htQAEAITd0qQ
 (envelope-from <sergii.dmytruk@3mdeb.com>); Tue, 22 Apr 2025 15:07:17 +0000
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
X-Inumbo-ID: 7bd5597b-1f8b-11f0-9ffb-bf95429c2676
Authentication-Results:garm.ovh; auth=pass (GARM-109S003a3e5d368-64c5-4915-82bc-18f6a6b58197,
                    7E508E014E7E7C169EB13C6E22C3C4EBF1F0FDD7) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH 05/21] x86/boot/slaunch_early: early TXT checks and boot data retrieval
Date: Tue, 22 Apr 2025 18:06:39 +0300
Message-ID: <86c2de54e0ebcd1632b921c56858cc77eba51ee1.1745172094.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
References: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12728861399315887260
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegtdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgvrhhgihhiucffmhihthhruhhkuceoshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpefhheefheduieelieekfffgfffgfedutdevleevvdfhfffgledvgfdtuddtheefieenucfkphepuddvjedrtddrtddruddpudejiedrudduuddrudekuddrudejkedpfeejrdehledrudegvddruddtleenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehiedumgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=sDqAgp/M0rnx3UyLlpBLSL73Y4pMrP7a5rwyrX+6GX8=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1745334438; v=1;
 b=Zuu/Of5ekkE/TpMsCupV07C79TRv0Y+ECiG3wE2Tn188knJG6/3dQHIdUr3k8aGZ49d24LhE
 apO9r32EhL8IhIA5bYTgdjlDZ2SkqBik7e11/noVBmGyhjmaejzqSNmZVZbxnr52eaQEfHtQz7Z
 lNHxT5lO3PVllnrhc1xwirbqSPsc4st9hOeQlCb/AKgx57s+loVoqotajp9lwKbUcLB2E+Y1880
 pA4bpxf4uX/vjWSP4yrDKrok4G/OGDYCl2Z+FG118lioYHOqmAPQDzmBR4l3vlCGjUGkCgf/CVa
 IjJOS/us1lUhu7ukKvMKNIKrgigivggJIs/hNMQgzEyxQ==

From: Krystian Hebel <krystian.hebel@3mdeb.com>

The tests validate that important parts of memory are protected against
DMA attacks, including Xen and MBI. Modules can be tested later, when it
is possible to report issues to a user before invoking TXT reset.

TPM event log validation is temporarily disabled due to an issue with
its allocation by bootloader (GRUB) which will need to be modified to
address this. Ultimately event log will also have to be validated early
as it is used immediately after these tests to hold MBI measurements.
See larger comment in txt_verify_pmr_ranges().

Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---
 xen/arch/x86/boot/slaunch_early.c    |   6 ++
 xen/arch/x86/include/asm/intel_txt.h | 111 +++++++++++++++++++++++++++
 2 files changed, 117 insertions(+)

diff --git a/xen/arch/x86/boot/slaunch_early.c b/xen/arch/x86/boot/slaunch_early.c
index 177267248f..af8aa29ae0 100644
--- a/xen/arch/x86/boot/slaunch_early.c
+++ b/xen/arch/x86/boot/slaunch_early.c
@@ -22,10 +22,13 @@ void slaunch_early_init(uint32_t load_base_addr,
     void *txt_heap;
     struct txt_os_mle_data *os_mle;
     struct slr_table *slrt;
+    struct txt_os_sinit_data *os_sinit;
     struct slr_entry_intel_info *intel_info;
+    uint32_t size = tgt_end_addr - tgt_base_addr;
 
     txt_heap = txt_init();
     os_mle = txt_os_mle_data_start(txt_heap);
+    os_sinit = txt_os_sinit_data_start(txt_heap);
 
     result->slrt_pa = os_mle->slrt;
     result->mbi_pa = 0;
@@ -38,4 +41,7 @@ void slaunch_early_init(uint32_t load_base_addr,
         return;
 
     result->mbi_pa = intel_info->boot_params_base;
+
+    txt_verify_pmr_ranges(os_mle, os_sinit, intel_info,
+                          load_base_addr, tgt_base_addr, size);
 }
diff --git a/xen/arch/x86/include/asm/intel_txt.h b/xen/arch/x86/include/asm/intel_txt.h
index b973640c56..7170baf6fb 100644
--- a/xen/arch/x86/include/asm/intel_txt.h
+++ b/xen/arch/x86/include/asm/intel_txt.h
@@ -81,6 +81,8 @@
 
 #ifndef __ASSEMBLY__
 
+#include <xen/slr_table.h>
+
 /* Need to differentiate between pre- and post paging enabled. */
 #ifdef __EARLY_SLAUNCH__
 #include <xen/macros.h>
@@ -285,4 +287,113 @@ static inline void *txt_init(void)
     return txt_heap;
 }
 
+static inline int is_in_pmr(struct txt_os_sinit_data *os_sinit, uint64_t base,
+                            uint32_t size, int check_high)
+{
+    /* Check for size overflow. */
+    if ( base + size < base )
+        txt_reset(SLAUNCH_ERROR_INTEGER_OVERFLOW);
+
+    /* Low range always starts at 0, so its size is also end address. */
+    if ( base >= os_sinit->vtd_pmr_lo_base &&
+         base + size <= os_sinit->vtd_pmr_lo_size )
+        return 1;
+
+    if ( check_high && os_sinit->vtd_pmr_hi_size != 0 )
+    {
+        if ( os_sinit->vtd_pmr_hi_base + os_sinit->vtd_pmr_hi_size <
+             os_sinit->vtd_pmr_hi_size )
+            txt_reset(SLAUNCH_ERROR_INTEGER_OVERFLOW);
+        if ( base >= os_sinit->vtd_pmr_hi_base &&
+             base + size <= os_sinit->vtd_pmr_hi_base +
+                            os_sinit->vtd_pmr_hi_size )
+            return 1;
+    }
+
+    return 0;
+}
+
+static inline void txt_verify_pmr_ranges(struct txt_os_mle_data *os_mle,
+                                         struct txt_os_sinit_data *os_sinit,
+                                         struct slr_entry_intel_info *info,
+                                         uint32_t load_base_addr,
+                                         uint32_t tgt_base_addr,
+                                         uint32_t xen_size)
+{
+    int check_high_pmr = 0;
+
+    /* Verify the value of the low PMR base. It should always be 0. */
+    if ( os_sinit->vtd_pmr_lo_base != 0 )
+        txt_reset(SLAUNCH_ERROR_LO_PMR_BASE);
+
+    /*
+     * Low PMR size should not be 0 on current platforms. There is an ongoing
+     * transition to TPR-based DMA protection instead of PMR-based; this is not
+     * yet supported by the code.
+     */
+    if ( os_sinit->vtd_pmr_lo_size == 0 )
+        txt_reset(SLAUNCH_ERROR_LO_PMR_SIZE);
+
+    /* Check if regions overlap. Treat regions with no hole between as error. */
+    if ( os_sinit->vtd_pmr_hi_size != 0 &&
+         os_sinit->vtd_pmr_hi_base <= os_sinit->vtd_pmr_lo_size )
+        txt_reset(SLAUNCH_ERROR_HI_PMR_BASE);
+
+    /* All regions accessed by 32b code must be below 4G. */
+    if ( os_sinit->vtd_pmr_hi_base + os_sinit->vtd_pmr_hi_size <=
+         0x100000000ull )
+        check_high_pmr = 1;
+
+    /*
+     * ACM checks that TXT heap and MLE memory is protected against DMA. We have
+     * to check if MBI and whole Xen memory is protected. The latter is done in
+     * case bootloader failed to set whole image as MLE and to make sure that
+     * both pre- and post-relocation code is protected.
+     */
+
+    /* Check if all of Xen before relocation is covered by PMR. */
+    if ( !is_in_pmr(os_sinit, load_base_addr, xen_size, check_high_pmr) )
+        txt_reset(SLAUNCH_ERROR_LO_PMR_MLE);
+
+    /* Check if all of Xen after relocation is covered by PMR. */
+    if ( load_base_addr != tgt_base_addr &&
+         !is_in_pmr(os_sinit, tgt_base_addr, xen_size, check_high_pmr) )
+        txt_reset(SLAUNCH_ERROR_LO_PMR_MLE);
+
+    /*
+     * If present, check that MBI is covered by PMR. MBI starts with 'uint32_t
+     * total_size'.
+     */
+    if ( info->boot_params_base != 0 &&
+         !is_in_pmr(os_sinit, info->boot_params_base,
+                    *(uint32_t *)(uintptr_t)info->boot_params_base,
+                    check_high_pmr) )
+        txt_reset(SLAUNCH_ERROR_BUFFER_BEYOND_PMR);
+
+    /* Check if TPM event log (if present) is covered by PMR. */
+    /*
+     * FIXME: currently commented out as GRUB allocates it in a hole between
+     * PMR and reserved RAM, due to 2MB resolution of PMR. There are no other
+     * easy-to-use DMA protection mechanisms that would allow to protect that
+     * part of memory. TPR (TXT DMA Protection Range) gives 1MB resolution, but
+     * it still wouldn't be enough.
+     *
+     * One possible solution would be for GRUB to allocate log at lower address,
+     * but this would further increase memory space fragmentation. Another
+     * option is to align PMR up instead of down, making PMR cover part of
+     * reserved region, but it is unclear what the consequences may be.
+     *
+     * In tboot this issue was resolved by reserving leftover chunks of memory
+     * in e820 and/or UEFI memory map. This is also a valid solution, but would
+     * require more changes to GRUB than the ones listed above, as event log is
+     * allocated much earlier than PMRs.
+     */
+    /*
+    if ( os_mle->evtlog_addr != 0 && os_mle->evtlog_size != 0 &&
+         !is_in_pmr(os_sinit, os_mle->evtlog_addr, os_mle->evtlog_size,
+                    check_high_pmr) )
+        txt_reset(SLAUNCH_ERROR_BUFFER_BEYOND_PMR);
+    */
+}
+
 #endif /* __ASSEMBLY__ */
-- 
2.49.0


