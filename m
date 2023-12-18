Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E16B88171AB
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 15:00:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655989.1023917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFE9z-0006Y9-6r; Mon, 18 Dec 2023 13:59:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655989.1023917; Mon, 18 Dec 2023 13:59:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFE9z-0006UY-3B; Mon, 18 Dec 2023 13:59:55 +0000
Received: by outflank-mailman (input) for mailman id 655989;
 Mon, 18 Dec 2023 13:59:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h3b+=H5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFE9w-0006TG-W0
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 13:59:52 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6b7ccf5-9dad-11ee-98eb-6d05b1d4d9a1;
 Mon, 18 Dec 2023 14:59:51 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3363aa1b7d2so2873729f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 05:59:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p16-20020a5d48d0000000b0033616ea5a0fsm23744085wrs.45.2023.12.18.05.54.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 05:54:13 -0800 (PST)
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
X-Inumbo-ID: b6b7ccf5-9dad-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702907991; x=1703512791; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kSJ+2g/yNCJ4GnMeWu8vmqbqESy46ofPlCqnat6qEq8=;
        b=DV/ZjTJqpCnUV8rJqxXrzuaAOXq4aNVEiuHgfU5YNFAcfiRICOJkgZX2ZaUjdr4UQe
         055Eo5sa/NbBz1I7pR8RkjWgwaIoZv5sYhCZ7mJnSZxEwNHiKX1eunHwcieAYzmtJT/D
         Huz1QhPh70aayYAhl4xYoQ9bZ5Ekm6HUkoRJzImBU65SRfsEUAQqbAbwDVP/2Ilb1NZ3
         LC9+0JfudkmvBw6JgTGj+GMwA1Nc2iOOTcQl7utjmrmXjIcTrZVCxvSTwzWJGxQyCu3+
         oFv+PaqdxCmHHcWeBdoBxbYEJ0fvBpeDfA2Hq8ey4teL3jF4xSUUrXbpnDvuPALNVGdN
         lGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702907991; x=1703512791;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kSJ+2g/yNCJ4GnMeWu8vmqbqESy46ofPlCqnat6qEq8=;
        b=M+akaYOtMFdUDJ83IdnkuYT0aH1lbd4M/qPYc6dEKzZJ4LYQXRmBhdWsCrsI0raoxF
         5BpsNDbigfc3yt/gzUU6ldhrCARpYz6dcCQaH5Wqao/jdr8uxtY8APPEK4SIF6Brnb3w
         ro1XI3+CC6252OTvWiJTRY830/buKk33QTuzfyrX61NT9hsAFSwm2qpRKdjtcJeCwV6a
         jNW6MrspkSc1IzUmEWU3+iQuy0AGpA2qeFjoVHE9jIrJSm3Xhikx/rjKw3HiCPe7tU9v
         nHAM5wpnaGUtRg93fvY4byh5cr0m0Fu3oIPwvd9dNDLHJO9gvtqGmvrgQRJmuE776RVI
         DXNA==
X-Gm-Message-State: AOJu0YwaXqMb9ht0Xqtsn2TyYSTuyp1jcVJWYWcbFjGmb8q5ByCbdqom
	WX31lrybjBkU4bftQV7V3/cYranyiXwF/+JsImS2
X-Google-Smtp-Source: AGHT+IEVvuPrFF6mW+vXa3B+FfNNW12GiFEKN3Id0l0oEpmd5gD+pW3fci0zfDE6aTeccVoZC56N1g==
X-Received: by 2002:adf:f383:0:b0:336:5d19:e73c with SMTP id m3-20020adff383000000b003365d19e73cmr1598390wro.200.1702907653748;
        Mon, 18 Dec 2023 05:54:13 -0800 (PST)
Message-ID: <f7cbd6a1-3367-41a0-b5df-7013dcfffc83@suse.com>
Date: Mon, 18 Dec 2023 14:54:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] x86/spec-ctrl: add logic to issue IBPB on exit to
 guest
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
 <31da79de-bd6b-af95-793a-c16516992bc7@suse.com> <ZYA3Db53Z3fvBlwn@macbook>
 <1c00c3ba-4d10-4cdc-ae2e-ca2fb2157be6@suse.com>
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
In-Reply-To: <1c00c3ba-4d10-4cdc-ae2e-ca2fb2157be6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.12.2023 14:46, Jan Beulich wrote:
> On 18.12.2023 13:11, Roger Pau Monné wrote:
>> On Tue, Feb 14, 2023 at 05:10:42PM +0100, Jan Beulich wrote:
>>> ---
>>> I have to admit that I'm not really certain about the placement of the
>>> IBPB wrt the MSR_SPEC_CTRL writes. For now I've simply used "opposite of
>>> entry".
>>
>> Maybe it would easier to just add the MSR_PRED_CMD PRED_CMD_IBPB write
>> to the vmcs MSR load list?
>>
>> It's a one-time only AFAICT, as you would only want to do this for
>> context-switch AFAICT.
> 
> That would be a back and forth of adding and removing the MSR to/from
> that list then, which I'm not convinced is helpful. With these special
> MSRs I would further be uncertain as to their effect when used via one
> of these lists.

Plus (as only a secondary argument, but still) it would make PV and HVM
mechanisms entirely different.

Jan

