Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F18B45519
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 12:44:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1111696.1460307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuTvX-0000aN-3x; Fri, 05 Sep 2025 10:44:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1111696.1460307; Fri, 05 Sep 2025 10:44:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuTvX-0000YJ-18; Fri, 05 Sep 2025 10:44:19 +0000
Received: by outflank-mailman (input) for mailman id 1111696;
 Fri, 05 Sep 2025 10:44:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1l6N=3Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uuTvV-0000YD-Nx
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 10:44:17 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44fe058d-8a45-11f0-9d12-b5c5bf9af7f9;
 Fri, 05 Sep 2025 12:44:16 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6228de280ccso13501a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Sep 2025 03:44:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b041d7107d9sm1368452466b.4.2025.09.05.03.44.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Sep 2025 03:44:15 -0700 (PDT)
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
X-Inumbo-ID: 44fe058d-8a45-11f0-9d12-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757069056; x=1757673856; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SwUSFm5NnSz+qANY7euZXluaZusjbdZg+ebSEO2SD8w=;
        b=bDpVgll+kpHONVEtJfTM8Sbjrxuj4qxqmalt8y8WycBwWsV3YjBU4CYeKY3TebByGO
         hRLkePsURLcMYbk2I2F3N9gLaGb7YpnIPk4Zd26pIGidUlrTb8vckDt1UR6pLDHblNCx
         mcoxP08fcibV35FHmj1H0tuYECNjOwc2ISi9h3nkHkuZXBUaKLSPWQyX3DmK40dUHnNQ
         WB42TxMf6w+vfa2coaowU/+DozplqEPy1yhNb+uU88+0ZK9GToxtH1Z3f66gh0D+Qm/E
         mIet7Qpcr9BsWz0+MUUyEG2Br4mTdYzTG0FmX9CH2p6OxME/RLaU7jIFVmoBFOss2hyo
         4YzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757069056; x=1757673856;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SwUSFm5NnSz+qANY7euZXluaZusjbdZg+ebSEO2SD8w=;
        b=kkH3AI/faTDT14JTHw3RTY3gKnNtYSXV4QLDDjWuWI4vl18Jb2MYuGPzSk7JH3m6Ni
         tAI94FEb/Fdw0fR4fU8+nsClcpNIhxYagV8dE4bxCNGYZcXh9yIrsKatP2XkOcq7WAO2
         6AlmBavlJzLvSzoNgnu/E2IzhhoOMqJp25MNSWPz0LKoZrWiTFye7pOmtlS1IirwEYIE
         96SD/cTZfZFUX6IncoRKHHkZyusDpVgNHDQO/yB0S4Qjcv7zpLhrUVwycet49LqXoPD7
         EUZY1jQgbUpdfek5jV9WPIbmARtsDMtQxy5yuXWR/pjsCbECb9Auq8kNLMbqpCLFaPcf
         XEng==
X-Forwarded-Encrypted: i=1; AJvYcCW4Fo8Q0ip6VtTi6TH/fT2BrIF4GleO4MJ4OmLskePzsiqxAJNbw1NeEfp9oZWw2GZtAtmml1EPu58=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz4A10trvwa321G0jXQl0VbT2MtJppqJab6+TyCj1G9J4m7MivL
	XzH20Ss49Agx54ShdW1h5JjmCtVaNxHgrcXQt9a1oRhLwkl9qaPsWZg1o57PgVzaGw==
X-Gm-Gg: ASbGnctfzci8guhONVWnNPYtFKE+v5+PH/Mmo8jB2f41TLylqfbpZjfos6k0jvweuLk
	PEvlhf/jq+zE4ELLLgUcvUdRQHLdnn0TDWNuzRpv17qQlY/HkqvKejI9L99fX2IcP7t89AHefdr
	blLxHM9XUODIiP4a0kOafY5ufwNnG9KbLx8MQIClW9MzPYqk3AF8IYuYNNV65vDf8sdrVsQmv8b
	Tj6YKzmPqF61BDCnVBLyh/OYTkojMoN8exc1NF9d/PrBsBy26n1jKFQ0iUz1aZjEAfCwVF/c5zU
	t7tSvqalLNhWfMoH3D2EZt6AO6lGULkdtw+12Inf6FUEA7+t7XsQIIwl1odfI5/qUoDMDveUU7L
	5fnFzPsWOCfsVCoKPX9xxipTRpX1Hbs0WM39xDRJZThRK7NPbvOq5YiPZQEj0kK1RE+CKOLgmvF
	2824PSvZQ=
X-Google-Smtp-Source: AGHT+IGFWlVTAH8cy07+cniQjYQj2+LbYruGSs3jNhiSN4O5iloq+6nghZmq3NRIjlf+8kmA9K23/Q==
X-Received: by 2002:a17:907:8690:b0:b04:95da:d2de with SMTP id a640c23a62f3a-b0495dae9b4mr222076266b.6.1757069055699;
        Fri, 05 Sep 2025 03:44:15 -0700 (PDT)
Message-ID: <8df5e7b1-6eee-44dd-b8c3-f38cc5322f98@suse.com>
Date: Fri, 5 Sep 2025 12:44:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [misra] Re: [PATCH v3 1/2] efi: Add a function to check if Secure
 Boot mode is enabled
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
References: <cover.1757066332.git.gerald.elder-vass@cloud.com>
 <12c18a6d0c3cbbe17cee19f9fb4501d614c23ec3.1757066332.git.gerald.elder-vass@cloud.com>
 <6940b548-18b8-4507-bb75-617378fe090c@citrix.com>
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
In-Reply-To: <6940b548-18b8-4507-bb75-617378fe090c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.09.2025 12:36, Andrew Cooper wrote:
> On 05/09/2025 11:05 am, Gerald Elder-Vass wrote:
>> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
>> index e12fa1a7ec04..e7e3dffa7ddc 100644
>> --- a/xen/common/efi/boot.c
>> +++ b/xen/common/efi/boot.c
>> @@ -901,6 +901,28 @@ static void __init pre_parse(const struct file *file)
>>                     " last line will be ignored.\r\n");
>>  }
>>  
>> +static void __init init_secure_boot_mode(void)
>> +{
>> +    static EFI_GUID __initdata gv_uuid = EFI_GLOBAL_VARIABLE;
>> +    EFI_STATUS status;
>> +    uint8_t data = 0;
>> +    UINTN size = sizeof(data);
>> +    UINT32 attr = 0;
>> +
>> +    status = efi_rs->GetVariable((CHAR16 *)L"SecureBoot", &gv_uuid, &attr,
>> +                                 &size, &data);
> 
> This turns out to be a MISRA R7.4 violation, complaining about casing a
> string literal to a non-const pointer.
> 
> The real problem here is that the EFI spec.  GetVariable() ought to take
> a const CHAR16 *, but doesn't.
> 
> We could fix this with:
> 
> diff --git a/xen/include/efi/efiapi.h b/xen/include/efi/efiapi.h
> index a616d1238aa4..56775d553109 100644
> --- a/xen/include/efi/efiapi.h
> +++ b/xen/include/efi/efiapi.h
> @@ -224,7 +224,7 @@ VOID
>  typedef
>  EFI_STATUS
>  (EFIAPI *EFI_GET_VARIABLE) (
> -    IN CHAR16                       *VariableName,
> +    IN const CHAR16                 *VariableName,
>      IN EFI_GUID                     *VendorGuid,
>      OUT UINT32                      *Attributes OPTIONAL,
>      IN OUT UINTN                    *DataSize,
> 
> but I fear this might get some objections.

The interface lacking the const in principle means that we can't rely on
there being implementations which actually do fiddle with the string.
Hence ...

> I don't think we want to be deviating every use of GetVariable() for a
> problem ultimately outside of our control.
> 
> Another option would be to have a wrapper for GetVariable() which does
> the cast once, which lets us deviate in one place only.

... this doesn't look like a viable route to me. (Nor a scalable one,
as down the road we then may need more such wrappers.)

> Thoughts?

Why not instead use

    static CHAR16 __initdata str_SecureBoot[] = L"SecureBoot";

and be done?

Jan

