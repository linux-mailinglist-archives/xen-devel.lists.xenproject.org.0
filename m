Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6FB87F870
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 08:34:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695233.1084829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmTz2-0007Te-Kz; Tue, 19 Mar 2024 07:34:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695233.1084829; Tue, 19 Mar 2024 07:34:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmTz2-0007RP-I9; Tue, 19 Mar 2024 07:34:04 +0000
Received: by outflank-mailman (input) for mailman id 695233;
 Tue, 19 Mar 2024 07:34:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aOUF=KZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmTz1-0007RJ-3s
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 07:34:03 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e078f35-e5c3-11ee-afdd-a90da7624cb6;
 Tue, 19 Mar 2024 08:34:01 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-563c403719cso6301751a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 Mar 2024 00:34:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 i22-20020a17090671d600b00a46d58fbc11sm831770ejk.118.2024.03.19.00.34.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 00:34:00 -0700 (PDT)
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
X-Inumbo-ID: 0e078f35-e5c3-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710833641; x=1711438441; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Tbt14xyTFu8XXmumWNE8T7XrCfHAF7cozhh++uEE08=;
        b=T7ljbkHBHv49fpIqBBLLmYjuF+/oGfnCv+krscDk45i0PxbCzAzqw0dxuBBku3hCUO
         IYrufgbzR/WdhDrFO/rDJDozJzWNN8tX+N5bVLyhvCW9xsHQB6KN2FQulZnWyElxIFr+
         r2oKDnYbVV5LaqTN3s30P5sJmjqQ5TRLaQrn4xZVCI39apX+x3XJzH8cElgtDDSiiqjV
         IjgIWF9+2VY2EOa8abrb9fVWOxamnTgKE8aCtTO61rwLUkahqdannt65Vugd0gJUOQ34
         /TccxqmQFv/a8rIQ1wYMeAMF7NtnOjZnQ2SThl4mynBI6XryhBBdZ4m3XCll97z1gkSS
         pmWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710833641; x=1711438441;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Tbt14xyTFu8XXmumWNE8T7XrCfHAF7cozhh++uEE08=;
        b=f9cerGhu9ViU6VV/RNgQITli2UfenK+Z7XdQeD3NgtZ8pGWmP7t+Wlk+z/j378mqmo
         13x0P8zwpNiFLUukbqaakX5/m+ioRZO25d+wV0mOpClhYgON0j4FeBm3cwN6u+Og/p3s
         smV741YTCx4FpgXNEOQd26Lw+xuJ4EFEv1OuCTclINXSX/SIhsUUsx175OBDqY3BHmC4
         RRkjXC4ea9lHqB+Ve3QZLdGWdOq/9rqCt2hK8I5WMJkLL0JUQQn29S3Vc8ukOXuIocSt
         KlQxHCDKGd0CFWmdoVG+BhSL6npUweWjTjdsdgYP8q8knc45ugGnBxwMHS/t5L9z1uW9
         XYBA==
X-Forwarded-Encrypted: i=1; AJvYcCX/UrWZ9b6tevwH3FB42G9U5aRgCRe7lDrIz6nnPAoFjOhx8WigYF4f4XFias43uGO5WjapErISW/bdJ7B7XeUtgrY0PJkwjZbM876fm7c=
X-Gm-Message-State: AOJu0YxXSSXIYMCWqO5Zz3kSyxFtr6xlOlgc3LGq8h/sVGdqV0LahdCi
	eWwyQYW+ZEdVP2nqLPuqDWxjL3ukNRipGEL+jcJM34oSD0Nttu6XxUWZ0NS1Qw==
X-Google-Smtp-Source: AGHT+IEIB1jx8MpUGbf+HVqTTpPb684QE4RTLck/YO6HieV6LnatfTf3PAXARAb8GEExZvrCjrtS2w==
X-Received: by 2002:a17:907:1707:b0:a46:7dc1:e4d1 with SMTP id le7-20020a170907170700b00a467dc1e4d1mr9581857ejc.73.1710833640804;
        Tue, 19 Mar 2024 00:34:00 -0700 (PDT)
Message-ID: <e45432b2-9ab5-4fa7-994c-37265edbc8f5@suse.com>
Date: Tue, 19 Mar 2024 08:33:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/features: More AMD features
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240318181332.3817631-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240318181332.3817631-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.03.2024 19:13, Andrew Cooper wrote:
> I'm not sure about FSRSC as a name, but it definitely beats AMD's longhand
> name of FAST_REP_SCASB.

With FSRS already used, I guess that's the closest we can get to keep
names for similar features similar.

> --- a/tools/misc/xen-cpuid.c
> +++ b/tools/misc/xen-cpuid.c
> @@ -91,6 +91,7 @@ static const char *const str_e1c[32] =
>      [24] = "perfctr-nb", /* [25] */
>      [26] = "dbx",        [27] = "perftsc",
>      [28] = "pcx-l2i",    [29] = "monitorx",
> +    [30] = "dbext2",
>  };

AMD calls this AddrMaskExt (PM) or AdMskExtn (PPR). I can see where your
different name choice is coming from, yet I still wonder whether we should
try to stay closer where possible.

Jan

