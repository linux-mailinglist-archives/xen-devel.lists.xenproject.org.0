Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C87AB15876
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 07:35:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063404.1429135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugzT6-0004uT-U1; Wed, 30 Jul 2025 05:35:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063404.1429135; Wed, 30 Jul 2025 05:35:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugzT6-0004s0-RF; Wed, 30 Jul 2025 05:35:12 +0000
Received: by outflank-mailman (input) for mailman id 1063404;
 Wed, 30 Jul 2025 05:35:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zSpT=2L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ugzT4-0004ru-Nn
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 05:35:10 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f34a90b9-6d06-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 07:35:06 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3b77673fd78so3138813f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 22:35:06 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f23f:1903:a31c:2815:3201?
 (p200300cab711f23f1903a31c28153201.dip0.t-ipconnect.de.
 [2003:ca:b711:f23f:1903:a31c:2815:3201])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b7816e3641sm12667012f8f.73.2025.07.29.22.35.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 22:35:05 -0700 (PDT)
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
X-Inumbo-ID: f34a90b9-6d06-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753853706; x=1754458506; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QUdFUj2xGUMJ2ZFGzoDNN+03oHfzarWrfegth6mgTAU=;
        b=GyRp5sIPiQ+PdNg4zR6HmwxLwfDukBsmr7MsWc7F2l57qjxyz2R6jCrxf//Xg5B6kt
         7lGH6ubDlQLuJsElr6A3b+4rurj99lL78lh0mJtPkPfb7raJc0N8pF2ZnLAiXwVruiIx
         edHdZIjUeUtc2SKCBckRS+Q342h48UjyylBHQUPbVcaw02PybavG9L4WT3h6DfyYVxSn
         DD18c4Pjy170STjEM5LBHttlNOFIkf+3gk84HEsqSNBy0Qaxcb/0jWjSdde+MNPREW6a
         y92gc7F765OYssWm7JaBfvzc+5WoSHfGD3oVfwNpchdx+F0C6KuelMWUFkDJvdlEW01y
         y1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753853706; x=1754458506;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QUdFUj2xGUMJ2ZFGzoDNN+03oHfzarWrfegth6mgTAU=;
        b=CJ/8CCoJWrThyoKITI4mXj3QTnmD20l8688lyc20UQVCmZv0AQiNNuRS8kc+Ux1Kvy
         LA823r74Vex7laYrlBDY2TRTTzDx3wRuaIJF4Sq5RjHf4F63zv48+qO5SHusQZF7YROT
         SOQPF0G0Kc2zRHAf3F5qWRiGYFWUWXNOINqVWfl3KNc/wgHeWoRXoJNKrZ99pj/eWFZG
         UOAoVLgZiim6uHOMi7RpqB/CA+RJrsVGfgeNff8wE1dIATrVzXazcl2Jgj4kLXSpGawc
         aY8FrghBYXmnSPT9SgEy3rHRnvW4lYkZ106KWUwmQ9fh+BgITjIeL+3RCOIJkMcnaH3f
         ahzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDgD9VINUOTcw8QZDzVPmCMIvZLBYU6MDurblQS1K1zGbdMaVQRMqPTkPnqgYDpPfYcKHhXa2hEx8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzcYSHORMmBaBYX9KZLBg36XVVHdmUGtrkDIPUeXjaVOMnXfjFx
	dO3431E6oSbbn+L7jGsDlQG3eFBnuzATqj4gQW5Ao1Yal5WICZ5qmoeFYQrwCqxmYQ==
X-Gm-Gg: ASbGncvysTYYYhK5w5uS5ibGhXzVxbTfdg22ZpEIIDJpGhD/LR/mlSXBQvhX0KmoRBS
	SGpMzMqUJcFx+m1AYG295DKjQDHQRtzdPBW/HIUQTXEl25jftiTeidAmVWXluL9+0AkLiRv+k8R
	P48xk2Ijr2zlzq8K0MZxPR1yxjao1BKe1rhbvhn4tQUyqx6JTK+3Q8+9BEafNM22+2F8DZ/ANQu
	LMj6dBYyc6eKHAKTAF4/2g/97ahVXn7Co5q2C+cWEDCcdkFpY3BkhGmOcUPAVj3TKreLbFtyn+O
	57g2c3FkKP/unPTvlRJ/uynB/M98+oOiTRK3RJFp+Enqar95HjW9MsKSVfFFkM1GdRAwvsx4zlO
	HTETzfoNB8w23LuP7Je2OKQSV417e+cQNcvUoidI8jqbGKwIc9uOaqh2Ypty8mMQQuJcTooRsWP
	epGxaovdvesKSw/TjsFFqtVQjd7k8xYvYCchZ5RUp60P6V8MEev9CKy8DJ
X-Google-Smtp-Source: AGHT+IF1qJ8HvSW/NtAAAq1sWp/btRPAFxmyYu1RNaU/KlHGy/bfHsE7wtn2Qz/J2iEMU/hjIKZmIQ==
X-Received: by 2002:adf:a357:0:b0:3b7:96e8:7596 with SMTP id ffacd0b85a97d-3b796e8772emr190942f8f.57.1753853706243;
        Tue, 29 Jul 2025 22:35:06 -0700 (PDT)
Message-ID: <4292abbe-28b1-4545-87af-b37dd4ace53e@suse.com>
Date: Wed, 30 Jul 2025 07:35:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/console: remove __printk_ratelimit()
To: dmkhn@proton.me
Cc: Julien Grall <julien@xen.org>, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, michal.orzel@amd.com, roger.pau@citrix.com,
 sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250725212235.753363-1-dmukhin@ford.com>
 <290ae958-4fba-42d8-a64b-d44845b85491@xen.org>
 <aade04e0-737f-481c-9ed1-1275969c2ef7@suse.com> <aIlIm7F5L3WQLoWd@kraken>
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
In-Reply-To: <aIlIm7F5L3WQLoWd@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.07.2025 00:18, dmkhn@proton.me wrote:
> On Mon, Jul 28, 2025 at 11:32:43AM +0200, Jan Beulich wrote:
>> On 26.07.2025 11:20, Julien Grall wrote:
>>> On 25/07/2025 22:24, dmkhn@proton.me wrote:
>>>> From: Denis Mukhin <dmukhin@ford.com>
>>>>
>>>> __printk_ratelimit() is never used outside of the console driver.
>>>> Remove it from the lib.h and merge with the public printk_ratelimit().
>>>
>>> Is this solving any sort of violation? Asking because even if the
>>> function is only used by one caller, I could see a benefit to be able to
>>> use different value for the ratelimit. So I leaning towards keep the
>>> code as-is.
>>
>> +1
>>
>> In fact I'm surprised (or maybe not) that we still don't make better use
>> the rate limiting functionality.
> 
> Out of curiosity, do you have any ideas re: make better use of the rate
> limiting functionality?

No concrete ones; thinking about this has been way too long ago.

> Build-time parameterization?

That and/or command line controls.

Jan

