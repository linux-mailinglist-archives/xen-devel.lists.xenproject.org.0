Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9EC959719
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2024 11:28:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780961.1190535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sghcP-0004Ts-Gu; Wed, 21 Aug 2024 09:27:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780961.1190535; Wed, 21 Aug 2024 09:27:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sghcP-0004Rm-ED; Wed, 21 Aug 2024 09:27:05 +0000
Received: by outflank-mailman (input) for mailman id 780961;
 Wed, 21 Aug 2024 09:27:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YIGS=PU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sghcN-0004Rc-Cd
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2024 09:27:03 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 842268d5-5f9f-11ef-a508-bb4a2ccca743;
 Wed, 21 Aug 2024 11:27:02 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a8682bb5e79so2383466b.2
 for <xen-devel@lists.xenproject.org>; Wed, 21 Aug 2024 02:26:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8670256538sm74934366b.44.2024.08.21.02.26.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Aug 2024 02:26:58 -0700 (PDT)
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
X-Inumbo-ID: 842268d5-5f9f-11ef-a508-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724232419; x=1724837219; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oEHCrGZclODO9MC+FlfThVZNIvh9p/VZbrL1qNJE3Tw=;
        b=fQeRWWhxPLCa0GKUfG7deDTdRf+vlTLQN8R0XITTRiVaGYOIUBPT3AQN2y0PnTlNvr
         oCplG8I93h4geOyKcSZQ0/RfR5M7IKUDwi7+adzD07Q4LQIL8LhocmDzpN5ROTUsqBd3
         DlEbxpN/9BvhQoKNmzf86JEYuIqua2Ky9RB1j3kv9Dxe5SEMbhKkyJmz+xrLSOgjXIg+
         LVBOpO8ucXQM7lMElosZMir1/9eipGzVsZVcsXWNAP23A7RJeiYAS1h6oNeaCLHrgiFF
         9T+DMhWuGFZssU67eMTSUPyCGgBWaHsh/rjiJXu9NDQKrst39pxXRUqF9ikmr9R6pQ3D
         njhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724232419; x=1724837219;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oEHCrGZclODO9MC+FlfThVZNIvh9p/VZbrL1qNJE3Tw=;
        b=kARsNLGZ/Q8cKHwld26hf+Ua8D+G8rKg4Uwtn4SiZ58G7CMPmSkhfkcSeCVjjUlORJ
         NamSP3LnzdLRfpAA0PWw2pxhtQacAJyo02f3uOe2Z9auwrOPbQ3R8vzYplqdd8ZUBcUR
         DIORJDGmbXb6jaFiSESN5utcSLtC1CW8zbeHGVayV5QOfY/wZABOmAIpGvayKlVuMbc8
         9p2iJ5ntGnzcZT61nlp+EIEKMWcKTtOpBg4RH0egJ9QVXaLDwbTcNBY2UQCPfWFa2AIU
         PnHzTdxsTKFkVa4VJwHvLaIWI3FBdfUq+YNKypJEioOi5hUP3SnfUDmWCRzeFxLj/8Bb
         BUTA==
X-Gm-Message-State: AOJu0YzdpTJlStJ5HEhG66CXJGZzM6/WVLNMCoSyPoWpqML5b45Zpdnl
	fIiiu5YyYViwiCTIAEesDfObKJRRYMpNqbfRQ+hWYhLmyUu70Lrvgt6l3vtikM6a97Gr3lE70Mg
	=
X-Google-Smtp-Source: AGHT+IFsR3fFx1MpwrXb7A7Nlk/nMR872tSlebt+MJFlag+LGwJpVz4gD3O0kGSLgq/77QBZifGmvA==
X-Received: by 2002:a17:907:3f95:b0:a77:e55a:9e87 with SMTP id a640c23a62f3a-a866f8ed42amr99884566b.48.1724232418780;
        Wed, 21 Aug 2024 02:26:58 -0700 (PDT)
Message-ID: <49bcdcf1-4d9c-4126-83a8-9a7d3a7bc49f@suse.com>
Date: Wed, 21 Aug 2024 11:26:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: always set operand size for AVX-VNNI-INT8 insns
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

Unlike for AVX-VNNI-INT16 I missed to notice that op_bytes may still be
zero when reaching the respective case block: With the ext0f38_table[]
entries having simd_packed_int, the defaulting at the bottom of
x86emul_decode() won't set the field to non-zero for F3- or F2-prefixed
insns.

Fixes: 842acaa743a5 ("x86emul: support AVX-VNNI-INT8")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6075,6 +6075,7 @@ x86_emulate(
     case X86EMUL_OPC_VEX_F2(0x0f38, 0x51): /* vpdpbssds [xy]mm/mem,[xy]mm,[xy]mm */
         host_and_vcpu_must_have(avx_vnni_int8);
         generate_exception_if(vex.w, X86_EXC_UD);
+        op_bytes = 16 << vex.l;
         goto simd_0f_ymm;
 
     case X86EMUL_OPC_VEX_66(0x0f38, 0x50): /* vpdpbusd [xy]mm/mem,[xy]mm,[xy]mm */

