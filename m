Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3883E9F4B7E
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 14:04:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859105.1271255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNXEz-0006Pa-9q; Tue, 17 Dec 2024 13:03:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859105.1271255; Tue, 17 Dec 2024 13:03:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNXEz-0006Md-7H; Tue, 17 Dec 2024 13:03:57 +0000
Received: by outflank-mailman (input) for mailman id 859105;
 Tue, 17 Dec 2024 13:03:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pb9=TK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tNXEx-0006MV-NX
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 13:03:55 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e159de7-bc77-11ef-99a3-01e77a169b0f;
 Tue, 17 Dec 2024 14:03:53 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-38789e5b6a7so2764944f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 05:03:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4362571765dsm172671005e9.39.2024.12.17.05.03.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 05:03:52 -0800 (PST)
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
X-Inumbo-ID: 5e159de7-bc77-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734440633; x=1735045433; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0Tx//nhSsC/rjBSOwoSPe589fRi2I/odBiAKV3gjhWE=;
        b=VpKuZIb3Bdhw5xRw1ljCqSPoTLOAPg+20B7AKn1HAiAN6Gt8gJSTreY2MZcyjiuVqo
         KOGfrOkTaTVhaZQwEIUf87Q5XU5U3+ElDKV3oLhl5B3isM3up5zGhrUP1hGE8UZ59u20
         5IWsLbTUPECehPuVP0wDWOtjDfY/LLlXvOL5Zi75DC2sd/vPdliBYEgZvrS8Gdk3cg1K
         blXzkT3fYw1N9FBOzsSQXKgqhNp6QoC12qjwh5Z5g42FtSAGjRbTPgfuaSlmViwhjSjz
         pUz+YjaSWAuMPzF9dw7G0MdF1xwx0spOac7zMAHkMWL4AZc9609knKP2/z7pbhOGUx6a
         n7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734440633; x=1735045433;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Tx//nhSsC/rjBSOwoSPe589fRi2I/odBiAKV3gjhWE=;
        b=RphqrRND5uKWpkZlcFt5kcBm85BxLF+dUmeOthIhT7s0LDHGIEJIur89IAOU4m3NKm
         LAEtnt6h8UR4MLdwlzK/CrQoy7i0qaatvst7lGNIDh55rxMDt7dAx1VEd7h6TGDtoZ9m
         IRyMDzZyHnZQjloZI3u4LnvQZbKVcE4F225X+UBbBNqw0XP8FVDTc1eI3sdV4DCyuNl0
         UeAZiNXCgZaGr3dhNfdt/MjMxIsq6IAo3sPq6meSpdkYXf3WJfptyiVKL/oO9/QKrH6f
         +ZK9YiJxuvh+EFRHD39xlUObC4+YSue2zkBORPO5uApsRaqNwMW238Ii7gAYjaZbHthG
         e6Yw==
X-Forwarded-Encrypted: i=1; AJvYcCU0Yw8z8GkFC8lQJhGXP/F1n/GB7pkLrgJUG4v5gmj3SPl3dNd2viskRuOcVwxOyUzyiYbQzYqVTro=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwlWNLgxn/2BeLeTBtxGLEzrjMsddXxkRQZcjJqj2DJGrMJo+9J
	j6Dlzwyln2tVe6Q3I6xnawWPwVexgX9PypPYh8HMgAU0Iz4R4lKlmmDHfCOHjQ==
X-Gm-Gg: ASbGncvanKJEeTdrI2Jvh7yeuuS4Apou0nG6+Uus9sDszsF+t9XjyOCOkAaJqQS03Lp
	Z1Ctdsg8fR6SgknpGN581BcOcbZ/skaYcwyA+fYUaJFUHKb6afO/b5ZUar7s+tM/zXa/VlkXMTN
	7LLX3/ai/elgShgprkA6bz5k9GYdsMZfs7+A/jjJWj2drLhGUMIyti/4CZ0JN3VGF86Bk5ff2a8
	tcHkw3FWb4RArivPjQt8TtB5KehrKt36TS1ogOPhvaI7S8BLLS68b/SBTV2Zf9fkIdWg+c1UHYV
	zGkjfpbVVFRXgWgiqjFiMXGZgUOFZXsddN44W2TvwA==
X-Google-Smtp-Source: AGHT+IHPatGOwWRL7lQpVHYNQnI8RaSAJ71c693f+a3fXtP3DQJn/Wkbu823noYe0epWqTTa/RxnPA==
X-Received: by 2002:a05:6000:4710:b0:386:1cd3:8a0b with SMTP id ffacd0b85a97d-3888dcd467fmr12717208f8f.17.1734440633267;
        Tue, 17 Dec 2024 05:03:53 -0800 (PST)
Message-ID: <452794f6-e02c-4dcc-bca4-2147a0cfb512@suse.com>
Date: Tue, 17 Dec 2024 14:03:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] xen: add bitmap to indicate per-domain state
 changes
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241217111247.2204-1-jgross@suse.com>
 <20241217111247.2204-3-jgross@suse.com>
 <c2b9fb7a-cb45-4914-9d74-5933317737d3@suse.com>
 <f681d00f-6ef6-41c6-bf3c-ad2dfd6da183@suse.com>
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
In-Reply-To: <f681d00f-6ef6-41c6-bf3c-ad2dfd6da183@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.12.2024 12:59, Jürgen Groß wrote:
> On 17.12.24 12:30, Jan Beulich wrote:
>> On 17.12.2024 12:12, Juergen Gross wrote:
>>> V4:
>>> - add __read_mostly (Jan Beulich)
>>> - use __set_biz() (Jan Beulich)
>>> - fix error handling in evtchn_bind_virq() (Jan Beulich)
>>
>> I'm sorry, I should have spotted a 2nd issue already when reviewing v3 (or
>> even an earlier version).
>>
>>> @@ -138,6 +139,60 @@ bool __read_mostly vmtrace_available;
>>>   
>>>   bool __read_mostly vpmu_is_available;
>>>   
>>> +static DEFINE_SPINLOCK(dom_state_changed_lock);
>>> +static unsigned long *__read_mostly dom_state_changed;
>>> +
>>> +int domain_init_states(void)
>>> +{
>>> +    const struct domain *d;
>>> +    int rc = -ENOMEM;
>>> +
>>> +    spin_lock(&dom_state_changed_lock);
>>> +
>>> +    if ( dom_state_changed )
>>> +        bitmap_zero(dom_state_changed, DOMID_FIRST_RESERVED);
>>
>> This needs to not happen when ...
>>
>>> @@ -485,11 +486,21 @@ int evtchn_bind_virq(evtchn_bind_virq_t *bind, evtchn_port_t port)
>>>       if ( (v = domain_vcpu(d, vcpu)) == NULL )
>>>           return -ENOENT;
>>>   
>>> +    if ( virq == VIRQ_DOM_EXC )
>>> +    {
>>> +        rc = domain_init_states();
>>> +        if ( rc )
>>> +            return rc;
>>> +
>>> +        deinit_if_err = true;
>>> +    }
>>> +
>>>       write_lock(&d->event_lock);
>>>   
>>>       if ( read_atomic(&v->virq_to_evtchn[virq]) )
>>>       {
>>>           rc = -EEXIST;
>>> +        deinit_if_err = false;
>>>           gdprintk(XENLOG_WARNING, "EVTCHNOP failure: error %d\n", rc);
>>>           goto out;
>>>       }
>>
>> ... we take this error path. Which I think calls for moving the
>> domain_init_states() invocation ...
>>
>>> @@ -527,6 +538,9 @@ int evtchn_bind_virq(evtchn_bind_virq_t *bind, evtchn_port_t port)
>>>    out:
>>>       write_unlock(&d->event_lock);
>>>   
>>> +    if ( rc && deinit_if_err )
>>> +        domain_deinit_states();
>>> +
>>>       return rc;
>>>   }
>>
>> ... somewhere here. It really doesn't need doing early, as the caller
>> may assume the bitmap was set up only when this hypercall returns
>> successfully.
> 
> OTOH this will require undoing the binding of the virq in case of an
> error returned by domain_init_states().
> 
> It would probably be best to place the call of domain_init_states()
> after the -EEXIST case.

Hmm, right.

Jan

