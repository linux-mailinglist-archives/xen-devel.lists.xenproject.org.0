Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D43AE44B1
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 15:44:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022359.1398146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uThTU-0003g0-Jv; Mon, 23 Jun 2025 13:44:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022359.1398146; Mon, 23 Jun 2025 13:44:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uThTU-0003dW-H5; Mon, 23 Jun 2025 13:44:40 +0000
Received: by outflank-mailman (input) for mailman id 1022359;
 Mon, 23 Jun 2025 13:44:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H8L6=ZG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uThTT-0003dQ-DS
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 13:44:39 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3480c216-5038-11f0-a30f-13f23c93f187;
 Mon, 23 Jun 2025 15:44:38 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43edecbfb46so28823135e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jun 2025 06:44:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b31f118ecb2sm6827425a12.11.2025.06.23.06.44.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 06:44:36 -0700 (PDT)
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
X-Inumbo-ID: 3480c216-5038-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750686277; x=1751291077; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LQPecrdmbgZ25c522j1wyItnkdmk25j+WVLoG09o1pQ=;
        b=Gyq3tPXB4JHf01B2Qf9fM9an9HbdncRU5cdqCYtBK8GaFo5gSj/X2heXaNcCWWwIr8
         /pyTB0HOZexvvrbjBlxkEbiZ5x32JVNFyXYeKcbGYPa6XbWJ6HZNsY8fRMbGBLyaUmsh
         S37pk0Z32uiiXs6U7aY1eoecu8h+hiF6dIzIi/IgtQCDDKBgHwQJxDhOdfhK8nBkr+D5
         2EE8306iOQfv3yIwQ/4T5QOXlMBK0s9JDJhLPrAZA6PADZXC1AevNBx5biUqpxpwRka4
         r4aRWpGJuzIbqgkcjcdVzlf7CBvKCzYdeLvW3LUQuVmDMQWkw5Wu0ONCCdiYDwNisdTc
         +xQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750686277; x=1751291077;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LQPecrdmbgZ25c522j1wyItnkdmk25j+WVLoG09o1pQ=;
        b=OPFlup+d50Hr5RqRkoBGPbFaQoxV34jxutXFImkHOjPT3VAGKq97TE2qSQ7ST0yLRd
         izUc4jkSiGEVi/SI21SOWxttjZOzNHTt+5agG79WBRh6f4u/N9Epcgmt7kpuOYtqfTiR
         q1DIoYEH0LtMZ3wgsu460beUrkO3EXh85SuWpL7rujgJtIIObMXSH2mXuUE8EJ8xZC5/
         XRzfzehxzp68u5EubTyYLHIHhgPYScSLeveDM/N7STG5oFeHicW1s8OIiJNnJM3+WNpB
         iEe9IiQj1ldP8WA44HK+nRGBHfjBw/YtTx18R2XqJeYbdnczc64jMzWruOXca8q4byVK
         RZ7A==
X-Forwarded-Encrypted: i=1; AJvYcCVtjy/lUH6WtZZ2PjXgyIhxMDf8t5l1Gw+5sRRETKiEkv7vlssssLDRS+JlgnZ2TJ6c+akx7/WjzlA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx9aVf3tloLhPLyAXnOHjTVPoJq6nxcccqqiNickuSdEOD8evKr
	PxtNRKCenGoJ2xmU64p9r1weJooArlJSr8ry86c/+2iG3OcQQbPTf6jnmcaXfQerow==
X-Gm-Gg: ASbGncu+cEDEGqTGPMh7GJrYBUhuU+VX3c+H+HTFh9xMso6izKcJfi5e7nUykPNrcQZ
	AG1ORvqWy4s2PFMiGQ8lGPVz+FPeDxGJaJ7/g1NLPARGbvJdp3Eqdvx9qCws2LQpm7M/bXEw1z9
	reKhD/mU7Yu9FFTlTVdrP/ZFyViDX0DiAEsPvoiCdlQ82X0mFlsDpVZCP+hznJUHCHpP6QoGis/
	rUn44sSjzax86wP5WmLly3fFkysmYUazsaewichhaC7istByyvO6ifuY2CI9qDxr4hhpk4k1sQv
	jCN/QPuCY9m55tIL+FfiAkknqbSlzM906cRxrR9qp7cIxLCDRQ22pqXFW/5LolRi+p1WOFlc+Af
	3ViWFyh2D7SHO7Kv7aYErQXXUqrOSw+xuubf4/M6DZutoTBgTw74285u34g==
X-Google-Smtp-Source: AGHT+IFhBt14bJfQcmQAoN78AIKYry2UwRWPE8zdvNZkBiSC33sz5PvDOopRiYm/Nx5DO6r413CqGg==
X-Received: by 2002:a05:6000:480f:b0:3a4:da87:3a73 with SMTP id ffacd0b85a97d-3a6d12dee06mr8007138f8f.42.1750686277206;
        Mon, 23 Jun 2025 06:44:37 -0700 (PDT)
Message-ID: <1fc40753-727e-408c-940e-07f3efe1ef48@suse.com>
Date: Mon, 23 Jun 2025 15:44:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/12] xen: Rename CONFIG_HAS_DEVICE_TREE to
 CONFIG_HAS_DEVICE_TREE_DISCOVERY
To: Alejandro Vallejo <agarciav@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Dario Faggioli <dfaggioli@suse.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20250620182859.23378-1-agarciav@amd.com>
 <20250620182859.23378-11-agarciav@amd.com>
 <490ee7bf-cb10-43e3-9416-9a68e7529b96@suse.com>
 <DATXSLGR4W0C.I4IQ77V0K6FH@amd.com>
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
In-Reply-To: <DATXSLGR4W0C.I4IQ77V0K6FH@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.06.2025 15:11, Alejandro Vallejo wrote:
> On Mon Jun 23, 2025 at 9:39 AM CEST, Jan Beulich wrote:
>> On 20.06.2025 20:28, Alejandro Vallejo wrote:
>>> Moving forward the idea is for there to be:
>>>   1. Basic DT support: used by dom0less/hyperlaunch.
>>>   2. Full DT support: used for device discovery and HW setup.
>>>
>>> Rename HAS_DEVICE_TREE to HAS_DEVICE_TREE_DISCOVERY to describe (2), while
>>> DOM0LESS_BOOT is left to describe (1).
>>
>> Considering hyperlaunch this feels wrong to me. Did you consider splitting
>> HAS_DEVICE_TREE into HAS_DEVICE_TREE_PARSE and HAS_DEVICE_TREE_DISCOVERY,
>> as I suggested on the committers call? You weren't there, but Stefano said
>> he was taking notes.
> 
> Some might've been lost is transit, I admit. I don't remember hearing about
> a HAS_DEVICE_TREE_PARSE, but it might've very well been me being spotty when
> syncing with Stefano.
> 
> Having a special HAS_DEVICE_TREE_PARSE doesn't seem very helpful, as every
> arch would have it set.

Hmm, yes, we don't want or need that. But then what's option 1 about? That
shouldn't be "described" by DOM0LESS_BOOT.

> I'd definitely like for the "enable support to boot
> several predefined domains from DTB descriptions" to be a single option for both
> dom0less and hyperlaunch. And be selectable rather than unconditionally selected
> And ideally move towards a future in which both dom0less and hyperlaunch are one
> and the same.
> 
> I can do an early rename s/HAS_DOM0LESS/HAS_PREDEFINED_DOMAINS and s/
> DOM0LESS_BOOT/BOOT_PREDEFINED_DOMAINS/ if that helps. I was waiting to do so
> until x86 gains the ability to boot off a DTB to avoid having help messages
> describing things not yet on the tree.

I have to admit that it's not clear to me if that would help. As you say, on
x86 that's not a thing just yet. What I think we need to aim for is to not
leave the tree in a state that's more confusing than anything else. Even if
later (which may be much later) things would get tidied again.

>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -14,7 +14,7 @@ config CORE_PARKING
>>>  
>>>  config DOM0LESS_BOOT
>>>  	bool "Dom0less boot support" if EXPERT
>>> -	depends on HAS_DOM0LESS && HAS_DEVICE_TREE && DOMAIN_BUILD_HELPERS
>>> +	depends on HAS_DOM0LESS && HAS_DEVICE_TREE_DISCOVERY && DOMAIN_BUILD_HELPERS
>>>  	default y
>>>  	help
>>>  	  Dom0less boot support enables Xen to create and start domU guests during
>>> @@ -85,7 +85,7 @@ config HAS_ALTERNATIVE
>>>  config HAS_COMPAT
>>>  	bool
>>>  
>>> -config HAS_DEVICE_TREE
>>> +config HAS_DEVICE_TREE_DISCOVERY
>>>  	bool
>>>  	select LIBFDT
>>
>> This select imo ought to move to HAS_DEVICE_TREE_PARSE, unless I misunderstand
>> what LIBFDT covers.
> 
> Doing so would preclude compiling it out on x86 when hyperlaunch is not there.
> LIBFDT is very much essential on arm/riscv/ppc, but not so on x86.

Okay, but _something_ has to select that on x86 as well, once hyperlaunch is
going to need it.

>>> --- a/xen/common/sched/Kconfig
>>> +++ b/xen/common/sched/Kconfig
>>> @@ -67,7 +67,7 @@ endmenu
>>>  
>>>  config BOOT_TIME_CPUPOOLS
>>>  	bool "Create cpupools at boot time"
>>> -	depends on HAS_DEVICE_TREE
>>> +	depends on HAS_DEVICE_TREE_DISCOVERY
>>>  	help
>>>  	  Creates cpupools during boot time and assigns cpus to them. Cpupools
>>>  	  options can be specified in the device tree.
>>
>> This similarly looks wrong to me. Whether to create CPU pools is purely a
>> Xen-internal software thing, isn't it?
> 
> In principle, it should be HAS_DOM0LESS and likely will be later when I hook it
> for x86. I was waiting for x86 needing such a change to use the binding. Would
> you rather have the change done now?

See above - my main concern isn't with what is introduced early or later, but
what the overall (intermediate and final) state of the tree is going to be.

Jan

