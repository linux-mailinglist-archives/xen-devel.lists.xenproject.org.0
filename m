Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0590923ABC
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 11:53:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752175.1160308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOaBt-0006Y3-Lk; Tue, 02 Jul 2024 09:52:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752175.1160308; Tue, 02 Jul 2024 09:52:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOaBt-0006Va-IJ; Tue, 02 Jul 2024 09:52:49 +0000
Received: by outflank-mailman (input) for mailman id 752175;
 Tue, 02 Jul 2024 09:52:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WXFQ=OC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOaBs-0006Mf-CT
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 09:52:48 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5c80c31-3858-11ef-a59d-41c015c667e1;
 Tue, 02 Jul 2024 11:52:46 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2ed5ac077f5so47366021fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2024 02:52:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c91ce74143sm8335506a91.27.2024.07.02.02.52.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 02:52:45 -0700 (PDT)
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
X-Inumbo-ID: d5c80c31-3858-11ef-a59d-41c015c667e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719913966; x=1720518766; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VBnX+/6xKiRjRhYUk2OK7XDquzH63Fev2vip1fFNQ0g=;
        b=N/pjRku4unzKGj+ToWAM1LwGxASPFFTYvHPTFrHyiYtPV0o5BofZF98cyAjV077bI2
         c7lpDcouhXNFiUJqz+5UAmu4K5whQDbHx1LMgcF1OvoTfMlXQN+mm3SNHoc2xoJu18hP
         ZriUx2zRnUiR7zw7FQ9Z/z2nybNWvBCiAoTyzKM8e7jpai9pH/29fJ1FVWbVyao6P6t7
         BvvoN1/0+xfKRiDom6zS8m5bBQj4ZKCqs/plZZSFQP0PFA8aLKFFr4SOsY+7nSHK3HpN
         dbwG/ORTcnlaYUrStc4myy42ST3rwPoo9GTmM4mBAPTXF4f2U1aVYIzfVs67f1CsNm0w
         RI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719913966; x=1720518766;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VBnX+/6xKiRjRhYUk2OK7XDquzH63Fev2vip1fFNQ0g=;
        b=nb+rf3DVo0Pqfcf1UZx6VTZZqY9PRkTnn9fzEA+G+UAHPSC0tihAr1SBPJaFUXVM/7
         bI5MtZtmQUGVecn2YDJw1DL1zqJwvpaFwY+KNdIfa/G7oLumjlTEX+Z/tmpqFKcgZ2Pk
         6evrHrIa5lGnYFBr8x07ux/q6RDN1qcdqVqawohfHK7zRncU6IKTOZsgvz9euLQkY4sD
         0mRn0TTTjH8FBbInlqwtk+5cREetMsK1Mmjqs4qGuaAAzezLa+QHz/LRVt9yUubZ+9pQ
         zhlpKNbXRx76mnjQkgPNl+fnuLykdVp0wxFvkXCtjZenQt7pqq+cCJ+Kc/7MA1hGoy4b
         rqXg==
X-Gm-Message-State: AOJu0YyigEKq3xNQq7F7Suv1Ng5DXLOPBrElBXomeU0OWfMCD1H7kpgm
	grICUUyABGvjoMVxens2bPs81T+V6OLiWBi7xXTWtj+n7cS5E3UiVsNdPTK5MGoe96ugWKlgh5U
	=
X-Google-Smtp-Source: AGHT+IEUH28Gz5xnXXUx/qzd6MW8bOSAS/W1n595bfE4XxmfPpYtjztY6wn6swH9magR0Myz5taPEA==
X-Received: by 2002:a05:651c:4cf:b0:2ec:5921:bb21 with SMTP id 38308e7fff4ca-2ee5e3594f0mr57341331fa.10.1719913966250;
        Tue, 02 Jul 2024 02:52:46 -0700 (PDT)
Message-ID: <e95ea1ea-dd11-4994-9d50-308db4c3772e@suse.com>
Date: Tue, 2 Jul 2024 11:52:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 for-4.19? 2/2] cmdline: "extra_guest_irqs" is inapplicable
 to PVH
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <03f6674c-f2d1-4ec1-995e-a3e25278ceac@suse.com>
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
In-Reply-To: <03f6674c-f2d1-4ec1-995e-a3e25278ceac@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

PVH in particular has no (externally visible) notion of pIRQ-s. Mention
that in the description of the respective command line option and have
arch_hwdom_irqs() also reflect this (thus suppressing the log message
there as well, as being pretty meaningless in this case anyway).

Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Since the EOI map physdevop-s aren't available to HVM no matter whether
the PVH sub-flavor is meant, the condition could in principle be without
the has_pirq() part. Just that there really isn't any "pure HVM" Dom0.
---
v4: New.

--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1178,7 +1178,8 @@ versa.  For example to change dom0 witho
 hardware domain is architecture dependent.  The upper limit for both values on
 x86 is such that the resulting total number of IRQs can't be higher than 32768.
 Note that specifying zero as domU value means zero, while for dom0 it means
-to use the default.
+to use the default.  Note further that the Dom0 setting has no useful meaning
+for the PVH case; use of the option may have an adverse effect there, though.
 
 ### ext_regions (Arm)
 > `= <boolean>`
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -2669,6 +2669,10 @@ unsigned int __hwdom_init arch_hwdom_irq
     if ( is_system_domain(d) )
         return max_irqs;
 
+    /* PVH isn't constrained by the EOI map. */
+    if ( is_hvm_domain(d) && !has_pirq(d) )
+        return nr_irqs;
+
     if ( !d->domain_id )
         n = min(n, dom0_max_vcpus());
     n = min(nr_irqs_gsi + n * NR_DYNAMIC_VECTORS, min(nr_irqs, max_irqs));


