Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 645C9C64AB4
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 15:38:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164087.1491097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL0NT-0007By-0v; Mon, 17 Nov 2025 14:38:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164087.1491097; Mon, 17 Nov 2025 14:38:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL0NS-00079p-Ts; Mon, 17 Nov 2025 14:38:46 +0000
Received: by outflank-mailman (input) for mailman id 1164087;
 Mon, 17 Nov 2025 14:38:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Jhw=5Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vL0NR-00079j-Fx
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 14:38:45 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1dc17cae-c3c3-11f0-980a-7dc792cee155;
 Mon, 17 Nov 2025 15:38:43 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b736d883ac4so530683566b.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 06:38:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fd809fasm1102791066b.45.2025.11.17.06.38.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 06:38:42 -0800 (PST)
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
X-Inumbo-ID: 1dc17cae-c3c3-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763390323; x=1763995123; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rds4jnnN9NVrTZyuc+q65+QBQEjCAV7rC8oJIxMqDF8=;
        b=Xnnul6Y6+e7SeE7ESpogxBMfFwp2oz6ZV+sRaiR3xGU4IFvSuXiBg3qx0C4yqGuWNA
         8qlL/WW94rPDMkVFgmoi9Bam/+ioKemY3saENxT8yxWdJVuKveU7EAwHKvb4A/byVstR
         f7jPbPZ9J42Mpnw7pwIffLoovuqZkSsk/ecjiuJgfC3M5E2UW83fbNb7CB5IBqPMIz75
         KaQ+B/iM22s7gcr6zuIqpNInT7tSFQDJ5bO3nw0RIe8X2DPBbUYrdk5LqqJ14KXRERSA
         okiheAPJ7RFH8Nsy+1SzShF/O02x6P+yOHcmlhmKGABeRE+14brcPxUohNmGKlp/+1nq
         xrDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763390323; x=1763995123;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rds4jnnN9NVrTZyuc+q65+QBQEjCAV7rC8oJIxMqDF8=;
        b=Mvz0k/MDFa+Kl88totXaIWKv6l0aWdP1SwVj9tmQ11KnsUq/6m2Onm0SBoRnb/wjt1
         UopjN22tBS9ykjh+fnq4am/jt7HA8x1s89Mt2IyZwHuVX33xJYpz7LWP7b8YulXXBkQf
         tETftBs3JjyquWOjv3hdMgZ+Ay/3Xdq4lDO7Tw2+QqqZJHEp1iyNjFSd28fS1FruBDpw
         JA5t/T6wvl+Uqgvnp70tYJqrJwYGvysfsIvQUN7FJknnLOeCYQd3evUHlUSdEKwWkexD
         vtF1HGCZ9fl28yn1PsQzM37j5tiuPJ45BnDYYF7jXlpnJnw6U54MeOvwW4/KKgdAAfQi
         Q1FQ==
X-Gm-Message-State: AOJu0YzzQrNsW3kJdOQ8vcC6ddfyP3ot92yrHajFJBCs5I+hGUA0LtWA
	cCuEtzhyVzBo97Gn0vPew4K3bLiM1mY8kxt06u7+ocn3p9XxlI4bVbFNwjM9V71S+gK7b16ZXvd
	3h3k=
X-Gm-Gg: ASbGnctlotq6jbA1U6EGbDdL6Na394XCtNiUmJ0hD6JYnXg3Q4Mhxhp79SMmbw3UqjO
	UucEO5JMe540kJilQ2W3xuw45/fkaDnQPJ75C6Zj8B7hgFyCU6Q8fhm6MnXnUXSES24RDPjfFax
	5yKd5CvudIqv4TN8kQxEbNf6PyvMUWJ958dr2FtKsLFGyoRS0UBJgM1o48sk2U3VOnRtYKFcmSS
	Idbr9DKKhXfCiUdUa1nuoj8DFCmw3IZNUuL4cuPwe/aksqkFJLEJU6Zb4VK9OCa1fURJTZaEH71
	CciJ//okeBuO4K28EG2Xfz0kWuv3Acl/5teKK1mOnsNKU3mY+nijV3Y7fGJCLOR/xtv5y+GY4nA
	oMbGSWR24zgg6PW1yYdGrh+IyRADM8uhZyye/vdjeof7s4c390EWFjiRen0/0g0imuGlDXZy8sQ
	5n+Yo7L8sMiw4woT9K2CLV6H7MnVrIewqg3dUN6S/9UDgnlqSsrT7o5mKIYlwvuSdU
X-Google-Smtp-Source: AGHT+IHN8hAro7HMRpjt+WtI+SDOHX9UIMDu50lsNW7OSX79hbx5UOZi6OJEXaCRRxswTg/tv/wsqw==
X-Received: by 2002:a17:907:6d0b:b0:b73:58b4:1247 with SMTP id a640c23a62f3a-b7367926438mr1286890866b.25.1763390322891;
        Mon, 17 Nov 2025 06:38:42 -0800 (PST)
Message-ID: <f9133ee9-7797-493d-825b-ded56c17cfc2@suse.com>
Date: Mon, 17 Nov 2025 15:38:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 4/8] x86/HPET: reduce hpet_next_event() call sites
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <57f34114-54b7-483d-8ac0-e9fa49df959f@suse.com>
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
In-Reply-To: <57f34114-54b7-483d-8ac0-e9fa49df959f@suse.com>
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


