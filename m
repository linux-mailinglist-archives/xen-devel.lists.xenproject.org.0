Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B44A68B40
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 12:22:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920298.1324509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1turUj-0001ls-Bh; Wed, 19 Mar 2025 11:21:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920298.1324509; Wed, 19 Mar 2025 11:21:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1turUj-0001jR-8e; Wed, 19 Mar 2025 11:21:57 +0000
Received: by outflank-mailman (input) for mailman id 920298;
 Wed, 19 Mar 2025 11:21:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBEQ=WG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1turUi-0001jE-6X
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 11:21:56 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5cedb4fa-04b4-11f0-9ea0-5ba50f476ded;
 Wed, 19 Mar 2025 12:21:55 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3914aba1ce4so5450592f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 04:21:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb7ea16csm20521287f8f.82.2025.03.19.04.21.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 04:21:54 -0700 (PDT)
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
X-Inumbo-ID: 5cedb4fa-04b4-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742383314; x=1742988114; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sGPrnd2vlmGT8n0QXBe/mY/Eqv5A0o5rjVNbOyp76hI=;
        b=C1NP3LpSjuiJIzMFkymRjzWSijthFMkMtLbm8DvfD864mAuX6cfHpCCCdQ2LEVVvzL
         TyEXkHyUFLcBc5z+L+gTGFq/43UKHrXLWepkMoBFleYRTDJxDcdSWMH6Tzc9ZhnyRr4X
         a5DpfGJ7tsYyTO1BbFw2NHngTgMXJ5ZJmJLqLYbvSvyNaamVQEXlDiKGcXbrRouepqOX
         F+tLhT/4Mzdw5Vf/YJ/xCypU9U4yQgzg/A1u+npP9TXEGvEt0cFYZi6bE5cnHyo3vjYM
         l6T9y44Y+5VFjcBoYkV4UoVoNJV0yNRUXF+S1YjQ8M36SVyrRYh1JuGJan+tgm0WIV7D
         b+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742383314; x=1742988114;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sGPrnd2vlmGT8n0QXBe/mY/Eqv5A0o5rjVNbOyp76hI=;
        b=P3pj67Vknaj3n8LyJ9l1KlxWhnjJFk7SaQx1YCSduujiWsFZsArRzF5KfOrl38qJS/
         wUFOIKXpxCp3IMBl2pM72PaaDShHEFjuB90D9pBqBG0LMMEvKPAoCTAR7eRPO0iEJWSh
         V9TjeElAN7TFDe8EiMH2Fyie99NMlyjqGs3XT5Q/kWpEACS7KzuIA+7+etGJta8bE///
         gd8S5JpUQIVCFtXlxPgaFeaVBl/lvlztaxQU7jhou9FBDoPLTwnLHDEk3W/yMpX5RYhC
         pzIDpdofs5iFUKbtHLjXh1TF5J0tSKnM4c6bM2hb9FCNgab1NyHymVAKQTWG6fHybHdV
         BSkg==
X-Gm-Message-State: AOJu0YyKg3KNj+gqzFUbGpzmRuiSXj8dSAxiVk7dAUy9v0d5jUo6zw5Q
	XI252swaXPLauQ2H5Af0Ejhp42Hu50gqHZa95FqmYWphHI6/GOmPFvfHMKM1YxC+/qg9NYeoykk
	=
X-Gm-Gg: ASbGncsxBiJjyMsEtuEYigiGQvk+2gYc6yY4Y1iGcwMCNxAloefMbKTi/9W858PThhz
	3xR0mH9mONzdMo++HM/2CPoY4aHViyeGXETbgrDhttpkS3i390FUBgIacbye9ZOiatigh0YwQZE
	mEOUSWTXYvkcFRwagyepbto92w+fsVXCiHeoUWD+n3aXnt+VA5hErS9/vAvJaTpdbal3jl+DHqA
	dxU9tkef6uVSIuCj39Vq9EravOghx5Iu9fMrY2GtsGOEUtrjXfgTyVBgWoOBH5s3NESq/tR4hBf
	LJfZ5BcJ2GmB6uGMYSMSubwLDkH5ktlxj9k1plYcJy8TlizH206O1zX21l3qtw2yziFLNSoHh3R
	Bgojithindq7q9B3OQOHSFgGPUmFShxSdRhHO95US
X-Google-Smtp-Source: AGHT+IFPIeRQN5d9q9BWej1prbAiPkyqlR+auSP68+OL2lYHPyz9Z/QiYn2yJDqIqGlFlFCg1E/u3g==
X-Received: by 2002:a05:6000:1848:b0:38f:4acd:975c with SMTP id ffacd0b85a97d-399739cab88mr1823771f8f.27.1742383314426;
        Wed, 19 Mar 2025 04:21:54 -0700 (PDT)
Message-ID: <f346b510-dbd1-431a-ad35-3f1b8fe76c58@suse.com>
Date: Wed, 19 Mar 2025 12:21:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/setup: correct off-by-1 in module mapping
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

If a module's length is an exact multiple of PAGE_SIZE, the 2nd argument
passed to set_pdx_range() would be one larger than intended. Use
PFN_{UP,DOWN}() there instead.

Fixes: cd7cc5320bb2 ("x86/boot: add start and size fields to struct boot_module")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1730,7 +1730,7 @@ void asmlinkage __init noreturn __start_
     {
         unsigned long s = bi->mods[i].start, l = bi->mods[i].size;
 
-        set_pdx_range(paddr_to_pfn(s), paddr_to_pfn(s + l) + 1);
+        set_pdx_range(PFN_DOWN(s), PFN_UP(s + l));
         map_pages_to_xen((unsigned long)maddr_to_virt(s), maddr_to_mfn(s),
                          PFN_UP(l), PAGE_HYPERVISOR);
     }

