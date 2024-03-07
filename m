Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A6487489F
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 08:24:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689644.1074821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ri85j-0003mw-H9; Thu, 07 Mar 2024 07:22:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689644.1074821; Thu, 07 Mar 2024 07:22:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ri85j-0003k1-EB; Thu, 07 Mar 2024 07:22:59 +0000
Received: by outflank-mailman (input) for mailman id 689644;
 Thu, 07 Mar 2024 07:22:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tO0P=KN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ri85i-0003jv-Qd
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 07:22:58 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8436f1ad-dc53-11ee-a1ee-f123f15fe8a2;
 Thu, 07 Mar 2024 08:22:55 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a45670f9508so78418766b.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 23:22:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 qw28-20020a1709066a1c00b00a381ca0e589sm7911809ejc.22.2024.03.06.23.22.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 23:22:54 -0800 (PST)
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
X-Inumbo-ID: 8436f1ad-dc53-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709796175; x=1710400975; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/xmRdUvHLMnsKqHMkhW5o+z5O4BuUYwsSyD8ZCfnF+A=;
        b=P4fdnKs0DoVar7u7zk5BCrbTgNQ4eIEeVjL5v6Vcfxhj1PG7VitqxXW1EDtPjzGKr1
         82/hUtt3uNG1CkCgYd5ed24Y+9NNmgtAsvwmvYYhEJ/Nje+fUB6Q03j3CALq2l3xdZue
         XiRuiyoOS3Mno+PEivukccLI5LZbqxHDzcd+JJQq8U71DPJeTrVNadgRNXUNrYCwbUJI
         VWD7iDKJ2IaWdSoibroIjamt5lHwqztvyqjY+S4VSz5NXPifrBqPN7fzf+WzVpZHpe+t
         +KZuIq7KuQ7+leWHO/3ZANXFNO4XSGG/esW6I7ehXdDIlB2b/XWyzQp+4XaR8HbjFZma
         kb4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709796175; x=1710400975;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/xmRdUvHLMnsKqHMkhW5o+z5O4BuUYwsSyD8ZCfnF+A=;
        b=UVWalFwwDSlmFINrUw6f6cMR4UZajVw1ze4AmXAwRl9slWqZTt+abpvVRkK276v9Va
         1NyV1QYCHUpet4oKr0rpDpE2T6k1OcuDfizCKUcso6kRIInVdd5SfPABp6dPWHVC6KUp
         BzTOTzv1iYKozMjp25b1fiZmEWRnNDE7RHNLF0IReDIWrW3ItJkZ7+r0lqDq2ETnpkcn
         PEZDq6QZ3dtDUzBLKyfFPWNk3b+VSNsPTGksfIpIzQR4L7fTGnPLVY6Qo1JsZEyJJ/Dj
         c3tlZgY/c6t/X16Eb5QtAVPT705MJJpfxNr9wZIGLFI+5z2KdCfCBhZBbxx0FpVwMJoI
         BUyw==
X-Forwarded-Encrypted: i=1; AJvYcCUHfm/eWwokWC862q12n86UK8wh5Wj8QPNbQ39BMBDa1QMWTgdcSZ3vepPKeG4RlcLp/+P1Tvlqk9uVZ8Hw4JHU7nOBVjLf8UVtdL3Ddkw=
X-Gm-Message-State: AOJu0YzjnPbKcW+3WTyTTHGakBe4V1kx38XB+v0czfAQXw1z6Fo8uu/u
	bbPJU51AYSebF9Hj9IRGS5KEgUWIH9t/6lZ/jYsOwDq+e2Z01/Sw7f1D+S0I2A==
X-Google-Smtp-Source: AGHT+IGYNlPhtXoi1UiJ898y2bO3HMjKt2n+Y4J+k0ua9NGUAzcSWJh2VVOr5/e9RhWsw8D458xOkQ==
X-Received: by 2002:a17:906:1959:b0:a3e:93d0:3443 with SMTP id b25-20020a170906195900b00a3e93d03443mr10623437eje.34.1709796174928;
        Wed, 06 Mar 2024 23:22:54 -0800 (PST)
Message-ID: <7b98737a-c12b-462b-8e3f-593eced138e1@suse.com>
Date: Thu, 7 Mar 2024 08:22:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/9pfsd: Fix build error caused by strerror_r
Content-Language: en-US
To: Henry Wang <xin.wang2@amd.com>, Juergen Gross <jgross@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240307055450.3158740-1-xin.wang2@amd.com>
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
In-Reply-To: <20240307055450.3158740-1-xin.wang2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.03.2024 06:54, Henry Wang wrote:
> Below error can be seen when doing Yocto build of the toolstack:
> 
> | io.c: In function 'p9_error':
> | io.c:684:5: error: ignoring return value of 'strerror_r' declared
>   with attribute 'warn_unused_result' [-Werror=unused-result]
> |   684 |     strerror_r(err, ring->buffer, ring->ring_size);
> |       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> | cc1: all warnings being treated as errors
> 
> Fix it by adding a return value and check it properly.
> 
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> ---
>  tools/9pfsd/io.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/9pfsd/io.c b/tools/9pfsd/io.c
> index adb887c7d9..163eee6ecc 100644
> --- a/tools/9pfsd/io.c
> +++ b/tools/9pfsd/io.c
> @@ -681,11 +681,17 @@ static void p9_error(struct ring *ring, uint16_t tag, uint32_t err)
>  {
>      unsigned int erroff;
>  
> -    strerror_r(err, ring->buffer, ring->ring_size);
> -    erroff = add_string(ring, ring->buffer, strlen(ring->buffer));
> -    fill_buffer(ring, P9_CMD_ERROR, tag, "SU",
> -                erroff != ~0 ? ring->str + erroff : "cannot allocate memory",
> -                &err);
> +    char *ret = strerror_r(err, ring->buffer, ring->ring_size);
> +
> +    if ( ret )

While you're checking the return value, this looks to be the only use of
"ret". Which looks wrong for the GNU form of the function. But an up front
question is whether we can expect all host OSes / libc implementations to
actually support the GNU form. Using _GNU_SOURCE may, after all, then not
be appropriate for a component using this function. Jürgen, thoughts?

> +    {
> +        erroff = add_string(ring, ring->buffer, strlen(ring->buffer));
> +        fill_buffer(ring, P9_CMD_ERROR, tag, "SU",
> +                    erroff != ~0 ?
> +                             ring->str + erroff :
> +                             "cannot allocate memory",

Indentation looks questionable to me here, albeit tools/ may have different
preferences than xen/.

Jan

> +                    &err);
> +    }
>  }
>  
>  static void p9_version(struct ring *ring, struct p9_header *hdr)


