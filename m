Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EFF96BE85
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 15:29:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790368.1200101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slq4I-0005T3-Aw; Wed, 04 Sep 2024 13:29:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790368.1200101; Wed, 04 Sep 2024 13:29:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slq4I-0005QS-8C; Wed, 04 Sep 2024 13:29:06 +0000
Received: by outflank-mailman (input) for mailman id 790368;
 Wed, 04 Sep 2024 13:29:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1slq4H-0005QM-BU
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 13:29:05 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7583a93-6ac1-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 15:29:04 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5c26815e174so3014939a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 06:29:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89891d8109sm819385666b.174.2024.09.04.06.29.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 06:29:03 -0700 (PDT)
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
X-Inumbo-ID: a7583a93-6ac1-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725456544; x=1726061344; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kg3DEyJe/yK9Bb7Q6E0uiaX/GqnXQutBfGrfIqTfqXA=;
        b=Xjq7EnPqBIpP2lLcYn9lEHQJuedlQ/XEdLXVjq6w1+yJQvT9fCVnkrE/Xp3nFYYqsv
         z3IRG132h21CxR6FzzO1MB0GpGaN3S2g1H7yQYktOSAGqin+FHsNVTNnBwT2GgsnMGvj
         /FFehyT7wIdToGbtfysB1axBWN/d+bpDQpKY/ddIPQKRDOfTZnt4dS09bQjhsxPv8LR0
         fHUS016nCa0v16R0o2qnVZi0ILDjLcrnbbd/kXZnS1FjCdLqGDdiNPIgqJ36rv2mRcKj
         C64m7UqHGIuRTKU71mhEgTsV3VxB9n/cd2ny9Bg0+/0KKSVw4A/t+2cRv6D6TTTV6ZFl
         x5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725456544; x=1726061344;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kg3DEyJe/yK9Bb7Q6E0uiaX/GqnXQutBfGrfIqTfqXA=;
        b=GBD3uhjHkDyxS+mfhS0BKV0+hMxctozi7o5DXom+xbS8/WNQxeQNQAdaREihY46GO5
         t3NxT4OhvukD10cEGiR5M170lVJpHpZcaE4jGPeEfo9qFcvwL3z5XQwh5TjOyHNzWTWR
         Rde+FsG73Dnw2lZSgxqCc/ZeD2YpHDVMJDEMLwOotRWFq4JFHMjT91F9vdm3T1irFbzP
         iE8AcY4ZdnklG0RF3uMDuS0mYuPlABRCP9Hge6smHKS6sbSaIOFKrxvc8u4kKlW1w/SB
         VKee/FEDZVdE4Mut74TnzdCJlMvzkz2xhmfKHeCDL76fcj5GM3GnHI9xmHG+mdfIF9Ui
         gogQ==
X-Gm-Message-State: AOJu0YwpWxx+GA7LIlGV1ZTTVqwmMKGwStroAvo6KR9AkEaxkAAKXFng
	mjNzdkdiQsZjT7K6Ouw1UpI8A7S6eW4UCJPTeelOFFxkBXcVW2tTVojJIM83pcAvfIGSbNkBN6A
	=
X-Google-Smtp-Source: AGHT+IFA1QV9nNTH9/UKu8PCb1HbT5gHs1lJ+g61Ctdz7ITrS853zlRJAHB0qYAylwLxJX9BtK84NQ==
X-Received: by 2002:a17:906:dc94:b0:a86:821e:8a28 with SMTP id a640c23a62f3a-a89d884953amr990605366b.54.1725456543461;
        Wed, 04 Sep 2024 06:29:03 -0700 (PDT)
Message-ID: <e35606db-9050-485a-84fb-168f101b5d1c@suse.com>
Date: Wed, 4 Sep 2024 15:29:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/5] x86/HVM: allocate emulation cache entries dynamically
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <31906cba-8646-4cf9-ab31-1d23654df8d1@suse.com>
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
In-Reply-To: <31906cba-8646-4cf9-ab31-1d23654df8d1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Both caches may need higher capacity, and the upper bound will need to
be determined dynamically based on CPUID policy (for AMX at least).

While touching the check in hvmemul_phys_mmio_access() anyway, also
tighten it: To avoid overrunning the internal buffer we need to take the
offset into the buffer into account.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This is a patch taken from the AMX series, which was part of the v3
submission. All I did is strip out the actual AMX bits (from
hvmemul_cache_init()), plus of course change the description. As a
result some local variables there may look unnecessary, but this way
it's going to be less churn when the AMX bits are added. The next patch
pretty strongly depends on the changed approach (contextually, not so
much functionally), and I'd really like to avoid rebasing that one ahead
of this one, and then this one on top of that.

TBD: For AMX hvmemul_cache_init() will become CPUID policy dependent. We
     could of course take the opportunity and also reduce overhead when
     AVX-512 (and maybe even AVX) is unavailable (in the future: to the
     guest).

--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -26,6 +26,18 @@
 #include <asm/iocap.h>
 #include <asm/vm_event.h>
 
+/*
+ * We may read or write up to m512 or up to a tile row as a number of
+ * device-model transactions.
+ */
+struct hvm_mmio_cache {
+    unsigned long gla;
+    unsigned int size;
+    unsigned int space:31;
+    unsigned int dir:1;
+    uint8_t buffer[] __aligned(sizeof(long));
+};
+
 struct hvmemul_cache
 {
     /* The cache is disabled as long as num_ents > max_ents. */
@@ -935,7 +947,7 @@ static int hvmemul_phys_mmio_access(
     }
 
     /* Accesses must not overflow the cache's buffer. */
-    if ( size > sizeof(cache->buffer) )
+    if ( offset + size > cache->space )
     {
         ASSERT_UNREACHABLE();
         return X86EMUL_UNHANDLEABLE;
@@ -1011,7 +1023,7 @@ static struct hvm_mmio_cache *hvmemul_fi
 
     for ( i = 0; i < hvio->mmio_cache_count; i ++ )
     {
-        cache = &hvio->mmio_cache[i];
+        cache = hvio->mmio_cache[i];
 
         if ( gla == cache->gla &&
              dir == cache->dir )
@@ -1027,10 +1039,11 @@ static struct hvm_mmio_cache *hvmemul_fi
 
     ++hvio->mmio_cache_count;
 
-    cache = &hvio->mmio_cache[i];
-    memset(cache, 0, sizeof (*cache));
+    cache = hvio->mmio_cache[i];
+    memset(cache->buffer, 0, cache->space);
 
     cache->gla = gla;
+    cache->size = 0;
     cache->dir = dir;
 
     return cache;
@@ -2978,16 +2991,21 @@ void hvm_dump_emulation_state(const char
 int hvmemul_cache_init(struct vcpu *v)
 {
     /*
-     * No insn can access more than 16 independent linear addresses (AVX512F
-     * scatters/gathers being the worst). Each such linear range can span a
-     * page boundary, i.e. may require two page walks. Account for each insn
-     * byte individually, for simplicity.
+     * AVX512F scatter/gather insns can access up to 16 independent linear
+     * addresses, up to 8 bytes size. Each such linear range can span a page
+     * boundary, i.e. may require two page walks.
+     */
+    unsigned int nents = 16 * 2 * (CONFIG_PAGING_LEVELS + 1);
+    unsigned int i, max_bytes = 64;
+    struct hvmemul_cache *cache;
+
+    /*
+     * Account for each insn byte individually, both for simplicity and to
+     * leave some slack space.
      */
-    const unsigned int nents = (CONFIG_PAGING_LEVELS + 1) *
-                               (MAX_INST_LEN + 16 * 2);
-    struct hvmemul_cache *cache = xmalloc_flex_struct(struct hvmemul_cache,
-                                                      ents, nents);
+    nents += MAX_INST_LEN * (CONFIG_PAGING_LEVELS + 1);
 
+    cache = xvmalloc_flex_struct(struct hvmemul_cache, ents, nents);
     if ( !cache )
         return -ENOMEM;
 
@@ -2997,6 +3015,15 @@ int hvmemul_cache_init(struct vcpu *v)
 
     v->arch.hvm.hvm_io.cache = cache;
 
+    for ( i = 0; i < ARRAY_SIZE(v->arch.hvm.hvm_io.mmio_cache); ++i )
+    {
+        v->arch.hvm.hvm_io.mmio_cache[i] =
+            xmalloc_flex_struct(struct hvm_mmio_cache, buffer, max_bytes);
+        if ( !v->arch.hvm.hvm_io.mmio_cache[i] )
+            return -ENOMEM;
+        v->arch.hvm.hvm_io.mmio_cache[i]->space = max_bytes;
+    }
+
     return 0;
 }
 
--- a/xen/arch/x86/include/asm/hvm/emulate.h
+++ b/xen/arch/x86/include/asm/hvm/emulate.h
@@ -15,6 +15,7 @@
 #include <xen/err.h>
 #include <xen/mm.h>
 #include <xen/sched.h>
+#include <xen/xvmalloc.h>
 #include <asm/hvm/hvm.h>
 #include <asm/x86_emulate.h>
 
@@ -119,7 +120,11 @@ int hvmemul_do_pio_buffer(uint16_t port,
 int __must_check hvmemul_cache_init(struct vcpu *v);
 static inline void hvmemul_cache_destroy(struct vcpu *v)
 {
-    XFREE(v->arch.hvm.hvm_io.cache);
+    unsigned int i;
+
+    for ( i = 0; i < ARRAY_SIZE(v->arch.hvm.hvm_io.mmio_cache); ++i )
+        XFREE(v->arch.hvm.hvm_io.mmio_cache[i]);
+    XVFREE(v->arch.hvm.hvm_io.cache);
 }
 bool hvmemul_read_cache(const struct vcpu *v, paddr_t gpa,
                         void *buffer, unsigned int size);
--- a/xen/arch/x86/include/asm/hvm/vcpu.h
+++ b/xen/arch/x86/include/asm/hvm/vcpu.h
@@ -22,17 +22,6 @@ struct hvm_vcpu_asid {
     uint32_t asid;
 };
 
-/*
- * We may read or write up to m512 as a number of device-model
- * transactions.
- */
-struct hvm_mmio_cache {
-    unsigned long gla;
-    unsigned int size;
-    uint8_t dir;
-    uint8_t buffer[64] __aligned(sizeof(long));
-};
-
 struct hvm_vcpu_io {
     /*
      * HVM emulation:
@@ -48,7 +37,7 @@ struct hvm_vcpu_io {
      * We may need to handle up to 3 distinct memory accesses per
      * instruction.
      */
-    struct hvm_mmio_cache mmio_cache[3];
+    struct hvm_mmio_cache *mmio_cache[3];
     unsigned int mmio_cache_count;
 
     /* For retries we shouldn't re-fetch the instruction. */


