Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABEC87F946
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 09:16:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695256.1084871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmUdP-0007JP-Tz; Tue, 19 Mar 2024 08:15:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695256.1084871; Tue, 19 Mar 2024 08:15:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmUdP-0007GF-Qz; Tue, 19 Mar 2024 08:15:47 +0000
Received: by outflank-mailman (input) for mailman id 695256;
 Tue, 19 Mar 2024 08:15:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aOUF=KZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmUdP-0007G9-3C
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 08:15:47 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2da9c8d-e5c8-11ee-afdd-a90da7624cb6;
 Tue, 19 Mar 2024 09:15:45 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a46d9fbb5a5so64215566b.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 Mar 2024 01:15:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h25-20020a17090634d900b00a454438091fsm5760810ejb.70.2024.03.19.01.15.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 01:15:45 -0700 (PDT)
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
X-Inumbo-ID: e2da9c8d-e5c8-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710836145; x=1711440945; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uQye6Y4P+NXTkYUYsIvH1XldHouhJPvX6q245Jd1G4g=;
        b=URpeDlK5+E83eLnkqB/R969mVeqU8Fhh4IPZ3LxLq3X3blEXjMQAJou14gs2n67O0e
         HlZ5CaAyQfofw7HeXOQPHuVZfONGCTxHyc+0QddIM12LouMdxwbs997KLLppL9R6HYE+
         VsJfboYyjNtP5dH48YI3zL1GAjY1SpCNz9e0wmBK/0cgpOwjjA54qaRJnf/EsPb75Q9i
         A6FqCKGwOjm05GWd0POYNv6ciComw1BZU22RVubZKW7ddp+JG5eOk3xMpAKpobaA9IDj
         KAF8c1mOO1mPMGeRZxOheBezRZWHOqMwdB9OcSi34m/1pT4tIum/PVvJ14MeO6kDBZUo
         fJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710836145; x=1711440945;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uQye6Y4P+NXTkYUYsIvH1XldHouhJPvX6q245Jd1G4g=;
        b=sq9leNZMWLb+oc7h2PeKYZ5vE+yxyRXMYEM2m73x/cSnrdoY1CxnONmHY3gAQqmwax
         tMhVi5PCToNO6+HACc+knZoCqw/y9jZUB/sqjBsg7hCinSFyLOmFFDkDjbVntkOsmZMp
         llEGYo3KrMtPHNIh7GsnetEO6E4ORzcSPXKS2nRjbv0q/oCtWgYskfFDZ1fE1evFRjKm
         aDKRUrhYhSVj7sKIL5qCVwRP6rsp5oYkl0wadSrlCdf2Wu1Ejt6GRLa5tMS6j1VXBKlg
         Q18xVi+Y00c+4bzhlJKQO65N6OTAHlSVQoSz0C+aZuRwWNUZS8S4mXdsr7NVOMyWTu83
         ycTw==
X-Forwarded-Encrypted: i=1; AJvYcCVKKSwLdUK+/+F1SGAOpYq79Zte31qqHvWVuGreip8/VvCmz32kiZdm3gdopC82Nrqaoh/8Ogr8GNsABi9UBW44KKN0xuQtdA9lgU4UHQU=
X-Gm-Message-State: AOJu0Yy+zNuZuQMQYfAhvYTid/wbXX2DNxq3DeNt4fDKkTpjrYTaxtoz
	uoSohizUi4Gvt6R7wMG9dWd+nlngK3iRVuB4MOlFpok1q3kvKKvWbijx/1cWfg==
X-Google-Smtp-Source: AGHT+IFEmLPllDnQ+x8vIoJCX0JLXXFn0DfeNNfk6ktvbTiPvF82V77cXfd+c2+kgAMY1WEfY2iNSg==
X-Received: by 2002:a17:906:88d:b0:a46:b1b3:aba0 with SMTP id n13-20020a170906088d00b00a46b1b3aba0mr1036679eje.17.1710836145330;
        Tue, 19 Mar 2024 01:15:45 -0700 (PDT)
Message-ID: <ba2f4e13-d599-4376-933b-c23c0d6e6dbe@suse.com>
Date: Tue, 19 Mar 2024 09:15:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] x86/PVH: Support relocatable dom0 kernels
Content-Language: en-US
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20240313193021.241764-1-jason.andryuk@amd.com>
 <20240313193021.241764-4-jason.andryuk@amd.com>
 <12fe48a6-6957-49d7-adf5-1a3ac8b1bfaa@suse.com>
 <7506abe0-e3d4-44f7-b54d-592ae2e3fd3e@amd.com>
 <88bd8577-42e6-4087-9888-00cd73e7f0bc@suse.com>
 <c16dcad1-5310-4e90-8045-02c0893f6814@amd.com>
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
In-Reply-To: <c16dcad1-5310-4e90-8045-02c0893f6814@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.03.2024 22:21, Jason Andryuk wrote:
> On 2024-03-15 05:48, Jan Beulich wrote:
>> On 14.03.2024 20:19, Jason Andryuk wrote:
>>> On 2024-03-14 09:31, Jan Beulich wrote:
>>>> On 13.03.2024 20:30, Jason Andryuk wrote:
>>>>> --- a/xen/arch/x86/hvm/dom0_build.c
>>>>> +++ b/xen/arch/x86/hvm/dom0_build.c
>>>>> @@ -537,6 +537,108 @@ static paddr_t __init find_memory(
>>>>>        return INVALID_PADDR;
>>>>>    }
>>>>>    
>>>>> +static bool __init check_load_address(
>>>>> +    const struct domain *d, const struct elf_binary *elf)
>>>>> +{
>>>>> +    paddr_t kernel_start = (paddr_t)elf->dest_base & PAGE_MASK;
>>>>> +    paddr_t kernel_end = PAGE_ALIGN((paddr_t)elf->dest_base + elf->dest_size);
>>>>
>>>> Both casts act on a pointer value. Such cannot legitimately be converted
>>>> to paddr_t; it only so happens that paddr_t is effectively the same as
>>>> uintptr_t right now. (Same issue again further down.) That said, I notice
>>>> we have pre-existing examples of this ...
>>>
>>> Yes, I followed existing code.  Do you want dest_base to be switched to
>>> a uintptr_t?
>>
>> I think it was deliberately switched to being a pointer at some point,
>> maybe even in a security fix.
> 
> commit 65808a8ed41cc7c044f588bd6cab5af0fdc0e029 "libelf: check all 
> pointer accesses", part of XSA-55, switched from a single dest pointer 
> to dest_base & dest_size.
> 
> For libxenguest, it's a pointer to guest-mapped memory to copy in the 
> kernel.  For PV dom0 creation, it's a pointer - Xen switches to the dom0 
> page tables and performs the copy with it as-is.  For PVH dom0, it's a 
> guest physical address.
> 
> Are you looking for this to be addressed in this series?

I'm sorry to ask, but what is "this" here? I'd like your change to leave
all types alone. I'd further like your change to preferably avoid cloning
questionable code (i.e. casts using the wrong type in particular). Plus,
where technically possible, adhere to the general principle of avoiding
casts (for typically being at least somewhat risky towards hiding
potential bugs).

Jan

