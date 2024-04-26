Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 553028B2FEF
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 07:56:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712407.1113076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0EYY-0000Y6-KS; Fri, 26 Apr 2024 05:55:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712407.1113076; Fri, 26 Apr 2024 05:55:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0EYY-0000WB-Gl; Fri, 26 Apr 2024 05:55:34 +0000
Received: by outflank-mailman (input) for mailman id 712407;
 Fri, 26 Apr 2024 05:55:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj3M=L7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s0EYX-0000W5-9l
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 05:55:33 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 975478bf-0391-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 07:55:31 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a5557e3ebcaso295925166b.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2024 22:55:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 k25-20020a1709062a5900b00a55a06d7744sm7238466eje.73.2024.04.25.22.55.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 22:55:30 -0700 (PDT)
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
X-Inumbo-ID: 975478bf-0391-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714110931; x=1714715731; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WAgsY00KinfdZOjqg+rOLxPB3kGEo9FqFWsjiAlSL7g=;
        b=K/V6f6YrPTOjfz/HE0dnJwGDfazKQ3lJ+ZtFSODhddOlmTzdmQy9LckatmBlYx9Cmc
         b5+hBUB0asme5+QVOwzOF4/6zir75UYQs74KvRXAMxe/yA+yhomdwH7273oTWjq3kE4d
         pZ3/7gavVthjWtRAijy0GCYjcP9KGWNbaptNT8C7YiXG/NYlYBOWnDNvAuwT/opFnGB9
         p4g1xFFaDCR/hFEhN10QPAPZ0uopEgccarj83lIFv7T0SB+I0roGgoDrXx+SJkKkhCQW
         lIxSq7FYZAPqmvMVnJL35QxuILIIAtQbRl6J863VKMzNWi+nBxI3+ouFNJrgDeyeCKsu
         k7WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714110931; x=1714715731;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WAgsY00KinfdZOjqg+rOLxPB3kGEo9FqFWsjiAlSL7g=;
        b=PP5f0+eFFQYgRHKB/fyyqGBECXmFEMOYIrKQu9KnKSxXsPdmolZud8FwcourXvsq1d
         I5VmWsJ1B+ShMzsG5IjHXpsVqcgadiq6cVKlEiZC1uTbie2udt6bIkyTQgam5/NsrVuP
         srthbcmQ1JXmiAu5dNtK5pbxwbm57hD1J0Rg6dzaJw47Hf4gpbiwoqB1xDvKNgcKtxLT
         8UVm7Fi3j2W8e8xdVVF+egErixscLa9A/A4OEkFxK13U9/7mMWEPKZdlPx0X6XnMPp+V
         llSYZ6zhRHWRTvPirzVjJk/0izUAWxwNhHdziHR1q4ZOBNMOov/MOIrpPTpfg6M7BJnd
         nDwg==
X-Forwarded-Encrypted: i=1; AJvYcCU8h3EunzkCk3MO2LniY8KOjAba0XYx6kEYDfcH6Fjko4AGc+Hie8qW0BYQypn8N2VQXX1okG2IcU+07KgjKB+VuBlE7kIXTlTpD32a+uw=
X-Gm-Message-State: AOJu0YxO3vKMCB0qGj+q2f3iIV4KSNBuNN8IqOMjqObtZdcfHRfgBolE
	tIjqeD/IDUPG0c8iuR1Co2Y4zM35KpW68bjGtdQ27+E8OJ7wf1pu3ItfSZi1tA==
X-Google-Smtp-Source: AGHT+IFPRErMi/o9bfw9Uj/3zJSz/NzpWBo4aCI5gvPXlL5Lo6YJK9O/VTzyWuysW6A2/dQSuf6IMQ==
X-Received: by 2002:a17:906:ad5:b0:a55:75f7:42fb with SMTP id z21-20020a1709060ad500b00a5575f742fbmr4642923ejf.24.1714110931185;
        Thu, 25 Apr 2024 22:55:31 -0700 (PDT)
Message-ID: <42614bdf-0aaa-4bbe-aa0f-f9d54c1e10d1@suse.com>
Date: Fri, 26 Apr 2024 07:55:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] gzip: move bitbuffer into gunzip state
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20240424163422.23276-1-dpsmith@apertussolutions.com>
 <20240424163422.23276-8-dpsmith@apertussolutions.com>
 <06b325c3-04a4-4294-85e1-a6d05019e3f0@citrix.com>
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
In-Reply-To: <06b325c3-04a4-4294-85e1-a6d05019e3f0@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.04.2024 21:23, Andrew Cooper wrote:
> On 24/04/2024 5:34 pm, Daniel P. Smith wrote:
>> --- a/xen/common/gzip/inflate.c
>> +++ b/xen/common/gzip/inflate.c
>> @@ -1017,8 +1014,8 @@ static int __init inflate(struct gunzip_state *s)
>>      /* Undo too much lookahead. The next read will be byte aligned so we
>>       * can discard unused bits in the last meaningful byte.
>>       */
>> -    while (bk >= 8) {
>> -        bk -= 8;
>> +    while (s->bk >= 8) {
>> +        s->bk -= 8;
>>          s->inptr--;
>>      }
> 
> Isn't it just me, but isn't this just:
> 
>     s->inptr -= (s->bk >> 3);
>     s->bk &= 7;
> 
> ?

I'd say yes, if only there wasn't the comment talking of just a single byte,
and even there supposedly some of the bits.

Jan

