Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E945D82B217
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 16:50:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666406.1037016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNxJO-0005xe-5o; Thu, 11 Jan 2024 15:49:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666406.1037016; Thu, 11 Jan 2024 15:49:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNxJO-0005vz-1e; Thu, 11 Jan 2024 15:49:42 +0000
Received: by outflank-mailman (input) for mailman id 666406;
 Thu, 11 Jan 2024 15:49:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNxJM-0005vs-7i
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 15:49:40 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06056f35-b099-11ee-9b0f-b553b5be7939;
 Thu, 11 Jan 2024 16:49:37 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40e490c2115so26103655e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 07:49:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 t21-20020a05600c451500b0040e3ac9f4c8sm6194138wmo.28.2024.01.11.07.49.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 07:49:36 -0800 (PST)
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
X-Inumbo-ID: 06056f35-b099-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704988177; x=1705592977; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hjIw4X4riypAACb7Q/8zpAgWS9w3hXKdbzP2KL8WR+c=;
        b=MzyfHa/MiYnkxbgPidrJj++6ADOpmeIoG7MqCUvM9ouBVVsjKrf9gef90RSCYifw6i
         Hr8+mZRDgZY/fd/fSLxtIAKrcdXQnPLtJl13pnFU6+/xtqSJEL+3MPmsMztdJ+T0hN3t
         G05qOYci6V0T9n/3lMQWm/We+h25m5L727DVUyCZj0jR1iPdeHBxTMbilBpmHeviUZHe
         hW10mUhpnVQAuYuOwBtoGiW8/7WcIKk03t1SaTe7ZkOvmmz5SHCe+L5jQQug4+HvkDvQ
         xWlITe6CCKE6ClYn19J6eU9Qyf/IBBBsNJAeoWW/n0Ameih/J0Uvgzf8vD+KhwkxoXNu
         MBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704988177; x=1705592977;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hjIw4X4riypAACb7Q/8zpAgWS9w3hXKdbzP2KL8WR+c=;
        b=VdPQU8DT3z0jHY2c+nHQB2KDGeR6E3XN8OcU1mC8dx/6uhXWTEHOUGQTvGNvaaHq+J
         OjTsciS+IbePXdpwSm+cVx+p06ESsT+x1obImGt7tAeD7EU2AE+GrTZgwQT/SzeHHixf
         7WQv8veC68xSPwwYxjiZqVjWvyBJd+00M5Ea0ZmKp+vQ2XzdfPr4iD5kZ5sZNOr0CVDY
         D39M8HGUg0WY9Yd8n4N3kTaMnt2af4W4RpRt6C2Ot4dDnCGBy1/EcBw6L/1+KcSpqyTf
         aY2H1Uwi2m34yZ4vMmq4qT4EOtCXrTdRuwk7Miu08lnNVHbHX9eoqJuO8ItUlBffY9F7
         OTnA==
X-Gm-Message-State: AOJu0Yw6LLaJ5Igf1kv0idqGdApYKcB3h5EFSeAugyn/UZoetdvGkQ6l
	YlcaNAHLZ5zGpx2zeEHWFhxKBzyFl18r
X-Google-Smtp-Source: AGHT+IGiluqWVPmSAn0HzTI3ZAdSyREpE71c7H/s0+MbilEcGqd2k8gSA0pskekowwNMXjjM+aJuLw==
X-Received: by 2002:a7b:c40e:0:b0:40e:60d3:8e99 with SMTP id k14-20020a7bc40e000000b0040e60d38e99mr14472wmi.50.1704988176844;
        Thu, 11 Jan 2024 07:49:36 -0800 (PST)
Message-ID: <5fb290bc-ded2-4883-a726-caeed98e9445@suse.com>
Date: Thu, 11 Jan 2024 16:49:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] keyhandler: don't pass cpu_user_regs around
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1ab231ec-5e3c-4662-8530-2213bc52bb7c@suse.com>
 <dd1c24ec-4054-43e1-b0c9-6c2044b84046@suse.com>
 <7d21e38d-d1f8-46df-89ef-809dd9c5a38b@citrix.com>
 <aa0a0b1c-ffe0-456f-933f-2e62c9a47f82@suse.com>
 <ea5c4f94-e4eb-471e-aa45-cf4b8a3a3763@citrix.com>
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
In-Reply-To: <ea5c4f94-e4eb-471e-aa45-cf4b8a3a3763@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.01.2024 16:24, Andrew Cooper wrote:
> On 11/01/2024 12:11 pm, Jan Beulich wrote:
>>>> Have
>>>> handle_keypress() make the pointer available via a per-CPU variable,
>>>> thus eliminating the need to pass it to all IRQ key handlers, making
>>>> sure that a console-invoked key's handling can still nest inside a
>>>> sysctl-invoked one's.
>>> I know this is the current behaviour, and I'm not suggesting altering it
>>> in this patch, but the sysctl was added so you had a way of using debug
>>> keys without necessarily having a working serial connection.
>>>
>>> It was never expected or intended for both mechanisms to work
>>> concurrently, and I don't think we need to take any care to make/keep it
>>> working.
>> Well, all it takes is the saving and restoring of keypress_regs in
>> handle_keypress(). You you really think it would be better to risk
>> a cash, but not doing that tiny bit of extra work?
> 
> I presume you mean crash?

Oops, yes, I do.

> I'm not advocating for leaving something explicitly unsafe, but I'm also
> looking to see if we can avoid having keypress_regs to begin with.  i.e.
> I think we've already got unnecessary complexity, and it would be good
> to reduce it.
>[...]
>>> This just leaves dump regs, which I think can safely use get_irq_regs()
>>> || guest_cpu_user_regs().  All it wants is something to dump_execstate()
>>> to, which just wants to be the start of the path which led here.
>> I don't think so - consider the case of 'd' hitting while handling an
>> interrupt (and, say, stuck there in an infinite loop with IRQs enabled).
>> We'd then wrongly dump the context of what the earlier IRQ interrupted.
> 
> The serial IRQ producing the 'd' keypress will push a irq frame, which
> is what will be returned by get_irq_regs().

Hmm, yes. I wonder what I was thinking ...

> It does occur to me that we're trying to accommodate for two behaviours
> here.
> 
> For a real keypress, we want to dump from the the point the interrupt
> hit because that's the interesting bit of stack to see.  For a SYSCTL,
> there's nothing, and we're using BUGFRAME_run_fn to generate one.

There's three forms of handle_keypress() invocations really, and hence
why (after having dropped the regs parameter already) I re-instated it.

As an aside - no, sysctl handling does not generate an exception frame.
Is uses guest_cpu_user_regs() (and imo validly so).

> So actually we just simply want "regs = get_irq_regs();" here and retain
> prior NULL check, don't we?

As per above, after I had it that way first, I backed off to accommodate
all present use forms of handle_keypress(). But dealing with that (in
whichever way we may end up deeming workable) can be separate anyway,
afaict.

Jan

