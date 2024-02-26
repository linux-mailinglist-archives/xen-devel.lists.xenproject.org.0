Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 787CE866E8B
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 10:33:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685393.1066015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reXMJ-0008ME-SC; Mon, 26 Feb 2024 09:33:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685393.1066015; Mon, 26 Feb 2024 09:33:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reXMJ-0008Kz-Pd; Mon, 26 Feb 2024 09:33:15 +0000
Received: by outflank-mailman (input) for mailman id 685393;
 Mon, 26 Feb 2024 09:33:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1reXMI-0008K6-8u
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 09:33:14 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fc61232-d48a-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 10:33:13 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a3ed9cae56fso443169666b.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 01:33:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 nb18-20020a1709071c9200b00a3e45a18a5asm2239124ejc.61.2024.02.26.01.33.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 01:33:12 -0800 (PST)
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
X-Inumbo-ID: 0fc61232-d48a-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708939992; x=1709544792; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kYDgKBssLHkQ7Sh/vf+CUOrbYp1EF2ywVOlxW+i5b9M=;
        b=X30M8JO0atCMQeA0/7yqHlXucWLwW/+9wev4vgkMNLxzv9FdVXivMmF3QX9lTLhBFt
         bfjRVelluY5DCPdhJKFBlqNavEFUz28ILkoRuTX8zNM1CJUomi3mkmZPbPv9HN7iFBvz
         df6mw0tVLZ5yk8+8B1ek9MgEjb7sdops4aNlatYXmimmbl8H4Xo3VJEf9roqwFyvHzsi
         lMCkjgBTNs41+bii9SNctFIoQ3pTojzJthKoAlVLwa6hXAzUY55Yg7a4y7kRTJGIGtk8
         raB4M2RIvJHJpaofjzqeTdvKrGdz/7VZzkrPi39UBy084k7avgbdKmp7jwCNyJuqqUb3
         P5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708939992; x=1709544792;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kYDgKBssLHkQ7Sh/vf+CUOrbYp1EF2ywVOlxW+i5b9M=;
        b=H2kaOEpvfsDmO9jLsXrQhQDr+GypKRxUaA2/ZcOubXWsr+8o9ey79WLAKZklcJKWAw
         mBkE+qpLvXYee3CQUko7eB1+4bTgBacrIbExhJjf8ujzdoNSHP7AxSq95JtEb+hWT5py
         dzZi/SfZxCZNrbUrS6+E1uFiLSehztAcqxhvMJnz5nW726ihZ5j2q9i03pje1pCvQ1+c
         tsUh8CS1UjjhV5kmC1tp9uDJhx+SLaa1wTXKGSDmiuNKswV+hUfRsoS4EJsbYsHH5NQy
         1434WlfGZ4+p7hrMLiLDNxrG3vsoJhmUBNFw5dWaue0vafLOf1h/c6zJn6eD/A768sim
         rEGA==
X-Forwarded-Encrypted: i=1; AJvYcCV0gpUkRC7flRDHRk1hg040KhEP3UhM+lcTsUHkIuBKmXc4wDqUBDrfF9hdM647exY+PfPDSxpKrPWBMUal1ySCQtQ75bb7kscJ1anqozs=
X-Gm-Message-State: AOJu0YyIbBeaJ0skJEBZgtP3AwlqBhzbMOS16F3KwxjUUlC4u61bKL8W
	JThNNWV5EWmlUdJcJgxKcaJ+XEtJ3OT40xZwcte1+JgjNP0bEbhZHV6L75s8KQ==
X-Google-Smtp-Source: AGHT+IFNSKtUzNvkyQ8lVMaHPBT2fNKLD39TF/xfYVUTfKt0Eq1oWXdghil6rBJ9ZQ35gNJa/NNkdA==
X-Received: by 2002:a17:906:2844:b0:a3f:adad:9ce1 with SMTP id s4-20020a170906284400b00a3fadad9ce1mr5401009ejc.18.1708939992622;
        Mon, 26 Feb 2024 01:33:12 -0800 (PST)
Message-ID: <076cac3e-097a-4994-b68f-888b491c82a7@suse.com>
Date: Mon, 26 Feb 2024 10:33:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] x86/spec: fix BRANCH_HARDEN option to only be set
 when build-enabled
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240223120616.73503-1-roger.pau@citrix.com>
 <20240223120616.73503-3-roger.pau@citrix.com>
 <3dcb9afe-7f3f-495c-b182-b4242b4cb337@suse.com> <ZdxVQRMRyQOEc581@macbook>
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
In-Reply-To: <ZdxVQRMRyQOEc581@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.02.2024 10:09, Roger Pau Monné wrote:
> On Mon, Feb 26, 2024 at 09:42:58AM +0100, Jan Beulich wrote:
>> On 23.02.2024 13:06, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/spec_ctrl.c
>>> +++ b/xen/arch/x86/spec_ctrl.c
>>> @@ -50,7 +50,8 @@ static int8_t __initdata opt_psfd = -1;
>>>  int8_t __ro_after_init opt_ibpb_ctxt_switch = -1;
>>>  int8_t __read_mostly opt_eager_fpu = -1;
>>>  int8_t __read_mostly opt_l1d_flush = -1;
>>> -static bool __initdata opt_branch_harden = true;
>>> +static bool __initdata opt_branch_harden =
>>> +    IS_ENABLED(CONFIG_SPECULATIVE_HARDEN_BRANCH);
>>>  
>>>  bool __initdata bsp_delay_spec_ctrl;
>>>  uint8_t __read_mostly default_xen_spec_ctrl;
>>> @@ -268,7 +269,14 @@ static int __init cf_check parse_spec_ctrl(const char *s)
>>>          else if ( (val = parse_boolean("l1d-flush", s, ss)) >= 0 )
>>>              opt_l1d_flush = val;
>>>          else if ( (val = parse_boolean("branch-harden", s, ss)) >= 0 )
>>> +        {
>>> +#ifdef CONFIG_SPECULATIVE_HARDEN_BRANCH
>>>              opt_branch_harden = val;
>>> +#else
>>> +            no_config_param("SPECULATIVE_HARDEN_BRANCH", "spec-ctrl", s, ss);
>>> +            rc = -EINVAL;
>>> +#endif
>>> +        }
>>>          else if ( (val = parse_boolean("srb-lock", s, ss)) >= 0 )
>>>              opt_srb_lock = val;
>>>          else if ( (val = parse_boolean("unpriv-mmio", s, ss)) >= 0 )
>>
>> While looking at patch 3 I noticed another inconsistency: Wouldn't
>> "Compiled-in support:" better also enumerate HARDEN_BRANCH then, just
>> like for thunks both CONFIG_* state and actual runtime choice are
>> logged?
> 
> Yes, I guess we would also need to expand "Compiled-in support:" to
> include HARDEN_ARRAY and HARDEN_GUEST_ACCESS.
> 
>> Or alternatively, should logging of thunk runtime choice be
>> suppressed when the Kconfig setting is off?
> 
> Hm, I think printing "BTI-Thunk N/A" is good enough when the thunk has
> been built time disabled.

Good enough - yes. But redundant with the other log line. And since all
of this output is getting longer and longer anyway, omitting whatever
can sensibly be omitted might be at least worth considering.

Jan

