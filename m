Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66139A056F2
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 10:34:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867035.1278437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVSS0-0005BL-5e; Wed, 08 Jan 2025 09:34:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867035.1278437; Wed, 08 Jan 2025 09:34:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVSS0-00058L-2E; Wed, 08 Jan 2025 09:34:08 +0000
Received: by outflank-mailman (input) for mailman id 867035;
 Wed, 08 Jan 2025 09:34:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=svEr=UA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVSRy-00058F-OY
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 09:34:06 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3b1702a-cda3-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 10:34:05 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3862b40a6e0so9035473f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 01:34:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c829120sm53848916f8f.6.2025.01.08.01.34.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jan 2025 01:34:04 -0800 (PST)
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
X-Inumbo-ID: b3b1702a-cda3-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736328844; x=1736933644; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CCdDVghLGg0Q3K+GDJyH1dpmZ+OwRHgtzuyMzO6WzyQ=;
        b=JAKzg9wbbW2chULrOrHP4OG6zuXWL0SxA/Awk3+6xrSNXtm7f9WM07XJggQjtgitGX
         DnlalS/D6su7xO7krnVAybFb3ZuIvpmiL7mAKyaNIdqh6BblB5e1V54rvl6hoI9cQdlD
         wIsu9e2aw74uLFlfG90pubipbEmMrFtntRSQF3O/cZBRwllCiuKyFO7ny+S+fgdzmyer
         k/Yv9dIw0DpMnw3rde9/sp0Scf1GUPVS8VRS0Lvc8bp4K+hidnYO6Lj+cC1x0Gq3vNUK
         GM91ImyWr8uZh9fzm/gbaZ8LSseQ1fA0uDmwySl2Iazp/SE3dPusXixiyWsCbS19fd/9
         FLZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736328844; x=1736933644;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CCdDVghLGg0Q3K+GDJyH1dpmZ+OwRHgtzuyMzO6WzyQ=;
        b=AbppVVExbpx7sfmy+ulNC+EZ+50pQ8kJQjrGuPV5LmnAt2lpGOntds84qNpQTtp8pl
         atQ18IsrzjM0d/D3qeyGYRh7FFN6KrzWi4b57JTbk5TDtpV042Ju337X77G83jPXDMFQ
         Zeg1RkdTPglosaMO6UJ3MIgXwgJwzL38BF+zw7meB9ftUDW023Ge9ieFnhOegLVldyae
         JpODLUZJVwWuo0GcUAtYljJxUkIe7QiZ8BoM89cpKWesh35LLpseGTNZM9+TGbwoetBf
         uFrhImu4kWx6jYdpMn6BiAKVRsJSAeYCxc/84QA7PQ4r0MAgh4XcD6ziZpX5ZawrM3sj
         1Ydg==
X-Forwarded-Encrypted: i=1; AJvYcCX1myHko2VOxBY19R0MSuj7PaLNFpRMustQO7a7XaCGjni+/grPYzfCDNqK8r3tYmx0T12mf6QMc0g=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yww7Opb3ldE8w47nfgvuntaU22C9dRMT+neuJO5pcweIBLLfzeX
	9FSs+b+cIDxKBX29aVQ+b91fP6VNBcfoULj6XtgXJy9OLBaAvEH8QtU5IZ7rJQ==
X-Gm-Gg: ASbGncuGbfgoN9VGrdDODvRUmw2WWf+KqBirc5my+nhccl/8LTF95YdTbQa3Imr+9A4
	/JWV2l90F2tvr1uenybgbR0M1x7i9X7P4zq9BzpGLoDzwpgFR1x+Q2KAKHu5YRgyg0NtllU6nyw
	jaMNMuSgMvY1ojLK2uisCeNgAwv9k9q4+vuyc65ZhEY97Dz1VuOd25Aftq09zW9ze0x/rea17XG
	QyR5iCjogcj+g0+M/p50jXd3ia5bVgRVvuxBgs29lV/pOzqZxZ/QEos3Qn8UJt4JhQJWYQnUhr3
	OM9VTJg14fQppsw/ouAB3cuAvL6o6mA3l8y/XWWdbw==
X-Google-Smtp-Source: AGHT+IGyrlra4zxi9lwPFWSLVi713VtWvAZWR/77b9wZUg+LYiu1FXhkUoyu0qja8kuCluAUSfIEMw==
X-Received: by 2002:a5d:64eb:0:b0:38a:50fa:d582 with SMTP id ffacd0b85a97d-38a87363364mr760130f8f.59.1736328844449;
        Wed, 08 Jan 2025 01:34:04 -0800 (PST)
Message-ID: <4ab75218-51cd-44a0-a6de-ad0f068a7361@suse.com>
Date: Wed, 8 Jan 2025 10:34:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/7] xen/events: don't allow binding a global virq from
 any domain
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250107101711.5980-1-jgross@suse.com>
 <20250107101711.5980-3-jgross@suse.com>
 <577427ff-61e2-4fc9-8853-a7eec3f69bb6@suse.com>
 <5261716e-a2f4-4423-bb8d-17e36bf34538@suse.com>
 <511c3207-20b8-4110-a5ef-55f8b428074d@suse.com>
 <f0cb4d80-5d26-437e-b6ee-a45f0157fc19@suse.com>
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
In-Reply-To: <f0cb4d80-5d26-437e-b6ee-a45f0157fc19@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.01.2025 10:02, Jürgen Groß wrote:
> On 07.01.25 17:38, Jan Beulich wrote:
>> On 07.01.2025 17:07, Jürgen Groß wrote:
>>> On 07.01.25 16:34, Jan Beulich wrote:
>>>> On 07.01.2025 11:17, Juergen Gross wrote:
>>>>> @@ -479,8 +486,13 @@ int evtchn_bind_virq(evtchn_bind_virq_t *bind, evtchn_port_t port)
>>>>>        */
>>>>>        virq = array_index_nospec(virq, ARRAY_SIZE(v->virq_to_evtchn));
>>>>>    
>>>>> -    if ( virq_is_global(virq) && (vcpu != 0) )
>>>>> -        return -EINVAL;
>>>>> +    if ( virq_is_global(virq) )
>>>>> +    {
>>>>> +        if ( get_global_virq_handler(virq) != d )
>>>>> +            return -EBUSY;
>>>>
>>>> Hmm. While this eliminates the problem for the common, race free case,
>>>> the handler changing right after the check would still mean the bind
>>>> would succeed.
>>>
>>> Are you fine with me adding a paragraph to the commit message saying
>>> that a future patch will handle this case?
>>>
>>> This future patch is patch 4 of the series, which will need to be
>>> modified to check the handling domain inside the event_lock.
>>
>> I think this would be okay, so long as patches 2...4 are then also all
>> committed together.
>>
>>>> Plus this way you're breaking a case that afaict has been working so
>>>> far: The bind happening before the setting of the handler. With a lot
>>>> of unrelated if-s and when-s this could e.g. be of interest when
>>>> considering a re-startable Xenstore domain. The one to take over could
>>>> start first, obtain state from the original one while that's still
>>>> active, and be nominated the handler of the global vIRQ only in the
>>>> last moment.
>>>
>>> This is a racy situation, too. If the old domain receives the virq after
>>> sending the state, this would need to be handled by transferring the virq
>>> information to the new domain, which can result in a never ending story.
>>>
>>> This is the reason why the domain state bitmap is reset to contain all
>>> existing domains to be flagged as "changed", as otherwise a change might
>>> get lost.
>>>
>>> I'd rather be able to handle today's use cases in a sane way than to try
>>> handling any weird future use cases which we don't know yet.
>>>
>>> I think today's behavior is more or less insane and the new behavior is
>>> much easier to understand and more intuitive.
>>
>> Hmm, I'd like to leave this then for input by other maintainers.
> 
> Just one additional remark to your re-startable xenstore domain scenario
> above:
> 
> It wouldn't be possible today to do the same with a xenstore daemon in
> e.g. dom0, as binding the virq another time from within the same domain
> would be rejected by the hypervisor. In the xenstore domain case you'd
> either need the old domain to ask dom0 to change the handler (so much
> about less communication needed),

Not quite. There needs to be an indication anyway of info transfer being
complete. That'll be where Dom0 would then (also) put in place the new
handler. The vIRQ first arriving in the new XS domain could then serve
as an indication that it is now in charge of the system; I didn't check
whether a courtesy one would be sent right away, or whether such sending
might need adding. (Plus anyway - XS is only an example here.)

Jan

> or you'd need to give the xenstore domain
> the right to do the handler change itself, requiring to use flask or to
> modify the dummy XSM rights of the xenstore domain.
> 
> 
> Juergen


