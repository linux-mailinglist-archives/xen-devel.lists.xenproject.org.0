Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0648C81336
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 15:59:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171289.1496317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNY24-0007Ep-32; Mon, 24 Nov 2025 14:59:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171289.1496317; Mon, 24 Nov 2025 14:59:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNY23-0007Cu-VS; Mon, 24 Nov 2025 14:59:11 +0000
Received: by outflank-mailman (input) for mailman id 1171289;
 Mon, 24 Nov 2025 14:59:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNY22-0005X4-CR
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 14:59:10 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20cb1f11-c946-11f0-980a-7dc792cee155;
 Mon, 24 Nov 2025 15:59:08 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4779cc419b2so42358205e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 06:59:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf22dfc1sm199957685e9.12.2025.11.24.06.59.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 06:59:07 -0800 (PST)
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
X-Inumbo-ID: 20cb1f11-c946-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763996348; x=1764601148; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zgjx9ZM47Ymjz3NyJ+ag5rhc/TUJaKszwXhUF1w2Gt0=;
        b=geZV08rp6h3qHuwejShm9YZURYjQizNw7+oqKVixNv/zPPmqfFtgmbsk3pmFBWyHSr
         JhbZtJ3AZGMdjRYLN4e5fzJszpfeyw2xV55cE/3S97aGhR0uywtgk0p9wTBHDStzU+aX
         9LOOHlPQmZYENay0nxlE7skepty0oc7+D5Lcdfb/HpmI5fuoTG6SYrswUCfJqR/DFQO0
         hYrGmhxzr2DrTRoZQjjfqBkZpw1HvgvHv8DtzylxshfFict3GRA8L5WOkaDaX4XBIpOM
         UzefO7nMrXEHyqalbtCGxU1PX6cM/yBve0U2AI7JIMw4hFCjUKSOAb9krJFhemTl7WxH
         QxiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763996348; x=1764601148;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zgjx9ZM47Ymjz3NyJ+ag5rhc/TUJaKszwXhUF1w2Gt0=;
        b=WTokzjB1LvyZ2i+IUzR3DaBcKcUSRretuDONnuPzM1NphzWFVLuyYZh8aSThfVi+vs
         3qFaJLZFKp6fSE0PyMH8KtFTsyaOyjFtffeR7+k9I96Ys9kjnDPBWgbT62OzHnlsZDUv
         C1JOb0DV5rKJ2odgjKlu1ugyiV6e8NIemOOT/kXBB8/nmR7VU8AYSBgUfeMlbA4sBVr0
         CCQZyal/3LCwILycZ6yaJSKxGdAD6J7E9jMdiFwS1dMq+l97Ivm/Wh3oBpDzUW/wA5hr
         kt+K4GkR0io7FPvwZN2eYq/GZ/hKqchcWveAZIYwSIIv31N8+ali7zG7Qo/9eto4bG+e
         VlwA==
X-Gm-Message-State: AOJu0Ywjou3D91tz4uWqLMhczzwcvmVXjftF7w3USY+dUyQIkSbRAzlt
	a78puU2CxOVTfo/0bYRovgGi2eqp8pEgJkydGzWjHujtN1iA1tg34i+mTjURxOFtRMDMPdtgHU4
	/qlw=
X-Gm-Gg: ASbGncvO8Faoxvu/m1OKVumPrva44urrvRhsYRqqpT3OPbHV+krAfvL5DxE28NWijGG
	Wq8xGC6yiizXwTR5ZIkDFi0tX6HgV3+3WfG50csKS5MrEeSuEC7vGcNjsIFnDBz3i4FBdzlwJuw
	/OUIjfpLMwAMKZ8zact39SfUVjaOM74KrgzXXgeYYrsesrvFrKuN/7AWgvxtvZTFhnFA13Fk/9a
	XuNVIZB1iqIdywZjXY68R2z/vL4eOG5G/bOzfqGQl5lQwpkT2TrSBmA7AAz7b+s2pMQ/cCEYXw9
	ehXtE+RGFay2TeBPFby7+1Lp3+vcpGVvOZpHX4PrhcrCebjhy37RUapEBAjfeaps6KK1/C8gZEA
	+l5mHrJ40yX+j3rFpvzE7vjqAliebE9n3cgj+uxiH3O6CAi5RyOzV1Y4v1EeB1/YKIyQwmBdXBP
	CaShktZCzyi3W4MBfMhEWEs2BYp5UdUVJHhez2/C6SLNlwzCpkPYXYF7otq/t4srLP9clveMGtv
	/UzZB8UBknuiQ==
X-Google-Smtp-Source: AGHT+IHZLCRa8ygNBW+QUSLefmrukbXxfkfppPfrTY/LFiDUW3u5Cm1tisnUT9matucOo89SyHHXtA==
X-Received: by 2002:a05:600c:1c25:b0:46e:4586:57e4 with SMTP id 5b1f17b1804b1-477c114ed70mr181720095e9.24.1763996347958;
        Mon, 24 Nov 2025 06:59:07 -0800 (PST)
Message-ID: <dfa41e40-b50c-4564-829b-0cf147fe3ee5@suse.com>
Date: Mon, 24 Nov 2025 15:59:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v9 04/10] x86/cpu-policy: re-arrange no-VMX logic
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <926a2315-a2b7-4aad-87e6-d686c9da9e3a@suse.com>
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
In-Reply-To: <926a2315-a2b7-4aad-87e6-d686c9da9e3a@suse.com>
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
@@ -812,19 +812,20 @@ static void __init calculate_hvm_max_pol
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


