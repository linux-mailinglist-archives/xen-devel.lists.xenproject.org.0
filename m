Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4847FAB4D50
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 09:49:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982587.1368942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEkOM-0000F5-Jw; Tue, 13 May 2025 07:49:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982587.1368942; Tue, 13 May 2025 07:49:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEkOM-0000CT-GM; Tue, 13 May 2025 07:49:34 +0000
Received: by outflank-mailman (input) for mailman id 982587;
 Tue, 13 May 2025 07:49:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iHDm=X5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEkOK-0000CN-Nj
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 07:49:32 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce15cc80-2fce-11f0-9eb6-5ba50f476ded;
 Tue, 13 May 2025 09:49:31 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5f5bef591d6so11120661a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 00:49:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad249135303sm408760666b.100.2025.05.13.00.49.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 00:49:30 -0700 (PDT)
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
X-Inumbo-ID: ce15cc80-2fce-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747122571; x=1747727371; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8Q8tBFIJ/78n7IR+9ESusw22RG0woAFAfmQbfZstPms=;
        b=Qf9czHv3MfKL5jjwALFZQpBL0x4mM10i19QHrBE/P6nrqHkM9teNFN5EfzXD7uYYMr
         S1/qznF5MnpEpCEg15yygPZ/mLYEUE3jkRDp7+qeqnaV/qdB0U5Qh4HfoQVCm4g4gzgA
         3/mj867Sia7upwbxsaAP/Q3HMdwV2kY5teIVtr2Ad0ei0sjJgEaQc2a7K4MVql0s3C85
         ng581nkHCl0KUjJRxaepEHyysNwTaEQWABacHkm36HUkzuhbbp2xJSHb/koa+AJGkDl2
         YlOfqw3vB4hRm2IWdiPQhy+D1a96AYFpuwOz8HeYfwtCqVChqk53VDYrh69UJ367RwRp
         2dug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747122571; x=1747727371;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Q8tBFIJ/78n7IR+9ESusw22RG0woAFAfmQbfZstPms=;
        b=Dk1gfSVndbkZGeYh72UskMDCJWU/fzKrMz/DHOL9/yhaW1hwBq8Xxw3DoUnvGTDi+6
         Mh+Hyivvmvvw5ssq2QZtwpg9Szw6oP+36x40cT0TJe4Jmp3cJGGqs7XRFLJEkKtXOhNi
         9qtHsRTIzBCg0fX1rBNT8uP4W6Dv3/Xaxf1bubxHgVQSuy8Fih/7fS7T04XX5Q6LIjUD
         R5Tjb/NnEcxNkegvRBnN2Xf9gCw5eye4mpcQEbgPg1dpKhqBl5Y9iwJ2wqikN4u45FRO
         FWc2YiYCuUZvLl3Sk+NISFdb6q+qOOTjvLQkt96Rkdk6tplXO689xizD1f2mcj6kcAi0
         PmdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNEULii30LnudQE/CNoOpe95ob22yFh6oXt36TxdzrwiP+21BiYcWzijAHaXoxb7rKBpb8S1eCOjA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwFOLmBQ1unxOK4Z8Uone5idywywTL5PABgmhWl9QSAiLFLq3sF
	amitFs51gXrwJIuHERTM8AspLQDOm0R18lb+mynvFawKyTINOWWr1me3QQJSBA==
X-Gm-Gg: ASbGncvLY72MSD+FlC+Kt+4zz+EJ1sCKYGZvyRggA3EgsSL4waXTKN/GJC0x5e9E9oP
	ypFtbtRV7fp8Pthms5pgBKljZzaDf+erMofwQSWZGzzDOu+qfY9R+pSWaqwmhXouRzGzY+S3rkm
	y9TOLipIjoeDD3S98X/rLeax/WJo0ORdHf4YNNRuM3pJ950KHninXchYydMwtVU+qBxD1y19PHi
	0btnuuElSUXPHPBZO3jkifpM0USHBT7Algz02rNiWlbw1XSnCeoJs3cyr+tYsSlAN1M7uNG0LnR
	fQmobO+aXNFI0FvKmCXAShNUesVzyyNIpeTJ3h8Q7EROY/YS+3g2ShxtloL8CwLVDZZNRh3297h
	GFRfMHxWwtGrsHBVLGSTUQJN4cip74HjSkyMs
X-Google-Smtp-Source: AGHT+IFUn1qEoAKekfWLxqZl0A2abQrry/W6dUKug6Gbk+68mrAR7beuwwGZe5jItNyH5t/KMfYq1A==
X-Received: by 2002:a17:907:cf46:b0:ad2:4b93:1205 with SMTP id a640c23a62f3a-ad24b9313cdmr791165866b.41.1747122571101;
        Tue, 13 May 2025 00:49:31 -0700 (PDT)
Message-ID: <e7a61936-fce3-4b4f-a4c3-33309ca529b3@suse.com>
Date: Tue, 13 May 2025 09:49:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/15] xen/cpufreq: fix core frequency calculation for
 AMD Family 1Ah CPUs
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-8-Penny.Zheng@amd.com>
 <8b87f6c4-ebc7-4d13-8fe6-a56df6b76523@suse.com>
 <DM4PR12MB8451210ED3CBF8BEDDB48F8EE188A@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB8451210ED3CBF8BEDDB48F8EE188A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.05.2025 08:12, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Thursday, April 17, 2025 11:23 PM
>>
>> On 14.04.2025 09:40, Penny Zheng wrote:
>>> --- a/xen/arch/x86/cpu/amd.c
>>> +++ b/xen/arch/x86/cpu/amd.c
>>> @@ -570,12 +573,35 @@ static void amd_get_topology(struct cpuinfo_x86 *c)
>>>                                                            :
>>> c->cpu_core_id);  }
>>>
>>> +static uint64_t amd_parse_freq(unsigned char c, uint64_t value)
>>
>> Considering how it's used, does "value" need to be any wider than unsigned int?
>> What about the return type?
> 
> Value is the value of 64bit PstateDef MSR, although we are only using the lower 32bit to calculate frequency
> Maybe its better to leave it as uint64_t ?

I won't insist, but changing to unsigned int will, I think, produce better
code (hence why I suggested the change).

> I'll change the return type to unsigned int, and do the following check anyhow
>         #define INVAL_FREQ_MHZ  (~(unsigned int)0)
>         if ( freq >= UINT_MAX )
>                 return INVAL_FREQ_MHZ;
>         else
>                 return (unsigned int) freq;

But please avoid such unnecessary "else" (which I think I did ask for before).

Jan

