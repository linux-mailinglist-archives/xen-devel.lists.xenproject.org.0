Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98862997002
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 17:53:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814866.1228560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syZ0A-0005p1-Qi; Wed, 09 Oct 2024 15:53:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814866.1228560; Wed, 09 Oct 2024 15:53:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syZ0A-0005mC-O1; Wed, 09 Oct 2024 15:53:26 +0000
Received: by outflank-mailman (input) for mailman id 814866;
 Wed, 09 Oct 2024 15:53:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5PZ=RF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syZ09-0005m6-Ex
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 15:53:25 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d5fe32c-8656-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 17:53:24 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a9944c4d5d4so515643966b.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 08:53:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a995740de2bsm416243666b.94.2024.10.09.08.53.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 08:53:23 -0700 (PDT)
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
X-Inumbo-ID: 9d5fe32c-8656-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728489203; x=1729094003; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hqqOFZxTZqoD5J5/uMYVvC78ksYGP1/LVSa4qljJVEA=;
        b=DMWNdP2/x0NX9MTo+zMKuJfFLMHTxqwbfraO4KYNMcRryJNeQcGS+q2kaHBA+W5Dv3
         ZwUIhlIcLSbo8eq+kmdRbK2iZLa3TqabI4bp0fOFq/eQmJs3Ld5d/Xo/DFnK4xpaPpnw
         4MIDQXiFxJUuy6vEhIv9DAXK4rnOkACVeRksj0oHT+vMmFDv29bx4LVjPtT+GFji1Tp6
         VhcwV49fhRyezNlreMcQnKO5uaUWcRy658hoZGYJ6L26gby6ngH2qMO15SzwGwmvMF0S
         tJ6Uzix6iR+am8M2SVTmszp6I9JL2cCd5auUWXFejqWsSCCmXhtubSkV9AQJqewFgJJv
         MjMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728489203; x=1729094003;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqqOFZxTZqoD5J5/uMYVvC78ksYGP1/LVSa4qljJVEA=;
        b=N4rdew99wu3ElYnpWCCY7fWgJXD55nBrxkV4jgC6B/PmfwOtleUiWB3+ji+6SvBTt4
         arLFocDa9t3jrQbj6gPJP7tNenVbZS08fxK5tAQE1yrqYmuqkwbI4tbc1I7JqKotvyyE
         A7sn6dUSpb2YsYLzkkVVS3RHqrt45SqGID0fW9aZYjQVvSC/fImgivCS/CR3ya3zkwIW
         49Fno27nz3ZOERwtJIyzcJX/ZnxTiqLUxXfC+x4DjeIp/juzq5MAQI4vWH2jHK7OH5LO
         BIiTcc+AcomkqABIhYgVBmycov2rAbWzV4rifgcA8b3KRMIh0FCj7GFcHy2tnkBknRhk
         SGBw==
X-Forwarded-Encrypted: i=1; AJvYcCUiM1BQP6Nr7wbAqOoPW5cvjxW4EcJlh5Tt2P2WZtymFn2EU8RJ6gy9Yxb1ANBeHu2zpeXP4fXhVk4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx9XNkFmaZ0lU7sVnI6lre+Y0WoNmHJIrfoxQMn0zTomWtJe2fW
	n/RsaMipP4DWPb/a5IkT7+SARQrFCehepNcglCVbQLLmd0FF50Rhnyv2gSIH5g==
X-Google-Smtp-Source: AGHT+IFFA/12s7HlXa79omgKSQQyGKKAsgVeKMFOCbqQyn0shH2GP8C+tegBTUEOKwcdICxawYPWXQ==
X-Received: by 2002:a17:907:962a:b0:a99:4bba:fe8a with SMTP id a640c23a62f3a-a998d18d21dmr223353466b.14.1728489203291;
        Wed, 09 Oct 2024 08:53:23 -0700 (PDT)
Message-ID: <f4657c52-ac03-47cc-8182-91f210daad24@suse.com>
Date: Wed, 9 Oct 2024 17:53:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/44] x86/boot: introduce boot module interator
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-16-dpsmith@apertussolutions.com>
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
In-Reply-To: <20241006214956.24339-16-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.10.2024 23:49, Daniel P. Smith wrote:
> --- a/xen/arch/x86/include/asm/bootinfo.h
> +++ b/xen/arch/x86/include/asm/bootinfo.h
> @@ -54,8 +54,24 @@ struct boot_info {
>      struct boot_module mods[MAX_NR_BOOTMODS + 1];
>  };
>  
> -#endif /* __XEN_X86_BOOTINFO_H__ */
> +static inline int __init next_boot_module_index(
> +    const struct boot_info *bi, enum bootmod_type t, int offset)

Instead of "offset" maybe better "start" or "from"? Further, plain int
(as also used ...

> +{
> +    int i;

... here) isn't really liked for ...

> +    for ( i = offset; i < bi->nr_modules; i++ )
> +    {
> +        if ( bi->mods[i].type == t )

... array indexing. Perhaps the function itself would better have
unsigned int return type as well, ...

> +            return i;
> +    }
> +
> +    return -1;

... using UINT_MAX or some other suitable constant here instead?

Jan

