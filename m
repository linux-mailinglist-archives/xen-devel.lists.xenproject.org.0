Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58800B33DA5
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 13:06:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1092971.1448570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqV21-0006TV-TC; Mon, 25 Aug 2025 11:06:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1092971.1448570; Mon, 25 Aug 2025 11:06:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqV21-0006Rq-P1; Mon, 25 Aug 2025 11:06:33 +0000
Received: by outflank-mailman (input) for mailman id 1092971;
 Mon, 25 Aug 2025 11:06:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqV20-0006RS-Fs
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 11:06:32 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d74ab40-81a3-11f0-b898-0df219b8e170;
 Mon, 25 Aug 2025 13:06:30 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-afcb73394b4so599183066b.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 04:06:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61c311a767bsm4763224a12.2.2025.08.25.04.06.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 04:06:29 -0700 (PDT)
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
X-Inumbo-ID: 8d74ab40-81a3-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756119990; x=1756724790; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=J+rIITZGrZCtgU+05XVTyRVqsCzlMwy9FXnHzC1Ekz8=;
        b=GlD3uGSu40HvtKN5l6fwRACrWt6Q03Wam5UYKbCoQY/dFBXp95c6Fn3BR41JtYDpi8
         36kWn1c0m/dbx6xlG1KqE2zxPxN1bSsUCUu0uaPSEOXqtcTOltPSA6fup0hfA3WwER8J
         pXSoRFTtMe84ZW1CjeVq1Dt+gudKvqMzuEOLjNJdtUVVmuO09VjeD3c0u2j/8R17Ubbw
         qffBujcHgntHe9bY4c9xEFxMlf2GAiRY3qVUmKOhYXBGyUI/Ajkf9MbB9tWeALXobWEJ
         4BUIE8Gzn9bVTKz368acuB9mqlMIbyw7IXIwECJry+fFhFcQ3HCV5V1PljuZAiOi90GM
         IJ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756119990; x=1756724790;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J+rIITZGrZCtgU+05XVTyRVqsCzlMwy9FXnHzC1Ekz8=;
        b=dosXnlWNbK2C1MQ5OdQoFlkrbBFFjw2Ee8O7TQhkIIeb5+cQ/EXmhGj1aWfmN6dXZ6
         4b6ajscykk9/w0gIw/NYl6r4C0AD2gf20/dcSs7/Ml+Wv0AszD/FGkKyNQI3AVkNSw4P
         KPjxwdsxTnCsHsHs9P3yyGWV5Xv6dDhvwMmHb0UWB1llmTBuhvtgIQu9WKXoIdmMKWhO
         Exenj+dU6OqdQDomVqaTBpMV4P3lvQ4f6lmRS/mN0jm+YfImnH6kdNP0LU0f5Ze6tcgB
         PDSO6JvG0DRycDTu3eAqO23Vy4HPa6r3S4cX5WgRfQ0ZvgNz72U6FuFAKD9ObXIeUaBm
         eB4g==
X-Forwarded-Encrypted: i=1; AJvYcCVfGr5q59CDYJeIKY/Bx7EdBICF30AXjr1OJMmhhIrD+yUPbYoJLIY7eTRsueJ6IyhdEU9pTZpkuFY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzgZ9gmu54yP7v2+UhasEEmvon8DIZ90L3NDltxJyDYd4uNYe6+
	hxSf3PRDl7XjLiyqlQP7G8pxBpanCJtiJNSIMxBBdrT5w+oEMfrEuWFmcZev6f7gEg==
X-Gm-Gg: ASbGncup6kGDon2PDOUORY0cc1z/BRNfc+Oy2QNQMiQx0uJL3732hLJBu4tjulheM6c
	Y2gcQnKKj3VfpUs8Dvk6GxxW0WI1gCVtM7p4TUbz2cuSEl0gP2Bds1Xn7bon9ZSaLPSfi/ZOuaS
	a8sAMfXbvr1X09SF5IU19qWtXQjwh3wKUzEu8k9BrBvRlqD7DG6FTkK8ZFeQV6IqdvY4mhQYjHL
	PFNY/wkZEzhynGbRKGjmMrzvGoifON9/duhUCbEQXbOzaLyxSKIKWNvoBn8hbhNj+HrFXV9iUgk
	IVP1SCZBm2DbeeKQAz/IXMEYQ7Vfa0vc6YN2GeCcx6sYIeDHtrXqQ2sK2pXwFfu4DI1VMB+FKVm
	DMS+nD8WVics6q4evPeskLMC6bet83N0PW8ThBJd0ObCXpVQyvTbMBFxQMUNrmAuhvHI5Aj1LIy
	k57r+XrF8=
X-Google-Smtp-Source: AGHT+IFv4u2FFgxPvLNoTSyKkS2UtF898EtKaRo5wc0+pMyhY89j1xUg6DJRBj4gz3rtM+DML3xUlA==
X-Received: by 2002:a17:906:f583:b0:af8:f9e8:6fae with SMTP id a640c23a62f3a-afe2944693dmr1082913766b.46.1756119989570;
        Mon, 25 Aug 2025 04:06:29 -0700 (PDT)
Message-ID: <052e7926-f114-4b16-b197-8a4303f6b5d1@suse.com>
Date: Mon, 25 Aug 2025 13:06:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] EFI/runtime: switch to xv[mz]alloc_array()
From: Jan Beulich <jbeulich@suse.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Marek Marczykowski <marmarek@invisiblethingslab.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <41b7e14c-59ef-40f5-8c43-69bdc5fb4531@suse.com>
 <761b584a-51fb-403d-948e-3366501cea50@apertussolutions.com>
 <755dd957-514b-4316-82f5-3619c19cbb15@suse.com>
 <9f9f24f0-c16a-4f55-b3c2-a3f4b485c403@apertussolutions.com>
 <2d93e9a7-abef-4ef6-bcbc-9081661edb58@suse.com>
Content-Language: en-US
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
In-Reply-To: <2d93e9a7-abef-4ef6-bcbc-9081661edb58@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.08.2025 08:46, Jan Beulich wrote:
> On 14.08.2025 02:29, Daniel P. Smith wrote:
>> On 8/12/25 02:12, Jan Beulich wrote:
>>> On 12.08.2025 02:19, Daniel P. Smith wrote:
>>>> On 7/23/25 09:39, Jan Beulich wrote:
>>>>> Use the more "modern" form, thus doing away with effectively open-coding
>>>>> xmalloc_array() at the same time. While there is a difference in
>>>>> generated code, as xmalloc_bytes() forces SMP_CACHE_BYTES alignment, if
>>>>> code really cared about such higher than default alignment, it should
>>>>> request so explicitly.
>>>>
>>>> While I don't object to the change itself, I think this description is a
>>>> bit over simplification of the change. If the allocation is under
>>>> PAGE_SIZE, then they are equivalent, but if it is over the page size
>>>> there are a few more differences than just cache alignment. It
>>>> completely changes the underlying allocator. I personally also find it a
>>>> bit of a stretch to call xmalloc_bytes(size) an open coded version of
>>>> xmalloc_array(char, size).
>>>
>>> My take is that xmalloc_bytes() should never have existed. Hence why I
>>> didn't add xzmalloc_bytes() when introducing that family of interfaces.
>>
>> Right, which would be a valid argument for replacing it with 
>> xmalloc_array(). Though, I would note that there is an xzalloc_bytes(). 
>> My concern was that you stated there was an open coding, which had me 
>> expecting there was a line of the form, xmanlloc_bytes(count * 
>> size_of_something bigger), being replaced by 
>> xvmalloc_arryay(something_bigger, count).
> 
> Both fir this and ...
> 
>> IMHO, while the C spec does specify char as 1 byte and thus 
>> interchangeable, I would agree that from a contextual perspective, 
>> xmalloc_array() is the more appropriate call. The use of the allocation 
>> is a character array and not a chunk of bytes for an arbitrary buffer.
> 
> ... for this: Hence my wording using "effectively".
> 
>>>> With a stronger description of the change,
>>>
>>> So what exactly do you mean by "stronger"? I can add that in the unlikely
>>> event that one of the allocations is (near) PAGE_SIZE or larger, we now
>>> wouldn't require contiguous memory anymore. Yet based on your comment at
>>> the top I'm not quite sure if that's what you're after and/or enough to
>>> satisfy your request.
>>
>> The phrasing stronger was meant to be more clear on the change/effect, 
>> specifically that the underlying allocator is being changed when the 
>> allocation is greater than a PAGE_SIZE. Not necessarily a long 
>> explanation, just the fact that the allocation will be coming from the 
>> dom heap allocator as opposed to the xen heap allocator. There are 
>> implications to changing the allocater, e.g.,  at a minimum the 
>> allocation order and nonphysical vs. physically contiguous effects. 
>> Having it noted in the commit makes it more obvious what this change is 
>> actually doing. Which may not be obvious when seeing the simple line 
>> changes occurring in the diff. Later, if there is an unexpected 
>> consequence caused by this change, a stronger commit will be helpful 
>> with the bisection investigations.
> 
> First: I don't think each and every such change (there are going to be many)
> should re-explain the switch to the xvmalloc() family of functions. This is
> already stated clearly at the top of xvmalloc.h: Over time, the entire code
> base is meant to be switched.
> 
> Beyond that, to achieve the stronger wording you're after, would it perhaps
> suffice to have the first sentence say "..., thus also doing away ..."?
> Otherwise, may I ask that you please make a more concrete suggestion?

Ping. I'd like to get this in, yet I still don't know how exactly to satisfy
your request for a stronger description.

Jan

