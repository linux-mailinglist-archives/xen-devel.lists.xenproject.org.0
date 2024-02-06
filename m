Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4582C84B1A4
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 10:54:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676720.1052955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXI9e-0000Ha-LG; Tue, 06 Feb 2024 09:54:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676720.1052955; Tue, 06 Feb 2024 09:54:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXI9e-0000FJ-IX; Tue, 06 Feb 2024 09:54:14 +0000
Received: by outflank-mailman (input) for mailman id 676720;
 Tue, 06 Feb 2024 09:54:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gccX=JP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXI9d-0000FD-Jn
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 09:54:13 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad46879d-c4d5-11ee-98f5-efadbce2ee36;
 Tue, 06 Feb 2024 10:54:11 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-511413e52d4so3529044e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2024 01:54:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o25-20020adfa119000000b0033b437f3216sm1675126wro.74.2024.02.06.01.54.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 01:54:10 -0800 (PST)
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
X-Inumbo-ID: ad46879d-c4d5-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707213251; x=1707818051; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8UWJnYtEMGQtCa1T6Gl0yX15YIuBgiUtiUSuo4amgWM=;
        b=aeU4ap3d/X8u6dm88l4FERjBtwZ1GpUetlhTy/3ujw9rmzI5lg8MYahlcQWOsJQJdB
         /GdDH9d6OtiHNJ8Sso80bjNdBo8nwxuIaMvLYxuXCFvNbZLxp/a1ud5ggeQXC8t44gvY
         SvGEcu6rUBFfwdjQp/oT7pK0qN9b9XMMGj024ZCVXSuqLiYSvOi4esSwDuGF4i0wTc6P
         1U/V1AxhjIH2RgZYt3QLXfGVpaSZyXoMP2K/TsLOP70052K2z6VXVRrmARtiWxV0CsHQ
         LjZtQhJOt1F9dxWTFRIT7gO+7wdhBItvLzV1aVT38tiMCCzL8PtqW2y7yCEd6NbGtF1V
         peRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707213251; x=1707818051;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8UWJnYtEMGQtCa1T6Gl0yX15YIuBgiUtiUSuo4amgWM=;
        b=seYmjhlCgsCt7sVD4Zamb3zpeYQ9lNgAJ3S7AgUSIVBFM42qCFD383ls59MhX5ckLN
         UMGD7+C8QuX4O/Il6zjK4PIm9O7ZTIMawPVRxyA3virPBhs09wIdcPPI4sAaAdLEqBx6
         jn4TPpKD3n4ha8MSNjxd7v8yRn0vnvE8wJWq4T7dBZq80bHD1dsF62VhasGsOMafdZ0I
         8siP+DlsfwQjyrmt/WNVttV4MP/5DUp0X53cpJSMHjokBJZr6PbPonpB9vWzPc9MrngZ
         wkiVeiQKa/4GI4dTf0CV7Wh5E68VcF/3YxSia3o62ouVG6StxTMLjTP/5HB+ngipVZ19
         QB2Q==
X-Gm-Message-State: AOJu0YyuVE+HAOamSDLzhU8U0LzlcAJCRWkaJfJeKjg1nR8zwohR8Sxl
	46zlY1+MY0FL+63xxzP01EEB1VVwVEfXClNlfAe5QLq3Cew9XzrXY7PMC9cMMQ==
X-Google-Smtp-Source: AGHT+IEweeEDvPP57kGdadllL3gb67m1LRTXuuTNp0wlPByZm2bYQc9oflIZa8A5tULSckFM4pGlBw==
X-Received: by 2002:a05:6512:33cc:b0:511:5724:dcd1 with SMTP id d12-20020a05651233cc00b005115724dcd1mr1878893lfg.11.1707213250969;
        Tue, 06 Feb 2024 01:54:10 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUhtjaWV1kZrLqpS98bkVIsJXM+al18LT1Jww3h6bDsRGey7+mGXvqM+1jEaODEtKZ7UpWX7/mBMl7k70+0TfryYcuM1DVswCo30zd/+2ouDoHjMKLpJaNc1vucdFmBNFe9Ov7Eba+Yd6ziIti4bva8YQQMV/5M5V7R0aOf7ei3Blzc
Message-ID: <90090302-ec5b-427e-8f64-aa57ce4aa19d@suse.com>
Date: Tue, 6 Feb 2024 10:54:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/bitmap: Compile with -Wsign-conversion
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240205151454.1920291-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240205151454.1920291-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.02.2024 16:14, Andrew Cooper wrote:
> @@ -263,7 +266,7 @@ int bitmap_find_free_region(unsigned long *bitmap, unsigned int bits, unsigned i
>  	unsigned int pages = 1 << order;

If we mean to keep this function (see my reply to the other patch),
shouldn't we also check "order" along with

>  	unsigned int i;
>  
> -	if(pages > BITS_PER_LONG)
> +	if (pages > BITS_PER_LONG || bits >= INT_MAX)
>  		return -EINVAL;

... these checks?

> @@ -278,7 +281,7 @@ int bitmap_find_free_region(unsigned long *bitmap, unsigned int bits, unsigned i
>  		if((bitmap[index] & (mask << offset)) == 0) {
>  			/* set region in bimap */
>  			bitmap[index] |= (mask << offset);
> -			return i;
> +			return (int)i;

I agree with Julien that it looks like this change actually belongs in
the other patch.

Jan

