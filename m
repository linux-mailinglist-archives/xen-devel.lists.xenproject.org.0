Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD28B0A079
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 12:20:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048387.1418610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uciBq-00059E-JD; Fri, 18 Jul 2025 10:19:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048387.1418610; Fri, 18 Jul 2025 10:19:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uciBq-00057C-FU; Fri, 18 Jul 2025 10:19:42 +0000
Received: by outflank-mailman (input) for mailman id 1048387;
 Fri, 18 Jul 2025 10:19:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RNMk=Z7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uciBo-000573-OU
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 10:19:40 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5de94b9-63c0-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 12:19:38 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a503d9ef59so1357164f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jul 2025 03:19:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f2ff61f6csm819006a12.45.2025.07.18.03.19.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 03:19:37 -0700 (PDT)
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
X-Inumbo-ID: b5de94b9-63c0-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752833978; x=1753438778; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6MfZ/88y8hcvKOMbvEOi8QnYpjWkCTKTeZXcnNxsXk4=;
        b=U6q1NcpQtSsbIN3p29Ip0qWioQj5QcPAabW+AuJjXH3SiAA7f/dK4oQsrCBJs2sAna
         vgDTSLTHokwye70uaAeElTsOWuWusRW8sgouJtwt4gQerlyxVFMQzbJdnbfYE2nIWzlR
         2TRswdaDlFUoZZLHdNu6UuqUkFglX/SvHae5e8Sa90XL1mIib8iqOW14lWfiRNtIR3NP
         z6XbzNgQvgfD0TTyStJXTazVJ5jAMKE5fbDOIrqUpPJ2y92xP+aGw9rnnvUiHBRgeM21
         WAt/ENBTfiTClrUXS7PzuwbjVVi65DaudvEcsE5QuGFQ0GNSlPTIX1yxBRFnggJ8cZBH
         6Fuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752833978; x=1753438778;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6MfZ/88y8hcvKOMbvEOi8QnYpjWkCTKTeZXcnNxsXk4=;
        b=gOCjlNTp9TV+MICWE+UHYXawKyuaP5O6y6p0HJuirTm7bloTz8JlPCjdSHOi35zT2V
         2mGcEUDvzICFSkBY/w7K1O8erf/K6gRuAO3a+OO/zC4Nsrc3P866GPkJImVA8iZZiukP
         IFp4qPND605Ef5CWVVRWh8CRWKoiKqwLz9kvzsks3l/pZdZLLQcLnlC/oBBbRquKQfhW
         dBjAFgstDpLmX2QJHN+2N5cE5I2T3A6pGYR81aBr6VtkMf45lzjfdNlkYkJetxY2ylMX
         eUUjkN9s3gcyfOz2BMXT5sGEkbLCkc7ud6X9CcijIoHDBcYVkVEFbmLBibv3+5+bW+th
         48tg==
X-Forwarded-Encrypted: i=1; AJvYcCVIkKvqL3uqi/1x/9WlIyHOYd/xksPJ+dGDhM9qlCf4Q3Sf+udX2URB7EAAhDBEEWxndnuJzyPgAPg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzyxlx1zkd98+p3c4r3LujL8iaQA/oUdirNJsh6gq1mfOfySyB4
	3+s3pCBjpmQMw4NqV6NXhOvtXaGj/gvcNwLzlrul1WOlRsewx++UJCEhKDvWDo5gOg==
X-Gm-Gg: ASbGncvSo38nqPsJ7JluJlemg5TK1MfuvBzM2xQRjcsMkinGxs9jlj0rTDndjUOgMI+
	DCaJZ+nskaq9AnkgeJh4Y0UBEgn7drK2CnjJJQSrgJbADy3MeENokTZt+llzBMKrK5dnReyRK9Q
	96jn63dtkItn2A96Roi7h0Mye05vED0xJC906TruWnacVO8I5R0kOusv+bL58ylV9RjMZdFWYSH
	9GHIWqWFFB9y6Zss0n8b9cv7I//EbjXqXdLV/P66o1FCj3cpjOT6CQQwwHBtjIKxVjOKBn/ureo
	wgwy6XSMlEAKINUYTfNmAGENqwOxpj0fTovS0sBTwz7TaZdtzg8XSTet6IxiF0eY+caPSFGY1Q1
	+bZdjsm7K0nDSIJZ/jUqjv7ge3SCPaF9OTG3PMg0zJXiVUZWB2forFQmbcEgrrOu81QNBCmX9E5
	bLgk74pQs=
X-Google-Smtp-Source: AGHT+IGyyfKj6A+sPhxPehOHZwoZTtyiMXN80ZMAWPoUETxhDBUfX8zL4VHuRgXUZ/SH9D7Epts7Dw==
X-Received: by 2002:a05:6000:2f83:b0:3a4:f038:af76 with SMTP id ffacd0b85a97d-3b60e53ec78mr7558711f8f.53.1752833977877;
        Fri, 18 Jul 2025 03:19:37 -0700 (PDT)
Message-ID: <4de09b8d-d71d-439e-be1c-78044a3cad31@suse.com>
Date: Fri, 18 Jul 2025 12:19:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1.1 6/6] x86/apic: Convert the TSC deadline errata table
 to X86_MATCH_*()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250716173132.2213891-7-andrew.cooper3@citrix.com>
 <20250718100739.2369750-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250718100739.2369750-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.07.2025 12:07, Andrew Cooper wrote:
> With the ability to match on steppings, introduce a new X86_MATCH_VFMS()
> helper to match a specific stepping, and use it to rework deadline_match[].
> 
> Notably this removes the overloading of driver_data possibly being a function
> pointer, and removes the latent bug where the target functions are missing
> ENDBR instructions owing to the lack of the cf_check attribute.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> -static const struct x86_cpu_id __initconstrel deadline_match[] = {

Seeing this transformation ...

>  static void __init check_deadline_errata(void)
>  {
> +    static const struct x86_cpu_id __initconst deadline_match[] = {

... of the section placement, we may want to investigate whether with the
toolchain baseline bump we can actually do away with __initconstrel, using
__initconst uniformly everywhere.

Jan

