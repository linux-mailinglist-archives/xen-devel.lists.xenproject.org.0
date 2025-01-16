Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DEBA13D54
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2025 16:12:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873640.1284644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYRWM-0003BA-6K; Thu, 16 Jan 2025 15:10:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873640.1284644; Thu, 16 Jan 2025 15:10:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYRWM-000381-3A; Thu, 16 Jan 2025 15:10:58 +0000
Received: by outflank-mailman (input) for mailman id 873640;
 Thu, 16 Jan 2025 15:10:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kdRh=UI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tYRWK-00037v-NE
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2025 15:10:56 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 153d06dd-d41c-11ef-a0e2-8be0dac302b0;
 Thu, 16 Jan 2025 16:10:55 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43623f0c574so6886365e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2025 07:10:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43890367b48sm2473845e9.0.2025.01.16.07.10.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jan 2025 07:10:53 -0800 (PST)
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
X-Inumbo-ID: 153d06dd-d41c-11ef-a0e2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737040255; x=1737645055; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zdRIhZHsbbFvURBS8/QHEf5PM16SAMuExybb9/BAnN8=;
        b=CymcNiTkRIJ5Kn7xfnI5aTzkpO+XPquQaEOYWXJmZCeVW4JXJXkN8tb3tpazK203XD
         gX/d2cqatPyPThXr/GRulxh3+GF8d1hOdQFKXd/eubOvosV3QXUXDb99kYlYuo9u6T2a
         WIkAKluT5o5U9Kp+L387QmTYrFS2GBn4h85Id04L48TurqHQkldS9bw0nExxUH1N29Jv
         zRqgWP2vSBl+JDP3uuZNj9ZQT0HIZ4PQYXG/jZCqEuNLMlZIWCUw3PMYaugOIpa1NTOu
         ODwvmQWDhArFElNVJHkJXLBtSIL2DjvmWVhZSgHim1DbnloarYM8K4aLcYbXAR8zcT9V
         u2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737040255; x=1737645055;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zdRIhZHsbbFvURBS8/QHEf5PM16SAMuExybb9/BAnN8=;
        b=HlouAoS177sgbiXOuvXzWr6B0tWP3IN4lds/ikT7SHgjOqt9pvAADHkZ7hDFcKTcyQ
         A62qgsTIFhide65DyRvcSgJzV2/MXjqG9EEr3CIvn9cOwrqRCJcB8RRnPDBApuS/ATGX
         B+WY1aBO8g23pJs/DYoADWolf3KC/ymf2kfpLfAz7LG6i06yPwzdfJulfw369BONhvZG
         D9Zf9S99IbEHS1Ju3iywhxHvJSKpHhEIrVWpa1dg0vvoDpqL0qcP9ia0zXV0RyO/dgnV
         GObEtQFNr/6A6v+As3B2ObiVR1sy5PlzFJv2r9mh/0FOMQ5XVNr4aLWrPXw/hkPNb+dN
         irLA==
X-Forwarded-Encrypted: i=1; AJvYcCVEXFUFKkekgMYPVkFofqjFlZuzGCaTS3LgMWY4r4BE3/ibiqbe0y9YDZOA8F5xNvaOrhptsS+rPlA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJmJg37vaFdP/02l0xuxh8sKeW8Ani6oQpJDkPuvVOTtK1yH1f
	M6nw9BM/TGkC9CT9kfdqPmPuRb2vRPDgQekz3q6vdfB8yKGRVvBvive0dzzWog==
X-Gm-Gg: ASbGncsGc360eSDjdf7bEWJaVFUqlJZGI0OUw9tGsIx4uotoxwES/VpxsJMfpCcX27V
	HYc90c44qi9Nv9Jn/13cIbLtTWwEJqMszibTnii7Ydad9yXdOQBZVWtW8A/A3CIiEupVIAUBsuu
	u2pGLl8XpEDr7wiehVppYJLdT7q0M1nV+wKjCoDqF8+o6mLOPN+ybwxghXoeTf26XD4oNADCFwN
	heLJYZuxoLgTQ2KaCQ22GWVXKV4szRDVHmv7H5VKEcApFxSxg9y6/H0LXvJCyaxiTl3ej6THhnT
	3kYSXdtiORTUQ5ChYLYW9HoSfRArBhGJ8LxuRuvzEg==
X-Google-Smtp-Source: AGHT+IHZqeZ0ioO2JhokBn+E1qHLFTJs3J1lwQf2Jyih+kNPabT1nE660fU1dCE+D2ULaC6Mj51sZA==
X-Received: by 2002:a05:600c:4ecd:b0:434:f739:7ce3 with SMTP id 5b1f17b1804b1-436e26954a9mr299963065e9.8.1737040253317;
        Thu, 16 Jan 2025 07:10:53 -0800 (PST)
Message-ID: <2fc6c2fd-f360-46ee-9ded-f5efd8c508bf@suse.com>
Date: Thu, 16 Jan 2025 16:10:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1] xen: mem_access: conditionally compile vm_event.c
 & monitor.c
To: Sergiy Kibrik <sergiy_kibrik@epam.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <20241230063051.3332332-1-Sergiy_Kibrik@epam.com>
 <c8684340-33f9-41d3-94e4-77ee3bc18306@suse.com>
 <CABfawhk4pzA9bSMzJDX7ZwaYC50dfn_ntCnk=bePmiKCpDnN3w@mail.gmail.com>
 <8fc662a1-4c74-4f97-a116-3bc5a0b71cf1@suse.com>
 <CABfawhkyg+TVB-uc04OefDhOXEfeQyQypW6gL4qsYO3ZrDxYfQ@mail.gmail.com>
 <a0c50fb6-516a-4e0e-8c3b-49c4dbc7b863@suse.com>
 <f475354d-5df6-41a5-9928-519eaf4eb7b3@epam.com>
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
In-Reply-To: <f475354d-5df6-41a5-9928-519eaf4eb7b3@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.01.2025 12:29, Sergiy Kibrik wrote:
> 07.01.25 10:46, Jan Beulich:
>> On 06.01.2025 19:09, Tamas K Lengyel wrote:
>>> On Mon, Jan 6, 2025 at 10:10 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> On 06.01.2025 15:05, Tamas K Lengyel wrote:
>>>>> On Mon, Jan 6, 2025 at 5:16 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>
>>>>>> On 30.12.2024 07:30, Sergiy Kibrik wrote:
>>>>>>> From: Stefano Stabellini <stefano.stabellini@amd.com>
>>>>>>>
>>>>>>> Extend coverage of CONFIG_MEM_ACCESS option and make the build of VM events
>>>>>>> and monitoring support optional.
>>>>>>
>>>>>> Yet doesn't this end up in things becoming misleading? Don't we rather need a
>>>>>> 2nd Kconfig option, with a dependency between the two? Or alternatively a
>>>>>> rename of the existing option (to describe the higher-level feature rather
>>>>>> than the lower level one)? Tamas, I'm particularly interested in knowing your
>>>>>> view here as well.
>>>>>
>>>>> Thanks Jan, I was thinking the same thing. The dependency of these
>>>>> subsystems is mem_access -> monitor -> vm_event. If the goal here is
>>>>> to disable all three levels the ideal way would be to have separate
>>>>> kconfig options for each level. It may be a bit too fine-grained
>>>>> though on ARM since there are only two types of events for monitor
>>>>> (SMC & mem_access) and only the monitor uses the vm_event channel (no
>>>>> mem-sharing/paging on ARM). So if doing separate kconfig for each
>>>>> individual feature is an overkill I would suggest using
>>>>> CONFIG_VM_EVENT that disables all three levels, including both
>>>>> mem_access & smc monitor hooks.
>>>>
>>>> Except that "disables all three levels" doesn't work, unless the other
>>>> option(s) are promptless (and selected). I'd have expected VM_EVENT to
>>>> maybe have a "depends on MEM_ACCESS", whereas a "select MEM_ACCESS"
>>>> wouldn't make much sense as long as MEM_ACCESS can be enabled
>>>> individually (with it being unclear to me whether such a configuration
>>>> is actually useful in any way).
>>>
>>> Not sure I follow. None of these systems make sense to enable
>>> individually. Without vm_event monitor/mem_access are useless, that's
>>> why I would pick CONFIG_VM_EVENT as the option on ARM to disable all
>>> three levels if we don't want to start splitting it into multiple
>>> kconfig options (which I think may be an overkill here).
>>
>> Oh, okay, you suggest to replace MEM_ACCESS by VM_EVENT at the Kconfig
>> level. That would be fine with me, so long as it's also appropriate on
>> (in particular) x86. Then, if there was ever a 2nd use of mem-access,
>> MEM_ACCESS could be re-introduced as a standalone option.
> 
> Thanks Jan,
> would it be ok to replace MEM_ACCESS with VM_EVENT everywhere at once, 
> including in defconfigs and automation script etc? Or such changes would 
> better be done gradually, starting with changing Kconfig only?

Things need to remain in sync throughout the tree, so I don't think you
can leave out e.g. defconfigs when doing the renamed. Similarly stuff
under automation/ may need changing at the same time.

Jan

