Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 225438B5C62
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 17:05:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714164.1115245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1SYh-0003dA-2S; Mon, 29 Apr 2024 15:04:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714164.1115245; Mon, 29 Apr 2024 15:04:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1SYg-0003aZ-VX; Mon, 29 Apr 2024 15:04:46 +0000
Received: by outflank-mailman (input) for mailman id 714164;
 Mon, 29 Apr 2024 15:04:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GJEf=MC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1SYf-0003aL-7M
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 15:04:45 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf9b92a6-0639-11ef-909b-e314d9c70b13;
 Mon, 29 Apr 2024 17:04:44 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-41b869326daso21651515e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 08:04:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 u14-20020a05600c19ce00b0041c23148330sm5662118wmq.10.2024.04.29.08.04.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Apr 2024 08:04:43 -0700 (PDT)
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
X-Inumbo-ID: cf9b92a6-0639-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714403083; x=1715007883; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3U4gnMWSmqa0xD6keYH4jurkcji37IsVDBGhTNv4OQI=;
        b=dQGw7nZmWdPkxQlLXnCYnah2TUXh1XKJFi9XDtxVemRSREz4PC/AAlamvHol6dW7Oj
         /S6SXP8KTD9uymbZBsDaBoQpvCluAmQp02TX/fQ6ZdPpICDKgNQri0S2RxV9W8SyRRTm
         3lvxd8G6AVSDaMBDh0Cw+czNW7Das4YeKKNIeaDAA+jPf6HIz5pGRgod4aIbsJ9wC04a
         FO4brHqXovYOh6ZJv2VHeqVRWV/XlSupc6Lg9tu/4ipRnonmgwGH2JyP4KlsZspA32HL
         F0xoS2IP636vDPqKYuWdY2WT7SHCjFoOU49INp+6jfOaaEPwBQm+JCX6Umg7Qg1FmuAz
         mh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403083; x=1715007883;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3U4gnMWSmqa0xD6keYH4jurkcji37IsVDBGhTNv4OQI=;
        b=YkL1sEgRppclh5slMTsY1eOy7INy6ifTLDnNr6Q4MqA0hp3y9WKUV+5A19Mjl+IhAg
         Xy8CGupBTeDmj9lBTb7NqQUij/oHWhUzo+fb2DqZ8yalP0jDeECh+yTy4I3k0b9yopLJ
         f4ie3QX+/iEdlMnJnjPS3u+v8hpfroSvzn/Zfjv7bsI5oDnP0fyS1zPsJk+IaX2dPqT+
         cp+WMuMHb/WGD6aIop61MJYdDBRB6Dtt+vj07RWmAWydUWAP7w69ARHEgf7WEnWyteEf
         dTGa9CNPq9OXDYPwsxkdtq29YWZmne5eVdIMnYqKTzhXdJkN4bOUoXzdHIa1CcfBb5UI
         8HUg==
X-Forwarded-Encrypted: i=1; AJvYcCWBYWCVC401ZbrkuskCasvkiU4SFR5k+WDERm6jyrQ+NouPh8kXIbAwW5tBMbNtXvCx0Yn+60nHQbMJb9kyKDeXXpZb+8j5ty9ZIMAdva8=
X-Gm-Message-State: AOJu0YztnIm7cCVOXwnI12lsw9xlA36+i1Vk2HVoh8aETb+7O7srwmZH
	hC2aNqFO7EbOsao0EWVssHxEECVx67tJ0YKc9rewmjdL7+cSj+PCqOi6BeyXfQ==
X-Google-Smtp-Source: AGHT+IG5NEF+E4jOmXqKiZqSl02hVPv7ehyG6crkx2USDjUAVmzgCKR1FuUJpARwsM5tPUFzAxRgjw==
X-Received: by 2002:a05:600c:3c90:b0:417:caa8:c3f4 with SMTP id bg16-20020a05600c3c9000b00417caa8c3f4mr9380890wmb.34.1714403083351;
        Mon, 29 Apr 2024 08:04:43 -0700 (PDT)
Message-ID: <c8cbefe1-e6b4-43fa-a6f6-c5c2b529f83d@suse.com>
Date: Mon, 29 Apr 2024 17:04:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] gzip: move input buffer handling into gunzip state
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240424163422.23276-1-dpsmith@apertussolutions.com>
 <20240424163422.23276-6-dpsmith@apertussolutions.com>
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
In-Reply-To: <20240424163422.23276-6-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.04.2024 18:34, Daniel P. Smith wrote:
> --- a/xen/common/gzip/gunzip.c
> +++ b/xen/common/gzip/gunzip.c
> @@ -10,13 +10,12 @@ struct gunzip_state {
>      unsigned char *window;
>      /* window pointer: */
>      unsigned int wp;
> -};
> -
> -static unsigned char *__initdata inbuf;
> -static unsigned int __initdata insize;
>  
> -/* Index of next byte to be processed in inbuf: */
> -static unsigned int __initdata inptr;
> +    unsigned char *inbuf;
> +    size_t insize;
> +    /* Index of next byte to be processed in inbuf: */
> +    unsigned int inptr;

I'm puzzled by the (suddenly) different types, seeing that ...

> +};
>  
>  #define malloc(a)       xmalloc_bytes(a)
>  #define free(a)         xfree(a)
> @@ -51,14 +50,14 @@ static __init void error(const char *x)
>      panic("%s\n", x);
>  }
>  
> -static __init uch get_byte(void) {
> -    if ( inptr >= insize )
> +static __init uch get_byte(struct gunzip_state *s) {
> +    if ( s->inptr >= s->insize )

... both are compared with one another.

> @@ -1129,29 +1129,29 @@ static int __init gunzip(struct gunzip_state *s)
>          error("Input has invalid flags");
>          return -1;
>      }
> -    NEXTBYTE(); /* Get timestamp */
> -    NEXTBYTE();
> -    NEXTBYTE();
> -    NEXTBYTE();
> +    NEXTBYTE(s); /* Get timestamp */
> +    NEXTBYTE(s);
> +    NEXTBYTE(s);
> +    NEXTBYTE(s);
>  
> -    NEXTBYTE();  /* Ignore extra flags for the moment */
> -    NEXTBYTE();  /* Ignore OS type for the moment */
> +    NEXTBYTE(s);  /* Ignore extra flags for the moment */
> +    NEXTBYTE(s);  /* Ignore OS type for the moment */
>  
>      if ((flags & EXTRA_FIELD) != 0) {
> -        unsigned len = (unsigned)NEXTBYTE();
> -        len |= ((unsigned)NEXTBYTE())<<8;
> -        while (len--) (void)NEXTBYTE();
> +        unsigned len = (unsigned)NEXTBYTE(s);
> +        len |= ((unsigned)NEXTBYTE(s))<<8;
> +        while (len--) (void)NEXTBYTE(s);

Would you mind moving the body of this while() to its own line, as you
touch this anyway?

>      }
>  
>      /* Get original file name if it was truncated */
>      if ((flags & ORIG_NAME) != 0) {
>          /* Discard the old name */
> -        while (NEXTBYTE() != 0) /* null */ ;
> +        while (NEXTBYTE(s) != 0) /* null */ ;
>      }
>  
>      /* Discard file comment if any */
>      if ((flags & COMMENT) != 0) {
> -        while (NEXTBYTE() != 0) /* null */ ;
> +        while (NEXTBYTE(s) != 0) /* null */ ;
>      }

For these two doing the same may help, too.

Jan

