Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A60D3D13079
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 15:13:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200348.1516290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfIfP-0008Fi-9u; Mon, 12 Jan 2026 14:13:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200348.1516290; Mon, 12 Jan 2026 14:13:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfIfP-0008DU-6W; Mon, 12 Jan 2026 14:13:11 +0000
Received: by outflank-mailman (input) for mailman id 1200348;
 Mon, 12 Jan 2026 14:13:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qluw=7R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfIfN-0008Ct-9W
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 14:13:09 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1716d36-efc0-11f0-b15e-2bf370ae4941;
 Mon, 12 Jan 2026 15:13:07 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-47a95efd2ceso56701935e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jan 2026 06:13:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d8718b995sm128589425e9.14.2026.01.12.06.13.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 06:13:06 -0800 (PST)
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
X-Inumbo-ID: d1716d36-efc0-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768227187; x=1768831987; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Iu2RZxy2eSFAzQuloT198riRuTgrfD4yqhklsvv3Qfk=;
        b=KqJj+Y47Uz7AsxpbJRpeMlPS7695e46iYWkyqBFA6ZGZ3BjH/k+OOjVk2TDwussH4z
         egacukR4iW3fiHV4dMRMCworFW92Kr++vmhb5UtFqwS9mGZTR0lr98QIKTnMLbDxznxQ
         /nuJ5wDW+2w9/dl/9euSuoK6OrnkqBNFPS1CCQr0hL9cHCQGoTdfYL0z2Vu1/Za+VuGO
         5AZbHY7QQfM5e7PP9JcFMfDwY2XTYL5k52+wmgsgLBplJePKzncWKwARqkrWcQ2CZU09
         ReMA4g+JxWYijG5hWVI2YeN8JzBRac9fNinqXttlQvWOowt3ytDxHL8dp7089Zs8nQVV
         5sPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768227187; x=1768831987;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iu2RZxy2eSFAzQuloT198riRuTgrfD4yqhklsvv3Qfk=;
        b=qDzKHX6HyY92shutHOpb7ChB67OOZJIMJdUKNPa9o5TJizCBq9VzCfQDkd9rkBlWwJ
         bF/99kz1ofujG3JjxVH9z/bwxVoDgRx4AX81RGofLrDX0WvS/ImU9xFeMiu/2A5cZhfT
         n6BquxVc1hyMpTeNC3gISP8ko4mjkWcFplXWU9nymi7XeHGOFesjkUXIoiMBELZjOnjl
         ThNnAFGv/JzO2cWSJWxX329OQ2Q1zVCmXH9CArVPHPLNOcAtCtSCDJvnqFhXyROgA7h1
         sGK1n8fPHVn0fxlfUOE1yR421z6i8vjxy+rTnpVzJByZ0XJHO4e2GEkYF2+lIABaX5Pp
         GwDA==
X-Forwarded-Encrypted: i=1; AJvYcCVuHGiMoS8W8KznKSlctsN1mpDcfQL+jKYFj/d9qSsY5KRfoQkqvnFDhb6ya2TjnS1CBRN5qdZqcIQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxH6gAuB6YVuviEQ5vZXfAMLfdPM+8JJMp/TQXy8sUw+LweFhe3
	Hm6YHxc/LmdQqCvpJpnTPz3Ct2JpoihWpHP4sbs0lqku8ALB9ozYHfRh2iHOXuvErQ==
X-Gm-Gg: AY/fxX6ZB2DV2/aYgTHN0GQ9b5n/q8eAszkve95LKU4MiMDXc3iiMXPrwHQ/Nymuvs3
	ir9heLw8nTIhFhkFcAdaVDgmLxtrKHE9L2JM0xfl8RMMwupwFVN+e0+8fKookMq9RWpzv/3PGox
	UFR4zCiSaWUP0fbFRRQtEZ01bX7x2/hDM74tWROgEKXa/51/q15EI8/B1Ql+EmL9TP+pnE5BM1n
	Zr1tBwtU0ZTcbl/HkdJmR6h4RWRi81P5WMTGFnGyAAXqeqXGslSdPgWGrzsDjjxfn6yV3N/a9Zs
	zb2x+NRXUEW4fNzzWIDKM+jwtUc9pgf7Py0QOzFZNNON77vsyEVWirzbApIVBsUrcYVvhb72Vcu
	zd6T1wh9rj2yj5neVTJeGcOvtTksNUsWinvu5aytc+ud7qehZYsMOLEV8GdgPzAB7Jqelh/I1Us
	gkrWqnsQ5CRDHFKGsBuyV8wnXbpw2lpGyKpQBS3lOr7W/HsUhO1BTitoSg/dh616iZ25nfhtiBj
	Ys=
X-Google-Smtp-Source: AGHT+IHoem9EvRRQ2b/F2IzOHi6BRBLBkW71FjhL9CHoip0Y9UwHKv9sNtAOyKyDd3Jl6gjS3JkTjQ==
X-Received: by 2002:a05:600c:c0c7:b0:477:c478:46d7 with SMTP id 5b1f17b1804b1-47d84b33bd7mr183359155e9.22.1768227186956;
        Mon, 12 Jan 2026 06:13:06 -0800 (PST)
Message-ID: <6ea436ce-6ecb-47f8-8d8a-98b0badeb14e@suse.com>
Date: Mon, 12 Jan 2026 15:13:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] x86/time: deal with negative deltas in
 get_s_time_fixed()
To: Anton Markov <akmarkov45@gmail.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <66a53368-9c33-436c-858e-2b2d25ae84b7@suse.com>
 <1f539879-3083-41d5-a2c5-c63c9161f0bf@suse.com>
 <4a6b6307-9014-4c4c-8c23-3673efa2d1b1@gmail.com>
 <794c382b-3b20-4d2a-ab70-b24d7fdf88ae@suse.com>
 <CACQYvN-fiATs2dtdboYxCreF8kF5RsgoH-zgWtQ59iVNOT_wVg@mail.gmail.com>
 <CACQYvN_JbPs9TAs4GYO3myVbehwU9Zz_BhQqj1jVT2Sfg30qUQ@mail.gmail.com>
 <4b03cf36-d2d8-420c-82df-55d6a9ac9d68@suse.com>
 <CACQYvN9cLwXy=rtYgEyTUsqxCYvP0-qFsEW=y8B3Fo9mauNx-g@mail.gmail.com>
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
In-Reply-To: <CACQYvN9cLwXy=rtYgEyTUsqxCYvP0-qFsEW=y8B3Fo9mauNx-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.01.2026 13:49, Anton Markov wrote:
>> Btw, your prior response was too hard to properly read, due to excess blank
>> lines with at the same time squashed leading blanks. Together with your
>> apparent inability to avoid top-posting, I think you really want to adjust
>> your mail program's configuration.
> 
> I suggest we skip the discussion of formatting and the number of spaces in
> messages and instead focus on the topic of the thread. I have a very
> difficult time troubleshooting difficult-to-reproduce bugs, and the fact
> that their descriptions are difficult to read due to the number of spaces
> is probably the least of the difficulties.

Perhaps, yet it still makes dealing with things more difficult.

> That invocation of get_s_time_fixed() reduces to scale_delta() (without
>> further rdtsc_ordered()), as non-zero at_tsc is passed in all cases. IOW
>> it's not quite clear to me what change you are suggesting (that would
>> actually make a functional difference).
> 
> Replacing get_s_time_fixed with scale_delta will remove the calculation
> dependency on the previous local_stime value, which accumulates lag between
> cores. This is because: rdtsc_ordered is not called synchronously on the
> cores, but by the difference offset by the ipi speed. Therefore, we get:
> 
> core0: current_rdtsc;
> core1: current_rdtsc + ipi speed;
> coreN: current_rdtsc + ipi speed * N;

That's if IPIs are sent sequentially. In the most common case, they aren't,
though - we use the all-but-self shorthand.

Actually, even if IPIs are sent sequentially, I can't see where you spot
this effect: Both callers of time_calibration_rendezvous_tail() signal all
secondary CPUs to continue at the same time. Hence they'll all execute
time_calibration_rendezvous_tail() in parallel.

> Since ipi values are sent alternately in a loop to core0,

Are they? I fear I don't know which part of the code you're talking about.

> in the version
> with get_s_time_fixed, we get the following local_stime calculation format.
> 
> coreN: local_stime = local_stime + scale_delta((current_rdtsc + (ipi_speed
> * N)) – local_rdtsc);

One of the reasons we (iirc) don't do that is that since the scaling factor
is also slightly imprecise, we'd prefer to avoid scaling very big values.
IOW by changing as you suggest we'd trade one accumulating error for
another.

Jan

> This means the time on each core will differ by ipi_speed * N. And since
> we're using the values of the previous local_stime, the difference will
> accumulate because the previous local_stime was also offset. In the version
> with scale_delta, we get:
> 
> coreN: local_stime = scale_delta(current_rdtsc + (ipi_speed * N));
> 
> This means there will still be a difference, but it won't accumulate, and
> the offsets will remain within normal limits.
> 
> If it's still unclear: If your local_stime in get_s_time_fixed is offset
> relative to other cores, then the fact that rdtsc_ordered and local_tsc are
> not offset doesn't change anything, since you're using the delta relative
> to local_stime.
> 
> core0_local_stime + (rdtsc_ordered() - local_tsc) != core1_local_stime +
> (rdtsc_ordered() - local_tsc); // Even if rdtsc_ordered() and local_tsc are
> equal across cores.
> 
> On 96-core configurations, up to a millisecond of latency can accumulate in
> local_stime over a week of operation, and this is a significant
> difference. This
> is due to the fact that I use cpufreq=xen:performance max_cstate=1 ,
> meaning that in my configuration, local_stime is never overwritten by
> master_stime.
> 
> Thanks.

