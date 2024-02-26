Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2027866F09
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 10:45:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685400.1066035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reXY1-0003G3-5E; Mon, 26 Feb 2024 09:45:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685400.1066035; Mon, 26 Feb 2024 09:45:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reXY1-0003EW-2H; Mon, 26 Feb 2024 09:45:21 +0000
Received: by outflank-mailman (input) for mailman id 685400;
 Mon, 26 Feb 2024 09:45:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1reXXz-0003EQ-Oh
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 09:45:19 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf9b72d8-d48b-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 10:45:17 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a3ed9cae56fso445226866b.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 01:45:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bi7-20020a170907368700b00a3e9c4fa24esm2247064ejc.96.2024.02.26.01.45.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 01:45:16 -0800 (PST)
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
X-Inumbo-ID: bf9b72d8-d48b-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708940717; x=1709545517; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WNtFkL+i/w+HtYgKZwh/iS0rpNu4sVr5A4aQuXUc1Ok=;
        b=QPH+Sq0AdEd7yUr4sLEFdQCz8jLlvvSRyTQR01ASR6lpVoX9M5jGjkLYuFlIp7Qaxv
         1tORZqB98qgpIYV49wWF8VHrbwOhrHApc+d/4qTz5wXPHM4KYqHrzEpzcwIFHkBCzZEn
         BT/ds9ISGTQVbeLnRZnGjixVf3W0nwmm7eSkRnRgxf3kXy1xouEnSwOqkBfY99C5LY1/
         gzP+tVF5HUbmV9DJ+f1HVIkmH+00M0/UP8idH8itbBRfezkFJYHkKraIQ9SdVMY7hkkh
         oyinlhbrml73kMHBwTfhhFVDO+TvEnpRELGzTYaXWV6iXmJDvXVx1VOCBU+RJLB8gDHP
         WqtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708940717; x=1709545517;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WNtFkL+i/w+HtYgKZwh/iS0rpNu4sVr5A4aQuXUc1Ok=;
        b=dQk7dm0x9o6C2IMo78DHrRDbzW3qvLzjLYXWQTtnOCy/fyrpIrTaTgP7hUVjoIVjx4
         cWPbl5nDAbZvgqbY1eIue50wWKP5re51xf6Y5jZD33bS1EV67cF1/uB5UGTEk8OUMpXx
         f8/WofcH3OVRn4AVwBpiZ9qBxwk2J3R0sjygVt+mKBgKRgF4uX4hROaGd2GvRzrq3Co6
         RIRxJz8emfCkABCHv+kqS1//10h7pM9VZvDBGAvmXI8nf3DMGTXJ/6NFGfP+Kqe+ETzA
         Snx3Dwu28ziS+pERf5mvCR44CjgxdYtnOdcTIqOXPdLkpBvXHYo0oxHC+AC1Coi6qKWS
         sYNA==
X-Forwarded-Encrypted: i=1; AJvYcCWmXhMa1fHERhH2VBt4oXvqefNZMaE9KWu4G6vJ0oOqPE9cXVYB7rqZoFgQKh5IivqfX/7WvAh53U0sGA5hP/nh/4pfVxZxgaEiqHABu3I=
X-Gm-Message-State: AOJu0YxzRoZydSib+74KuFTk6Z9OR9pSFOVzlluhw8PYMrSdh/dq5MO8
	t/9D8xbZyqtoWXfjUDGR8Khux4UD5+Xb8+mUFF2g+AwTybTGJoMXUvZnf34WlA==
X-Google-Smtp-Source: AGHT+IEXwvInGz35zW91JP62kDLg8JPNPVqOXQEdoZhafel6KVZMnMFF2gBo1YRFpB3IeiFEAcvhLg==
X-Received: by 2002:a17:906:57cf:b0:a3f:4fd8:53a4 with SMTP id u15-20020a17090657cf00b00a3f4fd853a4mr5351915ejr.9.1708940717081;
        Mon, 26 Feb 2024 01:45:17 -0800 (PST)
Message-ID: <44fd5092-7838-4d28-804b-bbfebfd44886@suse.com>
Date: Mon, 26 Feb 2024 10:45:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/30] xen/riscv: introduce cmpxchg.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
 <25315ca95baffc9b222fb0ae89375a94b01a9b46.1707146506.git.oleksii.kurochko@gmail.com>
 <9e50ef30-8dc6-4380-aa65-724e5a376c10@suse.com>
 <28844fdfcf5eea515497fb7b5fd8ea6fb1c5ebaa.camel@gmail.com>
 <554a43e8-7d8d-45c4-936d-36f02c207531@suse.com>
 <1c53b52ee39161a8f59209d28af69fe997479dbc.camel@gmail.com>
 <3b38fe82-ee0f-4666-93e1-bd78fe69c534@suse.com>
 <5d2d35fe014094c991363e42c3e2ad9ca2af3938.camel@gmail.com>
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
In-Reply-To: <5d2d35fe014094c991363e42c3e2ad9ca2af3938.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.02.2024 13:23, Oleksii wrote:
>>
>>>>> As 1- and 2-byte cases are emulated I decided that is not to
>>>>> provide
>>>>> sfx argument for emulation macros as it will not have to much
>>>>> affect on
>>>>> emulated types and just consume more performance on acquire and
>>>>> release
>>>>> version of sc/ld instructions.
>>>>
>>>> Question is whether the common case (4- and 8-byte accesses)
>>>> shouldn't
>>>> be valued higher, with 1- and 2-byte emulation being there just
>>>> to
>>>> allow things to not break altogether.
>>> If I understand you correctly, it would make sense to add the 'sfx'
>>> argument for the 1/2-byte access case, ensuring that all options
>>> are
>>> available for 1/2-byte access case as well.
>>
>> That's one of the possibilities. As said, I'm not overly worried
>> about
>> the emulated cases. For the initial implementation I'd recommend
>> going
>> with what is easiest there, yielding the best possible result for the
>> 4- and 8-byte cases. If later it turns out repeated acquire/release
>> accesses are a problem in the emulation loop, things can be changed
>> to explicit barriers, without touching the 4- and 8-byte cases.
> I am confused then a little bit if emulated case is not an issue.
> 
> For 4- and 8-byte cases for xchg .aqrl is used, for relaxed and aqcuire
> version of xchg barries are used.
> 
> The similar is done for cmpxchg.
> 
> If something will be needed to change in emulation loop it won't
> require to change 4- and 8-byte cases.

I'm afraid I don't understand your reply.

Jan

