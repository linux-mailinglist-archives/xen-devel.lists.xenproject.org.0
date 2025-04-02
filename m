Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E61A78900
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 09:43:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935163.1336618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzskR-00047c-QA; Wed, 02 Apr 2025 07:42:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935163.1336618; Wed, 02 Apr 2025 07:42:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzskR-00044g-NO; Wed, 02 Apr 2025 07:42:55 +0000
Received: by outflank-mailman (input) for mailman id 935163;
 Wed, 02 Apr 2025 07:42:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T645=WU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzskR-00044a-0g
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 07:42:55 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15c144e5-0f96-11f0-9ea7-5ba50f476ded;
 Wed, 02 Apr 2025 09:42:53 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cf58eea0fso30963715e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Apr 2025 00:42:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43eb60cd354sm12214545e9.18.2025.04.02.00.42.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 00:42:52 -0700 (PDT)
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
X-Inumbo-ID: 15c144e5-0f96-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743579773; x=1744184573; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fWPwgZy4uPxSnbOoa9RRqDyhzLQm7Xl7UBB7ILiIh+s=;
        b=DPBeHvRtOd1ovih0OrHoVXpLo0LPJ6aOHc9jwpY0zHfDVFH3he2aUXu1NUI7Pb49Rz
         GhcEDHWCI1TgcIdcA426TO1JJ1YbqvanggG6KYw3uAauj6Q2rASmSKuliBDKhPp3MaNm
         JoBtZE79l8Hs6uzspv5Y8bz7dpItgvhoLiLNcgUCckuzAWcjkpBCCdNc5kwSqpUDTWMD
         QixP4W6d+5dUtIjTU0AtmIvhHH+Gd8ZoJev7/wfizgwNOYkVynafJ/P2OhXMklr2hiA0
         v1FQffbA9nMq9L6EUTtdX5XX8YucCeKS8nHhsiROs3FfQ2GuhLknuR7mqFX6uG/iFPnm
         iDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743579773; x=1744184573;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWPwgZy4uPxSnbOoa9RRqDyhzLQm7Xl7UBB7ILiIh+s=;
        b=XpwXG85wQrA/TgxoTvhBOYPQldiymq7ktwGBXY1wpmZyIWF/+OqgXxUGQWFXVbFIG1
         AN70wY0mxa3qN65V2dcdpwnH7J/vN70xEJdzZf7rxG9B3bQ8UYepwddluQbqQsbfbEBR
         sXpfAcQiWOKZVtEO4DI45ihKVuPB73sCfNvDeR/ZtCfdqSrO2jlWa7N/DTaMq+BRKzRl
         m/S0UfsWhKXTw1EWSDLYGLxrlyMVjfZnwQHOTnlh7TVQfZG/GHiI73XIm5E/gWnI4pvp
         2orF2kuITg0cj87vEQHIfTYt6mMj8Zc65G+CXKvExvgGtcQHxQsH1gyunla+nl6IdfhG
         EmVw==
X-Forwarded-Encrypted: i=1; AJvYcCXUg3EQzDa3zwUge/U5I0ttlzXYucPkHOw2k2iJkKL8mutkM0Q3vLXq4pyZXPZv0dOxbRnUX+otkI4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwEHmKdwKwAB32pWStFZHBT/Ig+i2FAzuLCMTIcGs8rMIWw4/FM
	fbs99LpoU9ayHmY3+2RXGt5OCJk/GcAooSFjRaHPMYPd7ocCj4K6DKLasEvBEQ==
X-Gm-Gg: ASbGncuysc1ZQM4iQ2DLIceDrkjmFzxMDNIHpj7f0Qvlp2M4pcvc7Z4DpdoRoXavn2J
	2H+GmDaXtWb7CPpqRRE0HK9RoNLd6DPDUY17JY4oVbHPFnBDcvmR0BcS1SMkWn+4CdYhzG5rLDt
	pt3j/5gmogBNw/IvJtKFS0sssknmKKT6DTLP3481RcHNh/6QNvCT4GTQBb6uUtJvhwrVjVfmmhJ
	AulacYQQh3XbvgHcgt/5IFWBngfbiKFo9Xd6NG0GfqcaezmOUrrUXxwVUYw9+xu6Cd7s5U6tZbw
	xO3hdJONF6DNwI2oaUiTKdHXnR1XwFZ+vJB67SlGUaV9+vMgXmYKw/1nSMxCxGnhKEldhK6JcYg
	W6OinPtKc4x0dEZ6Qcgjl3mJPLDAi1w==
X-Google-Smtp-Source: AGHT+IGZwJk5t777RePqURdDVK/oNM6a3CkoqAERT+ayQWQ8nPr6+Ov8SWZktvwslMaKkAO2VuTYgA==
X-Received: by 2002:a05:600c:4454:b0:43c:f1b8:16ad with SMTP id 5b1f17b1804b1-43ea7cdfd30mr65487915e9.30.1743579772834;
        Wed, 02 Apr 2025 00:42:52 -0700 (PDT)
Message-ID: <b51de34d-a9b5-4f8e-a26d-3772b0c9cead@suse.com>
Date: Wed, 2 Apr 2025 09:42:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/11] x86/mkreloc: use the string table to get names
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250401130840.72119-1-roger.pau@citrix.com>
 <20250401130840.72119-4-roger.pau@citrix.com>
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
In-Reply-To: <20250401130840.72119-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.04.2025 15:08, Roger Pau Monne wrote:
> @@ -83,6 +111,31 @@ static unsigned int load(const char *name, int *handle,
>          exit(3);
>      }
>  
> +    if ( !string_table && pe_hdr.symbol_table )
> +    {
> +        char *strings;
> +
> +        if ( lseek(in, pe_hdr.symbol_table + pe_hdr.symbols * SYM_SIZE,
> +                   SEEK_SET) < 0 ||
> +             read(in, &string_table_size, sizeof(string_table_size)) !=
> +             sizeof(string_table_size) )
> +        {
> +            perror(name);
> +            exit(3);
> +        }
> +
> +        string_table_size -= sizeof(string_table_size);
> +        strings = malloc(string_table_size);

One more thing: Perhaps better to allocate an extra byte here, ...

> +        if ( read(in, strings, string_table_size) != string_table_size )
> +        {
> +            perror(name);
> +            exit(3);
> +        }
> +
> +        string_table = strings;
> +    }

... and then put a nul terminator at the end, just in case.

Jan

