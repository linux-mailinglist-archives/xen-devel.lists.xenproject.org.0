Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CB4951710
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 10:54:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776951.1187159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se9m4-0006pQ-Mk; Wed, 14 Aug 2024 08:54:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776951.1187159; Wed, 14 Aug 2024 08:54:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se9m4-0006nf-Jw; Wed, 14 Aug 2024 08:54:32 +0000
Received: by outflank-mailman (input) for mailman id 776951;
 Wed, 14 Aug 2024 08:54:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NhoJ=PN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1se9m3-0006nV-51
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 08:54:31 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0cd9e20-5a1a-11ef-8776-851b0ebba9a2;
 Wed, 14 Aug 2024 10:54:29 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5bd13ea7604so5082465a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2024 01:54:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5beadd60ca1sm253121a12.8.2024.08.14.01.54.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 01:54:28 -0700 (PDT)
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
X-Inumbo-ID: d0cd9e20-5a1a-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723625669; x=1724230469; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VEMbn57k+IX3mUL6ZJ4mDTAe8F4l+MGuoPMbxvAr1xg=;
        b=AFJ3j9yqajvsLThckgbYyCkpMTUiTwrgjLHrmpnUmNECObAc9z5mxDvITljwjoohtx
         Rvg1LL/wE0ILSNJx0lJ2iGNl1yvyLD2Q52E4Kbwz6vMAPbDwtQAVrRc/MKKVYKKxyyFg
         i/49M/BD6qTilMmtdAgtxuul+1WhmhZtWYG/spZJPPhtJyXkGL2HGjPQ1WgN1YuXQpyX
         AN5BNg2rkBMXa3ob1GQnK3gccZhNTKS6J3s5qJ4O5UUHC9yTp/1xofCI0GmvhzOlO3VT
         X0WLJOk9/TIQeWnLxoB1QYqZ5SSalYBKV0chEm2h+hBglX/oZeNveg7HlU/Gw6K9pNew
         /+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723625669; x=1724230469;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VEMbn57k+IX3mUL6ZJ4mDTAe8F4l+MGuoPMbxvAr1xg=;
        b=wnJECOVOEEyTkOzBjtb4bVnT2Vc1O2N8LRpOTXkGiprra8OfHWix3bs8UbmksVCr2f
         OOy1V2G3BQ3eUUYuvAD9/XEBZ49s0jfo2IgtziREb1QukwndsqxYTZii/Ugfjbhzxg3v
         CQVYgDQsNdroQa0GuNi3IFPSDxFvEZzW4UEU4NiK/QCfwU2vTIVXoa02Q2v/6QBmQXEj
         5p6zNvflnHHwBJ8927HMi69NA8QUCKsnNgjOct+hlF0NjBCtZUaCXibbwoW1uYKhT0xs
         lSPztz3IH1fDII+CcyN2GpLheRLJWZqfQUXrPZ4fHdQpU5dmDk7y/L2+yL6musLQ8NRJ
         B+zQ==
X-Gm-Message-State: AOJu0YxzlUXnFy2WR6tltiAmqyiilQ+dd9YrhsfdB5abX7en5hZNp7mv
	hLOc/jQ0Ob+cmE/wayPK5B5iqn7JlfGds/lctWStjlubzEYIwVtTLZ4K9s5dDyQTqZQTAocgZ8E
	=
X-Google-Smtp-Source: AGHT+IFBudeW5U9jWYxBouE8CiPLodiB68nvHdXzAUYvXOmhVFSI3KqW4rHDceWL0EOFvSBGurXgbg==
X-Received: by 2002:a05:6402:34d2:b0:5a0:e4a6:b3c9 with SMTP id 4fb4d7f45d1cf-5bea1c6ab94mr1303154a12.7.1723625668549;
        Wed, 14 Aug 2024 01:54:28 -0700 (PDT)
Message-ID: <3a72e8f6-926f-4492-b310-df96f279a2b7@suse.com>
Date: Wed, 14 Aug 2024 10:54:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 9/9] x86emul: support AVX10.2 256-bit embedded rounding /
 SAE
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <bcfea345-57c1-43d9-82b3-240b685486cc@suse.com>
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
In-Reply-To: <bcfea345-57c1-43d9-82b3-240b685486cc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

AVX10.2 (along with APX) assigns new meaning to the bit that previsouly
distinguished EVEX from the Phi co-processor's MVEX. Therefore
evex_encoded() now needs to key off of something else: Use the opcode
mapping field for this, leveraging that map 0 has no assigned opcodes
(and appears unlikely to gain any).

Place the check of EVEX.U such that it'll cover all insns. EVEX.b is
being checked for individual insns as applicable - whenever that's valid
for (register-only) 512-bit forms, it becomes valid for 256-bit forms as
well when AVX10.2 is permitted for a guest.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
To raise the question early: It is entirely unclear to me how we want to
allow control over the AVX10 minor version number from guest configs, as
that's not a boolean field and hence not suitable for simple bit-wise
masking of feature sets.
---
v2: New.

--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -16,7 +16,7 @@
 # define ERR_PTR(val) NULL
 #endif
 
-#define evex_encoded() (s->evex.mbs)
+#define evex_encoded() (s->evex.opcx)
 
 struct x86_emulate_state *
 x86_decode_insn(
@@ -1179,8 +1179,15 @@ int x86emul_decode(struct x86_emulate_st
                         s->evex.raw[1] = s->vex.raw[1];
                         s->evex.raw[2] = insn_fetch_type(uint8_t);
 
-                        generate_exception_if(!s->evex.mbs || s->evex.mbz, X86_EXC_UD);
-                        generate_exception_if(!s->evex.opmsk && s->evex.z, X86_EXC_UD);
+                        /*
+                         * .opcx is being checked here just to be on the safe
+                         * side, especially as long as evex_encoded() uses
+                         * this field.
+                         */
+                        generate_exception_if(s->evex.mbz || !s->evex.opcx,
+                                              X86_EXC_UD);
+                        generate_exception_if(!s->evex.opmsk && s->evex.z,
+                                              X86_EXC_UD);
 
                         if ( !mode_64bit() )
                             s->evex.R = 1;
@@ -1758,6 +1765,12 @@ int x86emul_decode(struct x86_emulate_st
     if ( override_seg != x86_seg_none )
         s->ea.mem.seg = override_seg;
 
+    generate_exception_if((evex_encoded() &&
+                           !s->evex.u &&
+                           (s->modrm_mod != 3 ||
+                            !vcpu_has_avx10(2) || !s->evex.brs)),
+                          X86_EXC_UD);
+
     /* Fetch the immediate operand, if present. */
     switch ( d & SrcMask )
     {
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -221,7 +221,7 @@ union evex {
         uint8_t x:1;     /* X */
         uint8_t r:1;     /* R */
         uint8_t pfx:2;   /* pp */
-        uint8_t mbs:1;
+        uint8_t u:1;     /* U */
         uint8_t reg:4;   /* vvvv */
         uint8_t w:1;     /* W */
         uint8_t opmsk:3; /* aaa */
@@ -582,6 +582,8 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_avx_ne_convert() (ctxt->cpuid->feat.avx_ne_convert)
 #define vcpu_has_avx_vnni_int16() (ctxt->cpuid->feat.avx_vnni_int16)
 
+#define vcpu_has_avx10(minor)  (ctxt->cpuid->avx10.version >= (minor))
+
 #define vcpu_must_have(feat) \
     generate_exception_if(!vcpu_has_##feat(), X86_EXC_UD)
 
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -1240,7 +1240,7 @@ int cf_check x86emul_unhandleable_rw(
 #define lock_prefix (state->lock_prefix)
 #define vex (state->vex)
 #define evex (state->evex)
-#define evex_encoded() (evex.mbs)
+#define evex_encoded() (evex.opcx)
 #define ea (state->ea)
 
 /* Undo DEBUG wrapper. */


