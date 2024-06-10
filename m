Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9947B9024D2
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 17:00:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737346.1143602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGgU6-0000z8-91; Mon, 10 Jun 2024 14:58:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737346.1143602; Mon, 10 Jun 2024 14:58:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGgU6-0000wy-5P; Mon, 10 Jun 2024 14:58:58 +0000
Received: by outflank-mailman (input) for mailman id 737346;
 Mon, 10 Jun 2024 14:58:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mjq2=NM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sGgU4-0000ws-HZ
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 14:58:56 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4a313c9-2739-11ef-90a2-e314d9c70b13;
 Mon, 10 Jun 2024 16:58:54 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a6f04afcce1so233246666b.2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 07:58:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f0ea2d230sm303163466b.28.2024.06.10.07.58.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jun 2024 07:58:53 -0700 (PDT)
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
X-Inumbo-ID: f4a313c9-2739-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718031534; x=1718636334; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FiLoIBjOFubDY1li5qS1G1hfyqoewCi9zr062S3gC8E=;
        b=Bi9OwoDfIHIv9ZnKcsKIgcYfvQfrGpzUsUok4Ki21LdRdka56iuaPhQF/ljAE6wlmP
         wapgi0YDrS53PdzZGajBzS1vUvYGs2QBGRmDik579I+0/YbS4wADtTQUf8BImZY/16db
         ixQ5bWKE5AxX4a/UgB2LmGDHx2xQrVRXbR+UfkI5SjkjvX2UVnZl5as7pZd/6LILULcy
         zHPavhlwY/s1ZTbzU3nDmYLXTyX9Xt5cr562MUYyyaGCpan41wocPoMM2A03wDpIxDwA
         oitFqwDEDZplalOgYJ3t/Lq+pS6/nBhgNvvWML00vggQG91oi6O4YL7wQxxJVyJ2WBWx
         zILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718031534; x=1718636334;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FiLoIBjOFubDY1li5qS1G1hfyqoewCi9zr062S3gC8E=;
        b=Al8fyiLJCrpm86Kh9ZvaH/8/ECHNQPN3+gTiZnfWFR2LeSwOI9DKSpTFV4BeKJUGER
         yYTHSmG8bUEMkkMoHFEK1VndZ2GaPV4BWtuEyu5urQyWkdAnhcfhvrJwTDpYp6rsTITO
         RtaxZGt4zIma0ypYXH4GG3SnARXg/B4toj2N4RYw8+x69v0YdJBDjWtazVSQCeLfS1Ze
         ogp9ovHrFB4XTQw47NgOx8UaITmlBQk2dv2BBAYy3K8QZ/l549p2EESCDevDOrp+GLZu
         Pkdr6sKhtEAHjz5gkMwkcz22vMe7E5ifePkKe52ssbMZHsTzRjYHbUWGjOdQlzAN/qXx
         +OOA==
X-Gm-Message-State: AOJu0Yye6+7MVy8wEn5mUrADanOG3grORlYfTFKBAJH0a1609UjyjQih
	ArVIPTD5zv+sAHAXdtq2FsS2C2/nMEeNbh/b/j2sDdX0JHO1dfnN53AQx+O6OVU9kqcYNPJZGjs
	=
X-Google-Smtp-Source: AGHT+IEiqYVs8B4tfCt3b7EqMPA9pWdgBz02Rhkib0Mf4VZ+cBostXPcBIpa3U2iO1VVlqwDr9iYtg==
X-Received: by 2002:a17:907:376:b0:a6f:1541:e8d5 with SMTP id a640c23a62f3a-a6f1541e9d0mr339055766b.23.1718031533774;
        Mon, 10 Jun 2024 07:58:53 -0700 (PDT)
Message-ID: <56063a8f-f569-4130-ac25-f0f064e288a1@suse.com>
Date: Mon, 10 Jun 2024 16:58:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/EPT: relax iPAT for "invalid" MFNs
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

mfn_valid() is RAM-focused; it will often return false for MMIO. Yet
access to actual MMIO space should not generally be restricted to UC
only; especially video frame buffer accesses are unduly affected by such
a restriction. Permit PAT use for directly assigned MMIO as long as the
domain is known to have been granted some level of cache control.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Considering that we've just declared PVH Dom0 "supported", this may well
qualify for 4.19. The issue was specifically very noticable there.

The conditional may be more complex than really necessary, but it's in
line with what we do elsewhere. And imo better continue to be a little
too restrictive, than moving to too lax.

--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -503,7 +503,8 @@ int epte_get_entry_emt(struct domain *d,
 
     if ( !mfn_valid(mfn) )
     {
-        *ipat = true;
+        *ipat = type != p2m_mmio_direct ||
+                (!is_iommu_enabled(d) && !cache_flush_permitted(d));
         return X86_MT_UC;
     }
 

