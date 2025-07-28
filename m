Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C54EEB13DFE
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 17:15:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061679.1427263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugPZI-0002KB-W1; Mon, 28 Jul 2025 15:15:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061679.1427263; Mon, 28 Jul 2025 15:15:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugPZI-0002Ik-TH; Mon, 28 Jul 2025 15:15:12 +0000
Received: by outflank-mailman (input) for mailman id 1061679;
 Mon, 28 Jul 2025 15:15:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ScRH=2J=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ugPZH-0002Ie-EL
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 15:15:11 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6feec2f-6bc5-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 17:15:10 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-607ec30df2bso8677363a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 08:15:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2403f48f854sm14821355ad.99.2025.07.28.08.07.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 08:07:26 -0700 (PDT)
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
X-Inumbo-ID: a6feec2f-6bc5-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753715710; x=1754320510; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UtlT7brhm7JA21qv547BphxRF9JMypggqimgSqGBGHQ=;
        b=V944Wct5yu8RbeCdvZCeEu4zc7fEfpbBmyhRxd0TBF0arBw/tZ5rjQ+YSo6Syottt1
         9eZnCsRcTfADUtbSqlazFUaNHFOVSfKGsdLwSqT4SG+h6BAI1Vkaa8G4pf3AnvRK0qs5
         coNoByYEO3IwcLASokZoLkP7yj2GEvIw2JuuFKdbL6tME3hwG8G6Cn/HhUOv83Z6bSOZ
         1Pzznxqlp/tgSv2v+DH2mcv3asq9KdJn1EFIAP6DMTAqWY0tkktziO1gtT5WCctuw9d0
         bETvVxpuaMvO/fH9YmWC+aQWVHvwYFqmfDcHWsg7Flbc/Q4JFnSM8RsnXJawc77RNyTt
         j15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753715710; x=1754320510;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UtlT7brhm7JA21qv547BphxRF9JMypggqimgSqGBGHQ=;
        b=w2RsHXUiEeyxvs4eJKUhB/pn9cryoff2jnFFZ2gHZ2Z2DQnVAZaNJ6gcx5Poy1E0kz
         rUffeGBUgiqXKq+zuAX7oip3A30WUiIEU6rt6Uttlx/Z5xBjt16VGI3tVAw/GbxCBO1s
         zcyimlgeViPKO/FjxZ5SRNK4A4PwkLZXqGXRQvDZ8tqrzlzzQ+RHCqUw6QsZentd3HUc
         6+PEzLjTr7xIKWQCP/uoFxNkpK4L9MBA6LYsC9XLc+MkCXkbPOILvbAUtTGMHd8AGp/C
         PiAnNx55fbee/WVdoGQ7VXs7TtD1cqv9DP5O+b4Eg3MQGIQg6GU7rSJ53Pe8wxPH2N3P
         4Muw==
X-Forwarded-Encrypted: i=1; AJvYcCXUTD584AvbFRmO2Gq6jNDdWnXy6zxARaXSmBP2G1csDO6/yWpSCqrUC2pHqD+qSQq+nQn1OZNYFFk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzzyfT7dQ18Q4J+gSQV5SGeOXYKjsAM+VmfmgdDATQuX0n3xGKc
	baoUxJdKFwNV7W9uGZSNHlVMkNMTBkDt8ldQGdL8Ht+osITIrTD3IipvI4KPpazcDgIXxp0Nvmz
	riig=
X-Gm-Gg: ASbGncuWx4QtkoW87ZjZxO5JqG0EIdp0raEL7qTMXDpUaKN4Yp5LIi0eXtYrhg5xMuq
	yr/UWNoj4G1QcjtKI9t+i1g6lF95INkHZIY4aQmvtPEnHiU4kj3jo002LEO8pV6oSdWHfm19L6p
	F5a9dVWajvX1aljdsITthuTvJpWCYNRpHjuWnkuoxeyGpsB66KRiQUxgtffvHENw1INXn5d/nbq
	RQ6/mPADrlGUNVTV/nrr0dmimpehK4Loz5zXdY6Ew5K6LqTOI0xvTj7D8zZxaBvV0hEPbmBQ/uq
	ZhR8skFs9q7jfnIIEd+pBO8xtJAin71+nAXAl2FXTTcXMjBrMtn4fQka44lUm5VrWwJTwJO0DI6
	RKoJLo9sZyGWopoLEphLiKNS+nA4raGpcnZj3icYIo4oE9L4iYQET923WLX9l6Wh36Wir52UUBA
	22T7VBU3U=
X-Google-Smtp-Source: AGHT+IFgYT1IcZ82RM+7rVOm0JWvQjA2jsjeQ7lTw5Kq691VJLosPuoZF2tsR0taqOV9He59AiWiZw==
X-Received: by 2002:a05:6000:40de:b0:3a5:2653:7308 with SMTP id ffacd0b85a97d-3b7767900a7mr9669932f8f.57.1753715247283;
        Mon, 28 Jul 2025 08:07:27 -0700 (PDT)
Message-ID: <a3b3fb2f-5d7f-4354-adcc-39600e43de62@suse.com>
Date: Mon, 28 Jul 2025 17:07:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 1/2] mm: provide a way to do very early page table
 allocations
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: samuel.thibault@ens-lyon.org, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
References: <20250708063738.18994-1-jgross@suse.com>
 <20250708063738.18994-2-jgross@suse.com>
 <7705ed0a-7fbe-4e0e-8752-2acd0a76583e@suse.com>
 <4bd0eb52-c00d-494a-854e-579401c183a6@suse.com>
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
In-Reply-To: <4bd0eb52-c00d-494a-854e-579401c183a6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.07.2025 17:01, Jürgen Groß wrote:
> On 28.07.25 16:09, Jan Beulich wrote:
>> On 08.07.2025 08:37, Juergen Gross wrote:
>>> @@ -664,7 +669,16 @@ static int need_pgt_func(unsigned long va, unsigned int lvl, bool is_leaf,
>>>       }
>>>   
>>>       pt_mfn = virt_to_mfn(pte);
>>> -    pt_pfn = virt_to_pfn(alloc_page());
>>> +    if ( n_early_pt )
>>> +    {
>>> +        n_early_pt--;
>>> +        pt_addr = (unsigned long)&early_pt[n_early_pt * PAGE_SIZE];
>>> +    }
>>> +    else
>>> +    {
>>> +        pt_addr = alloc_page();
>>> +    }
>>
>> The failure pattern when one fails to increase early_pt[] is likely going
>> to be problematic. Wouldn't it be better to check for failure here?
> 
> Hmm, not sure this is true. I tried the shared info mapping without adding
> the special early alloc code first and finding the bug was quite easy.

Feel free to ignore my comment then.

Jan

