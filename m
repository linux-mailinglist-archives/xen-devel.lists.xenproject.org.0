Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C293DD24084
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 11:56:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204805.1519372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgL1Z-0007wG-7k; Thu, 15 Jan 2026 10:56:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204805.1519372; Thu, 15 Jan 2026 10:56:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgL1Z-0007tu-44; Thu, 15 Jan 2026 10:56:21 +0000
Received: by outflank-mailman (input) for mailman id 1204805;
 Thu, 15 Jan 2026 10:56:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vgL1X-0007Qr-RE
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 10:56:19 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1f0ee4d-f200-11f0-b15e-2bf370ae4941;
 Thu, 15 Jan 2026 11:56:18 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-47ee807a4c5so5576765e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jan 2026 02:56:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ee2a5e48asm39939555e9.20.2026.01.15.02.56.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 02:56:17 -0800 (PST)
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
X-Inumbo-ID: d1f0ee4d-f200-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768474578; x=1769079378; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Za7Gq1jYLlWSX1PBmn/AuaZtv3+lx9trnFsAxr1SdSQ=;
        b=FvInh05UWvVVs80LXXUxKx4IbbIeOXRVKYItkLpnrki7s4mwAwetgnDmhMfSPFFOy0
         yIjysvQUGo+NUFWgukj9Dl+lqBSuNS41q0rl7kNRiZAd84r1fAdFoBRscQ+3lLA2P1ci
         Bd8EqrfOCdnd4fU0Y5jSATVtXUB+5QM4aqe0OE+Tifg2EbOdcpZxGknxAd3rHQI6MCBk
         U8xtaGI9siKRvfmLoD5MWl4tO/1Wvozl4fXCNmipvP6x4QFymvgQJ55RbjX2dF/VLRj3
         oQfYOdNNhr42K/L4JkP9RCj9EyJgXBP59OEnKKUaJrKVWLdIJXky16JFtSzZLZ8+Dm60
         BqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768474578; x=1769079378;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Za7Gq1jYLlWSX1PBmn/AuaZtv3+lx9trnFsAxr1SdSQ=;
        b=L09Y0qa1kf2CopJahePebMcrDp1dAKj8rS4uELDFb+cpuuZYkmwVM3aO+0R2B+IsNE
         MU/7wVXg/dNLiQTnigrW7asuyzucaVFfX0IMqFcR3jibAEyrYbOlsmdQTmCZJk7wfzFs
         2dqsKorF4eIgEUXI+KNtTSf0a94mSaabZ0X91zjiJcvN7Uli6N3K/HfgHCpyt3hL5k8i
         fhdLkRsShxGD9yO1QTRTtZiL6v0bro/xxLYOv/CoJ+pceo5Hc+hHvDEvguvYbCpZAEVT
         uwVN5gWuE13clIWc1aawiA4QGODVM8zNFaa21Z5ZrGv7UXbcRc23rw9nQCq85yDu3IE9
         0klw==
X-Forwarded-Encrypted: i=1; AJvYcCU+I7yG9GMpgoxX0bng8Wq4831k5XQPOANewOswGLBP2RHWRi657QzVKwnLJaeyJrmdXyFazl9h0iQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxYV18zgRx4VjKdB/0D1I7yoAh5+ZYSl/Te/vW+8sgetJz062Qo
	9PvopYtLrdqegI9UerQBkWEiclrPY2AWFLGk3w1iZ3Ji3C140LqAEU7mcdFhOJmvOw==
X-Gm-Gg: AY/fxX5Xe/oGTjVqmLXGJjuZ/6WYzQzylYRMi2ACUirNg+7hF+A51jgE6fnBXsa4h19
	iWTvscyW4xxoWAyanYv5SRkmGZJv3AUjSgtMY+/aAG1Bj8ncxjfFqzRDa8Q7+wXCpljCEKJv7Z5
	sWDMsJQsTRCiq4tG/cIvV9E7oRQkAieGQHAPM/GlKd3hgzFv06zkzl8CPv1PJoGwxjOWnCQYxKO
	s3sHFuSpLFpSZDr4BASZeZRQx0wRAg8VUOMz90ZX2DOr0+PkWCkO7fevZkHmEnVoWQSt7oqJpSD
	2lkXPZtDn5XVo+j2gzZZcUibVdo8msE8pydc7D8WuHZFZDyUMLBN9WPs53n9D7QJs0H2UJ9t7al
	y9UZPJDQ1ZOXNKZEnwyG+PlDYfUYKRZzzcVJUW0BwyfkRTFODEmTdLByRzMdquH8MVnpj8lNxYG
	g49AbfqfITrRlGAoIcghp6AcD4vNe9CsDCfvnq990Kjn/otxYKKw7medU0SsViNmSsqLeZlNakT
	xNiqrFaHPlHog==
X-Received: by 2002:a05:600c:528b:b0:480:1d16:2538 with SMTP id 5b1f17b1804b1-4801d162823mr2914125e9.23.1768474577990;
        Thu, 15 Jan 2026 02:56:17 -0800 (PST)
Message-ID: <14560e88-bbd5-48e1-848e-e53a3237d16b@suse.com>
Date: Thu, 15 Jan 2026 11:56:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/mm: limit non-scrubbed allocations to a specific
 order
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260108175536.82153-1-roger.pau@citrix.com>
 <20260108175536.82153-3-roger.pau@citrix.com>
 <b547676c-ff2e-4a56-b3b4-2b2da167e2f1@suse.com> <aWZQLL997K3MTQY4@Mac.lan>
 <b535344e-1f27-4d5c-85aa-1529868f85fc@suse.com> <aWjGDy3ixLRTpZbF@Mac.lan>
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
In-Reply-To: <aWjGDy3ixLRTpZbF@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.01.2026 11:48, Roger Pau Monné wrote:
> On Wed, Jan 14, 2026 at 09:48:59AM +0100, Jan Beulich wrote:
>> On 13.01.2026 15:01, Roger Pau Monné wrote:
>>> On Fri, Jan 09, 2026 at 12:19:26PM +0100, Jan Beulich wrote:
>>>> On 08.01.2026 18:55, Roger Pau Monne wrote:
>>>>> --- a/xen/common/memory.c
>>>>> +++ b/xen/common/memory.c
>>>>> @@ -279,6 +279,18 @@ static void populate_physmap(struct memop_args *a)
>>>>>  
>>>>>                  if ( unlikely(!page) )
>>>>>                  {
>>>>> +                    nodeid_t node = MEMF_get_node(a->memflags);
>>>>> +
>>>>> +                    if ( memory_scrub_pending(node) ||
>>>>> +                         (node != NUMA_NO_NODE &&
>>>>> +                          !(a->memflags & MEMF_exact_node) &&
>>>>> +                          memory_scrub_pending(node = NUMA_NO_NODE)) )
>>>>> +                    {
>>>>> +                        scrub_free_pages(node);
>>>>> +                        a->preempted = 1;
>>>>> +                        goto out;
>>>>> +                    }
>>>>
>>>> At least for order 0 requests there's no point in trying this. With the
>>>> current logic, actually for orders up to MAX_DIRTY_ORDER.
>>>
>>> Yes, otherwise we might force the CPU to do some scrubbing work when
>>> it won't satisfy it's allocation request anyway.
>>>
>>>> Further, from a general interface perspective, wouldn't we need to do the
>>>> same for at least XENMEM_increase_reservation?
>>>
>>> Possibly yes.  TBH I would also be fine with strictly limiting
>>> XENMEM_increase_reservation to 2M order extents, even for the control
>>> domain.  The physmap population is the only that actually requires
>>> bigger extents.
>>
>> Hmm, that's an option, yes, but an ABI-changing one.
> 
> I don't think it changes the ABI: Xen has always reserved the right to
> block high order allocations.  See for example how max_order() has
> different limits depending on the domain permissions, and I would not
> consider those limits part of the ABI, they can be changed from the
> command line.

When the limits were introduced, we were aware this is an ABI change, albeit
a necessary one. You have a point however as to the command line control that
there now is.

Jan

