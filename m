Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAA185D118
	for <lists+xen-devel@lfdr.de>; Wed, 21 Feb 2024 08:17:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683832.1063464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcgrB-0003T1-L0; Wed, 21 Feb 2024 07:17:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683832.1063464; Wed, 21 Feb 2024 07:17:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcgrB-0003Qb-GU; Wed, 21 Feb 2024 07:17:29 +0000
Received: by outflank-mailman (input) for mailman id 683832;
 Wed, 21 Feb 2024 07:17:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TA2L=J6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rcgr9-0003QV-Cq
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2024 07:17:27 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 431fc0da-d089-11ee-98f5-efadbce2ee36;
 Wed, 21 Feb 2024 08:17:25 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-563c2b2bddbso8966545a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 23:17:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 vx10-20020a170907a78a00b00a3ee2530a11sm1668395ejc.194.2024.02.20.23.17.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 23:17:24 -0800 (PST)
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
X-Inumbo-ID: 431fc0da-d089-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708499844; x=1709104644; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VXykqclW9twT/8BX1EFASN1yE6LphN1JKGbGziHqQUM=;
        b=Pw2tPulGzRRzjgq7aZGYNMLNOQ04bGc1BiZaY6DnOMbo43JokYL/IpVvlYic4OEVhm
         eEaoZvEMYF9u++Bjt7eiN9kJ/9jBYjuqpOglgGe9DzIzoV5otNVpNCxxv3JSg8zC3rse
         Eaat8gqPqyVGaB3Z6b94sA9oCu0fwfs1qYT1Y1XD7e2CqrDr6yeOHiakbGUtPPnFRonw
         alOzAtYeE+D5kgMwWtsebXNodFjDAxOKRU4ifZ1V10dFj6OToP8ZmWmfyY9rFJqJrP9M
         FNOT1rGLixxs6ZqvUcWAHlrXBGbwHtlgIRwKYrveAObCvkv6wydIMraY3j5pDYSyxsGR
         //7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708499844; x=1709104644;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VXykqclW9twT/8BX1EFASN1yE6LphN1JKGbGziHqQUM=;
        b=XmlsEf+fq0Bh/nnkpsCvY4OFDjGcPdgYNcvAAkGW+g5wjOmc9kCC/rzRHxmrbeoNDW
         G5aEWEv2QrnITYXfX6QnTAW/Rrw5MOuPz/P55iYu8Mk2GbXA946WGbOytBqLwmBM/MQh
         2wgvsGAVRwZ6xfHLEPYUZaokqI4jvfDd1kuucAAZG7/NnFGYhFmS9KeRVmwEt3waAgW9
         5QEm2Nv6wkCz0uxEBJXR57Uf7a95X5LIlyW4Fl/+FnHqE1d/pp9KP+Zs4MFj9nnl7+ty
         IdRgMpKUb+sZ9lMz2PV7VTmJwc37NLA5Smbg9vkJwTKdwJeRSDnC7+oFvA7xLjyxFQdH
         q9SQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS5aMPFtZvKQ51N+QB5OJn2CxlkUF2V0IHmcGKn6pcJuARvidUrkviVCbmNkC2Ozu8vDwyWYKJq91vpOjhShR5P5ZzN6DwrRZkjPMVgbU=
X-Gm-Message-State: AOJu0Yyu0WrqASfTdqzEWRFq4N6rBUAIg44qiwJRxlvRselsKWqRpDJR
	pV86cdV2IAKtPyPMBdWywnRFcyMjkdHsPOUGkMg2MO4mPt9U9VQTuaDLD6Hhow==
X-Google-Smtp-Source: AGHT+IHwtgUzYUW93f0pcwXvZEdUJBAeYMjxu07b6Q62pr+l7b+bajVUxkmnpeDRswWy7om/r/ECqQ==
X-Received: by 2002:a17:906:7d46:b0:a3e:4553:ba31 with SMTP id l6-20020a1709067d4600b00a3e4553ba31mr6374470ejp.28.1708499844685;
        Tue, 20 Feb 2024 23:17:24 -0800 (PST)
Message-ID: <5a28331f-663f-421f-9845-45ff5eb1810c@suse.com>
Date: Wed, 21 Feb 2024 08:17:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] almost fully ignore zero-size flush requests
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a0a7fa35-4615-4a9b-9887-569353f05e33@suse.com>
 <26ff8f42-2a76-4f8d-9af6-5830b0aae739@suse.com>
 <7dd78c97-b82f-4ae1-a257-98f612c6bad2@xen.org>
 <6466155e-9883-4743-a897-ef565f14fdf0@suse.com>
 <CA+zSX=aJ2mVbGzFj74+DEGZvw=XWTZKAeWfrwMNHaYhsdaytHA@mail.gmail.com>
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
In-Reply-To: <CA+zSX=aJ2mVbGzFj74+DEGZvw=XWTZKAeWfrwMNHaYhsdaytHA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.02.2024 03:32, George Dunlap wrote:
> On Tue, Feb 20, 2024 at 4:26 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>> +    if ( (cflush->offset | cflush->length) > PAGE_SIZE ||
>>>
>>> This is confusing. I understand you are trying to force the compiler to
>>> optimize. But is it really worth it? After all, the rest of operation
>>> will outweight this check (cache flush are quite expensive).
>>
>> From purely a performance point of view it may not be worth it. From
>> code size angle (taken globally) I already view this differently.
>> Plus I think that we ought to aim at avoiding undesirable patterns,
>> just because people tend to clone existing code when they can. Thing
>> is that (as per below) the two of us apparently disagree on what
>> "undesirable" is in cases like this one.
>>
>>> We probably should take a more generic decision (and encode in our
>>> policy) because you seem to like this pattern and I dislike it :). Not
>>> sure what the others think.
> 
> This is similar to the policy question I raised among the x86
> committers a few weeks ago: You're manually specifying a more specific
> behavior than is required, rather than specifying what you want and
> then letting the compiler optimize things.  The problem with this is
> twofold:
> 
> 1. It's harder for humans to read and understand the intent

Depends.

> 2. It ties the compiler's hands.  If you write your intent, then the
> compiler is free to apply the optimization or not, or apply a
> different optimization.  If you specify this optimization, then the
> compiler has fewer ways that it's allowed to compile the code.

I'm inclined to believe that no compiler will do this kind of
optimization, unless a specific request was raised against it. The
pattern may not seem overly complex, but to recognize it would
require effort that on the whole may simply not be justified by
the gains (from the compiler's perspective).

> #1 by itself is probably enough to counterindicate this kind of
> behavior.  Add them together, and I'm inclined to say that we should
> write a policy against such optimizations, without specific
> justifications.

It's not like I didn't give any justification. So I guess you mean
without better (whatever that means) justification.

But yes, I'll undo that part of the change then and submit a v2,
albeit with not overly much hope for it to then be accepted.

Jan

