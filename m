Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A4686CD55
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 16:46:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687233.1070359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfibz-0001SX-QA; Thu, 29 Feb 2024 15:46:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687233.1070359; Thu, 29 Feb 2024 15:46:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfibz-0001R1-NH; Thu, 29 Feb 2024 15:46:19 +0000
Received: by outflank-mailman (input) for mailman id 687233;
 Thu, 29 Feb 2024 15:46:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8AV=KG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfiby-0001Qt-6y
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 15:46:18 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id acf19f64-d719-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 16:46:17 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-56533e30887so1800276a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 07:46:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 he44-20020a1709073dac00b00a4323d1b18fsm804181ejc.34.2024.02.29.07.46.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 07:46:16 -0800 (PST)
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
X-Inumbo-ID: acf19f64-d719-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709221576; x=1709826376; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yvStt6RpT6Q49zFDLwqwelFVZVbqpoF3M0TQaFXVjFk=;
        b=aJgXDQGi3dkrOiIiocS9QnZwsB4s36KgC0e3XZ2jTpEJZRnfOwkSCm1OWmX/rmkQ3A
         3GbGsVGN9A9Bi1IY0qhLd0qHaVh8143OMtBfLP3Z3iGcgi4MjlU3FtecQ+T3wsS1aLQ0
         uWUmZhYfLISi92N1LgtmQZOLMelC0ZSJDQuwZ3NfbQIuNusGkJqkONg7bQmS7dye0uNz
         fI6kg0rWEHZc1OaRTQPQEOsadqu47SMjTuhiIc5ovMGObIo0DaKYMPgnWIvbeWpqbcR4
         Fjq+13NCgDw73VqH5kInaZy+90oEDKRljG+t5/x5CjSMuquVLqTtu/Dv6Pti6joZMQGf
         4TUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709221576; x=1709826376;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yvStt6RpT6Q49zFDLwqwelFVZVbqpoF3M0TQaFXVjFk=;
        b=q+jhEUHzkdQ312Ea+m46kxL8SwgAm/lLBifAahQPw8ZZlsrnFCf3hdPblITULzor3j
         cqjdrIAvA3DfuJUsxPbg/m+15Ygz8O5lkRTZsgCjxhdjuFhWf19QZopLhyOJ8QifGmA/
         CZDKLi3wh7q7Qf5dpGwhh7DbNFra/ApiGox1aENLszTbtmjEV2xcE6am9feFj3Lq552Z
         zAn5h/D62duDkxogr6nxyaxEuyzgC+i/Cb1rH2O2nRfVYWMpz2wmjNOqFmVHgp16b0+U
         cm7ksEsrn5Za0gnirU/NybP9oVs7msDnlf6X6kY6zaCR00Y6BoaWAKinUwLA31BKHRco
         w+LA==
X-Forwarded-Encrypted: i=1; AJvYcCWy32Qnq7Z/o2Oe0uli+4wP/7HiBP8K0YHSwiPbo7wsmWB1hw2uH9nh3hYdgzMoCgD+U90ffIz4EsaQ574zqUTe1pxPEXNNKW9TU9ECds0=
X-Gm-Message-State: AOJu0YzCyxXNWtdvrd0qY3eovt7mfTjP0ezBaxjh/TppL3E4khq1o7Q9
	noE3ZT0dsrsxtG5aA5sCNI2vVdxXfnZZFLM8TPMMxNg30ydTvYuXqzhfx3DBPQ==
X-Google-Smtp-Source: AGHT+IHGX/jJLHhP0Gk2ekkO5WT9x5v3oH3WPAGQiTxxufBleiRuvX5yk4vx+Ae3mcMKcS3LCnhLcw==
X-Received: by 2002:a17:906:46d9:b0:a44:4ee9:c560 with SMTP id k25-20020a17090646d900b00a444ee9c560mr1162166ejs.53.1709221576655;
        Thu, 29 Feb 2024 07:46:16 -0800 (PST)
Message-ID: <c96542eb-daf4-4ce2-915e-86ca8e1848b5@suse.com>
Date: Thu, 29 Feb 2024 16:46:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/12] xen/spinlock: support higher number of cpus
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-13-jgross@suse.com>
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
In-Reply-To: <20231212094725.22184-13-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.12.2023 10:47, Juergen Gross wrote:
> Allow 16 bits per cpu number, which is the limit imposed by
> spinlock_tickets_t.
> 
> This will allow up to 65535 cpus, while increasing only the size of
> recursive spinlocks in debug builds from 8 to 12 bytes.

I think we want to be more conservative here, for the case of there
being bugs: The CPU holding a lock may wrongly try to acquire it a
2nd time. That's the 65536th ticket then, wrapping the value.
Therefore my suggestion would be to only (mention) go(ing) up to 32k.

> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  xen/common/spinlock.c      |  1 +
>  xen/include/xen/spinlock.h | 18 +++++++++---------
>  2 files changed, 10 insertions(+), 9 deletions(-)

Shouldn't this also bump the upper bound of the NR_CPUS range then
in xen/arch/Kconfig?

Jan

