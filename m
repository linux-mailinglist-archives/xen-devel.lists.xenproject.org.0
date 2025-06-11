Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EB7AD50C0
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 12:02:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011427.1389857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPII0-0001BT-3s; Wed, 11 Jun 2025 10:02:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011427.1389857; Wed, 11 Jun 2025 10:02:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPII0-00018i-0k; Wed, 11 Jun 2025 10:02:36 +0000
Received: by outflank-mailman (input) for mailman id 1011427;
 Wed, 11 Jun 2025 10:02:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPIHy-00018c-4c
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 10:02:34 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31693ad7-46ab-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 12:02:33 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a53359dea5so2846755f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 03:02:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23603405f30sm83706335ad.177.2025.06.11.03.02.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 03:02:32 -0700 (PDT)
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
X-Inumbo-ID: 31693ad7-46ab-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749636153; x=1750240953; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IDFEYH6KPSwND/ipPmubXP/0a9ioXtXTze0H3/30fzE=;
        b=C0Lf+/rEq/xa5g/r09zOq+HIMkNq1+jVNy6mR3ay4hD9hOCtPl+Z8Gi5tPobuqZREV
         atxumR9pWR8ioftPGAQYyF1hucBohES+SpZLDw9ydDfJvTkOgVW+BgPIkdMzQi9alqs6
         YYnlzc7hWJ2z53bl7f3uQwsAFit041s/pdbIegFPk7kHhKq6l0/V/7uHIWakUBIuVMlH
         0cAhQvQkkFg+A76bD0vk6cW+NrACrPxkcRfOuUHAAwBx95Ukp+zi4YYb7bVONG85IDLp
         bZdsl2IUVMrjQbOMS9MHtNTIlLe+osvObQ7KhivzrY7DtjpRA0pcnq4AeKcih1xeCj5D
         2Hbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749636153; x=1750240953;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IDFEYH6KPSwND/ipPmubXP/0a9ioXtXTze0H3/30fzE=;
        b=lkLnJ9NsxApXyQpEYALfP0GnfpqIgS4b7D4x9lcTvfymV9nWCyeilw6HpXCd2A2TiF
         6XTsM+ngkED0V9TAyS1FVyL2KOGWB5kTD4u8wFiqH+Vrkq1PQMKfAe8kOzF7sCTVt08I
         fUL6wZEI2D7iAtL7PBSvQfa8keCHUztFk8ze3WqDOGG6xCu7n5m+3ex+xTD2cHl09D3u
         i4zIRhu08765CzdEA0l5BKSBPrBHOO/5as5TnDp8w5RTDWCh0X5PuSCnpV4qvH/3Ropo
         PzNcVZSgYxgZRe2U9j/nB+4ybkMS6b9mepCcawVw+C/zJTf56N7pr6jnNJ7Bu1LHrhqb
         /kew==
X-Gm-Message-State: AOJu0YzIUgofKQrFZxmOTsFFeNsSIo0821PPYqzDT0dAAQMJfOV24//t
	wdT97nyfDWbQA9QHzkQltN3iNc3DSehJi4z2TtS/xcABQmOnomWooR+N/R3wsn/6rSX5Kv/O1W9
	Ef+s=
X-Gm-Gg: ASbGnctwaBd5blcOngK5OygXmdf1/iouV3ahrdMLmKWRHjsSYj+hRecDZn0DcXWgMFK
	mDHs1BGJASFe3W5UO2ob5YH3F4X5m43JzFGAnBmYhTup/yQWCnGGEXmWPfFS4YIdjJ5fAg04XWG
	/0ux9PfXNG7ZqU4gtANrJzco33o8Sy4dyY9WdoLwFpt9gQK6udc9B6LW1bcmkz9ub2xEuG2si/d
	RNGLDapb0Lcg+XWB4kbXJ7BafmNAahL3nLsabn4mYVK7Xq/eh35EKeYL03M1wy7KIiZaF31+Qwf
	jN0hmgLfI49nfshUz6E+U1POZBi+05weDzU15PoC3K9r4vZWYkBh5rcQqPFxff1vmefMnsgrJnX
	5FzF45wn3qAcxCm3Kop31PsJkGRTb7ZckZDz17AZl5iG4fiA=
X-Google-Smtp-Source: AGHT+IGLgvZw8UxGCfePr5HgPqugyXukm8mXihNcKZj8rm2w5FmECgOHUdwPAX27Bwzo8+I8fQwhNQ==
X-Received: by 2002:a5d:5847:0:b0:3a4:eec5:441c with SMTP id ffacd0b85a97d-3a558a457d7mr1900723f8f.47.1749636152650;
        Wed, 11 Jun 2025 03:02:32 -0700 (PDT)
Message-ID: <1491ce61-6aff-4542-8bc1-d7db1324cce3@suse.com>
Date: Wed, 11 Jun 2025 12:02:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3] x86: FLUSH_CACHE -> FLUSH_CACHE_EVICT
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is to make the difference to FLUSH_CACHE_WRITEBACK more explicit.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
Note that this (of course) collides with "x86/HVM: restrict use of
pinned cache attributes as well as associated flushing".
---
v3: Re-base, also over dropped earlier patches.
v2: New.

--- a/xen/arch/x86/flushtlb.c
+++ b/xen/arch/x86/flushtlb.c
@@ -232,7 +232,7 @@ unsigned int flush_area_local(const void
     if ( flags & FLUSH_HVM_ASID_CORE )
         hvm_flush_guest_tlbs();
 
-    if ( flags & (FLUSH_CACHE | FLUSH_CACHE_WRITEBACK) )
+    if ( flags & (FLUSH_CACHE_EVICT | FLUSH_CACHE_WRITEBACK) )
     {
         const struct cpuinfo_x86 *c = &current_cpu_data;
         unsigned long sz = 0;
@@ -245,13 +245,13 @@ unsigned int flush_area_local(const void
              c->x86_clflush_size && c->x86_cache_size && sz &&
              ((sz >> 10) < c->x86_cache_size) )
         {
-            if ( flags & FLUSH_CACHE )
+            if ( flags & FLUSH_CACHE_EVICT )
                 cache_flush(va, sz);
             else
                 cache_writeback(va, sz);
-            flags &= ~(FLUSH_CACHE | FLUSH_CACHE_WRITEBACK);
+            flags &= ~(FLUSH_CACHE_EVICT | FLUSH_CACHE_WRITEBACK);
         }
-        else if ( flags & FLUSH_CACHE )
+        else if ( flags & FLUSH_CACHE_EVICT )
             wbinvd();
         else
             wbnoinvd();
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -2277,7 +2277,7 @@ void hvm_shadow_handle_cd(struct vcpu *v
             domain_pause_nosync(v->domain);
 
             /* Flush physical caches. */
-            flush_all(FLUSH_CACHE);
+            flush_all(FLUSH_CACHE_EVICT);
             hvm_set_uc_mode(v, 1);
 
             domain_unpause(v->domain);
--- a/xen/arch/x86/hvm/mtrr.c
+++ b/xen/arch/x86/hvm/mtrr.c
@@ -618,7 +618,7 @@ int hvm_set_mem_pinned_cacheattr(struct
                         break;
                     /* fall through */
                 default:
-                    flush_all(FLUSH_CACHE);
+                    flush_all(FLUSH_CACHE_EVICT);
                     break;
                 }
                 return 0;
@@ -684,7 +684,7 @@ int hvm_set_mem_pinned_cacheattr(struct
 
     p2m_memory_type_changed(d);
     if ( type != X86_MT_WB )
-        flush_all(FLUSH_CACHE);
+        flush_all(FLUSH_CACHE_EVICT);
 
     return rc;
 }
@@ -799,7 +799,7 @@ void memory_type_changed(struct domain *
          (!boot_cpu_has(X86_FEATURE_XEN_SELFSNOOP) ||
           (is_iommu_enabled(d) && !iommu_snoop)) )
     {
-        flush_all(FLUSH_CACHE);
+        flush_all(FLUSH_CACHE_EVICT);
     }
 }
 
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2316,7 +2316,7 @@ static void svm_vmexit_mce_intercept(
 static void cf_check svm_wbinvd_intercept(void)
 {
     if ( cache_flush_permitted(current->domain) )
-        flush_all(FLUSH_CACHE);
+        flush_all(FLUSH_CACHE_EVICT);
 }
 
 static void svm_vmexit_do_invalidate_cache(struct cpu_user_regs *regs,
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1929,7 +1929,7 @@ void cf_check vmx_do_resume(void)
         {
             int cpu = v->arch.hvm.vmx.active_cpu;
             if ( cpu != -1 )
-                flush_mask(cpumask_of(cpu), FLUSH_CACHE);
+                flush_mask(cpumask_of(cpu), FLUSH_CACHE_EVICT);
         }
 
         vmx_clear_vmcs(v);
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3844,7 +3844,7 @@ static void cf_check vmx_wbinvd_intercep
         return;
 
     if ( cpu_has_wbinvd_exiting )
-        flush_all(FLUSH_CACHE);
+        flush_all(FLUSH_CACHE_EVICT);
     else
         wbinvd();
 }
--- a/xen/arch/x86/include/asm/flushtlb.h
+++ b/xen/arch/x86/include/asm/flushtlb.h
@@ -113,7 +113,7 @@ void switch_cr3_cr4(unsigned long cr3, u
  /* Flush TLBs (or parts thereof) including global mappings */
 #define FLUSH_TLB_GLOBAL 0x200
  /* Flush data caches */
-#define FLUSH_CACHE      0x400
+#define FLUSH_CACHE_EVICT 0x400
  /* VA for the flush has a valid mapping */
 #define FLUSH_VA_VALID   0x800
  /* Flush CPU state */
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -3821,7 +3821,7 @@ long do_mmuext_op(
                     if ( !cpumask_intersects(mask,
                                              per_cpu(cpu_sibling_mask, cpu)) )
                         __cpumask_set_cpu(cpu, mask);
-                flush_mask(mask, FLUSH_CACHE);
+                flush_mask(mask, FLUSH_CACHE_EVICT);
             }
             else
                 rc = -EACCES;
@@ -5395,7 +5395,7 @@ int map_pages_to_xen(
     if ( (flags & _PAGE_PRESENT) &&            \
          (((o_) ^ flags) & PAGE_CACHE_ATTRS) ) \
     {                                          \
-        flush_flags |= FLUSH_CACHE;            \
+        flush_flags |= FLUSH_CACHE_EVICT;      \
         if ( virt >= DIRECTMAP_VIRT_START &&   \
              virt < HYPERVISOR_VIRT_END )      \
             flush_flags |= FLUSH_VA_VALID;     \
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -1205,7 +1205,7 @@ static int cf_check cache_op(
     else if ( op == x86emul_wbnoinvd /* && cpu_has_wbnoinvd */ )
         flush_all(FLUSH_CACHE_WRITEBACK);
     else
-        flush_all(FLUSH_CACHE);
+        flush_all(FLUSH_CACHE_EVICT);
 
     return X86EMUL_OKAY;
 }

