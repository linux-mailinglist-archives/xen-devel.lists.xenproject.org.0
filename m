Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E8EA19256
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2025 14:25:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875936.1286338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taaj2-0000qU-UH; Wed, 22 Jan 2025 13:24:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875936.1286338; Wed, 22 Jan 2025 13:24:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taaj2-0000nd-QE; Wed, 22 Jan 2025 13:24:56 +0000
Received: by outflank-mailman (input) for mailman id 875936;
 Wed, 22 Jan 2025 13:24:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XwhO=UO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1taaj0-0000nX-TG
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2025 13:24:54 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 434b4d4d-d8c4-11ef-99a4-01e77a169b0f;
 Wed, 22 Jan 2025 14:24:52 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43618283d48so49688435e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jan 2025 05:24:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438b31c7cc6sm23992475e9.36.2025.01.22.05.24.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jan 2025 05:24:51 -0800 (PST)
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
X-Inumbo-ID: 434b4d4d-d8c4-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737552292; x=1738157092; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FDGUomymv0ZsBpuAUt98T1Sxt8+05TXqMxs65cdngOE=;
        b=KhuHYOBZDaakfBRPm38eChnYqRL/kYBhuMkzDgsh9y2GoC8gzsOdai2uMP9PRGqljz
         5eBX8tFjsTsVU8pXEoP0pUBgrV1j3VJFDvhI7R5GtpwZhsS3P1xodchrgqBgEwFkkteD
         r4L34Cevys+mHgcboVgumS6owaW3YZHAGQ8yHx0gHpKv8pJhjAKORffKQwn5gJiqcKnu
         VyK1q+VWRz2iT1P32/9Zu5g/iMUJ0F38RgZmSCpwTcTGt/UUt45ggiTiBBX5rwkYWVUY
         E5vEziN2mj0Go39epsGsO5ShiEEe52YEZUy29ai87wjWPGXaAhRwJEEgiUgfeE1aDSo3
         L+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737552292; x=1738157092;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDGUomymv0ZsBpuAUt98T1Sxt8+05TXqMxs65cdngOE=;
        b=X+nUKYfTMek8FVFPGRtY4XZhnWqLEf+CapTN9Qy+EHyKYBHBg6KfH40z+ITQTxdXds
         mCqRShzw9uW1xM1pswRgFzA03ZOvEva/VrEV6DM6aeRBJ/jGIzHXx0vAIc8rAxErYmLh
         6lIXrjsLw1L2lqBIVwYc+0cPwBILTQmUSO3jSvGNkT+IGSL5UVd+AfmyxbKz/pK2afHE
         y+VJKPqvbOjT2ygcakix5p1Izs9bfB5z1cB7S2ikPiJ88RcYtpzTs/BLx/uTSeGgvdeP
         hdc+tFLOOML+1xV51IelP75wK+09pxzkJ/FTrZmZhOW43PNmZ2NvIUCyigXiOSB5m+2Q
         cbfw==
X-Forwarded-Encrypted: i=1; AJvYcCUKJmb3BXXXe7LewRcy2j5xhPb0dPsDpLrGOoXMR29L0RTmCOaPHJlZIOcjQ7GZXWz/AmGvFhfePqw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzF7RXeYJWgVGeJ5GxeQ8xonVVYE89Y4JK4hFNPKdoXSIglJFut
	9Z7Hi/ZN/DUyF3yt4VgVRQ+FT6UrqOupQIqBqFZnNAaw32fJOpv8Wf8LTQ9v7Q==
X-Gm-Gg: ASbGncs3A5xKpdxspb7ZovajThrLuh2zLTiuzk19wF1acZrx4w85H+RyZppZ9/dJA6K
	fh/U56EDFP+jRnbJT5/wgljYYBIDqU9RHpxWGpq3BoP/eR1vqbhLEmVQQoLG1EQ8Gpe3d6kekB3
	MnXv3wr1+WYXRkAFu6J+9VqaYxc5xf/EbgAbr8JFPRUqpqkzZtQTzqv0OOus2++6FCPKOW/e1vm
	snBh4/3Nyiwc9eZx9HpklXyHYPdeooXCwdynyQtwWh/0pk3nz7E2VYQsewPa3TKGHC+DgqQ+iGx
	uyjnqzO3nRMuzOKSH3XP/FRTnYASrKrqlxj9K9p4KWU/F0TjE/knP2s=
X-Google-Smtp-Source: AGHT+IETt8CWXd/G5aN79XuQv4Xb4nBUtlYxqiY9w5Jo06azZJf4F06hdUpWzgCrpTLtAEWpv3YI9w==
X-Received: by 2002:a05:600c:138a:b0:435:194:3cdf with SMTP id 5b1f17b1804b1-438914292demr191783615e9.19.1737552292084;
        Wed, 22 Jan 2025 05:24:52 -0800 (PST)
Message-ID: <6c0ebe4b-fc47-4bb0-b317-f854abb63517@suse.com>
Date: Wed, 22 Jan 2025 14:24:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] x86: provide an inverted Kconfig control for
 shim-exclusive mode
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, sergiy_kibrik@epam.com
References: <6285f86d-f2d2-4040-999d-01aed3e72a36@suse.com>
 <alpine.DEB.2.22.394.2501171430570.2684657@ubuntu-linux-20-04-desktop>
 <f8c1e2c2-ceb5-4200-a304-e2d824a171a8@citrix.com>
 <40c9d806-000d-43e7-a804-ad4e84209b2f@suse.com>
 <alpine.DEB.2.22.394.2501201527090.11086@ubuntu-linux-20-04-desktop>
 <bae48627-fa5b-48b6-b74e-267285175eff@suse.com>
 <Z49gQBkxCbXIO84D@macbook.local>
 <41859184-bd9c-420f-96c1-65abe379b81e@suse.com>
 <Z4_hOmi01AkiYH_k@macbook.local>
 <c897005a-2e8e-4031-a828-acb8128f7c0c@suse.com>
 <Z5C_EJEtorK2pwGE@macbook.local>
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
In-Reply-To: <Z5C_EJEtorK2pwGE@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.01.2025 10:49, Roger Pau Monné wrote:
> On Wed, Jan 22, 2025 at 09:43:53AM +0100, Jan Beulich wrote:
>> On 21.01.2025 19:02, Roger Pau Monné wrote:
>>> On Tue, Jan 21, 2025 at 11:35:42AM +0100, Jan Beulich wrote:
>>>> On 21.01.2025 09:52, Roger Pau Monné wrote:
>>>>> On Tue, Jan 21, 2025 at 09:13:38AM +0100, Jan Beulich wrote:
>>>>>> On 21.01.2025 00:27, Stefano Stabellini wrote:
>>>>>>> If I understood it right, I like Andrew's suggestion. He is suggesting
>>>>>>> to do the following:
>>>>>>>
>>>>>>> - turning PV_SHIM_EXCLUSIVE into something that does nothing
>>>>>>
>>>>>> FTAOD - you mean Kconfig-wise? Andrew clearly didn't say "nothing", but
>>>>>> "nothing other than making the boolean be a compile time constant".
>>>>>
>>>>> Won't making the boolean a compile time constant would also result in
>>>>> DCO kicking in and removing a fair amount of code?  So even if you
>>>>> have enabled everything in Kconfig, the resulting hypervisor would
>>>>> only be suitable to be used as a shim?
>>>>
>>>> Of course.
>>>
>>> Then what's the point of this approach?  Options will be enabled in
>>> Kconfig, but the resulting hypervisor build when using allyesconfig
>>> would have a lot of them short-circuited, making it even worse than
>>> currently?  As options will get effectively build-time disabled due
>>> to DCO while enabled in Kconfig.
>>
>> Well, I have to direct this question to Andrew. It is specifically
>> what I'm trying to address with UNCONSTRAINED.
>>
>>> Overall I think PV_SHIM_EXCLUSIVE should be excluded from
>>> allyesconfig, even with Andrew's proposed change.  Otherwise the
>>> purpose of allyesconfig is defeated if enabling PV_SHIM_EXCLUSIVE
>>> makes the resulting hypervisor build PV shim only.  IIRC we can
>>> provide a default alllyes.config with CONFIG_PV_SHIM_EXCLUSIVE=n.
>>
>> Hmm, I wasn't aware of the option of using allyes.config. That might be
>> the route to go, albeit it looks like people using the allyesconfig
>> target then need to remember to set KCONFIG_ALLCONFIG in the environment
>> (to <empty> or 1), or to explicitly specify a file name that way. (This
>> of course ought to be easy enough to arrange for in our automation.)
> 
> My knowledge of Kconfig is very limited, but isn't there a default
> path for such file to be picked up by Kconfig?  I see we already have
> a xen/tools/kconfig/allrandom.config, I was expecting it would be a
> matter of dropping an allyes.config in that directory, but I haven't
> tried.

Well, I simply looked at the kconfig sources, and my reading of it is
that it won't even try to open allyes.config when the envvar is absent.

Jan

