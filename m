Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0399DADE438
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 09:06:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018847.1395719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRmsJ-00065G-EU; Wed, 18 Jun 2025 07:06:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018847.1395719; Wed, 18 Jun 2025 07:06:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRmsJ-00062q-BI; Wed, 18 Jun 2025 07:06:23 +0000
Received: by outflank-mailman (input) for mailman id 1018847;
 Wed, 18 Jun 2025 07:06:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBi2=ZB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRmsH-0004wT-QT
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 07:06:21 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcfc6e68-4c12-11f0-a30a-13f23c93f187;
 Wed, 18 Jun 2025 09:06:21 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a510432236so4844993f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Jun 2025 00:06:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2369d2e3507sm14537535ad.130.2025.06.18.00.06.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jun 2025 00:06:20 -0700 (PDT)
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
X-Inumbo-ID: bcfc6e68-4c12-11f0-a30a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750230381; x=1750835181; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FstPDyVgVxeevXHNpusP3FrMG+9yEgYGd1uLLSNLSeg=;
        b=O7Y50X0ZNRgwyDjTzZnUvmSJfVK41YAHBtG93TvZFiZu5zN0mt3+a6PFfhJ1DW2cRt
         p+v0SzS/FYwfyQNI440C+oCyXHfOXy5VpCbSQs2McikjThxtiJFtpcot174NU7kT36wn
         Vs6viGPy8h40lP8h4YfbIMZTmThT2FK+gUYCyn5c9krGt+TMkvh10gCCEjOEwjwbrtmr
         LUdbLQWPT7WbSVzWU7OirUo+7V4yLc8vV+ua8oHaWefOT3XPY9MUuZAttftQIosaPXNy
         6MCd7Dwp6G3egE9pFeZCdDAtgmFKipdfFp2AsO7DUEc85ZfBkeNEAV7S3L3jOEcb+IUa
         zjhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750230381; x=1750835181;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FstPDyVgVxeevXHNpusP3FrMG+9yEgYGd1uLLSNLSeg=;
        b=Ni4RaMfsGJE6lgIJrSbM47nL8W/2Sdaw7prm7/+CtTtjyTdC92Kiu5wOKaBZjM8XA2
         Phd09rNSQ5W2d+TKLNbhjauWd83nsi8QGUA4bHxUE5neLzy90ycvw8Qj00ygvh1plsPA
         o4AXoy1u8+fWXh8lLRbpW8Ev6gXBGYoqQiLM2Ced0h6yncA35Gfjxodk1Gwhmd4myNRR
         1IP3RsneeoY2YnPxSAd+ry/gf05fdwEhQ9T/WL2BSrtulRkfkzbuDOnaEkMH0CgS3IMT
         XuemRwTbjmha1HhTfUumiauLoEXo7F89XC3u1opWtVf4D2fLmBmcMq5M4i+KfzYYsrMu
         Hapw==
X-Gm-Message-State: AOJu0YyeZFIfIzQM+R0mlFUiED6UBnMbm8plQmhmCcObal9NqLU4ovGC
	WCyX/saMnI9j5NPWDLWlkSO82SrIGjKuHIkVz3v/QbOPmLjRlQ0JA5aUQkMLVWqh4QjpvZsW4nj
	/2L0=
X-Gm-Gg: ASbGncvx+ExzuZ5siitnhOOflFvH3WQjaQfkmA55yQ/1Ay7J3jJIaf3X0WKdSsebZyA
	4mv7VDzqkp9RLGK7JhoR2PkrXsr8RxYRIlSPFnVyxYkPYEifIQZ6M0hu/m+YqGJ+moaF9DUCx2G
	lw4CTU4TTLtrMb5G35Q4Yk85Msuhm0mzpmHzHzhfLknffIVTTX2KzOeigb3Jsyc98bbdvmzJIrg
	iUnBObKoFEHB/NOrlyawfjqpjlTTzm/kB4t9T/KQtQchtlag5VaaOkrYJGW6Tw5/nARscMZKbKI
	1vvoAMdVd1RB+r5jx12cix+l/OTUs9SqfJ+nCmi0g8ytUOINwi5b8/T3UyyrxRfCqdqk2YCG9X+
	lyilHppL8tDOmXhnSoCgFxKw3jbhTM7aOUiT+gG4sf5Of9AikNx1QccMzTQ==
X-Google-Smtp-Source: AGHT+IG8mUrEBNWCYdcA7I1LZpx2oIp751GREWT3zQa32v728K6BJqGmbGUPiA34WPbdkmxvXEd7lA==
X-Received: by 2002:a05:6000:290b:b0:3a4:dcb0:a4c with SMTP id ffacd0b85a97d-3a57238b8e6mr13005014f8f.12.1750230380686;
        Wed, 18 Jun 2025 00:06:20 -0700 (PDT)
Message-ID: <5b0be3b6-53fb-42ab-b2d9-141f7fae1496@suse.com>
Date: Wed, 18 Jun 2025 09:06:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v8 4/7] x86/cpu-policy: re-arrange no-VMX logic
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <585f1b0b-6768-4f9c-8f9f-bcf6e20fbfb7@suse.com>
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
In-Reply-To: <585f1b0b-6768-4f9c-8f9f-bcf6e20fbfb7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Move the PKS check into an "else" for the corresponding "if()", such
that further adjustments (like for USER_MSR) can easily be put there as
well.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v5: Re-base.
v4: New.

--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -777,19 +777,20 @@ static void __init calculate_hvm_max_pol
         if ( !cpu_has_vmx_xsaves )
             __clear_bit(X86_FEATURE_XSAVES, fs);
     }
+    else
+    {
+        /*
+         * Xen doesn't use PKS, so the guest support for it has opted to not use
+         * the VMCS load/save controls for efficiency reasons.  This depends on
+         * the exact vmentry/exit behaviour, so don't expose PKS in other
+         * situations until someone has cross-checked the behaviour for safety.
+         */
+        __clear_bit(X86_FEATURE_PKS, fs);
+    }
 
     if ( !cpu_has_vmx_msrlist )
         __clear_bit(X86_FEATURE_MSRLIST, fs);
 
-    /*
-     * Xen doesn't use PKS, so the guest support for it has opted to not use
-     * the VMCS load/save controls for efficiency reasons.  This depends on
-     * the exact vmentry/exit behaviour, so don't expose PKS in other
-     * situations until someone has cross-checked the behaviour for safety.
-     */
-    if ( !cpu_has_vmx )
-        __clear_bit(X86_FEATURE_PKS, fs);
-
     /* 
      * Make adjustments to possible (nested) virtualization features exposed
      * to the guest


