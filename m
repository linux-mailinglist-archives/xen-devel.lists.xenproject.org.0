Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A312A0478B
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 18:06:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866712.1278057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVD24-0001Uo-1j; Tue, 07 Jan 2025 17:06:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866712.1278057; Tue, 07 Jan 2025 17:06:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVD23-0001SR-V0; Tue, 07 Jan 2025 17:06:19 +0000
Received: by outflank-mailman (input) for mailman id 866712;
 Tue, 07 Jan 2025 17:06:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVD23-0001S5-Cs
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 17:06:19 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b57a56f6-cd19-11ef-99a4-01e77a169b0f;
 Tue, 07 Jan 2025 18:06:17 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-436a03197b2so60757075e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 09:06:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43661289d3dsm609984495e9.41.2025.01.07.09.06.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 09:06:16 -0800 (PST)
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
X-Inumbo-ID: b57a56f6-cd19-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736269577; x=1736874377; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ghp1tnPKNVu7zUuOehlMLLhbDPQRrAhgyG7OKOH4ba8=;
        b=OlLMq0gMtMwyBLIFOl5RxEI838BPWW3grSdYnDiV+DPrNwyp1D+6oR7xAlRKIy66Qs
         QPu2cm1cpN93p7oKsE0CPJT5iGP8kWz3HLF6GIRyFn4/BDQBNECPTFIzMp6PYyOnVqqq
         aCQGRdw1YTSRoDV92kS46ZG/QI101wT7nFi6cKCXtyhTaj2MU/AcQXGndwu4Ole3Cw67
         dy50QUrFp5gt9Aw/R23DyDvMhjCZOaij1CY9b2g5/HbDpNDKG5tbnL+RSbmrrR1YFM/8
         c3hvQMrgmYKsH+jGUfhugLWus1kuOGsYC13PmlMgphTjj9SSXUmWoH6L7YoYqsU6zBS9
         m2Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736269577; x=1736874377;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ghp1tnPKNVu7zUuOehlMLLhbDPQRrAhgyG7OKOH4ba8=;
        b=q61F0XhV6CtDz7mkwVX2np0Yb2EyiljHRsEDdQCSGKlVLToK8wQxwhu05jPIFjvwwU
         bUZD0vFy13N3VXr3I/qyRKq7ROOTeXdUXCe5eaDjGN1CWAXqd7PzkpyR98E5cOb7HISX
         yBbbpEVocaUcRf6v1qIfTMMMCV9vN00FbTSUeWA24OmikPJ4zV94TVDOgErb2h31jGMn
         aKNL2yE4MEy0LdEexV7dAeYR3Gd94PfIqSqZCF+BqpGjcdJlu54C4/b4KqJ3nW7Etjeq
         s7ESigmt4MVY4j5+OZmQ++HMlfxyPKmyoVnD+IKtocLgRcELkKyfSiS6nRYW9ksMFCkq
         REzA==
X-Forwarded-Encrypted: i=1; AJvYcCXTGSIYtOog8eIzSQ42moaI/RSqFOz8RhSVoOZMYh0ApbyC4zWo9IwZ1ys6HIDc1G3pi4Ifh08l2cY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwgT7kbE9BUuqhMIclVRx/olEX8U8DYIL0hfNW2DiGFJ0iEv2Jk
	ImbiqEqENADgay7DyggcKGRr1sxLJBEDxhS63MMZ+OHZRwWBq2dL59Vv7hmvRg==
X-Gm-Gg: ASbGncuD5rqhoiH3DkC23HZXLSNu7DV9XuqpfjJ+RCtaBa+aLI2/rqyzfwiPAPC9JKg
	d5CTKQ4YhRlkADvX9CGafOWBLZ5v069dP5aLYR+hw26w/vKrYp4/Ge++uWQ4P51chvEke198cTF
	o1V3imB48pqVj1sloBTKSIbnTzaMmOt73qlRt8suyvRLP/ubpR309e5BtgeinR2uFNv/8BRzW91
	jbeQgqdmUIvsNoBcRAAkI0bObkDPEE/S4i7YEa8b7NAEUdyg2uG+wmOrNES9E3zgMpoFYSXPSz/
	zz58Uk9F9ScNp0/+soDgEssH/Z1PCd6teAzbjJqs9A==
X-Google-Smtp-Source: AGHT+IHssG3ly+sL0zY5U0k3layizvl3ZrapHncu3hA/2DfK2lnYVTIb7YRLvcrax12rPnLrq4XHyw==
X-Received: by 2002:a05:600c:470a:b0:434:e9ee:c1e with SMTP id 5b1f17b1804b1-43668b7a33dmr580595705e9.31.1736269576923;
        Tue, 07 Jan 2025 09:06:16 -0800 (PST)
Message-ID: <099376ce-0cd7-423a-b3fe-d9e0a8505c85@suse.com>
Date: Tue, 7 Jan 2025 18:06:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/7] xen: add new domctl get_changed_domain
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250107101711.5980-1-jgross@suse.com>
 <20250107101711.5980-6-jgross@suse.com>
 <781daba7-5d6f-4d86-bce4-c5aa9d135513@suse.com>
 <81221a18-d6f8-418d-841a-8aa43420df09@suse.com>
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
In-Reply-To: <81221a18-d6f8-418d-841a-8aa43420df09@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.01.2025 17:48, Jürgen Groß wrote:
> On 07.01.25 17:28, Jan Beulich wrote:
>> On 07.01.2025 11:17, Juergen Gross wrote:
>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -185,6 +185,76 @@ static void domain_changed_state(const struct domain *d)
>>>       unlock_dom_exc_handler(hdl);
>>>   }
>>>   
>>> +static void set_domain_state_info(struct xen_domctl_get_domain_state *info,
>>> +                                  const struct domain *d)
>>> +{
>>> +    info->state = XEN_DOMCTL_GETDOMSTATE_STATE_EXIST;
>>> +    if ( d->is_shut_down )
>>> +        info->state |= XEN_DOMCTL_GETDOMSTATE_STATE_SHUTDOWN;
>>> +    if ( d->is_dying == DOMDYING_dying )
>>> +        info->state |= XEN_DOMCTL_GETDOMSTATE_STATE_DYING;
>>> +    if ( d->is_dying == DOMDYING_dead )
>>> +        info->state |= XEN_DOMCTL_GETDOMSTATE_STATE_DEAD;
>>> +    info->unique_id = d->unique_id;
>>> +}
>>> +
>>> +int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
>>> +                     domid_t *domid)
>>> +{
>>> +    unsigned int dom;
>>> +    int rc = -ENOENT;
>>> +    struct domain *hdl;
>>> +
>>> +    if ( info->pad0 || info->pad1 )
>>> +        return -EINVAL;
>>> +
>>> +    if ( d )
>>> +    {
>>> +        set_domain_state_info(info, d);
>>> +
>>> +        return 0;
>>> +    }
>>> +
>>> +    /*
>>> +     * Only domain registered for VIRQ_DOM_EXC event is allowed to query
>>> +     * domains having changed state.
>>> +     */
>>> +    if ( !domain_handles_global_virq(current->domain, VIRQ_DOM_EXC) )
>>> +        return -EACCES;
>>> +
>>> +    hdl = lock_dom_exc_handler();
>>
>> Instead of leaving a small window for races between the if() and this
>> function call, can't you simply compare hdl against current->domain?
> 
> Good idea.
> 
>>
>>> +    while ( dom_state_changed )
>>> +    {
>>> +        dom = find_first_bit(dom_state_changed, DOMID_MASK + 1);
>>> +        if ( dom >= DOMID_FIRST_RESERVED )
>>> +            break;
>>> +        if ( test_and_clear_bit(dom, dom_state_changed) )
>>
>> As this is now running under lock, does it really need to be test-and-clear?
>> What mechanism would allow the flag to be cleared between the find-1st and
>> here? Plus, like for patch 4, I think it could be __clear_bit() here.
> 
> It is only under read_lock(), so there are concurrent calls possible.
> I don't think we want to use write_lock() here, do we?

Probably not; I have to admit I didn't even pay attention to this aspect.
Then the set_bit() in domain_changed_state() also need to remain as is (in
patch 4 I think it was).

Jan

