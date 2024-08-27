Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E63C96087B
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 13:24:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783857.1193149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siuJ3-0007Bz-Q9; Tue, 27 Aug 2024 11:24:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783857.1193149; Tue, 27 Aug 2024 11:24:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siuJ3-0007AF-Lj; Tue, 27 Aug 2024 11:24:13 +0000
Received: by outflank-mailman (input) for mailman id 783857;
 Tue, 27 Aug 2024 11:24:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tHc6=P2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1siuJ2-00079W-TM
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 11:24:12 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1d5e162-6466-11ef-a0b0-8be0dac302b0;
 Tue, 27 Aug 2024 13:24:11 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a868d7f92feso680553566b.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 04:24:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e5486a13sm98514266b.35.2024.08.27.04.24.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 04:24:10 -0700 (PDT)
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
X-Inumbo-ID: e1d5e162-6466-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724757850; x=1725362650; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bJeGLICq/VGrPxHSRrfG3WmFK4/PlFbrk7T2o45JTWM=;
        b=KWY6iSLRT3vku7gXrr2auEdmNaZtlYjmDLTP6JaKiOztIqRZC2T/NQqNzw2tcd6Mgf
         9T4tB5HxxfYdQYz9GSiOvcsh5lsX91UdkWWHf5vJ9M4yFvUYO7eJqcskNlQQ2oHofgcs
         fB6GOSMQQZPcYyFDiTdYK/TwnuAguMZFdfzgcJ6XmrV/ZLxoUvRAyEjFkXO0n5vcF9X2
         jD3szeb3KpqNp5DI3ENA0ly2FE8s6tZrJJLQprp7Nwd11cgXQakaIwODjawAlRtlkD0G
         ZlMP9k3mokesL9o0w9LziUTS8i3FOHYUQUCY55EE2vnRDe1V+rPZUN8P5CE/b0yX1Hkg
         0XPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724757850; x=1725362650;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bJeGLICq/VGrPxHSRrfG3WmFK4/PlFbrk7T2o45JTWM=;
        b=CI7jpgILB9exBwaXTqHjqSAwBxmAQ2wpTmdlDA1rIjFzZEIuD4QuhheuZmCOAXk1JS
         UJ1FVRApOqQZCCsWiTvgqzb12hXwkkIF0VemOyL88PoRBrKyOpc3EeJ3MIEJvuYOZo8B
         f/GOUE7nXGrhFfe/NK5AkuwjkSJB0cdZmbMApB0CQgUWu5evcQc4hDwhWl1vgepdA2J3
         YQPAZQl9BMrdoEwDWTn/uYQZCdZtQ/CGv365Lwd4RpABnJri3VnWW4soeyixdfBR4c8l
         +EaYgYPtW6iLLc6K/mE+UjTbo4EwbGa4dp2ZTRi6/P9XKWyXjkyKASvUk8fzFztoW66D
         GIaQ==
X-Gm-Message-State: AOJu0YxYImWtK5Xbuy9BN0073Y/knVwl6iFBlIkl+VFiWCj/aoGqvu1g
	TbTXfs6uAO7ftv5zefW1ti6LdebGkKhTolCqTGiTlST+oDrKzuhxJjtlOIZyz5AgN38w8wtYEsQ
	=
X-Google-Smtp-Source: AGHT+IHlb0dnYZby6JoK7a6ZKHxrx/rB4F+6t20l+LrJ7dSd4mArrZA6bGqUpU3AF1jfm4oNf7UVFQ==
X-Received: by 2002:a17:906:c10c:b0:a86:ac05:2112 with SMTP id a640c23a62f3a-a86ac0523bbmr958251566b.51.1724757850446;
        Tue, 27 Aug 2024 04:24:10 -0700 (PDT)
Message-ID: <9043d8bd-ad98-4de1-ac52-70f8e4daf14a@suse.com>
Date: Tue, 27 Aug 2024 13:24:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: drop further Xeon Phi decode leftovers
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

Special casing in x86emul_decode() can be dropped, while overrides done
in decode_0f38() can move into ext0f38_table[]. That table's S/G
prefetch entries aren't needed anymore either.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -427,13 +427,11 @@ static const struct ext0f38_table {
     [0xbe] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
     [0xbf] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
     [0xc4] = { .simd_size = simd_packed_int, .two_op = 1, .d8s = d8s_vl },
-    [0xc6 ... 0xc7] = { .simd_size = simd_other, .vsib = 1, .d8s = d8s_dq },
     [0xc8] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
     [0xc9] = { .simd_size = simd_other },
     [0xca] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
-    [0xcb] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
-    [0xcc] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
-    [0xcd] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
+    [0xcb] = { .simd_size = simd_other, .d8s = d8s_vl },
+    [0xcc ... 0xcd] = { .simd_size = simd_other, .two_op = 1, .d8s = d8s_vl },
     [0xcf] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
     [0xd2] = { .simd_size = simd_other },
     [0xd3] = { .simd_size = simd_other },
@@ -918,14 +916,6 @@ decode_0f38(struct x86_emulate_state *s,
     case X86EMUL_OPC_EVEX_66(0, 0x7c): /* vpbroadcast{d,q} */
         break;
 
-    case X86EMUL_OPC_VEX_F2(0, 0xcc): /* vsha512msg1 */
-    case X86EMUL_OPC_VEX_F2(0, 0xcd): /* vsha512msg2 */
-        s->desc |= TwoOp;
-        /* fallthrough */
-    case X86EMUL_OPC_VEX_F2(0, 0xcb): /* vsha512rnds2 */
-        s->simd_size = simd_other;
-        break;
-
     case 0xf0: /* movbe / crc32 */
         s->desc |= s->vex.pfx == vex_f2 ? ByteOp : Mov;
         if ( s->vex.pfx >= vex_f3 )
@@ -1421,20 +1411,6 @@ int x86emul_decode(struct x86_emulate_st
                                                    s);
                     s->simd_size = simd_other;
                 }
-
-                switch ( b )
-                {
-                /* vp4dpwssd{,s} need special casing */
-                case 0x52: case 0x53:
-                /* v4f{,n}madd{p,s}s need special casing */
-                case 0x9a: case 0x9b: case 0xaa: case 0xab:
-                    if ( s->evex.pfx == vex_f2 )
-                    {
-                        disp8scale = 4;
-                        s->simd_size = simd_128;
-                    }
-                    break;
-                }
             }
             break;
 

