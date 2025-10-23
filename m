Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E91BFF55B
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 08:24:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148704.1480588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBokI-0004pL-Rw; Thu, 23 Oct 2025 06:24:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148704.1480588; Thu, 23 Oct 2025 06:24:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBokI-0004me-Oy; Thu, 23 Oct 2025 06:24:22 +0000
Received: by outflank-mailman (input) for mailman id 1148704;
 Thu, 23 Oct 2025 06:24:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U0PU=5A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vBokH-0004mY-NO
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 06:24:21 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e83c4e4c-afd8-11f0-980a-7dc792cee155;
 Thu, 23 Oct 2025 08:24:19 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-47495477241so2663395e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Oct 2025 23:24:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-474949dd479sm56468035e9.0.2025.10.22.23.24.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 23:24:18 -0700 (PDT)
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
X-Inumbo-ID: e83c4e4c-afd8-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761200659; x=1761805459; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PhfqsrPZ622z/oB3nsmbRSlTKoV/AGG9b+zQEYUr06M=;
        b=Wcp75dyOsYyV4wOyNUR2Z4p0h8uBPGa/c3n2f9R8Qcl4gbhCjWLPtTlMbnDP6KTLr9
         vVozmdKjWTYbuRIvi0z1fwSoRN+nYuN7Y2W+K6/SuFfyM6pqkO4zX+SGg5OA7ncJRfN5
         8dDkjSVgRV5l4+1gIe0Cu9rnyLvbYHj18ASh2SaTetgal/JJoBMTR/bnZfNejTnKQjZg
         Kz2qY5lbpPIJez7hVjeTxAjRCvdCWDMvbs68C1vdIzf7SE7ower5TdGNQ8JzZgTCr/mQ
         ja7SmOpeGV+nuvyHFYMLoVfbcvkJ8/fljfMYjzrt5yv69gkIdBN0to9RXG9+pPlr8w0t
         9ujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761200659; x=1761805459;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PhfqsrPZ622z/oB3nsmbRSlTKoV/AGG9b+zQEYUr06M=;
        b=uRaBEnZ+KDScNdrrqSELQrHT7KBiwEcNOeOu0UcheftfLGv3eDNEFy+zB7qXmqA16p
         GLFtC22GNN0fBLJ9tR2cZX05P4C9oDWYx6CWtF+8M6CEn0+ytW5Zt3pGLnyiH2hIZnJv
         BXrMYUJ0Phfxm6PYO/uEWqY0zygU6GZoSj5KT7H0Fe3UY2SiIwWttMYoq3z/5OBu2PLD
         4aJgctGBtKX8hjOgsjDbU1tj3wawG6QYuwERo46ow5QHlHNOFaSFGh55kfcpYc0W2h3F
         qK+yYVh2mxohwFQI7I2cvHGn6gBYlwmMRw3Gr5mvtzPFtV/LrhVLbdugov9rWbKYV/w2
         npzg==
X-Forwarded-Encrypted: i=1; AJvYcCUD0n2wMnbb0LHDGohFmZD4tUcN+i43WHZSfpBpXaY0k01eKRjBUp4V5BnUKJOn90jOIJXB1AHgHpU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyAqFbz3vrnRbM+/yKvczzbr8tkVJI6khMsQ/M5AWmLzFb9QurU
	e/uZTMaqS+81PUKpzQWDo+k4ZJOy/HOM//KDzCewNGyv6Jm9FoPNs79LOC3AJ9j3Pw==
X-Gm-Gg: ASbGncsauEx2AZTRSCQsR3iWDWI00eORRWBTwJ+xtooHVIn83lrjbW7x3eRSP59hdzu
	aJ+pb5OjPMYuIAsgz/RxAjx2/AWCgK9bpW66V6uHSHoCWgRR1+VvJmGFmv4VaUEDoGIFpJNKLBU
	XL4YeGRHI08Y+H5lpHbBlQb7KspibqpJArF/Q9bJz+QV69pA5nlFOScvgL4Lzp2pBkpcFycd3wC
	enWCSiEiEveYWESu5jISwFuiE6PyVL/w+tPZ91A6S65GzwV1CINX4UIsQyBQxpegZUgBpgW2s4x
	J3MJdKYAUHC2obNZ91tQwo37IcG8q7t1xU0HoiWB1jZSlVEhCrKceUtkjXBfWkQbHGsIvjzF3/O
	77SET5/uokA9BQ3IwrpbIiNN92cji3k9Ja9edQ5jKMluBa/Q6YEhQKoQ5c9zbV2kAZFQqAUeVmu
	f1eLQcfoS155HJDjv4+XeGU4Ad5osygNd5bPAdc6BBNTvrSq36SvIBZym/h6CCKCKGs472ojQ=
X-Google-Smtp-Source: AGHT+IH4Wavi5UyGQxe1tHysAaQi9lf0/pSJ/JxTjqklucRS5R6cipeOkffLrh2cJvvmxo6HrWoGaA==
X-Received: by 2002:a05:600c:3e08:b0:46e:4921:9443 with SMTP id 5b1f17b1804b1-475cb066628mr7158065e9.37.1761200658747;
        Wed, 22 Oct 2025 23:24:18 -0700 (PDT)
Message-ID: <b62ae9fd-01db-43df-9966-98d028ca24e1@suse.com>
Date: Thu, 23 Oct 2025 08:24:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] x86/ucode: Abort parallel load early on any control
 thread error
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251020131955.2928261-1-andrew.cooper3@citrix.com>
 <20251020131955.2928261-3-andrew.cooper3@citrix.com>
 <4fb57b9e-2a39-471a-a629-e8cd00997f22@suse.com>
 <342ead3d-3d10-46b9-bb2f-89f941582d96@citrix.com>
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
In-Reply-To: <342ead3d-3d10-46b9-bb2f-89f941582d96@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.10.2025 21:28, Andrew Cooper wrote:
> On 20/10/2025 4:55 pm, Jan Beulich wrote:
>> On 20.10.2025 15:19, Andrew Cooper wrote:
>>> EIO is not the only error that ucode_ops.apply_microcode() can produce.
>>> EINVAL, EEXISTS and ENXIO can be generated too, each of which mean that Xen is
>>> unhappy in some way with the proposed blob.
>> Yes, yet wasn't that the case already when the EIO check was added? Were we
>> perhaps trying to deal with a certain level of asymmetry in the system? I
>> think a little more is needed here, also to ...
>>
>>> Some of these can be bypassed with --force, which will cause the parallel load
>>> to be attempted.
>>>
>>> Fixes: 5ed12565aa32 ("microcode: rendezvous CPUs in NMI handler and load ucode")
>> ... justify there being a Fixes: tag. It would also seem possible that the
>> check was intentional and correct at the time of introduction, but was
>> rendered stale by some later change.
> 
> The parallel load logic more bugs than lines of code.  What hasn't
> already been rewritten either has pending patches, or pending bugs
> needing fixing.
> 
> I didn't care to check why it was limited to EIO at the time.  It's
> definitely wrong.
> 
> But if you insist that I waste time doing so, at the time EIO was
> introduced, both apply_microcode()'s could fail with -ENOENT for a NULL
> pointer, -EINVAL for "patch isn't for this CPU".

The latter fits my "trying to deal with a certain level of asymmetry" guess,
doesn't it?

And btw, why are you being so negative again? "Waste time" is a pretty clear
sign of you (once again) thinking that your view of the world is the only
possibly sensible one.

Nevertheless, considering that asymmetry is not something we really mean to
care about:

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

> I.e. it was definitely wrong at the time too.
> 
> ~Andrew


