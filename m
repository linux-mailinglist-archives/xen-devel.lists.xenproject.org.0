Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE358AB3500
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 12:36:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981206.1367600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEQVj-0006vE-TJ; Mon, 12 May 2025 10:35:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981206.1367600; Mon, 12 May 2025 10:35:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEQVj-0006sg-QX; Mon, 12 May 2025 10:35:51 +0000
Received: by outflank-mailman (input) for mailman id 981206;
 Mon, 12 May 2025 10:35:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEQVi-0006sa-Ma
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 10:35:50 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de5fefe6-2f1c-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 12:35:48 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ad216a5a59cso454326466b.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 03:35:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad22ba47376sm476427566b.53.2025.05.12.03.35.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 03:35:47 -0700 (PDT)
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
X-Inumbo-ID: de5fefe6-2f1c-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747046148; x=1747650948; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/TQxKoDRpi2LmoDIwPG42ja98rh9/A6V3O+YYXOfXc4=;
        b=TNbsiFTOKtsfdygvbQOhX4LFTcdfiKLXOJwUmtgK9+rO9852brWzE9TljYWV47DY/F
         k/LlGN7ueaILvr7DISToKKdh/7R/Y0Lzjz21x5t/3w55qhw6QizHhoux8AlKZzCi1hOe
         Z/pToN+0syf0EUp4X7imckTChQ+kruq1bppbAT+tD4a//7Obrm8cuPO4GrGaQR5dGwIR
         U2KHnQYKxeZE3ywu3/TnAIs1K2BpdDkkH2F4o3IDwnLd7qaoN4Uj3ZxAXPebbH3vu3ry
         LokD0oOI32xnn/QIFnYn0+6orGzrQanj7C+F0MS0a3DZiuHfjb51kKJe7YhE5WdnpCHX
         +/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747046148; x=1747650948;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/TQxKoDRpi2LmoDIwPG42ja98rh9/A6V3O+YYXOfXc4=;
        b=LJ4qvGKgt5FlQdny9YFyKM8cPmcleGYpEWK/cAtJE4ILp12iYabmF3AHBv5aO+vFGD
         DOvXlk3nEu1w6J71xkqgST0TMuHAF/0h/k5mRKjrhSbyGWLa5DEMmoM10h2ORaIcU4dh
         LmsHa4osR/H+GZ38Ju9WXG+OLDmw4r86Go2/lzYl5gG5lop2bYhPJgVOIw4tmIg01iAS
         Un0YGmkdxTKHU1/m/yZjci1gakb/UI7h7ce0H+SSXwRW1V8c1/paSDDN1r61ZKU3nL+j
         Rp9xQVLl5xZQLYcTP02UHLOmixC18x3eIgs+eYQDMkGUYVdoP2oTfskrXcimM56Om1qB
         Jewg==
X-Forwarded-Encrypted: i=1; AJvYcCWbkfJXEhDY9oTyI6K/3SiMOluRGp31nvuNSLeU1p1LG9H15X9sirIUsuOzG6sIWWsL0acDnXO1++o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYXp6nFnebHUj79TE/Ek9ORhUWFpexLCnzO37QkvfoeUrUd42u
	Xb6g831MqH06q5Ll1Nj8tmmH4IdnkxdEGFCAdDg1/nqNncz8GdHW+huxZ8d1xrkoVDteh4F+Xgs
	=
X-Gm-Gg: ASbGncsOlZNizeqzbaeyMNV5MLKi+81NmZxjhkrMUz0htNI81PlH151TeNjz/+LmT8h
	1sJOdkBHu7W7bQWCASPN26+kfAOeiopPUQR9kdFS7/U3ZQ77TxKv2o+Oitpyc+EaAqo9qTWRTBo
	829M1Gfrw8jgNFxMri9DVK0MmCLx+DqTFE61wCSZFr0PVWX30dOzVaR+KcPkw3krVyv5IHfXoEu
	sVpQo33zbbKX/+TJwVYf8kVPShIzoVbhOZKKWSoVdDNBJFr8nQIZp7W7hHbCW9eqe0L5sj7Y02U
	Y2Kw7vqEV84ENb5oES4EAzmQ/7p2NVc/GTXDK7bjAic1+a/7MVf+74ehjV6vo84jnAXXyzA2q43
	FyZ1ROg+IGE6ZAg9Vk41vwm0zK2vY+KKv5vdqVTLypWxqWpo=
X-Google-Smtp-Source: AGHT+IHJNi7M6wNvfj9jogqHyBDe742zT4P16y/6DSjsYArkTmyDoexsaE/+oPaHHq9kD5FMpXxK8w==
X-Received: by 2002:a17:907:6a13:b0:acb:6746:8769 with SMTP id a640c23a62f3a-ad218f48713mr1223416466b.18.1747046147995;
        Mon, 12 May 2025 03:35:47 -0700 (PDT)
Message-ID: <35e372a2-3ec8-415a-a594-201b8b0d8bd6@suse.com>
Date: Mon, 12 May 2025 12:35:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] efi: Add a function to check if Secure Boot mode is
 enabled
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Lampis <kevin.lampis@cloud.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>, xen-devel@lists.xenproject.org
References: <20250506162449.1676405-1-kevin.lampis@cloud.com>
 <cf3e9dbf-7ea7-4b33-a4be-14cb5dac0ebc@citrix.com>
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
In-Reply-To: <cf3e9dbf-7ea7-4b33-a4be-14cb5dac0ebc@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.05.2025 18:55, Andrew Cooper wrote:
> On 06/05/2025 5:24 pm, Kevin Lampis wrote:
>> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
>> index e39fbc3529..7c528cd5dd 100644
>> --- a/xen/common/efi/boot.c
>> +++ b/xen/common/efi/boot.c
>> @@ -870,6 +870,27 @@ static void __init pre_parse(const struct file *file)
>>                     " last line will be ignored.\r\n");
>>  }
>>  
>> +static void __init init_secure_boot_mode(void)
>> +{
>> +    EFI_STATUS status;
>> +    EFI_GUID gv_uuid = EFI_GLOBAL_VARIABLE;
>> +    uint8_t data = 0;
>> +    UINTN size = sizeof(data);
>> +    UINT32 attr = 0;
> 
> Newline between variables and code please.
> 
>> +    status = efi_rs->GetVariable((CHAR16 *)L"SecureBoot", &gv_uuid, &attr,
>> +                                 &size, &data);
>> +
>> +    if ( status == EFI_NOT_FOUND ||
>> +         (status == EFI_SUCCESS &&
>> +          attr == (EFI_VARIABLE_BOOTSERVICE_ACCESS | EFI_VARIABLE_RUNTIME_ACCESS) &&
>> +          size == 1 && data == 0) )
>> +        /* Platform does not support Secure Boot or it's disabled. */
>> +        efi_secure_boot = false;
>> +    else
>> +        /* Everything else play it safe and assume enabled. */
>> +        efi_secure_boot = true;
>> +}
> 
> I'm not sure this logic does what you want when a weird answer comes
> back from GetVariable().
> 
> Also, you can't have this be a common function, yet ...
> 
>> diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
>> index 7e1fce291d..b63d21f16c 100644
>> --- a/xen/common/efi/runtime.c
>> +++ b/xen/common/efi/runtime.c
>> @@ -40,6 +40,9 @@ void efi_rs_leave(struct efi_rs_state *state);
>>  unsigned int __read_mostly efi_num_ct;
>>  const EFI_CONFIGURATION_TABLE *__read_mostly efi_ct;
>>  
>> +#if defined(CONFIG_X86) && !defined(CONFIG_PV_SHIM)
>> +bool __ro_after_init efi_secure_boot;
>> +#endif
> 
> ... this variable exist only on x86.
> 
> Also, why adjust it for PV shim?  None of this is even compiled for PV shim.

For shim it might be (and a proper variable is needed in that case); for
shim-exclusive it shouldn't be.

Jan

