Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BCF8BCD84
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 14:12:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717601.1119974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3xBw-0008VG-G9; Mon, 06 May 2024 12:11:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717601.1119974; Mon, 06 May 2024 12:11:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3xBw-0008SX-Cn; Mon, 06 May 2024 12:11:36 +0000
Received: by outflank-mailman (input) for mailman id 717601;
 Mon, 06 May 2024 12:11:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gbjR=MJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s3xBu-0008SR-UR
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 12:11:34 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c78c8f98-0ba1-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 14:11:33 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-34d9c9f2cf0so1386113f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 05:11:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n13-20020a5d420d000000b00346f9071405sm10577419wrq.21.2024.05.06.05.11.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 05:11:33 -0700 (PDT)
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
X-Inumbo-ID: c78c8f98-0ba1-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714997493; x=1715602293; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B5rhoF8q7VZIX3oI/NbOVreFCdgRgYaV1D6l9CEVgVM=;
        b=E4nn0BPUTlZNh2nFXNpiX6zYjIB2zVNJeAqfJtCi26S3z51SBZjFExPfK2SfxNfJMh
         pt32GzXuW+sIHr9ePlN9O+14GRXjMrWzkv5GLmtMNujIWuZRrwYH+FPoySMfxnL9RCx0
         4gNmER7g/qBwOj00rwa2YHcPw3erb3grSIZl3VCxvfh/fvKBfsmaE0vTIMS+MndXgdmk
         Qy77kFAnXBMDFm5vyVV8iwz4kA2GNyfEp0GAqPiVxxUHqIkBxsC8NBsE64/+JSmFTZjP
         4V3W13B+Bf5E+Tr6H66F+V7gJAr4YtEJXWDP0zsYiFeAs3b5O8X7olT2fcy+Qxosu4kv
         wcRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714997493; x=1715602293;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B5rhoF8q7VZIX3oI/NbOVreFCdgRgYaV1D6l9CEVgVM=;
        b=leqMlvFqM47jIfq1G56r1fJmyyt6Bkw7LjS1pchtwC+66fH4e4631o5mE8XYeRJly3
         53SI1G3Wjh702wl5YBPwE399/Go4Vo9xES1r8l1GMNkgf/gS2Q05EA3wklPTFbPgpKtZ
         RHh8zfHsFdS+ydNOCZqImhyLVHG9Aatjv+HhmP/+PH2l/43GEtQ4YaRZQPQvQQRJlsWK
         dyxbj6/cK67bDLn0d4CW7gJtgfg3htY7gJF+/nr16SYmrgffIDkyly9FZyHgGPWJ2duW
         +3/qvoCCqhBrNFVNvev2ZXwntJTHc4uacctFRtQws1lCg3m40IEFj2oNjTo5wAlmavn6
         1dtA==
X-Forwarded-Encrypted: i=1; AJvYcCUADPk3fAdhATiW+aqJUGMiD5I9cBs2R2pv1M73BpwGEzbkZNifwVk2kbYRPBKgI7L5Fz65ojAM80gXE2992iwlt8asSh8G2Of0YnpyTk8=
X-Gm-Message-State: AOJu0YxQh2FHMb2Ej3al/4ywG4c4tDeL1oEbldtzWYu4mUOrrPWogjr/
	zXhHJPV1uOkRiouA5+KqwpwQcdxohsfMHPZ9dvB4LuwtOs8R3A6oHHtcSv36JA==
X-Google-Smtp-Source: AGHT+IGELMoGWj7XS02yT090pj1Pgn/rogR7hLMWYYhdwdpxYWLGQAocEfBILhm0HrAgl3v3QgvNhg==
X-Received: by 2002:a05:6000:c0c:b0:345:663f:cd79 with SMTP id dn12-20020a0560000c0c00b00345663fcd79mr8542837wrb.14.1714997493318;
        Mon, 06 May 2024 05:11:33 -0700 (PDT)
Message-ID: <99f6db77-23b8-4a18-b0b1-be4b9cd7f522@suse.com>
Date: Mon, 6 May 2024 14:11:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 07/13] xen/arm: add support for cache coloring
 configuration via device-tree
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20240502165533.319988-1-carlo.nonato@minervasys.tech>
 <20240502165533.319988-8-carlo.nonato@minervasys.tech>
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
In-Reply-To: <20240502165533.319988-8-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.05.2024 18:55, Carlo Nonato wrote:
> @@ -266,6 +267,47 @@ int domain_set_llc_colors(struct domain *d,
>      return 0;
>  }
>  
> +int __init domain_set_llc_colors_from_str(struct domain *d, const char *str)
> +{
> +    int err;
> +    unsigned int *colors, num_colors;
> +
> +    if ( !str )
> +    {
> +        domain_set_default_colors(d);
> +        return 0;
> +    }
> +
> +    colors = xmalloc_array(unsigned int, max_nr_colors);
> +    if ( !colors )
> +        return -ENOMEM;
> +
> +    err = parse_color_config(str, colors, max_nr_colors, &num_colors);
> +    if ( err )
> +    {
> +        printk(XENLOG_ERR "Error parsing LLC color configuration");
> +        xfree(colors);
> +        return err;
> +    }
> +
> +    if ( !check_colors(colors, num_colors) )
> +    {
> +        printk(XENLOG_ERR "Bad LLC color config for %pd\n", d);
> +        xfree(colors);
> +        return -EINVAL;
> +    }
> +
> +    /* Adjust the size cause it was initially set to max_nr_colors */
> +    colors = xrealloc_array(colors, num_colors);
> +    if ( !colors )
> +        return -ENOMEM;

In the error case you're leaking the (too large) array. IMO you want this to
be best effort anyway - try to shrink, but if shrinking fails use what you
already have:

    d->llc_colors = xrealloc_array(colors, num_colors);
    if ( !d->llc_colors )
        d->llc_colors = colors;

Jan

