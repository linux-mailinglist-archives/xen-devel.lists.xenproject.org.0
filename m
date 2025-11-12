Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EEDC5326F
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 16:47:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160162.1488373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJD4I-0004hv-Vl; Wed, 12 Nov 2025 15:47:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160162.1488373; Wed, 12 Nov 2025 15:47:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJD4I-0004fk-SP; Wed, 12 Nov 2025 15:47:34 +0000
Received: by outflank-mailman (input) for mailman id 1160162;
 Wed, 12 Nov 2025 15:47:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJD4I-0004fe-6U
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 15:47:34 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7476ff6-bfde-11f0-9d18-b5c5bf9af7f9;
 Wed, 12 Nov 2025 16:47:33 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b7277324054so142448666b.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Nov 2025 07:47:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf97d0ffsm1679868966b.46.2025.11.12.07.47.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 07:47:32 -0800 (PST)
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
X-Inumbo-ID: e7476ff6-bfde-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762962452; x=1763567252; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iy7oTaOzKlzz8YelCHtRD+AO8mQ+0asw2evB4QFPDgc=;
        b=P/FrKfnxw9Tcj8rn3jYqTypYf4qfLn5IPRBb8NjFsuWguz5MyXBCSfmR0JVvqNBnoC
         gz9wXWdL64MxaJ6g3zso5N1irQFUQVh7flDpy1RSsUNnvM/uCmF8RQtSG24fo1ut57xw
         3OTFuAanWpl+11dSae8mifUwRULbdJ8U8NJck3+vDLx0wmJ3S3+XbBaLY4kMuhuM0Wj1
         hY0AvXKzc0Oz9bOEh2NCt7qNaPLx1MS9Sq2opV29IMp4TkTO2ck2K3vnAlxzXwPs2xFv
         x2udviG3QlGTYQuWVC1Xp4NNtQKXTmtuUui3bcUGzKBE8L0JYvAE187Q0m9q1cZJJrn/
         Fueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762962453; x=1763567253;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iy7oTaOzKlzz8YelCHtRD+AO8mQ+0asw2evB4QFPDgc=;
        b=qT10HC6vmSiizmroSgdLqCCXMrgRxNAYXxT5x8IY6EOlbfb4eB37aa4FS/TXUEefSq
         oCxj66TayIO6Nnl8b6r0+QJpx09qEQF9X8PFsUa5A+gpu9VMhhlMDoOlHhgNSqBC6weU
         WF2ejOgIkTDHDMTcxOWZSGS/DI7XU12PeVBnOsFW6tIscRy3qMqi3iG0y2LG9enDfujy
         VM/fCpwtlzdRNep76nyV81JLHA+DRYxEKHXQjnOfXxmWkyM3/J6XMuuqiwQV44Cybhpu
         rs1lFV/0dFNpKr/06AFI9mwFVWQoRqqrBg9Ivz4hVnaabRRbJUrr+bhb4Rsu2++xli6G
         krNQ==
X-Gm-Message-State: AOJu0YwUMbTAVMW6ZksjR1LHKsWsdCxc/fz7tna2w9ps3PacJEHeHGFD
	DT8p63Vim8UGeq0S3s+UrbptRD6DGE6oLbXbcc1ixxGK+/jv4WgN+4hIuXGSa7MXLDsrPGc71Sp
	lCAQ=
X-Gm-Gg: ASbGncsQaQt08LNcvckLtbud0dSDAZVv2AipQKKmm26bZEBI5/t94hhPkfGwkUUCeLG
	Ra9M4AxRQxuAYYZ5Lih6EivwsWgdVmqI4e/YSGGbb7gK6dlHLW1ECTgrTKISJOgYteQq8SiNxKk
	PsS3fpQJVRpR5mavzPVNUzcXarXCGfO8WKS0dVZwkIXJREuDxSCbUhgF0O2fQecR7M+HwSYgfPz
	CmGkoA7Huq6Iv1mAQb7YVZgWiI1ngnFJALuH/COjrlza4JIujuL07q2KXRLepU5LfKdememJovK
	S1CeAGh7KDVCMOLFJIhs5oPCWpqX0SxtsTRT0FEvBSnk6JGp3RHuwrz9To+R6q61k9mNKLrvra8
	NPgTK/1AcAYETDbN44zpmYfcRZzr8H0FvQC/lVJF59+5yt8m+xv6xPh9hA8lOdFKfFl2JziW59U
	5yOgzL6C6dmFChZCC0IR5wi8awJj8PE8ewoONMZwrrOIvKrFdQnabAz9iQW+diz0U1
X-Google-Smtp-Source: AGHT+IF7tOn23vYszST83UM72Zvl2x/2BvtxYZmhI+N07C2CK5tyZCcxDsNgsLgJzy31Qj84Hy6vcw==
X-Received: by 2002:a17:907:971e:b0:b72:6728:5baa with SMTP id a640c23a62f3a-b7331a373ecmr369499266b.25.1762962452564;
        Wed, 12 Nov 2025 07:47:32 -0800 (PST)
Message-ID: <3dce4f28-558b-495c-ac45-0f699da82458@suse.com>
Date: Wed, 12 Nov 2025 16:47:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Penny Zheng <Penny.Zheng@amd.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/mm: split struct sh_dirty_vram and make results private
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
Content-Transfer-Encoding: 7bit

The types are local to the shadow and HAP subsystems respectively, and
HAP has no need for the shadow-specific fields (i.e. it can get away with
smaller allocations). In struct hvm_domain it therefore suffices to have
a union of two (generally opaque) pointers.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/hvm/domain.h
+++ b/xen/arch/x86/include/asm/hvm/domain.h
@@ -95,7 +95,10 @@ struct hvm_domain {
     struct list_head       pinned_cacheattr_ranges;
 
     /* VRAM dirty support.  Protect with the domain paging lock. */
-    struct sh_dirty_vram *dirty_vram;
+    union {
+        struct sh_dirty_vram *sh;
+        struct hap_dirty_vram *hap;
+    }                      dirty_vram;
 
     /* If one of vcpus of this domain is in no_fill_mode or
      * mtrr/pat between vcpus is not the same, set is_in_uc_mode
--- a/xen/arch/x86/include/asm/paging.h
+++ b/xen/arch/x86/include/asm/paging.h
@@ -133,19 +133,6 @@ struct paging_mode {
     (DIV_ROUND_UP(PADDR_BITS - PAGE_SHIFT - (PAGE_SHIFT + 3), \
                   PAGE_SHIFT - ilog2(sizeof(mfn_t))) + 1)
 
-#ifdef CONFIG_HVM
-/* VRAM dirty tracking support */
-struct sh_dirty_vram {
-    unsigned long begin_pfn;
-    unsigned long end_pfn;
-#ifdef CONFIG_SHADOW_PAGING
-    paddr_t *sl1ma;
-    uint8_t *dirty_bitmap;
-    s_time_t last_dirty;
-#endif
-};
-#endif
-
 #if PG_log_dirty
 
 /* log dirty initialization */
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -36,6 +36,11 @@
 /*          HAP VRAM TRACKING SUPPORT           */
 /************************************************/
 
+struct hap_dirty_vram {
+    unsigned long begin_pfn;
+    unsigned long end_pfn;
+};
+
 /*
  * hap_track_dirty_vram()
  * Create the domain's dv_dirty_vram struct on demand.
@@ -52,7 +57,7 @@ int hap_track_dirty_vram(struct domain *
                          XEN_GUEST_HANDLE(void) guest_dirty_bitmap)
 {
     long rc = 0;
-    struct sh_dirty_vram *dirty_vram;
+    struct hap_dirty_vram *dirty_vram;
     uint8_t *dirty_bitmap = NULL;
 
     if ( nr_frames )
@@ -66,17 +71,17 @@ int hap_track_dirty_vram(struct domain *
 
         paging_lock(d);
 
-        dirty_vram = d->arch.hvm.dirty_vram;
+        dirty_vram = d->arch.hvm.dirty_vram.hap;
         if ( !dirty_vram )
         {
             rc = -ENOMEM;
-            if ( (dirty_vram = xzalloc(struct sh_dirty_vram)) == NULL )
+            if ( (dirty_vram = xzalloc(struct hap_dirty_vram)) == NULL )
             {
                 paging_unlock(d);
                 goto out;
             }
 
-            d->arch.hvm.dirty_vram = dirty_vram;
+            d->arch.hvm.dirty_vram.hap = dirty_vram;
         }
 
         if ( begin_pfn != dirty_vram->begin_pfn ||
@@ -132,7 +137,7 @@ int hap_track_dirty_vram(struct domain *
     {
         paging_lock(d);
 
-        dirty_vram = d->arch.hvm.dirty_vram;
+        dirty_vram = d->arch.hvm.dirty_vram.hap;
         if ( dirty_vram )
         {
             /*
@@ -142,7 +147,7 @@ int hap_track_dirty_vram(struct domain *
             begin_pfn = dirty_vram->begin_pfn;
             nr_frames = dirty_vram->end_pfn - dirty_vram->begin_pfn;
             xfree(dirty_vram);
-            d->arch.hvm.dirty_vram = NULL;
+            d->arch.hvm.dirty_vram.hap = NULL;
         }
 
         paging_unlock(d);
@@ -630,7 +635,7 @@ void hap_teardown(struct domain *d, bool
 
     d->arch.paging.mode &= ~PG_log_dirty;
 
-    XFREE(d->arch.hvm.dirty_vram);
+    XFREE(d->arch.hvm.dirty_vram.hap);
 
 out:
     paging_unlock(d);
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -2886,11 +2886,11 @@ void shadow_teardown(struct domain *d, b
     d->arch.paging.mode &= ~PG_log_dirty;
 
 #ifdef CONFIG_HVM
-    if ( is_hvm_domain(d) && d->arch.hvm.dirty_vram )
+    if ( is_hvm_domain(d) && d->arch.hvm.dirty_vram.sh )
     {
-        xfree(d->arch.hvm.dirty_vram->sl1ma);
-        xfree(d->arch.hvm.dirty_vram->dirty_bitmap);
-        XFREE(d->arch.hvm.dirty_vram);
+        xfree(d->arch.hvm.dirty_vram.sh->sl1ma);
+        xfree(d->arch.hvm.dirty_vram.sh->dirty_bitmap);
+        XFREE(d->arch.hvm.dirty_vram.sh);
     }
 #endif
 
--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -1033,7 +1033,7 @@ int shadow_track_dirty_vram(struct domai
     p2m_lock(p2m_get_hostp2m(d));
     paging_lock(d);
 
-    dirty_vram = d->arch.hvm.dirty_vram;
+    dirty_vram = d->arch.hvm.dirty_vram.sh;
 
     if ( dirty_vram && (!nr_frames ||
              ( begin_pfn != dirty_vram->begin_pfn
@@ -1043,8 +1043,8 @@ int shadow_track_dirty_vram(struct domai
         gdprintk(XENLOG_INFO, "stopping tracking VRAM %lx - %lx\n", dirty_vram->begin_pfn, dirty_vram->end_pfn);
         xfree(dirty_vram->sl1ma);
         xfree(dirty_vram->dirty_bitmap);
-        xfree(dirty_vram);
-        dirty_vram = d->arch.hvm.dirty_vram = NULL;
+        XFREE(dirty_vram);
+        d->arch.hvm.dirty_vram.sh = NULL;
     }
 
     if ( !nr_frames )
@@ -1075,7 +1075,7 @@ int shadow_track_dirty_vram(struct domai
             goto out;
         dirty_vram->begin_pfn = begin_pfn;
         dirty_vram->end_pfn = end_pfn;
-        d->arch.hvm.dirty_vram = dirty_vram;
+        d->arch.hvm.dirty_vram.sh = dirty_vram;
 
         if ( (dirty_vram->sl1ma = xmalloc_array(paddr_t, nr_frames)) == NULL )
             goto out_dirty_vram;
@@ -1202,8 +1202,8 @@ int shadow_track_dirty_vram(struct domai
  out_sl1ma:
     xfree(dirty_vram->sl1ma);
  out_dirty_vram:
-    xfree(dirty_vram);
-    dirty_vram = d->arch.hvm.dirty_vram = NULL;
+    XFREE(dirty_vram);
+    d->arch.hvm.dirty_vram.sh = NULL;
 
  out:
     paging_unlock(d);
@@ -1226,7 +1226,7 @@ void shadow_vram_get_mfn(mfn_t mfn, unsi
                          const struct domain *d)
 {
     unsigned long gfn;
-    struct sh_dirty_vram *dirty_vram = d->arch.hvm.dirty_vram;
+    struct sh_dirty_vram *dirty_vram = d->arch.hvm.dirty_vram.sh;
 
     ASSERT(is_hvm_domain(d));
 
@@ -1256,7 +1256,7 @@ void shadow_vram_put_mfn(mfn_t mfn, unsi
                          const struct domain *d)
 {
     unsigned long gfn;
-    struct sh_dirty_vram *dirty_vram = d->arch.hvm.dirty_vram;
+    struct sh_dirty_vram *dirty_vram = d->arch.hvm.dirty_vram.sh;
 
     ASSERT(is_hvm_domain(d));
 
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -608,7 +608,7 @@ _sh_propagate(struct vcpu *v,
 #ifdef CONFIG_HVM
     if ( unlikely(level == 1) && is_hvm_domain(d) )
     {
-        struct sh_dirty_vram *dirty_vram = d->arch.hvm.dirty_vram;
+        struct sh_dirty_vram *dirty_vram = d->arch.hvm.dirty_vram.sh;
 
         if ( dirty_vram && dirty_vram->last_dirty == -1 &&
              gfn_x(target_gfn) >= dirty_vram->begin_pfn &&
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -424,7 +424,15 @@ mfn_t sh_make_monitor_table(const struct
 void sh_destroy_monitor_table(const struct vcpu *v, mfn_t mmfn,
                               unsigned int shadow_levels);
 
-/* VRAM dirty tracking helpers. */
+/* VRAM dirty tracking support */
+struct sh_dirty_vram {
+    unsigned long begin_pfn;
+    unsigned long end_pfn;
+    paddr_t *sl1ma;
+    uint8_t *dirty_bitmap;
+    s_time_t last_dirty;
+};
+
 void shadow_vram_get_mfn(mfn_t mfn, unsigned int l1f,
                          mfn_t sl1mfn, const void *sl1e,
                          const struct domain *d);

