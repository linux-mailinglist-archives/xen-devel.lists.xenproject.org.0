Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F29B9E04EA
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 15:29:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846710.1261856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI7Pr-0004Ur-3F; Mon, 02 Dec 2024 14:28:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846710.1261856; Mon, 02 Dec 2024 14:28:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI7Pr-0004SJ-09; Mon, 02 Dec 2024 14:28:47 +0000
Received: by outflank-mailman (input) for mailman id 846710;
 Mon, 02 Dec 2024 14:28:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tI7Pp-0004SA-Qs
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 14:28:45 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbe75f72-b0b9-11ef-a0d2-8be0dac302b0;
 Mon, 02 Dec 2024 15:28:44 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-385f06d0c8eso759256f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 06:28:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434aa74efbesm185330625e9.7.2024.12.02.06.28.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 06:28:43 -0800 (PST)
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
X-Inumbo-ID: bbe75f72-b0b9-11ef-a0d2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733149723; x=1733754523; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fHJeNuD6v1xFh34P4V/VA1MX88pcKwvoFSDDtzYEMYA=;
        b=KbgHrC2XkcmPXqUaFNvRHbQ2zK8uGAGGV4G1ZSt08vyG/b8qKNrpX+r7pXKx6jfP4q
         SF+fmf+r+EU2MKKeeAvdSsj9Fnd73XV+vXuOqbgUAODxJwzFIuuskSDCef37xif1UqEb
         uhnxwSpLbeEIn0b2VRb96EZmsO6Ddk5gwXQ5fUqtjq/jqHF64pNvtFAHpW9UUmvg/+tf
         dfiDsL07V9dcBQDQBGnwr0D65993B3uEpJmifMVFHPvMYOLQZfaB4zqT31yXJ4OgHNFJ
         k2VyssHjnO1e0Nssoxa1P+mEKpTPuGjMDw/FBoqkPHQDgga6MQ/t/zJMk3z69jT3tfAH
         RNfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733149723; x=1733754523;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHJeNuD6v1xFh34P4V/VA1MX88pcKwvoFSDDtzYEMYA=;
        b=sEXUeBpmJ7+rWUFPOd9Yb/YcdM7YMjfe/Lwn9DPL7kb0oHbiPbfjfnZAc2a+WZKUe7
         xON5I7T1HWKzEtEyeOgVpxiSdbEbk2+VtTE1/3Zpn8I/P0v1b/syc3tdVqBTBSTFEH/x
         eNkQrayukGcu02W5TWIWXisT/6HxI7BPIIZWVRXmpS2UdSwbHgZ+fdkjg/ze0tOGaF/g
         RU3G2+kQVXo9Wev/en6+mSVsvHdmRFuR33geO0iq9adqoDDbiINY/kU6QvaIrvgaNOC+
         H0aW0EFYe/QUr1UxiDhDuBCbDgEJwjRI7FdcEbJal/3zaJJQyeSqmv1GCxtRusQz7Qb8
         uvMA==
X-Forwarded-Encrypted: i=1; AJvYcCXX5invu6wAIc1e0TP2r5SyIo+pwnaq/1ocxU6R0INFAqa0QIBg/1sAduKJw5wXab8APf1oeuQLdBc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz3lsAPAF71I9MWSuDgIbOfut1DuAc3Q5oCu1V9MwJG0a1oviAU
	/0d2W0JYsW2JxvAyLQfglJiiWBkLlOZP18zuAOLYAYc1VLgheYoFGt1htCCyMg==
X-Gm-Gg: ASbGncvcBO0mjzc8ZiDSorh7ba/7Me1asSrxmKsUBjjZS1Gu4wELkWhKHqpS85SWi6V
	1oXFKd/gbNsHLgADhA1EKmPmWnn9AkZGUA5QmXBzWQw+GF7C/HBs0E3MXVGfzk/li9o7tVLfQCC
	bL5WN8p76/DtgMFFdDI7SAse96MVzruaU+GKzxllF8G16NeJFnhWNjRmbDbJCbgzImYE1ROqjj6
	l9QDL7C3bh33gC3BGAvTpGcg/1b+p8K/jKxwvknkpDyTDs3s62/npWCHmr3FOFrM527l80E3spZ
	nw4P3k8s5Q+CZvaH196pzNoK1Q0bqTVp07k=
X-Google-Smtp-Source: AGHT+IGf4OxwMXRJGTfkQ3fCbsLRA+KNNxWSoC9OfbLfbmS0ma1Vv9vk9Wfijqh+OQ7L+4rgT1i7VA==
X-Received: by 2002:a5d:47a7:0:b0:385:ec2a:325b with SMTP id ffacd0b85a97d-385ec2a343emr4091971f8f.29.1733149723595;
        Mon, 02 Dec 2024 06:28:43 -0800 (PST)
Message-ID: <d3266070-8ec2-4e20-ad42-844753cbbb46@suse.com>
Date: Mon, 2 Dec 2024 15:28:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 08/12] xen/page_alloc: introduce preserved page flags
 macro
To: Andrea Bastoni <andrea.bastoni@minervasys.tech>,
 Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: marco.solieri@minervasys.tech, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20241119141329.44221-1-carlo.nonato@minervasys.tech>
 <20241119141329.44221-9-carlo.nonato@minervasys.tech>
 <29e69d97-41ef-4ebc-a68e-0253e230f6f4@suse.com>
 <CAG+AhRWWK6e3KJ66v5wvowTzOvyJRaECpkXYpSzMa9+83ea0eA@mail.gmail.com>
 <ce9c6a08-f1d5-4755-8dc4-737f147b2b22@suse.com>
 <b380b2a8-0d12-42ca-8bae-e7dfa0724572@minervasys.tech>
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
In-Reply-To: <b380b2a8-0d12-42ca-8bae-e7dfa0724572@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.12.2024 13:51, Andrea Bastoni wrote:
> The proposal would be to go back to v9, which reduces (for the PGC)
> the management to colored only:
> 
>> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> ...
>> @@ -2382,7 +2556,7 @@ int assign_pages(
>>
>>          for ( i = 0; i < nr; i++ )
>>          {
>> -            ASSERT(!(pg[i].count_info & ~(PGC_extra | PGC_static)));
>> +            ASSERT(!(pg[i].count_info & ~(PGC_extra | PGC_static | PGC_colored)));
>>              if ( pg[i].count_info & PGC_extra )
>>                  extra_pages++;
>>          }
>> @@ -2442,7 +2616,8 @@ int assign_pages(
>>          page_set_owner(&pg[i], d);
>>          smp_wmb(); /* Domain pointer must be visible before updating refcnt. */
>>          pg[i].count_info =
>> -            (pg[i].count_info & (PGC_extra | PGC_static)) | PGC_allocated | 1;
>> +            (pg[i].count_info & (PGC_extra | PGC_static | PGC_colored)) |
>> +            PGC_allocated | 1;
>>
>>          page_list_add_tail(&pg[i], page_to_list(d, &pg[i]));

So what's wrong with having PGC_preserved _just_ for these two instances?

Jan

