Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D2D9ECA29
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 11:18:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854335.1267569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLJnV-0007GO-Vb; Wed, 11 Dec 2024 10:18:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854335.1267569; Wed, 11 Dec 2024 10:18:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLJnV-0007EX-SC; Wed, 11 Dec 2024 10:18:25 +0000
Received: by outflank-mailman (input) for mailman id 854335;
 Wed, 11 Dec 2024 10:18:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HaM=TE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLJnU-00076S-Im
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 10:18:24 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d680ad7-b7a9-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 11:18:18 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-434a766b475so62665745e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 02:18:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2161b77ea74sm84612825ad.229.2024.12.11.02.18.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 02:18:21 -0800 (PST)
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
X-Inumbo-ID: 3d680ad7-b7a9-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733912302; x=1734517102; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uETdII7euK3qqaPzdHHMKooaoTcHvrw5Jiuv6BUwztM=;
        b=JummlVuX2ups2MOVRktAtBXnSGZjGhPVCoP00rHEoJel94nd+cdT/qo99Q0Coqvb6y
         z66xtcKEo9IbE9ZLmU3GMP1PtxEHIlW7JWp8B6rRhIDMLj7wVaQHeDQ5khgYmDDRNoMv
         DI9kEbB9g8mi0cSzDQpYzNyLiDWmE/VkD/7aPy5bdaOwUypvf0VVS2Lyu+sSXM0b6pJH
         oy8w/vEVeQuw0DXU28fU8Noh1AcwCa3t7feTf3D8dx9pBcTU/YJRcBwFHX2uQdk+ACBZ
         62KTS65GWquEbwsEAF9sOvF3ltq8IQkxrRUMlXLenK+qSUVspN9MPMhK3oAdyXRs18Dw
         nHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733912302; x=1734517102;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uETdII7euK3qqaPzdHHMKooaoTcHvrw5Jiuv6BUwztM=;
        b=cf3axYNXSV4OW+CMR/yxhnOUQ8ZcDwStWyAS0oQrlzZY+49wlp0axeqBG/BxSgwThV
         cXi1VCN4qN1WEdBP2yilQE8RP3TuDKRzPsEzPOmdTu7qLOvey6Lv4v+PrZxoNKcMiOAX
         T29ANmDUf70m35tD6yfIPuhULr3lEkAknS4pwdZ9k4iacBvMf44Hr/We1a+Q/3Ut7YJy
         WGXFvI+FK8Xm9fOez1WkKBUstuNXlnJ/CuY+5RAIElBbwbcNDJXjsKpNJzChrGGxSI5F
         sTY38xSTaiOX7TuUH4OfVkAEQG216K5fCj0Rbx8/bZ0tjimN3+NU30GNV2eP1XWN/hRH
         wKQA==
X-Gm-Message-State: AOJu0Ywr8qjGHoRhz3KafhtjAllmadvPTwSqJE+VThutaNt53UWlYBqg
	XtK3NnOxqyW87i4bFl7/Od/POLoGdX1tY5MuouzoAsFWN5CchdMUvWzWEuOoG5jgQcSD8M+fruU
	=
X-Gm-Gg: ASbGncsHk+Zu08kGNmEOq3BF5fUpGw6V7qc3T7nTJlbT3ZUtaF8004pktYdKW8UcLuG
	z6eA53B4pwtGysdrRT0zy7Hj1XCZN4rqfkY2NkMY9rsJmDhL9PE7aQ0KIgM/LeTXFslRkjWOpx/
	Dp1sOZsa5N89jvJ/NoxCSzNODFyQdaeKbCmjISnV5sfOHKXfA9liQ58mzfRNuokRrFt8hjL65ZG
	AF8Z6wwXWM/zK9DuNeWsbBSmvHKX+xbnacN+yacCIPKBkTO76l8eEiLe6hk8eI8f3ofhXPpVG8g
	8wBFKe1USGzuJ47AER8KrdW0ik9DxBELy0e6ur4=
X-Google-Smtp-Source: AGHT+IHaFe19BiEV4+Ua81mrbHn9BwgnIH9jKCMyNs9d+fOf2PyjAFL2ZHLg0EyFDdQU4jGyo3qFNw==
X-Received: by 2002:a5d:47a1:0:b0:386:3a8e:64c1 with SMTP id ffacd0b85a97d-3864ce90f89mr1685137f8f.19.1733912302270;
        Wed, 11 Dec 2024 02:18:22 -0800 (PST)
Message-ID: <4bed4638-98f6-4a1d-b41f-f0c25d9af526@suse.com>
Date: Wed, 11 Dec 2024 11:18:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 09/16] x86emul: support AVX10.2 partial copy insns
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

Extend existing VMOV{Q,W} logic accordingly.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
SDE: ???
---
v3: New.

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -722,6 +722,13 @@ static const struct test avx10_2_all[] =
     INSN(ucomxss,          f2,   0f, 2e,    el,    d, el),
 };
 
+static const struct test avx10_2_128[] = {
+    INSN(movd, f3,   0f, 7e, el,    d, el),
+    INSN(movd, 66,   0f, d6, el,    d, el),
+    INSN(movw, f3, map5, 6e, el, fp16, el),
+    INSN(movw, f3, map5, 7e, el, fp16, el),
+};
+
 static const unsigned char vl_all[] = { VL_512, VL_128, VL_256 };
 static const unsigned char vl_128[] = { VL_128 };
 static const unsigned char vl_no128[] = { VL_512, VL_256 };
@@ -1143,6 +1150,7 @@ void evex_disp8_test(void *instr, struct
     }
 
     run(cpu_has_avx10_2, avx10_2, all);
+    run(cpu_has_avx10_2, avx10_2, 128);
 
 #undef run
 }
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1782,7 +1782,7 @@ static const struct evex {
     { { 0x7b }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvtusi2ss */
     { { 0x7b }, 2, T, R, pfx_f2, Wn, LIG }, /* vcvtusi2sd */
     { { 0x7e }, 2, T, W, pfx_66, Wn, L0 }, /* vmov{d,q} */
-    { { 0x7e }, 2, T, R, pfx_f3, W1, L0 }, /* vmovq */
+    { { 0x7e }, 2, T, R, pfx_f3, Wn, L0 }, /* vmov{d,q} */
     { { 0x7f }, 2, T, W, pfx_66, Wn, Ln }, /* vmovdqa{32,64} */
     { { 0x7f }, 2, T, W, pfx_f3, Wn, Ln }, /* vmovdqu{32,64} */
     { { 0x7f }, 2, T, W, pfx_f2, Wn, Ln }, /* vmovdqu{8,16} */
@@ -1799,7 +1799,7 @@ static const struct evex {
     { { 0xd3 }, 2, T, R, pfx_66, W1, Ln }, /* vpsrlq */
     { { 0xd4 }, 2, T, R, pfx_66, W1, Ln }, /* vpaddq */
     { { 0xd5 }, 2, T, R, pfx_66, WIG, Ln }, /* vpmullw */
-    { { 0xd6 }, 2, T, W, pfx_66, W1, L0 }, /* vmovq */
+    { { 0xd6 }, 2, T, W, pfx_66, Wn, L0 }, /* vmov{d,q} */
     { { 0xd8 }, 2, T, R, pfx_66, WIG, Ln }, /* vpsubusb */
     { { 0xd9 }, 2, T, R, pfx_66, WIG, Ln }, /* vpsubusw */
     { { 0xda }, 2, T, R, pfx_66, WIG, Ln }, /* vpminub */
@@ -2131,6 +2131,7 @@ static const struct evex {
     { { 0x5f }, 2, T, R, pfx_no, W0, Ln }, /* vmaxph */
     { { 0x5f }, 2, T, R, pfx_f3, W0, LIG }, /* vmaxsh */
     { { 0x6e }, 2, T, R, pfx_66, WIG, L0 }, /* vmovw */
+    { { 0x6e }, 2, T, R, pfx_f3, W0, L0 }, /* vmovw */
     { { 0x78 }, 2, T, R, pfx_no, W0, Ln }, /* vcvttph2udq */
     { { 0x78 }, 2, T, R, pfx_66, W0, Ln }, /* vcvttph2uqq */
     { { 0x78 }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvttsh2usi */
@@ -2149,6 +2150,7 @@ static const struct evex {
     { { 0x7d }, 2, T, R, pfx_f3, W0, Ln }, /* vcvtw2ph */
     { { 0x7d }, 2, T, R, pfx_f2, W0, Ln }, /* vcvtuwph */
     { { 0x7e }, 2, T, W, pfx_66, WIG, L0 }, /* vmovw */
+    { { 0x7e }, 2, T, W, pfx_f3, W0, L0 }, /* vmovw */
 }, evex_map6[] = {
     { { 0x13 }, 2, T, R, pfx_66, W0, Ln }, /* vcvtph2psx */
     { { 0x13 }, 2, T, R, pfx_no, W0, LIG }, /* vcvtsh2ss */
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -293,7 +293,7 @@ static const struct twobyte_table {
     [0xd0] = { DstImplicit|SrcMem|ModRM, simd_other },
     [0xd1 ... 0xd3] = { DstImplicit|SrcMem|ModRM, simd_128, 4 },
     [0xd4 ... 0xd5] = { DstImplicit|SrcMem|ModRM, simd_packed_int, d8s_vl },
-    [0xd6] = { DstMem|SrcImplicit|ModRM|Mov, simd_other, 3 },
+    [0xd6] = { DstMem|SrcImplicit|ModRM|Mov, simd_other, d8s_dq },
     [0xd7] = { DstReg|SrcImplicit|ModRM|Mov },
     [0xd8 ... 0xdf] = { DstImplicit|SrcMem|ModRM, simd_packed_int, d8s_vl },
     [0xe0] = { DstImplicit|SrcMem|ModRM, simd_packed_int, d8s_vl },
@@ -802,7 +802,7 @@ decode_twobyte(struct x86_emulate_state
         if ( s->vex.pfx == vex_f3 ) /* movq xmm/m64,xmm */
         {
     case X86EMUL_OPC_VEX_F3(0, 0x7e): /* vmovq xmm/m64,xmm */
-    case X86EMUL_OPC_EVEX_F3(0, 0x7e): /* vmovq xmm/m64,xmm */
+    case X86EMUL_OPC_EVEX_F3(0, 0x7e): /* vmov{d,q} xmm/mem,xmm */
             s->desc = DstImplicit | SrcMem | TwoOp;
             s->simd_size = simd_other;
             /* Avoid the s->desc clobbering of TwoOp below. */
@@ -1422,7 +1422,7 @@ int x86emul_decode(struct x86_emulate_st
                 break;
 
             case 0x7e: /* vmovq xmm/m64,xmm needs special casing */
-                if ( disp8scale == 2 && s->evex.pfx == vex_f3 )
+                if ( disp8scale == 2 && s->evex.pfx == vex_f3 && s->evex.w )
                     disp8scale = 3;
                 break;
 
@@ -1531,13 +1531,13 @@ int x86emul_decode(struct x86_emulate_st
                     s->fp16 = true;
                 break;
 
-            case 0x6e: /* vmovw r/m16, xmm */
+            case 0x6e: /* vmovw r/x/m16, xmm */
                 d = (d & ~SrcMask) | SrcMem16;
                 /* fall through */
-            case 0x7e: /* vmovw xmm, r/m16 */
+            case 0x7e: /* vmovw xmm, r/x/m16 */
+                s->fp16 = true;
                 if ( s->evex.pfx == vex_66 )
-                    s->fp16 = true;
-                s->simd_size = simd_none;
+                    s->simd_size = simd_none;
                 break;
 
             case 0x78: case 0x79: /* vcvt{,t}ph2u{d,q}q, vcvt{,t}sh2usi */
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -4918,13 +4918,17 @@ x86_emulate(
         op_bytes = 8;
         goto simd_0f_int;
 
-    case X86EMUL_OPC_EVEX_F3(0x0f, 0x7e): /* vmovq xmm/m64,xmm */
-    case X86EMUL_OPC_EVEX_66(0x0f, 0xd6): /* vmovq xmm,xmm/m64 */
-        generate_exception_if(evex.lr || !evex.w || evex.opmsk || evex.brs,
-                              X86_EXC_UD);
-        visa_check(f);
+    case X86EMUL_OPC_EVEX_F3(0x0f, 0x7e): /* vmov{d,q} xmm/mem,xmm */
+    case X86EMUL_OPC_EVEX_66(0x0f, 0xd6): /* vmov{d,q} xmm,xmm/mem */
+    case X86EMUL_OPC_EVEX_F3(5, 0x6e): /* vmovw xmm/m16,xmm */
+    case X86EMUL_OPC_EVEX_F3(5, 0x7e): /* vmovw xmm,xmm/m16 */
+        generate_exception_if(evex.lr || evex.opmsk || evex.brs, X86_EXC_UD);
+        if ( evex.w )
+            visa_check(f);
+        else
+            vcpu_must_have(avx10, 2);
         d |= TwoOp;
-        op_bytes = 8;
+        op_bytes = 2 << (!state->fp16 + evex.w);
         goto simd_zmm;
 
 #endif /* !X86EMUL_NO_SIMD */


