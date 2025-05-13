Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B13FAB5ACF
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 19:10:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983249.1369623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEt9N-0000lr-8V; Tue, 13 May 2025 17:10:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983249.1369623; Tue, 13 May 2025 17:10:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEt9N-0000gJ-2G; Tue, 13 May 2025 17:10:41 +0000
Received: by outflank-mailman (input) for mailman id 983249;
 Tue, 13 May 2025 17:10:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dvFL=X5=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uEt65-0003Uz-3n
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 17:07:17 +0000
Received: from 10.mo575.mail-out.ovh.net (10.mo575.mail-out.ovh.net
 [46.105.79.203]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b808cb69-301c-11f0-9ffb-bf95429c2676;
 Tue, 13 May 2025 19:07:15 +0200 (CEST)
Received: from director2.ghost.mail-out.ovh.net (unknown [10.109.140.131])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4ZxjZW1VdFz1wl3
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 17:07:15 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-dvfkr (unknown [10.110.164.235])
 by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 8C40F1FE68;
 Tue, 13 May 2025 17:07:14 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.109])
 by ghost-submission-5b5ff79f4f-dvfkr with ESMTPSA
 id HnomBUJ8I2jxxBEAOV1++g
 (envelope-from <sergii.dmytruk@3mdeb.com>); Tue, 13 May 2025 17:07:14 +0000
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
X-Inumbo-ID: b808cb69-301c-11f0-9ffb-bf95429c2676
Authentication-Results:garm.ovh; auth=pass (GARM-109S0033a991904-3eb6-4068-85c9-331bc12d345b,
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
Subject: [PATCH v2 18/22] x86/boot/slaunch-early: find MBI and SLRT on AMD
Date: Tue, 13 May 2025 20:05:55 +0300
Message-ID: <ddcb7f78641b1a686cf16e47c855d666afb54714.1747155790.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
References: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8954000486706885788
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdegieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgvrhhgihhiucffmhihthhruhhkuceoshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeekudegfeduieegudeijeelleekfedvvdfhheehvefhudekjeeifeegtdduveehtdenucffohhmrghinhephhgvrggurdhssgenucfkphepuddvjedrtddrtddruddpudejiedrudduuddrudekuddrudejkedpfeejrdehledrudegvddruddtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehjeehmgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=yySsErvLYNnWYhNOhBBhYnFBoZFsMFllBN/X8yrHl2s=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1747156035; v=1;
 b=IAUgrFh7F5GxgfDt72R0UBqjTlZF2yuEKotAKvq+W1jT0UbN/T3redg7LWwTuoQnj4elT/oP
 ivhU2XZ5Ht9Plw6CkbNCaAbKUyM3XuT3eh8Kki/Xkqdx8b4wDJdwlr+LAjvWP47h71w+2VhxcFi
 gZ8UBBcGDXO4laWhk6+NUHx+hNnEvxuCZB2QYeDSRKPT61Gdc3/bXGsmGFh3/oQGKnl9jVUueCz
 dDj5YpKUMFUc2lWqJmuv/cRr3q0zCpRJ4wL/wUBEi18EbrBDoHJLJBHErycwVc0C5HGh7lpwJ6j
 AImZZhq5C1ZEGnTwv72agIuOTW/0tbr4cYFjMBGDrKUdw==

Use slr_entry_amd_info::boot_params_base on AMD with SKINIT to get MBI
location.

Another thing of interest is the location of SLRT which is bootloader's
data after SKL.

Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---
 xen/arch/x86/boot/head.S          | 38 ++++++++++++++++----
 xen/arch/x86/boot/slaunch-early.c | 58 +++++++++++++++++++++++++++++++
 2 files changed, 90 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 7376fa85d5..66e1a21033 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -354,10 +354,12 @@ cs32_switch:
         jmp     *%edi
 
         /*
-         * Entry point for TrenchBoot Secure Launch on Intel TXT platforms.
+         * Entry point for TrenchBoot Secure Launch, common for Intel TXT and
+         * AMD Secure Startup, but state is slightly different.
          *
+         * On Intel:
          * CPU is in 32b protected mode with paging disabled. On entry:
-         * - %ebx = %eip = MLE entry point,
+         * - %ebx = %eip = this entry point,
          * - stack pointer is undefined,
          * - CS is flat 4GB code segment,
          * - DS, ES, SS, FS and GS are undefined according to TXT SDG, but this
@@ -375,13 +377,34 @@ cs32_switch:
          * - trying to enter real mode results in reset
          * - APs must be brought up by MONITOR or GETSEC[WAKEUP], depending on
          *   which is supported by a given SINIT ACM
+         *
+         * On AMD (as implemented by TrenchBoot's SKL):
+         * CPU is in 32b protected mode with paging disabled. On entry:
+         * - %ebx = %eip = this entry point,
+         * - %ebp holds base address of SKL
+         * - stack pointer is treated as undefined for parity with TXT,
+         * - CS is flat 4GB code segment,
+         * - DS, ES, SS are flat 4GB data segments, but treated as undefined for
+         *   parity with TXT.
+         *
+         * Additional restrictions:
+         * - interrupts (including NMIs and SMIs) are disabled and must be
+         *   enabled later
+         * - APs must be brought up by SIPI without an INIT
          */
 slaunch_stub_entry:
         /* Calculate the load base address. */
         mov     %ebx, %esi
         sub     $sym_offs(slaunch_stub_entry), %esi
 
-        /* Mark Secure Launch boot protocol and jump to common entry. */
+        /* On AMD, %ebp holds the base address of SLB, save it for later. */
+        mov     %ebp, %ebx
+
+        /*
+         * Mark Secure Launch boot protocol and jump to common entry. Note that
+         * all general purpose registers except %ebx and %esi are clobbered
+         * between here and .Lslaunch_proto.
+         */
         mov     $SLAUNCH_BOOTLOADER_MAGIC, %eax
         jmp     .Lset_stack
 
@@ -508,15 +531,18 @@ __start:
         sub     $8, %esp
 
         push    %esp                             /* pointer to output structure */
+        push    %ebx                             /* Slaunch parameter on AMD */
         lea     sym_offs(__2M_rwdata_end), %ecx  /* end of target image */
         lea     sym_offs(_start), %edx           /* target base address */
         mov     %esi, %eax                       /* load base address */
         /*
-         * slaunch_early_init(load/eax, tgt/edx, tgt_end/ecx, ret/stk) using
-         * fastcall calling convention.
+         * slaunch_early_init(load/eax, tgt/edx, tgt_end/ecx,
+         *                     slaunch/stk, ret/stk)
+         *
+         * Uses fastcall calling convention.
          */
         call    slaunch_early_init
-        add     $4, %esp                         /* pop the fourth parameter */
+        add     $8, %esp                         /* pop last two parameters */
 
         /* Move outputs of slaunch_early_init() from stack into registers. */
         pop     %eax  /* physical MBI address */
diff --git a/xen/arch/x86/boot/slaunch-early.c b/xen/arch/x86/boot/slaunch-early.c
index b6f6deedc9..e886d1bba7 100644
--- a/xen/arch/x86/boot/slaunch-early.c
+++ b/xen/arch/x86/boot/slaunch-early.c
@@ -7,6 +7,20 @@
 #include <xen/slr-table.h>
 #include <xen/types.h>
 #include <asm/intel-txt.h>
+#include <asm/x86-vendors.h>
+
+/*
+ * The AMD-defined structure layout for the SLB. The last two fields are
+ * SL-specific.
+ */
+struct skinit_sl_header
+{
+    uint16_t skl_entry_point;
+    uint16_t length;
+    uint8_t reserved[62];
+    uint16_t skl_info_offset;
+    uint16_t bootloader_data_offset;
+} __packed;
 
 struct early_init_results
 {
@@ -14,9 +28,25 @@ struct early_init_results
     uint32_t slrt_pa;
 } __packed;
 
+static bool is_intel_cpu(void)
+{
+    /*
+     * asm/processor.h can't be included in early code, which means neither
+     * cpuid() function nor boot_cpu_data can be used here.
+     */
+    uint32_t eax, ebx, ecx, edx;
+    asm volatile ( "cpuid"
+          : "=a" (eax), "=b" (ebx), "=c" (ecx), "=d" (edx)
+          : "0" (0), "c" (0) );
+    return ebx == X86_VENDOR_INTEL_EBX
+        && ecx == X86_VENDOR_INTEL_ECX
+        && edx == X86_VENDOR_INTEL_EDX;
+}
+
 void asmlinkage slaunch_early_init(uint32_t load_base_addr,
                                    uint32_t tgt_base_addr,
                                    uint32_t tgt_end_addr,
+                                   uint32_t slaunch_param,
                                    struct early_init_results *result)
 {
     void *txt_heap;
@@ -26,6 +56,34 @@ void asmlinkage slaunch_early_init(uint32_t load_base_addr,
     struct slr_entry_intel_info *intel_info;
     uint32_t size = tgt_end_addr - tgt_base_addr;
 
+    if ( !is_intel_cpu() )
+    {
+        /*
+         * Not an Intel CPU. Currently the only other option is AMD with SKINIT
+         * and secure-kernel-loader (SKL).
+         */
+        struct slr_entry_amd_info *amd_info;
+        const struct skinit_sl_header *sl_header = (void *)slaunch_param;
+
+        /*
+         * slaunch_param holds a physical address of SLB.
+         * Bootloader's data is SLRT.
+         */
+        result->slrt_pa = slaunch_param + sl_header->bootloader_data_offset;
+        result->mbi_pa = 0;
+
+        slrt = (struct slr_table *)(uintptr_t)result->slrt_pa;
+
+        amd_info = (struct slr_entry_amd_info *)
+            slr_next_entry_by_tag(slrt, NULL, SLR_ENTRY_AMD_INFO);
+        /* Basic checks only, SKL checked and consumed the rest. */
+        if ( amd_info == NULL || amd_info->hdr.size != sizeof(*amd_info) )
+            return;
+
+        result->mbi_pa = amd_info->boot_params_base;
+        return;
+    }
+
     txt_heap = txt_init();
     os_mle = txt_os_mle_data_start(txt_heap);
     os_sinit = txt_os_sinit_data_start(txt_heap);
-- 
2.49.0


