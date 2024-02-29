Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8160586D021
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 18:07:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687368.1070751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfjsT-0004BD-5K; Thu, 29 Feb 2024 17:07:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687368.1070751; Thu, 29 Feb 2024 17:07:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfjsT-00049H-1v; Thu, 29 Feb 2024 17:07:25 +0000
Received: by outflank-mailman (input) for mailman id 687368;
 Thu, 29 Feb 2024 17:07:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8AV=KG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfjsQ-00049B-QC
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 17:07:22 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 009bec0b-d725-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 18:07:22 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-563b7b3e3ecso1950862a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 09:07:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g26-20020a056402321a00b0055fba4996d9sm779204eda.71.2024.02.29.09.07.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 09:07:21 -0800 (PST)
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
X-Inumbo-ID: 009bec0b-d725-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709226441; x=1709831241; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kLh97JT7fMjf3Avpvtfftiu9BtIYDYw0gwqX9vMvwxE=;
        b=T7Zc4cvKGBdd/dEvJhrnAXHQ9OKJWChQ/um/1X8hg59j63MtVGyxW2qHR+Jz9Sk8qC
         30V9DaGWPObW8bcu50bW6uEKCSFwBX/Xhbf+KBJpfh5nC5W5u4QwfxYylfO8HWmbgF+2
         mHzHA57TQfJVjYWRxUSoKaWvLO57JUjrdw7xDhRkp0thwO4Ad+eYBbQxUF1U/u9HDz3X
         YphcP9u3H5y+dCzAvw2bANI+eCaqOYrXqOs03/CXWcJjGq+Q8QVhciliY1fbNHSYKbec
         8pY1Dc/ycdEcBTJrbn713f38uENmhr/Wh4je7QUYj5jc3eVN9Bw1QoiRtk0X6uFb3YBv
         UZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709226441; x=1709831241;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kLh97JT7fMjf3Avpvtfftiu9BtIYDYw0gwqX9vMvwxE=;
        b=rffc3Ot30fd/7JGvPo/odnZpApy4i7bGIfS992kqS9gKlFQiDEwzf8g98KtkP+U33c
         80e0Zq1ZRAzR3GMx6YF5ujjCh9ziSoXsxUlofgQrF/cuDnOytcw9LOH2u9I3cUdETWFS
         XpfewHVTCuOtwrBnE4my9d2sU2vT9ZIdy3aZZfUTCZENruu86yOEXU6rMa+EpQNjyOBY
         Ypn/GsAe0fAvhO/psliTQnX/OGZhfCCPsOe159we8E+7fgzV6fY1m+tpUsKh61M+Kx6v
         l6smNcoCdw0UBrr811km3krit7Aj07DTlycZd7JEPy92NaIxKVL0Cq8TVAW84UqAVCHu
         EMMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUcjievGPZuER/xibrsxfeT3IKT2rpX8W4nwNE8qQUp6ecgsQIHwqrgIzt5acV2up6LB64xJgU5RrX9rqeR9QiSW/YFB/nddNbqwbMlHU=
X-Gm-Message-State: AOJu0Ywg15IeL/PtzDZ/uvTtaX3ELcrLPBnkbV8RqHIrDduEPDywK0qr
	R6GX96tpxzHqubtSw2P/V/oFa5Tx7N1AnotPAb2KeFsxOtk665S67H6aoYn1Ow==
X-Google-Smtp-Source: AGHT+IHNc/8P03vKpmXdXHcI+Amqx0oXOh1Ibf8PHri3kqk6zBZ4WtxhxkoaGDNcyHbCBihoBE+oaw==
X-Received: by 2002:a05:6402:b62:b0:566:131a:26ee with SMTP id cb2-20020a0564020b6200b00566131a26eemr1996403edb.35.1709226441461;
        Thu, 29 Feb 2024 09:07:21 -0800 (PST)
Message-ID: <fc2dea79-c1de-44c4-97e2-f41610759ccc@suse.com>
Date: Thu, 29 Feb 2024 18:07:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/12] xen/spinlock: support higher number of cpus
Content-Language: en-US
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-13-jgross@suse.com>
 <c96542eb-daf4-4ce2-915e-86ca8e1848b5@suse.com>
 <f6658df0-13f2-4129-afcd-0f122c87132b@suse.com>
 <f2d107a1-0bcf-4d71-89e8-819ee38e0651@suse.com>
 <58241a32-6671-41e5-8403-5d1b1c4236d2@suse.com>
 <305dcff3-b37b-4f19-bd79-6e8c71c6d850@suse.com>
 <84f700a6-1a98-41a9-bb29-4da2c2f802b0@suse.com>
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
In-Reply-To: <84f700a6-1a98-41a9-bb29-4da2c2f802b0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.02.2024 18:04, Jürgen Groß wrote:
> On 29.02.24 17:54, Jan Beulich wrote:
>> On 29.02.2024 17:45, Juergen Gross wrote:
>>> On 29.02.24 17:31, Jan Beulich wrote:
>>>> On 29.02.2024 17:29, Jürgen Groß wrote:
>>>>> On 29.02.24 16:46, Jan Beulich wrote:
>>>>>> On 12.12.2023 10:47, Juergen Gross wrote:
>>>>>>> Allow 16 bits per cpu number, which is the limit imposed by
>>>>>>> spinlock_tickets_t.
>>>>>>>
>>>>>>> This will allow up to 65535 cpus, while increasing only the size of
>>>>>>> recursive spinlocks in debug builds from 8 to 12 bytes.
>>>>>>
>>>>>> I think we want to be more conservative here, for the case of there
>>>>>> being bugs: The CPU holding a lock may wrongly try to acquire it a
>>>>>> 2nd time. That's the 65536th ticket then, wrapping the value.
>>>>>
>>>>> Is this really a problem? There will be no other cpu left seeing the lock
>>>>> as "free" in this case, as all others will be waiting for the head to reach
>>>>> their private tail value.
>>>>
>>>> But isn't said CPU then going to make progress, rather than indefinitely
>>>> spinning on the lock?
>>>
>>> No, I don't think so.
>>
>> Hmm. If CPU0 takes a pristine lock, it'll get ticket 0x0000. All other
>> CPUs will get tickets 0x0001 ... 0xffff. Then CPU0 trying to take the lock
> 
> No, they'll get 0x0001 ... 0xfffe (only 65535 cpus are supported).
> 
>> again will get ticket 0x0000 again, which equals what .head still has (no
> 
> And the first cpu will get 0xffff when trying to get the lock again.

Oh, right. Still a little too close to the boundary for my taste ...

Jan

