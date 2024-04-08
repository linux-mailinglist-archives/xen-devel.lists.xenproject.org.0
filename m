Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A1089BC89
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 12:01:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701881.1096469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtloi-0001KI-UZ; Mon, 08 Apr 2024 10:01:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701881.1096469; Mon, 08 Apr 2024 10:01:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtloi-0001Ik-Rn; Mon, 08 Apr 2024 10:01:32 +0000
Received: by outflank-mailman (input) for mailman id 701881;
 Mon, 08 Apr 2024 10:01:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WYQ4=LN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rtloh-0001Ie-FZ
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 10:01:31 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8bcb2c3-f58e-11ee-afe6-a90da7624cb6;
 Mon, 08 Apr 2024 12:01:30 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-34339f01cd2so3165271f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2024 03:01:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d6-20020a056000114600b003456c693fa4sm4312525wrx.93.2024.04.08.03.01.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Apr 2024 03:01:29 -0700 (PDT)
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
X-Inumbo-ID: f8bcb2c3-f58e-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712570490; x=1713175290; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UOx+rB7rPgYi29YWKQloasufj13NxXJ6buAFc5pUP5Q=;
        b=ec13XXbcVwQnWJsAsgjlbf3Bi7wxG4ml3o6oHkuwSZ7ktHHS5Vystlav4YCNs2w5dX
         142Nk4x6BtkEG2qP3GV0f95xFnH57vOTlDcS3WkwBfBCxScN7Q20dVZK5+4LlvMfG91J
         5gpC7Buq/sjIdwVmIX0KYRjGyfEsIq7Xd/nBWR0kY/ysvbxG9TTCO9aXvBMvKW7d8ajL
         GWAGzsv39KXSpM6SX1MZqEp5/XPOEnbB101XYA3CrHK+zqVIFqKAgidSTh/2wFmXzaTI
         1ZluOOKnsVVmGjamLReyb46gietA7+F3Y0JWS3meHvPaYOt+9M7fKZPFu1NTBDPfpUMe
         O1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712570490; x=1713175290;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UOx+rB7rPgYi29YWKQloasufj13NxXJ6buAFc5pUP5Q=;
        b=Tb/7iehMyK1flfxepC7IaYlSEsKoywsdlgpdNuYoOiSS4GOsS+213sbIX1iRNqgq1g
         lWntV6jGL4ay12psO/1lETAg4El8owi2aC1Yuoa0b8L9yTNxzLiRSwbvizTgeMpB5Zv/
         ao3igSWZLtofVOlNfGH4mzIUKTOa0zYG1EyovUyAqqTpGeeT/X71HGJ6xQ9vnwjnwDM4
         92QVT+bdGLu/hxusAp/1KlKqLG9yAPuuoExlsZxhi2xnVbmvz6shy1rsbTjAK+bF+3s/
         g1+5emxwA/FV74FoEkWn5UJpaJgcHnXtIbiZyopKEV8INMrj55sWjH57HlXNl0IUl5ry
         mv4g==
X-Forwarded-Encrypted: i=1; AJvYcCXE5nompVpeSMBMCW6wWqiAot10TyMKIpkociUTv56oiAqidFdOZdXzt3z1QxcC/7YNdLhT1weuJobnG2lJy7scKMzeR9/5fGH8mnHIVuY=
X-Gm-Message-State: AOJu0Yzmr5LUUl30E8EAAi9efe5W46UYpKpk2zMgQPZhDPepElykoWc0
	1Tvz4XiG20OFNJoC8F4AR+hr+Wuusxy5sLvUrEWgLbd1Ku2H6K6ZEoQ7FKDVEg==
X-Google-Smtp-Source: AGHT+IGAnCBNuskCiFTqjSno4zgP520NJHnAiceGL0Hd7R5+MQK5XXtSs5HMU8lcP74qqKUt8o59Xw==
X-Received: by 2002:a05:6000:239:b0:345:66a1:d92d with SMTP id l25-20020a056000023900b0034566a1d92dmr2848105wrz.29.1712570489868;
        Mon, 08 Apr 2024 03:01:29 -0700 (PDT)
Message-ID: <ea767998-7645-45d6-a752-a0b8c32de7f1@suse.com>
Date: Mon, 8 Apr 2024 12:01:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] x86: Add --force option to xen-ucode to override
 microcode version check
Content-Language: en-US
To: Fouad Hilly <fouad.hilly@cloud.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240405121128.260493-1-fouad.hilly@cloud.com>
 <20240405121128.260493-6-fouad.hilly@cloud.com>
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
In-Reply-To: <20240405121128.260493-6-fouad.hilly@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.04.2024 14:11, Fouad Hilly wrote:
> --- a/tools/libs/ctrl/xc_misc.c
> +++ b/tools/libs/ctrl/xc_misc.c
> @@ -203,7 +203,7 @@ int xc_physinfo(xc_interface *xch,
>      return 0;
>  }
>  
> -int xc_microcode_update(xc_interface *xch, const void *buf, size_t len)
> +int xc_microcode_update(xc_interface *xch, const void *buf, size_t len, uint32_t flags)

I don't think uint32_t needs using here; unsigned int will be just fine. The
line also looks a little long.

> @@ -215,7 +215,15 @@ int xc_microcode_update(xc_interface *xch, const void *buf, size_t len)
>  
>      memcpy(uc, buf, len);
>  
> -    platform_op.cmd = XENPF_microcode_update;
> +    if ( flags > XENPF_UCODE_FLAG_FORCE_NOT_SET )

I was wondering about the purpose of XENPF_UCODE_FLAG_FORCE_NOT_SET. I don't
think this constant is needed: Just like with any flags, simply using 0 when
none are set is fine both at the producing and consuming sides.

> @@ -120,12 +125,17 @@ int main(int argc, char *argv[])
>                      goto ext_err;
>                  show_curr_cpu(stdout);
>                  exit(EXIT_SUCCESS);
> +            case 'f':
> +            ucode_flag = XENPF_UCODE_FLAG_FORCE_SET;

Nit: Bad indentation.

Jan

