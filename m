Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB2782B192
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 16:18:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666353.1036925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNwp6-000157-9h; Thu, 11 Jan 2024 15:18:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666353.1036925; Thu, 11 Jan 2024 15:18:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNwp6-00012v-6s; Thu, 11 Jan 2024 15:18:24 +0000
Received: by outflank-mailman (input) for mailman id 666353;
 Thu, 11 Jan 2024 15:18:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNwp5-0000LM-26
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 15:18:23 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8335aa4-b094-11ee-98f0-6d05b1d4d9a1;
 Thu, 11 Jan 2024 16:18:22 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40e62979d41so2207175e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 07:18:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fk10-20020a05600c0cca00b0040e5a0ebabesm4245126wmb.21.2024.01.11.07.18.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 07:18:21 -0800 (PST)
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
X-Inumbo-ID: a8335aa4-b094-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704986301; x=1705591101; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HrHkDSKkd/RFXi3H4lhjscho8DAVe02PCLpAr/Vcyyw=;
        b=NX2hVRBV3cp9Hm7J/tt32m0BrG+J/qYNE5YUUFTNJkftVPbJtq2sFoTb+RJmnYL6mp
         dYCGc2Mzzzi2hJ9ZrTsKpvBquFd9nNViz3m0tjgKMjpd0ZqxpkCIIa0dvnYL55eDKh3L
         YbY5A2USHE3lyQvOwK4afEs2orvgdeKGTc1wbXASmuBu3mQhXyPa7cVMOEJDONSE0+Jh
         78XZ8eAv00igxtF3ZhV5IemJDY01vB/4GZEYvEPCM9t1iu9ucgME4cGbE9IxBTGzW8Ow
         Ju/Cx94zGjaoEJm3agLc3HXQNYUb6JK2UG1YsV/ONIc4cbFyMCzfXpscYzarMOlTf6Sx
         o/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704986301; x=1705591101;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HrHkDSKkd/RFXi3H4lhjscho8DAVe02PCLpAr/Vcyyw=;
        b=gv3/p0Fxwwg23gEn3g+7neB+/0WNqp9+ONayulqxLltaoSgg2+WGNIeDxDFHv9NPkD
         oZujIHsmU5UYYj+3rooKqPUrhYNtPZQdKy0paQOkyYHLuzuiBEMJWFG+dun0r1yXu7NH
         52Vyj75bDoe04HVFOqBOCP1WTz0UbZ6Xxsp0NgHwoi/Y/x+vrI8Wt25gjLEUYzXvosK3
         /fvXPGLnbLrno6tQjeYRxBwIjU7m9GecN8feTSVCR3CRsaASAjNBRORm/qtCHRQGXT2o
         J/lHXNKicZajPw2FuDCiufJZVXH6K53pOaYWed3pC7n4AGEEro+4h5x9Gf67gCM7VUxa
         22vw==
X-Gm-Message-State: AOJu0YwLHYe8fHKTESfgOUT1ibH/TEYMmIhCU6fvrNG6A4/fQitAikCx
	zGtH0H36Au6Yg1NdJfUAbi0vnym/AClctkwv2uGT8XsLQg==
X-Google-Smtp-Source: AGHT+IEYmb7cgh2VwvkhGx4h0hrOG6gmLcujMYIwkgkSSADnki9dhycNfbNFfN89l8rmd+dKdhbBrw==
X-Received: by 2002:a05:600c:4f07:b0:40e:50e7:db03 with SMTP id l7-20020a05600c4f0700b0040e50e7db03mr292519wmq.316.1704986301507;
        Thu, 11 Jan 2024 07:18:21 -0800 (PST)
Message-ID: <9e3a4d3c-38f3-4e73-8775-3252ca531f06@suse.com>
Date: Thu, 11 Jan 2024 16:18:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/8] x86emul/test: rename "cp"
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <298db76f-d0ee-4d47-931f-1baa1a7546cf@suse.com>
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
In-Reply-To: <298db76f-d0ee-4d47-931f-1baa1a7546cf@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

In preparation of introducing a const struct cpu_policy * local in
x86_emulate(), rename that global variable to something more suitable:
"cp" is our commonly used name for function parameters or local
variables of type struct cpu_policy *, and the present name of the
global could hence have interfered already.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
+++ b/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
@@ -899,7 +899,7 @@ int LLVMFuzzerTestOneInput(const uint8_t
     int rc;
 
     /* Not part of the initializer, for old gcc to cope. */
-    ctxt.cpu_policy = &cp;
+    ctxt.cpu_policy = &cpu_policy;
 
     /* Reset all global state variables */
     memset(&input, 0, sizeof(input));
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -888,7 +888,8 @@ static void zap_fpsel(unsigned int *env,
         env[3] &= ~0xffff;
     }
 
-    if ( cp.x86_vendor != X86_VENDOR_AMD && cp.x86_vendor != X86_VENDOR_HYGON )
+    if ( cpu_policy.x86_vendor != X86_VENDOR_AMD &&
+         cpu_policy.x86_vendor != X86_VENDOR_HYGON )
         return;
 
     if ( is_32bit )
@@ -1022,7 +1023,7 @@ int main(int argc, char **argv)
 
     ctxt.regs = &regs;
     ctxt.force_writeback = 0;
-    ctxt.cpu_policy = &cp;
+    ctxt.cpu_policy = &cpu_policy;
     ctxt.lma       = sizeof(void *) == 8;
     ctxt.addr_size = 8 * sizeof(void *);
     ctxt.sp_size   = 8 * sizeof(void *);
@@ -1540,7 +1541,7 @@ int main(int argc, char **argv)
     regs.edx = (unsigned long)res;
     res[0]   = 0x00004444;
     res[1]   = 0x8888cccc;
-    i = cp.extd.nscb; cp.extd.nscb = true; /* for AMD */
+    i = cpu_policy.extd.nscb; cpu_policy.extd.nscb = true; /* for AMD */
     rc = x86_emulate(&ctxt, &emulops);
     if ( (rc != X86EMUL_OKAY) ||
          (regs.eip != (unsigned long)&instr[5]) ||
@@ -1549,7 +1550,7 @@ int main(int argc, char **argv)
         goto fail;
     printf("okay\n");
 
-    cp.extd.nscb = i;
+    cpu_policy.extd.nscb = i;
     emulops.write_segment = NULL;
 
     printf("%-40s", "Testing rdmsrlist...");
@@ -1803,11 +1804,11 @@ int main(int argc, char **argv)
         goto fail;
     printf("okay\n");
 
-    vendor_native = cp.x86_vendor;
-    for ( cp.x86_vendor = X86_VENDOR_AMD; ; )
+    vendor_native = cpu_policy.x86_vendor;
+    for ( cpu_policy.x86_vendor = X86_VENDOR_AMD; ; )
     {
-        unsigned int v = cp.x86_vendor == X86_VENDOR_INTEL;
-        const char *vendor = cp.x86_vendor == X86_VENDOR_INTEL ? "Intel" : "AMD";
+        unsigned int v = cpu_policy.x86_vendor == X86_VENDOR_INTEL;
+        const char *vendor = cpu_policy.x86_vendor == X86_VENDOR_INTEL ? "Intel" : "AMD";
         uint64_t *stk = (void *)res + MMAP_SZ - 16;
 
         regs.rcx = 2;
@@ -1843,11 +1844,11 @@ int main(int argc, char **argv)
             printf("okay\n");
         }
 
-        if ( cp.x86_vendor == X86_VENDOR_INTEL )
+        if ( cpu_policy.x86_vendor == X86_VENDOR_INTEL )
             break;
-        cp.x86_vendor = X86_VENDOR_INTEL;
+        cpu_policy.x86_vendor = X86_VENDOR_INTEL;
     }
-    cp.x86_vendor = vendor_native;
+    cpu_policy.x86_vendor = vendor_native;
 #endif /* x86-64 */
 
     printf("%-40s", "Testing shld $1,%ecx,(%edx)...");
--- a/tools/tests/x86_emulator/x86-emulate.c
+++ b/tools/tests/x86_emulator/x86-emulate.c
@@ -25,7 +25,7 @@
 #endif
 
 uint32_t mxcsr_mask = 0x0000ffbf;
-struct cpu_policy cp;
+struct cpu_policy cpu_policy;
 
 static char fpu_save_area[0x4000] __attribute__((__aligned__((64))));
 static bool use_xsave;
@@ -75,24 +75,24 @@ bool emul_test_init(void)
 
     unsigned long sp;
 
-    x86_cpu_policy_fill_native(&cp);
-    x86_cpu_policy_bound_max_leaves(&cp);
+    x86_cpu_policy_fill_native(&cpu_policy);
+    x86_cpu_policy_bound_max_leaves(&cpu_policy);
 
     /*
      * The emulator doesn't use these instructions, so can always emulate
      * them.
      */
-    cp.basic.movbe = true;
-    cp.feat.invpcid = true;
-    cp.feat.adx = true;
-    cp.feat.avx512pf = cp.feat.avx512f;
-    cp.feat.rdpid = true;
-    cp.feat.lkgs = true;
-    cp.feat.wrmsrns = true;
-    cp.feat.msrlist = true;
-    cp.extd.clzero = true;
+    cpu_policy.basic.movbe = true;
+    cpu_policy.feat.invpcid = true;
+    cpu_policy.feat.adx = true;
+    cpu_policy.feat.avx512pf = cpu_policy.feat.avx512f;
+    cpu_policy.feat.rdpid = true;
+    cpu_policy.feat.lkgs = true;
+    cpu_policy.feat.wrmsrns = true;
+    cpu_policy.feat.msrlist = true;
+    cpu_policy.extd.clzero = true;
 
-    x86_cpu_policy_shrink_max_leaves(&cp);
+    x86_cpu_policy_shrink_max_leaves(&cpu_policy);
 
     if ( cpu_has_xsave )
     {
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -69,7 +69,7 @@
 #define is_canonical_address(x) (((int64_t)(x) >> 47) == ((int64_t)(x) >> 63))
 
 extern uint32_t mxcsr_mask;
-extern struct cpu_policy cp;
+extern struct cpu_policy cpu_policy;
 
 #define MMAP_SZ 16384
 bool emul_test_init(void);
@@ -123,7 +123,7 @@ static inline uint64_t xgetbv(uint32_t x
 }
 
 /* Intentionally checking OSXSAVE here. */
-#define cpu_has_xsave     (cp.basic.raw[1].c & (1u << 27))
+#define cpu_has_xsave     (cpu_policy.basic.raw[1].c & (1u << 27))
 
 static inline bool xcr0_mask(uint64_t mask)
 {
@@ -133,67 +133,67 @@ static inline bool xcr0_mask(uint64_t ma
 unsigned int rdpkru(void);
 void wrpkru(unsigned int val);
 
-#define cache_line_size() (cp.basic.clflush_size * 8)
-#define cpu_has_fpu        cp.basic.fpu
-#define cpu_has_mmx        cp.basic.mmx
-#define cpu_has_fxsr       cp.basic.fxsr
-#define cpu_has_sse        cp.basic.sse
-#define cpu_has_sse2       cp.basic.sse2
-#define cpu_has_sse3       cp.basic.sse3
-#define cpu_has_pclmulqdq  cp.basic.pclmulqdq
-#define cpu_has_ssse3      cp.basic.ssse3
-#define cpu_has_fma       (cp.basic.fma && xcr0_mask(6))
-#define cpu_has_sse4_1     cp.basic.sse4_1
-#define cpu_has_sse4_2     cp.basic.sse4_2
-#define cpu_has_popcnt     cp.basic.popcnt
-#define cpu_has_aesni      cp.basic.aesni
-#define cpu_has_avx       (cp.basic.avx  && xcr0_mask(6))
-#define cpu_has_f16c      (cp.basic.f16c && xcr0_mask(6))
-
-#define cpu_has_avx2      (cp.feat.avx2 && xcr0_mask(6))
-#define cpu_has_bmi1       cp.feat.bmi1
-#define cpu_has_bmi2       cp.feat.bmi2
-#define cpu_has_avx512f   (cp.feat.avx512f  && xcr0_mask(0xe6))
-#define cpu_has_avx512dq  (cp.feat.avx512dq && xcr0_mask(0xe6))
-#define cpu_has_avx512_ifma (cp.feat.avx512_ifma && xcr0_mask(0xe6))
-#define cpu_has_avx512er  (cp.feat.avx512er && xcr0_mask(0xe6))
-#define cpu_has_avx512cd  (cp.feat.avx512cd && xcr0_mask(0xe6))
-#define cpu_has_sha        cp.feat.sha
-#define cpu_has_avx512bw  (cp.feat.avx512bw && xcr0_mask(0xe6))
-#define cpu_has_avx512vl  (cp.feat.avx512vl && xcr0_mask(0xe6))
-#define cpu_has_avx512_vbmi (cp.feat.avx512_vbmi && xcr0_mask(0xe6))
-#define cpu_has_avx512_vbmi2 (cp.feat.avx512_vbmi2 && xcr0_mask(0xe6))
-#define cpu_has_gfni       cp.feat.gfni
-#define cpu_has_vaes      (cp.feat.vaes && xcr0_mask(6))
-#define cpu_has_vpclmulqdq (cp.feat.vpclmulqdq && xcr0_mask(6))
-#define cpu_has_avx512_vnni (cp.feat.avx512_vnni && xcr0_mask(0xe6))
-#define cpu_has_avx512_bitalg (cp.feat.avx512_bitalg && xcr0_mask(0xe6))
-#define cpu_has_avx512_vpopcntdq (cp.feat.avx512_vpopcntdq && xcr0_mask(0xe6))
-#define cpu_has_movdiri    cp.feat.movdiri
-#define cpu_has_movdir64b  cp.feat.movdir64b
-#define cpu_has_avx512_4vnniw (cp.feat.avx512_4vnniw && xcr0_mask(0xe6))
-#define cpu_has_avx512_4fmaps (cp.feat.avx512_4fmaps && xcr0_mask(0xe6))
-#define cpu_has_avx512_vp2intersect (cp.feat.avx512_vp2intersect && xcr0_mask(0xe6))
-#define cpu_has_serialize  cp.feat.serialize
-#define cpu_has_avx512_fp16 (cp.feat.avx512_fp16 && xcr0_mask(0xe6))
-#define cpu_has_sha512     (cp.feat.sha512 && xcr0_mask(6))
-#define cpu_has_sm3        (cp.feat.sm3 && xcr0_mask(6))
-#define cpu_has_sm4        (cp.feat.sm4 && xcr0_mask(6))
-#define cpu_has_avx_vnni   (cp.feat.avx_vnni && xcr0_mask(6))
-#define cpu_has_avx512_bf16 (cp.feat.avx512_bf16 && xcr0_mask(0xe6))
-#define cpu_has_cmpccxadd  cp.feat.cmpccxadd
-#define cpu_has_avx_ifma   (cp.feat.avx_ifma && xcr0_mask(6))
-#define cpu_has_avx_vnni_int8 (cp.feat.avx_vnni_int8 && xcr0_mask(6))
-#define cpu_has_avx_ne_convert (cp.feat.avx_ne_convert && xcr0_mask(6))
-#define cpu_has_avx_vnni_int16 (cp.feat.avx_vnni_int16 && xcr0_mask(6))
-
-#define cpu_has_xgetbv1   (cpu_has_xsave && cp.xstate.xgetbv1)
-
-#define cpu_has_3dnow_ext  cp.extd._3dnowext
-#define cpu_has_sse4a      cp.extd.sse4a
-#define cpu_has_xop       (cp.extd.xop  && xcr0_mask(6))
-#define cpu_has_fma4      (cp.extd.fma4 && xcr0_mask(6))
-#define cpu_has_tbm        cp.extd.tbm
+#define cache_line_size() (cpu_policy.basic.clflush_size * 8)
+#define cpu_has_fpu        cpu_policy.basic.fpu
+#define cpu_has_mmx        cpu_policy.basic.mmx
+#define cpu_has_fxsr       cpu_policy.basic.fxsr
+#define cpu_has_sse        cpu_policy.basic.sse
+#define cpu_has_sse2       cpu_policy.basic.sse2
+#define cpu_has_sse3       cpu_policy.basic.sse3
+#define cpu_has_pclmulqdq  cpu_policy.basic.pclmulqdq
+#define cpu_has_ssse3      cpu_policy.basic.ssse3
+#define cpu_has_fma       (cpu_policy.basic.fma && xcr0_mask(6))
+#define cpu_has_sse4_1     cpu_policy.basic.sse4_1
+#define cpu_has_sse4_2     cpu_policy.basic.sse4_2
+#define cpu_has_popcnt     cpu_policy.basic.popcnt
+#define cpu_has_aesni      cpu_policy.basic.aesni
+#define cpu_has_avx       (cpu_policy.basic.avx  && xcr0_mask(6))
+#define cpu_has_f16c      (cpu_policy.basic.f16c && xcr0_mask(6))
+
+#define cpu_has_avx2      (cpu_policy.feat.avx2 && xcr0_mask(6))
+#define cpu_has_bmi1       cpu_policy.feat.bmi1
+#define cpu_has_bmi2       cpu_policy.feat.bmi2
+#define cpu_has_avx512f   (cpu_policy.feat.avx512f  && xcr0_mask(0xe6))
+#define cpu_has_avx512dq  (cpu_policy.feat.avx512dq && xcr0_mask(0xe6))
+#define cpu_has_avx512_ifma (cpu_policy.feat.avx512_ifma && xcr0_mask(0xe6))
+#define cpu_has_avx512er  (cpu_policy.feat.avx512er && xcr0_mask(0xe6))
+#define cpu_has_avx512cd  (cpu_policy.feat.avx512cd && xcr0_mask(0xe6))
+#define cpu_has_sha        cpu_policy.feat.sha
+#define cpu_has_avx512bw  (cpu_policy.feat.avx512bw && xcr0_mask(0xe6))
+#define cpu_has_avx512vl  (cpu_policy.feat.avx512vl && xcr0_mask(0xe6))
+#define cpu_has_avx512_vbmi (cpu_policy.feat.avx512_vbmi && xcr0_mask(0xe6))
+#define cpu_has_avx512_vbmi2 (cpu_policy.feat.avx512_vbmi2 && xcr0_mask(0xe6))
+#define cpu_has_gfni       cpu_policy.feat.gfni
+#define cpu_has_vaes      (cpu_policy.feat.vaes && xcr0_mask(6))
+#define cpu_has_vpclmulqdq (cpu_policy.feat.vpclmulqdq && xcr0_mask(6))
+#define cpu_has_avx512_vnni (cpu_policy.feat.avx512_vnni && xcr0_mask(0xe6))
+#define cpu_has_avx512_bitalg (cpu_policy.feat.avx512_bitalg && xcr0_mask(0xe6))
+#define cpu_has_avx512_vpopcntdq (cpu_policy.feat.avx512_vpopcntdq && xcr0_mask(0xe6))
+#define cpu_has_movdiri    cpu_policy.feat.movdiri
+#define cpu_has_movdir64b  cpu_policy.feat.movdir64b
+#define cpu_has_avx512_4vnniw (cpu_policy.feat.avx512_4vnniw && xcr0_mask(0xe6))
+#define cpu_has_avx512_4fmaps (cpu_policy.feat.avx512_4fmaps && xcr0_mask(0xe6))
+#define cpu_has_avx512_vp2intersect (cpu_policy.feat.avx512_vp2intersect && xcr0_mask(0xe6))
+#define cpu_has_serialize  cpu_policy.feat.serialize
+#define cpu_has_avx512_fp16 (cpu_policy.feat.avx512_fp16 && xcr0_mask(0xe6))
+#define cpu_has_sha512     (cpu_policy.feat.sha512 && xcr0_mask(6))
+#define cpu_has_sm3        (cpu_policy.feat.sm3 && xcr0_mask(6))
+#define cpu_has_sm4        (cpu_policy.feat.sm4 && xcr0_mask(6))
+#define cpu_has_avx_vnni   (cpu_policy.feat.avx_vnni && xcr0_mask(6))
+#define cpu_has_avx512_bf16 (cpu_policy.feat.avx512_bf16 && xcr0_mask(0xe6))
+#define cpu_has_cmpccxadd  cpu_policy.feat.cmpccxadd
+#define cpu_has_avx_ifma   (cpu_policy.feat.avx_ifma && xcr0_mask(6))
+#define cpu_has_avx_vnni_int8 (cpu_policy.feat.avx_vnni_int8 && xcr0_mask(6))
+#define cpu_has_avx_ne_convert (cpu_policy.feat.avx_ne_convert && xcr0_mask(6))
+#define cpu_has_avx_vnni_int16 (cpu_policy.feat.avx_vnni_int16 && xcr0_mask(6))
+
+#define cpu_has_xgetbv1   (cpu_has_xsave && cpu_policy.xstate.xgetbv1)
+
+#define cpu_has_3dnow_ext  cpu_policy.extd._3dnowext
+#define cpu_has_sse4a      cpu_policy.extd.sse4a
+#define cpu_has_xop       (cpu_policy.extd.xop  && xcr0_mask(6))
+#define cpu_has_fma4      (cpu_policy.extd.fma4 && xcr0_mask(6))
+#define cpu_has_tbm        cpu_policy.extd.tbm
 
 int emul_test_cpuid(
     uint32_t leaf,


