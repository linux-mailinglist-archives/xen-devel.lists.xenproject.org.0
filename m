Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF018A18230
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 17:44:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875596.1286038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taHMc-0001Fv-TI; Tue, 21 Jan 2025 16:44:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875596.1286038; Tue, 21 Jan 2025 16:44:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taHMc-0001Dd-QA; Tue, 21 Jan 2025 16:44:30 +0000
Received: by outflank-mailman (input) for mailman id 875596;
 Tue, 21 Jan 2025 16:44:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gode=UN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1taHMb-0001DX-BJ
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 16:44:29 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa26ebd4-d816-11ef-99a4-01e77a169b0f;
 Tue, 21 Jan 2025 17:44:27 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-436326dcb1cso41515625e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2025 08:44:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf327decbsm14109338f8f.90.2025.01.21.08.44.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2025 08:44:25 -0800 (PST)
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
X-Inumbo-ID: fa26ebd4-d816-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737477866; x=1738082666; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EmCD58f4zvehMaZJsFTMs/mrzruzYybuNQJUOgew3cA=;
        b=G167hpSWLviqGQENN1QYTcvpzqDoUxi+c7A3DhW2/n3/Ui1+/vhbzP/0on53b/90zq
         hlHcQz2175x7CWm+tA7WsH6guekRR5GgVewJp8Px/mzYzAmFqVT6Rxy2j071rwPMkzpk
         b7Jnn7tJ4QPcseozox9UpRoOP9VDQzlwmYC49wxpj0zk59ul8QixbWmZ03AZnfbqAbjJ
         uLyYUlWucxRnuTw0vXEq3rQ5aMIgvPND2bIeAIefFa48kabPpPhDMt2iMI2FSijJoKYP
         odBSURDsdAFi1VDAvYl3RgdH9hjJsfqfcE8FDuwScCW2xDDnMJ2SJ5Od14UbB3MzFalQ
         juBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737477866; x=1738082666;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EmCD58f4zvehMaZJsFTMs/mrzruzYybuNQJUOgew3cA=;
        b=Z4Aqbm4ndrrXzjbevVkfqkNatDXXAVCLZGHgbEdMu7Wv66FiGbvVP3kdcVB/omWQ8h
         E5e7XFuZ9OLJ7auSaiNRP+Jz59+IAFcAcV5F9pacF74V+wu0DbjkE0odeaGqCH+/Zzk/
         kwQPm413YlpPRVbraAshs0YmanARVwK/tORc9dignOw1VfgPtC+CQI6jGv0mBX1XEip8
         END+BSU7B+v/VJ4wvrvsTA9483wYD2cnu/yCVkEt+l7izqaqbPokkSzmb8GXSnqBrVpj
         gS+GuGFvKpQk6iZj1WuKMwPlFCUSs7EhpYkwgqw2u3K6OoIr5wmaViv1JY/QwR9Mj7IC
         nt3Q==
X-Gm-Message-State: AOJu0YyPcIBMHOtP1SljAvCZCOX111GLX9T4GYodm1w3oAoOueLnk+Lu
	on5fBYtc0ZTcVlyFYjluGqgxMehPftUibvXbWjmpT8vcFl4dhZJ1Ls7LZPJ/3g5w0xFG4YWShK4
	=
X-Gm-Gg: ASbGncvSGGtdA9pVXTR1wZHh9AhZuMXyjxig/1APkdfp5roELQHre3ajhFhgzzWN4p6
	ZesiohTcEbemzfc3QSAmMj9BHgxLhkVBMwJbxIIZtERjPO2N3tEw6HgjWWjMxTpcsz02fjWhTPm
	i0uy9U0xoyMVP3H+yKmTYSJwIjxYMbVsEpiozCVzKGwwiNfl77ofv+dpwbpBDBngfZwK8+0sL+j
	Hr+WLxQawjkYPH0+eow+2C6oXiRoVjs2FxccoPbLQGO/Gx3MN8nOyi76tsUnCF+ZXhTyLbXim1R
	IdqySRWa+PdpgYlMWqFExtY4bnCAaG61DlfiKXt03V3YOIDHaIfFOy4=
X-Google-Smtp-Source: AGHT+IECM6xf5vJKaZeIi573x2ZBgRIn1r+aJgUL8ImblEdTGNvP61Vn8LxnLoCVIvyj5HHq1CKOuA==
X-Received: by 2002:a05:600c:3b02:b0:431:54d9:da57 with SMTP id 5b1f17b1804b1-4389144d5a1mr180164435e9.30.1737477866496;
        Tue, 21 Jan 2025 08:44:26 -0800 (PST)
Message-ID: <a2f8501d-2cc9-4210-ab33-cd70f47c6373@suse.com>
Date: Tue, 21 Jan 2025 17:44:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH for-4.21] x86emul: drop open-coding of REX.W prefixes
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

Along the lines of 0e3642514719 ("x86: drop REX64_PREFIX"), move to well
formed FXSAVEQ / FXRSTORQ here as well.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_emulate/blk.c
+++ b/xen/arch/x86/x86_emulate/blk.c
@@ -259,16 +259,7 @@ int x86_emul_blk(
         if ( s->op_bytes < sizeof(*fxsr) )
         {
             if ( s->rex_prefix & REX_W )
-            {
-                /*
-                 * The only way to force fxsaveq on a wide range of gas
-                 * versions. On older versions the rex64 prefix works only if
-                 * we force an addressing mode that doesn't require extended
-                 * registers.
-                 */
-                asm volatile ( ".byte 0x48; fxsave (%1)"
-                               : "=m" (*fxsr) : "R" (fxsr) );
-            }
+                asm volatile ( "fxsaveq %0" : "=m" (*fxsr) );
             else
                 asm volatile ( "fxsave %0" : "=m" (*fxsr) );
         }
@@ -285,11 +276,7 @@ int x86_emul_blk(
         generate_exception_if(fxsr->mxcsr & ~mxcsr_mask, X86_EXC_GP, 0);
 
         if ( s->rex_prefix & REX_W )
-        {
-            /* See above for why operand/constraints are this way. */
-            asm volatile ( ".byte 0x48; fxrstor (%1)"
-                           :: "m" (*fxsr), "R" (fxsr) );
-        }
+            asm volatile ( "fxrstorq %0" :: "m" (*fxsr) );
         else
             asm volatile ( "fxrstor %0" :: "m" (*fxsr) );
         break;
@@ -310,11 +297,7 @@ int x86_emul_blk(
             fxsr = ptr;
 
         if ( s->rex_prefix & REX_W )
-        {
-            /* See above for why operand/constraints are this way. */
-            asm volatile ( ".byte 0x48; fxsave (%1)"
-                           : "=m" (*fxsr) : "R" (fxsr) );
-        }
+            asm volatile ( "fxsaveq %0" : "=m" (*fxsr) );
         else
             asm volatile ( "fxsave %0" : "=m" (*fxsr) );
 

