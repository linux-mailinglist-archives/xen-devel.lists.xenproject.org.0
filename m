Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A057D99652C
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 11:24:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814042.1227128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sySv8-0005vc-Qk; Wed, 09 Oct 2024 09:23:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814042.1227128; Wed, 09 Oct 2024 09:23:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sySv8-0005tu-Nf; Wed, 09 Oct 2024 09:23:50 +0000
Received: by outflank-mailman (input) for mailman id 814042;
 Wed, 09 Oct 2024 09:23:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5PZ=RF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sySv7-0005to-TY
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 09:23:49 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30cf13b0-8620-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 11:23:49 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a995f56ea2dso419663666b.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 02:23:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9943ea4936sm528286466b.174.2024.10.09.02.23.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 02:23:48 -0700 (PDT)
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
X-Inumbo-ID: 30cf13b0-8620-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728465828; x=1729070628; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4/p9q6zzF3dEdrk0EDrk/Q8JWw7Bgak8AAujM54KwSo=;
        b=KocezMmJwmuWu9jemXbqvK6UqY1X2oMLBqa/2JedK3zZVgmHc0wT7QkfqkzuUzJzEx
         DoGs14IfQn/F0oxCrd1zXqLpS6M5VhyM/E3kQ9eZ55gQ4YmjfXPZgE1f1MbEbb2IYxbB
         r7V3CL7j5rCh97wbTADBmK6FgYRiHgswNx7om2WfMBcFsY1yMpVWHSS1F8J/IznDkeBm
         4quQ8hA1X+kvsFUf/gEg+Bp11Xq4+n8K9FwQ4+Tdf7nDiOgv1U08u9ynb237DtcXtKvP
         XkB7w4PQ5kuWoCu+ehGhwXLPa4JEDMbuVAnLtSDwIKzDtm+/B9IHrlm0JnT18QzwcUyw
         nqcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728465828; x=1729070628;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4/p9q6zzF3dEdrk0EDrk/Q8JWw7Bgak8AAujM54KwSo=;
        b=D4clKHsosa8y4iASuZKqUWoMnkPhfo0jVfvAqw2QgdY8sZFg//E6QRvF/4G3Yf2oIS
         YJaKj6mHF73p96aSoeO0srpp8jS2IzDZRIEvl1guWLEkcaJ6uXTwiMgf37isDFqK244h
         nbxOGIpL7NISOebw3swh0NTUrKI8UUBCjnOdd5Q0Kn4UD7763/7VtogYZhdhKv/DERLJ
         gDQ2XvkxTn4ki57R573B8aSlB1HCuifCWfoqEhEzwsgz2+PcjKnK/mCoy4imtO1SaOFS
         pbgSOAhNkQC3K1X7g3KviCXzbC2igFPGaa6Gpg1cucH3yO/czyKAaZjEfRDatK1EdOyV
         UKIg==
X-Gm-Message-State: AOJu0YwsT7F4ckU0XJmr8Wh7LlyYWgopRTUXPMya5kZeolBQJ96nekjb
	bEQtlJXTeZYSGlabVXSsYjnHnjItVsh1Qkfslb8h2o3/y2/1EFAclQ3x0vwg+DTswKrlkVEGetI
	=
X-Google-Smtp-Source: AGHT+IHYUMA03wMgqdCv4B2ttcqDQw/CpkrylMiuFbcdYfLc2ADuFOei/2xd8o7eBKuwzt3vUdxTUA==
X-Received: by 2002:a17:907:1c1a:b0:a99:2ab0:d973 with SMTP id a640c23a62f3a-a998d341895mr132202966b.55.1728465828372;
        Wed, 09 Oct 2024 02:23:48 -0700 (PDT)
Message-ID: <d419d19a-ccb9-4c39-82b2-44b2bf29e5f0@suse.com>
Date: Wed, 9 Oct 2024 11:23:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 4/7] x86: modernize swab64()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <17b6b894-9b41-4e8c-a3a9-ce837797eac3@suse.com>
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
In-Reply-To: <17b6b894-9b41-4e8c-a3a9-ce837797eac3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

For quite a while we didn't need to be concerned of 32-bit code
generation anymore: Simply use the 64-bit form of BSWAP here.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/byteorder.h
+++ b/xen/arch/x86/include/asm/byteorder.h
@@ -10,17 +10,10 @@ static inline attr_const __u32 ___arch__
     return x;
 }
 
-static inline attr_const __u64 ___arch__swab64(__u64 val)
+static inline attr_const uint64_t ___arch__swab64(uint64_t x)
 { 
-    union { 
-        struct { __u32 a,b; } s;
-        __u64 u;
-    } v;
-    v.u = val;
-    asm("bswapl %0 ; bswapl %1 ; xchgl %0,%1" 
-        : "=r" (v.s.a), "=r" (v.s.b) 
-        : "0" (v.s.a), "1" (v.s.b)); 
-    return v.u;
+    asm ( "bswap %0" : "+r" (x) );
+    return x;
 } 
 
 /* Do not define swab16.  Gcc is smart enough to recognize "C" version and


