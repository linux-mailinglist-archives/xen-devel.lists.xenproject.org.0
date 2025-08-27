Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A79B37D5F
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 10:17:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095697.1450610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urBKQ-00052U-2f; Wed, 27 Aug 2025 08:16:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095697.1450610; Wed, 27 Aug 2025 08:16:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urBKQ-0004zf-02; Wed, 27 Aug 2025 08:16:22 +0000
Received: by outflank-mailman (input) for mailman id 1095697;
 Wed, 27 Aug 2025 08:16:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gy2E=3H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urBKO-0004zZ-FD
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 08:16:20 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b5f7659-831e-11f0-a32c-13f23c93f187;
 Wed, 27 Aug 2025 10:16:18 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-afcb7a8dd3dso985349266b.3
 for <xen-devel@lists.xenproject.org>; Wed, 27 Aug 2025 01:16:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61caae5fc3fsm1518830a12.51.2025.08.27.01.16.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 01:16:17 -0700 (PDT)
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
X-Inumbo-ID: 1b5f7659-831e-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756282578; x=1756887378; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9IPvwzAlgN/8K1TiFg2f/TJ+g46pFRrkDrVWSadY49U=;
        b=GqO5pHevxjziWucK15LKvp0Ztud/UOgcWnj188RJ116Xch3AgE++Kw6Rs0QJa87XyM
         bYlkkFg0RC6eb1/xoszW/IGczSyO66djBUfCLZGkiqsJWgSh1OX0pGhGPrOkWipi726R
         v3XGZiPf4g7O2m2d0Rz4HsSBH29BVRxaI7KQ27fZFs6Cp5yeuVN0LU+HDEObTKNy8nzB
         hkrIStEWdS1b/SqgdGYAWK0xpwoZXdl5IXT+p+ZvGm0Qkve/UJ9pUAUmmkEU/2tes9Mm
         Wtw6eoMGqn2vY7Bw5NiI+QbdyekW4vjRrj1TeP55pzxB7/DD7f3GRIVjTr0Vrwiv3j40
         U9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756282578; x=1756887378;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9IPvwzAlgN/8K1TiFg2f/TJ+g46pFRrkDrVWSadY49U=;
        b=t/ocNefz4rzYechWYEEN8SnyajkHuA16Xb54daiicHzCMPrd+f5ayxmukw9jUZ2Jh0
         Pw9Xv9cte7NHrfQc8SprEHdQ+t8YKB3J2wD2Et35rUYilmhY+52kPJf9morPnbxHLL3x
         QYe9cT1A9t1/iyMdg7v/UU5NL1SsTfaX9NeHLhaoyggTP/1R6Ib1hYMh2WxfLigKELB5
         AnyZX1/Ec04QBwNd+CqlU7XFY60/g9/KI51V8aTdARvue2kQtFKM3+rIzIVj3rSD8kjg
         ko5X21jmJFutj0uu4//xdO8HZx4QAb+5DEDqh9LXZ5FOBr6J9k5CI273/1Zb/qBXiDK5
         ahGw==
X-Gm-Message-State: AOJu0Yz2QJxC8bUgwrnKB34cw79TXhwdLo6O5A7yualV+fjHtH3WGbyC
	Pa4I+HJssvW+SHHymwDwsPi/H+uxIGLCk9jPXf8vbJqTYTxCSTQEXI9kMS2J3OkFOVqeja4UV2x
	H6/A=
X-Gm-Gg: ASbGncthF501HSKbhVPHCFB5SRXnK16w7SX4zFMU5dWmauhUMAlJqJsExiFLcEK9cKB
	bIq4jnIU7+CND3on999O7/KP9PbjSNtsDg/ODCT1tGtXlKaEDB2H70MpNUzIvSvDxg6+9KwwDKM
	cnLmw+rXlY+IXzMs+Rxjp3XJkZ6y8nyhSRIXCdjfcWF7GxMG8JHQ3qxJr+JrN29FqwdvRn8Uqhu
	5aYf6M+OrAA/6gFp8qHfd6TWErMrRrQ6rmd46R/8yujAxwPtJO9OHruT5h6DeQY6J6M9H8Ew5S7
	NJRGRAqEFJ/CGPJZUTL6tGYwSxc0DcP7p48Db5nEABrdMKw4P/9YOIyiPD7zXhh+X1OVQUvESBt
	q2/MpJKrcqRCYw6MHWJ4cBwN41ieUHfc+M0UEuVQNfJJzOGqmrglxmrAQyzgruCtH24jQdl9UVp
	zJEv+XTv7l9kDFxolrog==
X-Google-Smtp-Source: AGHT+IF7t0KTPA8xBG05FE6OTHMVEYCuQRHSgdRDG+cFr4a3vEPe0vAJD+HkBWc4H+CoC9STpSqxww==
X-Received: by 2002:a17:906:fe48:b0:ae8:fd2d:44b8 with SMTP id a640c23a62f3a-afe2943d5bbmr1521890966b.29.1756282577632;
        Wed, 27 Aug 2025 01:16:17 -0700 (PDT)
Message-ID: <a3c768bc-c99f-484e-9e36-f8e03930496e@suse.com>
Date: Wed, 27 Aug 2025 10:16:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/PSR: move CPUID level check
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

At the first (and maybe second) glance the call to setup_clear_cpu_cap()
(which is __init) from psr_cpu_init() (which isn't) looks wrong. The
earlier cpu_has_pqe makes it safe, though. Nevertheless we can do better,
by simply moving the check ahead of the BSP invocation of the function.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/psr.c
+++ b/xen/arch/x86/psr.c
@@ -1583,12 +1583,6 @@ static void psr_cpu_init(void)
     if ( !psr_alloc_feat_enabled() || !cpu_has_pqe )
         goto assoc_init;
 
-    if ( boot_cpu_data.cpuid_level < PSR_CPUID_LEVEL_CAT )
-    {
-        setup_clear_cpu_cap(X86_FEATURE_PQE);
-        goto assoc_init;
-    }
-
     socket = cpu_to_socket(cpu);
     info = socket_info + socket;
     if ( info->feat_init )
@@ -1708,6 +1702,9 @@ static int __init cf_check psr_presmp_in
     if ( psr_cpu_prepare() )
         psr_free();
 
+    if ( boot_cpu_data.cpuid_level < PSR_CPUID_LEVEL_CAT )
+        setup_clear_cpu_cap(X86_FEATURE_PQE);
+
     psr_cpu_init();
     if ( psr_cmt_enabled() || psr_alloc_feat_enabled() )
         register_cpu_notifier(&cpu_nfb);

