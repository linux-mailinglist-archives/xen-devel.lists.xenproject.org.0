Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 922C193B1EB
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 15:47:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764250.1174621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWcL8-0007A6-TJ; Wed, 24 Jul 2024 13:47:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764250.1174621; Wed, 24 Jul 2024 13:47:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWcL8-00077I-QV; Wed, 24 Jul 2024 13:47:34 +0000
Received: by outflank-mailman (input) for mailman id 764250;
 Wed, 24 Jul 2024 13:47:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D33k=OY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sWcL7-00076e-JO
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 13:47:33 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 468a5124-49c3-11ef-bbfe-fd08da9f4363;
 Wed, 24 Jul 2024 15:47:32 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52f04150796so4893904e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 06:47:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c8bf2f5sm645695466b.120.2024.07.24.06.47.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 06:47:31 -0700 (PDT)
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
X-Inumbo-ID: 468a5124-49c3-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721828852; x=1722433652; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gYvcii2AZai9xjX0sQ5AVkCB4hpRUEiCPLvitN9Dpk8=;
        b=LSuo2pvGKMs7w7GkiBsXSq+FA2YGmCywk/zVJIEoex57X8BwBkUvz0VI2G6gRIjG2F
         GiJfsYMAO4yn5eZbqV2FHkX5D0vXm3BHQsPEH4YS1LbOJoJsTpp8NW0No/J008p7Sn8D
         DcjirMSM353CQC/6XgfXQN4ipSE8dHndv+JTv1W7Y8MKuvXfR5H1ivLejQBP/iD4ri+y
         OaQRozW2QONKRwPscrWJXdx2tmNqa0YOEVOqE/doxqseZjSLae0KFNbz6kZfqS/n8zS4
         JpORpa+UI3oSkM6RFOSOrEFmQYeTPssKBYPv4rYWSGRCwlIfmF6389DkDGmYEQWKwN6/
         Sa5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721828852; x=1722433652;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gYvcii2AZai9xjX0sQ5AVkCB4hpRUEiCPLvitN9Dpk8=;
        b=H49Ekdd+Gkor8EP66OL8N2FIWLTo1DBZ0qVs8t7L0+yZCuvens8jsGVYsbPs9BKlXS
         oDaNUwbthIBCos5EqBqKDhCpZxBjRe24L9dCjJdnKyHULpw4YHRAunFUvk4UvZVO/c/t
         2k17ln2LCGsqobAhtIXM0el1AjA0FF9iMT1fXq7VUHocdh7oDZVnUA8xtgNcqpUuDsZ0
         9uH3bNjxAUQmW5nVKjDXMxgMnUPwQ4tJswAROH9wEd6ciIwU6gC/t43dZgXflj1d+ovl
         FBdZQyWeKaBarVqAsIfItJiAQvt0lWkX+45Fyek59RqZBbIdQWiKgNR49a26dVtEyzr6
         JIsg==
X-Forwarded-Encrypted: i=1; AJvYcCUOsd49BX6lRsWgju+BQgISoapJXHeFbg8gkbhO5W/cOPA8GzoJEjmcSK16bsg71u26Ous1yI10bG7qBhO+gZ6XSN9awGwX0BnCAW7JJv4=
X-Gm-Message-State: AOJu0YzPJxW4VvS6vLRg71Q5SemwKYwVqLVGkfKf/5mOflSzxupyeCoT
	hviSMonNysWyt3eYZRAkGLe18t2IvheXjrFGAGNq7FBW4xK7DHhuend9cjPXlg==
X-Google-Smtp-Source: AGHT+IERRmREmM3AzHqbE1mpVJpsw7LF9s7QEqeHhlNQPReV/bHnYMjDFma6s8dqyEiWhFdJyt+Qiw==
X-Received: by 2002:a05:6512:1584:b0:52c:e01f:3665 with SMTP id 2adb3069b0e04-52fceffe584mr1436688e87.25.1721828851958;
        Wed, 24 Jul 2024 06:47:31 -0700 (PDT)
Message-ID: <84aebc89-9d36-4841-8df7-c458fd20b9f2@suse.com>
Date: Wed, 24 Jul 2024 15:47:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/efi: Simplify efi_arch_cpu() a little
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Gene Bright <gene@cyberlight.us>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240722101838.3946983-1-andrew.cooper3@citrix.com>
 <20240722101838.3946983-2-andrew.cooper3@citrix.com>
 <D2WYR6RSF2NH.3FCEH00B4ZRZ2@cloud.com>
 <d4860b8f-8562-4987-bd1b-fdbeacc0a994@suse.com>
 <D2XSZET3RRIS.12CXT6HXUEBJB@cloud.com>
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
In-Reply-To: <D2XSZET3RRIS.12CXT6HXUEBJB@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.07.2024 15:28, Alejandro Vallejo wrote:
> On Wed Jul 24, 2024 at 6:42 AM BST, Jan Beulich wrote:
>> On 23.07.2024 15:47, Alejandro Vallejo wrote:
>>> On Mon Jul 22, 2024 at 11:18 AM BST, Andrew Cooper wrote:
>>>> +    if ( (eax >> 16) != 0x8000 || eax < 0x80000000U )
>>>> +        blexit(L"In 64bit mode, but no extended CPUID leaves?!?");
>>>
>>> I'm not sure about the condition even for the old code. If eax had 0x90000000
>>> (because new convention appeared 10y in the future), then there would be
>>> extended leaves but we would be needlessly bailing out. Why not simply check
>>> that eax < 0x80000001 in here?
>>
>> eax = 0x90000000 is in leaf group 0x9000, not in the extended leaf group
>> (0x8000). The splitting into groups may not be written down very well,
>> but you can see the pattern in e.g. groups 0x8086 and 0xc000 also being
>> used (by non-Intel non-AMD hardware), without those really being extended
>> leaves in the sense that 0x8000xxxx are.
>>
>> Jan
> 
> The code is checking for a number specifically in the extended group, but
> that's the output of leaf 0x80000000 which is defined to be just that.
> 
> AMD: "The value returned in EAX provides the largest extended function number
>       supported by the processor"
> 
> Intel: "Maximum Input Value for Extended Function CPUID Information."
> 
> Unless there are quirks I don't know about (I admit it's not unlikely) I just
> don't see why this condition needs to be anything else than a check that the
> maximum function number is bigger than any of the leaves we read further ahead.
> 
> If the number happens to start with 8000, that'd be fine; but there's no reason
> to bail out if it was 8001.

How do you know? We'll learn once someone starts populating that leaf
group. It _may_ be the continuation of extended leaves then (once the
other 64k were all consumed, i.e. in perhaps hundreds of years). Just
take again the case where the 8086 groups is populated: What if there
[80000000].eax = 8086yyyy? That'll be wrong, as 8086 forms its own group.
So no, I'm similarly unaware of quirks, but with this we're trying to
guard ourselves against some entirely bogus output (from all we know
today).

Jan

