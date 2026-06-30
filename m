Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yreLE9R/Q2qCZQoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 10:35:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9392A6E1B52
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 10:35:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=google header.b=LcEakgAe;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com
Received: from list by lists.xenproject.org with outflank-mailman.1348511.1606251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weTvc-0001eY-IC; Tue, 30 Jun 2026 08:34:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348511.1606251; Tue, 30 Jun 2026 08:34:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weTvc-0001cA-FV; Tue, 30 Jun 2026 08:34:48 +0000
Received: by outflank-mailman (input) for mailman id 1348511;
 Tue, 30 Jun 2026 08:34:47 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1weTvb-0001c3-3J
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 08:34:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weTvY-003PS9-SO
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 10:34:44 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a437fa3-2eae-0a2a0a5409dd-0a2a450bdf58-6
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 10:34:44 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a437fa4-ac48-0a2a450b0019-d155dd2eed29-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 10:34:44 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-47231f1f8f3so3501349f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 01:34:44 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4756636d2cfsm6306996f8f.17.2026.06.30.01.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 01:34:43 -0700 (PDT)
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
        d=citrix.com; s=google; t=1782808484; x=1783413284; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Stvk80CR3chS5Z0V0o9Pg2KxjOrTFl4jjb9JGEwO3GY=;
        b=LcEakgAeM/YIyC5+Y6DpF7OAFi4sP7ljYEsK2YLLlIsrz+pF2+4SF9o0KgEMWypy0r
         ozQiXLvSHYClfItJPr6v37Ef0HzY2csGCLeakx+6jSUWlW1B807TzcBwTXZjfFfW+I/C
         6aqlnHShDquXw5PwPwWBtbmd/UcVTEfcTBG60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782808484; x=1783413284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Stvk80CR3chS5Z0V0o9Pg2KxjOrTFl4jjb9JGEwO3GY=;
        b=UQ7wdnBNFV4GmCx/E+tt+oX7QJNbKHNeGrGqSY5j4DsHi3Qpg7uaSYXVd95HB22dbH
         yzdoaqft10FqxOOfBRXxIa11s1C55zAwe636bXtbNlHMHyztoPsaPPETqnWnKsYTsotx
         vhogpQu8dXkJJwmr44bFBGDW4XtPejML2/P12LaNGZ+0O+3cIi5IBg0GpNoPxgPIV0yN
         cFqgNBNm4+mV1s5Jm42//VoejH9croN71ERJqQEOsNWNxrjkJNkXz0r8J9zq1GOY6nVa
         x/3ApOE3m6rfrElodIRTAAGjT/FDJn2IZNQ5TsQdXhx9YH2InlccJpHlo20trh9hLlyl
         XD/g==
X-Gm-Message-State: AOJu0YyLhpji9HtE1bL/bNkSc/5Ymymo0iCyjON0rKTuybUNkxg+DBLd
	Gou8M9NZqcD5n5RgKkEbffVSitaC8Mp282YnmvuSaaIXksB5xuKg1+LUclnouPIplL9iMEINN/3
	MfvVj3uY=
X-Gm-Gg: AfdE7cnl/k2t6m5aHDjEQNSxjb15/wfD2tu/Fly4mUg86p9eQ2MJXJVmaM9cW3s2W11
	vfkC2tJT2vZd75JrjRaWqdcteRhBWS4Jo1Od2jrE2lTUlAiuci3fhBc2keH15o0ZpkJgJIejYep
	1+masEUfUAgGhhSl+THOqks67I02uvOTxlO8f/+K2Vz7TNZvGYY0l4YlHeJTzMRKm1ihgDyf0Uf
	0H26DcSdkF6Tqevgzmq3VaCnpLPgJpFp8YslutWYEfSxuH+/PgbGoRJzH2fw3AwKOdz6I37HtpD
	lMl1XU1tNxX4gQJYW5P3Wo/EIoEgWDeSVjdiHuIF16c6KYixEm6TaQ5lpVxVhG+4FPygPz3SILy
	EglBiyPkXN52zRYrl9j930QC1EmheT4vXRvKnNqmycnYfejTNzQ+aiY5ByrLd1QFObmUB390IAl
	PFx67SC/voKYSy/GvVLOyFrklBsNzoQlHfH9ZvTehUd0Ihn7re4xIBZzQpDYNb4RwERKf+XCSqB
	Q==
X-Received: by 2002:adf:ed44:0:b0:474:64bf:8fb6 with SMTP id ffacd0b85a97d-47552f33493mr2549497f8f.39.1782808483817;
        Tue, 30 Jun 2026 01:34:43 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.22 v2] xen/mm: Remove INVALID_{MFN,GFN}_INITIALIZER
Date: Tue, 30 Jun 2026 09:34:41 +0100
Message-Id: <20260630083441.726684-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1782808484-40942220-2835CC53/10/73395122804
X-purgate-type: spam
X-purgate-size: 5580
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,epam.com,arm.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,vates.tech:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9392A6E1B52

These existed to work around a bug in older GCC when using struct-casting for
variable initialisation.  However, our baseline toolchain is new enough to not
suffer this bug.

Removing these resolves two MISRA Rule 9.2 violations which exist in release
builds of Xen only, where "= { ... }" is disallowed for simple scalar
initialisation.

The BUILD_BUG_ON() in xenmem_add_to_physmap() cannot stay as it is, because
INVALID_GFN is not an Integer Constant Expression.  Replace it BUILD_ERROR()
which is the nearest available alternative.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

v2:
 * Drop INVALID_{MFN,GFN}_INITIALIZER entirely.

For 4.22.  staging-4.22 is currently blocked by this bug, following the switch
from debug builds to release builds.

Passing pipeline:
  https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2638483933
---
 xen/arch/arm/mmu/setup.c   |  2 +-
 xen/arch/riscv/mm.c        |  2 +-
 xen/arch/x86/efi/runtime.h |  2 +-
 xen/common/memory.c        |  4 +++-
 xen/common/page_alloc.c    |  2 +-
 xen/include/xen/mm-frame.h | 16 ++--------------
 6 files changed, 9 insertions(+), 19 deletions(-)

diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
index d042f7359703..8fb0157aff98 100644
--- a/xen/arch/arm/mmu/setup.c
+++ b/xen/arch/arm/mmu/setup.c
@@ -59,7 +59,7 @@ DEFINE_BOOT_PAGE_TABLE(xen_fixmap);
 static DEFINE_PAGE_TABLES(xen_xenmap, XEN_NR_ENTRIES(2));
 
 /* Limits of the Xen heap */
-mfn_t directmap_mfn_start __read_mostly = INVALID_MFN_INITIALIZER;
+mfn_t directmap_mfn_start __read_mostly = INVALID_MFN;
 mfn_t directmap_mfn_end __read_mostly;
 vaddr_t directmap_virt_end __read_mostly;
 #ifdef CONFIG_ARM_64
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index e9ce182d066c..4d3b8c220442 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -480,7 +480,7 @@ static void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
 static void __init setup_directmap_mappings(unsigned long base_mfn,
                                             unsigned long nr_mfns)
 {
-    static mfn_t __initdata directmap_mfn_start = INVALID_MFN_INITIALIZER;
+    static mfn_t __initdata directmap_mfn_start = INVALID_MFN;
 
     mfn_t base_mfn_t = _mfn(base_mfn);
     unsigned long base_addr = mfn_to_maddr(base_mfn_t);
diff --git a/xen/arch/x86/efi/runtime.h b/xen/arch/x86/efi/runtime.h
index 88ab5651e9ce..f92d7af95e00 100644
--- a/xen/arch/x86/efi/runtime.h
+++ b/xen/arch/x86/efi/runtime.h
@@ -7,7 +7,7 @@
 #include <asm/mc146818rtc.h>
 
 #ifndef COMPAT
-mfn_t __read_mostly efi_l4_mfn = INVALID_MFN_INITIALIZER;
+mfn_t __read_mostly efi_l4_mfn = INVALID_MFN;
 
 void efi_update_l4_pgtable(unsigned int l4idx, l4_pgentry_t l4e)
 {
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 3672bda0253d..2ca7723e50aa 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -991,7 +991,9 @@ int xenmem_add_to_physmap(struct domain *d, struct xen_add_to_physmap *xatp,
          * guaranteeing that it won't fall in the middle of the
          * [xatp->gpfn, xatp->gpfn + xatp->size) range checked above.
          */
-        BUILD_BUG_ON(INVALID_GFN_RAW + 1);
+        if ( gfn_x(INVALID_GFN) + 1 )
+            BUILD_ERROR("bad INVALID_GFN");
+
         return -EOVERFLOW;
     }
 
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index e01ac3e99c72..40b0f73563a5 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -275,7 +275,7 @@ static PAGE_LIST_HEAD(page_broken_list);
  * When !CONFIG_NUMA first_valid_mfn is non-static, for use by respective
  * stubs.
  */
-STATIC_IF(CONFIG_NUMA) mfn_t first_valid_mfn = INVALID_MFN_INITIALIZER;
+STATIC_IF(CONFIG_NUMA) mfn_t first_valid_mfn = INVALID_MFN;
 
 struct bootmem_region {
     unsigned long s, e; /* MFNs @s through @e-1 inclusive are free */
diff --git a/xen/include/xen/mm-frame.h b/xen/include/xen/mm-frame.h
index d973aec901fa..1402c2049778 100644
--- a/xen/include/xen/mm-frame.h
+++ b/xen/include/xen/mm-frame.h
@@ -6,13 +6,7 @@
 
 TYPE_SAFE(unsigned long, mfn);
 #define PRI_mfn          "05lx"
-#define INVALID_MFN_RAW  (~0UL)
-#define INVALID_MFN      _mfn(INVALID_MFN_RAW)
-/*
- * To be used for global variable initialization. This workaround a bug
- * in GCC < 5.0.
- */
-#define INVALID_MFN_INITIALIZER { INVALID_MFN_RAW }
+#define INVALID_MFN      ((mfn_t){ ~0UL })
 
 #if 0
 #define mfn_t /* Grep fodder: mfn_t, _mfn() and mfn_x() are defined above */
@@ -42,13 +36,7 @@ static inline bool mfn_eq(mfn_t x, mfn_t y)
 
 TYPE_SAFE(unsigned long, gfn);
 #define PRI_gfn          "05lx"
-#define INVALID_GFN_RAW  (~0UL)
-#define INVALID_GFN      _gfn(INVALID_GFN_RAW)
-/*
- * To be used for global variable initialization. This workaround a bug
- * in GCC < 5.0 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=64856
- */
-#define INVALID_GFN_INITIALIZER { INVALID_GFN_RAW }
+#define INVALID_GFN      ((gfn_t){ ~0UL })
 
 #if 0
 #define gfn_t /* Grep fodder: gfn_t, _gfn() and gfn_x() are defined above */
-- 
2.39.5


