Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDUZJbAxl2kcvgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 16:52:16 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01059160656
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 16:52:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236522.1539216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt6Jz-0001pa-0X; Thu, 19 Feb 2026 15:52:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236522.1539216; Thu, 19 Feb 2026 15:52:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt6Jy-0001my-TO; Thu, 19 Feb 2026 15:52:06 +0000
Received: by outflank-mailman (input) for mailman id 1236522;
 Thu, 19 Feb 2026 15:52:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vt6Jx-0001ms-92
 for xen-devel@lists.xenproject.org; Thu, 19 Feb 2026 15:52:05 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ebc9f7a1-0daa-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Feb 2026 16:51:57 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-48379a42f76so8832425e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Feb 2026 07:51:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4839f990384sm34268715e9.5.2026.02.19.07.51.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Feb 2026 07:51:56 -0800 (PST)
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
X-Inumbo-ID: ebc9f7a1-0daa-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771516317; x=1772121117; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iABelTj/PEu4I9Jo3VCsALnDPxGXpz5wsNtPK8TN7OQ=;
        b=bR+l0N40Fs/O9fk2WIqv+v2rCnmL5PWaGtj6UGHO4mCwVeksrIEQ1UNfxecdJytwwM
         sHjsnHktoKuEIwj/MFvsVeJNQqnYG+usqGtd96WqgStA0nihaoRNcQIuU9jVeHM2omY6
         0hIlRE/W85xqpc+ZUTRRMgxrY3MaxB3BJVyaPcCpyGlNTgAdOJtdKf0p6Uw4LBEDsOt4
         1GLwNhOqf5WREFiey+8dka3nJVAiT2cWvq3HrcIrBow6yrvj/PeUXLaNtT7qvrJGbwB7
         jOZshA6d/iAHWy9irK6FXDcMefzfQZmNLeDxMg+KlRVQ4IbiOefhB33ftSs3+bHGRpBu
         zL9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771516317; x=1772121117;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iABelTj/PEu4I9Jo3VCsALnDPxGXpz5wsNtPK8TN7OQ=;
        b=HBLsYd52yjHY5cQuZ20pRpboHfqqkfuxr4dPidqXgz/A0P57OSZgM7V0XxOH25PF96
         ZCi2pivcM+zWHF9Bpqj7EQ54LmTqs1lKCJWQXYEo8BIl8ck+ik0V8tn0p8wzxDv/LMIH
         jYnpABNKQcwUZcSDxM8t1bSdHfxSBjSlvwkbV3U9Jj5D6nW0Bp5xV0+uFGdqCGEXWr5O
         XqOq3A5I0N077IsGSsPsIlFi3KyJb3zafW/fIRn29m60+TecVhHYN19j5r5Oz4MTooSV
         NWbCCoV5cbbgg0qdIaTtjSKtXx/HqZTn/MfYPi+/EP1kAtuoJA9+ZUtBMYfOU1OWiZCU
         lETg==
X-Gm-Message-State: AOJu0YxZEO4Jvt1suov6deF7+bO7pM8RppBNP9l9SMI3wQOsmMNJhPQi
	ew5x/UVMDcs9zyVLk06nwlmFNAt15VSB/pB9l9PpkTQ/lY7Tt21tE+iSmt3YIYXvq2tztKW3X0h
	F8KM=
X-Gm-Gg: AZuq6aIQW7kHOcb+qigXVBaHahCOqUOYXAmY/BH2BJv8KBh0O099cQNvDOlxFMOIrOz
	0eYezyMKORBv+QvsqZkF5EUekzB7qFIvU8AQbsnGb+9DjCT1CSLC6jhqrx2XyO+XF0zGzgJlsBE
	EHefxLetPtpT0tU8s3on8VesirvJys7tRTJqH9TEWZT03YExqVp2F/M8gcVuuvEXGEARYD4fkVi
	xdgeiXkj6Fbje6sT1/SPaVSG/Fsb4lnzln5LLyHEqBwsmNl38MYz7d35qYUrPxT2PkAQ1nUnmx/
	jU3Z9b/cnV5XVKK978nXOuYPCh8Be2ipkzq6DnbtbMSchCFAAkejooLDQLiL9bzCHD8t1fIMSaa
	J5dtgBCOKIx3g+JOoHYSouf3nG39MSqcUKf2zRJKAFO/ZR5DJi1s2iZ+q8FljnQQiVhWIPaoD1q
	ew+n9oCiWzvfkUsv78tdgp5kGqgN/M1uM3oJoE5ls87zN3o+KuQa/JDYl5A0P2HCFd1vpmuCqas
	FXcJhkNlcjTK1I=
X-Received: by 2002:a05:600c:8b51:b0:477:55ce:f3c2 with SMTP id 5b1f17b1804b1-48379bc4e01mr300225405e9.14.1771516317092;
        Thu, 19 Feb 2026 07:51:57 -0800 (PST)
Message-ID: <81e4f7e0-df57-4a5b-b16d-fe668682d94c@suse.com>
Date: Thu, 19 Feb 2026 16:51:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] make ioremap_attr() common
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
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Timothy Pearson <tpearson@raptorengineering.com>
References: <924f3ef2-7883-4322-a921-edc814c96719@suse.com>
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
In-Reply-To: <924f3ef2-7883-4322-a921-edc814c96719@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:bertrand.marquis@arm.com,m:volodymyr_babchuk@epam.com,m:tpearson@raptorengineering.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[citrix.com,xen.org,kernel.org,vates.tech,amd.com,wdc.com,gmail.com,arm.com,epam.com,raptorengineering.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 01059160656
X-Rspamd-Action: no action

This core backing function is uniform; what varies across architectures
are the attributes passed and hence the wrappers around it. Yet of course
extra checking or special handling may be needed per arch, so introduce a
suitable hook. Permit such a hook to return both adjusted and un-adjusted
(for the page offset) pointers.

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
     paddr_t end_pg = round_pgup(start_pg + len);
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
@@ -6166,41 +6166,15 @@ void *__init arch_vmap_virt_end(void)
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
@@ -19,6 +19,7 @@ obj-$(CONFIG_GRANT_TABLE) += grant_table
 obj-y += guestcopy.o
 obj-y += gzip/
 obj-$(CONFIG_HYPFS) += hypfs.o
+obj-y += ioremap.o
 obj-$(CONFIG_IOREQ_SERVER) += ioreq.o
 obj-y += irq.o
 obj-y += kernel.o
--- /dev/null
+++ b/xen/common/ioremap.c
@@ -0,0 +1,42 @@
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
+    if ( PAGE_OFFSET(ptr) )
+        return ptr;
+#endif
+
+    if ( IS_ENABLED(CONFIG_HAS_VMAP) && !ptr )
+    {
+        mfn_t mfn = _mfn(PFN_DOWN(pa));
+
+        ptr = (void __force __iomem *)__vmap(&mfn, PFN_UP(offs + len), 1, 1,
+                                             attr, VMAP_DEFAULT);
+    }
+
+    if ( !ptr )
+        return NULL;
+
+    return ptr + offs;
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


