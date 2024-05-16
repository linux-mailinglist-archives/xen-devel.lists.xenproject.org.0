Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E79EB8C73BB
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 11:25:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722936.1127342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7XM6-0000PQ-GZ; Thu, 16 May 2024 09:24:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722936.1127342; Thu, 16 May 2024 09:24:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7XM6-0000MU-Cx; Thu, 16 May 2024 09:24:54 +0000
Received: by outflank-mailman (input) for mailman id 722936;
 Thu, 16 May 2024 09:24:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LYhW=MT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7XM4-0000MM-TC
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 09:24:52 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2564a71e-1366-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 11:24:50 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-574ea5184abso3353931a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 02:24:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574bcede889sm6954042a12.92.2024.05.16.02.24.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 02:24:50 -0700 (PDT)
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
X-Inumbo-ID: 2564a71e-1366-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715851490; x=1716456290; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6RobZ2jZYqDsBFhsz2KpkAATm3NB9MFYo2sy3PSylCU=;
        b=cWD2zsKk3rXj4Hd2OMdU5Ml328F86MSiMSeGvgn8MswsNVF3OuGu5yGjiY3OZt3tvx
         i40fcW9/Sd+S1ioJPDuqnyom6tL4l+mV4itZQzGTAkDzn2Q7xVdjMYUYQ5O4/Su7//PU
         dvA3/hk+pR2wmzm8aFpxJdBfMKXhmDRH+7mcP7OvrFnpvx9tTRZUw6qoRk7kizC+CO/m
         wCMN5LK50aHkp+HQ8Z+RoTuFIkR0Pehmv24unp6ZwPz+kvyxJcEO2DQu7uqcLM5lPGGD
         A9V1piodOmlsdLdlaVomaRapymQi+MVYW5Xd3xbDVIfRgpD5DPrK7z35++HLn85s2qDB
         Y4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715851490; x=1716456290;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6RobZ2jZYqDsBFhsz2KpkAATm3NB9MFYo2sy3PSylCU=;
        b=TV/HLYvbfy4b9gbkhnc33ouQ6EHgvJ45rFH4zvkvMMa7oWtbdwhOWUmIZWlTdKIl+e
         jIEy4IJK5DF9cq5RywIEvxu4w0VLZZXecuiddCJLhV4y34/HivtT6yGGI3dj+FmHTD4q
         sTz4TvAKWUszVbY913zS1pM+/23UAnpjDBpMVbzy59u57/J6Ug/25fdMW33cR4BrK7oR
         Zhme774geP42uqk+CWEVUOtycWpnTp43UpfDTY3bdABWvJH3Jc4CnoagcJ6Bxo3GAZCL
         frX5/vgJ/ENHgC5mQoFUwpQrXYlzQm0c6QlYVG6IDYGRIXT/mhy71f2EMZm+gPcpSWUb
         bgZg==
X-Forwarded-Encrypted: i=1; AJvYcCUsAj35XH+AIQ6Qm3pNv75ObZ2Y0T/5XKVVvcfzbgWIlWJyuUeeM4XxmaKMFX2Fn1pHCOT9vB5YGbrwGKjA3Wp1+phUneBW/iVIoaLiq9A=
X-Gm-Message-State: AOJu0YyXjeyF4PQQpsZn0hSMiKzlhqtXeM94U9SYx29LFtzQ1m199fxk
	35+TINAYyNIAg93r7cnFrzIBwpXxxVqVSwLGlYIW6V/ypf0QdJBEjWC+tKyEqw==
X-Google-Smtp-Source: AGHT+IFifYw2nnZKN0QmbYKITGs7Yd9qkg+0YSEpVRluJvKijuOpfNfxqbtvHqYEZPugBw3jDVxqag==
X-Received: by 2002:a50:9fc9:0:b0:56e:24a5:587a with SMTP id 4fb4d7f45d1cf-5734d5bec0fmr14752032a12.11.1715851490291;
        Thu, 16 May 2024 02:24:50 -0700 (PDT)
Message-ID: <cc7620c8-a458-451e-badb-8e46d2cb9d90@suse.com>
Date: Thu, 16 May 2024 11:24:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 (resend) 06/19] x86: Add a boot option to enable and
 disable the direct map
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Elias El Yandouzi <eliasely@amazon.com>, xen-devel@lists.xenproject.org,
 julien@xen.org, pdurrant@amazon.com, dwmw@amazon.com,
 Hongyan Xia <hongyxia@amazon.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <jgrall@amazon.com>
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-7-eliasely@amazon.com> <ZkMs1cknBFBWZoJG@macbook>
 <086f1bbe-2b86-493e-8936-81f420500672@suse.com> <ZkXPvgRupZw31nGw@macbook>
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
In-Reply-To: <ZkXPvgRupZw31nGw@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.05.2024 11:19, Roger Pau Monné wrote:
> On Wed, May 15, 2024 at 03:54:51PM +0200, Jan Beulich wrote:
>> On 14.05.2024 11:20, Roger Pau Monné wrote:
>>> On Mon, May 13, 2024 at 01:40:33PM +0000, Elias El Yandouzi wrote:
>>>> --- a/docs/misc/xen-command-line.pandoc
>>>> +++ b/docs/misc/xen-command-line.pandoc
>>>> @@ -799,6 +799,18 @@ that enabling this option cannot guarantee anything beyond what underlying
>>>>  hardware guarantees (with, where available and known to Xen, respective
>>>>  tweaks applied).
>>>>  
>>>> +### directmap (x86)
>>>> +> `= <boolean>`
>>>> +
>>>> +> Default: `true`
>>>> +
>>>> +Enable or disable the directmap region in Xen.
>>>
>>> Enable or disable fully populating the directmap region in Xen.
>>
>> Elias, would you please take care to address earlier review comments
>> before sending a new version? This and ...
>>
>>>> +
>>>> +By default, Xen creates the directmap region which maps physical memory
>>>                                                           ^ all?
>>>> +in that region. Setting this to no will sparsely populate the directmap,
>>>
>>> "Setting this to no" => "Disabling this option will sparsely..."
>>
>> ... this is what I had already asked for in reply to v2, of course with
>> different wording.
>>
>>>> --- a/xen/arch/x86/setup.c
>>>> +++ b/xen/arch/x86/setup.c
>>>> @@ -1517,6 +1517,8 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>>>>      if ( highmem_start )
>>>>          xenheap_max_mfn(PFN_DOWN(highmem_start - 1));
>>>>  
>>>> +    printk("Booting with directmap %s\n", has_directmap() ? "on" : "off");
>>>
>>> IMO this wants to be printed as part of the speculation mitigations, see
>>> print_details() in spec_ctrl.c
>>
>> And not "on" / "off", but "full" / "sparse" (and word order changed accordingly)
>> perhaps.
> 
> I've been thinking about this, and I'm leaning towards calling this
> new mode "ondemand" rather than "sparse".  The fact that the direct
> map ends up sparely populated is a consequence of populating it on
> demand, and hence the later would be more descriptive IMO.
> 
> (Same for the Kconfig option then ONDEMAND_DIRECTMAP, or some such)

Fine with me, fwiw.

Jan

