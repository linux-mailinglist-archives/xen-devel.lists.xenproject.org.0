Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3359EC765
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 09:33:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854102.1267385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLI9a-0003AP-BZ; Wed, 11 Dec 2024 08:33:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854102.1267385; Wed, 11 Dec 2024 08:33:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLI9a-00038D-8y; Wed, 11 Dec 2024 08:33:06 +0000
Received: by outflank-mailman (input) for mailman id 854102;
 Wed, 11 Dec 2024 08:33:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HaM=TE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLI9Y-00036j-Tl
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 08:33:04 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8668a82a-b79a-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 09:32:58 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-434a742481aso55816195e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 00:33:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7fd332db74asm6210066a12.52.2024.12.11.00.32.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 00:33:01 -0800 (PST)
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
X-Inumbo-ID: 8668a82a-b79a-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733905982; x=1734510782; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=potnQE8cNDslURE4XZUisgZLG40sqRbJrJmKaGg8/6Y=;
        b=gPWbmlwH89Gx08Lu3MPMnICWugxnDr1QZEKP1ichypNJPONQVk7giFEYZQ7Yv23cjb
         3oqUoHVkwtcmSx29TFT69S2nwyodx15uqo6AwpA9Cb1mrHw1pol8nrtND9pLy18lk8FW
         x5YhAHQjmjrcWZwzXRFe1+1Y47EYbvU6heUbAAGJ6KLOX0CHMubeKxIzjUtiaz3N9RRI
         RbcjzLIChyXfETyNUxnWWcKBlB4R8VlZV7kxLyiCeGqA0ttcWdB/cDK+QZXU2X9V93nN
         J7Fq/TNWTXO6Z5famJhp72kYYuOurOqsfHSb0fHZhNLLCb4WnQhAdAY5XNFJ0OVonKQ/
         bG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733905982; x=1734510782;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=potnQE8cNDslURE4XZUisgZLG40sqRbJrJmKaGg8/6Y=;
        b=BInkg/xDXNXQsNrQMIF88gehKGj7bVWk2ZrXtBxX7AmKbLvzltPkCHIKknDWa8j+VI
         SLlNHrZjW090JXwgXfNM2dVXiZ6scH/31ht8hkDn97YKIio00QVbva0neNK2u1az3fHN
         C+xSbA62iiqh/4VIU4UaIS18ey0d9xFcfAAH2iCkC33/PVirZHofl/HqU20juS3fMi9D
         LNPX8w4JCwEGHqYBqt/rozjPQsz+kMw8aUt/8gT+RHSqGA5s6AuMNKW0sdX/p90fKz57
         mCZf5K9UtrOdBg7/xDihJv0GVQTZYsQOPBN3slOVkCUH7UqDtS0BiaMhUSIC6s3UHAp1
         K7Dw==
X-Forwarded-Encrypted: i=1; AJvYcCWtf3tPJ6RErW8HBYyNf1MA3JLqhS+5gIOsxIqXJ+Z7Anz8cMSP/H5c8h+t9ZLSBSCRP+NqwN5l5AM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyoxlQz5DfcD6C0n9j1weSVjN6n5R9UnVsf7EhiLqgYyGWnIRuT
	6t7BxsgyYBf19KACd5UNtSi0FCZrjueJCUCM4PEJ2fDq5mBUPUYsBTdkMCgi0w==
X-Gm-Gg: ASbGncs/SKaVofcY1rMM3x8n9gaJi9+GE7lDJZsejFb2AOWzqjsWq1uohtdKEapFbj9
	cTkJ+rJ2Ht0TWAZpO8C8Jnh5eHDes6cQ4q4jd2PnpT7Aj0XSlzYiOhKEtul3DIBRp9bEV0jP8Ju
	T4SVs7h1e1evWLvBG6MYEsozlMzJvBVYV2Vy9PBRYq3COxsx03R+ILEnlyDKOcSqzpcScOlHXoE
	oXzzGj9OBxwp3YNtmVYAQyEk2RXN80LDF1To4e0IUSpV3JLjArXPzIDeAYgNW0ree04mUCIl3qm
	Vq6tKzIstH7j0hzjoH0Dx6KsJczbkkhcVYdTHqM=
X-Google-Smtp-Source: AGHT+IGvV3H8by3kN9gkg5+hVtaSObhyhGye3WT6Uyla5YEWbw1O8MK/nlP9MRuZFBOpaGytJg8Vrg==
X-Received: by 2002:a5d:47c9:0:b0:386:1ba1:37dc with SMTP id ffacd0b85a97d-3864cea39ebmr1354595f8f.47.1733905982280;
        Wed, 11 Dec 2024 00:33:02 -0800 (PST)
Message-ID: <d11a7521-333f-4b0e-bc34-cd77a8cb673f@suse.com>
Date: Wed, 11 Dec 2024 09:32:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] xen: add new domctl get_changed_domain
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241206130221.17773-1-jgross@suse.com>
 <20241206130221.17773-6-jgross@suse.com>
 <69e08251-c227-42a5-a2e4-a4eb7d63961d@suse.com>
 <30304914-f0c5-4053-ae23-890fa5b8a0c2@suse.com>
 <fd1eedc4-652a-427e-9520-77a62f3047e0@suse.com>
 <c9e30b69-328a-47f5-abc4-02b5c3e379e8@suse.com>
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
In-Reply-To: <c9e30b69-328a-47f5-abc4-02b5c3e379e8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.12.2024 08:44, Jürgen Groß wrote:
> On 10.12.24 17:29, Jan Beulich wrote:
>> On 10.12.2024 16:52, Jürgen Groß wrote:
>>> On 09.12.24 18:04, Jan Beulich wrote:
>>>> On 06.12.2024 14:02, Juergen Gross wrote:
>>>>> --- a/xen/common/domain.c
>>>>> +++ b/xen/common/domain.c
>>>>> @@ -192,6 +192,54 @@ static void domain_changed_state(const struct domain *d)
>>>>>        spin_unlock(&dom_state_changed_lock);
>>>>>    }
>>>>>    
>>>>> +static void set_domain_state_info(struct xen_domctl_get_domain_state *info,
>>>>> +                                  const struct domain *d)
>>>>> +{
>>>>> +    info->state = XEN_DOMCTL_GETDOMSTATE_STATE_EXIST;
>>>>> +    if ( d->is_shut_down )
>>>>> +        info->state |= XEN_DOMCTL_GETDOMSTATE_STATE_SHUTDOWN;
>>>>> +    if ( d->is_dying == DOMDYING_dead )
>>>>> +        info->state |= XEN_DOMCTL_GETDOMSTATE_STATE_DYING;
>>>>
>>>> The public constant saying "dying" isn't quite in line with the internal
>>>> constant saying "dead". It may well be that Xenstore only cares about the
>>>> "dead" state, but then it would better be nemaed this way also in the
>>>> public interface, I think.
>>>
>>> Okay, I'll rename it to "XEN_DOMCTL_GETDOMSTATE_STATE_DEAD".
>>
>> Well, maybe have both DYING and DEAD, even if Xenstore right now needs only one?
> 
> Yes, might be interesting in the future.
> 
>>
>>>>> @@ -866,6 +873,15 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>>>>>                    __HYPERVISOR_domctl, "h", u_domctl);
>>>>>            break;
>>>>>    
>>>>> +    case XEN_DOMCTL_get_domain_state:
>>>>> +        ret = xsm_get_domain_state(XSM_XS_PRIV, d);
>>>>> +        if ( ret )
>>>>> +            break;
>>>>> +
>>>>> +        copyback = 1;
>>>>> +        ret = get_domain_state(&op->u.get_domain_state, d, &op->domain);
>>>>> +        break;
>>>>
>>>> Especially with this being a stable interface, surely the two padding fields
>>>> want checking to be zero on input (to possibly allow their future use for
>>>> something input-ish). Then even the memset() in the function may not really
>>>> be needed.
>>>
>>> I'll add the check. Removing the memset() is a little bit doubtful, as this
>>> might result in leaking hypervisor data e.g. in case a domain isn't existing
>>> (this will copy the internal struct to the user even in the -ENOENT case).
>>
>> Which internal struct? The function is passed &op->... for both parameters.
>> And op is fully copied from guest space.
> 
> Sigh. I shouldn't have answered so quickly while being deep into other
> topics. :-(
> 
> While I agree that the caller _should_ pass these fields zeroed, I'm still
> not sure we should rely on it.

You said you'd add the check. Then we not just rely on caller zeroing, but
we actually refuse non-zero fields there. And we fill all other fields.
Hence ...

> Do you insist on removing the memset()? If not I'd rather keep it.

... while I guess I wouldn't insist, to me such a memset() effectively
would count as dead code (for having no recognizable effect). And you know
what Misra thinks of dead code, even if strictly by their criteria this
wouldn't count as "dead". Yet it would violate the underlying principle of
there wanting to be a (functional) reason for everything there is.

Jan

