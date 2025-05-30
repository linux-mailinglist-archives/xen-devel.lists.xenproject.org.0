Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 527C0AC8FB9
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 15:19:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000936.1381158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKzdI-0001FS-LC; Fri, 30 May 2025 13:18:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000936.1381158; Fri, 30 May 2025 13:18:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKzdI-0001CJ-I2; Fri, 30 May 2025 13:18:48 +0000
Received: by outflank-mailman (input) for mailman id 1000936;
 Fri, 30 May 2025 13:18:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sDQw=YO=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uKzdG-0000ql-U2
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 13:18:46 +0000
Received: from 10.mo583.mail-out.ovh.net (10.mo583.mail-out.ovh.net
 [46.105.52.148]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d18b53d-3d58-11f0-b894-0df219b8e170;
 Fri, 30 May 2025 15:18:45 +0200 (CEST)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.109.176.202])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4b83j06CYsz1kgY
 for <xen-devel@lists.xenproject.org>; Fri, 30 May 2025 13:18:44 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-r8s5j (unknown [10.110.168.204])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id B94B4100223;
 Fri, 30 May 2025 13:18:43 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.111])
 by ghost-submission-5b5ff79f4f-r8s5j with ESMTPSA
 id rs9PIzOwOWjQtgAAgydd6Q
 (envelope-from <sergii.dmytruk@3mdeb.com>); Fri, 30 May 2025 13:18:43 +0000
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
X-Inumbo-ID: 9d18b53d-3d58-11f0-b894-0df219b8e170
Authentication-Results:garm.ovh; auth=pass (GARM-111S0054675508b-6510-4009-9374-a7b742f4e717,
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
Subject: [PATCH v3 05/22] x86/boot/slaunch-early: early TXT checks and boot data retrieval
Date: Fri, 30 May 2025 16:17:47 +0300
Message-ID: <a05ef5d70803eb25ab959de011c9717ce9194558.1748611041.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12696773251544298652
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvleduudculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhephfehfeehudeileeikeffgfffgfefuddtveelvedvhfffgfelvdfgtddutdehfeeinecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukeegrddvvddupdefjedrheelrddugedvrdduuddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheekfegmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=Ze8+L6G+0Rc7+4Bq+m7/6vFCoR62w3qclGgLacvIoZA=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1748611124; v=1;
 b=eHQo6MMWNilw9KMr/5ps9HwV90sMmmQb4iCsqFYY6RaZIbnl6BYqwYk2ch/L+oVHP4Cs+DGj
 BRDKLlcBdEXL0aviHBoLHwJ5XRo+yzbyPAMzQvYCcz1tTH9xMgOh5L0xB+OWP2A8pHAyCYKM4M9
 yEIJzoYaZWZH90ES0jz39TDIYF0uayV6RK2cU/oBe9o4DnAsvqvukBd4Jbtv0J9CijBkyNsqphN
 +uYQHoJE5TLiETBh3xa7cCZwUjKHdEAGfOk9yy5IdF0Y9tyEUj1dOpW4LlEAnS1yCeh8MrJkxDM
 N82/v94/hsyo4IMycSoccIQppINRE479nyELIOzOG3XjA==

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
 xen/arch/x86/boot/slaunch-early.c    |   6 ++
 xen/arch/x86/include/asm/intel-txt.h | 112 +++++++++++++++++++++++++++
 2 files changed, 118 insertions(+)

diff --git a/xen/arch/x86/boot/slaunch-early.c b/xen/arch/x86/boot/slaunch-early.c
index c9d364bcd5..662144e42f 100644
--- a/xen/arch/x86/boot/slaunch-early.c
+++ b/xen/arch/x86/boot/slaunch-early.c
@@ -22,10 +22,13 @@ void asmlinkage slaunch_early_init(uint32_t load_base_addr,
     void *txt_heap;
     const struct txt_os_mle_data *os_mle;
     const struct slr_table *slrt;
+    const struct txt_os_sinit_data *os_sinit;
     const struct slr_entry_intel_info *intel_info;
+    uint32_t size = tgt_end_addr - tgt_base_addr;
 
     txt_heap = txt_init();
     os_mle = txt_os_mle_data_start(txt_heap);
+    os_sinit = txt_os_sinit_data_start(txt_heap);
 
     result->slrt_pa = os_mle->slrt;
     result->mbi_pa = 0;
@@ -38,4 +41,7 @@ void asmlinkage slaunch_early_init(uint32_t load_base_addr,
         return;
 
     result->mbi_pa = intel_info->boot_params_base;
+
+    txt_verify_pmr_ranges(os_mle, os_sinit, intel_info,
+                          load_base_addr, tgt_base_addr, size);
 }
diff --git a/xen/arch/x86/include/asm/intel-txt.h b/xen/arch/x86/include/asm/intel-txt.h
index 7658457e9d..122b4293ea 100644
--- a/xen/arch/x86/include/asm/intel-txt.h
+++ b/xen/arch/x86/include/asm/intel-txt.h
@@ -93,6 +93,8 @@
 
 #ifndef __ASSEMBLY__
 
+#include <xen/slr-table.h>
+
 /* Need to differentiate between pre- and post paging enabled. */
 #ifdef __EARLY_SLAUNCH__
 #include <xen/macros.h>
@@ -308,6 +310,116 @@ static inline void *txt_init(void)
     return txt_heap;
 }
 
+static inline int is_in_pmr(const struct txt_os_sinit_data *os_sinit,
+                            uint64_t base, uint32_t size, int check_high)
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
+static inline void txt_verify_pmr_ranges(
+    const struct txt_os_mle_data *os_mle,
+    const struct txt_os_sinit_data *os_sinit,
+    const struct slr_entry_intel_info *info,
+    uint32_t load_base_addr,
+    uint32_t tgt_base_addr,
+    uint32_t xen_size)
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
+         0x100000000ULL )
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
 
 #endif /* X86_INTEL_TXT_H */
-- 
2.49.0


