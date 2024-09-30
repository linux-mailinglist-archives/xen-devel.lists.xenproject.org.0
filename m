Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 789AD98A149
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 13:59:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807320.1218706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svF43-0000zv-JW; Mon, 30 Sep 2024 11:59:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807320.1218706; Mon, 30 Sep 2024 11:59:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svF43-0000yL-GR; Mon, 30 Sep 2024 11:59:43 +0000
Received: by outflank-mailman (input) for mailman id 807320;
 Mon, 30 Sep 2024 11:59:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1QIX=Q4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svF42-0008Ek-Eh
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 11:59:42 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 794d64cb-7f23-11ef-99a2-01e77a169b0f;
 Mon, 30 Sep 2024 13:59:40 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5c40aea5c40so7768290a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 04:59:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c882405127sm4417642a12.5.2024.09.30.04.59.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 04:59:40 -0700 (PDT)
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
X-Inumbo-ID: 794d64cb-7f23-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727697580; x=1728302380; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vIEJMiqmSBTZ/FiAO2g/0mH+P7xBgHAYPgSV3v/hQKo=;
        b=GT9mfQ3V2Eo4hLxa+M9Wi+Sse5En5cfGjbB0BlN7FUM8W43lPlOhgFc3TwyiKi5rVQ
         ayFk4xlSLSvkxfhIvFyferO64DhrgqZucFibbh2gfU1fY5HuPZ3YoNWtEzJtGwDHPv4h
         dRsa1Y/zhp5XF2sR9bPRIR1MoFeOpMppwN6IMVpVbGE2w6KTIr50Rjp/xWQA8HbKDu9P
         +4sbXRqKp9xR58VGthe5qhQgqeIJKmiPO8Dl/n6DVHAvfpEGwf2ndbu7/CW0P1gI/w+k
         v6PLtXviLjN3D8AMxbIubaMBmtQrrJJL7u1sIW1Pgwq0uytJuvPR+TKFZ4+P19rMj1Xg
         x/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697580; x=1728302380;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vIEJMiqmSBTZ/FiAO2g/0mH+P7xBgHAYPgSV3v/hQKo=;
        b=txLm7n5xtNKUaI3Irg3yraYljcYJ1Z0xlCfyTW5bgEum1SoWi8Xyg+tQ0u4mLWv3rW
         ns9tzP4hnd1ltxxMvM4+pZ5Cl3FVspvfY8rCbIC475STzf7sfhe/UULXcC+Uku5r+Cvj
         VOKceqOnQrp4PB9u+vKHPCD46b9bXUhLcEz9/B+UZP6hw4CcQDBbbxYitAWeNdLdRe7m
         LqvIXfHhdeSgmjuoWtZS75CkbegJ9ijhlj1DZJZBCAkhNhB9GKxpWFvR5D0IBt3jeDwd
         3riQgxoXwEZfdbPPZYSyGRRpEdiCXTYn1B9NwLrwmKI2lYkSc7vGeACu3BT40ZOTSSSy
         zN7Q==
X-Gm-Message-State: AOJu0Yyk9tdecYe74jfCMtC8se1mcCQ78SA+lBvprWYa8KCz4Bc0gW+t
	8STALdTULJ6Aes15NMbFvro+HjKyLEGWBOCs52MgVJwazvcZgMghIFy+JpKMgmFAsTWQjFFbZls
	=
X-Google-Smtp-Source: AGHT+IFFXsK+mXcA0Bqcml1G+O48fs/M7FJDVXEFiIfS5lnYrOedoKnMtIKgMqWAenOV1BTwEcIDFw==
X-Received: by 2002:a05:6402:500c:b0:5c2:5f31:8888 with SMTP id 4fb4d7f45d1cf-5c8777e7944mr19342402a12.15.1727697580318;
        Mon, 30 Sep 2024 04:59:40 -0700 (PDT)
Message-ID: <0e31ed35-1dd2-433d-9c15-b851afd3bc0f@suse.com>
Date: Mon, 30 Sep 2024 13:59:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v6 4/5] x86/cpu-policy: re-arrange no-VMX logic
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <88b00dbf-b095-4ce2-9365-2a195ca0d65c@suse.com>
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
In-Reply-To: <88b00dbf-b095-4ce2-9365-2a195ca0d65c@suse.com>
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
@@ -744,19 +744,20 @@ static void __init calculate_hvm_max_pol
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


