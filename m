Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4DB86CF38
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 17:32:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687300.1070571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfjJt-0003tW-Dr; Thu, 29 Feb 2024 16:31:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687300.1070571; Thu, 29 Feb 2024 16:31:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfjJt-0003rN-B8; Thu, 29 Feb 2024 16:31:41 +0000
Received: by outflank-mailman (input) for mailman id 687300;
 Thu, 29 Feb 2024 16:31:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8AV=KG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfjJr-0003rC-QK
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 16:31:39 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02ba1a52-d720-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 17:31:38 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-564a53b8133so1648771a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 08:31:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5-20020a0564021f4500b00564d7d23919sm745468edz.67.2024.02.29.08.31.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 08:31:37 -0800 (PST)
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
X-Inumbo-ID: 02ba1a52-d720-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709224297; x=1709829097; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RGy2hlIVhrmudPHpZlR5MZzLrNNufU61H/AK1P74Fbo=;
        b=JPrTM6y9C8AwM1nrUdWET/zk3U7s/NiqF3JQEhd3u/QODI5dqQ+51dPZGqz7hMrScr
         g7Tvu+Wd/+PKWXzvhG4wQyTCBfYrSs2JtH6TbZDb1tjbLSDtj2lPyLapY2RQ7r3DM2I7
         V87Wf1rtEl6GNYn7uLMSqO/5WRUSWtT9CkfH/mZTQcGM3IUOV0Z4FlfJZAMMMdW0XFvx
         YlNwvCA8pL0qFXUPfJPiQGziNeUfidJKGP3OLYDWWvS/m3KI6hCZde241ysCqKSDhsnN
         B3GkalRCPHZ+2qudp40DBbMbElNQqacmNIhovP20A7gTmzB+G8Mc2BF/Px8/rQuupPK2
         KDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709224297; x=1709829097;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RGy2hlIVhrmudPHpZlR5MZzLrNNufU61H/AK1P74Fbo=;
        b=ZqRYt4kFsJad2UQzmVmGVVEfGeB+HFNMPsh4zBiQfwDdVZ4hV6ld03wf1PtOV/urR3
         17E7LhaLRUDH7n/AXckyolKoVWxCq2gWB7HRwgGmf6fEksAGB2OhA/jkPu6klYwJ7zNm
         sVCNRIzrXR0TaXX2BM20yxItYzw43FXgzvGX9njL7x99L5Supc9x7Y9ZgNcIEnI/Yvfe
         Hp5kXQY+fEOyD458j9WksKtDavggskeZxSEcKycWGpwMjIoxoQkg/5Tg52MS+fBrnuqy
         133jLjrrodPtrP3qYN9bDeEmX5gGLDJfhg326cPgadeInuRS4JDI5G90jdGtYTcnCBLA
         Cdbw==
X-Forwarded-Encrypted: i=1; AJvYcCXojGxHE+CuiZwFNH3kxoALCO9nWYCOvUdsDqPq+epIM5NizlJYRgmq9fsKlUQ2joS3prNYYMKSGtCnIsd2qG4+1S9IvXTBcodWn2y4avQ=
X-Gm-Message-State: AOJu0Yy8sFUmoU/bz9If9bgTs/MMiXVtd6Z9T47hhOozQkc2cqywATP8
	ov5NAmiIOb6sLL5kI80q0JaFW7kn2W2xfpHZNkdJJKThAZgnqTBsGoAAabEs6AxH+4EVRltCK6E
	=
X-Google-Smtp-Source: AGHT+IHPKDmd2Vdci4CGTmANuYERFwwOK7TAPV8KVTqpJO/13tZRWuIcYaCFtrvyU0tXZz7pGL7oRw==
X-Received: by 2002:a50:c88c:0:b0:565:7d4a:1d4a with SMTP id d12-20020a50c88c000000b005657d4a1d4amr1647414edh.8.1709224297588;
        Thu, 29 Feb 2024 08:31:37 -0800 (PST)
Message-ID: <f2d107a1-0bcf-4d71-89e8-819ee38e0651@suse.com>
Date: Thu, 29 Feb 2024 17:31:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/12] xen/spinlock: support higher number of cpus
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-13-jgross@suse.com>
 <c96542eb-daf4-4ce2-915e-86ca8e1848b5@suse.com>
 <f6658df0-13f2-4129-afcd-0f122c87132b@suse.com>
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
In-Reply-To: <f6658df0-13f2-4129-afcd-0f122c87132b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.02.2024 17:29, Jürgen Groß wrote:
> On 29.02.24 16:46, Jan Beulich wrote:
>> On 12.12.2023 10:47, Juergen Gross wrote:
>>> Allow 16 bits per cpu number, which is the limit imposed by
>>> spinlock_tickets_t.
>>>
>>> This will allow up to 65535 cpus, while increasing only the size of
>>> recursive spinlocks in debug builds from 8 to 12 bytes.
>>
>> I think we want to be more conservative here, for the case of there
>> being bugs: The CPU holding a lock may wrongly try to acquire it a
>> 2nd time. That's the 65536th ticket then, wrapping the value.
> 
> Is this really a problem? There will be no other cpu left seeing the lock
> as "free" in this case, as all others will be waiting for the head to reach
> their private tail value.

But isn't said CPU then going to make progress, rather than indefinitely
spinning on the lock?

>> Therefore my suggestion would be to only (mention) go(ing) up to 32k.
>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>>   xen/common/spinlock.c      |  1 +
>>>   xen/include/xen/spinlock.h | 18 +++++++++---------
>>>   2 files changed, 10 insertions(+), 9 deletions(-)
>>
>> Shouldn't this also bump the upper bound of the NR_CPUS range then
>> in xen/arch/Kconfig?
> 
> Fine with me, I can add another patch to the series doing that.

Why not do it right here? The upper bound there is like it is only
because of the restriction that's lifted here.

Jan

