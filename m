Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 068D8B0F57F
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 16:38:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054269.1423006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueabY-00030s-HR; Wed, 23 Jul 2025 14:38:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054269.1423006; Wed, 23 Jul 2025 14:38:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueabY-0002zO-Da; Wed, 23 Jul 2025 14:38:00 +0000
Received: by outflank-mailman (input) for mailman id 1054269;
 Wed, 23 Jul 2025 14:37:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFh9=2E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueabX-0002zI-G0
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 14:37:59 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0161f11-67d2-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 16:37:57 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a6d1369d4eso4091250f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 07:37:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759c84e215esm9692093b3a.9.2025.07.23.07.37.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 07:37:56 -0700 (PDT)
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
X-Inumbo-ID: a0161f11-67d2-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753281477; x=1753886277; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Z7GZCElPCgHj/zkkYg1vWAsdkGTh8EnVC6rxWMBYYQ=;
        b=fqTu3WDtEF2TGWkId7gyIvLCFqAUW4+ZLQZSni0b8zZGjJEItacpsumDEDYbdreu3J
         nRkjHPT2NEcBXU59Ecb0IEM4paj7lftbSBk6V1AMV3Dga0VTgzGm9E2zjfA+kT0vO0Yr
         0Ecvyli+V4E453DwFc7cuc4ZCqNqp9IbnQcP1LZbtZUTwcSHoafazsudhPZqdxwmK90Q
         kImFPwLhRWmd2sOex8yBqCD1HTcZfvAmZ16yU9YL2iWgI9TWjGTGEYPVqtTiMiIgzejr
         TYFNSoNI+VRmJduW30f0W0Ca+LoGu7Dulf6UOG4nkUA6HNqf9dbtERuu2Cv81NpD3FsK
         LhYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753281477; x=1753886277;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Z7GZCElPCgHj/zkkYg1vWAsdkGTh8EnVC6rxWMBYYQ=;
        b=DB9N2Qv3Xp/emVEsdAWPRsjw9vQBFCe2jI/N/CN9nldYZOPgqTjUrRr8KrV465Xtmg
         4xw3HqOTng/nv5LAY4KNee87dTleeT4vD1AdB1JlO/H84y3SBVi08tNljgSBnZBS9Uh0
         Gyx41as7Gu22t+cg7Ec0NwpTMzl2Vnvs7F0qkVXFc/VatyfwKQDkGLr1wtQCjwJf8szc
         buqyZlvwH85BhM5H4xNJqpyZEXmaJ4+U/szHkONo2Vo8Gij0whGzd2PTmXN/v63x/CUH
         DtUBv8N88cT6vTzQccbfJKFk+eWgH/InNAKp6frvyYxxFyZB6hGkm5RKB1jhKsfGjArs
         aulg==
X-Gm-Message-State: AOJu0YzIUOFBUJmhrK0LSVSQjuJQUtHdDjfhT21gphI2felheVLv1kOn
	WFf3dDMj5cOXYVAasJIYtRY55LcM5z3H+6jjobN3x16DGtamDg5e1XPJPROrJegY7G4lf71LIJx
	O5Ao=
X-Gm-Gg: ASbGnct1518Sj7xu3etENBJynjBZvBprs5NQK9i6VyadKau1VzO5jejuZgn95iChBUd
	pJGH5DYUrb+A0iFwmPJjMMNkQvApFCD4QBclbezm3qRlnsrL7a3d14YoXem6y0cmJ3XmD/5FLlx
	I9pGkNUVpGYTbdsM3T6vw7+as1Y5dE3glTV0Pe8hrbEZ3lfL1a31mv4fdwcpiqlTPvTFlFJ+JUH
	3qioNw8EeEurfBcBOk3YEBGkEgIlwuskNHk0yAfjWcew4avRrIRst4W7anhPNdVUQV+RJTmuVrL
	Mz3dHjjFUr/5CbnKMT6IVtNlUlAUIkg5d6hr0QO6ZhdUKCBLmgS2h3YZOcf9VEK6oSJQtT7Svcf
	PXxBsV3riD2Hpl9uuTvYivKr9nH96N75P1VPCB0sGFCVIu55Rq3M2s71Zh5xhiBBMPjVagfiO4i
	9zPUA7btg=
X-Google-Smtp-Source: AGHT+IHBeTaawtsLTnsMAO/Dl7dV6t2Z8NMvmz6loeHFuMiJrVx31uPYH+0tZwVpkO9BfkpG513uVQ==
X-Received: by 2002:a05:6000:22c2:b0:3a6:cfca:efee with SMTP id ffacd0b85a97d-3b768caa0f4mr2781748f8f.17.1753281476954;
        Wed, 23 Jul 2025 07:37:56 -0700 (PDT)
Message-ID: <161f9018-7746-4f74-82cb-d3921a9be4e2@suse.com>
Date: Wed, 23 Jul 2025 16:37:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: correct scrub_page_{hot,cold}() prototypes
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

... to be in line with Misra rule 8.2 requirements.

Fixes: 6ff0cfbfd4f7 ("mm: allow page scrubbing routine(s) to be arch controlled")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The offending patch had been pending for far longer than we care about
Misra, and hence at the time of writing I didn't pay attention. And then
I never looked again. I'm sorry.

--- a/xen/arch/x86/include/asm/page.h
+++ b/xen/arch/x86/include/asm/page.h
@@ -227,8 +227,8 @@ void copy_page_sse2(void *to, const void
 #define copy_page(_t, _f)   copy_page_sse2(_t, _f)
 
 #ifdef CONFIG_DEBUG
-void scrub_page_hot(void *);
-void scrub_page_cold(void *);
+void scrub_page_hot(void *ptr);
+void scrub_page_cold(void *ptr);
 #endif
 
 /* Convert between Xen-heap virtual addresses and machine addresses. */

