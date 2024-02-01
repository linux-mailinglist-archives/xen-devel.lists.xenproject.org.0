Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61324845AF8
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 16:11:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674494.1049461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVYiH-0003vm-UN; Thu, 01 Feb 2024 15:10:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674494.1049461; Thu, 01 Feb 2024 15:10:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVYiH-0003sV-P6; Thu, 01 Feb 2024 15:10:49 +0000
Received: by outflank-mailman (input) for mailman id 674494;
 Thu, 01 Feb 2024 15:10:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFwQ=JK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rVYiG-0003sL-Kw
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 15:10:48 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13586c00-c114-11ee-98f5-efadbce2ee36;
 Thu, 01 Feb 2024 16:10:46 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-556c3f0d6c5so1263139a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 07:10:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fi7-20020a170906da0700b00a36edfb508asm15809ejb.79.2024.02.01.07.10.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Feb 2024 07:10:45 -0800 (PST)
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
X-Inumbo-ID: 13586c00-c114-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706800246; x=1707405046; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MpmtCMKIg7MG7KLzATLN7tvHdDRolI1j9YpQuU+oSQU=;
        b=aRqfkYsJs+etBmF9yFOy6h8zA1aQzCv/EcB3MOG8YiM3uDwvV0eis5dKYd0yk030Mn
         tuEbsRTgDLWHRPF8ziPQmfv+DQYIIXtAi/rR2oYUJ7abm0I28c6qUy6g7vhDMxBJWw/V
         R0xKIYLbq1D6DNhlz+MxdCmfOcF6BCOdOSB+mhMraugoDVF4HXMeX9O2BEIROo0Nctbr
         HI1JNfuW8QnDxZrRBbz+GcKLjp0/klevlZsN3b8FoMpBlJQ6oZ/XkQAUm1KfiRQ2QJSR
         wAC7Q0GR4DSBP5MI/BfJzdTCcbJtx1Rq3zGan3138biKTcmtiiIW4v57LZxJdQXTJr+4
         0fbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706800246; x=1707405046;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MpmtCMKIg7MG7KLzATLN7tvHdDRolI1j9YpQuU+oSQU=;
        b=nyVNdg7VFP74R2tCjnMTaapOygPGL0dtEr5A87bcH8q5vsT8cl/cLIzPSKSl+USjwx
         YkNtA0kkCvUA6SNArGnBscyD5qzOVA2G+x9k1oA1C8jzA86TzgQu3ZDFQwgWs2LFuAwl
         XOJS1Zs9kHHaAaPgflIsyrlxd3Ibmv40OVqTG/tF4jkSBv66As7OXRYgX70itm4rPLUu
         26UrDO2StIR+bdnyC48aER/mTnEuJkWqEEHk8ND0Bln/yIo1NHxxPdOeJYColdShRqTC
         AWjL7bpe/IT4iDXGKu9G2MSqtsF1F2xTlFdeltunjftkz5NXtlK8pJ2lsvgdXksxDyjD
         C60A==
X-Gm-Message-State: AOJu0YyuH9adlzYjfJiGN3ech3DId3HIt1OSO5Pe3NkusEYkPKUoNiUS
	XjQjo7C9A4frQbBqLzOiTcw9b1OjR+cOiO6vM2dXJrDAhsfKdnChFJMxyLSSSQ==
X-Google-Smtp-Source: AGHT+IFEpnKZ6B3Px3BJI0czRwgs70itxp5h5od8ByQw4MCMAbS+fVkWAyW/nE6DxqtxJDLUmYl4+Q==
X-Received: by 2002:a17:906:c7d2:b0:a36:9f72:2461 with SMTP id dc18-20020a170906c7d200b00a369f722461mr1894807ejb.69.1706800245952;
        Thu, 01 Feb 2024 07:10:45 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUzfX2oWSfXNYZuvfUjh+pvznlFpyEUpMiT0WSDrvE8dnVPoAMp3WPZtAMOoNSQS7LmXJ/EF1CCBpmzXbZf3NkMmHsFJAt7rMEgA4X2HU2h6sD1BVo66/y7DFAf18k2gEDLWCS2Qzby1Nr3kunL7Y4J0tDGwkVQSFfmkV/BPaCBX5+fC+pI4kg5SEWFSThBoH/vzRlIjdV7leLV30skF96fu1+TSn2qpIHFsT0TAhchgVf00Mwb+WSYJtOxOrWuvwrrkkoPOgk1gJmvuooptMY/welzze3JbzRjSZ0At3jRSG09y/gvQbDvLcUu
Message-ID: <b39e8700-62ce-44f1-b1bc-f25bb4f27898@suse.com>
Date: Thu, 1 Feb 2024 16:10:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/15] xen/arm: add Xen cache colors command line
 parameter
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech, Luca Miccio <lucmiccio@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-13-carlo.nonato@minervasys.tech>
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
In-Reply-To: <20240129171811.21382-13-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.01.2024 18:18, Carlo Nonato wrote:
> --- a/xen/common/llc-coloring.c
> +++ b/xen/common/llc-coloring.c
> @@ -9,6 +9,9 @@
>  #include <xen/llc-coloring.h>
>  #include <xen/param.h>
>  
> +#define XEN_DEFAULT_COLOR       0
> +#define XEN_DEFAULT_NUM_COLORS  1
> +
>  bool __ro_after_init llc_coloring_enabled;
>  boolean_param("llc-coloring", llc_coloring_enabled);
>  
> @@ -21,6 +24,9 @@ static unsigned int __ro_after_init max_nr_colors = CONFIG_NR_LLC_COLORS;
>  static unsigned int __initdata dom0_colors[CONFIG_NR_LLC_COLORS];
>  static unsigned int __initdata dom0_num_colors;
>  
> +static unsigned int __ro_after_init xen_colors[CONFIG_NR_LLC_COLORS];

So unlike for Dom0 here you use the static buffer at runtime.

> +static unsigned int __ro_after_init xen_num_colors;

Taken together, I don't see the value in having XEN_DEFAULT_COLOR:
One can't simply change it and XEN_DEFAULT_NUM_COLORS to have Xen have,
say, 4 colors by default. I think you want to have xen_colors[] have
an initializer, with XEN_DEFAULT_COLOR dropped and XEN_DEFAULT_NUM_COLORS
moved. Or you actually allocate the runtime buffer if a command line
option is found, and just use ARRAY_SIZE() as the default count.

Jan

