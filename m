Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9AB96BE89
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 15:29:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790371.1200112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slq4v-0005xt-Jl; Wed, 04 Sep 2024 13:29:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790371.1200112; Wed, 04 Sep 2024 13:29:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slq4v-0005wN-GR; Wed, 04 Sep 2024 13:29:45 +0000
Received: by outflank-mailman (input) for mailman id 790371;
 Wed, 04 Sep 2024 13:29:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1slq4t-0005w7-Nf
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 13:29:43 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be2b42d1-6ac1-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 15:29:42 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a86984e035aso814069166b.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 06:29:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a3f048b1fsm92936866b.79.2024.09.04.06.29.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 06:29:41 -0700 (PDT)
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
X-Inumbo-ID: be2b42d1-6ac1-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725456582; x=1726061382; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5sy4Y2cQJ7dlapUfnU+5xbF/96+httzMJp8tshXNPzQ=;
        b=IYoQIXC6DZEmCG3SETJ7vJjlgZ3+tBDtcDE7HzFjpqgjFE9UwJndaB4aNF9q0bFAeA
         jShXHZxjUY7tcq+iB09wLHQiW9r8gukHUAFcq9zmpBEgm9CwGrsk/yfEIk3Fpu6gCR8i
         JMZbMkkd8B4chDKAoawGw9ccVKltWImAM6nPFaIX79i8t4kXnjA5cxKTW5AwqE9AIfqM
         sRdJaigHedWP8xhFYQEtvLFouRAFTfi+odY7lYBVIFCaR5NK/EvgR0LyYqD1C3BbQh5Y
         e1QbBXS0slCvZrpN89QMh8H0PPk2QebF+mQhj3gMBuqaa+F5pwdpdPo7AIJFbUmvJjpp
         JvkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725456582; x=1726061382;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5sy4Y2cQJ7dlapUfnU+5xbF/96+httzMJp8tshXNPzQ=;
        b=l0wtzdYNvNKUd+iXJw4+RmNMByNOOznzaGRxVPJYwvOQnhkkp71FJhh1EvhFtxZ4hs
         ppQBR4ZM7xnR7drBHD2AoxRccjmLMO5Vr2BcHWiHkSFBceaHVOBns+RTmE3Uqalsk25s
         4TBozaUMK8pGAiB1fqdYEUf68vd4jjFhZy8iJqmaFibrsqfNEzFqBXYsw3cknpeCtVO6
         8TMqHNQKSBUitigNKNX1mtuVnlDRvN+KRfxy5DQ7UimTW/0A7ikew7SbniLgF9aam97L
         a3VX+2R7RKLRHlyXTWmEaFdHe0K9rMXZzSWreYvjky/zbSj+6rs8MkidiZE09wMxxRTV
         ekpg==
X-Gm-Message-State: AOJu0Yx07Ve44jLw+k5TEatOQ97N4uyJ9srULCyfjx8RrIawvVhx6rQE
	ayvCwnNQRGVC2vIKdzY+4tZ/ItfvEqiaEvCQN+GqhF7T2aM79tRJ60ZUmFUc4+9Go9GDiN1aP58
	=
X-Google-Smtp-Source: AGHT+IG2roNWLTYbkq23uOPef2XlIRbEi9UoBtIxuNkOBY2mkRMJzrIjIFaUqv0aLAV2ZD7CNFdXOw==
X-Received: by 2002:a17:907:c13:b0:a86:8cfe:ec0e with SMTP id a640c23a62f3a-a89a369f9aamr1176686666b.36.1725456581613;
        Wed, 04 Sep 2024 06:29:41 -0700 (PDT)
Message-ID: <b64639ae-e0e8-46d2-81ee-b1ffaa2a3787@suse.com>
Date: Wed, 4 Sep 2024 15:29:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/5] x86/HVM: correct read/write split at page boundaries
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Manuel Andreas <manuel.andreas@tum.de>
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

The MMIO cache is intended to have one entry used per independent memory
access that an insn does. This, in particular, is supposed to be
ignoring any page boundary crossing. Therefore when looking up a cache
entry, the access'es starting (linear) address is relevant, not the one
possibly advanced past a page boundary.

In order for the same offset-into-buffer variable to be usable in
hvmemul_phys_mmio_access() for both the caller's buffer and the cache
entry's it is further necessary to have the un-adjusted caller buffer
passed into there.

Fixes: 2d527ba310dc ("x86/hvm: split all linear reads and writes at page boundary")
Reported-by: Manuel Andreas <manuel.andreas@tum.de>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This way problematic overlaps are only reduced (to ones starting at the
same address), not eliminated: Assumptions in hvmemul_phys_mmio_access()
go further - if a subsequent access is larger than an earlier one, but
the splitting results in a chunk to cross the end "boundary" of the
earlier access, an assertion will still trigger. Explicit memory
accesses (ones encoded in an insn by explicit or implicit memory
operands) match the assumption afaict (i.e. all those accesses are of
uniform size, and hence they either fully overlap or are mapped to
distinct cache entries).

Insns accessing descriptor tables, otoh, don't fulfill these
expectations: The selector read (if coming from memory) will always be
smaller than the descriptor being read, and if both (insanely) start at
the same linear address (in turn mapping MMIO), said assertion will kick
in. (The same would be true for an insn trying to access itself as data,
as long as certain size "restrictions" between insn and memory operand
are met. Except that linear_read() disallows insn fetches from MMIO.) To
deal with such, I expect we will need to further qualify (tag) cache
entries, such that reads/writes won't use insn fetch entries, and
implicit-supervisor-mode accesses won't use entries of ordinary
accesses. (Page table accesses don't need considering here for now, as
our page walking code demands page tables to be mappable, implying
they're in guest RAM; such accesses also don't take the path here.)
Thoughts anyone, before I get to making another patch?

Considering the insn fetch aspect mentioned above I'm having trouble
following why the cache has 3 entries. With insn fetches permitted,
descriptor table accesses where the accessed bit needs setting may also
fail because of that limited capacity of the cache, due to the way the
accesses are done. The read and write (cmpxchg) are independent accesses
from the cache's perspective, and hence we'd need another entry there.
If, otoh, the 3 entries are there to account for precisely this (which
seems unlikely with commit e101123463d2 ["x86/hvm: track large memory
mapped accesses by buffer offset"] not saying anything at all), then we
should be fine in this regard. If we were to permit insn fetches, which
way to overcome this (possibly by allowing the write to re-use the
earlier read's entry in this special situation) would remain to be
determined.

--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -31,8 +31,9 @@
  * device-model transactions.
  */
 struct hvm_mmio_cache {
-    unsigned long gla;
-    unsigned int size;
+    unsigned long gla;     /* Start of original access (e.g. insn operand) */
+    unsigned int skip;     /* Offset to start of MMIO */
+    unsigned int size;     /* Populated space, including @skip */
     unsigned int space:31;
     unsigned int dir:1;
     uint8_t buffer[] __aligned(sizeof(long));
@@ -953,6 +954,13 @@ static int hvmemul_phys_mmio_access(
         return X86EMUL_UNHANDLEABLE;
     }
 
+    /* Accesses must not be to the unused leading space. */
+    if ( offset < cache->skip )
+    {
+        ASSERT_UNREACHABLE();
+        return X86EMUL_UNHANDLEABLE;
+    }
+
     /*
      * hvmemul_do_io() cannot handle non-power-of-2 accesses or
      * accesses larger than sizeof(long), so choose the highest power
@@ -1010,13 +1018,15 @@ static int hvmemul_phys_mmio_access(
 
 /*
  * Multi-cycle MMIO handling is based upon the assumption that emulation
- * of the same instruction will not access the same MMIO region more
- * than once. Hence we can deal with re-emulation (for secondary or
- * subsequent cycles) by looking up the result or previous I/O in a
- * cache indexed by linear MMIO address.
+ * of the same instruction will not access the exact same MMIO region
+ * more than once in exactly the same way (if it does, the accesses will
+ * be "folded"). Hence we can deal with re-emulation (for secondary or
+ * subsequent cycles) by looking up the result of previous I/O in a cache
+ * indexed by linear address and access type.
  */
 static struct hvm_mmio_cache *hvmemul_find_mmio_cache(
-    struct hvm_vcpu_io *hvio, unsigned long gla, uint8_t dir, bool create)
+    struct hvm_vcpu_io *hvio, unsigned long gla, uint8_t dir,
+    unsigned int skip)
 {
     unsigned int i;
     struct hvm_mmio_cache *cache;
@@ -1030,7 +1040,11 @@ static struct hvm_mmio_cache *hvmemul_fi
             return cache;
     }
 
-    if ( !create )
+    /*
+     * Bail if a new entry shouldn't be allocated, utilizing that ->space has
+     * the same value for all entries.
+     */
+    if ( skip >= hvio->mmio_cache[0]->space )
         return NULL;
 
     i = hvio->mmio_cache_count;
@@ -1043,7 +1057,8 @@ static struct hvm_mmio_cache *hvmemul_fi
     memset(cache->buffer, 0, cache->space);
 
     cache->gla = gla;
-    cache->size = 0;
+    cache->skip = skip;
+    cache->size = skip;
     cache->dir = dir;
 
     return cache;
@@ -1064,12 +1079,14 @@ static void latch_linear_to_phys(struct
 
 static int hvmemul_linear_mmio_access(
     unsigned long gla, unsigned int size, uint8_t dir, void *buffer,
-    uint32_t pfec, struct hvm_emulate_ctxt *hvmemul_ctxt, bool known_gpfn)
+    uint32_t pfec, struct hvm_emulate_ctxt *hvmemul_ctxt,
+    unsigned long start, bool known_gpfn)
 {
     struct hvm_vcpu_io *hvio = &current->arch.hvm.hvm_io;
     unsigned long offset = gla & ~PAGE_MASK;
-    struct hvm_mmio_cache *cache = hvmemul_find_mmio_cache(hvio, gla, dir, true);
-    unsigned int chunk, buffer_offset = 0;
+    unsigned int chunk, buffer_offset = gla - start;
+    struct hvm_mmio_cache *cache = hvmemul_find_mmio_cache(hvio, start, dir,
+                                                           buffer_offset);
     paddr_t gpa;
     unsigned long one_rep = 1;
     int rc;
@@ -1117,19 +1134,19 @@ static int hvmemul_linear_mmio_access(
 static inline int hvmemul_linear_mmio_read(
     unsigned long gla, unsigned int size, void *buffer,
     uint32_t pfec, struct hvm_emulate_ctxt *hvmemul_ctxt,
-    bool translate)
+    unsigned long start, bool translate)
 {
     return hvmemul_linear_mmio_access(gla, size, IOREQ_READ, buffer,
-                                      pfec, hvmemul_ctxt, translate);
+                                      pfec, hvmemul_ctxt, start, translate);
 }
 
 static inline int hvmemul_linear_mmio_write(
     unsigned long gla, unsigned int size, void *buffer,
     uint32_t pfec, struct hvm_emulate_ctxt *hvmemul_ctxt,
-    bool translate)
+    unsigned long start, bool translate)
 {
     return hvmemul_linear_mmio_access(gla, size, IOREQ_WRITE, buffer,
-                                      pfec, hvmemul_ctxt, translate);
+                                      pfec, hvmemul_ctxt, start, translate);
 }
 
 static bool known_gla(unsigned long addr, unsigned int bytes, uint32_t pfec)
@@ -1158,7 +1175,10 @@ static int linear_read(unsigned long add
 {
     pagefault_info_t pfinfo;
     struct hvm_vcpu_io *hvio = &current->arch.hvm.hvm_io;
+    void *buffer = p_data;
+    unsigned long start = addr;
     unsigned int offset = addr & ~PAGE_MASK;
+    const struct hvm_mmio_cache *cache;
     int rc;
 
     if ( offset + bytes > PAGE_SIZE )
@@ -1182,8 +1202,17 @@ static int linear_read(unsigned long add
      * an access that was previously handled as MMIO. Thus it is imperative that
      * we handle this access in the same way to guarantee completion and hence
      * clean up any interim state.
+     *
+     * Care must be taken, however, to correctly deal with crossing RAM/MMIO or
+     * MMIO/RAM boundaries. While we want to use a single cache entry (tagged
+     * by the starting linear address), we need to continue issuing (i.e. also
+     * upon replay) the RAM access for anything that's ahead of or past MMIO,
+     * i.e. in RAM.
      */
-    if ( !hvmemul_find_mmio_cache(hvio, addr, IOREQ_READ, false) )
+    cache = hvmemul_find_mmio_cache(hvio, start, IOREQ_READ, ~0);
+    if ( !cache ||
+         addr + bytes <= start + cache->skip ||
+         addr >= start + cache->size )
         rc = hvm_copy_from_guest_linear(p_data, addr, bytes, pfec, &pfinfo);
 
     switch ( rc )
@@ -1199,8 +1228,8 @@ static int linear_read(unsigned long add
         if ( pfec & PFEC_insn_fetch )
             return X86EMUL_UNHANDLEABLE;
 
-        return hvmemul_linear_mmio_read(addr, bytes, p_data, pfec,
-                                        hvmemul_ctxt,
+        return hvmemul_linear_mmio_read(addr, bytes, buffer, pfec,
+                                        hvmemul_ctxt, start,
                                         known_gla(addr, bytes, pfec));
 
     case HVMTRANS_gfn_paged_out:
@@ -1217,7 +1246,10 @@ static int linear_write(unsigned long ad
 {
     pagefault_info_t pfinfo;
     struct hvm_vcpu_io *hvio = &current->arch.hvm.hvm_io;
+    void *buffer = p_data;
+    unsigned long start = addr;
     unsigned int offset = addr & ~PAGE_MASK;
+    const struct hvm_mmio_cache *cache;
     int rc;
 
     if ( offset + bytes > PAGE_SIZE )
@@ -1236,13 +1268,11 @@ static int linear_write(unsigned long ad
 
     rc = HVMTRANS_bad_gfn_to_mfn;
 
-    /*
-     * If there is an MMIO cache entry for the access then we must be re-issuing
-     * an access that was previously handled as MMIO. Thus it is imperative that
-     * we handle this access in the same way to guarantee completion and hence
-     * clean up any interim state.
-     */
-    if ( !hvmemul_find_mmio_cache(hvio, addr, IOREQ_WRITE, false) )
+    /* See commentary in linear_read(). */
+    cache = hvmemul_find_mmio_cache(hvio, start, IOREQ_WRITE, ~0);
+    if ( !cache ||
+         addr + bytes <= start + cache->skip ||
+         addr >= start + cache->size )
         rc = hvm_copy_to_guest_linear(addr, p_data, bytes, pfec, &pfinfo);
 
     switch ( rc )
@@ -1255,8 +1285,8 @@ static int linear_write(unsigned long ad
         return X86EMUL_EXCEPTION;
 
     case HVMTRANS_bad_gfn_to_mfn:
-        return hvmemul_linear_mmio_write(addr, bytes, p_data, pfec,
-                                         hvmemul_ctxt,
+        return hvmemul_linear_mmio_write(addr, bytes, buffer, pfec,
+                                         hvmemul_ctxt, start,
                                          known_gla(addr, bytes, pfec));
 
     case HVMTRANS_gfn_paged_out:
@@ -1643,7 +1673,7 @@ static int cf_check hvmemul_cmpxchg(
     {
         /* Fix this in case the guest is really relying on r-m-w atomicity. */
         return hvmemul_linear_mmio_write(addr, bytes, p_new, pfec,
-                                         hvmemul_ctxt,
+                                         hvmemul_ctxt, addr,
                                          hvio->mmio_access.write_access &&
                                          hvio->mmio_gla == (addr & PAGE_MASK));
     }


