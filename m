Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D721959EA9
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2024 15:30:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781140.1190697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sglPp-0003yL-S3; Wed, 21 Aug 2024 13:30:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781140.1190697; Wed, 21 Aug 2024 13:30:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sglPp-0003w9-PP; Wed, 21 Aug 2024 13:30:21 +0000
Received: by outflank-mailman (input) for mailman id 781140;
 Wed, 21 Aug 2024 13:30:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YIGS=PU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sglPn-0003w3-Rt
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2024 13:30:19 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8175c379-5fc1-11ef-8776-851b0ebba9a2;
 Wed, 21 Aug 2024 15:30:17 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5334a8a1b07so669212e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 21 Aug 2024 06:30:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8685bbf148sm10090766b.0.2024.08.21.06.30.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Aug 2024 06:30:16 -0700 (PDT)
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
X-Inumbo-ID: 8175c379-5fc1-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724247017; x=1724851817; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SQzdaAJqwsKkRCzMH6hE9eJ+kGq0/AQ6DRMTQETvXpA=;
        b=MP8eWd+zR9rtdye86xM0804DnBqbp0Qj3rgQyYCuIxy0g3umUec/bNCITJ8Yr7PC8N
         vEHNtDyKivo9e7d+ERdFNEPxhjx556J5OSYR+ecfD2dhfeO/ojs9nGgSYjEIif44VWAk
         38MRVWOm5KPdPPTGjCRW/KpcrDTKzwoULgw5X+QI1ipSFISw0GlxCK7FsnWXT44lynYP
         ByX/LBuye5qwb2IYlZQhWnDxzSeaw8imiF4fKP3sN5MWUi7pK8MCFIZBV9QbfQolplP8
         c/PN7dkfAsRPpvBk84DRcto2kXz2knXbixkr8s5WsLkd0C90aqFCtKckkaOz9axgiSyF
         m3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724247017; x=1724851817;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SQzdaAJqwsKkRCzMH6hE9eJ+kGq0/AQ6DRMTQETvXpA=;
        b=UhJ+h5fu0eSDb0edsD6tZUoaTq8JBcBF4QS1ymQAEM0Bhoj1UOkI0O2QHZNWpR6gnA
         beye7uYNarlWr9At4Fa5z7Xw5vnokcrX4THNwUVX1C5RV6NNqkgTBwXYDNxLtydC3UnD
         dOatZflOqj7QVqqw0rgdLG+inYWI9+ZoWZDoXg0B7Hrwcnkt5jCjTihWQ5OmIMuoLurq
         wAWKRqBVh0ufB8LTa8szSHVg+EEo4pxg8WKcjuDpiPX9njmsWO8nDjMPg9cqhBjC382r
         yrje8ZRFi53poejCVxIa0cLqhIXt0KDQS7gnYUc5XFeUeheszBHebdXwvEHDq+6rsL4X
         4DgA==
X-Gm-Message-State: AOJu0Yz2a0iEu3T1E7QxSWcJ0qonDRzoas1kseom4nDICff8Q4JDQGgq
	Juq7+38LDivQXBTMHow2d8nKurcfodrC176e5G38tvOEiOjqxEFZj0ASPA+l1s8s2CEfhrU2C5s
	=
X-Google-Smtp-Source: AGHT+IEnzLb3vXctaLKOsGjmkRnXN2egx4hfjYjEsZo093Gv7pITOlG7aAo/aTXsOA/6RX7vLaH3fg==
X-Received: by 2002:a05:6512:4020:b0:52e:f950:31f5 with SMTP id 2adb3069b0e04-5334855443bmr1398911e87.18.1724247016905;
        Wed, 21 Aug 2024 06:30:16 -0700 (PDT)
Message-ID: <bfc9722a-cb6d-45d0-9351-ddfcd0bbb2e0@suse.com>
Date: Wed, 21 Aug 2024 15:30:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: convert op_bytes/opc checks in SIMD emulation
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

Delivering #UD for an internal shortcoming of the emulator isn't quite
right. Similarly BUG() is bigger a hammer than needed.

Switch to using EXPECT() instead.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -8114,13 +8114,13 @@ x86_emulate(
     }
     else if ( state->simd_size != simd_none )
     {
-        generate_exception_if(!op_bytes, X86_EXC_UD);
         generate_exception_if((vex.opcx && (d & TwoOp) &&
                                (vex.reg != 0xf || (evex_encoded() && !evex.RX))),
                               X86_EXC_UD);
 
-        if ( !opc )
-            BUG();
+        EXPECT(op_bytes);
+        EXPECT(opc);
+
         if ( evex_encoded() )
         {
             opc[insn_bytes - EVEX_PFX_BYTES] = 0xc3;

