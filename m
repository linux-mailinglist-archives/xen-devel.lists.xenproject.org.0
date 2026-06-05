Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JzeiIgJdImreVQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 07:22:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3127F645285
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 07:22:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=HTGBF0x5;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1328927.1593167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVMzu-0002V2-Dq; Fri, 05 Jun 2026 05:21:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328927.1593167; Fri, 05 Jun 2026 05:21:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVMzu-0002R3-AR; Fri, 05 Jun 2026 05:21:34 +0000
Received: by outflank-mailman (input) for mailman id 1328927;
 Fri, 05 Jun 2026 05:21:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wVMzs-000244-0f
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 05:21:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVMzr-00HJSo-DJ
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 07:21:31 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a225cd3-e002-0a2a0a5209dd-0a2a4508a7be-6
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 07:21:31 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a225cdb-63b5-0a2a45080019-d1558036f133-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 07:21:31 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-490b64c8311so16943955e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 22:21:31 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.26.204])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490c2c9ea37sm31922435e9.0.2026.06.04.22.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 22:21:30 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780636891; x=1781241691; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ET6rfyTADhmkVbxMEn1N5DcgOf1gJoNvcXXSPP2THsg=;
        b=HTGBF0x5GjhyfSxVPhn2QXJB+2CGuK5rkaPg/dWCQJXw+ialJ/PQKzWBHhkp6CCrev
         CRwuyevYd/U3NkAkv9ohwU56+2MeqFtmYmE/dE+vXaqnlx+kp0AXaigWbmAiDSkLVQs7
         kVZDph9NodW9ny2imOgE6+VZTlZX4Qnm8Jchfb7NG70LoRCk6lwHpJxWcQj2FF7xT4u/
         0H2SA9zhBmv/F9MT5Pa+gcgtAVan8KgJy4SCrMKvS8rK3rcqZNXuko3jnuhCL1igjMho
         5umNDwyA71t6MmqSExHFcmGOJYPVL2i9jIhA90rmVYpdbqFTwXNFVNc308pYQ09UU+YH
         Ll9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780636891; x=1781241691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ET6rfyTADhmkVbxMEn1N5DcgOf1gJoNvcXXSPP2THsg=;
        b=DS5pkuFzU9U6luyFgeCoAXLuiXqbHjqzk1Vvsdvtg78a7RhvufzB6yOf2LpTt60hLr
         V46dFFJ9sqVSK5m7WFOn3Jjkv/ejLcluMQ7m47kj2Q/d6mGcsUbp3VODAzl8aM9M1OL6
         XOWTnLfI7ijF+Wjt3R64RNWWW8p56T2aVKDC2WHXtTJrytPmCJCpa/M8KAIp4ZH2Dw+J
         XjeWlofkIkAActsVi/nx/J96+JfAlu5sAoUFHOHWYaU0yrUd+yH6shQfNiyi4dmfYYjb
         vs+jcyBJseCVLc4iy6DPntXFBYy7uY8HXPEOmrLy6d88ZP8toDSSoPCUC3VmDVFxy7xZ
         eczQ==
X-Gm-Message-State: AOJu0Yxn3/w8Fc3vbmDLap+rkV7HROivayngQgUZbKfeVHKAEN5J+7FQ
	p9zPL3g5hPQ8BgRnF8k8725HEY+W8B+UNjuV9qtzm4f57SdUJNVNydl40Msx5A==
X-Gm-Gg: Acq92OG7Ux7zeSsllDY6CBiGRV3NvBbPWwvAQvxXf/mnAawCnUgbQKRigTxshAJ8bcu
	/0J/TfcFS7P1xky3cOD2UZjzcvPGw4+tr2B6cXZNBBcRFzocG4Dbpx9OHkdhP829JEvrR1qA4MT
	sCSGW2VfKXJxD9ilGOCMK5LILQgNLEPJuOvk1svd35X+nPPOqkTpwPFU7hvW+cwPRR7eFCy8YpN
	KGvIiqB+CnNrsoTa/1y2T7VlCnjJ1hfWDBmsx3mDlDW2DvBdvEwJLeUlDLRtrkEZOVg9RE92B2Y
	S+NK0K3buwVj+Cvt1SWeclHdGBUeDZmnHN1FIMQOn7CfWuX3HBeaz6T9+SS0+RS8ck+h/RZtnGh
	P/9sDQW0FglYkGWi56oD8Rpcr7lOHcQg2D12qVEY1lhLMVE77kk1XA5K4yp2eLE7WAS38jrVSBS
	NWZ4d8Op5c1YlShk95yXORZ/Ks4mZrbRSgNN+leg==
X-Received: by 2002:a05:600c:82c3:b0:490:9782:3eb8 with SMTP id 5b1f17b1804b1-490c25f4963mr24058725e9.25.1780636890607;
        Thu, 04 Jun 2026 22:21:30 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH for-4.22 v2 2/2] device-tree: validate hwdom bank 0 boot placement
Date: Fri,  5 Jun 2026 08:19:08 +0300
Message-ID: <e21cd3c7274eac76607b551134f3f23665a31d7c.1780602987.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1780602987.git.mykola_kvach@epam.com>
References: <cover.1780602987.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1780636891-B7171DB1-F13DF6DD/0/0
X-purgate-type: clean
X-purgate-size: 11838
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3127F645285

From: Mykola Kvach <mykola_kvach@epam.com>

With LLC coloring enabled, the hardware domain memory is allocated by
allocate_hwdom_memory() rather than by using the fixed direct-map layout.

Commit de99f3263555 ("device-tree: Improve hwdom memory allocation for
DMA") made that allocator prefer lower host regions. The first-bank
filter, however, still only checked the old 128MB heuristic. A low region
can satisfy that heuristic but still be too small, or otherwise
unsuitable, for the hardware-domain kernel and the DTB/initrd area to fit
in bank 0 according to the Arm placement rules.

Keep the existing first-bank size policy and add an architecture-specific
candidate check. On Arm, compute the kernel load address for the
candidate bank using the same logic as kernel_zimage_place(), verify that
the kernel range is covered by that bank, and then reuse the same
DTB/initrd placement helper as place_dtb_initrd(). The FDT is generated
later, so use the hardware-domain FDT allocation size as a conservative
upper bound for the final DTB size.

Check the candidate after capping the host region by the remaining
unassigned hardware-domain memory, so the validation is performed against
the size that would actually become bank 0.

This keeps the DMA-oriented allocation policy from de99f3263555 while
preventing a too-small bank 0 from reaching place_dtb_initrd().

Make kernel_zimage_place_in_bank() return INVALID_PADDR when a
position-independent zImage cannot be placed in the supplied bank; the
real load path turns this into a panic, while the hwdom candidate check
uses it to reject the bank.

Fixes: de99f3263555 ("device-tree: Improve hwdom memory allocation for DMA")
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v2:
- Split the behavior-preserving placement refactoring into the previous
  patch.
- Reuse the refactored Arm kernel and DTB/initrd placement helpers for
  the first-bank candidate check.

Link to v1:
  https://patchew.org/Xen/4f862bb2dc323914b8120b0f16af7516140cf42b.1780065103.git.mykola._5Fkvach@epam.com/

Changes since RFC:
- Do not keep the RFC scalar minimum-size check.  It can both reject valid
  layouts and accept layouts which still fail later.  Instead, validate
  the candidate bank using the same kernel and DTB/initrd placement rules
  as the load path.
- Replace the scalar minimum-size check with arch_hwdom_first_bank_ok().
- Validate fixed-address and AArch32 start == 0 kernel placement against
  the candidate bank.
- Check the candidate after capping the host region by the remaining
  unassigned hardware-domain memory.
- Treat the hardware-domain FDT allocation size as a conservative upper
  bound because the final FDT is generated later.

Link to RFC: https://patchew.org/Xen/9ae4f7dd49f5b1f761193adae573c2675c92e883.1779051035.git.mykola._5Fkvach@epam.com/

Why the RFC scalar approach was not kept:

A simple minimum-size check is not sufficient here because the validity
of the first bank depends on the actual Arm placement rules, not only on
the aggregate size of the kernel, DTB and initrd. The DTB/initrd area may
fit before a 64-bit Image loaded with a text offset, while an AArch32
position-independent kernel may leave no valid module location even when
the aggregate size appears to fit. Fixed-address kernels also need the
candidate bank start to be considered.
---
 xen/arch/arm/acpi/domain_build.c        |  2 -
 xen/arch/arm/domain_build.c             |  8 ++++
 xen/arch/arm/include/asm/domain_build.h |  4 ++
 xen/arch/arm/include/asm/kernel.h       |  9 ++++
 xen/arch/arm/kernel.c                   | 57 ++++++++++++++++++++++++-
 xen/common/device-tree/domain-build.c   | 24 ++++++++---
 xen/include/xen/fdt-kernel.h            |  9 ++++
 7 files changed, 102 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/acpi/domain_build.c b/xen/arch/arm/acpi/domain_build.c
index 249d899c33..db16f7fa94 100644
--- a/xen/arch/arm/acpi/domain_build.c
+++ b/xen/arch/arm/acpi/domain_build.c
@@ -26,8 +26,6 @@
 #undef virt_to_mfn
 #define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
 
-#define ACPI_DOM0_FDT_MIN_SIZE 4096
-
 static int __init acpi_iomem_deny_access(struct domain *d)
 {
     acpi_status status;
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 1efddc60ef..550617f152 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -115,6 +115,14 @@ int __init parse_arch_dom0_param(const char *s, const char *e)
                              (IS_ENABLED(CONFIG_STATIC_SHM) ?         \
                               (NR_SHMEM_BANKS * (160 + 16)) : 0))
 
+paddr_t __init hwdom_get_fdt_alloc_size(void)
+{
+    if ( acpi_disabled )
+        return fdt_totalsize(device_tree_flattened) + DOM0_FDT_EXTRA_SIZE;
+
+    return ACPI_DOM0_FDT_MIN_SIZE;
+}
+
 unsigned int __init dom0_max_vcpus(void)
 {
     if ( opt_dom0_max_vcpus == 0 )
diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
index df8b361b3d..85cf46a958 100644
--- a/xen/arch/arm/include/asm/domain_build.h
+++ b/xen/arch/arm/include/asm/domain_build.h
@@ -19,6 +19,10 @@ int prepare_acpi(struct domain *d, struct kernel_info *kinfo);
 
 int add_ext_regions(unsigned long s_gfn, unsigned long e_gfn, void *data);
 
+#define ACPI_DOM0_FDT_MIN_SIZE 4096
+
+paddr_t hwdom_get_fdt_alloc_size(void);
+
 #if defined(CONFIG_MPU) && defined(CONFIG_ARM_64)
 /* Utility function to determine if an Armv8-R processor supports VMSA. */
 bool has_v8r_vmsa_support(void);
diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
index 21f4273fa1..bf14fb208a 100644
--- a/xen/arch/arm/include/asm/kernel.h
+++ b/xen/arch/arm/include/asm/kernel.h
@@ -8,12 +8,21 @@
 
 #include <asm/domain.h>
 
+#include <xen/types.h>
+
+struct kernel_info;
+
 struct arch_kernel_info
 {
     /* Enable pl011 emulation */
     bool vpl011;
 };
 
+#define arch_hwdom_first_bank_ok arch_hwdom_first_bank_ok
+bool arch_hwdom_first_bank_ok(const struct kernel_info *info,
+                              paddr_t bank_start,
+                              paddr_t bank_size);
+
 #endif /* #ifdef __ARCH_ARM_KERNEL_H__ */
 
 /*
diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index d1be4d8074..ecea2822a1 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -64,9 +64,15 @@ kernel_zimage_place_in_bank(const struct kernel_info *info,
         load_end = bank_start + bank_size;
         load_end = MIN(bank_start + MB(128), load_end);
 
+        if ( load_end - bank_start < info->image.len )
+            return INVALID_PADDR;
+
         load_addr = load_end - info->image.len;
         /* Align to 2MB */
         load_addr &= ~(MB(2) - 1);
+
+        if ( load_addr < bank_start )
+            return INVALID_PADDR;
     }
     else
         load_addr = info->image.start;
@@ -164,9 +170,56 @@ static void __init place_dtb_initrd(struct kernel_info *info,
 static paddr_t __init kernel_zimage_place(struct kernel_info *info)
 {
     const struct membanks *mem = kernel_info_get_mem(info);
+    paddr_t load_addr;
+
+    load_addr = kernel_zimage_place_in_bank(info, mem->bank[0].start,
+                                            mem->bank[0].size);
+    if ( load_addr == INVALID_PADDR )
+        panic("Unable to find suitable location for the kernel\n");
+
+    return load_addr;
+}
+
+bool __init arch_hwdom_first_bank_ok(const struct kernel_info *info,
+                                     paddr_t bank_start,
+                                     paddr_t bank_size)
+{
+    const struct boot_module *initrd = info->bd.initrd;
+    /*
+     * place_dtb_initrd() rounds the DTB and initrd placement to 2MB boundaries;
+     * use the same granularity when checking whether the first bank can hold
+     * them.
+     */
+    const paddr_t initrd_len = ROUNDUP(initrd ? initrd->size : 0, MB(2));
+    /*
+     * The hardware domain FDT has not been generated yet. Use the allocation
+     * size as a conservative upper bound for the final DTB size.
+     */
+    const paddr_t dtb_len = ROUNDUP(hwdom_get_fdt_alloc_size(), MB(2));
+    const paddr_t rambase = bank_start;
+    const paddr_t ramsize = bank_size;
+    const paddr_t dtb_initrd_size = initrd_len + dtb_len;
+    const paddr_t ramend = rambase + ramsize;
+    paddr_t kernbase;
+    paddr_t kernend;
+    paddr_t dtb_base;
+
+    kernbase = kernel_zimage_place_in_bank(info, bank_start, bank_size);
+    if ( kernbase == INVALID_PADDR ||
+         info->image.len > INVALID_PADDR - kernbase )
+        return false;
+
+    kernend = kernbase + info->image.len;
+
+    if ( kernbase < rambase || kernend > ramend )
+        return false;
+
+    if ( !first_bank_can_fit_modules(ramsize, kernbase, kernend,
+                                     dtb_initrd_size) )
+        return false;
 
-    return kernel_zimage_place_in_bank(info, mem->bank[0].start,
-                                       mem->bank[0].size);
+    return find_dtb_initrd_placement(rambase, ramend, kernbase, kernend,
+                                     dtb_initrd_size, &dtb_base);
 }
 
 static void __init kernel_zimage_load(struct kernel_info *info)
diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
index f3ba496f1e..2e806c1b09 100644
--- a/xen/common/device-tree/domain-build.c
+++ b/xen/common/device-tree/domain-build.c
@@ -299,20 +299,30 @@ static bool __init allocate_hwdom_memory(struct kernel_info *kinfo)
 
     for ( i = 0; (kinfo->unassigned_mem > 0) && (i < nr_banks); i++ )
     {
-        paddr_t bank_size;
+        const paddr_t bank_start = hwdom_free_mem->bank[i].start;
+        paddr_t bank_size = hwdom_free_mem->bank[i].size;
+
+        /*
+         * Check the size that would actually be assigned, not just the size
+         * of the host region.
+         */
+        bank_size = min(bank_size, kinfo->unassigned_mem);
 
         /*
          * The first bank must be large enough for place_dtb_initrd() to
          * fit the kernel, DTB and initrd.  Skip small regions to avoid
          * ending up with a tiny first bank.
          */
-        if ( !mem->nr_banks && (hwdom_free_mem->bank[i].size < min_bank_size) )
-            continue;
+        if ( !mem->nr_banks )
+        {
+            if ( bank_size < min_bank_size )
+                continue;
+
+            if ( !arch_hwdom_first_bank_ok(kinfo, bank_start, bank_size) )
+                continue;
+        }
 
-        bank_size = MIN(hwdom_free_mem->bank[i].size, kinfo->unassigned_mem);
-        if ( !allocate_bank_memory(kinfo,
-                                   gaddr_to_gfn(hwdom_free_mem->bank[i].start),
-                                   bank_size) )
+        if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(bank_start), bank_size) )
         {
             xfree(hwdom_free_mem);
             return false;
diff --git a/xen/include/xen/fdt-kernel.h b/xen/include/xen/fdt-kernel.h
index 00c37be101..71e2344b97 100644
--- a/xen/include/xen/fdt-kernel.h
+++ b/xen/include/xen/fdt-kernel.h
@@ -93,6 +93,15 @@ kernel_info_get_mem_const(const struct kernel_info *kinfo)
     return container_of(&kinfo->mem.common, const struct membanks, common);
 }
 
+#ifndef arch_hwdom_first_bank_ok
+static inline bool arch_hwdom_first_bank_ok(const struct kernel_info *info,
+                                            paddr_t bank_start,
+                                            paddr_t bank_size)
+{
+    return true;
+}
+#endif
+
 #ifndef KERNEL_INFO_SHM_MEM_INIT
 
 #ifdef CONFIG_STATIC_SHM
-- 
2.43.0


