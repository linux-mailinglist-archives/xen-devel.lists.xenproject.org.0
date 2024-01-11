Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 667A882AA0D
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 10:02:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666043.1036476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNqwo-0008Hb-1g; Thu, 11 Jan 2024 09:01:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666043.1036476; Thu, 11 Jan 2024 09:01:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNqwn-0008F1-Us; Thu, 11 Jan 2024 09:01:57 +0000
Received: by outflank-mailman (input) for mailman id 666043;
 Thu, 11 Jan 2024 09:01:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNqwm-000738-75
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 09:01:56 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10e261ef-b060-11ee-9b0f-b553b5be7939;
 Thu, 11 Jan 2024 10:01:54 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2cd46e7ae8fso56210151fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 01:01:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h6-20020adf9cc6000000b003375d8b0460sm643239wre.1.2024.01.11.01.01.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 01:01:53 -0800 (PST)
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
X-Inumbo-ID: 10e261ef-b060-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704963714; x=1705568514; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=na6Z+653rGyQ/QpH5AhH8OcJuaSsVu3W3ZY2F24Kex0=;
        b=fVSJkmdjifaUcmoDv4+mmunrHTwWC0DJ5+2c5EgQdjNcNdBck2f1MmkxBfWRUaGRM7
         iENx5Jrm2JfrX7mtNHUDmU4qvzbSVWsVnqMsQ0xL9vlQeqpOW/d04QfB+W38hCMUrlfk
         GmXzE+aDHGjiBDSTsOVZduzk9fcuhKl7L4DTF3jADqBGWcP3nsdmrAx0wlx+CzQYWBvg
         0PVtImPHIg77/m7thfHXGzbw737NwKZgEzHNQfIXHTpfuxVZ1NhSz4076fUNrLrGxdc+
         lkVIzzz6dneAFA+Uj2jWIxym10wI6G3CdfkXF6m/AQQ8dAyF34CVG9SOiQHH8i32GUv3
         N9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704963714; x=1705568514;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=na6Z+653rGyQ/QpH5AhH8OcJuaSsVu3W3ZY2F24Kex0=;
        b=cFNhfwBkic7O00W6K5Q5MRDyEaBhuttomN45COWWfGWkrcvFHC77W25Qs4iMm8kCp8
         cmD1/4KeAE4E6pbEsQo/X5KnLrWThmCeank/HV2gJtROyPjPJ5hIloGiyLinv4rARzeP
         gClogS10DmXj26wheaxzw1kV+sKQtMZJCDRHfk68/61+ePnXVMMIBDYxriUIcXEwSbiY
         AAog7PsLuY3HAZ7HuJJsVUKySAMRpu0zRuUfoLYxxoa8kWmBe9zVg51QIfw4SrXDel4a
         2EaTbUw5DFTg8so24+0sdpFxW3Ri07ApA2U9KT4LY2dJHb9LIhRKbsBkpL7X/uv7CGXi
         D4Dw==
X-Gm-Message-State: AOJu0YxKsc4hppUu3ZenlLS1GUJVZ7CKli8nvXW9mRuX4CtZFuwS+K9D
	4delwisPqnCptjk6+SP5/9hwelXFpd2LPM2itG+jnHSsuw==
X-Google-Smtp-Source: AGHT+IGqJqdyJB6e2MBEQtKrunQYTYblHHSRs2HCTdFU/pCjdurYgX60BlwhEIPJ6Pm3OgcSOSNU0w==
X-Received: by 2002:a05:651c:97:b0:2cd:c2c:1c5 with SMTP id 23-20020a05651c009700b002cd0c2c01c5mr95641ljq.158.1704963713762;
        Thu, 11 Jan 2024 01:01:53 -0800 (PST)
Message-ID: <e982f0b9-d802-42a4-bfe0-78a7dd4d755a@suse.com>
Date: Thu, 11 Jan 2024 10:01:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 7/8] x86/cpu-policy: re-arrange no-VMX logic
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <9dd23064-c79e-4a50-9c71-c0e73b189944@suse.com>
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
In-Reply-To: <9dd23064-c79e-4a50-9c71-c0e73b189944@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Move the PKS check into an "else" for the corresponding "if()", such
that further adjustments (like for USER_MSR) can easily be put there as
well.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: New.

--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -665,19 +665,20 @@ static void __init calculate_hvm_max_pol
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
     guest_common_max_feature_adjustments(fs);
     guest_common_feature_adjustments(fs);
 


