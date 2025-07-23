Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7626B0EB41
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 09:05:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053356.1422114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueTXD-00045X-PQ; Wed, 23 Jul 2025 07:05:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053356.1422114; Wed, 23 Jul 2025 07:05:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueTXD-000431-Md; Wed, 23 Jul 2025 07:05:03 +0000
Received: by outflank-mailman (input) for mailman id 1053356;
 Wed, 23 Jul 2025 07:05:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFh9=2E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueTXD-00042n-54
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 07:05:03 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59db0516-6793-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 09:05:01 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a50956e5d3so4709983f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 00:05:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6d23aasm89285915ad.167.2025.07.23.00.04.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 00:05:00 -0700 (PDT)
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
X-Inumbo-ID: 59db0516-6793-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753254301; x=1753859101; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=74eO3F/7WpsPclHC2B2z+15xLhUMAVJOuMebLQdtU4s=;
        b=gbIF4XbMe4gGsQIX6qkK7J3EBcwdmrQ5JDbXaQlAoUaQYAVIPvMLgqD0WVqBOnaLDZ
         C4dYBMUaygDlJbHPH6vJRSxBavE/1bR6fKRv95Td4o80zm/piXs1ygenhAQLTNAhYsoC
         yMse7H31D6uTBLTKyIif3hgF9V5qSM6g04esPM/piY+w78rk0VOfxcH3YlZ5ts1iRSpP
         jgeHTsbWBPXEoP25qWDomGvrhfHXAc7MG0/Vqoq/U5UXxOl14UHm2qwDy3tOP3KB4RQZ
         qohx2pVEqyIyjDTLRPnrOZaf/e8h8a/9V53RWOcrHU2bIeilL7d8CqvauPOotlAzlmRn
         wXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753254301; x=1753859101;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=74eO3F/7WpsPclHC2B2z+15xLhUMAVJOuMebLQdtU4s=;
        b=Fn90roPDZ3cQvrvEZ5F65ykwJ0QYms70FMcj3FdnslYVt1BzzRrvAqREm29RBVLYNT
         UyPXTh2S+FPCjFsPsG2nKkXGn0+LKBjf3IuZd5lwccQFdnFDwvbk5EIPkVr68PPz0bJY
         BYEeR+mo3x5uV1e82/DPxbqv8XDXwjDq41KP6HmgfYVZK26mJoI555/Eult2KVnl01Hx
         /JnvvfV6N9/OqKuh6RalECjeXsno6ctgU7nVMmHnE2EPo/wQtUmmd1w54Qqw/ORh3QQV
         8rx4Iahqz8S5S0iqplaHaCFfsK8+1NmlIfMNpuvCsbJ+cSgasikxJ1IoQD9/iBm9vURB
         LK5A==
X-Forwarded-Encrypted: i=1; AJvYcCVaJDobjztnBVWk5n5B6dhO5NbVQakE23AHkXbSGf3gYLeHhDVv2+r4oNT0aU4XbCz4vNCn3UDHslQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwpP7tyy5cN/Zq56i455eSBV1y5lacp7O+/v6smlzjgZ2S0xzdb
	ehAdzhqlvvywiOnoxtPTCWLfd9SFBYwfU1B3GD+voWWvGPHUBL9EeiaKE5BYTl/iBA==
X-Gm-Gg: ASbGncsvB02DScGnuuPIoa0cXNp5iStjWZhkfW4Z0YTGUeFfjMRYLP95l4j/yfWpVju
	c73E7ZeDi7LjOcxKif5Ee+Lk6nZgefmcmXgECD6aH2FsLJyweMT7hLI3+Y0sRneidjuanVWfp73
	YoWbOfhFojNwgyJ3ZlJghRdxPH+hdft2Ayf6oNSLLDgVk4fCthG++KaPWFrR+InZYBoyA5my9dF
	qXooxu4r6PAecDPcedGBQxCYkYCVg4EDBTq02uGeDIsIF6kHA9DVWaOqO/AQkosAYdSA0NAThqy
	gETtnk6YnKK6ew2b8+BBwGMu/gWxg5m6rd9g1mx3jgOfqbtVh2eiEi5mc+FZI91vrK5c63bsTOw
	HwBg6u5etdIjc/TFb2TtW/0QyZibqkyW2FxLkHv7FuWPhuY80PUBD6CrSGVM8n7fUD7KKUz7FyA
	bpJAwWfBg=
X-Google-Smtp-Source: AGHT+IHzCqH7syP0yjcA/1eTZr6nWxwY3mHcMBHf/3VZjB13+yM95J5qCExYz80XxlqdvNfcFfZYgw==
X-Received: by 2002:a05:6000:430b:b0:3a6:ec1b:5742 with SMTP id ffacd0b85a97d-3b768ea0ac9mr1169020f8f.22.1753254300678;
        Wed, 23 Jul 2025 00:05:00 -0700 (PDT)
Message-ID: <d0081137-7eef-4866-8261-1148cf53db99@suse.com>
Date: Wed, 23 Jul 2025 09:04:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] xen: Add capabilities to get_domain_state
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Jason Andryuk <jason.andryuk@amd.com>
References: <20250722001958.174294-1-jason.andryuk@amd.com>
 <20250722001958.174294-2-jason.andryuk@amd.com>
 <481a415a-7992-42bf-a890-a7b40b4aac84@suse.com>
 <b7cf7835-c3e3-468d-8625-5cc147861737@suse.com>
 <fb860d51-56ee-455a-bbaa-81ee0e94b0d1@suse.com>
 <b33a1b88-dca1-42f1-874a-5681eea53336@suse.com>
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
In-Reply-To: <b33a1b88-dca1-42f1-874a-5681eea53336@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.07.2025 08:55, Jürgen Groß wrote:
> On 23.07.25 08:43, Jan Beulich wrote:
>> On 23.07.2025 08:34, Jürgen Groß wrote:
>>> On 23.07.25 08:28, Jan Beulich wrote:
>>>> On 22.07.2025 02:19, Jason Andryuk wrote:
>>>>> --- a/xen/common/domain.c
>>>>> +++ b/xen/common/domain.c
>>>>> @@ -195,6 +195,14 @@ static void set_domain_state_info(struct xen_domctl_get_domain_state *info,
>>>>>            info->state |= XEN_DOMCTL_GETDOMSTATE_STATE_DYING;
>>>>>        if ( d->is_dying == DOMDYING_dead )
>>>>>            info->state |= XEN_DOMCTL_GETDOMSTATE_STATE_DEAD;
>>>>> +
>>>>> +    info->caps = 0;
>>>>> +    if ( is_control_domain(d) )
>>>>> +        info->caps |= XEN_DOMCTL_GETDOMSTATE_CAP_CONTROL;
>>>>> +    if ( is_hardware_domain(d) )
>>>>> +        info->caps |= XEN_DOMCTL_GETDOMSTATE_CAP_HARDWARE;
>>>>> +    if ( is_xenstore_domain(d) )
>>>>> +        info->caps |= XEN_DOMCTL_GETDOMSTATE_CAP_XENSTORE;
>>>>>        info->unique_id = d->unique_id;
>>>>>    }
>>>>
>>>> This being a stable sub-op, don't we need a way to indicate to the caller
>>>> _that_ this field has valid data now? When non-zero it's easy to tell, but
>>>> getting back zero is ambiguous.
>>>
>>> The hypercall sub-op was introduced in this development cycle only, so
>>> there is no released Xen hypervisor without the capability setting.
>>>
>>> In case this patch doesn't make it into 4.21, the case you are mentioning
>>> must be handled, of course.
>>
>> Hmm, yes, this way it's on the edge. As a stable sub-op, someone could have
>> backported the change, though. IOW (and in general) I wonder whether for
>> stable sub-ops we shouldn't be pretty strict about functional extensions,
>> not tying their addition to releases at all.
> 
> Should we really care about downstreams backporting not yet released
> functionality?
> 
> Using your reasoning this would mean we'd need to issue XSAs for not yet
> released hypervisor issues of stable interfaces, too. I don't think we
> want to do that.

To me, the latter doesn't necessarily follow from the former. But anyway, I'm
not going to insist, but I wanted the situation to at least be considered. In
particular also forward-looking, when we may gain more stable sub-ops. At some
point it may turn out necessary to backport such even into upstream branches.

Jan

