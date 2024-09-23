Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B9897E944
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 12:01:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801803.1211813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssfsS-0003nQ-M6; Mon, 23 Sep 2024 10:01:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801803.1211813; Mon, 23 Sep 2024 10:01:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssfsS-0003lS-JO; Mon, 23 Sep 2024 10:01:08 +0000
Received: by outflank-mailman (input) for mailman id 801803;
 Mon, 23 Sep 2024 10:01:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZUN=QV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ssfsR-0003lM-Si
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 10:01:07 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfc79d81-7992-11ef-a0b9-8be0dac302b0;
 Mon, 23 Sep 2024 12:01:06 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5c5b954c359so1899164a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 03:01:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c42bb495besm10098666a12.4.2024.09.23.03.01.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 03:01:05 -0700 (PDT)
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
X-Inumbo-ID: bfc79d81-7992-11ef-a0b9-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727085666; x=1727690466; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+i16b0EmNFSQEoLVv0B4oaoAffRWoObwWq2nTZBZ9F4=;
        b=AEJ0R6oaJbkDMssZNtt0Et+FNbw20waK3mDI/bzwH55JnOHuFpK0FV/hT273xdnXrl
         zlOVWntc2AKLLZ2ZsWlSGBYeDBT5ZMfifs9etCmn2aMLkEG3WaXNDgi4BwDnARgE8xCH
         nlnPr+N4Mn1l4pLcYToF4Q0UndAVf0tZPfKToGofRr6yoDSS1g2Wpe0ueUnY7AkBKwYZ
         jqyPbC4xDZ+drGljAbWIBTGTloJGO93HH1GUGVQ+gbx1WsKcn6K3WTie3m0eQxahb+7c
         g9TApqicoYxxcibGFz5XGHu86OlvTNtaFkaL4c06bgtHgwh/EbL/m/Ye8dP2A0TIsKL9
         xmvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727085666; x=1727690466;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+i16b0EmNFSQEoLVv0B4oaoAffRWoObwWq2nTZBZ9F4=;
        b=N6Pj+hF1tCI+FzoKXUVY47x2Y0kzr79JxVO8Ppy04R1vTGQSZaO+btGN6zuQgDKBJr
         0GjNcRM8oNW0pw/nIULx80ynIOfHYmVGRQ+LF3fqsdVGEioqdJeTuis+1z0VFUjVfa67
         sR/u6cDmq97eaBt4R74yqEgEDAYVJW7PcGckqfRSmT1I+JuHF63qwwd+x8P12pnPKmRk
         a+i3YM0UdB7K1MU0T3uj3PKeg9yXPKtcOz1vsnieUycnjrFzfl8saxpaZ2iJjFtQzuHt
         p7joYkcbnyubRDbgWCL7wsrl6tS9FZ9uaSrCJUh17mT8/2kExByCqPB7AexsBTZ/d/OG
         TZ4A==
X-Forwarded-Encrypted: i=1; AJvYcCXfzzOOD4ArwO2NzXqjOn0V1/qwE5ZJ8NUnCmq/0HGVL89o3OR1p6yHJhRDIYiF5bCF3CK6K0FgdZE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwHG3eSE/lOPyuAN2UVxVjJt9P1SJkArwJQtBX6hM0SrftBenBd
	5A73aT2iJyaqJSN3R84fPXVNhwCvVjOvFkEMNpIssSPuYd8pLyiuhjoQfFrP7w==
X-Google-Smtp-Source: AGHT+IHioiVtj4j/AT3r63SBtFRmU0Ukck8C2PGEc0pXsetSzuqTJqMZbqjepOo9z6/MmzJBBAyyZg==
X-Received: by 2002:a05:6402:42d3:b0:5c3:cc6d:19df with SMTP id 4fb4d7f45d1cf-5c464a5cd52mr9633518a12.28.1727085665610;
        Mon, 23 Sep 2024 03:01:05 -0700 (PDT)
Message-ID: <d5a6774b-3c50-4b39-9bb7-740f0763a1d4@suse.com>
Date: Mon, 23 Sep 2024 12:01:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] x86/hvm: make ACPI PM timer support optional
To: Sergiy Kibrik <sergiy_kibrik@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20240916063757.990070-1-Sergiy_Kibrik@epam.com>
 <Zufh7DOSCwzhrpZG@macbook.local>
 <alpine.DEB.2.22.394.2409161252380.1417852@ubuntu-linux-20-04-desktop>
 <614611f1-dfbe-4185-8f0a-dc89aa7f5a20@epam.com>
 <ZuqgTKqaUDWC_I-u@macbook.local>
 <27d717f7-3073-4139-bef0-05d1a39f1e6c@epam.com>
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
In-Reply-To: <27d717f7-3073-4139-bef0-05d1a39f1e6c@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.09.2024 15:35, Sergiy Kibrik wrote:
> 18.09.24 12:41, Roger Pau Monné:
>> On Wed, Sep 18, 2024 at 12:29:39PM +0300, Sergiy Kibrik wrote:
>>> 16.09.24 22:57, Stefano Stabellini:
>>>> On Mon, 16 Sep 2024, Roger Pau Monné wrote:
>>>>> On Mon, Sep 16, 2024 at 09:37:57AM +0300, Sergiy Kibrik wrote:
>>>>>> Introduce config option X86_PMTIMER so that pmtimer driver can be disabled on
>>>>>> systems that don't need it.
>>>>>
>>>>> Same comment as in the VGA patch, you need to handle the user passing
>>>>> X86_EMU_PM.  It's not OK to just ignore the flag if the hypervisor is
>>>>> built without ACPI PM timer support.
>>>>
>>>> I also think that the flag should not be ignored. I think that Xen
>>>> should return error if a user is passing a domain feature not supported
>>>> by a particular version of the Xen build. I don't think that libxl needs
>>>> to be changed as part of this patch necessarily.
>>>
>>> It looks like toolstack always leaves X86_EMU_PM bit enabled, so that part
>>> may also require changes.
>>
>> I think you will be unable to create HVM guests, but that's kind of
>> expected if ACPI PM emulation is removed from the hypervisor (it won't
>> be an HVM guest anymore if it doesn't have ACPI PM).
>>
>> PVH guest don't set X86_EMU_PM so you should be able to create those
>> fine.
>>
> 
> would the check like this be enough?:
> 
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -758,6 +758,9 @@ static bool emulation_flags_ok(const struct domain 
> *d, uint32_t emflags)
>                (X86_EMU_ALL & ~(X86_EMU_VPCI | X86_EMU_USE_PIRQ)) &&
>                emflags != X86_EMU_LAPIC )
>               return false;
> +        if ( !is_hardware_domain(d) &&
> +             (emflags & X86_EMU_PM) && !IS_ENABLED(CONFIG_X86_PMTIMER))
> +            return false;
>       }
>       else if ( emflags != 0 && emflags != X86_EMU_PIT )
>       {

Why the is_hardware_domain() part of the check?

> (probably with X86_PMTIMER option depending on PV)

HVM you mean?

Jan

