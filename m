Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4CEA47696
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 08:29:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897825.1306452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnYKo-0000DE-8e; Thu, 27 Feb 2025 07:29:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897825.1306452; Thu, 27 Feb 2025 07:29:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnYKo-0000BS-5i; Thu, 27 Feb 2025 07:29:30 +0000
Received: by outflank-mailman (input) for mailman id 897825;
 Thu, 27 Feb 2025 07:29:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MKxr=VS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnYKl-0000BH-UI
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 07:29:27 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 930a5ada-f4dc-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 08:29:27 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-438a3216fc2so5988365e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 23:29:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47b7d12sm1143612f8f.58.2025.02.26.23.29.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 23:29:24 -0800 (PST)
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
X-Inumbo-ID: 930a5ada-f4dc-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740641366; x=1741246166; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Qruc0VNZsQyWYlALDSXFdpTPCtDkJX+rm0zqgaFCBHw=;
        b=NrKIKbsyasDopBIhCsHsoVULi1bgyfnLQWMGzSeZILxqYCY4wDDg37oqDiYj/F2JJ/
         UmQf80WxJHL+uxA6jJv35Idtu0OHiqndLUSHGQWWkd3TjNqIoXq3LEl5Wz1BTc4szq6C
         Exu1G58yoJ0YOekC7f/ynT1/Kzhdkh5kyZlKPoHHfrA3BI1bJNjjFZUl2Pt0WCHHoQ+4
         ReDyJJmYO2XLFNAPwwivEG87V/czMtq79WJJAiYn1SxwDb3fJ6JKWKWbPzJX2BFjd/XS
         X2ha+OCFKMZo9MW45vhEEymc74hV9hRsuGBfu8+p1NPRPhJuO+t4nnvmebTRy0o2xgwG
         dTAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740641366; x=1741246166;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qruc0VNZsQyWYlALDSXFdpTPCtDkJX+rm0zqgaFCBHw=;
        b=E3Gt1496jfRSaVJhCUvL3Q2AtoB3dRsYIhZm0EEFBt1mkRah6O3PhgHCC0ZJGnfxyK
         Ukb7jdRM8ATWsaxl7+LP9KMFi66h+46AI0IZsk29qRe3WaQ2FSD7afIHTbxoaYgc3toG
         NqqX55vj6TtOFdj7q4FZboQFyk47OlB0jtgCporh+xs6rcYa2pvIDJ/65R28V13BYPc+
         S1564BgbIAI/nUR51A+lnb3gIFAMM4wRHF4q2UGpQW5zpmlpEre75lvy1OgjBBzMpzvp
         BN2GYdpJcz7JP74RT37uDyWCPQ30B8XYnJF6BU/Ezg32u6F9ovzhm7a7UB7B33Ba5A31
         4IUw==
X-Forwarded-Encrypted: i=1; AJvYcCUFN7Z2h8OG4Fuoryl3SF2Ph51Vq+uq65YjrhbYWiY8afg4ke+tw+pSqRDjgMm+84LXgHYnZYwvEFI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz4XncLJRVjoop/GJ/bE19XQmJq8c+2Ve6UfQanQW4IFqpm+zgE
	sUjScQfeSIfDqtkbzYYi98HngcpM18JePuC/yGvEaFiqzklfb1gFyBzUh9VvNQ==
X-Gm-Gg: ASbGncvv0U2eWJsJ5KQKIKEVQQl6wRsITqpWCMg7Pcx7sfMsLRoL7A9y+cA15C2gUJG
	IPujq/kn31BNQmQ9tJmFQPoNSA8nGnbuEREnLcWhyojv8C910dzfuCzx3JhT1yTTk+51oyE6tOt
	ZZxPKy7GqtFiZAZqgAfRm/0DTE2/Hnq3oHJAdKJrCc4FCyG9Rc9WW5wtrUDFC7IrUY48U0aycxq
	1TTD0wGiPeqtDymETKK8O6kf1JeRmOoMiPgtT7sF9re3qaDbD+PJaQBvM7kT0nv5Nr7+QSKwI4H
	4zKe0G+3XvA8MljUnXiheiNhKQ48TKUj+yJxrZYs5SDdxsuSWxwaU/7FDEkPQEPfDx+mQvq5O5V
	fQVRIHC36798=
X-Google-Smtp-Source: AGHT+IH5gNuljvdnAumxdvC9L/BSoMfYXVzZ3se37OB3p2wjQ64ykWiAx3g4jGgbBQf4SV9YBd22hw==
X-Received: by 2002:a05:600c:5117:b0:439:8829:aa69 with SMTP id 5b1f17b1804b1-439aeb3556cmr212498505e9.17.1740641365248;
        Wed, 26 Feb 2025 23:29:25 -0800 (PST)
Message-ID: <256285aa-d4a5-4735-b8bf-68fccd912c83@suse.com>
Date: Thu, 27 Feb 2025 08:29:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm: Add APIC IDs to the per-vLAPIC save area
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250218142259.6697-1-alejandro.vallejo@cloud.com>
 <1de43f95-5ed1-46c1-a157-094ceb84ac83@suse.com>
 <Z79Qe3kMS18P6JNQ@macbook.local>
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
In-Reply-To: <Z79Qe3kMS18P6JNQ@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.02.2025 18:33, Roger Pau Monné wrote:
> On Wed, Feb 26, 2025 at 02:11:23PM +0100, Jan Beulich wrote:
>> On 18.02.2025 15:22, Alejandro Vallejo wrote:
>>> Today, Xen hardcodes apic_id = vcpu_id * 2, but this is unwise and
>>> interferes with providing accurate topology information to the guest.
>>>
>>> Introduce a new x2apic_id field into hvm_hw_lapic.  This is immutable
>>> state from the guest's point of view, but it will allow the toolstack to
>>> eventually configure the value, and for the value to move on migrate.
>>>
>>> For backwards compatibility, the patch rebuilds the old-style APIC IDs
>>> from migration streams lacking them when they aren't present.
>>
>> Nit: "when they aren't present" looks to duplicate "lacking them"?
>>
>>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>>> ---
>>> I've split this one from the rest of the topology series as it's independent
>>> and entangled with another patch from Andrew.
>>
>> Albeit I think meanwhile we've settled that the entangling isn't quite as
>> problematic.
>>
>>> @@ -1621,6 +1624,14 @@ static int cf_check lapic_load_hidden(struct domain *d, hvm_domain_context_t *h)
>>>          return -EINVAL;
>>>      }
>>>  
>>> +    /*
>>> +     * Xen 4.20 and earlier had no x2APIC ID in the migration stream and
>>> +     * hard-coded "vcpu_id * 2". Default back to this if we have a
>>> +     * zero-extended record.
>>> +     */
>>> +    if ( h->size <= offsetof(struct hvm_hw_lapic, x2apic_id) )
>>> +        s->hw.x2apic_id = v->vcpu_id * 2;
>>
>> While we better wouldn't get to see such input, it is in principle possible
>> to have an input stream with, say, half the field. Imo the condition ought
>> to be such that we'd make the adjustment when less than the full field is
>> available.
> 
> I would add an additional check to ensure _rsvd0 remains 0, to avoid
> further additions from attempting to reuse that padding space.
> 
> if ( s->hw._rsvd0 )
>     return -EINVAL;

I agree we want such a check; I actually should have pointed that out, too.
I don't, however, see why the field couldn't be re-used going forward (under
the right conditions, of course).

> In fact I would be tempted to overwrite the ID if the stream size
> doesn't match the expected one, ie:
> 
> if ( h->size < (offsetof(struct hvm_hw_lapic, _rsvd0) +
>                 sizeof(s->hw._rsvd0)) )
>     s->hw.x2apic_id = v->vcpu_id * 2;

Hmm, yes, perhaps better to be yet more safe here.

Jan

