Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8A6952B1E
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2024 11:18:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777934.1187995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seWc2-0007QV-3X; Thu, 15 Aug 2024 09:17:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777934.1187995; Thu, 15 Aug 2024 09:17:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seWc2-0007Os-0K; Thu, 15 Aug 2024 09:17:42 +0000
Received: by outflank-mailman (input) for mailman id 777934;
 Thu, 15 Aug 2024 09:17:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/2Vq=PO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1seWc0-0007Om-Pj
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2024 09:17:40 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 380cf3f2-5ae7-11ef-a505-bb4a2ccca743;
 Thu, 15 Aug 2024 11:17:39 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52efd530a4eso1128605e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Aug 2024 02:17:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83838c6975sm71285866b.41.2024.08.15.02.17.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Aug 2024 02:17:38 -0700 (PDT)
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
X-Inumbo-ID: 380cf3f2-5ae7-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723713459; x=1724318259; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5bra8rjb95+ueMB0cvBzqmH+3dQ6+Ym0f0ObvjUpgnI=;
        b=G/HP+6+ud2AyByC4JLIGfZSS0gtCCZYdedcIK2ZB7mmnpdWXB3ZosJBqIJ42D/1OaH
         aYEeqONEVPoTdxmOpuHlZDmtoP1JyTV3GbrVAvONuhaS8zZ0jaHkRqpWQgdJ0K77aeKK
         QsYeRMA3GZk6p0x/bfxE6+HrtsSvWGPedWeF/iYMjxiRwGCwoszyuLzTSN0JOytiEfxk
         hwtN6bfbDZ1jSyRiEzUimJcyLcIzGRUZOgmiAofXKbu4XJFKDZRU435caM/NdOHS2p6A
         FjIbV+ZawGT2+hfMgAvLIf6TEsg6c/5RnGbJFpaELe64pZN/ldVjMRWpTLHQM5w/cs3b
         usqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723713459; x=1724318259;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5bra8rjb95+ueMB0cvBzqmH+3dQ6+Ym0f0ObvjUpgnI=;
        b=biBzYdcH20oH2Do6DU+mANOnAS2712/MaIKGQNmp0ccKzrHzSNhjxvR/a913h6C6HF
         1Qkv1Xc+8pSPuToT1JOvvoCVwgRW74qR5rgglOsJsP11lL5tzvv3CtUjD/thC2amdyeM
         54udNBMvd24M5EBB9KmB0Lpr48wzpLFxj05b7LXprcrwjn59Pm2pqp2+iTWGEtQ1yHkv
         4nGQI/XBqwA2iNnQWxSrCE+Io6jBGk6on8WhdTtgVER2urfR14eqSRS9dqqaCKwngpUW
         KyBxtIls8BblDAqd5L8B8LDRwwV5U5P1FSov7HzkCAHlwfB2DKSHEBYPzvcJ64qhkrWO
         Edng==
X-Gm-Message-State: AOJu0YyuYssyWPYsJzyUGv8I/zJug3reFfycWyCT97Z97jdZ2EieHpuw
	Nr3Tw2KXTD7ZKNdGu9a5b9+1y/E4P7HSFOFJ4dXEbDOeSzv6Pl+XWdG1t1HoX5x+SuU/OdthsSo
	=
X-Google-Smtp-Source: AGHT+IG0xLI4jWW0FLxAxGNfMsT2guS42sQzS7hUEKI1EwOSAuHr1QcklvJev1sgtuADaMrE/EL3ZA==
X-Received: by 2002:ac2:4e01:0:b0:52f:44b:7d42 with SMTP id 2adb3069b0e04-532edbe9a2dmr3673175e87.58.1723713458888;
        Thu, 15 Aug 2024 02:17:38 -0700 (PDT)
Message-ID: <7702a8a6-bd83-4390-bd02-cae77c763560@suse.com>
Date: Thu, 15 Aug 2024 11:17:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: correct #UD check for AVX512-FP16 complex
 multiplications
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

avx512_vlen_check()'s argument was inverted, while the surrounding
conditional wrongly forced the EVEX.L'L check for the scalar forms when
embedded rounding was in effect.

Fixes: d14c52cba0f5 ("x86emul: handle AVX512-FP16 complex multiplication insns")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -7852,8 +7852,8 @@ x86_emulate(
         generate_exception_if(modrm_reg == src1 ||
                               (ea.type != OP_MEM && modrm_reg == modrm_rm),
                               X86_EXC_UD);
-        if ( ea.type != OP_REG || (b & 1) || !evex.brs )
-            avx512_vlen_check(!(b & 1));
+        if ( ea.type != OP_REG || !evex.brs )
+            avx512_vlen_check(b & 1);
         goto simd_zmm;
     }
 

