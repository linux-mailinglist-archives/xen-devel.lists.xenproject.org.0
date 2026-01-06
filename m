Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8287DCF8ADB
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 15:07:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196202.1514077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd7ip-0004ps-HE; Tue, 06 Jan 2026 14:07:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196202.1514077; Tue, 06 Jan 2026 14:07:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd7ip-0004nw-EB; Tue, 06 Jan 2026 14:07:43 +0000
Received: by outflank-mailman (input) for mailman id 1196202;
 Tue, 06 Jan 2026 14:07:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vd7b9-0000Ic-6G
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 13:59:47 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4ca02ae-eb07-11f0-9ccf-f158ae23cfc8;
 Tue, 06 Jan 2026 14:59:45 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-43246af170aso568541f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jan 2026 05:59:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0e1adbsm4682325f8f.17.2026.01.06.05.59.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 05:59:44 -0800 (PST)
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
X-Inumbo-ID: f4ca02ae-eb07-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767707985; x=1768312785; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YfooQE8xDDthz+4K3ntwahmx+kDJ4t+nLpvD3J6Xa0o=;
        b=e7rChalbrBiJP+j9GJJPJ2BQaMW1HkbgnHdbWigWbU9nSZpOw1ZsmdDkcCuyYqQC2M
         xFQKrloCycnZDh6Dgc3QPn8iremNvSMgTMAQH8Q5n63gVxd+D2reXM4HnggMEINQxkQO
         jlGyp9AvrXaii/mEp77ZwQzc1LHVl2ls7PCfoOKuc1XOmgW2mjsJtAeiCiQQMSxZo1Mh
         vjOvF1HkzxmlgMOuYdMkDa6huWG5LjSdDuqxjlQCrDiwpUNu1ZlWSNcqVOgGKz8gb9B8
         WxYYt/KsTC+5dupwqPG7YLQR9AH7Db6FYYMTIxMc7FE0AsXJGwBXedw69Ubc6orH8TM9
         BcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767707985; x=1768312785;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YfooQE8xDDthz+4K3ntwahmx+kDJ4t+nLpvD3J6Xa0o=;
        b=FXKPwHtUiBpJKqMOU9q6XQYA1SOBIiWGnNdcBVIjvZc7T/GdqFotbAGnaqYHrdhNMJ
         02bnmuiQ4meCL+ILUstt0jIFEuJyLfUMLT6jpCbI0R84kJru3gqEEVAL0jIrRPp+Redh
         UW8nnF7e2xDwxHhcEI44YxIWQlWMLRQDFukh0VHjhm50mPELsF1gbSK9aoLRk6zxzGLP
         rWf8fB3YZ+nBt+6tME6z2nYTwxGTm5bjlYmBUBJLobZEG3HqT4O5Vzvv67GLcP18aSOj
         EiEJbU0pUYow+QbDTGfZl2hyLio53t1SNdm5nCeOHE7ZKcMvCBn6WhKwVr0xKZ3wFgso
         tZDA==
X-Gm-Message-State: AOJu0YzYA49csU5lKNje6oibCi0g5UV1CVw9/ZsM2QsC9e1Ob8Iv0Ax2
	WVbD56ZHBPR2ztqDQNxuu1hkfVnwSLNwtqjWnMgZCJtMWwRUwXhfwXz8fGUrqYzchgekbzoGd2Z
	8yto=
X-Gm-Gg: AY/fxX4m8Ab3Je0aioVdib5GfWTjVGOQjYl53bGugfyjNyqLuhQ0H4aJ6l4wPQz2Uq4
	vEcso6wDPN3nROJWRTJpwrlq6jhEmNTW8CB1PqZn6ELU2AmpL+vn8lfSehTAv6hZqxPDhG0td2e
	L1NZF8aGpp1mNru8/eqVw+G0cjHvp5ySvoHlKdPy8HNGsMPHzjN4clkZUIEX29fIU1cT/o0OI7c
	gcCTzsyr8RrJZvkx7v7mmVjuq45Jmi+CUZCWl85Xlbi0DHdnQYEgIc+5iZw1NJuiqQQwVycyBvJ
	GZQeikjYuvxtQAhuUZ1th+4NowL9DHYy+IYW6Op2Armyc1dUz6GT9FC/eeqLTU9I+Lc5TnGRhlB
	yURW32o6sRcsB/QG2bkRtOgqazFkso+6u4JAmDAW5nWCHrWYrsKNn6K697q0EMf3T8V5pXpSa5v
	FxB9v/67twuPyHxqfOkWJFec0Y8EMJwkFP2PvIX8dIwkni5KIO7H2EVYiUgJnaYr+fDEZ5bwOL+
	do=
X-Google-Smtp-Source: AGHT+IEmEb4GNZ4LQani0gWmVmOvIO6J/jf0qV6+//ns/nO7VSMpuKJYFdNvqeudPiMcRiJv0q4/7Q==
X-Received: by 2002:a05:6000:430e:b0:432:b953:b02b with SMTP id ffacd0b85a97d-432bcfd3d7cmr3819280f8f.16.1767707984860;
        Tue, 06 Jan 2026 05:59:44 -0800 (PST)
Message-ID: <79c32e1e-15d6-4b9a-9645-1429a21e63ec@suse.com>
Date: Tue, 6 Jan 2026 14:59:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 4/5] x86/time: gtsc_to_gtime() is HVM-only
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <66a53368-9c33-436c-858e-2b2d25ae84b7@suse.com>
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
In-Reply-To: <66a53368-9c33-436c-858e-2b2d25ae84b7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Omit the function when HVM=n. With that the !HVM logic can also go away;
leave an assertion.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -2840,14 +2840,13 @@ uint64_t gtime_to_gtsc(const struct doma
     return scale_delta(time, &d->arch.ns_to_vtsc);
 }
 
+#ifdef CONFIG_HVM
 uint64_t gtsc_to_gtime(const struct domain *d, uint64_t tsc)
 {
-    u64 time = scale_delta(tsc, &d->arch.vtsc_to_ns);
-
-    if ( !is_hvm_domain(d) )
-        time += d->arch.vtsc_offset;
-    return time;
+    ASSERT(is_hvm_domain(d));
+    return scale_delta(tsc, &d->arch.vtsc_to_ns);
 }
+#endif /* CONFIG_HVM */
 
 uint64_t pv_soft_rdtsc(const struct vcpu *v, const struct cpu_user_regs *regs)
 {


