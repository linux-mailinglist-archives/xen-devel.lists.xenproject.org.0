Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBF79ECA5D
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 11:32:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854478.1267679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLK0n-000071-NL; Wed, 11 Dec 2024 10:32:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854478.1267679; Wed, 11 Dec 2024 10:32:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLK0n-0008Vn-JZ; Wed, 11 Dec 2024 10:32:09 +0000
Received: by outflank-mailman (input) for mailman id 854478;
 Wed, 11 Dec 2024 10:32:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HaM=TE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLJpt-00076S-2v
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 10:20:53 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95e169e3-b7a9-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 11:20:46 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-385dece873cso3145205f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 02:20:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2162a479fc7sm72313335ad.47.2024.12.11.02.20.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 02:20:50 -0800 (PST)
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
X-Inumbo-ID: 95e169e3-b7a9-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733912451; x=1734517251; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EYrG6X8uwp+bs8ww0EgrMry1siCkDx4rXslRN+kZ534=;
        b=I9tDmfXpNDdMnWdAx45uwAji31lrAQty28jPDs38DEhMhsLai5N4X+IluaX17W45nf
         EEQ5AZj37KXEYOlVeVIKblB+GGs9Pacd7jZbAFxzaCqcztr98F6GFrwOscVvLdAPtXd0
         1IH+AMV6e0xHcOhBc5SvTCckm9phkPoAbR1Sc1cWDctTZC24kehKW0unkxLxcUE8PXa0
         1hJq1YOL1iaV13OWT0/Ytk9jffzxiB1nfOOkT01+NnKSazBt3/k1t3dO5YVAI8nx3FDV
         QcplgEllvycZNXIEXenFUArfbtsxGKPCOxmMzPDk2s1GV5UGu+CYohvRani0htFEup7V
         Q0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733912451; x=1734517251;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EYrG6X8uwp+bs8ww0EgrMry1siCkDx4rXslRN+kZ534=;
        b=uVs8xEqp0kr2ogsYOrcZPtzCu7XeRdDfXm3hTslbEy1sKLYVbECeIt19dj4KMK6dWi
         E/FwVVXFb23LYaGwW3sxdXLX+yXdORba1YqKen2SVeHhFYFB1CE0sZ3LF4ozy+L5reeH
         FNi4ztrBwj8jcpHL+sjAdM66CB16X2iQL35iLphD3fZutCOwZrtW7NZhFuDex4apxfWl
         vlLel8NMozctrfN6d1Twmq/xAp0nruqj1SfLvGLpIQCYRTgRMn5lZ6G4fFYz8lsR1cV4
         grvUBOnNM6zN+Qv4QOrKW9aJ+UZheY6ydKVLaQy2Imgjf2ipySvUOEES5xloRGS4uZmK
         zjng==
X-Gm-Message-State: AOJu0YyQRk3mnhhxl3t3oQPuCGJH3xT/St5pibKqdWTqixA4elG9bhT7
	YaNLtiyN151yk0fehsbp/M+Wppz25oZJxhRUKLw3Nd3VKWDz0Sey+Bf5zGCCE4nf7tUGbbEgzx8
	=
X-Gm-Gg: ASbGncsK66NpLmo4B1YzLIqgAzqpu9juXTGvF7nhYPQ5APpOoVOkea/+j71M+q/ZSu2
	fW57O3VUycBIYIpCE68437kET1yQvLx+D4lsSb8GNwXFZiAx5eLpOlIg9kltynUmHPq+t4NrAXF
	hKsc+xIDkw5Ec2v/HeqntflGXQqL8SL429RoUDLhwee2n1lvnpjfdlEq7eGsfJsjELbcBKPv27D
	xhWdJruQWSdnuFzhs2Lxov9UbUgBt17ATSHYG68448+V+a+GSOx8G9yYdVH/98B7T7dF2HIyVGF
	YQfIGp9LmmsgBxHDUbmlDTQGtcp8l1aIoOqX2hI=
X-Google-Smtp-Source: AGHT+IHkPNXTc+Yha08gY4NqV2a4G7lJgQZ5Wt4aKB4fhNh+fd/5wUpTc08FUCVRmN9GgaLUv4O4pw==
X-Received: by 2002:a05:6000:18a3:b0:385:f5b6:9c9d with SMTP id ffacd0b85a97d-3864cea5696mr1748859f8f.33.1733912450680;
        Wed, 11 Dec 2024 02:20:50 -0800 (PST)
Message-ID: <f3176cb1-c61d-45b0-bab8-78dd22e4dbf8@suse.com>
Date: Wed, 11 Dec 2024 11:20:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 14/16] x86emul: support other AVX10.2 convert insns
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <516b7f9a-048e-409d-8a4e-89aeb8ffacc4@suse.com>
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
In-Reply-To: <516b7f9a-048e-409d-8a4e-89aeb8ffacc4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Despite most of them being about conversion to BF8/HF8, they are still
somewhat similar to various existing convert insns.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
SDE: ???
---
v3: New.

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -719,8 +719,22 @@ static const struct test avx10_2_all[] =
     INSN(comxsd,           f3,   0f, 2f,    el,    q, el),
     INSN(comxsh,           f2, map5, 2f,    el, fp16, el),
     INSN(comxss,           f2,   0f, 2f,    el,    d, el),
+    INSN(cvt2ps2phx,       66, 0f38, 67,    vl,    d, vl),
+    INSN(cvtbiasph2bf8,      , 0f38, 74,    vl, fp16, vl),
+    INSN(cvtbiasph2bf8s,     , map5, 74,    vl, fp16, vl),
+    INSN(cvtbiasph2hf8,      , map5, 18,    vl, fp16, vl),
+    INSN(cvtbiasph2hf8s,     , map5, 1b,    vl, fp16, vl),
+    INSN(cvthf82ph,        f2, map5, 1e,  vl_2,    b, vl),
+    INSN(cvtne2ph2bf8,     f2, 0f38, 74,    vl, fp16, vl),
+    INSN(cvtne2ph2bf8s,    f2, map5, 74,    vl, fp16, vl),
+    INSN(cvtne2ph2hf8,     f2, map5, 18,    vl, fp16, vl),
+    INSN(cvtne2ph2hf8s,    f2, map5, 1b,    vl, fp16, vl),
     INSN(cvtnebf162ibs,    f2, map5, 69,    vl, bf16, vl),
     INSN(cvtnebf162iubs,   f2, map5, 6b,    vl, bf16, vl),
+    INSN(cvtneph2bf8,      f3, 0f38, 74,    vl, fp16, vl),
+    INSN(cvtneph2bf8s,     f3, map5, 74,    vl, fp16, vl),
+    INSN(cvtneph2hf8,      f3, map5, 18,    vl, fp16, vl),
+    INSN(cvtneph2hf8s,     f3, map5, 1b,    vl, fp16, vl),
     INSN(cvtph2ibs,          , map5, 69,    vl, fp16, vl),
     INSN(cvtph2iubs,         , map5, 6b,    vl, fp16, vl),
     INSN(cvtps2ibs,        66, map5, 69,    vl,    d, vl),
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1952,6 +1952,7 @@ static const struct evex {
     { { 0x64 }, 2, T, R, pfx_66, Wn, Ln }, /* vpblendm{d,q} */
     { { 0x65 }, 2, T, R, pfx_66, Wn, Ln }, /* vblendmp{s,d} */
     { { 0x66 }, 2, T, R, pfx_66, Wn, Ln }, /* vpblendm{b,w} */
+    { { 0x67 }, 2, T, R, pfx_66, W0, Ln }, /* vcvt2ps2phx */
     { { 0x68 }, 2, T, R, pfx_f2, Wn, Ln }, /* vp2intersect{d,q} */
     { { 0x70 }, 2, T, R, pfx_66, W1, Ln }, /* vpshldvw */
     { { 0x71 }, 2, T, R, pfx_66, Wn, Ln }, /* vpshldv{d,q} */
@@ -1959,6 +1960,9 @@ static const struct evex {
     { { 0x72 }, 2, T, R, pfx_f3, W1, Ln }, /* vcvtneps2bf16 */
     { { 0x72 }, 2, T, R, pfx_f2, W1, Ln }, /* vcvtne2ps2bf16 */
     { { 0x73 }, 2, T, R, pfx_66, Wn, Ln }, /* vpshrdv{d,q} */
+    { { 0x74 }, 2, T, R, pfx_no, W0, Ln }, /* vcvtbiasph2bf8 */
+    { { 0x74 }, 2, T, R, pfx_f3, W0, Ln }, /* vcvtneph2bf8 */
+    { { 0x74 }, 2, T, R, pfx_f2, W0, Ln }, /* vcvtne2ph2bf8 */
     { { 0x75 }, 2, T, R, pfx_66, Wn, Ln }, /* vpermi2{b,w} */
     { { 0x76 }, 2, T, R, pfx_66, Wn, Ln }, /* vpermi2{d,q} */
     { { 0x77 }, 2, T, R, pfx_66, Wn, Ln }, /* vpermi2p{s,d} */
@@ -2122,8 +2126,15 @@ static const struct evex {
 }, evex_map5[] = {
     { { 0x10 }, 2, T, R, pfx_f3, W0, LIG }, /* vmovsh */
     { { 0x11 }, 2, T, W, pfx_f3, W0, LIG }, /* vmovsh */
+    { { 0x18 }, 2, T, R, pfx_no, W0, Ln }, /* vcvtbiasph2hf8 */
+    { { 0x18 }, 2, T, R, pfx_f3, W0, Ln }, /* vcvtneph2hf8 */
+    { { 0x18 }, 2, T, R, pfx_f2, W0, Ln }, /* vcvtne2ph2hf8 */
+    { { 0x1b }, 2, T, R, pfx_no, W0, Ln }, /* vcvtbiasph2hf8s */
+    { { 0x1b }, 2, T, R, pfx_f3, W0, Ln }, /* vcvtneph2hf8s */
+    { { 0x1b }, 2, T, R, pfx_f2, W0, Ln }, /* vcvtne2ph2hf8s */
     { { 0x1d }, 2, T, R, pfx_66, W0, Ln }, /* vcvtps2phx */
     { { 0x1d }, 2, T, R, pfx_no, W0, LIG }, /* vcvtss2sh */
+    { { 0x1e }, 2, T, R, pfx_f2, W0, Ln }, /* cvthf82ph */
     { { 0x2a }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvtsi2sh */
     { { 0x2c }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvttsh2si */
     { { 0x2d }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvtsh2si */
@@ -2184,6 +2195,9 @@ static const struct evex {
     { { 0x6d }, 2, T, R, pfx_f2, Wn, LIG }, /* vcvttsd2sis */
     { { 0x6e }, 2, T, R, pfx_66, WIG, L0 }, /* vmovw */
     { { 0x6e }, 2, T, R, pfx_f3, W0, L0 }, /* vmovw */
+    { { 0x74 }, 2, T, R, pfx_no, W0, Ln }, /* vcvtbiasph2bf8s */
+    { { 0x74 }, 2, T, R, pfx_f3, W0, Ln }, /* vcvtneph2bf8s */
+    { { 0x74 }, 2, T, R, pfx_f2, W0, Ln }, /* vcvtne2ph2bf8s */
     { { 0x78 }, 2, T, R, pfx_no, W0, Ln }, /* vcvttph2udq */
     { { 0x78 }, 2, T, R, pfx_66, W0, Ln }, /* vcvttph2uqq */
     { { 0x78 }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvttsh2usi */
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -378,8 +378,10 @@ static const struct ext0f38_table {
     [0x62] = { .simd_size = simd_packed_int, .two_op = 1, .d8s = d8s_bw },
     [0x63] = { .simd_size = simd_packed_int, .to_mem = 1, .two_op = 1, .d8s = d8s_bw },
     [0x64 ... 0x66] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0x67] = { .simd_size = simd_other, .d8s = d8s_vl },
     [0x68] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
     [0x70 ... 0x73] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0x74] = { .simd_size = simd_other, .d8s = d8s_vl },
     [0x75 ... 0x76] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
     [0x77] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
     [0x78] = { .simd_size = simd_other, .two_op = 1 },
@@ -1445,6 +1447,15 @@ int x86emul_decode(struct x86_emulate_st
             s->simd_size = ext0f38_table[b].simd_size;
             if ( evex_encoded() )
             {
+                switch ( b )
+                {
+                case 0x74: /* cvt{bias,ne,ne2}ph2bf8 */
+                    s->fp16 = true;
+                    if ( s->evex.pfx != vex_f2 )
+                        d |= TwoOp;
+                    break;
+                }
+
                 /*
                  * VPMOVUS* are identical to VPMOVS* Disp8-scaling-wise, but
                  * their attributes don't match those of the vex_66 encoded
@@ -1592,6 +1603,23 @@ int x86emul_decode(struct x86_emulate_st
 
             switch ( b )
             {
+            case 0x18: /* vcvt{bias,ne,ne2}ph2hf8 */
+            case 0x1b: /* vcvt{bias,ne,ne2}ph2hf8s */
+            case 0x74: /* vcvt{bias,ne,ne2}ph2bf8s */
+                s->fp16 = true;
+                d = DstReg | SrcMem;
+                if ( s->evex.pfx != vex_f2 )
+                    d |= TwoOp;
+                s->simd_size = simd_other;
+                disp8scale = s->evex.brs ? 1 : 4 + s->evex.lr;
+                break;
+
+            case 0x1e: /* vcvthf82ph */
+                d = DstReg | SrcMem | TwoOp;
+                s->simd_size = simd_other;
+                disp8scale = 3 + s->evex.lr;
+                break;
+
             case 0x78:
             case 0x79:
                 /* vcvt{,t}ph2u{d,q}q need special casing */
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6269,6 +6269,29 @@ x86_emulate(
         }
         goto simd_zmm;
 
+    case X86EMUL_OPC_EVEX   (0x0f38, 0x74): /* vcvtbiasph2bf8 [xyz]mm,[xyz]mm/mem{k} */
+    case X86EMUL_OPC_EVEX_F3(0x0f38, 0x74): /* vcvtneph2bf8 [xyz]mm,[xyz]mm/mem{k} */
+    case X86EMUL_OPC_EVEX_F2(0x0f38, 0x74): /* vcvtne2ph2bf8 [xyz]mm,[xyz]mm,[xyz]mm/mem{k} */
+    case X86EMUL_OPC_EVEX   (     5, 0x18): /* vcvtbiasph2hf8 [xyz]mm,[xyz]mm/mem{k} */
+    case X86EMUL_OPC_EVEX_F3(     5, 0x18): /* vcvtneph2hf8 [xyz]mm,[xyz]mm/mem{k} */
+    case X86EMUL_OPC_EVEX_F2(     5, 0x18): /* vcvtne2ph2hf8 [xyz]mm,[xyz]mm,[xyz]mm/mem{k} */
+    case X86EMUL_OPC_EVEX   (     5, 0x1b): /* vcvtbiasph2hf8s [xyz]mm,[xyz]mm/mem{k} */
+    case X86EMUL_OPC_EVEX_F3(     5, 0x1b): /* vcvtneph2hf8s [xyz]mm,[xyz]mm/mem{k} */
+    case X86EMUL_OPC_EVEX_F2(     5, 0x1b): /* vcvtne2ph2hf8s [xyz]mm,[xyz]mm,[xyz]mm/mem{k} */
+    case X86EMUL_OPC_EVEX   (     5, 0x74): /* vcvtbiasph2bf8s [xyz]mm,[xyz]mm/mem{k} */
+    case X86EMUL_OPC_EVEX_F3(     5, 0x74): /* vcvtneph2bf8s [xyz]mm,[xyz]mm/mem{k} */
+    case X86EMUL_OPC_EVEX_F2(     5, 0x74): /* vcvtne2ph2bf8s [xyz]mm,[xyz]mm,[xyz]mm/mem{k} */
+        generate_exception_if(ea.type != OP_MEM && evex.brs, X86_EXC_UD);
+        /* fall through */
+    case X86EMUL_OPC_EVEX_66(0x0f38, 0x67): /* vcvt2ps2phx [xyz]mm,[xyz]mm,[xyz]mm/mem{k} */
+        generate_exception_if(evex.w, X86_EXC_UD);
+        vcpu_must_have(avx10, 2);
+        if ( ea.type != OP_REG || !evex.brs )
+            avx512_vlen_check(false);
+        op_bytes = 16 << evex.lr;
+        fault_suppression = false;
+        goto simd_zmm;
+
     case X86EMUL_OPC_EVEX_F2(0x0f38, 0x68): /* vp2intersect{d,q} [xyz]mm/mem,[xyz]mm,k+1 */
         host_and_vcpu_must_have(avx512_vp2intersect);
         generate_exception_if(evex.opmsk || !evex.r || !evex.R, X86_EXC_UD);
@@ -7965,6 +7988,14 @@ x86_emulate(
         generate_exception_if(evex.w, X86_EXC_UD);
         goto avx512f_all_fp;
 
+    case X86EMUL_OPC_EVEX_F2(5, 0x1e): /* vcvthf82ph [xyz]mm,[xyz]mm/mem{k} */
+        generate_exception_if(evex.w || evex.brs, X86_EXC_UD);
+        vcpu_must_have(avx10, 2);
+        if ( ea.type != OP_REG || !evex.brs )
+            avx512_vlen_check(false);
+        op_bytes = 8 << evex.lr;
+        goto simd_zmm;
+
     case X86EMUL_OPC_EVEX_66(5, 0x42): /* vgetexppbf16 [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(5, 0x51): /* vsqrtnepbf16 [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(5, 0x58): /* vaddnepbf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */


