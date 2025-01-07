Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFB6A042A0
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 15:33:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866385.1277709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVAdZ-00074R-NO; Tue, 07 Jan 2025 14:32:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866385.1277709; Tue, 07 Jan 2025 14:32:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVAdZ-00072e-Ki; Tue, 07 Jan 2025 14:32:53 +0000
Received: by outflank-mailman (input) for mailman id 866385;
 Tue, 07 Jan 2025 14:32:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVAdY-00072Y-Ie
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 14:32:52 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4591ee87-cd04-11ef-99a4-01e77a169b0f;
 Tue, 07 Jan 2025 15:32:50 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-436202dd730so111866715e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 06:32:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4366120086bsm602497295e9.12.2025.01.07.06.32.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 06:32:49 -0800 (PST)
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
X-Inumbo-ID: 4591ee87-cd04-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736260370; x=1736865170; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GT+lzfOAjENvEXRJX8o+xq6/VUxk96oSIK5ugLpkuXM=;
        b=GXz9W17niVHy6fcXPewWU/K3x76oaqf9rHxO8pwzE74cIr9Dd5yJUu9VLUHIz6/JrG
         WwZGMcDczOz3x/dlmwHwSEDcIS5v0M1KXilCIV6F5L+ZI0h+qsDYs4RYFPFsi48b5VkU
         0hm5NxvLv0EDx/b0z+T6DXleg7KSBVxGlaJGP4yrmcTNUTyADTpeICm99P9sMPg1vNqZ
         UMJ4AfGxRga/sciUhwoCKtg9GWneVqXehSrSfFITU60fIxZQrbk2PkA765tXgB439sPL
         PrLySt0gTK1INX3ftG5+p0Z/OR7niabUd9sRgJyGHUNmdOLTM3avmfk25D5QJRUZ5rmz
         nVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736260370; x=1736865170;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GT+lzfOAjENvEXRJX8o+xq6/VUxk96oSIK5ugLpkuXM=;
        b=LameFwfWrrjwvGCcTn8/xa92B+y4kRSvWzRMyGXQU2KRgoOu8pqX6CmE72Lqsej7FE
         4afoE07+8dNUmC5qDCuHPY6YB4awIOx51b9cfBJXsivFa8T8lTDUZFHAAP8nmCyfRxra
         Ap+cHyEVqvllO3p61iaOzLL6hIqym+nfy3EUevBHjCfvSbczvblPpV9x2tn8NaaSyTos
         T4LTuuBFWyYNm4V7e9LAe82iRQ51d6x48H2UWR2E0m05YfTqEOxgzhe1/CNijY77kU6S
         jMFNAq+2CgbVsJOydPv5xqG6l5lAvYT0W8wDcinvxbzgt6M+Ks88qBIeV0QMPGeOkKVL
         Tqjw==
X-Gm-Message-State: AOJu0Yy/dN4XfVDZ+A4mkU6COHQMiV2+LCKds7gqCk3fABk9eOkEAn/L
	zluLbeEDMkSe5MoVMUyIEXhfXVT4qZBQipnCWaa0wGrsrx9a5vtwMSZ1iQXvs8gy59mi6ZZvW94
	=
X-Gm-Gg: ASbGncuYAryaif77j7tc1Bd3zXz5R1qMqFLWvTSqKQ3rtbNCkPQDJMrDhJTD+rvweuc
	2iYGayfL6dtm5or7eBo8sMG9qL3pxuN3sWq2JlVxlVOVHOJ15q1P3hWYgmE/BkZ1QIXzD9gmj1Y
	Y8iVX3rz3Y8rGAQkZv6CylQPsiY6YilEZU0zAN5Xfs8wC1JyEhaoQ1xiefLsiDszrzOLi/Flw0r
	5yBAE3n6xkSmptGpIEZcQPl9wH7Sanhq25zVyS3fUNOhuq4JPTcRESi3PtANwxy9E3WxCAsXmik
	ZIigoyHsZwbF5/zz80dpeVCr9jY68fJksH3Yqc1Jog==
X-Google-Smtp-Source: AGHT+IEnFbK96+DBJ+avk9/L+HEcS6XEfPhIeOVcy7z/ev/0RKrv2mE3jMnHQoxj/awnF+LCnSiKbQ==
X-Received: by 2002:a05:600c:4710:b0:434:9e1d:7626 with SMTP id 5b1f17b1804b1-43668b5dff4mr463949495e9.25.1736260369748;
        Tue, 07 Jan 2025 06:32:49 -0800 (PST)
Message-ID: <238beefd-126a-4a2d-99de-dc5675c88ef6@suse.com>
Date: Tue, 7 Jan 2025 15:32:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: VCVT{,U}DQ2PD ignores embedded rounding
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

IOW we shouldn't raise #UD in that case. Be on the safe side though and
only encode fully legitimate forms into the stub to be executed.

Things weren't quite right for VCVT{,U}SI2SD either, in the attempt to
be on the safe side: Clearing EVEX.L'L isn't useful; it's EVEX.b which
primarily needs clearing. Also reflect the somewhat improved doc
situation in the comment there.

Fixes: ed806f373730 ("x86emul: support AVX512F legacy-equivalent packed int/FP conversion insns")
Fixes: baf4a376f550 ("x86emul: support AVX512F legacy-equivalent scalar int/FP conversion insns")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -3596,12 +3596,15 @@ x86_emulate(
         if ( !mode_64bit() )
             evex.w = 0;
         /*
-         * SDM version 067 claims that exception type E10NF implies #UD when
-         * EVEX.L'L is non-zero for 32-bit VCVT{,U}SI2SD. Experimentally this
-         * cannot be confirmed, but be on the safe side for the stub.
+         * While SDM version 085 has explicit wording towards embedded rounding
+         * being ignored, it's still not entirely unambiguous with the exception
+         * type referred to. Be on the safe side for the stub.
          */
         if ( !evex.w && evex.pfx == vex_f2 )
+        {
+            evex.brs = 0;
             evex.lr = 0;
+        }
         opc[1] = (modrm & 0x38) | 0xc0;
         insn_bytes = EVEX_PFX_BYTES + 2;
         opc[2] = 0xc3;
@@ -4819,7 +4822,16 @@ x86_emulate(
         else
         {
             host_and_vcpu_must_have(avx512f);
-            generate_exception_if(ea.type != OP_MEM && evex.brs, X86_EXC_UD);
+            /*
+             * While SDM version 085 has explicit wording towards embedded
+             * rounding being ignored, it's still not entirely unambiguous with
+             * the exception type referred to. Be on the safe side for the stub.
+             */
+            if ( ea.type != OP_MEM && evex.brs )
+            {
+                evex.brs = 0;
+                evex.lr = 2;
+            }
         }
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(false);

