Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F139845724
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 13:14:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674385.1049240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVVxY-0008Lw-AJ; Thu, 01 Feb 2024 12:14:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674385.1049240; Thu, 01 Feb 2024 12:14:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVVxY-0008Jg-7V; Thu, 01 Feb 2024 12:14:24 +0000
Received: by outflank-mailman (input) for mailman id 674385;
 Thu, 01 Feb 2024 12:14:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFwQ=JK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rVVxW-0008Ja-O1
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 12:14:22 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e758c66-c0fb-11ee-8a43-1f161083a0e0;
 Thu, 01 Feb 2024 13:14:21 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5112cb7ae27so1564502e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 04:14:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v21-20020a05600c445500b0040faf3df118sm4353674wmn.32.2024.02.01.04.14.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Feb 2024 04:14:20 -0800 (PST)
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
X-Inumbo-ID: 6e758c66-c0fb-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706789661; x=1707394461; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=poKUmijZjrU6z7E2d33cHjhbfbhs9SLZRbEIBTVo/DE=;
        b=cZz4DL6odwCfbDpN6b/XxqfZKdw4CKVICf6hUvbPbic2FZ/bTxOCFfwkwVk3mbRV54
         2DHERwS6NM+lCe5aAm24vdFw/5Xtx/WEgPYruDpOSnqAGdsXT+p8s82vo8ZEgwmWI9pA
         csBP7rozOVuwrJ4Jg0GSfwAEOvIvSV3GNRPF/cOtmI5QcrTm6Wh2SfQQyen8fZED+2qM
         OF67JZTuUsQd9QpYlSGEWbpSoR4Dyhschywk+mJD1eX2gMkcl+WTsI1HdNwDSkXwiCZC
         g3l65MLRsED8/sSfdCfIUIfIiJCSFmwqJNEvJ00cgdPxbCTtBmNPf7RlQKgMfnJGBkvz
         Onqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706789661; x=1707394461;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=poKUmijZjrU6z7E2d33cHjhbfbhs9SLZRbEIBTVo/DE=;
        b=rN+zNv+GXnLSrAIZIt3kd0HVfkExc8iXdmv80Q5s1e9kWdJokBwUTHW+iwASE9BRUb
         ikluuiu/a531U97Vjm15bX+YYaGv6wGjfKVXy0Tj4S8fpI6+/B+d+vQj4jQYC7Vz+NJe
         I2KyNryV7/RXaVSW2hT1Ry4rSwOEr8MV7gsIlcUbNFeyvV/bD0Xouor7TOGzsBcKbhQB
         OGQ/NEShhpYn3eXxql3q/qKdeBxhsfG+eBK8fbwIv724bAC/tyn1u5SOkfDMDKODE50U
         g2HNwNmBCQ7f76BFg3oQn91Gd7nFZgbg9iXyxntb2TB9qeylx1DcbmOaBA2dGYfrdcRa
         p3lg==
X-Gm-Message-State: AOJu0YwYFHXSRdDFfcB6IMTkAdL7yilpwnLC9BvCyWGLs3kRO3DdS7AZ
	BDN3+fH6rUXjEzuvOruG6i4NCxXnrCzcRAOfOc5wDDmRwJKiFnFP6Yqkcw02qg==
X-Google-Smtp-Source: AGHT+IHxdOAPTqinLiUUJR1DlPq06pe5+JRkvZDL1us9hsAfrJG1Mfm4gzq7a2zjjxHFmesTNYMzLQ==
X-Received: by 2002:ac2:54b2:0:b0:511:1e60:8157 with SMTP id w18-20020ac254b2000000b005111e608157mr1554336lfk.10.1706789661344;
        Thu, 01 Feb 2024 04:14:21 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXmFke1JplbLXNMHDzsGpMZvvcuwb9pqNH3vnqcW8EWR2ZsBZyL/B79yvrezo5MNQB6EksE2yGCBKpTZtB8bljQhbTAl5YZ16FSx23ONv5sDWBI0NvEkFvXGdAdFDVYST8N+B/u43q0dsazw2VAeTitF8K2SWepHha12YokQbrzHuYoVowL8cLCYGVMXBYVqsq4mpTuBdSXTTL+f8sFi95p77lYzC20d4rD1M3eeK55EYBrVs/IptvSifPU1VspNtuohIgkT5Mbd8yaU82fDRkdh6d9zZhY
Message-ID: <412fd2a2-4382-4131-92a5-cfb399f95f31@suse.com>
Date: Thu, 1 Feb 2024 13:14:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/15] xen/common: add cache coloring common code
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Marco Solieri <marco.solieri@minervasys.tech>,
 xen-devel@lists.xenproject.org
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-2-carlo.nonato@minervasys.tech>
 <42eabd87-b245-44e3-9945-40b1a5c5eaf5@suse.com>
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
In-Reply-To: <42eabd87-b245-44e3-9945-40b1a5c5eaf5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.01.2024 16:57, Jan Beulich wrote:
> On 29.01.2024 18:17, Carlo Nonato wrote:
>> +Command line parameters
>> +***********************
>> +
>> +More specific documentation is available at `docs/misc/xen-command-line.pandoc`.
>> +
>> ++----------------------+-------------------------------+
>> +| **Parameter**        | **Description**               |
>> ++----------------------+-------------------------------+
>> +| ``llc-coloring``     | enable coloring at runtime    |
>> ++----------------------+-------------------------------+
>> +| ``llc-way-size``     | set the LLC way size          |
>> ++----------------------+-------------------------------+
> 
> As a result of the above, I also find it confusing to specify "way size"
> as a command line option. Cache size, number of ways, and cache line size
> would seem more natural to me.

Or, alternatively, have the number of colors be specifiable directly.

Jan

