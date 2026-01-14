Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC10BD1F1EC
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 14:43:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1203099.1518392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg19p-0001xR-8V; Wed, 14 Jan 2026 13:43:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1203099.1518392; Wed, 14 Jan 2026 13:43:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg19p-0001w0-5v; Wed, 14 Jan 2026 13:43:33 +0000
Received: by outflank-mailman (input) for mailman id 1203099;
 Wed, 14 Jan 2026 13:43:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81wl=7T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vg19o-0001vr-0C
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 13:43:32 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03153e08-f14f-11f0-b15e-2bf370ae4941;
 Wed, 14 Jan 2026 14:43:30 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47ee807a4c5so2789935e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jan 2026 05:43:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ee117e607sm23269505e9.3.2026.01.14.05.43.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 05:43:30 -0800 (PST)
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
X-Inumbo-ID: 03153e08-f14f-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768398210; x=1769003010; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jUEWqlGQFbFZZkXGuB5GSbnLbTvfhpgjhZFwTESoBRI=;
        b=bJMQHrZXMo/qTUu3fkeOwajH7CGznh9rPvgT+6MQ2fevO4EKkv/eMzVw+2AuRrVgA0
         fUfHhXoCnBq1BBEgbNTBls5Mqvx2pynu1qcx9hVVfmRC8R35PloZ5aSFP6QEjvmnJsMr
         Mi1wlcS5xoKtXfAObzH4J755hcqpvJL28txkukxp7MbaNc7ptzvjYqlmhkZMdQzaFwC6
         xEZH0Ts2Gyx1nIuy56/+HpPO7kIKLAHxfNsn+gpk/RQOOZFJ21Nx4PksxGucSbl0LFWe
         SD4tDjmc6pDXNzgrPIDP+o93KRewV5V9M11n86JLn163tXonQcWe7lwSScGeD+CSkbC6
         a0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768398210; x=1769003010;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jUEWqlGQFbFZZkXGuB5GSbnLbTvfhpgjhZFwTESoBRI=;
        b=KycN0IE5WfGWHucpt9syrl6U+3gKMTlahy8UsivchgXx3/tGQBTdI0l399XRqtvVLs
         kgXr25vi7oaQxsl/Lb7irjvcHBscVPxoDmmhIuBrCQCkuIKaj1jc1jl8nl81ILbUC1gH
         eH2oCtXnOIW3hIqUnrMftRAcYee0A9+k5GQjq+5ZJKFXvDwFT+K6Xv3c77DeONCieaOZ
         yqvLayxWAEpNpVTAUr+L0eaA7xIqBrDy5OI5ukvrp3Z0oy/XI5d3CkLn50l2HzTY0FgQ
         IhjqzWXOfTfoQHHpTHosL3OQnA4vZmSjRsD8n8eMzCypxzfQYv7U44HTeVPJHbDeWLnZ
         EyLA==
X-Gm-Message-State: AOJu0Yzj8mrOZ0RVbN1Yg/0oWyVejQxkDSg8TDXBVvJxxKQbH8CTItfV
	MTWo4fQkSXlN3SIFnxsbYaPLlBoaSj/Kbl3utzCrwcwKrbzV2U+3rEhHJL+yIjRG8+c10o/Houe
	2Y0Y=
X-Gm-Gg: AY/fxX6a4/oyS5in0SWDKKBmzPpNpjxWs3TScMhKMnC1mV4fsuHJJbLoQ7bOBaeu6nr
	25t0EcGpTs8PqUffZ+A4/ywwD1DJncPA7dvw+Yp7Uih05xw5b0KX2NRR96nBGagvh4tHKVvJh26
	Pa7FsDiFUxv9hNlYgM16eRwNTJeAe1XlqRzzkuSv8JTIcVk65tPnO2gNxyjxzpENmYfYIFBojGq
	hHK58cRUq1/eUb0yX9D/BDkoh5nd900Jzk5it/kPBM3Ihxhhdue33VArXrXZxffDgJbvzW/vPWN
	n4TjBdpM2NnN+fcl8MRCNNYkOUiq7Px+4XiUOLFvL3NbK8mSjT5A+gqMojo1D7oLIQ72Xiim8EJ
	+wIIC7bpAxDo6lWOx97FBeXbB1H0HsdB1PHBqf5dsY1PRK90TwcIFvyUsWTFHXphn0AT9et9+gX
	LQQaibMoORVoZgUrIrVmyk5Z3NpqxWHjgIA4wWLxEjCAGWDboUxR5XkCDcGYHyXFyN5qhvPAyjX
	J4=
X-Received: by 2002:a05:600c:1549:b0:47e:e946:3a72 with SMTP id 5b1f17b1804b1-47ee9816cafmr1874905e9.27.1768398210367;
        Wed, 14 Jan 2026 05:43:30 -0800 (PST)
Message-ID: <bc01618c-149c-4a70-996e-5364655b4ab5@suse.com>
Date: Wed, 14 Jan 2026 14:43:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 1/6] x86/cpu-policy: define bits of leaf 6
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <4d3a3576-2d3c-42ec-8551-18f1f0982e17@suse.com>
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
In-Reply-To: <4d3a3576-2d3c-42ec-8551-18f1f0982e17@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

... as far as we presently use them in the codebase.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Or should we make both parts proper featureset elements? At least
APERFMPERF could likely be made visible to guests (in principle).
---
v3: Use SDM-conforming names. (Sorry Jason, had to drop you R-b once
    again.)
v2: Use bool and unions.

--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -121,7 +121,46 @@ struct cpu_policy
             uint64_t :64, :64; /* Leaf 0x3 - PSN. */
             uint64_t :64, :64; /* Leaf 0x4 - Structured Cache. */
             uint64_t :64, :64; /* Leaf 0x5 - MONITOR. */
-            uint64_t :64, :64; /* Leaf 0x6 - Therm/Perf. */
+
+            /* Leaf 0x6 - Therm/Perf. */
+            union {
+                uint32_t _6a;
+                struct {
+                    bool :1,
+                        turbo_boost:1,
+                        arat:1,
+                        :1,
+                        :1,
+                        :1,
+                        :1,
+                        hwp:1,
+                        hwp_interrupt:1,
+                        hwp_activity_window:1,
+                        hwp_epp:1,
+                        hwp_request_pkg:1,
+                        :1,
+                        hdc:1,
+                        :1,
+                        :1,
+                        hwp_peci_override:1,
+                        :1,
+                        :1,
+                        hw_feedback:1;
+                };
+            };
+            union {
+                uint32_t _6b;
+            };
+            union {
+                uint32_t _6c;
+                struct {
+                    bool hw_feedback_cap:1;
+                };
+            };
+            union {
+                uint32_t _6d;
+            };
+
             uint64_t :64, :64; /* Leaf 0x7 - Structured Features. */
             uint64_t :64, :64; /* Leaf 0x8 - rsvd */
             uint64_t :64, :64; /* Leaf 0x9 - DCA */


