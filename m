Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBesFvWsGWpEyQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 17:12:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3016045C6
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 17:12:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1322520.1588828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSytA-00063c-NX; Fri, 29 May 2026 15:12:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1322520.1588828; Fri, 29 May 2026 15:12:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSytA-000617-IU; Fri, 29 May 2026 15:12:44 +0000
Received: by outflank-mailman (input) for mailman id 1322520;
 Fri, 29 May 2026 15:12:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wSyt8-0005yR-N1
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 15:12:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSyt8-00EPc7-3p
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 17:12:42 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a19acde-bab6-0a2a0a5309dd-0a2a4506c0aa-34
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 17:12:42 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a19ace9-7371-0a2a45060019-d1558029d99b-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 17:12:41 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4905e190c71so67848755e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 08:12:41 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.25.69]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490a25e4fe7sm7305335e9.0.2026.05.29.08.12.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 08:12:40 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780067561; x=1780672361; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IFaohJmJppYna9HQaa7GLrFTgGHuc8+HRVmhBeC5YQs=;
        b=BahTU7DAfmdvRl1t27zOKRU9Og8EZvwcleWYOj0RXsI8dn9R4yX0f18apknfhz11mh
         HpBbRrBkpHMsIwsd7E94B5SoULWGsX8e6jOfuldS3yriGSn7NSz68xbAeQbQAjzfdKrM
         6bysRf5ZNKLIeOzJJRf6qjJrzdDaT74b379nQjaOBjlNic5Akv6yndVEobZ8gJpV9gWw
         HVPGr074Ko2MZE9bhw+YQims3TTx9qNEjBHXMyD8NuVmfd5RG3L0wBWz3jJSHfVjccjA
         HFxB9AW/gaWdlDbJPwDPhZO/I2Z1cvaZDbyYbW9fIMutcVBcQ+xoVu5omXYt5P6zK7ua
         OWPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780067561; x=1780672361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IFaohJmJppYna9HQaa7GLrFTgGHuc8+HRVmhBeC5YQs=;
        b=WnpRUfEkWrqJLfprZ9aVbdGnh2nvWSfn5MjjHYbhm7Pq3NVNcPgOZEKrPNYErOOdtJ
         mhalI6ZngFgMsiKuZ2AkxPYoCahq+KpH3vGNdkmWuLhlky4abDyVOSHf6GUft5s/Iecz
         FkHTfHXX9qe4Yu2pPgDcGwDHhFxji8He+JODbqoItgIMmLA078Hi+pE5Y7bSqj9sbay4
         smsl66aa4opMaogqR/NbNevXAzMg6AtLBTepDXE+/DrIGfeD7W/SvW8kriLqlv1HYOGK
         N8NRFtm/yG14c7iA5lYlRfos134W0inUC3MnfItih0jOmN8wfnBNXgOsaFhtFYxa5NaQ
         B/oA==
X-Gm-Message-State: AOJu0YzDU7INRW9aRPw/2sBzExYbBV1JlgNIgYbahcMDjvomv3u3TLiL
	z14RE5Si7XQ5FNxKSUv45Re3mcQqVNZN/ryPNRVAdcWjs+bo76RdvFcB+LyBow==
X-Gm-Gg: Acq92OF3w1RBff7giIxpkXBXe8MeL6OK5/1uiayH3KOrxnnC0E23Wo4czxSDIulfnva
	BdyLTep+qs4soce05eRnC6i8XRaHcqR5elH9usaRvHkSds4ooa9tb6OS7gRvQ010xlkJgDlqW3p
	Nz2bqZcIz55Z931/557xcUzViBFPZ/R0nhKKae37P2iOggz9BaO8KSe5qYb6z4BBavpesHFV8Ct
	7skgsnK4QdLaBusEVD9Dhhdnb9LcCRepaGo4eW0ZPEQQKSdk050ea1GdYEQ2PXfY89nLHpN7bWo
	4hp3MrU/cCwB1snMw1gZcSFxSaQbAsenS3uA2QGGmNqukTVakrnpPhezF1VaOONDrUoUqc7FQ6Y
	iwqFvQ+xqMPa8KQS2TBa8BsCLVMLIqjvOQ8ai8u95chb35XSmR1e0heeJV4zGjjmdG/kElmqCzH
	EUIvMcK8yVXNgdUunZHGidomCB2j/URH0wMhax
X-Received: by 2002:a05:600c:4e92:b0:490:8fd1:72a with SMTP id 5b1f17b1804b1-490a2900dacmr1227315e9.3.1780067560514;
        Fri, 29 May 2026 08:12:40 -0700 (PDT)
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
Subject: [PATCH for-4.22] device-tree: validate first hwdom bank for boot modules
Date: Fri, 29 May 2026 18:10:33 +0300
Message-ID: <4f862bb2dc323914b8120b0f16af7516140cf42b.1780065103.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1780067561-85160D75-28A439F6/0/0
X-purgate-type: clean
X-purgate-size: 16430
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,gitlab.com:url];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9F3016045C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mykola Kvach <mykola_kvach@epam.com>

With LLC coloring enabled, the hardware domain memory is allocated by
allocate_hwdom_memory() rather than by using the fixed direct-map layout.

Commit de99f3263555 ("device-tree: Improve hwdom memory allocation for
DMA") made that allocator prefer lower host regions. The first-bank
filter, however, still only checked the old 128MB heuristic. A low
region can satisfy that heuristic but still be too small, or otherwise
unsuitable, for the hardware-domain kernel and the DTB/initrd module
area to fit in bank 0 according to the Arm placement rules.

Keep the existing first-bank size policy and add an architecture-specific
candidate check. On Arm, compute the kernel load address for the candidate
bank using the same logic as kernel_zimage_place(), verify that the kernel
range is covered by that bank, and then reuse the same module-placement
helper as place_modules(). The FDT is generated later, so use the
hardware-domain FDT allocation size as a conservative upper bound for the
final DTB size.

Check the candidate after capping the host region by the remaining
unassigned hardware-domain memory, so the validation is performed against
the size that would actually become bank 0.

This keeps the DMA-oriented allocation policy from de99f3263555 while
preventing a too-small bank 0 from reaching place_modules().

Fixes: de99f3263555 ("device-tree: Improve hwdom memory allocation for DMA")
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes since RFC:
- Do not keep the RFC scalar minimum-size check. It can both reject
  valid layouts and accept layouts which still fail later. Instead,
  validate the candidate bank using the same kernel and module placement
  rules as the load path.
  Replace the scalar minimum-size check with arch_hwdom_first_bank_ok().
- Reuse the existing Arm kernel and DTB/initrd placement rules for the
  first-bank candidate check.
- Treat the hardware-domain FDT allocation size as a conservative upper
  bound because the final FDT is generated later.

Link to RFC:
   https://patchew.org/Xen/9ae4f7dd49f5b1f761193adae573c2675c92e883.1779051035.git.mykola._5Fkvach@epam.com/

Why the RFC scalar approach was not kept:

A simple minimum-size check is not sufficient here because the validity of
the first bank depends on the actual Arm placement rules, not only on the
aggregate size of the kernel, DTB and initrd. The DTB/initrd area may fit
before a 64-bit Image loaded with a text offset, while an AArch32
position-independent kernel may leave no valid module location even when
the aggregate size appears to fit. Fixed-address kernels also need the
candidate bank start to be considered.

Link to synthetic tests output:
   https://gitlab.com/xen-project/people/mykola_kvach/xen/-/blob/fix/hwdom-first-bank-dom0-modules-v2-new/tools/tests/arm-boot-modules/test-arm-boot-modules.log?ref_type=heads

---
 xen/arch/arm/acpi/domain_build.c        |   2 -
 xen/arch/arm/domain_build.c             |   8 ++
 xen/arch/arm/include/asm/domain_build.h |   4 +
 xen/arch/arm/include/asm/kernel.h       |   9 ++
 xen/arch/arm/kernel.c                   | 179 ++++++++++++++++++------
 xen/common/device-tree/domain-build.c   |  24 +++-
 xen/include/xen/fdt-kernel.h            |   9 ++
 7 files changed, 182 insertions(+), 53 deletions(-)

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
index b72585b7fe..907239a246 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -40,27 +40,67 @@ struct minimal_dtb_header {
     /* There are other fields but we don't use them yet. */
 };
 
-static void __init place_modules(struct kernel_info *info,
-                                 paddr_t kernbase, paddr_t kernend)
+static paddr_t __init
+kernel_zimage_place_in_bank(const struct kernel_info *info,
+                            paddr_t bank_start, paddr_t bank_size)
 {
-    /* Align DTB and initrd size to 2Mb. Linux only requires 4 byte alignment */
-    const struct boot_module *mod = info->bd.initrd;
-    const struct membanks *mem = kernel_info_get_mem(info);
-    const paddr_t initrd_len = ROUNDUP(mod ? mod->size : 0, MB(2));
-    const paddr_t dtb_len = ROUNDUP(fdt_totalsize(info->fdt), MB(2));
-    const paddr_t modsize = initrd_len + dtb_len;
+    paddr_t load_addr;
 
-    /* Convenient */
-    const paddr_t rambase = mem->bank[0].start;
-    const paddr_t ramsize = mem->bank[0].size;
-    const paddr_t ramend = rambase + ramsize;
+#ifdef CONFIG_HAS_DOMAIN_TYPE
+    if ( (info->type == DOMAIN_64BIT) && (info->image.start == 0) )
+        return bank_start + info->image.text_offset;
+#endif
+
+    /*
+     * If start is zero, the zImage is position independent, in this
+     * case Documentation/arm/Booting recommends loading below 128MiB
+     * and above 32MiB. Load it as high as possible within these
+     * constraints, while also avoiding the DTB.
+     */
+    if ( info->image.start == 0 )
+    {
+        paddr_t load_end;
+        paddr_t ram128mb;
+
+        ram128mb = bank_start + MB(128);
+        load_end = bank_start + bank_size;
+        load_end = min(ram128mb, load_end);
+
+        if ( load_end - bank_start < info->image.len )
+            return INVALID_PADDR;
+
+        load_addr = load_end - info->image.len;
+        /* Align to 2MB */
+        load_addr &= ~(MB(2) - 1);
+        if ( load_addr < bank_start )
+            return INVALID_PADDR;
+    }
+    else
+        load_addr = info->image.start;
+
+    return load_addr;
+}
+
+static bool __init
+first_bank_has_enough_room(paddr_t ramsize, paddr_t kernbase,
+                           paddr_t kernend, paddr_t modsize)
+{
     const paddr_t kernsize = ROUNDUP(kernend, MB(2)) - kernbase;
-    const paddr_t ram128mb = rambase + MB(128);
 
-    paddr_t modbase;
+    /*
+     * Check only the aggregate kernel/module footprint. The actual DTB/initrd
+     * location is selected by find_module_placement().
+     */
+    return modsize + kernsize <= ramsize;
+}
 
-    if ( modsize + kernsize > ramsize )
-        panic("Not enough memory in the first bank for the kernel+dtb+initrd\n");
+static bool __init
+find_module_placement(paddr_t rambase, paddr_t ramsize,
+                      paddr_t kernbase, paddr_t kernend,
+                      paddr_t modsize, paddr_t *modbase)
+{
+    const paddr_t ramend = rambase + ramsize;
+    const paddr_t ram128mb = rambase + MB(128);
 
     /*
      * DTB must be loaded such that it does not conflict with the
@@ -80,17 +120,49 @@ static void __init place_modules(struct kernel_info *info,
      * tools/libxc/xc_dom_arm.c:arch_setup_meminit as well.
      */
     if ( ramend >= ram128mb + modsize && kernend < ram128mb )
-        modbase = ram128mb;
-    else if ( ramend - modsize > ROUNDUP(kernend, MB(2)) )
-        modbase = ramend - modsize;
-    else if ( kernbase - rambase > modsize )
-        modbase = kernbase - modsize;
-    else
     {
-        panic("Unable to find suitable location for dtb+initrd\n");
-        return;
+        *modbase = ram128mb;
+        return true;
+    }
+
+    if ( ramend - modsize > ROUNDUP(kernend, MB(2)) )
+    {
+        *modbase = ramend - modsize;
+        return true;
+    }
+
+    if ( kernbase - rambase > modsize )
+    {
+        *modbase = kernbase - modsize;
+        return true;
     }
 
+    return false;
+}
+
+static void __init place_modules(struct kernel_info *info,
+                                 paddr_t kernbase, paddr_t kernend)
+{
+    /* Align DTB and initrd size to 2Mb. Linux only requires 4 byte alignment */
+    const struct boot_module *mod = info->bd.initrd;
+    const struct membanks *mem = kernel_info_get_mem(info);
+    const paddr_t initrd_len = ROUNDUP(mod ? mod->size : 0, MB(2));
+    const paddr_t dtb_len = ROUNDUP(fdt_totalsize(info->fdt), MB(2));
+    const paddr_t modsize = initrd_len + dtb_len;
+
+    /* Convenient */
+    const paddr_t rambase = mem->bank[0].start;
+    const paddr_t ramsize = mem->bank[0].size;
+
+    paddr_t modbase;
+
+    if ( !first_bank_has_enough_room(ramsize, kernbase, kernend, modsize) )
+        panic("Not enough memory in the first bank for the kernel+dtb+initrd\n");
+
+    if ( !find_module_placement(rambase, ramsize, kernbase, kernend, modsize,
+                                &modbase) )
+        panic("Unable to find suitable location for dtb+initrd\n");
+
     info->dtb_paddr = modbase;
     info->initrd_paddr = info->dtb_paddr + dtb_len;
 }
@@ -100,32 +172,51 @@ static paddr_t __init kernel_zimage_place(struct kernel_info *info)
     const struct membanks *mem = kernel_info_get_mem(info);
     paddr_t load_addr;
 
-#ifdef CONFIG_HAS_DOMAIN_TYPE
-    if ( (info->type == DOMAIN_64BIT) && (info->image.start == 0) )
-        return mem->bank[0].start + info->image.text_offset;
-#endif
+    load_addr = kernel_zimage_place_in_bank(info, mem->bank[0].start,
+                                            mem->bank[0].size);
+    if ( load_addr == INVALID_PADDR )
+        panic("Unable to find suitable location for the kernel\n");
 
+    return load_addr;
+}
+
+bool __init arch_hwdom_first_bank_ok(const struct kernel_info *info,
+                                     paddr_t bank_start,
+                                     paddr_t bank_size)
+{
+    const struct boot_module *initrd = info->bd.initrd;
     /*
-     * If start is zero, the zImage is position independent, in this
-     * case Documentation/arm/Booting recommends loading below 128MiB
-     * and above 32MiB. Load it as high as possible within these
-     * constraints, while also avoiding the DTB.
+     * place_modules() rounds the DTB and initrd placement to 2MB boundaries;
+     * use the same granularity when checking whether the first bank can hold
+     * the boot modules.
      */
-    if ( info->image.start == 0 )
-    {
-        paddr_t load_end;
+    const paddr_t initrd_len = ROUNDUP(initrd ? initrd->size : 0, MB(2));
+    /*
+     * The hardware domain FDT has not been generated yet. Use the allocation
+     * size as a conservative upper bound for the final DTB size.
+     */
+    const paddr_t dtb_len = ROUNDUP(hwdom_get_fdt_alloc_size(), MB(2));
+    const paddr_t rambase = bank_start;
+    const paddr_t ramsize = bank_size;
+    const paddr_t modsize = initrd_len + dtb_len;
+    const paddr_t ramend = rambase + ramsize;
+    paddr_t kernbase;
+    paddr_t kernend;
+    paddr_t modbase;
 
-        load_end = mem->bank[0].start + mem->bank[0].size;
-        load_end = MIN(mem->bank[0].start + MB(128), load_end);
+    kernbase = kernel_zimage_place_in_bank(info, bank_start, bank_size);
+    if ( kernbase == INVALID_PADDR ||
+         info->image.len > INVALID_PADDR - kernbase )
+        return false;
 
-        load_addr = load_end - info->image.len;
-        /* Align to 2MB */
-        load_addr &= ~((2 << 20) - 1);
-    }
-    else
-        load_addr = info->image.start;
+    kernend = kernbase + info->image.len;
 
-    return load_addr;
+    if ( kernbase < rambase || kernend > ramend )
+        return false;
+
+    return first_bank_has_enough_room(ramsize, kernbase, kernend, modsize) &&
+           find_module_placement(rambase, ramsize, kernbase, kernend, modsize,
+                                 &modbase);
 }
 
 static void __init kernel_zimage_load(struct kernel_info *info)
diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
index 2a760b007b..25bc392fea 100644
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
          * The first bank must be large enough for place_modules() to
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
index 00c37be101..86f2a69ede 100644
--- a/xen/include/xen/fdt-kernel.h
+++ b/xen/include/xen/fdt-kernel.h
@@ -93,6 +93,15 @@ kernel_info_get_mem_const(const struct kernel_info *kinfo)
     return container_of(&kinfo->mem.common, const struct membanks, common);
 }
 
+#ifndef arch_hwdom_first_bank_ok
+static inline bool
+arch_hwdom_first_bank_ok(const struct kernel_info *info, paddr_t bank_start,
+                         paddr_t bank_size)
+{
+    return true;
+}
+#endif
+
 #ifndef KERNEL_INFO_SHM_MEM_INIT
 
 #ifdef CONFIG_STATIC_SHM
-- 
2.43.0


