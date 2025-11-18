Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE721C6A359
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 16:06:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164920.1491778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLNI2-0002lw-Kf; Tue, 18 Nov 2025 15:06:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164920.1491778; Tue, 18 Nov 2025 15:06:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLNI2-0002jW-HE; Tue, 18 Nov 2025 15:06:42 +0000
Received: by outflank-mailman (input) for mailman id 1164920;
 Tue, 18 Nov 2025 15:06:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=maYy=52=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vLNI1-00026P-8g
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 15:06:41 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2eefd324-c490-11f0-980a-7dc792cee155;
 Tue, 18 Nov 2025 16:06:39 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-64088c6b309so83849a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Nov 2025 07:06:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6450e8d1a23sm884342a12.15.2025.11.18.07.06.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 07:06:38 -0800 (PST)
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
X-Inumbo-ID: 2eefd324-c490-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763478398; x=1764083198; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jMn/cyVZqsuQaGJk1ULIzcL8rHs+FxB5cgoYXyQZKyQ=;
        b=LUK24N/KS6snkn36PdfgEimuDxbVLqX5+iAtsqOXsG9lQPTh0NKZABBlZj3b6HcbW9
         rtbdt5sWr2i7c4awPQ0+E0/5ce0gsbKawqxCC5cC29pY9sWWf2g2taUGcRWlmy6lIjY6
         88C5aj+u0y8NBLDthdnnaV7WkOAOkAzqtJUJabK2b/lnCnnCePR8XBZRB+pUAJrAnm/D
         K/29ViAvC8y2opi08T3SsXBeEJ9t+sE6bjoHDHVNHDrLxG20MXZ5uG6hXkuG5UBCiGhD
         3iaml9HgWX6JR1xezqT3tvX1w/5BTeSoo4GTj8nIkyBTa1QndFvA7lLNgHXv0WuHdUuB
         R/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763478398; x=1764083198;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jMn/cyVZqsuQaGJk1ULIzcL8rHs+FxB5cgoYXyQZKyQ=;
        b=tLh6EJDukfv0+qMO3GY7hBHFsCE0Nj5PpkF8sP8QRMvO1IlPVyQpqem0TpIqRX35gi
         yocdhpd1ck1tLArngG6pvbqJ2PjQw+CdqhOLzZganc7QjrEPRBPA9PQATN2nBJbuSy5Q
         WZb/kxvFDGwZZsHg0JAmmQ2jLrgVi9EJAKZ7FiIB5/BrdqkcpoQC1kpqM6EYt802ZXtM
         /Gq350ydq+K4X6ZRRjOdQVlQtTxpzedN6PCGl9/AH+u2TY6XPthUbvn3v4xE9sgijMpH
         fmSFQcsLQ9ZUVYytqHtzIQLxuIQmiCLM/FuA+FGhTceJp0JnqG/CvyCNdZ9W35OENx9k
         fzUg==
X-Gm-Message-State: AOJu0YzJT2TB2a+fWs+i04G+pg85m1xH3J4FwB9e/TBXIrd5A1+yvVt1
	pp0YEPte6ERW7LaXbNDl7VKwJfYm0vToeImOFuIpasaP0WdFzaaeP819FZCAYrdpgQwQLczxFiJ
	B7zk=
X-Gm-Gg: ASbGncs5lJpA6BFbxHuikPS7DLNMVUD85NjwANq9Z5mWHYnU8TtZCzDkgPzaGi0acxR
	TedVwhu+T/NsXhgF5UmIxjpQ3tCGZ7p5p5RntpqbUxMmLsdNz2Qsrj4g8GWiE3vuULGoKOsUacH
	D2sgfd+r9JQ436moosbnC4KFg17h71TYiz8WdCLfC7HYAHQ8SIE+FfIjiDeqr+rhW11hH4k9jET
	6KzCCIBk6TMyk4QAjXUJqyQY0sJox3MsKonsqHyfZ6IWUDpE9gOQ/w2hFG0TKm3ROhcNSVeT1A9
	TECg802iqeRvFgwV15thmwdHDu5E8upz2iyW7kvsUhW39zajNG8EwqddIXPpR3cJJ0qcwW4i+pH
	yf1tssaPQkPaeIAFem3K5oDoFo9+fNPTUT2qGFZwbNZfRy/MOE2OUppSdFcRnyE8F0J2WYhGDl3
	Yk0aQ4Ny4CWm+tcUwSPfcCGaasiOoVqAvh02UVC8Sq8XrqkEisekf/naPzsy5Pd53WrcIgyD+9e
	HUoBlTPvTIrgA==
X-Google-Smtp-Source: AGHT+IH0eHnKFf6D2JbGKosKLvylnTF5ltnaGgh2liPP4o8m65DsinatQ4lDiiGASIXW6vchOw0soA==
X-Received: by 2002:a05:6402:27c8:b0:640:80f4:3914 with SMTP id 4fb4d7f45d1cf-64350e89eabmr16635900a12.19.1763478398511;
        Tue, 18 Nov 2025 07:06:38 -0800 (PST)
Message-ID: <6525306d-aebd-47a2-b17f-918d7989798a@suse.com>
Date: Tue, 18 Nov 2025 16:06:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/8] x86/include: de-assemblify cpuid.h
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <53ef6c9a-1115-4bb4-bb7f-e2595ab9d0b6@suse.com>
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
In-Reply-To: <53ef6c9a-1115-4bb4-bb7f-e2595ab9d0b6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

There's nothing in that header which assembly files would need. Arrange
for cpufeatureset.h to be included directly by cpufeature.h in that case,
allowing respective guarding to be dropped

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -10,7 +10,11 @@
 #include <xen/const.h>
 #include <xen/macros.h>
 
+#ifndef __ASSEMBLY__
 #include <asm/cpuid.h>
+#else
+#include <asm/cpufeatureset.h>
+#endif
 
 #define cpufeat_word(idx)	((idx) / 32)
 #define cpufeat_bit(idx)	((idx) % 32)
--- a/xen/arch/x86/include/asm/cpuid.h
+++ b/xen/arch/x86/include/asm/cpuid.h
@@ -3,7 +3,6 @@
 
 #include <asm/cpufeatureset.h>
 
-#ifndef __ASSEMBLY__
 #include <xen/types.h>
 #include <xen/kernel.h>
 #include <xen/percpu.h>
@@ -50,7 +49,6 @@ struct cpuid_leaf;
 void guest_cpuid(const struct vcpu *v, uint32_t leaf,
                  uint32_t subleaf, struct cpuid_leaf *res);
 
-#endif /* __ASSEMBLY__ */
 #endif /* !__X86_CPUID_H__ */
 
 /*


