Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 371DC8C4EF9
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 12:26:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721377.1124784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6pMW-0000GJ-T6; Tue, 14 May 2024 10:26:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721377.1124784; Tue, 14 May 2024 10:26:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6pMW-0000Dx-Q4; Tue, 14 May 2024 10:26:24 +0000
Received: by outflank-mailman (input) for mailman id 721377;
 Tue, 14 May 2024 10:26:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VieR=MR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s6pMV-00009b-Kl
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 10:26:23 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 694f7a52-11dc-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 12:26:23 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a5a8cd78701so17819666b.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 03:26:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1789247csm700655266b.82.2024.05.14.03.26.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 03:26:22 -0700 (PDT)
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
X-Inumbo-ID: 694f7a52-11dc-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715682382; x=1716287182; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aKwppwpQhXQlhzsC4CfsCstbXtSO3y4fl5GkEUJUHrw=;
        b=LQyBzNzCVrRnSQUAMbvA9IytbqudaO8WQsYM1KswRSjeboUT9JKQ6K398QjyGpcmAj
         xbW7c2OnhpMFS3lDFE8qMbwZYDEjovUE+ZgQsq8z2HzE9z6CJ9Z1l3fIOPltNAHUOYxs
         6HJ3Y8Q0EZvExNfr1vfe955Mh0ikvsUKXBzvMjABvhxQ5xs6kL5kvAbfgxbkRLkrGOEg
         1RlKN7duAIAEMD1cDmor2/i9qgWqXfvhLD7YfxQh4UZDVf62cYIm8UEf5QLPq4uK2Tfp
         DsJgIpXWUkO7zLwSYXzy6Vxv8K5SEXmvfNELRl7viHTtwx9Z23qcm21YsUVLwpqQ91RC
         6tQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715682382; x=1716287182;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aKwppwpQhXQlhzsC4CfsCstbXtSO3y4fl5GkEUJUHrw=;
        b=FZ1k2+Gh4Txm6ExycfBWAoS72C2bvwJZpTv3fdZdzQIw9OFeDnAqXk91HvhxhgJ+1K
         J+gsoe57FBIDXNLZ32AQXoQYxQ/UUB9Flxnlfx3XUiGPGJyMBKkWJruMXD+OX7Y0Xnhx
         ItREzPUxV6vSUsGXDSDZaHzyGGlvz5nME3n3m8gVhFIO3MyyfCu9sPdSs2NNf2sqAQnL
         qb6EuPfoK8i9FHRTQ1q6Jl6R+YsdoblmJ7U9K6G3zktLjn1/4IezG7NKT0Gx3gFIWgi/
         Z3GplehdVZ1mwHD+4ThlrQl6p97nqTDg2tn8x5Rstq69Xv+IPBV/8bKVwTT39mp/xsde
         oTcg==
X-Gm-Message-State: AOJu0Yxtp6r5LKlaj3eHDSlQbcnUwvq/UlRapuKm2UQ3dZ+e96/QFpMj
	Os3iEJeGdPVNCilGjI7ShHkXcq6zQuYOCJttcWUAXJ0EOsxL71Z0LfqqfpYoOw==
X-Google-Smtp-Source: AGHT+IHDei9sT8ODxGLgdAW3fn4XilvkPTnu169M2ZGZbOvawLeSptZ2ZSIGkNpgUaPQgxGmueiDhg==
X-Received: by 2002:a17:906:7853:b0:a59:cdc9:6fd9 with SMTP id a640c23a62f3a-a5a2d5750acmr714300366b.21.1715682382483;
        Tue, 14 May 2024 03:26:22 -0700 (PDT)
Message-ID: <90621115-e370-49a1-b272-d20f861d6137@suse.com>
Date: Tue, 14 May 2024 12:26:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 (resend) 07/19] xen/x86: Add support for the PMAP
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, pdurrant@amazon.com,
 dwmw@amazon.com, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Elias El Yandouzi <eliasely@amazon.com>
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-8-eliasely@amazon.com> <ZkMxgDPYgaKnmRRE@macbook>
 <87950da7-f765-4656-808f-6c63a29ced3d@suse.com> <ZkM7SK8U1Qsk7E3x@macbook>
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
In-Reply-To: <ZkM7SK8U1Qsk7E3x@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.05.2024 12:22, Roger Pau Monné wrote:
> On Tue, May 14, 2024 at 11:43:14AM +0200, Jan Beulich wrote:
>> On 14.05.2024 11:40, Roger Pau Monné wrote:
>>> On Mon, May 13, 2024 at 01:40:34PM +0000, Elias El Yandouzi wrote:
>>>> @@ -53,6 +55,8 @@ enum fixed_addresses {
>>>>      FIX_PV_CONSOLE,
>>>>      FIX_XEN_SHARED_INFO,
>>>>  #endif /* CONFIG_XEN_GUEST */
>>>> +    FIX_PMAP_BEGIN,
>>>> +    FIX_PMAP_END = FIX_PMAP_BEGIN + NUM_FIX_PMAP,
>>>
>>> This would better have
>>>
>>> #ifdef CONFIG_HAS_PMAP
>>>
>>> guards?
>>
>> That's useful only when the option can actually be off in certain
>> configurations, isn't it?
> 
> My comment earlier on this patch suggested to make CONFIG_HAS_PMAP be
> selected by HAS_SECRET_HIDING, rather than being unconditionally
> arch-selected (if that's possible, I certainly don't know the usage in
> further patches).

Right, but in patch 6 HAS_SECRET_HIDING is selected unconditionally,
which would then also select HAS_PMAP. If, otoh, HAS_PMAP was selected
only when SECRET_HIDING (or whatever its name is going to be), then an
#ifdef would indeed be wanted here.

Jan

