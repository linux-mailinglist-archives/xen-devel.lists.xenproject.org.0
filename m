Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB28B07278
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 12:03:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045034.1415102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubyyZ-0000J0-6O; Wed, 16 Jul 2025 10:02:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045034.1415102; Wed, 16 Jul 2025 10:02:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubyyZ-0000Fm-3C; Wed, 16 Jul 2025 10:02:59 +0000
Received: by outflank-mailman (input) for mailman id 1045034;
 Wed, 16 Jul 2025 10:02:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ubyyX-0000Ff-Ox
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 10:02:57 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b1a6b16-622c-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 12:02:55 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-455e6fb8057so51820295e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 03:02:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9f64c73sm14130999b3a.141.2025.07.16.03.02.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 03:02:54 -0700 (PDT)
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
X-Inumbo-ID: 0b1a6b16-622c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752660175; x=1753264975; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=onwhGk6Lsb/8tW0JaKHuT95WimKdwyBN9aeijqwgIxY=;
        b=Yeg+op9sU3bQCPQtNBe6TRtwnThj96PyQWX9LjZH6//XL7RFfVkekbLiFGQaWp37YP
         g4V+Pdm6bN+iSMu8YMEfTe/GLQUxYAOHbP5Tx+6N8j4GFaWywufXzreXp2vVWTxTJNTL
         x+gVspNPXnTMf6xNS0lGe0ErN8LtjmvSYqp02+pbcyHRizHH0ljlbFGdWGJQKlzUzmzY
         G/i1pCe0g/O/ePu9kIlIbgsrLjqpHtKlkimE644upvgP2DhR/L29K9pNR9USWnn1ybTO
         FUNh8WSVmMaFmdLMoW7J1b6jbmZuTyxk8njzd3G+i1UfUS23e+3kse7Slg7qsff9LYqo
         +/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752660175; x=1753264975;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onwhGk6Lsb/8tW0JaKHuT95WimKdwyBN9aeijqwgIxY=;
        b=ruaHgmF0TwNmseuZAWF+/v8irp6Bn97AHDY4pxnYes7GzvmjJBtSJxvRv90nM90v06
         gvqCHuTAdYWXfrXso2+lwlQxgNn+9toBTiA7N5nWrL5YGFsC/BLhOkbyBB4S1PKnLR7I
         SiqjY/WzjmuQ96pFL/7U1w+hIQhtTRorgOogIdaJb4XdG3vo6mGDGt520mMgIn1NaAXP
         /zcf8E/z1IPL1JxNK/eFQRd1A4aaxBjiYtpwPJDL0KpbU3I6JWpydhDfhNd7dKG2U3KX
         p6fCRdzQmafDNFpmRknZdFzbylaRMhA181rMLWVkSkY14eD7kK3IAjfQ34clHN9kAQY0
         SDvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOI22Sr+FBhLO+3ZV3vkgn9Pf1YjcTR5c/3fskSX7EIYkDwEhjeKPsfsWJfMXpWkrPjN9lUt59uxg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyXmguS8sB4+8FYrOHchkyPSsGKpJJ0UGIbvn+yEXT903fuiLyv
	VOuDw17kB/Za6Wt8E9cWBb65tI4ruCIvGo2sOqtt6cuHL2vc6VsHdHLhVvYoBsMdhA==
X-Gm-Gg: ASbGnctdM61Hy2TWJSLk/Bu+Oh8+Wrn36wET+dxIx+4c3yF12/kbFbsNWDhlwaZXDqG
	30YweCZ3gNicgW9B7vW9bvZ4IdMNQ+xAjvTs8OPhjU9TRm6uUWC0s/81HVR0vtbe28xmi/OMlUp
	ssC7h/l1Tt8za2NF87NomsdlWJFgY3OqajAmOog43VxlLKcl+fydQ/O776pQZFdgrkItcCDEio7
	/PZEFbvBOUqAU+h1ZQF8EIXDe30MmMJj8KIkFS2AnftKWLxUqtcV0Z196EyXqtQHyQJhQrsdtuK
	nJ3qfoMV0Md7LvIUz41LECJOjT2Cib6IjMAZfjtKCRIfOjfIfAvaxoB5t1iFQqBsj+Q8Ob8Qf04
	DH8e1s/zyRhp8g0apA9YFeoXvThddbZelmpnquQQApSx7wlHKBc9nSrjpofReckIxcIwUdzeZ/O
	CzcU71riA=
X-Google-Smtp-Source: AGHT+IFu7sMWHsuH8iU3b4Cir9g611c1cJRgC1Y/t06ReeTm7hmeNRikMYncqNHB3G+9aKFIAoPymA==
X-Received: by 2002:a05:6000:1448:b0:3a1:fa6c:4735 with SMTP id ffacd0b85a97d-3b60e4f2c5fmr1571073f8f.35.1752660175028;
        Wed, 16 Jul 2025 03:02:55 -0700 (PDT)
Message-ID: <47207b59-7393-43c0-989d-ff2faa28b950@suse.com>
Date: Wed, 16 Jul 2025 12:02:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] hvmloader: clean up SMBIOS code style and
 formatting
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1752533080.git.w1benny@gmail.com>
 <8ab4c14518b4ae4eb327fb147058f0eec3ff29c7.1752533080.git.w1benny@gmail.com>
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
In-Reply-To: <8ab4c14518b4ae4eb327fb147058f0eec3ff29c7.1752533080.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.07.2025 00:49, Petr Beneš wrote:
> From: Petr Beneš <w1benny@gmail.com>
> 
> * Removed trailing whitespaces
> * Removed unnecessary pointer casts
> * Added whitespaces around &&
> * Removed superfluous parentheses
> * Use variables in sizeof() where applicable
> 
> No functional change.
> 
> Signed-off-by: Petr Beneš <w1benny@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with a few more adjustment, which I may take the liberty to do while
committing:

> @@ -411,12 +411,12 @@ smbios_type_0_init(void *start, const char *xen_version,
>      /* Extended Characteristics: Enable Targeted Content Distribution. */
>      p->characteristics_extension_bytes[1] = 0x04;
>  
> -    p->major_release = (uint8_t) xen_major_version;
> -    p->minor_release = (uint8_t) xen_minor_version;
> +    p->major_release = (uint8_t)xen_major_version;
> +    p->minor_release = (uint8_t)xen_minor_version;

These casts are pointless, too. Since you touch the lines, you could as
well have purged them at the same time.

> @@ -482,21 +482,21 @@ smbios_type_1_init(void *start, const char *xen_version,
>      strcpy((char *)start, s);
>      start += strlen(s) + 1;
>  
> -    uuid_to_string(uuid_str, uuid); 
> +    uuid_to_string(uuid_str, uuid);
>      s = xenstore_read(HVM_XS_SYSTEM_SERIAL_NUMBER, uuid_str);
>      strcpy((char *)start, s);
>      start += strlen(s) + 1;
>  
>      *((uint8_t *)start) = 0;
> -    
> -    return start+1; 
> +
> +    return start+1;

Add the missing blanks here as well while touching the line?

> @@ -920,24 +920,24 @@ smbios_type_22_init(void *start)
>  
>      *((uint8_t *)start) = 0;
>  
> -    return start+1; 
> +    return start+1;

Same here.

Jan

