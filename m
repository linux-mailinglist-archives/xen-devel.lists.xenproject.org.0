Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLHiMO5qwWnVSwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 17:31:42 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 711852F83FF
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 17:31:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259480.1552810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4iBi-00085u-HF; Mon, 23 Mar 2026 16:31:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259480.1552810; Mon, 23 Mar 2026 16:31:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4iBi-00083t-Cu; Mon, 23 Mar 2026 16:31:34 +0000
Received: by outflank-mailman (input) for mailman id 1259480;
 Mon, 23 Mar 2026 16:31:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n/J7=BX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1w4iBh-0005Bu-Fk
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 16:31:33 +0000
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfbc9c21-26d5-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Mar 2026 17:31:31 +0100 (CET)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-b97ba4c2be2so55769266b.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 09:31:31 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9832f8be14sm536248166b.17.2026.03.23.09.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2026 09:31:24 -0700 (PDT)
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
X-Inumbo-ID: bfbc9c21-26d5-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774283490; x=1774888290; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1qaV10ihMFV1jFtGW95X77joTg/NVVxfQDdtdd2358=;
        b=pVjJ6K/twCoz8DZmff6UFa/z+pgdMFXpITKbM7R9D35D74XzxbC8UpcXJG30WlzvdR
         h9SFLNoO+xjIIuSJSzRjhgSg7eWlZaUkZ5JtLPuwfj7wSNYwNNioGYb/3hobM7+ILzqo
         +2R5wn3ayQK+OIhxgoRYfytvSkyfXF6hk0Yq9Gdd/MAC3SCSQPL0EX0EBa1Zjcj2KTXe
         jpFiQsBvnd5rKD6TKybfCRe7FNssWOJZa5WrSTLsWty/mBbt03PRPc+j1gvzCajNNg8c
         DJNI7bF8p4RkZqJV8Q5CtJhTwDaCXwJbJ86sLwu3U/D+RFf0uI4GN+pijC2Vk+3qePFG
         edCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774283490; x=1774888290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r1qaV10ihMFV1jFtGW95X77joTg/NVVxfQDdtdd2358=;
        b=aZOr5MKFWSHj0tGD3OQQdGpMlFQoXuPzhEbbes68DVlja7Oe1U4M5FE+IV3DIpoLJ5
         mzfzgaBA4sZDHfvnALCD1PYBS22aTIbA3xY63jVlAdyfadbwx+FAEX4TB8U4xSC4CgDd
         QqmMEpnDXV1ulWlf1vbaQoyS4uiDQiQVMWArUBJZnC+a6LaxRlfbYmx/sJZB8ovtsYPz
         uL5fyMhikVb9R01EDYoQ0qA/t4hmCJxLvIsoKj/uVqORUKtNKxguvUK6s0SNke4v95jw
         6VXj/B3tclRuar7xKrGMYns6Z4/DrgBd//sBoONUPGuFSTGJKNTvuqGNem05bGIbvY/N
         4/Tw==
X-Gm-Message-State: AOJu0Yx+SM05TUkSu9VSb76xMMFXusQsbia7T01XQGMbL5r9oxdUYRGc
	SsE+KqI9D5nJgU+xmxjKV/RCXGnG+zAnrHGCtTI2K17n2wyGZXebizjaMoiC8w==
X-Gm-Gg: ATEYQzzMixmuGf4OxOLaBNh0Fzb1ljoWcnPEX1pPTMa8IDgcUtVJu41c4Qn7Ne03HdL
	XiRx6luMSOMLvXyULvMA9U7q9n+PLHL9StCe5Eh4yQX17Uu8Rpm9WY4xsXYMR3sEcWw0dv1Ax5f
	35e+wvuT89Tr9Q/OnxtC+UB8nL1pFH+x6ywPMmnDjUBBGKFSIboMy4Y6svlvMZxzV+jMNKCbWuA
	KGm0C0J8Mk+l5O6qhucZgmEX5Z/No2iir+dhSvpJIBrqQmS/r+59eMB8AZ+Z7PniyAo+/S5Tb4T
	B5wFr1mYdjuwj6Mg1CiNjx2uZY6e1QCRNF2tuxLU1NuOfpvzkWWrbkXJNA+woZw7gjaEkU9szZz
	6V4ECi96JXolBmo042RYM8bQ9qxaOyQ8/6WFNW3jEhdt6eO149unAByxL1r8zooGvvHrUuYSMEe
	eo5TKzGlwLyuuwkk8OowUrCl7++CDKj4YY1PDVDeN9BHm9z4pU9/VMoyMEIlMXGB7ZwQ==
X-Received: by 2002:a17:907:3f20:b0:b98:53d5:9b20 with SMTP id a640c23a62f3a-b9853d5b03dmr517013766b.12.1774283490285;
        Mon, 23 Mar 2026 09:31:30 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Rahul Singh <rahul.singh@arm.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 08/11] xen: rename p2m_ipa_bits to p2m_gpa_bits
Date: Mon, 23 Mar 2026 17:29:49 +0100
Message-ID: <05365c2b70147f30fd97a2fe5b7ab66d773c0f32.1774281309.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1774281309.git.oleksii.kurochko@gmail.com>
References: <cover.1774281309.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:rahul.singh@arm.com,m:jbeulich@suse.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,kernel.org,xen.org,arm.com,amd.com,epam.com,suse.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 711852F83FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The IPA terminology is Arm-specific, so rename p2m_ipa_bits to
p2m_gpa_bits to use architecture-neutral naming.

No functional changes.

Reported-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v2:
 - New patch
---
 xen/arch/arm/domain_build.c              | 12 ++++++------
 xen/arch/arm/domctl.c                    |  2 +-
 xen/arch/arm/include/asm/p2m.h           |  4 ++--
 xen/arch/arm/mmu/p2m.c                   | 18 +++++++++---------
 xen/arch/arm/p2m.c                       |  6 +++---
 xen/common/device-tree/domain-build.c    |  2 +-
 xen/drivers/passthrough/arm/ipmmu-vmsa.c |  4 ++--
 xen/drivers/passthrough/arm/smmu-v3.c    |  2 +-
 xen/drivers/passthrough/arm/smmu.c       |  2 +-
 9 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index e8795745ddc7..38ab41ec6b19 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -744,7 +744,7 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
 
     /* Start with maximum possible addressable physical memory range */
     start = 0;
-    end = (1ULL << p2m_ipa_bits) - 1;
+    end = (1ULL << p2m_gpa_bits) - 1;
     res = rangeset_add_range(mem_holes, PFN_DOWN(start), PFN_DOWN(end));
     if ( res )
     {
@@ -815,7 +815,7 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
     }
 
     start = 0;
-    end = (1ULL << p2m_ipa_bits) - 1;
+    end = (1ULL << p2m_gpa_bits) - 1;
     res = rangeset_report_ranges(mem_holes, PFN_DOWN(start), PFN_DOWN(end),
                                  add_ext_regions,  ext_regions);
     if ( res )
@@ -849,7 +849,7 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
 
         start = ROUNDUP(bankbase[i] + kinfo_mem->bank[i].size, SZ_2M);
 
-        bankend = ~0ULL >> (64 - p2m_ipa_bits);
+        bankend = ~0ULL >> (64 - p2m_gpa_bits);
         bankend = min(bankend, bankbase[i] + banksize[i] - 1);
 
         if ( bankend > start )
@@ -881,7 +881,7 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
     }
 
     res = rangeset_report_ranges(mem_holes, 0,
-                                 PFN_DOWN((1ULL << p2m_ipa_bits) - 1),
+                                 PFN_DOWN((1ULL << p2m_gpa_bits) - 1),
                                  add_ext_regions, ext_regions);
     if ( res )
         ext_regions->nr_banks = 0;
@@ -907,7 +907,7 @@ static unsigned int __init count_ranges(struct rangeset *r)
 {
     unsigned int cnt = 0;
 
-    (void) rangeset_report_ranges(r, 0, PFN_DOWN((1ULL << p2m_ipa_bits) - 1),
+    (void) rangeset_report_ranges(r, 0, PFN_DOWN((1ULL << p2m_gpa_bits) - 1),
                                   count, &cnt);
 
     return cnt;
@@ -972,7 +972,7 @@ static int __init find_host_extended_regions(const struct kernel_info *kinfo,
         }
 
         rangeset_report_ranges(kinfo->xen_reg_assigned, 0,
-                               PFN_DOWN((1ULL << p2m_ipa_bits) - 1),
+                               PFN_DOWN((1ULL << p2m_gpa_bits) - 1),
                                rangeset_to_membank, xen_reg);
     }
 
diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
index ad914c915f81..d8db595ab348 100644
--- a/xen/arch/arm/domctl.c
+++ b/xen/arch/arm/domctl.c
@@ -23,7 +23,7 @@ void arch_get_domain_info(const struct domain *d,
     /* All ARM domains use hardware assisted paging. */
     info->flags |= XEN_DOMINF_hap;
 
-    info->gpaddr_bits = p2m_ipa_bits;
+    info->gpaddr_bits = p2m_gpa_bits;
 }
 
 static int handle_vuart_init(struct domain *d, 
diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index 010ce8c9ebbd..b15b57aa32bd 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -12,7 +12,7 @@
 #define paddr_bits PADDR_BITS
 
 /* Holds the bit size of IPAs in p2m tables.  */
-extern unsigned int p2m_ipa_bits;
+extern unsigned int p2m_gpa_bits;
 
 #define MAX_VMID_8_BIT  (1UL << 8)
 #define MAX_VMID_16_BIT (1UL << 16)
@@ -186,7 +186,7 @@ static inline bool arch_acquire_resource_check(struct domain *d)
 }
 
 /*
- * Helper to restrict "p2m_ipa_bits" according the external entity
+ * Helper to restrict "p2m_gpa_bits" according the external entity
  * (e.g. IOMMU) requirements.
  *
  * Each corresponding driver should report the maximum IPA bits
diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 51abf3504fcf..08871c61b812 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -1734,11 +1734,11 @@ void __init setup_virt_paging(void)
     } t0sz_32;
 #else
     /*
-     * Restrict "p2m_ipa_bits" if needed. As P2M table is always configured
+     * Restrict "p2m_gpa_bits" if needed. As P2M table is always configured
      * with IPA bits == PA bits, compare against "pabits".
      */
-    if ( pa_range_info[system_cpuinfo.mm64.pa_range].pabits < p2m_ipa_bits )
-        p2m_ipa_bits = pa_range_info[system_cpuinfo.mm64.pa_range].pabits;
+    if ( pa_range_info[system_cpuinfo.mm64.pa_range].pabits < p2m_gpa_bits )
+        p2m_gpa_bits = pa_range_info[system_cpuinfo.mm64.pa_range].pabits;
 
     /*
      * cpu info sanitization made sure we support 16bits VMID only if all
@@ -1748,10 +1748,10 @@ void __init setup_virt_paging(void)
         max_vmid = MAX_VMID_16_BIT;
 #endif
 
-    /* Choose suitable "pa_range" according to the resulted "p2m_ipa_bits". */
+    /* Choose suitable "pa_range" according to the resulted "p2m_gpa_bits". */
     for ( i = 0; i < ARRAY_SIZE(pa_range_info); i++ )
     {
-        if ( p2m_ipa_bits == pa_range_info[i].pabits )
+        if ( p2m_gpa_bits == pa_range_info[i].pabits )
         {
             pa_range = i;
             break;
@@ -1760,7 +1760,7 @@ void __init setup_virt_paging(void)
 
     /* Check if we found the associated entry in the array */
     if ( pa_range >= ARRAY_SIZE(pa_range_info) || !pa_range_info[pa_range].pabits )
-        panic("%u-bit P2M is not supported\n", p2m_ipa_bits);
+        panic("%u-bit P2M is not supported\n", p2m_gpa_bits);
 
 #ifdef CONFIG_ARM_64
     val |= VTCR_PS(pa_range);
@@ -1778,14 +1778,14 @@ void __init setup_virt_paging(void)
     p2m_root_level = 2 - pa_range_info[pa_range].sl0;
 
 #ifdef CONFIG_ARM_64
-    p2m_ipa_bits = 64 - pa_range_info[pa_range].t0sz;
+    p2m_gpa_bits = 64 - pa_range_info[pa_range].t0sz;
 #else
     t0sz_32.val = pa_range_info[pa_range].t0sz;
-    p2m_ipa_bits = 32 - t0sz_32.val;
+    p2m_gpa_bits = 32 - t0sz_32.val;
 #endif
 
     printk("P2M: %d-bit IPA with %d-bit PA and %d-bit VMID\n",
-           p2m_ipa_bits,
+           p2m_gpa_bits,
            pa_range_info[pa_range].pabits,
            ( MAX_VMID == MAX_VMID_16_BIT ) ? 16 : 8);
 
diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index fb03978a19af..5564e7d3c1db 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -19,7 +19,7 @@ unsigned int __read_mostly max_vmid = MAX_VMID_8_BIT;
  * Set to the maximum configured support for IPA bits, so the number of IPA bits can be
  * restricted by external entity (e.g. IOMMU).
  */
-unsigned int __read_mostly p2m_ipa_bits = PADDR_BITS;
+unsigned int __read_mostly p2m_gpa_bits = PADDR_BITS;
 
 /* Unlock the flush and do a P2M TLB flush if necessary */
 void p2m_write_unlock(struct p2m_domain *p2m)
@@ -603,8 +603,8 @@ void __init p2m_restrict_ipa_bits(unsigned int ipa_bits)
      * Calculate the minimum of the maximum IPA bits that any external entity
      * can support.
      */
-    if ( ipa_bits < p2m_ipa_bits )
-        p2m_ipa_bits = ipa_bits;
+    if ( ipa_bits < p2m_gpa_bits )
+        p2m_gpa_bits = ipa_bits;
 }
 
 /*
diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
index 6708c9dd66e6..362da1cae780 100644
--- a/xen/common/device-tree/domain-build.c
+++ b/xen/common/device-tree/domain-build.c
@@ -220,7 +220,7 @@ int __init find_unallocated_memory(const struct kernel_info *kinfo,
     }
 
     start = 0;
-    end = (1ULL << p2m_ipa_bits) - 1;
+    end = (1ULL << p2m_gpa_bits) - 1;
     res = rangeset_report_ranges(unalloc_mem, PFN_DOWN(start), PFN_DOWN(end),
                                  cb, free_regions);
     if ( res )
diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
index ea9fa9ddf3ce..e2b4c95dcc67 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -575,11 +575,11 @@ static int ipmmu_domain_init_context(struct ipmmu_vmsa_domain *domain)
 
     /*
      * TTBCR
-     * We use long descriptors and allocate the whole "p2m_ipa_bits" IPA space
+     * We use long descriptors and allocate the whole "p2m_gpa_bits" IPA space
      * to TTBR0. Use 4KB page granule. Start page table walks at first level.
      * Always bypass stage 1 translation.
      */
-    tsz0 = (64 - p2m_ipa_bits) << IMTTBCR_TSZ0_SHIFT;
+    tsz0 = (64 - p2m_gpa_bits) << IMTTBCR_TSZ0_SHIFT;
     ipmmu_ctx_write_root(domain, IMTTBCR, IMTTBCR_EAE | IMTTBCR_PMB |
                          IMTTBCR_SL0_LVL_1 | tsz0);
 
diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index bf153227dbd9..9e86cd7b0ad0 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -1202,7 +1202,7 @@ static int arm_smmu_domain_finalise_s2(struct arm_smmu_domain *smmu_domain,
 		return -EINVAL;
 	}
 
-	vtcr->tsz = 64 - p2m_ipa_bits;
+	vtcr->tsz = 64 - p2m_gpa_bits;
 	vtcr->sl = 2 - P2M_ROOT_LEVEL;
 
 	arm_lpae_s2_cfg.vttbr  = page_to_maddr(smmu_domain->d->arch.p2m.root);
diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 22d306d0cb80..fa28fd7db79c 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -1276,7 +1276,7 @@ static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain)
 			 * Xen: The IOMMU share the page-tables with the P2M
 			 * which may have restrict the size further.
 			 */
-			reg |= (64 - p2m_ipa_bits) << TTBCR_T0SZ_SHIFT;
+			reg |= (64 - p2m_gpa_bits) << TTBCR_T0SZ_SHIFT;
 
 			switch (smmu->s2_output_size) {
 			case 32:
-- 
2.53.0


