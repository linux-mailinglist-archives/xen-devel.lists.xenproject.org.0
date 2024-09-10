Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1819973915
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 15:50:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795604.1205003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so1Fj-0002y0-Ro; Tue, 10 Sep 2024 13:49:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795604.1205003; Tue, 10 Sep 2024 13:49:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so1Fj-0002wS-Nc; Tue, 10 Sep 2024 13:49:55 +0000
Received: by outflank-mailman (input) for mailman id 795604;
 Tue, 10 Sep 2024 13:49:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCZR=QI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1so1Fi-0002OY-BA
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 13:49:54 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e9d6498-6f7b-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 15:49:53 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a8a6d1766a7so98124566b.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 06:49:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25cee784sm493974366b.177.2024.09.10.06.49.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 06:49:52 -0700 (PDT)
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
X-Inumbo-ID: 8e9d6498-6f7b-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725976193; x=1726580993; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+7AoOJ+QQ7y1rnIdg5EIRxUcujO33P1OvXuLNECASV0=;
        b=e9baotL9nPmp+I37OnvUKCJ1qJseA7Q2e9KRmZWVF8UFL+g+ju6I7ncAx5D5QInDC4
         dUXEcJgnUJrGEhnNRxbo7acpTpKzk9byogw2S71iaincw+KPk7/RNuewBko8jB+zhwya
         nhOki/S6En8HTic+gJbm26SuCV9OLgP38UOOPUvVbyDyRCggFNpO2GFy61VBayGkvnQv
         5XnKZgVdGCGXuESayJ/lV51lzKM2qw7ZC5CRIY2ZKaj/jXZSx1LSWHD2i6wYE0WWYs1/
         JtR3lC0npodsQCVzrJWwYERsSJkZiAqJ29bFUYq6Y2eee452SZi4zGbt9rpxtNfpkrK8
         TS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725976193; x=1726580993;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+7AoOJ+QQ7y1rnIdg5EIRxUcujO33P1OvXuLNECASV0=;
        b=PKTAkIm6uY9UePHztU2rLUzmd1h/aIT4igo77FInug5Tfo8KTQmgZZE+G+63LM7eY/
         cKabVzN5aZ2p2IwYrLM42IkQ8V+hes/HK9svCDg9j6cfA2ZzeS0FxtxebQIyUxLh0WvT
         3tioWhfTFBnFADi9rSyds+DoImLc49evG1lvjYeT+8a+Sm8gv+Z9WWN9Ba9YC7l4gasE
         K3xE2Hi1tfJ7kn0CgtEm7ktqtbRWmTJ/vGVehsEN95Dco2kz8zHYM0J4FzVX0gg2pQEC
         aQUPrZNjMOMcfTZ9r5ypm1azNylp34caYJDxjW/95Odzd4TmumBh/T3M3FH/NMJkVFy6
         gQ3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWPlJxYpDolvlpkySoG+xF8/y9VkiimVDmzSV8LBIumibCsn2oG1FKf4bPtKiFb+Ir/mfunHRQjrG4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5GjYahtgU71R8rf3fWVAXhwMUrzH/+RC3hHblq1uedWyXS/qb
	Get5Z7HAVvvs6iECJ54SVrzauS3rjhoUf4tJXIyUEpEDeT1kxS8yVnbpGppZF29/9z9V7UxUUS8
	=
X-Google-Smtp-Source: AGHT+IG20h92MCFytDabcVdMaUkbSWJJD8hrmp69Go5j5yFAidE6H27A0pq4HRaf7YD3/K03cjcJXg==
X-Received: by 2002:a17:907:3e0b:b0:a8d:60e2:396b with SMTP id a640c23a62f3a-a8ffae24946mr78495966b.65.1725976192889;
        Tue, 10 Sep 2024 06:49:52 -0700 (PDT)
Message-ID: <a52b019c-3f1c-4528-91f4-7bc1258c87d9@suse.com>
Date: Tue, 10 Sep 2024 15:49:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] x86/time: introduce command line option to select
 wallclock
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240909145455.7517-1-roger.pau@citrix.com>
 <20240909145455.7517-4-roger.pau@citrix.com>
 <985c0d70-55de-43ba-a1b3-811487bb05be@suse.com>
 <ZuBFNu_GFygZwvil@macbook.local>
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
In-Reply-To: <ZuBFNu_GFygZwvil@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.09.2024 15:10, Roger Pau Monné wrote:
> On Tue, Sep 10, 2024 at 11:32:05AM +0200, Jan Beulich wrote:
>> On 09.09.2024 16:54, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/time.c
>>> +++ b/xen/arch/x86/time.c
>>> @@ -1550,6 +1550,36 @@ static const char *__init wallclock_type_to_string(void)
>>>      return "";
>>>  }
>>>  
>>> +static int __init cf_check parse_wallclock(const char *arg)
>>> +{
>>> +    if ( !arg )
>>> +        return -EINVAL;
>>> +
>>> +    if ( !strcmp("auto", arg) )
>>> +        wallclock_source = WALLCLOCK_UNSET;
>>> +    else if ( !strcmp("xen", arg) )
>>> +    {
>>> +        if ( !xen_guest )
>>> +            return -EINVAL;
>>> +
>>> +        wallclock_source = WALLCLOCK_XEN;
>>> +    }
>>> +    else if ( !strcmp("cmos", arg) )
>>> +        wallclock_source = WALLCLOCK_CMOS;
>>> +    else if ( !strcmp("efi", arg) )
>>> +    {
>>> +        if ( !efi_enabled(EFI_RS) )
>>> +            return -EINVAL;
>>
>> I'm afraid there's a problem here, and I'm sorry for not paying attention
>> earlier: EFI_RS is possibly affected by "efi=" (and hence may change after
>> this code ran). (It can also be cleared if ->SetVirtualAddressMap() fails,
>> but I think that's strictly ahead of command line parsing.)
> 
> Hm, I see, thanks for noticing.  Anyone using 'efi=no-rs
> wallclock=efi' likely deserves to be punished.

Well, if you don't want to actually do this ;-) then ...

>  Would you be fine with
> adding the following in init_xen_time():
> 
>     /*
>      * EFI run time services can be disabled form the command line, hence the
>      * check for them cannot be done as part of the wallclock option parsing.
>      */
>     if ( wallclock_source == WALLCLOCK_EFI && !efi_enabled(EFI_RS) )
>         wallclock_source = WALLCLOCK_UNSET;
> 
>     if ( wallclock_source == WALLCLOCK_UNSET )
>         probe_wallclock();

... this is probably the best we can do (nit: s/form/from/ in the comment;
maybe also "..., hence the check done as part of option parsing may not
suffice" or some such). The subsequent log message should be sufficient to
tell them what's going on.

Jan

