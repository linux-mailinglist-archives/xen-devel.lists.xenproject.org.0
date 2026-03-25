Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPaJHvbJw2lKuAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 12:41:42 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C1632410B
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 12:41:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262090.1554757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Mc8-0004aj-Rb; Wed, 25 Mar 2026 11:41:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262090.1554757; Wed, 25 Mar 2026 11:41:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Mc8-0004Yl-Of; Wed, 25 Mar 2026 11:41:32 +0000
Received: by outflank-mailman (input) for mailman id 1262090;
 Wed, 25 Mar 2026 11:41:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5Mc7-0004Yf-Cl
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 11:41:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5Mc6-00GRvB-Oz
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 12:41:30 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c3c9d9-2eae-0a2a0a5409dd-0a2a450c8356-32
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 12:41:30 +0100
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c3c9ea-f93d-0a2a450c0019-d155802abd67-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 12:41:30 +0100
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-486ff201041so44204965e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 04:41:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-487116f17f3sm118826675e9.1.2026.03.25.04.41.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2026 04:41:29 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774438890; x=1775043690; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vrnG1blid79MHtdcU5CENzTWQvRfwshseOaU/wz0hKA=;
        b=Rw+gLcS1cB2MAuf3SZyxoOMm+VvjDzUxQtftqhZJUFqEBqM5+ZoCO3V5+9sx+ktN+A
         bx/H8bo7Na4z/bn+Kl5JhFxspcGd6WC1dwxDRRRG0tfbH/NSIf8tO8WnRlGbXKxujFWy
         8btF0v4DavnS9105dNFXEb9qP2+7gyCyi7gf8mRuSaNfRCSqp7b725sd0pJJkIuwyDJ9
         jXY5HRrv2OUoJIJ94QqfJbA3jb7afzoVRIlXIBi7T0Q9dwEge8Y6Lh3eTOxt5ulSt8e1
         fP1loh5kbh3+73R9pjOXWJXmfYY8UG2/xVP4R4vLz7mhL8Ft08PBc+ynwhJb94woeGpg
         I6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438890; x=1775043690;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vrnG1blid79MHtdcU5CENzTWQvRfwshseOaU/wz0hKA=;
        b=ht2TvUEdKF4ra0syqzrnSZ50cA33qYJYUmaNwsqLzEr4O+hzimFwc8QiOvwfKXwZ3X
         1s+IFUpryAgRlPoBNxJtw9P3fK7tTK+OLHnF+Yxu7WYnLVctyVd9MR/pugKRes4M9yue
         qp0lOdEvlgjExWjBHdr2J2UvXBuWlEMhsAZp47MYCGWxBi+d9qaq8XbF52vuPi0KfSrd
         UolbXvX/Hk14Gwt/73RCSWU/MF/iC0kL6QyCqUTOTxWGSw/qdrVblQfL/SPA2kcghqmI
         yo29IZaTPNsOBIMfIE1JgkUbJveQMVWepPx2RMLCgM/QFao9VLxu9Bzd09jPsL79muxq
         17aQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2uD3bi//A9p6MbTVQyJeqnq3B+O8UCZoc7l6ep8b5H6iwu6DL37OhvmNsoY96GwpkMee7Bn907SU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz+8lN9UEEuAxG6xBhEk5VcCbvpjm91jY3EYkGvOCFoYVwg744N
	vSV++2K9p8WAi45PvEFWg9cPJaDpA3tjFU0fNMYc0wJux3tZHBcm1LYirbE8QXwyx69YJP/2YQm
	HXMuBKg==
X-Gm-Gg: ATEYQzzNn4tKGnhmpu7nQyicRXaSD9TumUpQTVF1nA81FeO2g00wIrKxuQa7qoJyQrE
	bQOnxurW3nyeLOxSTUC6aDSw4Pu+6+gEq6wA3Uhg/BhDuSuNoHYPxZ0jReqCNCEV+/igQc61D1L
	Ch7LAW/tk1lwlk/QwNyTihd2IUldMF9KxxQGWgzV2LFiXsleTHu5LgexOTEzkEF7peP1WltIMEp
	CtXJsBmJF4oHNjleoGJtjIwRPW4bgOX1GBmQPeGh2LnrWGfPpJc9JxpvzEt0lRUFCcaRnuu+jXm
	mzsa5Tuo8G2Fbuf0pDTgKjQl0N3Zk7PicXHk795cJ15Nyze2gAFmU8ih1r5vOpYRo2qyfLVicpy
	6fP3uWR87HUKSnhLzFn9VFlc9GirxuFOO5YY5Pc/Mwrp1CPYHEnj1fR5ze75FkjAzwnXXCaSDsH
	WXljwd1ux/WQ4H3kNqAjLiN/IVyQCLbKmCNux83ACnK5L9gW4WT6gimSSnd16ng4mimFOGSZQJO
	aQ/tgk6rtb4X2w=
X-Received: by 2002:a05:600c:1d0e:b0:485:3ec6:e634 with SMTP id 5b1f17b1804b1-48715febda2mr46101175e9.15.1774438889929;
        Wed, 25 Mar 2026 04:41:29 -0700 (PDT)
Message-ID: <ab2802f8-1253-4be4-a4c8-5094d7378a8f@suse.com>
Date: Wed, 25 Mar 2026 12:41:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] x86: Define some Intel vPMU leafs
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1773160025.git.teddy.astie@vates.tech>
 <83a573dcb365761c0f089325365090b6f963fb03.1773160025.git.teddy.astie@vates.tech>
 <d7438af9-1aad-446b-bd80-7d9e8f955cdc@suse.com>
 <690ad4c0-d9b1-45ec-8634-f8c002c0282a@vates.tech>
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
In-Reply-To: <690ad4c0-d9b1-45ec-8634-f8c002c0282a@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1774438890-F6AAD734-6A79268A/0/0
X-purgate-type: clean
X-purgate-size: 2514
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E5C1632410B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 25.03.2026 10:48, Teddy Astie wrote:
> Le 24/03/2026 à 10:25, Jan Beulich a écrit :
>> On 10.03.2026 17:44, Teddy Astie wrote:
>>> --- a/xen/include/xen/lib/x86/cpu-policy.h
>>> +++ b/xen/include/xen/lib/x86/cpu-policy.h
>>> @@ -162,7 +162,15 @@ struct cpu_policy
>>>               uint64_t :64, :64; /* Leaf 0x9 - DCA */
>>>   
>>>               /* Leaf 0xa - Intel PMU. */
>>> -            uint8_t pmu_version, _pmu[15];
>>> +            struct {
>>> +                uint8_t /* a */ version, num_gp_ctrs, gp_ctr_width,
>>> +                                event_enum_length;
>>> +                uint32_t /* b */:32;
>>> +                uint32_t /* c */ fixed_ctr_mask;
>>> +                uint32_t /* d */ num_fixed_ctr:5, fixed_ctr_width:8, :1,
>>> +                                 anythread_depreciation:1, slots_per_cyc:4,
>>> +                                 :13;
>>> +            } pmu;
>>
>> Style-wise this looks to follow e.g. the cache leaf, so perhaps okay, even
>> if I would have preferred you to follow what we did for leaf 6. 
> 
> My idea was to put all that as .pmu.*, so I wouldn't need to prefix 
> everything with "pmu_". I'm not sure if you're talking about a different 
> approach.

The "pmu" is fine. I'm talking of what's inside the struct {}.

>  > The named> boolean field, however, wants to be of type bool.
> 
> Which fields ?

There's only one named 1-bit field: anythread_depreciation.

>  > And then the unnamed 1-bit> field really wants to be 2 bits, for 
> anythread_depreciation to be bit 15
>> (etc).
>>
> 
> Ah yes thanks, I got confused with the fields size for a second.
> I also found that slots_per_cyc is 3 bits instead of 4.

Not as far as I can see.

> I think this diff fixes it overall.
> 
> --- a/xen/include/xen/lib/x86/cpu-policy.h
> +++ b/xen/include/xen/lib/x86/cpu-policy.h
> @@ -167,9 +167,9 @@ struct cpu_policy
>                                   event_enum_length;
>                   uint32_t /* b */:32;
>                   uint32_t /* c */ fixed_ctr_mask;
> -                uint32_t /* d */ num_fixed_ctr:5, fixed_ctr_width:8, :1,
> -                                 anythread_depreciation:1, slots_per_cyc:4,
> -                                 :13;
> +                uint32_t /* d */ num_fixed_ctr:5, fixed_ctr_width:8, :2,
> +                                 anythread_depreciation:1, slots_per_cyc:3,
> +                                 :11;

Why 11 all of the sudden?

Jan

