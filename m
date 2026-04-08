Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PYcJApF1mkFCwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 14:07:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0F23BBC2F
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 14:07:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275849.1561546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wARgu-0006rX-7M; Wed, 08 Apr 2026 12:07:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275849.1561546; Wed, 08 Apr 2026 12:07:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wARgu-0006om-24; Wed, 08 Apr 2026 12:07:28 +0000
Received: by outflank-mailman (input) for mailman id 1275849;
 Wed, 08 Apr 2026 12:07:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wARgs-0006oe-MS
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 12:07:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wARgs-008Z6c-2M
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 14:07:26 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d644fb-e002-0a2a0a5209dd-0a2a4506c456-18
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 14:07:26 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d644fd-0df0-0a2a45060019-d1558036d563-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 14:07:25 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-488ba840146so21031555e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 05:07:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e83e906sm711784085e9.8.2026.04.08.05.07.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Apr 2026 05:07:25 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775650045; x=1776254845; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aG+RUv/dtU6SC+Cni5NhuYWHX3yaBTUGBmElr9tgZk0=;
        b=C3sMV1zul2bfwgnP/RiDRF48bxBkH7hHOi25VAEfGmzo+LSktFcmszN4goUkUPArf2
         xEs3YIH4a7t3y+KhND/GSvFI4uJ999x1EWHrl9Ck7H8iOXzI04keZ2tg+NCFWL2UwN32
         xFkUieoVzumLaCmy73AfAu7cwekpGwDdJIPAo5eI0JqJMsap6NpuQtsdMWaBEFCqc7tb
         0MeJHs92SznJ23gbapDxY2ZMyvZEt48LBHg6OsTzgHRbVipKFs/ARpgYZwfvQsKSRzni
         I9cjPp97ttZ+f7OEtjNd6fJPsoYFQwUYQ6OOxeq9DfLSU2bQKc8bKiGO0hLmRjVbD+H9
         Ix2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775650045; x=1776254845;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aG+RUv/dtU6SC+Cni5NhuYWHX3yaBTUGBmElr9tgZk0=;
        b=b35okrlv9/VLyYymNsPBxLQ3axJg0PfrlndSR2NYSSyqdIPfdUT91u2WMYadq0rEjy
         WvqHGlW/Ck1QI8TXUY/kfyu2lw0W9a1CtaILdIn7QC2TOYgHG9um/81YoTtMRaz8zGnF
         nVSL9cxOoDmfvTFk+WPwy1pMAfhfigvYK18+iAfzZuYMYCpK/guVHqhqV5m2VSrnU4zi
         GVYqvjretmocb6vzGsdO3/HOntzUbjD+f/8t0aXN1i9gFiu1LtwsQholkEHmpd5dh2o5
         C9461tzrhSsKa4DLtQZ2Dseizb/NHboZIeiPM3Mn5xgnQXs3Lvsf8Lz65+huTkGmYG51
         89uA==
X-Gm-Message-State: AOJu0YxSuzfb9HmkUV0Hv7FqpGaw5uTAgf8FF+o9mV/U5E+xKSMXoXu2
	Nw2/F86ewke28+ao8e5v1BwMgHLa8X+6gNzQ+je6htt3R0Bse9RsfHkMH8x2RU1TblXXF3moJ1b
	j+EMXLA==
X-Gm-Gg: AeBDiesxU0HtyxOnXkW8pkE07yApQW6LMr36Ho+x0OtKBGtWd9C9aRWsuBjrP2LPVR/
	bezOO/aF55IIhVSO/kLkqAAMEJLxSckT4foLuxqTch2TTNyQBiRx8zvOP62LoXCxGfqA8ZEYX8h
	KxmHxw7sreJvErHloxgEJgAwChHyd98qEbmJd9NVVjcxNz1QpuVMkGjw089VLUm//rmrjr/MQTA
	PMN/sFNfZhahdmJT3VXmtzEf1qQJiT0gYKA0VAuQ3FVyXJyTHwP9PYpvIfJeTHvCxsxPK1Awt+R
	A/CwF5mXTDYFA0S8k9Ty6s9ijoxdO+a5bSVdlPQp7W0m8lmgcX41LwgHZqkOEMR+HT7BfQMljNl
	VO/+6rJ0M5juVPtXH8t20bV2q3wRVV82Te/UFSo2wbzXedND7GMeoQkIgX2E8+hZrD5+sZaBNjZ
	oPcBsvrKyh5rTQRg5zrMleoVhPU2P6CxwjaXG7FR5C8WzBLhX0/WNHHlTUlPfFQmObGDB8ia5dK
	7qiN6Q+YzsOmdk=
X-Received: by 2002:a05:600c:c101:b0:488:c530:48a0 with SMTP id 5b1f17b1804b1-488c5304b22mr31835335e9.24.1775650045323;
        Wed, 08 Apr 2026 05:07:25 -0700 (PDT)
Message-ID: <72526f3a-726a-4a1e-8d80-1a336175c1af@suse.com>
Date: Wed, 8 Apr 2026 14:07:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 1/2] make ioremap_attr() common
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <145299a0-b25c-4612-82c6-9401a2f88ad2@suse.com>
Content-Language: en-US
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <145299a0-b25c-4612-82c6-9401a2f88ad2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1775650045-AFB3B3D8-ED1932D8/0/0
X-purgate-type: clean
X-purgate-size: 9895
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:bertrand.marquis@arm.com,m:volodymyr_babchuk@epam.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[citrix.com,xen.org,kernel.org,vates.tech,amd.com,wdc.com,gmail.com,arm.com,epam.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-0.993];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: DC0F23BBC2F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This core backing function is uniform; what varies across architectures
are the attributes passed and hence the wrappers around it. Yet of course
extra checking or special handling may be needed per arch, so introduce a
suitable hook.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Declarations (or inline counterparts) aren't being moved around, to avoid
the need to touch source files using the functions. Quite possibly they
want to consistently go into xen/io.h and asm/io.h.

Of course ioremap.c could also go into lib/.

For RISC-V the wrappers likely should become inline functions?

PPC doesn't reference any of the functions just yet, so gets only a
declaration.

For Arm, a TODO item is deliberately retained, yet seeing the use of
ioremap_wc() in domain building (which by itself is questionable, see next
patch) I wonder if that's even feasible as long as we don't have
memremap() or alike.
---
v2: Use conditional operator in ioremap_attr()'s final return. Re-base and
    leverage that to simplify ioremap_attr() itself.

--- a/xen/arch/arm/include/asm/io.h
+++ b/xen/arch/arm/include/asm/io.h
@@ -1,6 +1,8 @@
 #ifndef _ASM_IO_H
 #define _ASM_IO_H
 
+#include <xen/mm-types.h>
+
 #if defined(CONFIG_ARM_32)
 # include <asm/arm32/io.h>
 #elif defined(CONFIG_ARM_64)
@@ -9,6 +11,16 @@
 # error "unknown ARM variant"
 #endif
 
+#ifdef CONFIG_MPU
+void __iomem *mpu_ioremap_attr(paddr_t start, size_t len, pte_attr_t flags);
+#define arch_ioremap_attr mpu_ioremap_attr
+#else
+/*
+ * ioremap_attr() should only be used to remap device address ranges.
+ * TODO: Add an arch hook to verify this assumption.
+ */
+#endif
+
 #endif
 /*
  * Local variables:
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -5,6 +5,7 @@
 #include <asm/page.h>
 #include <public/xen.h>
 #include <xen/pdx.h>
+#include <xen/vmap.h>
 
 #if defined(CONFIG_ARM_32)
 # include <asm/arm32/mm.h>
@@ -200,13 +201,12 @@ extern int prepare_secondary_mm(int cpu)
 extern void setup_frametable_mappings(paddr_t ps, paddr_t pe);
 /* Helper function to setup memory management */
 void setup_mm_helper(void);
-/* map a physical range in virtual memory */
-void __iomem *ioremap_attr(paddr_t start, size_t len, unsigned int attributes);
 
 static inline void __iomem *ioremap_nocache(paddr_t start, size_t len)
 {
     return ioremap_attr(start, len, PAGE_HYPERVISOR_NOCACHE);
 }
+#define ioremap ioremap_nocache
 
 static inline void __iomem *ioremap_cache(paddr_t start, size_t len)
 {
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -455,11 +455,6 @@ unsigned long get_upper_mfn_bound(void)
     return max_page - 1;
 }
 
-void *ioremap(paddr_t pa, size_t len)
-{
-    return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
-}
-
 /*
  * Local variables:
  * mode: C
--- a/xen/arch/arm/mmu/pt.c
+++ b/xen/arch/arm/mmu/pt.c
@@ -206,23 +206,6 @@ void clear_fixmap(unsigned int map)
     BUG_ON(res != 0);
 }
 
-/*
- * This function should only be used to remap device address ranges
- * TODO: add a check to verify this assumption
- */
-void *ioremap_attr(paddr_t start, size_t len, unsigned int attributes)
-{
-    mfn_t mfn = _mfn(PFN_DOWN(start));
-    unsigned int offs = start & (PAGE_SIZE - 1);
-    unsigned int nr = PFN_UP(offs + len);
-    void *ptr = __vmap(&mfn, nr, 1, 1, attributes, VMAP_DEFAULT);
-
-    if ( ptr == NULL )
-        return NULL;
-
-    return ptr + offs;
-}
-
 static int create_xen_table(lpae_t *entry)
 {
     mfn_t mfn;
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -9,6 +9,8 @@
 #include <xen/sizes.h>
 #include <xen/spinlock.h>
 #include <xen/types.h>
+
+#include <asm/io.h>
 #include <asm/mpu.h>
 #include <asm/mpu/mm.h>
 #include <asm/page.h>
@@ -593,7 +595,7 @@ void free_init_memory(void)
     spin_unlock(&xen_mpumap_lock);
 }
 
-void __iomem *ioremap_attr(paddr_t start, size_t len, unsigned int flags)
+void __iomem *mpu_ioremap_attr(paddr_t start, size_t len, pte_attr_t flags)
 {
     paddr_t start_pg = round_pgdown(start);
     paddr_t end_pg = round_pgup(start + len);
--- a/xen/arch/ppc/include/asm/io.h
+++ b/xen/arch/ppc/include/asm/io.h
@@ -13,4 +13,6 @@
 #define writew(v,c)     ({ (void)(v); (void)(c); BUG_ON("unimplemented"); })
 #define writel(v,c)     ({ (void)(v); (void)(c); BUG_ON("unimplemented"); })
 
+void __iomem *ioremap(paddr_t pa, size_t len);
+
 #endif /* __ASM_PPC_IO_H__ */
--- a/xen/arch/riscv/include/asm/io.h
+++ b/xen/arch/riscv/include/asm/io.h
@@ -41,6 +41,7 @@
 #include <xen/macros.h>
 #include <xen/types.h>
 
+void __iomem *ioremap(paddr_t pa, size_t len);
 void __iomem *ioremap_cache(paddr_t pa, size_t len);
 void __iomem *ioremap_wc(paddr_t pa, size_t len);
 
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -587,20 +587,6 @@ void *__init arch_vmap_virt_end(void)
     return (void *)(VMAP_VIRT_START + VMAP_VIRT_SIZE);
 }
 
-static void __iomem *ioremap_attr(paddr_t pa, size_t len,
-                                  pte_attr_t attributes)
-{
-    mfn_t mfn = _mfn(PFN_DOWN(pa));
-    unsigned int offs = pa & (PAGE_SIZE - 1);
-    unsigned int nr = PFN_UP(offs + len);
-    void *ptr = __vmap(&mfn, nr, 1, 1, attributes, VMAP_DEFAULT);
-
-    if ( ptr == NULL )
-        return NULL;
-
-    return ptr + offs;
-}
-
 void __iomem *ioremap_cache(paddr_t pa, size_t len)
 {
     return ioremap_attr(pa, len, PAGE_HYPERVISOR);
--- a/xen/arch/x86/include/asm/io.h
+++ b/xen/arch/x86/include/asm/io.h
@@ -47,6 +47,9 @@ __OUT(b,"b",char)
 __OUT(w,"w",short)
 __OUT(l,,int)
 
+void __iomem *x86_ioremap_attr(paddr_t pa, size_t len, pte_attr_t attr);
+#define arch_ioremap_attr x86_ioremap_attr
+
 /*
  * Boolean indicator and function used to handle platform specific I/O port
  * emulation.
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -611,7 +611,15 @@ void destroy_perdomain_mapping(struct do
                                unsigned int nr);
 void free_perdomain_mappings(struct domain *d);
 
-void __iomem *ioremap_wc(paddr_t pa, size_t len);
+static inline void __iomem *ioremap(paddr_t pa, size_t len)
+{
+    return ioremap_attr(pa, len, PAGE_HYPERVISOR_UCMINUS);
+}
+
+static inline void __iomem *ioremap_wc(paddr_t pa, size_t len)
+{
+    return ioremap_attr(pa, len, PAGE_HYPERVISOR_WC);
+}
 
 extern int memory_add(unsigned long spfn, unsigned long epfn, unsigned int pxm);
 
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6167,41 +6167,15 @@ void *__init arch_vmap_virt_end(void)
     return fix_to_virt(__end_of_fixed_addresses);
 }
 
-void __iomem *ioremap(paddr_t pa, size_t len)
+void __iomem *x86_ioremap_attr(paddr_t pa, size_t len, pte_attr_t attr)
 {
-    mfn_t mfn = _mfn(PFN_DOWN(pa));
-    void *va;
-
-    WARN_ON(page_is_ram_type(mfn_x(mfn), RAM_TYPE_CONVENTIONAL));
+    WARN_ON(page_is_ram_type(PFN_DOWN(pa), RAM_TYPE_CONVENTIONAL));
 
     /* The low first Mb is always mapped. */
-    if ( !((pa + len - 1) >> 20) )
-        va = __va(pa);
-    else
-    {
-        unsigned int offs = pa & (PAGE_SIZE - 1);
-        unsigned int nr = PFN_UP(offs + len);
-
-        va = __vmap(&mfn, nr, 1, 1, PAGE_HYPERVISOR_UCMINUS, VMAP_DEFAULT);
-        if ( va )
-            va += offs;
-    }
-
-    return (void __force __iomem *)va;
-}
-
-void __iomem *__init ioremap_wc(paddr_t pa, size_t len)
-{
-    mfn_t mfn = _mfn(PFN_DOWN(pa));
-    unsigned int offs = pa & (PAGE_SIZE - 1);
-    unsigned int nr = PFN_UP(offs + len);
-    void *va;
-
-    WARN_ON(page_is_ram_type(mfn_x(mfn), RAM_TYPE_CONVENTIONAL));
-
-    va = __vmap(&mfn, nr, 1, 1, PAGE_HYPERVISOR_WC, VMAP_DEFAULT);
+    if ( !((pa + len - 1) >> 20) && attr == PAGE_HYPERVISOR_UCMINUS )
+        return (void __force __iomem *)__va(pa);
 
-    return (void __force __iomem *)(va ? va + offs : NULL);
+    return NULL;
 }
 
 int create_perdomain_mapping(struct domain *d, unsigned long va,
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -18,6 +18,7 @@ obj-$(CONFIG_EVTCHN_FIFO) += event_fifo.
 obj-$(CONFIG_GRANT_TABLE) += grant_table.o
 obj-y += gzip/
 obj-$(CONFIG_HYPFS) += hypfs.o
+obj-y += ioremap.o
 obj-$(CONFIG_IOREQ_SERVER) += ioreq.o
 obj-y += irq.o
 obj-y += kernel.o
--- /dev/null
+++ b/xen/common/ioremap.c
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/mm.h>
+#include <xen/pfn.h>
+#include <xen/vmap.h>
+
+#include <asm/io.h>
+
+void __iomem *ioremap_attr(paddr_t pa, size_t len, pte_attr_t attr)
+{
+    void __iomem *ptr = NULL;
+    unsigned int offs = PAGE_OFFSET(pa);
+
+#ifdef arch_ioremap_attr
+    ptr = arch_ioremap_attr(pa, len, attr);
+    if ( ptr )
+        return ptr;
+#endif
+
+    if ( IS_ENABLED(CONFIG_HAS_VMAP) )
+    {
+        mfn_t mfn = _mfn(PFN_DOWN(pa));
+
+        ptr = (void __force __iomem *)__vmap(&mfn, PFN_UP(offs + len), 1, 1,
+                                             attr, VMAP_DEFAULT);
+    }
+
+    return ptr ? ptr + offs : NULL;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
--- a/xen/include/xen/vmap.h
+++ b/xen/include/xen/vmap.h
@@ -121,9 +121,10 @@ void vfree(void *va);
  *
  * @param pa  Physical base address of the MMIO region.
  * @param len Length of the MMIO region in octets.
+ * @param attr Attributes for the mapping.
  * @return Pointer to the mapped area on success; NULL otherwise.
  */
-void __iomem *ioremap(paddr_t pa, size_t len);
+void __iomem *ioremap_attr(paddr_t pa, size_t len, pte_attr_t attr);
 
 /* Return the number of pages in the mapping starting at address 'va' */
 unsigned int vmap_size(const void *va);


