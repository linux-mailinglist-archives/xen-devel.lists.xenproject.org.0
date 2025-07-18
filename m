Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDDDB09BA6
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 08:45:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048033.1418344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uceqI-0003Av-9e; Fri, 18 Jul 2025 06:45:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048033.1418344; Fri, 18 Jul 2025 06:45:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uceqI-00038L-6g; Fri, 18 Jul 2025 06:45:14 +0000
Received: by outflank-mailman (input) for mailman id 1048033;
 Fri, 18 Jul 2025 06:45:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RNMk=Z7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uceqH-00038F-1I
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 06:45:13 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0be8363-63a2-11f0-a319-13f23c93f187;
 Fri, 18 Jul 2025 08:45:12 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4561607166aso13357055e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 23:45:12 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f268:e016:4ee6:ecac:2480?
 (p200300cab711f268e0164ee6ecac2480.dip0.t-ipconnect.de.
 [2003:ca:b711:f268:e016:4ee6:ecac:2480])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca4d7b1sm942094f8f.71.2025.07.17.23.45.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 23:45:11 -0700 (PDT)
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
X-Inumbo-ID: c0be8363-63a2-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752821111; x=1753425911; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=prIwQfZyIf51muNJWKPO2b+zhmBek4nvXbASfUj5pv4=;
        b=Kt5EPDMCE7PkMMt9Cmnl17mjQtwIKZoJ23O0UZICSvKbaIRU7kFEzleT4L7f8UNTdj
         +8+34B2sHIX8JFkno57UPT3+I3RZsgyNg4Vdk5BPjNQwoTigMp+G4e2Y9iyT+3CMRPRq
         r920DQQ0kV9vkfd8hSGp1s30WWaDxSWAEjCfum15iIyqk9rJZEZQO9iZ5TgXH7GfCafO
         wOmazBPZllOnRWsddiEjW+TO/3Ha6NMveMNti/f+ngZIE6KuFx/ZYJMbFGERzyU/io71
         T33hHrVudnPKmPzMRoqHidcx5ZdvaccWOnGCeo/xtE2XIC4ckmHbpHAh+GzM0+tolkJN
         g/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752821111; x=1753425911;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=prIwQfZyIf51muNJWKPO2b+zhmBek4nvXbASfUj5pv4=;
        b=cyGhXMyNtAa0sy4/fWMgjNYtrGZo0i9sOpH4PmINq6HdXhxZzPvPFbwL2QNspfWVwB
         B+fJYJCAU8n7KnhRSl1hCdihwlKxEQ9YT6tqKvw7UNKYVGb/v9ipn1lDTvCV28tauNcK
         CuFcV6orazl368epGn0sA1Y555qvA3OgxPKa3OIbJu7Nb69jcl+OnjRNi/+fwn/kGTgF
         ykrcHutcxZSDzpm5xgPJaxaJIHIUhCYqV2mpL3TbiAfNQryOSINxeRjH4ZI2YPZHjXR9
         Gt91tRgkk1CK7vpl0UFxQi1wZ7odxaR9VAUTn6AtzGhX12dyC25dgsU7370nsugZWqns
         tufA==
X-Forwarded-Encrypted: i=1; AJvYcCWuSkMWwtgHuITHk2vPFhtAIdc9TR3myX/pWN/T+x0rHgNll4Sq6IL22T6B4eVeSgQUHS+rSYnKmWA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwxDGzVaL1Rq6AaQ+aUKgcLRuCP+cHUFrhmRJyyn7inpdR5hsrW
	5MPlTbrOeZwC1CvW1cnP4C3Xkmf3+Auqg7STSehN3ysouzZEzd8kKwZr0a6iUlEr837NMofhVW+
	PySs=
X-Gm-Gg: ASbGnctAlaxjt8EwqdWhkIBnnTp8QAf8HoLsH3Akj33fY8uEmMBuDLyWuXb+tSEdqLB
	J8LFAqKAM5YcNZ7Dnfr7zItMm6X23LFEnI4DSP3TAgF/9MeguA1ed3IT4Z1nIOwnHlgiisokCIH
	LhwmmRmUutSYK9HCJRR5GzQ+xh10fM/iLCgtzARcQOZQsxUTgxb+zX5a9fFgLfcnS7vF7n40iD+
	D04YRdE7ZtPO12TBoCbI6YIVZ+zygbpxm3pHba/qGxuD1tYhEG0tePxLC6p50ykd/+wGIXyHjy0
	Fp7Dd0fTcPWRFCZ+graOy3YhCVzeEa29UhRjTHsvBjXKaY1nLWWqGLUviV/Yc358LNU9QY370fz
	CGF7cFu3MKEHn+sB8XO5LE4/dKMoXQ1a3Ahce4urL7FWEjQENopg0AsXKuGbw6i6WBulLZcu+A6
	EqrtMINMDk5FYAHRVYHcCajImdygO+19ol0hS5qUDFeTB/CK69XQ9tgbDX
X-Google-Smtp-Source: AGHT+IE60pvoytq/tHKYnwk324a8HmlTzUB9VIrgnzKgNW3UGHTs+njyzim1cEYI8k7vXNdyYbWwyw==
X-Received: by 2002:a05:600c:c08b:b0:456:24aa:958e with SMTP id 5b1f17b1804b1-4562e3d4f52mr78705275e9.0.1752821111369;
        Thu, 17 Jul 2025 23:45:11 -0700 (PDT)
Message-ID: <2532d657-9090-40ea-bd88-3e2d372af9d5@suse.com>
Date: Fri, 18 Jul 2025 08:45:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: Conditionalise init_dom0_cpu_policy()
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250717175825.463446-1-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20250717175825.463446-1-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.07.2025 19:58, Alejandro Vallejo wrote:
> Later patches will keep refactoring create_dom0()
> until it can create arbitrary domains. This is one
> small step in that direction.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

As with the other patch - we first need to settle on principles. And
then ...

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1054,7 +1054,8 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>      if ( IS_ERR(d) )
>          panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
>  
> -    init_dom0_cpuid_policy(d);
> +    if ( pv_shim || d->cdf & (CDF_privileged | CDF_hardware) )
> +        init_dom0_cpuid_policy(d);

... we also want to avoid confusing naming (i.e. the "dom0" in here).

Finally, nit: The & expression wants parenthesizing against the ||.

Jan

