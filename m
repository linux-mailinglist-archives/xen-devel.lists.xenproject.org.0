Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C698C67D9
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 15:55:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722386.1126272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7F5u-0000YK-No; Wed, 15 May 2024 13:54:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722386.1126272; Wed, 15 May 2024 13:54:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7F5u-0000W5-L0; Wed, 15 May 2024 13:54:58 +0000
Received: by outflank-mailman (input) for mailman id 722386;
 Wed, 15 May 2024 13:54:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EWeN=MS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7F5s-0000Vv-Ev
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 13:54:56 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b48ab2a1-12c2-11ef-b4bb-af5377834399;
 Wed, 15 May 2024 15:54:53 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a59a387fbc9so207511366b.1
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 06:54:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1781cf60sm873729666b.14.2024.05.15.06.54.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 06:54:52 -0700 (PDT)
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
X-Inumbo-ID: b48ab2a1-12c2-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715781293; x=1716386093; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T8KUSKK4f/TeN8ca0cnroVOq86D1LfE9MjRgPGGCXIE=;
        b=O1ypHrVxbvk35x/5t0IZG8z84hRKnb6EVvd9HqsSWxflhX2QUxLzS8V+xZjX6xBMFb
         eXWwiXr95irDrnSjLT87zaeC54E3ja1kyHsbVOYDUBJy8EzrtGCPazp3GYGpyDtiNYX0
         4W+JUYM/cZypVP0NNYZoIgZHFhGhOBuTrsAkSgKarZn3n5vR69A/TRu2mS8DrRf9GDPP
         uxk7RrRNX/UDeA8bNsoW9jpXeWQKw3JIP6Q3VIxbd6E874Qz5IyFx/tLzYkVUCJ+xXhP
         qWNZhk94dRcyRmAxH0E2S7Gds1Eeq0mNbi9xV6qFMl8efJFFtXSTMmp4BbwrzKHaEY0L
         ZWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715781293; x=1716386093;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T8KUSKK4f/TeN8ca0cnroVOq86D1LfE9MjRgPGGCXIE=;
        b=gQlttVNVQ80nWGqedJqaD4nMWiTPGFNjbfvqjLJ1EZ6qVadUHYLui+cR9TMWZA/D6w
         L1lUkBUNGLBERs5J18G9RAr8bHF3kLmGjg32LAny9Mjw4LZencvLB9W97T3CZc1R8zeL
         /2cmCEFYcsbMZljoKcqiNmzfsidQ8PVYYgUijhlKeBNCL8MSXFbW/A4Fh83pEwsAppVt
         0QlAOkZ5ld9E1Nn3GY8tZ65bzjDostXuLi6C/ZSMdsgflXrFIXDNnyrPr8q5igry4Sqx
         OkxWCp0FiM9grocXDAkhgP+JnT0NTyMWHuft3UQ2OzzKgz4bKVlQ8J1T/7a6lMvded0S
         +iPA==
X-Gm-Message-State: AOJu0YwEVtBF5rUU4pXsNO7p+PDHG7kBd7HFEjHrkfpwYr1y45K8AARO
	fSSssQi9DzBvbhlrBtzLgjxKYfpE42yvD2usKgwcNeIbp5T93DL0cmMJrYzZ0Q==
X-Google-Smtp-Source: AGHT+IH0mG1n3fdPPmn9yZbacvekDjwXnHL0KXJbHTifGCKaDYC/MOdnRraLuzqNhV3OUhEKrscZeQ==
X-Received: by 2002:a17:906:7815:b0:a59:c3bb:b83b with SMTP id a640c23a62f3a-a5a2d54c915mr890643566b.1.1715781292958;
        Wed, 15 May 2024 06:54:52 -0700 (PDT)
Message-ID: <086f1bbe-2b86-493e-8936-81f420500672@suse.com>
Date: Wed, 15 May 2024 15:54:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 (resend) 06/19] x86: Add a boot option to enable and
 disable the direct map
Content-Language: en-US
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, pdurrant@amazon.com,
 dwmw@amazon.com, Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <jgrall@amazon.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-7-eliasely@amazon.com> <ZkMs1cknBFBWZoJG@macbook>
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
In-Reply-To: <ZkMs1cknBFBWZoJG@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.05.2024 11:20, Roger Pau Monné wrote:
> On Mon, May 13, 2024 at 01:40:33PM +0000, Elias El Yandouzi wrote:
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -799,6 +799,18 @@ that enabling this option cannot guarantee anything beyond what underlying
>>  hardware guarantees (with, where available and known to Xen, respective
>>  tweaks applied).
>>  
>> +### directmap (x86)
>> +> `= <boolean>`
>> +
>> +> Default: `true`
>> +
>> +Enable or disable the directmap region in Xen.
> 
> Enable or disable fully populating the directmap region in Xen.

Elias, would you please take care to address earlier review comments
before sending a new version? This and ...

>> +
>> +By default, Xen creates the directmap region which maps physical memory
>                                                           ^ all?
>> +in that region. Setting this to no will sparsely populate the directmap,
> 
> "Setting this to no" => "Disabling this option will sparsely..."

... this is what I had already asked for in reply to v2, of course with
different wording.

>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1517,6 +1517,8 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>>      if ( highmem_start )
>>          xenheap_max_mfn(PFN_DOWN(highmem_start - 1));
>>  
>> +    printk("Booting with directmap %s\n", has_directmap() ? "on" : "off");
> 
> IMO this wants to be printed as part of the speculation mitigations, see
> print_details() in spec_ctrl.c

And not "on" / "off", but "full" / "sparse" (and word order changed accordingly)
perhaps.

>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -80,12 +80,29 @@ config HAS_PMAP
>>  config HAS_SCHED_GRANULARITY
>>  	bool
>>  
>> +config HAS_SECRET_HIDING
>> +	bool
>> +
>>  config HAS_UBSAN
>>  	bool
>>  
>>  config MEM_ACCESS_ALWAYS_ON
>>  	bool
>>  
>> +config SECRET_HIDING
>> +    bool "Secret hiding"
>> +    depends on HAS_SECRET_HIDING
> 
> IMO 'SECRET_HIDING' is too generic, this wants a more specific name.
> Maybe SPARCE_DIRECTMAP or some such.

This is another aspect I had raised on v2 already. SPARSE_DIRECTMAP
would be fine with me.

Jan

