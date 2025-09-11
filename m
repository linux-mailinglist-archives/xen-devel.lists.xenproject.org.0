Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3B4B52BC4
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 10:35:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119757.1465006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwclj-0002Wn-6V; Thu, 11 Sep 2025 08:35:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119757.1465006; Thu, 11 Sep 2025 08:35:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwclj-0002VK-2u; Thu, 11 Sep 2025 08:35:03 +0000
Received: by outflank-mailman (input) for mailman id 1119757;
 Thu, 11 Sep 2025 08:35:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dUpj=3W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uwclh-0002VE-Ik
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 08:35:01 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2cf4ee72-8eea-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 10:34:47 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b0411b83aafso63645866b.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 01:34:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b33478e4sm79430366b.96.2025.09.11.01.34.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 01:34:46 -0700 (PDT)
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
X-Inumbo-ID: 2cf4ee72-8eea-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757579687; x=1758184487; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6om+MgAOmuQxmj0lBwEIDPkVNrCBj3qz4cJqW+B19+A=;
        b=XeWWvtB/FN27f/WyfJ1oynaQnQ9aJ26vKp2mabkd3eDOxK4WObHLFukCehGJazRQGb
         VJrNFbO2KGrP5P4YFtWTTbyaJway7cXQIlBIYDQ/0PGKUrXgSORbym/P2QEc2tmPGs7o
         bgv8LMtcPusHWvsQYGQEugNDR5HuTYf8jx9D5YQotRFWXEokh3EOtoxEliFp8C9GOKRc
         NqMPlm7FGkNSFInOpZO6imeGJk8aCkRJwBHovZwJVL3seHqITRrHjXn/pWkAHKFOEkG4
         sqyMlSrWxezDvV4SgZ/lDPemvLaEX/QtTwjbo32mzdSzvjCbFSqGpJsO4bnW2b0295vQ
         ygjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757579687; x=1758184487;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6om+MgAOmuQxmj0lBwEIDPkVNrCBj3qz4cJqW+B19+A=;
        b=plNJUgKXuodN2GXAHxlP/DfROc83jjdxc11H7zKUgrBVCDcDUUhgnNR8gbl4DPLFxE
         JQk6QMw1Je9+ieBVzkklCRbNrVGOythQtRoCySdUuO7GdRmjnQWbVAQ2NSOpWvbAydPJ
         /OS2QwQiyCeR4JTikDrYyeQpa9buv7abhNcZqDCv94O2oEYpktNxASeZc3OZzROGtCyu
         H20oCAVqYvZQU6HIABhzy3T69dqw6xFXmHKFRukfr/XaZkH8JRzJEEPn9WqFQVD9UBHM
         XIM9qNeiyrpkCFRi+ilbM3teNZwR8xql284b1trGQrucMcvQeOAcvnPswaCvsNUisea6
         7M/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUfOpdDPwfNse+YH6E5kCfnZzG2wUyRSaBwv+oNIIrYqLl8XLn6A7g9gVHHCH0ZCA2KR5Nv7VgYsXI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyQHojXB2YkjASroILfnoAGumphMaX6i22gFfLhUdm6pGfxs6BC
	uMIGgKlq98tGhunwXv5hrZSdrKQHB9ZJOpH4F7r8CHr7nWm2nEDbRPpaA87R+WHpN6anKcBDFIP
	fe+8=
X-Gm-Gg: ASbGncvT9vYLeY/CjAb1+kWbFEpS/TQd1tpf9EQ3Gl3u936Jr0tbwS8+CIRL+/lGxm9
	ePCIzHiJayU3ZVI7Ow+t56CWqwgZ/bVO5vqPabnmnxrFuYEYtVofwC/Jc0vflAaWXykJQv/sfSN
	ChxaKzCopqtKKLnaq09QRrzwjJqtwtQ7cQfNGSYnPTqPAZG0oUNB8UfcNg+9qIr29yrCMe5WCar
	cp+ixf5F6jZJeymlurIArBAE7o9v2SBLkk11ch6cgeKJmRX76oOnTT3cfpyE2lRru6+/3uAV3RT
	wkXvARK13ylnu1u2igha4bos4NHqvM7JKMezR5YBE89UgK/3I+03kn8iwIIdb4DwzBFzJUxjZMd
	tjtged5ncJDKl1EoLUnz83pFkFR7jbWU9EJGcgSYOgEHexJzB4wwGL9Sbb8jxZIShT+jiVZrx1J
	BFxucfYmNiEDbekVSsRQ==
X-Google-Smtp-Source: AGHT+IGKeO0u3ps5n1Fad3J0ER9y7vjudn1pSBY6n1ak9068BaHbvyWqXC8bI00X7CYymSUfYrU7wg==
X-Received: by 2002:a17:906:1b14:b0:b07:87ef:9d9e with SMTP id a640c23a62f3a-b0787efaa43mr453561166b.61.1757579687140;
        Thu, 11 Sep 2025 01:34:47 -0700 (PDT)
Message-ID: <48e537f5-2379-4b8d-a9b5-4761225a855a@suse.com>
Date: Thu, 11 Sep 2025 10:34:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] efi: Protect against unnecessary image unloading
To: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <cover.1757519202.git.gerald.elder-vass@cloud.com>
 <1f7b5737d4b36623af2734d525c895b77fef08fc.1757519202.git.gerald.elder-vass@cloud.com>
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
In-Reply-To: <1f7b5737d4b36623af2734d525c895b77fef08fc.1757519202.git.gerald.elder-vass@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.09.2025 10:24, Gerald Elder-Vass wrote:
> @@ -1078,11 +1078,12 @@ static void __init efi_verify_kernel(EFI_HANDLE ImageHandle)
>              verified = true;
>  
>          /*
> -         * Always unload the image.  We only needed LoadImage() to perform
> -         * verification anyway, and in the case of a failure there may still
> -         * be cleanup needing to be performed.
> +         * If the kernel was loaded, unload it. We only needed LoadImage() to
> +         * perform verification anyway, and in the case of a failure there may
> +         * still be cleanup needing to be performed.
>           */
> -        shim_loader->UnloadImage(loaded_kernel);
> +        if ( loaded_kernel )
> +            shim_loader->UnloadImage(loaded_kernel);
>      }

To me this looks as odd as the earlier unconditional unloading. How would a
halfway sane implementation of LoadImage() return an error, but require
subsequent cleanup (and set what the last function argument points at to
non-NULL)? Unless explicitly specified otherwise, my expectation would be
that upon failure loaded_kernel could have any arbitrary value, possibly
entirely unsuitable to pass to UnloadImage().

Jan

