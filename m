Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B92CA4608B
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 14:18:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896584.1305330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnHJ6-0002KK-Uu; Wed, 26 Feb 2025 13:18:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896584.1305330; Wed, 26 Feb 2025 13:18:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnHJ6-0002HE-R7; Wed, 26 Feb 2025 13:18:36 +0000
Received: by outflank-mailman (input) for mailman id 896584;
 Wed, 26 Feb 2025 13:18:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J4Ti=VR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnHJ5-0002H8-MV
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 13:18:35 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ddae25b-f444-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 14:18:33 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-38f2b7ce2f3so4818023f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 05:18:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd86cc96sm5714016f8f.31.2025.02.26.05.18.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 05:18:32 -0800 (PST)
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
X-Inumbo-ID: 2ddae25b-f444-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740575913; x=1741180713; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=m+sRnJ1oLyaeh/EDeHmdD4iyN2BRp/J3qC0tMtpqODs=;
        b=faIvXFTqmL0NJr6Rvk524eTTCZDXGlIlAZ8my9BWYarvYiizmN2qPYHVJf8dwOCYHO
         R6bLajPc0rV4Ca4tq0YVlJxq8pBjw9eMWpshIYncFGYl7uGui6YPziJgaM6eUwiItxRk
         I0esdPlyz6cIIZgYoqUh92vSCeDF/+7niFmpbrz0eX0rjdCoE7uswbCBmBBIHxFTkdeE
         Scmx9SFgYQSqzUlgpj/EKYiWfnGO/nS54+63ZXYS0lk0eishtFKGKVZJupEwlezFDc0H
         Wrwoa4SS8hK4tWrUA3mXq49KQ7i16SU0rOvFT2fa4uasG2w9n3I2UATPhzm0Qp6rcpSM
         rFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740575913; x=1741180713;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+sRnJ1oLyaeh/EDeHmdD4iyN2BRp/J3qC0tMtpqODs=;
        b=m8Vq/QHwWXMfrGgQQe6xqwPiStgTohAIF6Y4ogMnflGZ8O6zboveK4knFmM1C7Gi0X
         sGgKBSRegZCWUvtMyG4FYvRGESMeGdVmmOzcYGyTYmNsojasM5NbyIZKkHPWloA6312h
         D/lrlCJNW3UvT1dL3IAxnliUQvmJzT4Ynr+Joxqo/nn+KkhFuIYQ2BNfTcRTtCto/BZp
         G9FcyI6hurbg65aJINx6cTAlCDiQ3U7M9hOACcgtn0c4Twu0vsWhZhjXd2l8QO9hbTTN
         NcWlbYw4xY+n9S2w6t4RUPqug/WCkEQA4ul4tymr4N3DOJ80hnZQLas3sXh3eriS76kI
         qgDg==
X-Forwarded-Encrypted: i=1; AJvYcCX9BdrJTP0Bxhnn9aEj16Wc1A6+b7bqyHS+VZnlzltTakiTrhkhNd8mgJkD4LHXa8nrhU62Dysc+GI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxgpskeYATPyaymmE4uueeLKwl4GQPghiAJwyJdmTb0sKMxHM1+
	BYucfKcrGi814zVqJEMcmLZYsYyimsny625rrXkHQEQNZm9hmmaGxlYVxXODKA==
X-Gm-Gg: ASbGncsp7rvMPqdJzLNqq9TJ4kHng7ge4uWsCCoq6+M/vjkW/0/QEK7snfg1brDvZp8
	cey+Pk9IZPXJdAmv+PgBa1J4dgmweunJtG0VVmOq5LWmEuTSFhPJICM5rfdg6HrdG7Fvn8PIX8g
	nW6AFAojr1kZQz1L9tu71VPoBy690koBIFhruYEUO09fPQp+rYwnngqzoMvf/DXhftqTYrcInh7
	kAAclYSsBAPozLS7oTAPc69/2lx4SVleGv9QRKZMwMUxdbi/8lIs7EUsSCVdIAH8xsd1YCfB6+Q
	ATwQAs8as6SNKFMKXsyE86YBaSofRfKqy8kJpGomCS5u6X8nAWMbx90mjA4xh/G34izBiJhrizD
	UjzXXeFGv9C0=
X-Google-Smtp-Source: AGHT+IEI48xLngQl8ANC6YVQQFd6NV11bvRaP4DrS/ezfLcBJexPJUGOoObBVvQvL6zAOKJbmiNr8A==
X-Received: by 2002:a5d:5987:0:b0:38a:88ac:f115 with SMTP id ffacd0b85a97d-38f70826511mr14153269f8f.34.1740575913203;
        Wed, 26 Feb 2025 05:18:33 -0800 (PST)
Message-ID: <10a1901d-bddc-4452-8ff2-2586f18215e0@suse.com>
Date: Wed, 26 Feb 2025 14:18:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] x86/IDT: Don't rewrite bsp_idt[] at boot time
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250224160509.1117847-1-andrew.cooper3@citrix.com>
 <20250224160509.1117847-8-andrew.cooper3@citrix.com>
 <46bc8ff4-f33a-4736-b1c9-00dfdec554b7@suse.com>
 <f62fa004-379d-4589-b4ea-ba0f0c5c99e0@citrix.com>
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
In-Reply-To: <f62fa004-379d-4589-b4ea-ba0f0c5c99e0@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.02.2025 13:53, Andrew Cooper wrote:
> On 26/02/2025 12:48 pm, Jan Beulich wrote:
>> On 24.02.2025 17:05, Andrew Cooper wrote:
>>> Now that bsp_idt[] is constructed at build time, we do not need to manually
>>> initialise it in init_idt_traps() and trap_init().
>>>
>>> The only edit needed to the bsp_idt[] is to switch from the early #PF handler
>>> to the normal one, and this can be done using _update_gate_addr_lower() as we
>>> do on the kexec path for NMI and #MC.
>>>
>>> This in turn allows us to drop set_{intr,swint}_gate() and the underlying
>>> infrastructure.  It also lets us drop autogen_entrypoints[] and that
>>> underlying infrastructure.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Thanks.
> 
>> The switching around of the #PF handler is of course getting in the way of
>> moving bsp_idt[] into .rodata.
> 
> {en,dis}able_each_ist() edits it at runtime too.

Oh, I had actually meant to add a condition upon CONFIG_AMD=n. The fields
could be set at build time as well, couldn't they?

Jan

