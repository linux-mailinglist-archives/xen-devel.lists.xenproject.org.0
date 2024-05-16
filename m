Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E948C75CB
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 14:16:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723258.1127935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7a1Z-00044n-S9; Thu, 16 May 2024 12:15:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723258.1127935; Thu, 16 May 2024 12:15:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7a1Z-00042n-Pb; Thu, 16 May 2024 12:15:53 +0000
Received: by outflank-mailman (input) for mailman id 723258;
 Thu, 16 May 2024 12:15:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LYhW=MT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7a1Z-00042h-7W
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 12:15:53 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0923fe4b-137e-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 14:15:51 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-572e8028e0cso3318623a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 05:15:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5750d24c8c1sm559715a12.72.2024.05.16.05.15.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 05:15:50 -0700 (PDT)
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
X-Inumbo-ID: 0923fe4b-137e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715861751; x=1716466551; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vMEbeCF6PHmkPkmy8h6WYnlrDVpl+7aVfReOgi2GNOU=;
        b=gba97ilcJ6iY68r5EFLt4Q+EsirJBSGiwWbu8VEiEeFnGS40MKKUDwPhad6+d0A2md
         ee8uSAprQ/ftR8ChqT5SHdTsizpbiTKgeTmKelOLLDm0et/piMmz892rexOOlXYkWjZZ
         lPg/aFzRH4dYWRPmMnoxwAa/yVTFmZk/pESbx8WRLwI1XUnvjl32N/PYvZqpIfK3gZfc
         cL/eYAVIJItflDiz5R1d/YZSBzEhm1CuKQh/oqilzidybuZ9H1pAiO4udI/HQ8hbQtci
         2Ca5PB8zKO1AzvEeNrj0ZmMQLW4r2luhjHamYanG4bSuBZwr3V+cXGpdTXFCIuOzYozt
         A6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715861751; x=1716466551;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vMEbeCF6PHmkPkmy8h6WYnlrDVpl+7aVfReOgi2GNOU=;
        b=Bx+sO963RphrS2qg2yeIFq2TAG+ms8zY1teLu+SfPhfsdUpIJDXr2ezkwAH7wDVHzd
         7e2JELNtOaShKViFDKax05aN7pESWf6LQMjv+hmy31LKsk5gEthhGOu9QX6y9WhG88wM
         m6/YFLuqQQ6z7SnCHK8mcy99mIjghDOPKGc4kF1KVDtCoxoffxigghBb6VJR48EiTHH/
         LGTRIzYNplKagU3725BCa+CGef5/7z1xlvEdEomul2KrwxD5Z5K4BYItpOt64JVhy8DT
         Vo47rG5aRicTrpHLRSwKR/nAgtMjFd79bqviLxxa8LT9MVIwSwJ2+PDu9o60nPI6+0AD
         gwIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVA+Z60bEZgl23vzZ6xJ4LUWUSLhTWInnCv1PEzBkBBBBogKmnAhaCJUa4TE7KK/7tS1QUh00QXMZ13KJRlXuJe4boP0xVpvmN8caMBQKA=
X-Gm-Message-State: AOJu0YwU/hhrd7WulF2oXzZPTSw9B5ClSyHBWE8svBD/KzAwX7f14MXt
	TyFN7ombqNPLe2IqfNCwIHkpc9PmtHORj4fp8/PFgCwyN0ngtAjXVvsQamuYQQ==
X-Google-Smtp-Source: AGHT+IH3UOx9xjFVRVc8cnJmjwmPjB0cVB3acOyVHMSucv1SWNCFcMwBeirw1iiSKYMvP796Ws6UTw==
X-Received: by 2002:a50:8d18:0:b0:574:ebfb:6d93 with SMTP id 4fb4d7f45d1cf-574ebfb6ddemr4478343a12.10.1715861750790;
        Thu, 16 May 2024 05:15:50 -0700 (PDT)
Message-ID: <c43a554e-4b21-4a3b-92f4-60633f61f67e@suse.com>
Date: Thu, 16 May 2024 14:15:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 14/15] iommu/vt-d: guard vmx_pi_hooks_* calls with
 cpu_has_vmx
Content-Language: en-US
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
 <73072e5b2ec40ad28d4bcfb9bb0870f3838bb726.1715761386.git.Sergiy_Kibrik@epam.com>
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <73072e5b2ec40ad28d4bcfb9bb0870f3838bb726.1715761386.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.05.2024 11:26, Sergiy Kibrik wrote:
> VMX posted interrupts support can now be excluded from x86 build along with
> VMX code itself, but still we may want to keep the possibility to use
> VT-d IOMMU driver in non-HVM setups.
> So we guard vmx_pi_hooks_{assign/deassign} with some checks for such a case.

But both function already have a stub each. Isn't is merely a matter of
changing when those stubs come into play?

Jan

