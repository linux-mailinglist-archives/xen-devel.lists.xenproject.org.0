Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5747496BC51
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 14:30:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790213.1199941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slp97-00089M-Cx; Wed, 04 Sep 2024 12:30:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790213.1199941; Wed, 04 Sep 2024 12:30:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slp97-000873-9i; Wed, 04 Sep 2024 12:30:01 +0000
Received: by outflank-mailman (input) for mailman id 790213;
 Wed, 04 Sep 2024 12:29:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1slp95-00086h-Qk
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 12:29:59 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6641d5f7-6ab9-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 14:29:59 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c241feb80dso1359207a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 05:29:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989221c24sm797846466b.196.2024.09.04.05.29.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 05:29:58 -0700 (PDT)
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
X-Inumbo-ID: 6641d5f7-6ab9-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725452998; x=1726057798; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ttbJN3WJ9nsR4tpRYJrAfRfyH0Rlt3wlme3cRFYht04=;
        b=NK95J4AoUA3aAsfpy5LB8FIWATu6XLmFLR44ZNSF/xe5hrM8y+CuISW+HX7srxXsWh
         42ENdMqr6jTnA0GVbJr93cOS4/FALMsH2oTbkd6Ya3s+LIbPKCbg0h3+318J25cqE9YQ
         4hno+V8hOqOmIi5vJZ7tEib33oJIvbaamFZateCFMcwbWjZJUogHWzoGpkjEVbdyH3XU
         0HSF+W4Pxy3bSXHdtWwNu5gSVadmDv+XEPLmY3fzPhNcWWFiA5tKV7iexPB5pWIRJ4KB
         rXuO1AVn2eoZcDuAYr1k4vk+/znrDvZW+bHQyA4+T4O6FEYUhYd2TEaXI2YHLETzFZWj
         eK+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725452998; x=1726057798;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ttbJN3WJ9nsR4tpRYJrAfRfyH0Rlt3wlme3cRFYht04=;
        b=GAnmMELeaXbxfAa/2deSvwe/zAwD4Ii5ub7gvOItfqrSXoLpbzQVR+mb5G+H6gXvww
         UIOh5VkWgxqUQWFB0YpA/C1S99qyKTPLKZjhC5cijOijQ2RC1WIy9UhO2aTp1sTrWWO+
         5kv+z8TmOMdJz4JCH+VKrt4pkLFrU8PxgE3tJewKO05S62JQwQOadzYZYeTtELuuDTPs
         IhfBpf2Ol2fBlUS/xTJ0JUC2SuRNuxUYF1ILiJHXx2Wc7a5/9uOWH8Naq7A+yLlByjoB
         GWw+CRJplG/a9wlhdHtaOQD3gI16ujRy7MqDaVq8L/iArpz8Ob5pLy5HAmqWAweqbjTS
         Nm4A==
X-Gm-Message-State: AOJu0Yze5qLBoj4WhVZ+MnP+NcXqyttfc8gcAnh5e4VYJQp/sdJwiXJE
	PqYHhuyjKMfXz/fH3mMd2ZPHiuouqa/Z4nMtWzgYxiqyGUTkZBn/pzwHDgH9WF2xtYMVkfA/4XE
	=
X-Google-Smtp-Source: AGHT+IFJ1RjwFIhgyUyOdpUdygySa14eSmtXXpRRCuObVR07sw0W4KlGapFWWnfhih1mnKRLsxSV9Q==
X-Received: by 2002:a17:906:ef09:b0:a77:ab9e:9202 with SMTP id a640c23a62f3a-a8a42f8af0amr190545666b.4.1725452998458;
        Wed, 04 Sep 2024 05:29:58 -0700 (PDT)
Message-ID: <45913a43-114e-4885-809a-0d682264fb41@suse.com>
Date: Wed, 4 Sep 2024 14:29:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 6/7] x86/cpu-policy: re-arrange no-VMX logic
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <0b9a0ae8-a39c-49d8-b4e7-f2a463128058@suse.com>
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
In-Reply-To: <0b9a0ae8-a39c-49d8-b4e7-f2a463128058@suse.com>
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
@@ -741,19 +741,20 @@ static void __init calculate_hvm_max_pol
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


