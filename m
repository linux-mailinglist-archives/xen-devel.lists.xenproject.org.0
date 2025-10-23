Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D629C02458
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 17:58:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149458.1481119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBxhy-0000xr-La; Thu, 23 Oct 2025 15:58:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149458.1481119; Thu, 23 Oct 2025 15:58:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBxhy-0000wG-Hk; Thu, 23 Oct 2025 15:58:34 +0000
Received: by outflank-mailman (input) for mailman id 1149458;
 Thu, 23 Oct 2025 15:58:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U0PU=5A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vBxcF-0003ZG-DY
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 15:52:39 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c84f619-b028-11f0-980a-7dc792cee155;
 Thu, 23 Oct 2025 17:52:37 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-47103b6058fso7646845e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Oct 2025 08:52:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475cad4c81dsm45156035e9.0.2025.10.23.08.52.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 08:52:37 -0700 (PDT)
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
X-Inumbo-ID: 4c84f619-b028-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761234757; x=1761839557; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rds4jnnN9NVrTZyuc+q65+QBQEjCAV7rC8oJIxMqDF8=;
        b=U/iVwEQbu9xhnKFHRnu/ngvhY7V+rmU8Uq0rSlbzCuB/TEtd5biqh08dXJ1be7zdB5
         etQMRTA3XLaW6NoMGKws66BvVx9269wUgLmMm2GViJLGNBreYAmD8BoVzBhUcFWdMd6o
         JVcQZq5ziIQa0dcUYHdgY+q/Phfzm4JDIxcVfKim03ivD10TPp3MkLTFyA0ezigquK5i
         KQ9tYcNzrAxsR1de+P3K+bs7x4OmzELn0Sxuqr77o2O+UQrRmqSDZCxCJ2MkwM9umFYr
         j7SNU5dZiRQzunc4UGZ865UblV/ZaEjz10Z4fq63FaRaCCFjiTAtZ5HTD/bJ7GwtcezH
         tl/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761234757; x=1761839557;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rds4jnnN9NVrTZyuc+q65+QBQEjCAV7rC8oJIxMqDF8=;
        b=rakPMWRbdyEtCnn5grP8TU7lDDX/iS27hHK3MMy9Gl9r3wiMKYHY8WQ46q7wwurTt9
         J7iUgdVHSSOfzRA3IwwXHyI5Mt0pDRISG1QAwuF1H/W45xwd89UHzyRzd9LV6blqxxHD
         NQxigGBcPuAkHOJcP3TdqOf2wYpLsdFilE04LgSbvDJ4kMIRbjapzqW8ZLYHrLpYos57
         qzekR5WXNO4ChDGTksSC+xdP+GYQv9MO2Zx67tqpPINLmjk6fo2rW5P1rpIs/ugUiTry
         rFGRfrRzVJbu7Glv6GLGGfEBI0+Lh8JYyoGqzj5WZtAUS3Imk2SUQSPYKxXOZm/qOMiv
         Q1aw==
X-Gm-Message-State: AOJu0YxCETzMugc9PlsxTkxx6XqaKg1UdyOj14Xq/nWu14lV5/X5zxm4
	zMunrsFfxYGB4ViEFS+GhccyMQcPetQ/hqq47/4U4gKNcB3y/Fxxn67wIv/UMuXbe20KHgZPuuf
	Zjm8=
X-Gm-Gg: ASbGncsUW4X5TlyWwvpe+zh2Yf0iRE8q2uIKAGtHPD5wq5bbnqu1XdkZZwODrdeeGbz
	MJ53Y0V7qwEs5IPJ0h2Q3E2kN0OLaMlWQfjcuxGKLadQuMRrcWOITTFdB/9Ojz5N04U1oiae1ec
	S9+BS5YPdBjgvPLy/ZA6NDePGr4rpXoXp/AK8fgy0F+ad4nEfBG5x9j9Fa6hidymNPY6ntliCkv
	PLQYMIjbjQ/Krm9tiocqdTYvWopUU8N9bWyLCij0B8M5d4NezflX6iTXic7TXFc+pd+sMGcCYdA
	6TZv076NxdJ7z59elvWJbe/E/DC+cwWy4fi5C4bCGaCgw6C//c8YAEBAwOlkqKe4tHMivMCMZdl
	WoA7W5WyUDLOr6Z7+g0rf3Yl8+sdGaPDP60VxOMdLMe6Y8Df8f+hb6YfhgZwv2+pEjiKTWWjCTM
	XC0/J5fHYpxqEbvK98KejjuCbSSEtJqbYROG/pp3qocVbKFbwYkCYwl2JTaBzcxbYnVNSEokY=
X-Google-Smtp-Source: AGHT+IE/BxDx1PZIGOupQL8eMkohjodSLG4a3UQ9TF5ZY/S5BZL6F1gt3BKwI+tTiRTTns/GDCeoKw==
X-Received: by 2002:a05:600c:55d6:b0:46f:b42e:e362 with SMTP id 5b1f17b1804b1-475c6f7076cmr35920245e9.19.1761234757309;
        Thu, 23 Oct 2025 08:52:37 -0700 (PDT)
Message-ID: <292960d3-37cd-4c07-b0fb-528b560ee44b@suse.com>
Date: Thu, 23 Oct 2025 17:52:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 7/9] x86/HPET: reduce hpet_next_event() call sites
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <6a8a912c-7276-42bd-af2b-b94fc6ce4291@suse.com>
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
In-Reply-To: <6a8a912c-7276-42bd-af2b-b94fc6ce4291@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I'm surprised gcc doesn't manage to do that: At least in debug builds two
call sites exist, just like source code has it. That's not necessary
though - by using do/while we can reduce this to a single call site. Then
the function will be inlined.

While improving code gen, also switch the function's 2nd parameter to
unsigned.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Oddly enough the CDQE is replaced by an entirely unnecessary 32-bit MOV of
a register to itself (i.e. zero-extending to 64 bits), as that's
immediately preceded by a 32-bit ADD targeting the same register.

--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -124,7 +124,7 @@ static inline unsigned long ns2ticks(uns
     return (unsigned long) tmp;
 }
 
-static int hpet_next_event(unsigned long delta, int timer)
+static int hpet_next_event(unsigned long delta, unsigned int timer)
 {
     uint32_t cnt, cmp;
     unsigned long flags;
@@ -173,12 +173,10 @@ static int reprogram_hpet_evt_channel(
     delta = max_t(int64_t, delta, MIN_DELTA_NS);
     delta = ns2ticks(delta, ch->shift, ch->mult);
 
-    ret = hpet_next_event(delta, ch->idx);
-    while ( ret && force )
-    {
-        delta += delta;
+    do {
         ret = hpet_next_event(delta, ch->idx);
-    }
+        delta += delta;
+    } while ( ret && force );
 
     return ret;
 }


