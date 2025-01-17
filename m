Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B54A14F62
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2025 13:42:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.874051.1284922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYlfE-0007jo-NR; Fri, 17 Jan 2025 12:41:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 874051.1284922; Fri, 17 Jan 2025 12:41:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYlfE-0007hS-Kn; Fri, 17 Jan 2025 12:41:28 +0000
Received: by outflank-mailman (input) for mailman id 874051;
 Fri, 17 Jan 2025 12:41:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b505=UJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tYlfD-0007hG-0h
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2025 12:41:27 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5bf0357a-d4d0-11ef-99a4-01e77a169b0f;
 Fri, 17 Jan 2025 13:41:23 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3862b40a6e0so1223401f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jan 2025 04:41:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf327e024sm2373776f8f.88.2025.01.17.04.41.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jan 2025 04:41:22 -0800 (PST)
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
X-Inumbo-ID: 5bf0357a-d4d0-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737117683; x=1737722483; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vm2T92KgDW9Mi2Le1XhF32fcQchrX/O3tdFBs2FrGOs=;
        b=D5M6bgSQCNHch9PkqNjwGyaTRZ4utu/qfH3duytdnB0oJLQBVLArXnJ0313wIJ+/5N
         aWAb5WMpDSSdPGP/nB4aihiVMHa3v4NznbgtfqM/kdBfASQD33WJF8H2RTSCPIRGWkxu
         ZbyN1NXWTT+vNUayEIf72bpYYmbdzrJQjbIhoxzQUOT8spT7coWLmObdhom2B0DUrupk
         +EvopXZbb1lhv7xbbVYPwq2kJn1WBtbDWPLRwuZlVFXJs1kpBGmYP5dBiL9i6FYla+rz
         v6cMBjlmYvl7pS5LziVrheN/+LHaJx7X4uVZcQscsZJVE+GP0cG2DH6KDt05H58zc6a7
         HE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737117683; x=1737722483;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vm2T92KgDW9Mi2Le1XhF32fcQchrX/O3tdFBs2FrGOs=;
        b=teVnjQzaW43/OiSKBqeY1x9VcQkyf93TbYIZIomAjdEfh0Wq6yk1f7xtp8TI0+SyiA
         2oxrqZEXyhniDrl8BekTLmd23EROagsOMabaXrC4bLdbezKpy2y3+5T7q6SEE+gTinNY
         gt4BJktlOalJJwOmVSzMXfnwiA261mbZfldttuly1XHG5IrMqH21rrCbW9fb30TuXTHR
         EJHmCfx/y61MLS2pNh3q37u7LakH0n+wZvieaWjdo7sastHyPjBvtb8RYanvb69PuY/A
         kqDVdWjIWISrMmfYLJTbq9piUgSGfqjcwrYmDrNwA5RP6slKRlcxTbkAB3kf4LOEWBVE
         NYVA==
X-Gm-Message-State: AOJu0Yw0LUXLQUI0p0Ny1df45zUpIm5TVO7SXJWuAOOr+Rpzdbhuqm1g
	pOK0c22sVrXDyRtikarEtrP11QZGinT1orqqyfU6Zk0YoJUgdHc2/gUGlmDr2A==
X-Gm-Gg: ASbGncsTvaC6PEKlaQtuz4MCL/cNe5EqMRHppaoOkVkQGKrdfdCNax3nQAzKdVraxs9
	1EWxc4Z9DRhdF/sI6/4c9EIDSdy09B3ZkB9ixDpZoCm7GAaOnoq2PxL0XvAwkOp8xF7QODZVwL3
	vM+d/StZD6QjZIYGEth2qjMYijxhzZPi6N9UdpshebZJW7FnHHFhIM0ZLewBud19A8PqbrSBKOR
	3seZVWkToYOO8NjogyDzPTeiC0h0KmOKJX9CHX8gdViMLlG3lhis5p25lVH5e93M9QfOT19fESs
	2/Nn9xfpDWYOqqOIFvlNkTvHUX4wCvb6Ye7tFIOXOg==
X-Google-Smtp-Source: AGHT+IG4w7j3gEgGKa1PFkR5WQ4cKyt+9PDhBtgKZKO482oM2WAMMX3S+WNm0TNTXle5c9y0hKMiSg==
X-Received: by 2002:a5d:5f8c:0:b0:385:ef2f:92ad with SMTP id ffacd0b85a97d-38bf564d5e7mr2744161f8f.10.1737117682834;
        Fri, 17 Jan 2025 04:41:22 -0800 (PST)
Message-ID: <6285f86d-f2d2-4040-999d-01aed3e72a36@suse.com>
Date: Fri, 17 Jan 2025 13:41:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] x86: provide an inverted Kconfig control for
 shim-exclusive mode
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, sergiy_kibrik@epam.com,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <da5f5bac-6d5d-092d-d872-f1120dcd2661@suse.com>
 <617842e1-8ef2-b095-0c52-c2e2e5f1c0a8@suse.com>
 <alpine.DEB.2.22.394.2501161503120.2684657@ubuntu-linux-20-04-desktop>
 <Z4oxZSUQ6VARiR0H@macbook.local> <D74CH4RDRRR9.ZR6RL8U6PQ56@cloud.com>
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
In-Reply-To: <D74CH4RDRRR9.ZR6RL8U6PQ56@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.01.2025 13:24, Alejandro Vallejo wrote:
> On Fri Jan 17, 2025 at 10:31 AM GMT, Roger Pau Monné wrote:
>> On Thu, Jan 16, 2025 at 04:31:46PM -0800, Stefano Stabellini wrote:
>>> On Wed, 1 Mar 2023, Jan Beulich wrote:
>>>> While we want certain things turned off in shim-exclusive mode, doing
>>>> so via "depends on !PV_SHIM_EXCLUSIVE" badly affects allyesconfig: Since
>>>> that will turn on PV_SHIM_EXCLUSIVE, other options will be turned off as
>>>> a result. Yet allyesconfig wants to enable as much of the functionality
>>>> as possible.
>>>>
>>>> Retain PV_SHIM_EXCLUSIVE as a prompt-less option such that first of all
>>>> C code using it can remain as is. This isn't just for less code churn,
>>>> but also because I think that symbol is more logical to use in many
>>>> (all?) places.
>>>>
>>>> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> ---
>>>> The new Kconfig control's name is up for improvement suggestions, but I
>>>> think it's already better than the originally thought of
>>>> FULL_HYPERVISOR.
>>>
>>> I think the approach in general is OK, maybe we can improve the naming
>>> further. What about one of the following?
>>>
>>> NO_PV_SHIM_EXCLUSIVE
>>> PV_SHIM_NOT_EXCLUSIVE
>>
>> IMO negated options are confusing, and if possible I think we should
>> avoid using them unless strictly necessary.
> 
> The problem is that the option is negative in nature. It's asking for
> hypervisor without _something_. I do agree with Stefano that shim would be
> better in the name. Otherwise readers are forced to play divination tricks.
> 
> How about something like:
> 
>     SHIMLESS_HYPERVISOR
> 
> That's arguably not negated, preserves "shim" in the name and has the correct
> polarity for allyesconfig to yield the right thing.

Except that a hypervisor with this option enabled isn't shim-less, but permits
working in shim as well as in non-shim mode.

Jan

