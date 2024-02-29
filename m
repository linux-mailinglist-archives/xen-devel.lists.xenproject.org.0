Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 066B686CFC0
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 17:55:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687346.1070712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfjgN-000818-Af; Thu, 29 Feb 2024 16:54:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687346.1070712; Thu, 29 Feb 2024 16:54:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfjgN-0007xu-7R; Thu, 29 Feb 2024 16:54:55 +0000
Received: by outflank-mailman (input) for mailman id 687346;
 Thu, 29 Feb 2024 16:54:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8AV=KG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfjgL-0007VC-PY
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 16:54:53 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4242dfc1-d723-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 17:54:53 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5656e5754ccso1629296a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 08:54:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fj10-20020a0564022b8a00b00563f8233ba8sm771540edb.7.2024.02.29.08.54.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 08:54:52 -0800 (PST)
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
X-Inumbo-ID: 4242dfc1-d723-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709225692; x=1709830492; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L+CWK2Zjsq0ZCpSJAGUrwHduyq7jVSXLK9awLW+BQvA=;
        b=Zd/0g0qEcMCWqlt9qU6YM/w7MSbRsfB5sAVIO1qYPxKACxjZkLBiZzjUqMNA/0bnhj
         S7Hsw8rG8ufSYdJx4NxYGkaqzJAHLoqu/NFS6skPJx5wXtyQXJ4j25ynuowTDruRLxZb
         JsGDvmuwt8sSSrkVZMaUjAadWKW9mJ+GYy/IYIShHLvylnkt1QqvQrak0VyUSYYGOxkt
         y4K4kmTv/7IgRu/dSgwKOZnUsuYzmEq0AqpH4X51o8UgQ8SLch0rIawAldW2boZALhNY
         jRo84QuoMgrdWVyiQbOR8N7w38CT//SRwEO5+vIuN7TqJCqk77AzwvJpG0lwCtTXpubt
         Ls9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709225692; x=1709830492;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L+CWK2Zjsq0ZCpSJAGUrwHduyq7jVSXLK9awLW+BQvA=;
        b=JUiL6qth3JdywFunFTyVj6alXPJFxmYWRWUBfSWPS2T+oa24eqXnb7zdvbzcYlDAZl
         FNIiQVKhfbDvDGDXIaKzdckYY0PbhOK6A1sO2yFkChgsHFEXuxQZwfsqLMxAGxXn9GV1
         x16hPycCNG4GnNcf/dEYD3+vWG1nCPnuLgUUvsiEC2x9W1g4Es8SFhh9LWhbSXeC8vJR
         qtYAlEFb+1K4+tepQeubDDWVK6FFEedg3EQA0wXpkAotwJgWORPTk6CQLOUWc6/iBfKQ
         H8SNuoBgI8GZZizEVoN0s6AFe4b8txoRYbc35+rSKv4POetgQYWkkYwrC1VKetxGp28Y
         WqIA==
X-Forwarded-Encrypted: i=1; AJvYcCUSvMehxe6yq7+GqOYnZXflMTpV103o0M4RRy44ZzH/zLtw1vEqJbUTQhI+tE1B2v1piMkXY7OWZqhn2y+0cz3rMUHqXkKGgrcuWcOzOFw=
X-Gm-Message-State: AOJu0YydZRl/8UJuVM0RDemu4+NlTxDS7VzWAE6AWjtmIKDBaymX9gJ3
	DJEkS/ccWp2/pAWpgX1rovndZDsrUdpr5owvdowYNO+VGQR/7VvqosD+ehOL6A==
X-Google-Smtp-Source: AGHT+IGeEWmiJepmBQyjXed6QksG/+l/ow1Mmbq9CijcJKzRKlunTZJIm4ddXb6DR1aEk9gkc0X1Zg==
X-Received: by 2002:a05:6402:6cf:b0:566:c167:bf18 with SMTP id n15-20020a05640206cf00b00566c167bf18mr240270edy.35.1709225692573;
        Thu, 29 Feb 2024 08:54:52 -0800 (PST)
Message-ID: <305dcff3-b37b-4f19-bd79-6e8c71c6d850@suse.com>
Date: Thu, 29 Feb 2024 17:54:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/12] xen/spinlock: support higher number of cpus
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
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
In-Reply-To: <58241a32-6671-41e5-8403-5d1b1c4236d2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.02.2024 17:45, Juergen Gross wrote:
> On 29.02.24 17:31, Jan Beulich wrote:
>> On 29.02.2024 17:29, Jürgen Groß wrote:
>>> On 29.02.24 16:46, Jan Beulich wrote:
>>>> On 12.12.2023 10:47, Juergen Gross wrote:
>>>>> Allow 16 bits per cpu number, which is the limit imposed by
>>>>> spinlock_tickets_t.
>>>>>
>>>>> This will allow up to 65535 cpus, while increasing only the size of
>>>>> recursive spinlocks in debug builds from 8 to 12 bytes.
>>>>
>>>> I think we want to be more conservative here, for the case of there
>>>> being bugs: The CPU holding a lock may wrongly try to acquire it a
>>>> 2nd time. That's the 65536th ticket then, wrapping the value.
>>>
>>> Is this really a problem? There will be no other cpu left seeing the lock
>>> as "free" in this case, as all others will be waiting for the head to reach
>>> their private tail value.
>>
>> But isn't said CPU then going to make progress, rather than indefinitely
>> spinning on the lock?
> 
> No, I don't think so.

Hmm. If CPU0 takes a pristine lock, it'll get ticket 0x0000. All other
CPUs will get tickets 0x0001 ... 0xffff. Then CPU0 trying to take the lock
again will get ticket 0x0000 again, which equals what .head still has (no
unlocks so far), thus signalling the lock to be free when it isn't.

> The limit isn't 65535 because of the ticket mechanism, but because of the
> rspin mechanism, where we need a "no cpu is owning the lock" value. Without
> the recursive locks the limit would be 65536 (or 4096 today).

I think this rather belongs ...

>>>> Therefore my suggestion would be to only (mention) go(ing) up to 32k.
>>>>
>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>>> ---
>>>>>    xen/common/spinlock.c      |  1 +
>>>>>    xen/include/xen/spinlock.h | 18 +++++++++---------
>>>>>    2 files changed, 10 insertions(+), 9 deletions(-)
>>>>
>>>> Shouldn't this also bump the upper bound of the NR_CPUS range then
>>>> in xen/arch/Kconfig?
>>>
>>> Fine with me, I can add another patch to the series doing that.
>>
>> Why not do it right here? The upper bound there is like it is only
>> because of the restriction that's lifted here.

... here (for having nothing to do with the supposed lack of hanging
that I'm seeing)?

> I'd prefer splitting the two instances, but if you prefer it to be in a
> single patch, so be it.

I'm not going to insist - if want to do it separately, please do.
Perhaps others would actually prefer it that way ...

Jan

