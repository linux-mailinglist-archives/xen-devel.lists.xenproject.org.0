Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9E0B10AC3
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 14:57:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055945.1424192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uevVI-0000DU-1C; Thu, 24 Jul 2025 12:56:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055945.1424192; Thu, 24 Jul 2025 12:56:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uevVH-0000Ac-U7; Thu, 24 Jul 2025 12:56:55 +0000
Received: by outflank-mailman (input) for mailman id 1055945;
 Thu, 24 Jul 2025 12:56:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0IF=2F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uevVG-0000AL-MP
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 12:56:54 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abb05f11-688d-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 14:56:53 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a53359dea5so495659f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 05:56:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4587054e37dsm19204055e9.14.2025.07.24.05.56.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 05:56:52 -0700 (PDT)
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
X-Inumbo-ID: abb05f11-688d-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753361812; x=1753966612; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rFNuwVWltosq0yI2T1aIIAE6K2pUw4oR8wtRekuIu0s=;
        b=cIAbKiDbpvULx2LU+gSo+Dl1VJaH0dagLty+J/2gp83/i5KTeetS4v/a9gYe6uMs6q
         D9MK4HonTm/rtKh+xA1ZFY65pi7rB2oOOXbRnln/DHGrgfcwlWgg7Y1Xvww/+oLJvw2A
         dglFFfMVkoDQS6EGb8diggKJas1LPeeqPG53iRKvZKMd4+5QGoK7lGzm8Jq2wv+ZC/9S
         o7Cxlsv++YfM/+HGH4Wq9qHDs+vTu4/ckM/uYAHuk8/6cGeBNg/JgfvdJdRhULjeZzph
         cs6bihLvuNulLjdQ+p6iOr/aBz0tcYL9KlOW3sApqJxiwq2Ef0KnuSf+Cab2ZxK2gJ/h
         yVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753361812; x=1753966612;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rFNuwVWltosq0yI2T1aIIAE6K2pUw4oR8wtRekuIu0s=;
        b=EbdjvnIPztltptw1WuxLR2UeiVk/vlTqzNoJ9ssPLhgFCReNQnpNLCnwAA/CNQW0Tf
         vHB4Zi7w2lAoj6AdmKTv3A34c/7qaAeTR0NX45FlOJGzlOeqVhCHZreZiC9LWScLOtxo
         qLUKjLHTg2a6hN05FhRNuVAQJSNQJXqu7L3QkzaLP4AjmJjegY++eHQkvJV8PDsoinrb
         f3CMFFgk7LCfO3CLIGKKgzl5m48iWgFL7B8Qy9ziE7V1+P0de/GdZ5m/YzYEyGx1QS0p
         wDGu/qR/zDbccB/7PQb3bjgTCJp8eiCY9+zBl21UqkFs78yHwEjR9+kIStVv0KNVY3TM
         Sd8g==
X-Gm-Message-State: AOJu0YwVUQuRl59QSSBqk5w87OzpHNuwQbckThoCypfsjuJRGib5d+B6
	0rBXRVxfcH+bUPoqtVFoacOblkpF3pGDCrCxrlX6IvGOnxX7KsKGq91tcgGlIzDRKI5WNmb6yZP
	DM50=
X-Gm-Gg: ASbGnctGFUJAjk0Q2nLnP1UG3xqgNPtYz/4VWafjWMl7a8HoYbBP+ZmUg1b7vDRMoEr
	rJtE8Nsi9JEFQgQsAn8X80a/7tJvdjf87F1/QEJMHUcPVfmSJdoeh+Z+p6Rq0D55D1QJpuayiUn
	ydA9U5wOqvSstrq488g1m2YvVucBZsMVErR/uQq66y0o1bBLKHu3IFPoFTMAX+HUZ2EbqLukQyu
	VkPJquEp0mxTRGFC0azTvIfZSrKQv3RyRBguRRCSBhxT43zd3phO9nylM27MFTuAS9X9PxOHlH8
	sEaCKKWNbdvhwgPOyGy97fWplaW6VJbjMdpYxa3iuION9HztTuMLXEXO+d2WE/lT8BVr+sXUB4T
	h7lFerUaot+fDrfIUsXDvBnWHRUeFeoBe1kGUNbkHZqjZwQyXTgdAqqabHq0myLwQb4MheC6NTv
	1irTM9ZOo=
X-Google-Smtp-Source: AGHT+IGPL5YYr8V9p12iaFrmjiFLvA6rOZ76xb7MQfAjg6jgB+Sl+28/7i3g81biKIkrcy3aZcaMtQ==
X-Received: by 2002:a05:6000:3108:b0:3b6:12d9:9f1b with SMTP id ffacd0b85a97d-3b768ea0771mr5398717f8f.22.1753361812347;
        Thu, 24 Jul 2025 05:56:52 -0700 (PDT)
Message-ID: <3dd4cddd-2dd7-4337-be89-b775a4b04824@suse.com>
Date: Thu, 24 Jul 2025 14:56:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/AMD: disable RDSEED on Fam17 model 47 stepping 0
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

This particular variant has an error that causes RDSEED to always return
0xffffffff, while RDRAND works correctly.

Inspired by Linux commit 5b937a1ed64ebeba8876e398110a5790ad77407c
("x86/rdrand: Disable RDSEED on AMD Cyan Skillfish").

Like for RDRAND, permit a command line override to be used to keep
RDSEED enabled.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Considering how it is described, I didn't think probing RDSEED (like we
do for RDRAND) would be necessary.

Am I going too far in also updating cpuidmask_defaults here, or is us
not doing so for the RDRAND disabling actually an oversight?

Using warning_add() may not be quite appropriate, as we don't really
mean the admin to possibly override this with "cpuid=rdseed" (that's
only a last resort, in case the issue is yet more limited in scope). But
mere printk() would feel like hiding the information in the middle of
lots of other output.

--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -123,6 +123,10 @@ static void __init cf_check _parse_xen_c
     else if ( feat == X86_FEATURE_RDRAND &&
               (cpuid_ecx(1) & cpufeat_mask(X86_FEATURE_RDRAND)) )
         setup_force_cpu_cap(X86_FEATURE_RDRAND);
+    else if ( feat == X86_FEATURE_RDSEED &&
+              cpuid_eax(0) >= 7 &&
+              (cpuid_count_ebx(7, 0) & cpufeat_mask(X86_FEATURE_RDSEED)) )
+        setup_force_cpu_cap(X86_FEATURE_RDSEED);
 }
 
 static int __init cf_check parse_xen_cpuid(const char *s)
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -1220,6 +1220,24 @@ static void cf_check init_amd(struct cpu
 		}
 		break;
 
+	case 0x17:
+		/*
+		 * Fam17 model 47 stepping 0 has an error that causes RDSEED to
+		 * always return 0xffffffff (while RDRAND works correctly).
+		 */
+		if (c == &boot_cpu_data &&
+		    c->family == 0x47 && c->stepping == 0 &&
+		    cpu_has(c, X86_FEATURE_RDSEED) &&
+		    !is_forced_cpu_cap(X86_FEATURE_RDSEED)) {
+			static const char __initconst text[] =
+				"RDSEED is unreliable on this hardware; disabling its exposure\n";
+
+			setup_clear_cpu_cap(X86_FEATURE_RDSEED);
+			cpuidmask_defaults._7ab0 &= ~cpufeat_mask(X86_FEATURE_RDSEED);
+			warning_add(text);
+		}
+		break;
+
 	case 0x19:
 		/*
 		 * Zen3 (Fam19h model < 0x10) parts are not susceptible to

