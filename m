Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 682B698B77C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 10:49:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807830.1219510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svYZF-0006BR-7K; Tue, 01 Oct 2024 08:49:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807830.1219510; Tue, 01 Oct 2024 08:49:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svYZF-00068r-4F; Tue, 01 Oct 2024 08:49:13 +0000
Received: by outflank-mailman (input) for mailman id 807830;
 Tue, 01 Oct 2024 08:49:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svYZE-0005xu-GF
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 08:49:12 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 077e39b4-7fd2-11ef-a0ba-8be0dac302b0;
 Tue, 01 Oct 2024 10:49:11 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a8d43657255so2723566b.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 01:49:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c297bceesm667113466b.187.2024.10.01.01.49.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 01:49:10 -0700 (PDT)
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
X-Inumbo-ID: 077e39b4-7fd2-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727772551; x=1728377351; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3YQovV+n3e2iZoKriHprGKyGT3fX/RYDEQo1G3heG+M=;
        b=VeICNJFLWJRLDHSf8G3YvQabsiASW8ilGMieXUgts7KZyQL/YOk3HP0TTHHQqZVCLX
         7QPnh8ISgCP/rPM+IOxO9/QbZLy2EA7MGNZ2FVcDIx9bQjpZdXYtmI/BXqfKDv1Clu/k
         hE8ugXBIt78pg5DiGXh3kwm+NiS1EtCGedVOCgDUWgBKIfrDmPw77WyfRpLxjRkIgl6Y
         5ejehbmdmgYZPduMM5TYYlK3g+fFHoCsarhtyUVdibeTmo0JIiQckBp8BzIH5gcjeWzB
         z2UxIsYMqT/qA3TFUTi5RWXggPVNd4ef8b9nltmOFWDP6ITNxjHVo2jZsFsTS1O9dT+1
         LfkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727772551; x=1728377351;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3YQovV+n3e2iZoKriHprGKyGT3fX/RYDEQo1G3heG+M=;
        b=FnambsO4GkDfGId3FE868L8IMetrIdfLy0ED8YSN4Yszyuie335P/HWIth5r13CjYG
         51GQEYWmzzSzZtYheStplHO85TTli5VcoJd+uokFIyFGYdHlw7xebAAeGszcmT99P+g8
         PJY8zJxCd0LJmzwd3bPB6on8MEHs8kPELA9rGDNcAUfxHR44Lu7af1wrMPBDWNvQZ1N8
         pHFvl9lPEOo02nFukbZvUjkuvQi3T2Nl55YAlc0g6RRJv7ZIv/Js5pXQJIl5DKPiP4Yp
         q6ixdJcYrdgoUcTBahu90uMeuB1yYuto5oATeCygQWz0ftqEEiWi3URVOv7cGkX2yyPD
         eOWQ==
X-Gm-Message-State: AOJu0Yzdp1OsK58fUIaKeJfcKy1YUvwtR9/EUlPCLmmiRU5paJVS5Pvy
	msPN6Ah+fa2orUmXR/ed1s6kjvSTvpDH0hZaT5ToPPzmWIFB70wv6dBK9o86FY1b9dRrUAepmHA
	=
X-Google-Smtp-Source: AGHT+IGyNaxk4OM2kTSilCgOMgWlxucjmHDanSRs6cLmLVChamA1zxHSl//IbDUHLBjvrDA7Miy/Dw==
X-Received: by 2002:a17:907:3e86:b0:a90:d1e1:eeb3 with SMTP id a640c23a62f3a-a93c4a60d33mr1767106666b.44.1727772551088;
        Tue, 01 Oct 2024 01:49:11 -0700 (PDT)
Message-ID: <93967ab8-a472-475a-bdd6-41dfc3afa895@suse.com>
Date: Tue, 1 Oct 2024 10:49:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 2/5] x86/HVM: allocate emulation cache entries dynamically
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <3294f629-f91f-4b5d-9eb0-40a34aa2ec3e@suse.com>
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
In-Reply-To: <3294f629-f91f-4b5d-9eb0-40a34aa2ec3e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Both caches may need higher capacity, and the upper bound will need to
be determined dynamically based on CPUID policy (for AMX'es TILELOAD /
TILESTORE at least).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This is a patch taken from the AMX series, but wasn't part of the v3
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
---
v2: Split off cache bounds check fix.

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
-    if ( offset + size > sizeof(cache->buffer) )
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


