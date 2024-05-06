Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DFB8BC96D
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 10:20:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717297.1119353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3ta7-00079m-5v; Mon, 06 May 2024 08:20:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717297.1119353; Mon, 06 May 2024 08:20:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3ta7-00077n-2k; Mon, 06 May 2024 08:20:19 +0000
Received: by outflank-mailman (input) for mailman id 717297;
 Mon, 06 May 2024 08:20:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gbjR=MJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s3ta5-00077h-Vh
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 08:20:17 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 782abf08-0b81-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 10:20:16 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-34e0d47bd98so2204210f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 01:20:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 i15-20020adfb64f000000b0034af40b2efdsm10059143wre.108.2024.05.06.01.20.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 01:20:16 -0700 (PDT)
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
X-Inumbo-ID: 782abf08-0b81-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714983616; x=1715588416; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s2rPXEsoE9bbs26kSdurMoDF4s8RZXdUIvKwrhiHXQs=;
        b=SJhjf+gWleW0Q8Po+oQO/wyR0LGLFgYXFXZ7I6p7reHG4P+0VM3XD9U54BNd80Tg+h
         IEtZ+ogPZ4ZUBuLaaecBVq4pRIMw3UJfnw9CcSdW9pIokXtmQGXNGmObEGrt6dT3w78X
         /+Md/yrjjLms7FXb1BVuRRVYgpHHUYkvlVxj6W+/FhsQ+s517iefi5jFLKyyloqjWZv2
         ug/HoSY2lXwj26KtET2rTiYyVeY//oIWRB/8YquYYRZoV6S+L5RuHlgcqBkdYBhKsCxA
         gQtZIXwXju+3nf15doLMxa8QbsJZOeKq9vlm1HBOsXj+eqlmHi+u64s8wOdawZjbnUWx
         VXbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714983616; x=1715588416;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s2rPXEsoE9bbs26kSdurMoDF4s8RZXdUIvKwrhiHXQs=;
        b=u5LoEQj49sEbdvPIIYytUeROqsPUJ4cR6wzoX14Q8APzpxLTd3u8Cewqk9Y+hNYETX
         TAH13mn0aDo8E+aSgZhb2vJfZbHJCFyj7Z8T2zRbT/1J+qnq18FT2TTsW3RjIIe7g8Ud
         QX5H9UpzRsl4D590wbNjWmOjwtF73Q9AL5MUzPGcQn573Yt7WTbUrDRRwbcmSZSU6Eqa
         mVbuwgeOjXUB+ZMONCxXloC5a5iQsO9cOQeFjEB0I5eiM2ruDQEIglYaoz4O0bcHOj2A
         cq8E3kCjK5rboIWEJEfqhnVZshNfNoaeBikpQNjEE1JsmTh68THcTltUTsPRZNgrAjnE
         5ZRg==
X-Forwarded-Encrypted: i=1; AJvYcCWVf4hpb7nddVdatBGzwm5BD3LsBfJh62h/9EeCdbKSVP5ARnTiZNMuJzIuBUNxGKOsLphB74xkZtck/8KN0B/mtJQ72QmC71s0ziN+1As=
X-Gm-Message-State: AOJu0Yw8pOlX6LWAHgXHQFApsMSpKKkFxloCyOnFvu89eCrJ5Qcarbi/
	VMBr/h+WnDCx8L8O46/LPv5SRxOqYuf9lm9S9w4/eg8rd8q8h2yKtqt0tbfGaA==
X-Google-Smtp-Source: AGHT+IGImdOw5vmpKIpDmL62hzspCxmOJQS2Eof0CXMuQUtVvywxBvsiif33w5bhse7bZSi82gPu7Q==
X-Received: by 2002:a05:6000:c0a:b0:34e:de3b:3ccb with SMTP id dn10-20020a0560000c0a00b0034ede3b3ccbmr3835159wrb.14.1714983616250;
        Mon, 06 May 2024 01:20:16 -0700 (PDT)
Message-ID: <cc1f42bf-7629-41fa-99b5-f77f15a371be@suse.com>
Date: Mon, 6 May 2024 10:20:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] x86: Add usage() to print out usage message
Content-Language: en-US
To: Fouad Hilly <fouad.hilly@cloud.com>
Cc: Anthony PERARD <anthony@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240430124709.865183-1-fouad.hilly@cloud.com>
 <20240430124709.865183-4-fouad.hilly@cloud.com>
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
In-Reply-To: <20240430124709.865183-4-fouad.hilly@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.04.2024 14:47, Fouad Hilly wrote:
> Refactor xen-ucode tool by adding usage() to handle usage\help messages.
> As we add more command options this will keep help\usage messages in a common block.
> Only generic error message is printed to stderr. usage and show_curr_cpu are printed to stdout.
> 
> Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
> ---
> [v3]
> 1- Reverted usage message.
> 2- Utilized usage().
> 
> [v2]
> 1- Improved message description.
> 2- Fixed formatting and indentation.
> 3- Error message to print to stderr.

Already on v2 I pointed out that this change wasn't really done. And now,
in v3, ...

>  tools/misc/xen-ucode.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/misc/xen-ucode.c b/tools/misc/xen-ucode.c
> index c6ae6498d659..005bf85b6551 100644
> --- a/tools/misc/xen-ucode.c
> +++ b/tools/misc/xen-ucode.c
> @@ -17,6 +17,13 @@ static xc_interface *xch;
>  static const char intel_id[] = "GenuineIntel";
>  static const char   amd_id[] = "AuthenticAMD";
>  
> +static void usage(const char *name)
> +{
> +    printf("%s: Xen microcode updating tool\n"
> +           "Usage: %s [<microcode file> | show-cpu-info]\n",
> +           name, name);
> +}

... you're still unconditionally printing to stdout, when ...

>  static void show_curr_cpu(FILE *f)
>  {
>      int ret;
> @@ -89,9 +96,8 @@ int main(int argc, char *argv[])
>      if ( argc < 2 )
>      {
>          fprintf(stderr,
> -                "xen-ucode: Xen microcode updating tool\n"
> -                "Usage: %s [<microcode file> | show-cpu-info]\n", argv[0]);
> -        show_curr_cpu(stderr);
> +                "%s: unable to process command line arguments\n", argv[0]);
> +        usage(argv[0]);
>          exit(2);
>      }

... originally the usage message (correctly) went to stderr in this case.
It ought to go to stdout only in response to something like a --help
command line option.

Jan

