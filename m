Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id pW8gHKIsCmqUxQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 17 May 2026 23:01:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B21563E2F
	for <lists+xen-devel@lfdr.de>; Sun, 17 May 2026 23:01:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311360.1581517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOiat-00038F-7g; Sun, 17 May 2026 21:00:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311360.1581517; Sun, 17 May 2026 21:00:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOiat-00037G-48; Sun, 17 May 2026 21:00:15 +0000
Received: by outflank-mailman (input) for mailman id 1311360;
 Sun, 17 May 2026 21:00:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wOias-00037A-1q
 for xen-devel@lists.xenproject.org; Sun, 17 May 2026 21:00:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOiar-00C3rz-EH
 for xen-devel@lists.xenproject.org; Sun, 17 May 2026 23:00:13 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0a2beb-5cb7-0a2a0a5109dd-0a2a4505e9cc-30
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2026 23:00:13 +0200
Received: from [209.85.218.50] (helo=mail-ej1-f50.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0a2c5d-aaa8-0a2a45050019-d155da32d845-3
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2026 23:00:13 +0200
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-bcc9fdc959cso329399966b.2
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2026 14:00:13 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.26.18]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bd4f4bd0a24sm485504066b.11.2026.05.17.14.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2026 14:00:12 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779051613; x=1779656413; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NAAkDjpl4ADPy8uGozIOL9uUsscjlLFpYuYbxX1FRPw=;
        b=FmtplVeA1+gmEOX9AcfXHmWWH6reOEWnkA8TPEzgcDR3RzuzLhS+PodYSwQRTW5p3l
         5vNEUzmeD7+UAD5e7C1PmZEgx334vc9MouFKDdHrjbk3pSHLp5Wn24//zJ1qBFq5NS2d
         I6Mha5VKc/IQnUXWm+eZVm7x44/nSczDZuCRd+be3S6l37R6AJkuhAVUgLlSEKGOSzmP
         OzuG1QHqqCIE+eY9fqBpHx2J20wWZESpDDpn9eGCW/zB/p5PDz8+UCP1vT4lsvA+Skxf
         B8ffVCNhck341VHMh9vVWnv2yzs7H1D7X3xEAlYcnjobPW8lEyQUtqeLVqgzikKPgKKN
         tLmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779051613; x=1779656413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NAAkDjpl4ADPy8uGozIOL9uUsscjlLFpYuYbxX1FRPw=;
        b=mLw+BuKYmNaGgTZ9tCF5Xe8L4gxEWmebiAzIPhlngLbeVWk/ADS+BpEjhaLvEp6eyL
         q/igy/bzxs0P9l4JcGeDhIRRedORjh1VdiEudGPSQmTELjTc0iHac52R2nUuu9GKEGiG
         24zCC/Ln03/iDpiwwYNWPy3M/hIMAIJzgy5rzNg70ssxR921TAzGtZkjGa2AN7JJPKZy
         1v6Gkqg99ImXL9RT5ImIqV/hdLVvd5WoCTWLJtxjvffmfYdc1/X5SxTaAISrQZXdyryu
         zDLywWWzpg0+11MLz6MYEHGDiMOs5LN2n/5WbzZmMd/WX5rphwr5nJhaZEHnZLVnFeWa
         YiNQ==
X-Gm-Message-State: AOJu0YwdcN6MkbDpJFpbncW8Uv1YsTdaR/V1+SNcJpPAX1nYixZAlu8i
	d/cOjI1X/QQt31RgL8O5h+it7XMbw4Kht8QQ/XMTWfq7ypc7yMhCji/IihuOUQ==
X-Gm-Gg: Acq92OERZRmjdHUEn0MrTqRY4kebodgBpREUQyCXZwoAyzNpojdupemrs9QLUAysU9X
	xguD/a0mYGblp95qjwOokPHdNz/zVt5PiFxJiMijGFFbJ5IUW13zChoHy8lMx1omIaGp75UgQAF
	rxfZ//5iJmZz/bAkL7AJ7IhY60lfdu1jono2X0oLtpFEiLYZr7OgOYgsHd4Ngm0sxivrRluN3Or
	F9rM+eiCuWU67qfZN2JdJGj16ABk27OvXbihKnc/VIoNcMHWYFKeFwU1p9lf8tLbzabb8C0Ntv8
	Mf6JpxtIN3mKEnP3Yvq/AOWZLUa+meqoqV3RrJbErfJ4Zrkka/7A09OQyX7DiPSdanj0CHa7jHv
	xuKg0+E/IWiCS/F0vDGhRuI1N3b2kYlrb2d4Sw2+mwuuotDNQsgLf/igJrvayHSjPRJN7nRX+2D
	ft9GiHvOxzwwo32Pgi/FOWZweHZQ==
X-Received: by 2002:a17:907:1988:b0:ba4:f501:cb8b with SMTP id a640c23a62f3a-bd5177db61fmr624330266b.16.1779051612688;
        Sun, 17 May 2026 14:00:12 -0700 (PDT)
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [RFC PATCH] device-tree: size first hwdom bank for boot modules
Date: Sun, 17 May 2026 23:57:56 +0300
Message-ID: <9ae4f7dd49f5b1f761193adae573c2675c92e883.1779051035.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1779051613-E3589443-5950C84A/0/0
X-purgate-type: clean
X-purgate-size: 10312
X-Rspamd-Queue-Id: C7B21563E2F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.982];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

From: Mykola Kvach <mykola_kvach@epam.com>

With LLC coloring enabled, the hardware domain memory comes from
allocate_hwdom_memory(), not from the fixed direct-map banks used when
coloring is off.

Commit de99f3263555 ("device-tree: Improve hwdom memory allocation for
DMA") made that allocator sort free host regions by ascending address so
Dom0 gets DMA-capable low memory first. The first bank filter still only
required 128MB. That can select a low region which is large enough for
the heuristic, but not large enough for place_modules() to put the Dom0
kernel, generated DTB and initrd contiguously in bank 0.

Ask arch code for any additional first-bank size requirement. On Arm,
compute it from the actual Dom0 kernel placement, rounded initrd size and
generated DTB size hint. For 64-bit Image kernels, include the text offset
from the candidate bank start, because the returned requirement is compared
with a bank size measured from that start. The hint covers both the normal
Device Tree path and the minimal DTB created for ACPI boot.

Check the first-bank threshold against the size which will actually be
assigned to Dom0, after capping the host region by the remaining unassigned
Dom0 memory. Otherwise a large host region could pass the test but still
produce a first guest bank too small for place_modules().

Use the typed min()/max() helpers for this normal allocation arithmetic;
MIN()/MAX() are intended for preprocessor-style contexts and skip the type
checking provided by the lowercase helpers.

This keeps the DMA-oriented allocation policy from de99f3263555 while
preventing a too-small bank 0 from reaching place_modules().

Fixes: de99f3263555 ("device-tree: Improve hwdom memory allocation for DMA")
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Test/setup notes:

The failure was reproduced on a Renesas H3ULCB/R-Car H3 (r8a7795)
arm64 board booted through U-Boot/TFTP and using huge initrd.

Relevant Xen command line excerpt:
  dom0_mem=2048M llc-coloring=on

Boot module layout from Xen:
  MODULE[2]: 0x0000000084000040-0x000000008e75d92f Ramdisk
  MODULE[3]: 0x00000000a0000000-0x00000000a3ffffff Kernel
  MODULE[4]: 0x00000000a4000000-0x00000000a400ffff XSM Policy

The initrd is about 168MB. With LLC coloring enabled and the low-address
allocation policy from de99f3263555, Dom0 can receive a 192MB first bank:
  d0 BANK[0] 0x00000048000000-0x00000054000000 (192MB)

That bank satisfies the old 128MB minimum but is too small for the
rounded Dom0 kernel, generated DTB and initrd placement. The observed
failure before this patch was:
  Panic on CPU 0:
  Not enough memory in the first bank for the kernel+dtb+initrd

With this patch, the same boot skips the too-small low region for bank 0
and reaches Dom0:
  d0 BANK[0] 0x00000057000000-0x00000084000000 (720MB)
  d0 BANK[1] 0x0000008e800000-0x000000c0000000 (792MB)
  d0 BANK[2] 0x00000500000000-0x00000521800000 (536MB)
  d0: extended region 0: 0x48000000->0x54000000
  Loading zImage from 0x00000000a0000000 to 0x57000000-0x5b000000
  Loading d0 initrd from 0x0000000084000040 to 0x5f200000-0x6995d8f0
  Loading d0 DTB to 0x5f000000-0x5f011c80
  Linux version 5.10.194-yocto-standard
---
 xen/arch/arm/acpi/domain_build.c        |  2 --
 xen/arch/arm/domain_build.c             |  8 ++++++
 xen/arch/arm/include/asm/domain_build.h |  4 +++
 xen/arch/arm/include/asm/kernel.h       |  8 ++++++
 xen/arch/arm/kernel.c                   | 35 +++++++++++++++++++++++++
 xen/common/device-tree/domain-build.c   | 27 ++++++++++++++-----
 xen/include/xen/fdt-kernel.h            |  8 ++++++
 7 files changed, 83 insertions(+), 9 deletions(-)

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
index 1efddc60ef..226e053c68 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -115,6 +115,14 @@ int __init parse_arch_dom0_param(const char *s, const char *e)
                              (IS_ENABLED(CONFIG_STATIC_SHM) ?         \
                               (NR_SHMEM_BANKS * (160 + 16)) : 0))
 
+paddr_t __init dom0_get_fdt_size_hint(void)
+{
+    if ( !acpi_disabled )
+        return ACPI_DOM0_FDT_MIN_SIZE;
+
+    return fdt_totalsize(device_tree_flattened) + DOM0_FDT_EXTRA_SIZE;
+}
+
 unsigned int __init dom0_max_vcpus(void)
 {
     if ( opt_dom0_max_vcpus == 0 )
diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
index df8b361b3d..45687c5d6f 100644
--- a/xen/arch/arm/include/asm/domain_build.h
+++ b/xen/arch/arm/include/asm/domain_build.h
@@ -19,6 +19,10 @@ int prepare_acpi(struct domain *d, struct kernel_info *kinfo);
 
 int add_ext_regions(unsigned long s_gfn, unsigned long e_gfn, void *data);
 
+#define ACPI_DOM0_FDT_MIN_SIZE 4096
+
+paddr_t dom0_get_fdt_size_hint(void);
+
 #if defined(CONFIG_MPU) && defined(CONFIG_ARM_64)
 /* Utility function to determine if an Armv8-R processor supports VMSA. */
 bool has_v8r_vmsa_support(void);
diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
index 21f4273fa1..17c5b9bce4 100644
--- a/xen/arch/arm/include/asm/kernel.h
+++ b/xen/arch/arm/include/asm/kernel.h
@@ -8,12 +8,20 @@
 
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
 
+#define arch_get_min_first_bank_size arch_get_min_first_bank_size
+paddr_t arch_get_min_first_bank_size(struct kernel_info *info,
+                                     paddr_t bank_start);
+
 #endif /* #ifdef __ARCH_ARM_KERNEL_H__ */
 
 /*
diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index b72585b7fe..3644663e2f 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -128,6 +128,41 @@ static paddr_t __init kernel_zimage_place(struct kernel_info *info)
     return load_addr;
 }
 
+static paddr_t __init kernel_placement_size(paddr_t load_addr, paddr_t len)
+{
+    return ROUNDUP(load_addr + len, MB(2)) - load_addr;
+}
+
+paddr_t __init arch_get_min_first_bank_size(struct kernel_info *info,
+                                            paddr_t bank_start)
+{
+    const struct boot_module *mod = info->bd.initrd;
+    const paddr_t initrd_len = ROUNDUP(mod ? mod->size : 0, MB(2));
+    const paddr_t dtb_len = ROUNDUP(dom0_get_fdt_size_hint(), MB(2));
+    paddr_t kernsize;
+
+#ifdef CONFIG_HAS_DOMAIN_TYPE
+    if ( (info->type == DOMAIN_64BIT) && (info->image.start == 0) )
+    {
+        paddr_t load_addr = bank_start + info->image.text_offset;
+
+        /*
+         * The caller compares this value with a size measured from
+         * bank_start, so include the text offset before the kernel.
+         */
+        kernsize = ROUNDUP(load_addr + info->image.len, MB(2)) - bank_start;
+        return kernsize + initrd_len + dtb_len;
+    }
+#endif
+
+    if ( info->image.start == 0 )
+        kernsize = ROUNDUP(info->image.len, MB(2));
+    else
+        kernsize = kernel_placement_size(info->image.start, info->image.len);
+
+    return kernsize + initrd_len + dtb_len;
+}
+
 static void __init kernel_zimage_load(struct kernel_info *info)
 {
     paddr_t load_addr = kernel_zimage_place(info);
diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
index 2a760b007b..d8865db259 100644
--- a/xen/common/device-tree/domain-build.c
+++ b/xen/common/device-tree/domain-build.c
@@ -299,20 +299,33 @@ static bool __init allocate_hwdom_memory(struct kernel_info *kinfo)
 
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
          * The first bank must be large enough for place_modules() to
          * fit the kernel, DTB and initrd.  Skip small regions to avoid
          * ending up with a tiny first bank.
          */
-        if ( !mem->nr_banks && (hwdom_free_mem->bank[i].size < min_bank_size) )
-            continue;
+        if ( !mem->nr_banks )
+        {
+            paddr_t arch_min_size;
+            paddr_t required_first_bank_size;
+
+            arch_min_size = arch_get_min_first_bank_size(kinfo, bank_start);
+            required_first_bank_size = max(min_bank_size, arch_min_size);
+
+            if ( bank_size < required_first_bank_size )
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
index 8cd1670c2c..931b3e1686 100644
--- a/xen/include/xen/fdt-kernel.h
+++ b/xen/include/xen/fdt-kernel.h
@@ -86,6 +86,14 @@ kernel_info_get_mem_const(const struct kernel_info *kinfo)
     return container_of(&kinfo->mem.common, const struct membanks, common);
 }
 
+#ifndef arch_get_min_first_bank_size
+static inline paddr_t arch_get_min_first_bank_size(struct kernel_info *info,
+                                                   paddr_t bank_start)
+{
+    return 0;
+}
+#endif
+
 #ifndef KERNEL_INFO_SHM_MEM_INIT
 
 #ifdef CONFIG_STATIC_SHM
-- 
2.43.0


