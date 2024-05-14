Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 317248C585F
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 16:58:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721634.1125205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6tbX-0006VP-2P; Tue, 14 May 2024 14:58:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721634.1125205; Tue, 14 May 2024 14:58:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6tbW-0006Tt-Vn; Tue, 14 May 2024 14:58:10 +0000
Received: by outflank-mailman (input) for mailman id 721634;
 Tue, 14 May 2024 14:58:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VieR=MR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s6tbV-0006Tn-6c
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 14:58:09 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60059651-1202-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 16:58:08 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a5a5c930cf6so24343766b.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 07:58:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c823dsm729289166b.100.2024.05.14.07.58.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 07:58:07 -0700 (PDT)
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
X-Inumbo-ID: 60059651-1202-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715698688; x=1716303488; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wofELa6xhGTDOJO2X7cSH5wYetnwYKwX6A5ydQs9olQ=;
        b=HNYbCcROiZshAlHG0OyY8wY0cJmXTZGAjiKBmpUOFhyMXCzaWbj2D5dj+x1WFzm5dn
         63UCnRTQ8lIRRtZp2oGTiyAcIt348y94u50muyBQuyuue84Tz85NXKgJhehAnyA57gSb
         O2jFwBD4TMownz8BSBQCrPHrMuWJpnOZpl2xi2eSxMxIJdZByzyFrePtpFgfckxRxhVw
         qxb0oYGYihxwB0EFlgGT8FZWFvGhPHeMqRzVkSEaqQf2WE1LUu43XeC0KhwugljUwLUm
         gvd6LvVpJlAckR1ZA42+gliEp59UMQEJmgcalfn1fkRP1CcAfXA2pF+nRiJ4I4iR0ug9
         6hTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715698688; x=1716303488;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wofELa6xhGTDOJO2X7cSH5wYetnwYKwX6A5ydQs9olQ=;
        b=sk0aXmbuhT0F11RqlehoEYwtAqp67NpPJAaIdrtsz4SOVXyELu33Rfhn2epeBmJtR6
         ZW9AwV9WTpVm/hKO+hbtsl6ot7Jtp0TXyn1Nxxtv44mziWQsY1Ws3CKIMMa7N0xXzQui
         S5j1JIO1kd37MLthKatNIa2vLjtpwUUHnO6pDKfwGxK206OyPzBdBUIuxlwF4EW9P4Yk
         09Kys7Rz8e7C+XztL9/iwnDx7P2sWzlD1Fg44/7yY3c9XQxiPZjEzHehB0I9W3zv3CyE
         +ZvXgZpe88VOuztGD/ko3QZuSLGqtnkq32T2w4VvRu/tNeOlodUGsXyrihLM01C50hND
         U6iA==
X-Gm-Message-State: AOJu0YzvLaVdd7uC2G/Mfjgtj/w+ENhJ2aBANcB1fhlts0gKnm/WQVVE
	4SQfaIaew2XWjJ7L96luhqw1XAcs52VMpUBevx4v3gvI9ngUr5vd/O/pqP9dhA==
X-Google-Smtp-Source: AGHT+IHCTnYWAhCHBR5nm5fKjQmGckyZVlWCRJ9ouOaO2/8miaM8G2xf5P0/ieRLYTSkJk6J94pzdQ==
X-Received: by 2002:a17:906:ae51:b0:a59:cdc5:d6e8 with SMTP id a640c23a62f3a-a5a2d6668d5mr775356866b.50.1715698687755;
        Tue, 14 May 2024 07:58:07 -0700 (PDT)
Message-ID: <79afece5-a4c7-4426-b40f-b3db49fbdfc2@suse.com>
Date: Tue, 14 May 2024 16:58:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 (resend) 03/19] x86/pv: Rewrite how building PV dom0
 handles domheap mappings
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Elias El Yandouzi <eliasely@amazon.com>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, pdurrant@amazon.com,
 dwmw@amazon.com, Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-4-eliasely@amazon.com> <ZkJEhZCRNnxGb_lc@macbook>
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
In-Reply-To: <ZkJEhZCRNnxGb_lc@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.05.2024 18:49, Roger Pau Monné wrote:
> On Mon, May 13, 2024 at 01:40:30PM +0000, Elias El Yandouzi wrote:
>> @@ -710,22 +714,32 @@ int __init dom0_construct_pv(struct domain *d,
>>          v->arch.pv.event_callback_cs    = FLAT_COMPAT_KERNEL_CS;
>>      }
>>  
>> +#define UNMAP_MAP_AND_ADVANCE(mfn_var, virt_var, maddr) \
>> +do {                                                    \
>> +    unmap_domain_page(virt_var);                        \
>> +    mfn_var = maddr_to_mfn(maddr);                      \
>> +    maddr += PAGE_SIZE;                                 \
>> +    virt_var = map_domain_page(mfn_var);                \
> 
> FWIW, I would do the advance after the map, so that the order matches
> the name of the function.

Actually I was thinking kind of the same when looking at v3, even if I
may not have commented to that effect. Then again that goes somewhat
against the further suggestion below.

>> +} while ( false )
>> +
>>      if ( !compat )
>>      {
>>          maddr_to_page(mpt_alloc)->u.inuse.type_info = PGT_l4_page_table;
>> -        l4start = l4tab = __va(mpt_alloc); mpt_alloc += PAGE_SIZE;
>> +        UNMAP_MAP_AND_ADVANCE(l4start_mfn, l4start, mpt_alloc);
>> +        l4tab = l4start;
> 
> You could even make the macro return virt_var, and so use it like:
> 
> l4tab = l4start = UNMAP_MAP_AND_ADVANCE(l4start_mfn, mpt_alloc);
> 
> ?

Not quite, l4start also need to be an input to the macro:

    l4tab = l4start = UNMAP_MAP_AND_ADVANCE(l4start_mfn, l4start, mpt_alloc);

Else unmap_domain_page() has nothing to act upon. If anything that would
then (imo) likely better be

    l4tab = UNMAP_MAP_AND_ADVANCE(l4start_mfn, l4start, mpt_alloc);

with l4start still updated inside the macro.

Jan

