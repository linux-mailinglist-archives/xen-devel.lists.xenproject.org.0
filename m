Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C89F4AB9742
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 10:16:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986500.1372049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFqEZ-0000Mb-9p; Fri, 16 May 2025 08:15:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986500.1372049; Fri, 16 May 2025 08:15:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFqEZ-0000KI-76; Fri, 16 May 2025 08:15:59 +0000
Received: by outflank-mailman (input) for mailman id 986500;
 Fri, 16 May 2025 08:15:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C2cV=YA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uFqEY-0000Jw-Fw
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 08:15:58 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc318451-322d-11f0-9ffb-bf95429c2676;
 Fri, 16 May 2025 10:15:53 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ac3eb3fdd2eso374272966b.0
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 01:15:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d04f263sm113732766b.1.2025.05.16.01.15.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 01:15:52 -0700 (PDT)
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
X-Inumbo-ID: fc318451-322d-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747383353; x=1747988153; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=C8F+td71t3yd1OWLfCxdWe/H6jUO8aS9/ZSr2fwhpHo=;
        b=O7iGAsHUBmyqDc9dDNb+hku4bXcS3IhSWhZAZxDHS6wOcdrBCzEldZEUjWXJV4n6b3
         HDDEyPgxybRMJgK7tL19xkM1TLcp7iNKHfFZ1EDeyLWoY12cU+DaJRL60bnwIMS1z1g6
         OfBKIBEYh+5FwU8QsHAxpuxjk/5iikvH9Py65JtAk4Yud+4Ap3KltQrJLaH1q58JBoCF
         jdczgwg4/BKWDrEgPb/Pm1uzu4mtr3Dvix9tBp+wtibiXn59d79P/4GXoQjJj4nd9plz
         V4w+vZgscGenkwsDKwEmebIVO4Qd10/bdQ4SFdegG4XiRZMpKNSdV9VMcXRHpdPl0m58
         oPUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747383353; x=1747988153;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8F+td71t3yd1OWLfCxdWe/H6jUO8aS9/ZSr2fwhpHo=;
        b=LyRQ+huXn3x/H28CZprIsm+kSlUvy4BrO+C5Kr+aasG47zdaJT5Jxd0UTW4sWRlX3d
         k0rd9A9loKqBk4KcqnMz6pbxGGepLZEczd9GFunIVKLxOgb+lW4s9k9P8+Op5P2uEZ5p
         100wEAnru8CY5yty5XTj4Y/kR1TjszJEMvBUBOh9bjhSmOW3rIsWBnB+DInUOT5c7i9o
         Cu1G0w9lFbmuK4OslPGOyjEsAGfnxAAHENQgY7KDBunzPqkRCf4HVlFCfCnvhIYn73EL
         kYbPmLrM5IHxbWm3fY7votZnlc5OpJGk1wVwnooZie7QxnCO/dOH9nDRBDDXDAhSq1OB
         2Lbw==
X-Forwarded-Encrypted: i=1; AJvYcCV9Eqovj0mxF41lHUdkyLJiUeGcTxJaW0RBKZUON6ctWREO2lv2yb61DyezybAu7JcXZjpAI0qLWEg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzu1dcICnGJzxGjIh0eHD21/ZPS02wv5DCgBRwJT75qdMe+Xqgm
	fYAZDZ91+dJoFrZAQfSunQ/ny+62XAOtBjrde79EAtHBAwOhJ7GSU5SueAzf+u571Q==
X-Gm-Gg: ASbGncuG8+/9MRirAsUlvKZLeWjh188LZtsmKE0qMzTKbRgXjD405Ha0+psyco/WBaD
	SLxkWBetMLvfekQKj/DYTRMHsc8m1GNpXTFoi2R25Gr+exOe0+vUx4E65p1kzieirPaNzXEVKkE
	i0XVCNrO0mER52WDCmCr/b7zMmgZr1bTTNtSiRtKIPB0wA1j7Sis3v03e7bNgXkJgTA0YIcspEX
	8oB20LzSGoamAKhnurRf3yp9CeiYoMuh1GTeMMZ6erR/lhtUY+B6FqnWFmy8IvzCdMuLUprwHI8
	iY12846hGqFl/Li5T71wfkfMGjiIWk2eRa2cRugb7FbD0S23+oMr/c7jVBOUQXw+Z69D5JRFUNk
	JbQKdofuzON2ImD68STJ0L3F7YtIqAiimN7uRgMwTVqogXWU=
X-Google-Smtp-Source: AGHT+IFk9r8RnRlXuzO4YQDRihSRbXjXxSdds7B2ivWngvK2xi/d7tyDOgigo+6EZou1mlIkvx16dg==
X-Received: by 2002:a17:907:94d2:b0:ad2:4d23:eddd with SMTP id a640c23a62f3a-ad52d5dec95mr209035066b.59.1747383352997;
        Fri, 16 May 2025 01:15:52 -0700 (PDT)
Message-ID: <01498be0-979a-4b89-a70b-050ddb5ad1b3@suse.com>
Date: Fri, 16 May 2025 10:15:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] xen: Introduce asm inline and use it for BUG_FRAME
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250515195549.3703017-1-andrew.cooper3@citrix.com>
 <20250515195549.3703017-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250515195549.3703017-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.05.2025 21:55, Andrew Cooper wrote:
> Compilers estimate the size of an asm() block for inlining purposes.
> 
> Constructs with embedded metadata (BUG_FRAME, ALTERNATIVE, EXTABLE, etc)
> appear large, depsite often only being a handful of instructions.  asm
> inline() overrides the estimation to identify the block as being small.
> 
> This has a substantial impact on inlining decisions, expected to be for the
> better given that the compiler has a more accurate picture to work with.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


