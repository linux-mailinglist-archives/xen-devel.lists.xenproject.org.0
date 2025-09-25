Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9B1B9D7DC
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 07:46:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129845.1469565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1eni-0002fa-0h; Thu, 25 Sep 2025 05:45:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129845.1469565; Thu, 25 Sep 2025 05:45:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1enh-0002cq-TT; Thu, 25 Sep 2025 05:45:53 +0000
Received: by outflank-mailman (input) for mailman id 1129845;
 Thu, 25 Sep 2025 05:45:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v1enh-0002ck-1h
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 05:45:53 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4b7f769-99d2-11f0-9809-7dc792cee155;
 Thu, 25 Sep 2025 07:45:50 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-62fca01f0d9so1020081a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Sep 2025 22:45:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b353e5cf32asm94454566b.1.2025.09.24.22.45.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Sep 2025 22:45:50 -0700 (PDT)
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
X-Inumbo-ID: e4b7f769-99d2-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758779150; x=1759383950; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DErEVvkViAAR6Hn2FQ1S1eWGQGRWMMcsknoFlSU0QH8=;
        b=eWFNTsTrF28DwFYOlqDp4EtUH5X3OyKDDslabJOjHAlR7Ypnp2/ZW9o2p2dIMOJ9ql
         4az/VqsbV4zon+++wYWttKGL87M+P9odoy4znYUiuwQoCeL1hSMKrSt2oj6uFUafcafZ
         D+gTx1756loAhcBssuexV6nqcM+/2sgPBkvO4eXkIBJQDsCIXgk6zZ+waUuv+NLUPsJ0
         E9YQcrFbFjWMFhIFhJKBKOgoz/jq4Zd+JozWFCIH1MVAMG805KSw+m8CUJcexoYacXC0
         Uc6JH1bLa6aEXBRVgrNfNJBb/sgvktoh9/LaeqBS6e+me04wkcJf+u9UUVXZsXznH6zy
         V9xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758779150; x=1759383950;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DErEVvkViAAR6Hn2FQ1S1eWGQGRWMMcsknoFlSU0QH8=;
        b=JYR6hHdylqNvrx/jghBsHn0+SC378oQfpnRhZWJu+iHTu2LcCOvWCZ9ugwAQNnzozv
         6Gt77guZysnM2rUEonIpHi54PLw67mPucqE3Ynaa0wXc1lZuhOiOb3YLpa1LiEv1hOSL
         3PCs6QJfuoeDSmzRnTzt/PBebRkOGi29i4WmCEUSBS3158DIR0+TKjmNzdPY+gQFE5wL
         4QGkKUy7Xsn9u9+p8/hAnVI9+O8GKI5TDrki0B51+UWnv5isll3wJiZUBldCnRHT5dpN
         DtBScNEaPF09/NRgko+qDrIKfKSsRChDN7SyXM6X9/GhU9z2W2gt3Uxmogs8rjJeVsfm
         DXeA==
X-Forwarded-Encrypted: i=1; AJvYcCXik9xMmw1CtbMetGnuYBNNiPO5btWESa31UYf3VXTPdByyLmaaR+Oj+phra0iMx4UOSyhl7fDGmB8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwUNymoBQ2cgqbqiqAHFeJBSocDvSuu4lq6PDiSYZYQNdWb0jF0
	PmtKbRXUAi+USDcclCtoJhhmxXiw8L2z6tPAAGwnKO5xcd5t8ihDmAJhSi8tenYWjw==
X-Gm-Gg: ASbGncuZKI4Ve4+vZNTG7KYSVDGd/dwZc6OzpZy03MtTZiewRMxqfRRXwpnhVyP3U1s
	q5A4C8TE4k/eKWw2Yc3Yn1CS1AqJkvDEZufSQmNFbp7a3nx85IesCXf+/DpYHmY3ymqpUFwoqqF
	L7hFZi9ydY7NgpkQiVnQoUYewDLVu9fbzCeTdVp85UcIhOIaKo9EmRT9+nG8iQq035QsA6fFgST
	+Svr/C2XjEdvgPowtlrxF7skJFiuCnJAuSO9D8i1qnnZIQegKXBZTt9MBpyFMBy+3l/bWohovQX
	qW7zq8E8QNKMxaUqiNzTWdxKKrZOZBarRv4LYU6rlw+NXPk8+CiOs7r+1F4nyJTmS0SK1cOZZMR
	8icrpZr5LyRv35zpgBqb+fIheEagGB5qw6U6SYw7JU3yAgyWzm/UhKX/xYKgyPVWVhJ4pYYcAFg
	gmVpfKYPGs017uRaYiPQ==
X-Google-Smtp-Source: AGHT+IHDhBw+ESO9/uyJPQJ5SMlbtdNu2wLC4wRvQeNXoGxU+YkWpQPU50ZIsmTRPCbH9/FHdi5ARA==
X-Received: by 2002:a17:907:6093:b0:b04:6a58:560b with SMTP id a640c23a62f3a-b34ba93ce11mr240848266b.39.1758779150380;
        Wed, 24 Sep 2025 22:45:50 -0700 (PDT)
Message-ID: <67342536-40d0-4473-b796-42fd556d5553@suse.com>
Date: Thu, 25 Sep 2025 07:45:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/26] xen: consolidate CONFIG_VM_EVENT
To: "Penny, Zheng" <penny.zheng@amd.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-5-Penny.Zheng@amd.com>
 <b8430631-f857-426a-a144-c6b8fbf94ee9@suse.com>
 <CABfawhnzoDwo7vbFNN8wAnmEELoQND6snSE8m_VZnS0LWErMGQ@mail.gmail.com>
 <bbafea99-7f78-48e6-aa26-2e498e526f29@suse.com>
 <DM4PR12MB8451FB860756DCE542F02BCAE11CA@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB8451FB860756DCE542F02BCAE11CA@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.09.2025 08:39, Penny, Zheng wrote:
> [Public]
> 
> Hi,
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Sunday, September 14, 2025 10:04 PM
>> To: Tamas K Lengyel <tamas@tklengyel.com>; Penny, Zheng
>> <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; Roger Pau Monné <roger.pau@citrix.com>;
>> Alexandru Isaila <aisaila@bitdefender.com>; Petre Pircalabu
>> <ppircalabu@bitdefender.com>; Daniel P. Smith <dpsmith@apertussolutions.com>;
>> xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v2 04/26] xen: consolidate CONFIG_VM_EVENT
>>
>> On 14.09.2025 01:31, Tamas K Lengyel wrote:
>>>>> @@ -99,10 +98,40 @@ long p2m_set_mem_access_multi(struct domain *d,
>>>>> int p2m_get_mem_access(struct domain *d, gfn_t gfn, xenmem_access_t
>> *access,
>>>>>                         unsigned int altp2m_idx);
>>>>>
>>>>> -#ifdef CONFIG_VM_EVENT
>>>>>  int mem_access_memop(unsigned long cmd,
>>>>>                       XEN_GUEST_HANDLE_PARAM(xen_mem_access_op_t)
>>>>> arg);  #else
>>>>> +static inline bool xenmem_access_to_p2m_access(const struct p2m_domain
>> *p2m,
>>>>> +                                               xenmem_access_t xaccess,
>>>>> +                                               p2m_access_t
>>>>> +*paccess) {
>>>>> +    return false;
>>>>> +}
>>>>
>>>> So this is needed when VM_EVENT=n and ALTP2M=y. Tamas, is this a
>>>> configuration which makes sense?
>>>
>>> Yes, altp2m should be functional without vm_event being enabled. There
>>> could very well be in-guest only use of altp2m via #VE. This function
>>> is used in p2m_init_next_altp2m which means it being stubbed out like
>>> this when vm_event is disabled breaks altp2m.
>>
>> Oh, indeed - the stub still needs to handle XENMEM_access_default. Of course
>> with MEM_ACCESS=n it's not quite clear to me what p2m->default_access ought
>> to be; imo in principle that field ought to also go away in that case (becoming hard-
>> coded p2m_access_rwx). While doing that will be a larger patch, perhaps using the
>> hard-coded value here should be done right away.
>>
>> Once the code correctly handles MEM_ACCESS=n as an implication from
>> VM_EVENT=n, it's also questionable whether MEM_ACCESS_ALWAYS_ON
>> should be retained.
>>
> 
> If we intend to remove MEM_ACCESS_ALWAYS_ON, I suggest to do the following modification on VM_EVENT to still keep y on default on x86:
> ```
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 7bd8a04730..61d48a5120 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -170,13 +170,10 @@ config HAS_VMAP
>  config LIBFDT
>         bool
> 
> -config MEM_ACCESS_ALWAYS_ON
> -       bool
> -
>  config VM_EVENT
> -       def_bool MEM_ACCESS_ALWAYS_ON
> -       prompt "Memory Access and VM events" if !MEM_ACCESS_ALWAYS_ON
> +       bool "Memory Access and VM events"
>         depends on HVM
> +       default X86
>         help
> 
>           Framework to configure memory access types for guests and receive
> ```

Yes (at least for the time being; eventually we may want to make this default N
even on x86).

Jan

