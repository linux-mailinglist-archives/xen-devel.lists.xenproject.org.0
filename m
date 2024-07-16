Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 549D59329BD
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2024 16:52:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759654.1169330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTjWw-0006ih-4v; Tue, 16 Jul 2024 14:51:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759654.1169330; Tue, 16 Jul 2024 14:51:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTjWw-0006gs-11; Tue, 16 Jul 2024 14:51:50 +0000
Received: by outflank-mailman (input) for mailman id 759654;
 Tue, 16 Jul 2024 14:51:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I1NN=OQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sTjWu-0006gk-Iv
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2024 14:51:48 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec3bcf8a-4382-11ef-8776-851b0ebba9a2;
 Tue, 16 Jul 2024 16:51:46 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2eabd22d3f4so64943841fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jul 2024 07:51:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bc49fc1sm59322945ad.263.2024.07.16.07.51.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jul 2024 07:51:45 -0700 (PDT)
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
X-Inumbo-ID: ec3bcf8a-4382-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721141505; x=1721746305; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uXA2np06jo1acnHXddvTwDk7dO9wqFsmdD6PEMM+7Y8=;
        b=UJls1FjcemB8s0sdMG/lVR7fM0GMxqKkBpYRZJ9E463JDO0r2ytzhIoXC3KfpSV7pA
         AH8EBNO/dyUdaPHQbrB1MOQztsaB5Y8Qwxir0wzRpVKQBAnXPzgNVlP9jk6e7dYPIOtS
         2urHqM1NXudVWSz8wf1MWe9++0Fr2TB40fZLyYSCfgQuSG/WQryIxsE4h/HXTyslh/yc
         RWSHij+XAlO+h3Q/dqtNT9nQSNiU8D40bgSXVA4gN+3UNe3VGQHRWoN83eQlfNGgjzTO
         uwBagaA+ydZhHOvz+J/0GJlm/3475JMgiWZcSCmoft0npx0bIGf8IgtAWopKfpWxwyKc
         eCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721141505; x=1721746305;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uXA2np06jo1acnHXddvTwDk7dO9wqFsmdD6PEMM+7Y8=;
        b=QuER/98jC7T6B/z7mrocaTWM5bFBPom7YoofuuAriJGdOyEhrVMAl3H6LcYRdeFjRh
         e2N0clpGR3k0KrCS6KJolcCg6VHsLq6Py+g7X5QfmxBqrw8Rqca9IOillhpNCAnww5gC
         FFWbve5Ru041FwC/hT414MUkwDh1KsT13YH8a9N0xV7FuaffHA9wJVVluoejyKHdnABk
         069fmDIvMDOb7mZtvMt6upr7lgyWrHq0PKQVt8GXCNQSmYuDTzRiNC+O4Hb7CjQ8Sb31
         i2VlnDc3LQq18IoiAJTmiHng6MSwZPLmhQfv+WWr27QSmEipo6JwYkV7nQyrZU3YjbBH
         ztdw==
X-Forwarded-Encrypted: i=1; AJvYcCXTB/iVVwPm7N7BfSUkIt7AJChWbMacHPR382qP/U7vOTdNE5GB1i5vhrFgyJ84EyX6lIK7SZp3tcVqzQTsA3hBycvCSM7VQmk72PHw1X8=
X-Gm-Message-State: AOJu0YwcCOW+jtCxt7/B5VB6QPfQ8zyzuB8BW3HCUk5y1ybf158Z8hGl
	nzGz71nh+svq+bXCJlGxyBXMJvRz6de7/pe8gIZSOpvvgJQ+A8VEp4BT6ttAQw==
X-Google-Smtp-Source: AGHT+IFpYVnLCb4RMdhssLtspPWu6HpMfQZHOretCPKLjjs6Byhn+GJkiin+k9xAGbg4WesP/rL4AQ==
X-Received: by 2002:a2e:9218:0:b0:2ee:5301:945d with SMTP id 38308e7fff4ca-2eef416aa70mr17778751fa.11.1721141505465;
        Tue, 16 Jul 2024 07:51:45 -0700 (PDT)
Message-ID: <35f9319b-801c-45e9-91c1-46ca61d49e5a@suse.com>
Date: Tue, 16 Jul 2024 16:51:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] x86/ucode: refactor xen-ucode to utilize getopt
To: Fouad Hilly <fouad.hilly@cloud.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20240712130749.1272741-1-fouad.hilly@cloud.com>
 <20240712130749.1272741-3-fouad.hilly@cloud.com>
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
In-Reply-To: <20240712130749.1272741-3-fouad.hilly@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.07.2024 15:07, Fouad Hilly wrote:
> --- a/tools/misc/xen-ucode.c
> +++ b/tools/misc/xen-ucode.c
> @@ -11,6 +11,7 @@
>  #include <sys/stat.h>
>  #include <fcntl.h>
>  #include <xenctrl.h>
> +#include <getopt.h>
>  
>  static xc_interface *xch;
>  
> @@ -71,12 +72,29 @@ static void show_curr_cpu(FILE *f)
>      }
>  }
>  
> +static void usage(FILE *stream, const char *name)
> +{
> +    fprintf(stream,
> +            "%s: Xen microcode updating tool\n"
> +            "options:\n"
> +            "  -h, --help            display this help\n"
> +            "  -s, --show-cpu-info   show CPU information\n"
> +            "Usage: %s [microcode file] [options]\n", name, name);

Isn't it more like [microcode file | options] at this point? Even when
--force support is added, neither of the two options here go together
with a microcode file.

> @@ -86,22 +104,34 @@ int main(int argc, char *argv[])
>          exit(1);
>      }
>  
> -    if ( argc < 2 )
> +    while ( (opt = getopt_long(argc, argv, "hs", options, NULL)) != -1 )
>      {
> -        fprintf(stderr,
> -                "xen-ucode: Xen microcode updating tool\n"
> -                "Usage: %s [<microcode file> | show-cpu-info]\n", argv[0]);
> -        show_curr_cpu(stderr);
> -        exit(2);
> +        switch (opt)

Nit (style): Missing blanks inside the parentheses.

Jan

