Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE85FB4877E
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 10:49:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1114831.1461635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvXYl-0003Gz-TY; Mon, 08 Sep 2025 08:49:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1114831.1461635; Mon, 08 Sep 2025 08:49:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvXYl-0003Eg-QU; Mon, 08 Sep 2025 08:49:11 +0000
Received: by outflank-mailman (input) for mailman id 1114831;
 Mon, 08 Sep 2025 08:49:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=suiz=3T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uvXYk-0003EY-63
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 08:49:10 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aee59b4c-8c90-11f0-9d13-b5c5bf9af7f9;
 Mon, 08 Sep 2025 10:49:08 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b04163fe08dso713173666b.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Sep 2025 01:49:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b046f2dda22sm1222083766b.40.2025.09.08.01.49.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 01:49:07 -0700 (PDT)
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
X-Inumbo-ID: aee59b4c-8c90-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757321348; x=1757926148; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GHjvfqIdRjsQX9nzawMApA8YdsCDCCCvniMT+kzyowc=;
        b=Exv6ApFUZ3D2GNa+0hIDmN6QhfxDhrtJLwl5nje/0Jcqc5lndfxz5EuqShuYivXyh9
         gWLcALFb69PZXcUOCCp11qDe26Zf5x/67nImn+X3q8+oOhhLMZZajmb0XcdlJnsDjSwR
         4aMaYQR1HmfCYY4U74zgGnE+xh8j+GQuOPL3CanO4fk+YBgPQm4DJbQT7m/t1FWiTKk5
         vCpxuz2c3zpVHkT4gJANU8mPkawfztdiyQIbzFzUwokMRTm385TKX9WQRBrs3gnkgizQ
         mB5N8NnZBJRnmhaxHJ1RqRARUo2xZ+l07mNSv9F6Hlr4EzPd72ROhNb+DqoaEekl3F66
         c5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757321348; x=1757926148;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GHjvfqIdRjsQX9nzawMApA8YdsCDCCCvniMT+kzyowc=;
        b=Hj44SSJ/PxY1M88nFq9bp/7Ts/HUGQdSfJqFpFfXcjIcgbUT/dzQr/g3jCkXc/y/xI
         KbzXs19/YSEeAB1l5rN3AbQJF9qG+Bjptp5FyN7ZhsmxEmwdHR215boHRC/qUI7y+qIz
         wTWK7xTgZ8ePksMDBoxYq9AgpGliditZvBE72rAMovcatOasERA+/fJ1AjbaKLPA5IE1
         n2hlRRCuxLMr/O5r5csVVfAuvLVzfhMQfL0dPscihAAoWwwsISo5clTQ6416EgYDMFdd
         kTRoSQDjRET7k8qdgsPUtZrlsYsb5a1cEse7by9xWcC/PjTgyn1N20iz0k5Chljhyo77
         cdsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZZEWQceFU15wetFe+kGYA4YQ/cpGfCUjQyKPL+LKDF7hS3VqsUuehhGGpobEuTq508K5Nb1zcYyk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQj0R4AQfveFBsyjZp52nIYYFikG3tDUzx0rMrhSjytnBfR2n6
	dXA8BLds63PyyJGlSDfQOkxtTDEttd7MoQtpfxQuSKjpjIgo35gJ0V3YX6vjbodZEQ==
X-Gm-Gg: ASbGncs7hJhsrR+lskQx8WxFiVttb372YueSDCEJb2HELpPjHqzi/d06FIXWSEQo2W4
	60oidkzJWwHgV7S1H2PtVgMr5vHyWJ3ASVVzO/YAqbFVTmdm5VLAbGVYlcCh6NNkmKbvdJ8ZHyb
	/TLuO7WVm02gRv5ajepf/s7Bo0A3nruD5zI3RY4G5YPQljQIEi5StVpBcW+AQwycLsddptpI5mH
	AVVwuBcMHf5kmfTdcg6kEk6KYKLV1XGKoe/mtAF4PwVz0hX4FedO5+AZ+ERTGSPyLkctmVwWTTl
	W+Alf02i0WQ6sC/K8dHHp/lCtWT2+Dze/KlmUapSDcuiafEmCY3LNDi8yxckRkT45TDSmZgyU8K
	3N6iqbR8yeFpdbtSBdyalvGPuIEfMSNU5UqIuJFpLTRp0SRhrG/vdpJF9RUkPx7S+jvotXn/z48
	DJEYxj1Eebha0KFxdBcg==
X-Google-Smtp-Source: AGHT+IHGx/7oyJnhms5xQlnV9t2WXi/MUPA5VvbuwbG9Ia77TPFSMieQ9S6E8B+YN8qM5mF7I7BbCA==
X-Received: by 2002:a17:906:eec3:b0:b04:7514:f9c4 with SMTP id a640c23a62f3a-b04b167d1cemr652353666b.43.1757321348314;
        Mon, 08 Sep 2025 01:49:08 -0700 (PDT)
Message-ID: <ed2e2406-bfab-4111-a9d0-025c85b51bdb@suse.com>
Date: Mon, 8 Sep 2025 10:49:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] efi: Add a function to check if Secure Boot mode
 is enabled
To: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <cover.1757071716.git.gerald.elder-vass@cloud.com>
 <8d66f9ce2c9c352794c0c144f6e00d0a9d465dbe.1757071716.git.gerald.elder-vass@cloud.com>
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
In-Reply-To: <8d66f9ce2c9c352794c0c144f6e00d0a9d465dbe.1757071716.git.gerald.elder-vass@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.09.2025 14:10, Gerald Elder-Vass wrote:
> From: Ross Lagerwall <ross.lagerwall@citrix.com>
> 
> Also cache it to avoid needing to repeatedly ask the firmware.
> 
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> Signed-off-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
> ---
> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Julien Grall <julien@xen.org>
> CC: "Roger Pau Monné" <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> 
> v4:
> - Fix MISRA warning regarding SecureBoot string
> v3:
> - Fix build on ARM
> ---
>  xen/common/efi/boot.c    | 24 ++++++++++++++++++++++++
>  xen/common/efi/runtime.c |  1 +
>  xen/include/xen/efi.h    |  2 ++
>  3 files changed, 27 insertions(+)
> 
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index e12fa1a7ec04..ccbfc401f7ba 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -901,6 +901,28 @@ static void __init pre_parse(const struct file *file)
>                     " last line will be ignored.\r\n");
>  }
>  
> +static void __init init_secure_boot_mode(void)
> +{
> +    static EFI_GUID __initdata gv_uuid = EFI_GLOBAL_VARIABLE;
> +    static CHAR16 __initdata str_SecureBoot[] = L"SecureBoot";
> +    EFI_STATUS status;
> +    uint8_t data = 0;
> +    UINTN size = sizeof(data);

Unlike here, ...

> +    UINT32 attr = 0;
> +
> +    status = efi_rs->GetVariable(str_SecureBoot, &gv_uuid, &attr, &size, &data);
> +
> +    if ( status == EFI_NOT_FOUND ||
> +         (status == EFI_SUCCESS &&
> +          attr == (EFI_VARIABLE_BOOTSERVICE_ACCESS | EFI_VARIABLE_RUNTIME_ACCESS) &&

(Nit: Overlong line.)

> +          size == 1 && data == 0) )

... any reason it's literal 1 here?

Jan

