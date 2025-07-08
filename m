Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 683A6AFCF7E
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 17:41:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036810.1409271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZARa-0002rw-Ik; Tue, 08 Jul 2025 15:41:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036810.1409271; Tue, 08 Jul 2025 15:41:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZARa-0002pY-Fy; Tue, 08 Jul 2025 15:41:18 +0000
Received: by outflank-mailman (input) for mailman id 1036810;
 Tue, 08 Jul 2025 15:41:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZARZ-0002nF-3H
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 15:41:17 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fbbea314-5c11-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 17:41:15 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a4f379662cso3966206f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 08:41:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c8457a732sm115009415ad.143.2025.07.08.08.41.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 08:41:14 -0700 (PDT)
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
X-Inumbo-ID: fbbea314-5c11-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751989275; x=1752594075; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8yx+Fn4qeZ3xhPsbRgDb4xu/K8LOUgD7PhNl4VmmrrI=;
        b=giSXGbK7pUZoNN4Npm+wnDyb6YJFIN/KzpDpzWedLRPxgcCfnD9Mcel1SpE3oYHjjy
         1OzADE3RuLKPgV49HvLMjtzHVjNHnivvuaC+MPVcxwMFDQa3iQ2O6H4cVVK040u9mC7y
         dBwbp+vQiadw9wSacXfJxt/GxcpJ93YFuq28jOcmDW3IrN4KAbVh5WUmpCwlxMs1JIlh
         AAP/RSeMTOzcZlTPGg2lSRFolptNYjllRFKLDg2iMrDCL3pUNnxByAKoBhEFuNPiyqtp
         1JD1Ue2HQc9pjkiwwSZrdmJiskOtkIpmjhzP84wZsb5r8f7ZbHMSMIad58zXd9PX0iq6
         yU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751989275; x=1752594075;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8yx+Fn4qeZ3xhPsbRgDb4xu/K8LOUgD7PhNl4VmmrrI=;
        b=k0JYyx7sGbmwufMAPur5goTlSLNxQhB89c9rZ3jQkpwcqGF8UMQZ+oA+7LxCHwEPmM
         NPPpsd25GqKuPTFlMS6lOa5nsurzJexeRNLiQz7QKcS985utDNGpJmVW9Oi3T3HR845p
         WZFTTOuLbxHxaC6Nei2OmlHOgBtQoZ1ttkv1YhnVXJQST6dQ+UlIiXrSKzdYkgXbeYj5
         xoWWz0vPgMu4k6jzVRcLcdyhzfTvfpmCVKJhNYEm75fJGj6C7YczwzEjopVid9q7Y9Td
         /h8PFUOY6vjz/Y+Ex+qrr0Vulf8Qv0UYxjKr7qZKlCistCugAIm1bhOCwyr9kII1k3a+
         pZFg==
X-Forwarded-Encrypted: i=1; AJvYcCUqst8AxBHgbRTzGNVIykfgkwZaqQ+q9Ae2ycKfzP5+8bZACERBBapMSfDc0NqiASIwiwd407TqCb0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxD7t0AyZyCvf+u3SFqBRRBbyS43dpd/DsJdZBYG2gECWLkAxe4
	2RV4aunVr2zhY/MD7e/PDbQhad1P5LV0bxooEZILIanxj9ZTfPMYAl93S8S0n45uRw==
X-Gm-Gg: ASbGnctb5SV2cnr8I6mb1XgUhHZVrzkII3pzJ5szbSoLga8J4Pn29TeLmkYLsT7oC3E
	THlncwnFmnxW0ImSr/tZicDvvTj+3XH/yHTOhYnvDeyzsGxheiTgsNECMr9Wg++8I2o3pN0ahCs
	xl2X4LO6VcNfiD8zxLtFvQPGyk8J+Dxmqn2NcaAWB5AU49cPGzkworyszyTuzH6TmDdpG8v+YcP
	uOFPMqG84NTJiIRlwCAIH921uuyrvun9UHEvHkUuN6xBofWa05ywHKP8+hMaj/O1PGUuqMmZFML
	+lYZaaMd9ZuiBeCwv34gQN1O/eJ1byGRt7TjxbRt4qkCiRkDFrsgCHaSAqoMAhYVvMhigHrmQkQ
	VxDoVgYoecSAPGE0xKM+waDI3EoBH2tozRjF92bctr+Ax9Qs=
X-Google-Smtp-Source: AGHT+IE2t1Ro8FxiuJRzw7tetKeSy2QYKqZGK1ZoM4+75FWEs8HDHNMSaYpYReU43oLcWGTRo9l85Q==
X-Received: by 2002:a05:6000:1449:b0:3b3:9c75:a4fb with SMTP id ffacd0b85a97d-3b497029621mr15216007f8f.33.1751989275036;
        Tue, 08 Jul 2025 08:41:15 -0700 (PDT)
Message-ID: <662366f6-7442-4b36-81a6-90ddcad6e59d@suse.com>
Date: Tue, 8 Jul 2025 17:41:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/efi: Fix crash with initial empty EFI options
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20250708135701.119601-1-frediano.ziglio@cloud.com>
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
In-Reply-To: <20250708135701.119601-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.07.2025 15:56, Frediano Ziglio wrote:
> EFI code path split options from EFI LoadOptions fields in 2
> pieces, first EFI options, second Xen options.
> "get_argv" function is called first to get the number of arguments
> in the LoadOptions, second, after allocating enough space, to
> fill some "argc"/"argv" variable. However the first parsing could
> be different from second as second is able to detect "--" argument
> separator. So it was possible that "argc" was bigger that the "argv"
> array leading to potential buffer overflows, in particular
> a string like "-- a b c" would lead to buffer overflow in "argv"
> resulting in crashes.
> Using EFI shell is possible to pass any kind of string in
> LoadOptions.
> 
> Fixes: bf6501a62e80 ("x86-64: EFI boot code")

Have you convinced yourself that your change isn't a workaround for a
bug elsewhere? You said you repro-ed with grub's chainloader, but that
doesn't imply things are being got correct there. I can certainly
accept that I may have screwed up back then. But I'd like to understand
what the mistake was, and so far I don't see any. As before, being
passed just "-- a b c" looks like a bug in the code generating the
command line.

> @@ -429,7 +430,7 @@ static unsigned int __init get_argv(unsigned int argc, CHAR16 **argv,
>          prev_sep = cur_sep;
>      }
>      if ( argv )
> -        *argv = NULL;
> +        argv[argc] = NULL;

Strictly speaking the need for this sentinel now disappears, doesn't it?
As does ...

>      return argc;
>  }
>  
> @@ -1348,8 +1349,8 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
>                                    (argc + 1) * sizeof(*argv) +
>                                        loaded_image->LoadOptionsSize,
>                                    (void **)&argv) == EFI_SUCCESS )
> -            get_argv(argc, argv, loaded_image->LoadOptions,
> -                     loaded_image->LoadOptionsSize, &offset, &options);
> +            argc = get_argv(argc, argv, loaded_image->LoadOptions,
> +                            loaded_image->LoadOptionsSize, &offset, &options);
>          else
>              argc = 0;
>          for ( i = 1; i < argc; ++i )

... the need for

            if ( !ptr )
                break;

just out of context here?

Jan

