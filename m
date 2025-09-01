Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 263E2B3E157
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 13:19:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104500.1455542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut2ZK-0006bp-7u; Mon, 01 Sep 2025 11:19:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104500.1455542; Mon, 01 Sep 2025 11:19:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut2ZK-0006Zk-4g; Mon, 01 Sep 2025 11:19:26 +0000
Received: by outflank-mailman (input) for mailman id 1104500;
 Mon, 01 Sep 2025 11:19:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ut2ZJ-0006Ze-CE
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 11:19:25 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8318963f-8725-11f0-8dd7-1b34d833f44b;
 Mon, 01 Sep 2025 13:19:23 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-afefc7be9d4so457308366b.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 04:19:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b040b1cf3c9sm490536966b.5.2025.09.01.04.19.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 04:19:22 -0700 (PDT)
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
X-Inumbo-ID: 8318963f-8725-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756725563; x=1757330363; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Gex2yXvgrD5HtPtsvpELTv/Gti4vtgegLIi5pNIK3O4=;
        b=d59zDxF3aBJMm+uXCU7ufGBL45hmTqM4jc7LWdKLx01K+oRNrnoMzWMdNYWktv7p7Q
         5KKv8bB0BgOiLaAQqf4majNL7D+orKzWm+tnZMBiEy/RQuoxbcmn/5+d+mZa/FjV+TDh
         rwGBdVQ5vm+sh/jMsp2Xn2qS8OZcsESVOBKr/vqcLDzt9tqy5DtKLn7FrOyEILgk+NE5
         P81kFiFpswN+hu0xkO9YhuJltwCcy3ixunuAHxeaF3WjzFRhHGq1dZ/eNj3J/z01ZAxz
         6WnLnLEnLx4esuA/9j7ppaUBfd6ZsMrDkK38Y854/h1FzYubOU/jMnZwIQKa5UQjFGmE
         hGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756725563; x=1757330363;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gex2yXvgrD5HtPtsvpELTv/Gti4vtgegLIi5pNIK3O4=;
        b=ekvfIesTy9luggF3kOGHvLEkJUqKcZdGKvib1RUgVK1+QbpSgnhNkNIZbvpJtmM3pX
         MwTEjUu/b6RnVeqMDrlBHEPA22zG80F44sN+3YUX2Xh0jjCmOqm42Z/6W3AB+BWRhFwq
         F2OK1o7kadyJn2zt/UsvIMT7bYcXit8CrTN1DpfaOtkxn2k38sOHC6+nqilmNFeyPZRF
         RAbPtwN2SYeAFI9af/vi379uaLC6j2/OnnpCASRa3C7hSq6VBKwBIrjJoOwZEZuufkzh
         TKNjhafz9HqrEFpFXloq7IwJ4JlgWobRgz3oQGRsKHrsWZeKzTwT/aaMllTmM4CXlssv
         1UTg==
X-Forwarded-Encrypted: i=1; AJvYcCUDHqS7u6PvgecX/pk2+0Mk9i/i3oZjVkwnZ6uIjiKznJAhmgJh14WPCFz0LgAAzzT34xRW6UVsssM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxvcK2YK1dbRNnxjpx6UY09fx8Pd3yrtzdbPjJv50IDh2zqLdF7
	Eb2c/7s7dwdgTskm2W5p+mjxg4fjLhEA5n7Vj81Rv/PNhGh+V1XRm1GNj9JGrJee2w==
X-Gm-Gg: ASbGncuXQoVBkL7V0ysWcS5v5AaFZhrWkZtMhquM686wppf1NsoBBd25b+h93HayHK+
	XGTHsqCXb2vMgI1jTC1dT1kMYhzwnYafsiC95e4HWmagyOcCif0oxa5RhEgoeQ8Sg6jsuMNw4s3
	r03nv3TBEeD8QrK9wGPNnv3Yp3Mn2cLoPikPZnZn7bEnT8SeCXhsPHs1sB039Y5jcy6r1IDJhXW
	WWtI13n+8K8OiveV/UqiTRWwYr2h/E1KmlMjB0SqgAgV2u3gJeTVJh4z+BG91r2gmHFwUnao74m
	CQBFzkyirDHb4yWOLg90pO/RaxpzrTP5lKvcOKeKv9wWViG567ZtnPPQ6iI6as6yu322WaeK30x
	h8WdJzQst6L+qQeJKsNh4IPkoIGL7e7HivBpCci44DCQz7D59bvSkGeKkfbv3qGJ3Isf9KCAe0O
	bI5Yfxu8SuB2SgAMdydA==
X-Google-Smtp-Source: AGHT+IH8LkR4yOxpn299cAOVAdwb5WNRrjjagcs6zb0mdXNkoJFyT+s2hOLBBoCxfJuTAnOi+sMd4A==
X-Received: by 2002:a17:907:3d0b:b0:adb:428f:f748 with SMTP id a640c23a62f3a-b01d8a72fddmr682364266b.21.1756725562611;
        Mon, 01 Sep 2025 04:19:22 -0700 (PDT)
Message-ID: <4012a431-0d1d-400e-a0f4-b2ece3439441@suse.com>
Date: Mon, 1 Sep 2025 13:19:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: Fix AMD_SVM and INTEL_VMX dependency
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250901104329.25693-1-michal.orzel@amd.com>
Content-Language: en-US
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
In-Reply-To: <20250901104329.25693-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.09.2025 12:43, Michal Orzel wrote:
> Commit e3ed540f2e9f was meant to make AMD_SVM dependent on AMD and
> INTEL_VMX on INTEL. Such dependency should be done using 'depends on'
> and not 'if' next to prompt that deals only with the visibility of the
> given Kconfig option. This makes it impossible to e.g. disable INTEL_VMX
> when INTEL is disabled (option is hidden).

Hmm, yes, just that ...

> --- a/xen/arch/x86/hvm/Kconfig
> +++ b/xen/arch/x86/hvm/Kconfig
> @@ -16,7 +16,8 @@ menuconfig HVM
>  if HVM
>  
>  config AMD_SVM
> -	bool "AMD-V" if AMD && EXPERT
> +	bool "AMD-V" if EXPERT
> +	depends on AMD
>  	default y
>  	help
>  	  Enables virtual machine extensions on platforms that implement the
> @@ -25,7 +26,8 @@ config AMD_SVM
>  	  If in doubt, say Y.
>  
>  config INTEL_VMX
> -	bool "Intel VT-x" if INTEL && EXPERT
> +	bool "Intel VT-x" if EXPERT
> +	depends on INTEL
>  	default y
>  	select ARCH_VCPU_IOREQ_COMPLETION
>  	help

... now it becomes impossible to _enable_ INTEL_VMX when INTEL is disabled,
yet which may be of interest if you target some other vendor's VMX
implementation. Perhaps really we should have

config INTEL_VMX
	bool "Intel VT-x" if EXPERT
 	default INTEL

?

Jan

