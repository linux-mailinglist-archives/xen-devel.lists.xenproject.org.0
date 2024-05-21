Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2D58CAAE7
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 11:38:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726703.1131043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9Lvh-0008Ag-3f; Tue, 21 May 2024 09:37:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726703.1131043; Tue, 21 May 2024 09:37:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9Lvh-000899-05; Tue, 21 May 2024 09:37:09 +0000
Received: by outflank-mailman (input) for mailman id 726703;
 Tue, 21 May 2024 09:37:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TLq1=MY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s9Lvf-000893-V2
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 09:37:07 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af7d74c7-1755-11ef-b4bb-af5377834399;
 Tue, 21 May 2024 11:37:05 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-56e69888a36so8748851a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 May 2024 02:37:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b16669sm1578644466b.188.2024.05.21.02.37.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 May 2024 02:37:04 -0700 (PDT)
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
X-Inumbo-ID: af7d74c7-1755-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716284225; x=1716889025; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DynbRU0A7GPBquUvob9jhkjzzQdPSGZLT+Ekxx6uq6E=;
        b=UiQZmuHjTmwgHE2FLdUukyQ2sszv7HYEHF8MXosPar/YtW1rRkUHjfvNMmJRoeRJti
         g5l7x+iUU9sLN874EvkaZNiGkGRKQFjfPaDfh/WmX7MuwAWUWY0DxSqjIMXQn+WArv8F
         sSAVSwhGrVhtzdRVFtCnpOgR4qtGNBHBFbmVD4OSmyEpRUVjxaH+kTOtpg/6YFQckhee
         TW/qR1HqxuyjFCNVHaxiM8YN5Da/v8jsD/80nXvzGqQiMthkpKmYI8A9Sd6QBl94cz5y
         XbZ1Fgfb0so15zCFumznmbWYXkYNLvluMWJjaghKEu6boiUjN9ZP0WU93Z1fu8fHB6nY
         eNQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716284225; x=1716889025;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DynbRU0A7GPBquUvob9jhkjzzQdPSGZLT+Ekxx6uq6E=;
        b=txRTn7u246m679UYQGiBY+STbj9uyWpZzhducmBDtxEqC1I/0BLKVievre7i8P/tgx
         J7P2+fslpO/9LwjkuOm2jZolo7XOdiHJyJyeFyzO5yVlpwo846jgdFLRHguQBtww+8jS
         cu2N2zvusKGWU5Xarth/k1JOf6e22mnd3CPvD5hrvrWCSla71G8tWj4pYNMeKU/K359j
         7BIPB8DVQOdn9sQZNOJHEH7HS/4AP3Vg9dLz4VsWoRn+IHI2Cgc4ASfupQpS7cul5Xdv
         4Z+7MURMOxtvnvOwnCivbRN1uKj1AXvotDLgIOHNShsBOes0eoeaiWDFkZtKUF6Nf1XQ
         KVHw==
X-Forwarded-Encrypted: i=1; AJvYcCVU8F6VeGMdVNiQVi1JjO6ZpKvbRkTP+cVkb4XJrjthqpRDZi+5ztWiWUNYVzPDD3Kbva+fHDpwN7DKT7X2NJvJW3JiOqJn5EOWnTRP9IM=
X-Gm-Message-State: AOJu0YwGhSGJtAjdbLdADGs0IlqdTYR+i08ZQIy2oVMLrSgH+E8fmgmK
	UCC/nxyYwENlrMlkMsQlWrv0pt9xI/Xb0utQvSeGGNTpxIns4RDOqsJnZ1QhbQ==
X-Google-Smtp-Source: AGHT+IFHxY18K3TKJNVnsoZCtml+EAAUwmKWmK45uy6YaEpFg8+cPJpYF404pc4d8kDW2g6Xjol6kA==
X-Received: by 2002:a17:906:da8b:b0:a59:bdb7:73f8 with SMTP id a640c23a62f3a-a5a2d66a3b4mr2738871266b.47.1716284225136;
        Tue, 21 May 2024 02:37:05 -0700 (PDT)
Message-ID: <eef0f9f6-daee-4430-a73a-9b7e161e8731@suse.com>
Date: Tue, 21 May 2024 11:37:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] xen/x86: limit interrupt movement done by
 fixup_irqs()
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <20240516132224.86005-1-roger.pau@citrix.com>
 <449c7562-18a5-4f5b-a7a6-36fbf0383517@suse.com> <ZkYstvGkdffWMn2z@macbook>
 <b77790c6-a5b5-40d9-9387-5101ace14a4c@suse.com> <ZkYzGZ3tDg9dRbnF@macbook>
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
In-Reply-To: <ZkYzGZ3tDg9dRbnF@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.05.2024 18:23, Roger Pau Monné wrote:
> On Thu, May 16, 2024 at 06:04:22PM +0200, Jan Beulich wrote:
>> On 16.05.2024 17:56, Roger Pau Monné wrote:
>>> On Thu, May 16, 2024 at 05:00:54PM +0200, Jan Beulich wrote:
>>>> On 16.05.2024 15:22, Roger Pau Monne wrote:
>>>>> @@ -2576,7 +2576,12 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
>>>>>                  release_old_vec(desc);
>>>>>          }
>>>>>  
>>>>> -        if ( !desc->action || cpumask_subset(desc->affinity, mask) )
>>>>> +        /*
>>>>> +         * Avoid shuffling the interrupt around if it's assigned to a CPU set
>>>>> +         * that's all covered by the requested affinity mask.
>>>>> +         */
>>>>> +        cpumask_and(affinity, desc->arch.cpu_mask, &cpu_online_map);
>>>>> +        if ( !desc->action || cpumask_subset(affinity, mask) )
>>>>>          {
>>>>>              spin_unlock(&desc->lock);
>>>>>              continue;
>>>> [...]
>>>> In
>>>> which case cpumask_subset() is going to always return true with your
>>>> change in place, if I'm not mistaken. That seems to make your change
>>>> questionable. Yet with that I guess I'm overlooking something.)
>>>
>>> I might we wrong, but I think you are missing that the to be offlined
>>> CPU has been removed from cpu_online_map by the time it gets passed
>>> to fixup_irqs().
>>
>> Just on this part (I'll need to take more time to reply to other parts):
>> No, I've specifically paid attention to that fact. Yet for this particular
>> observation of mine is doesn't matter. If mask == &cpu_online_map, then
>> no matter what is in cpu_online_map
>>
>>         cpumask_and(affinity, desc->arch.cpu_mask, &cpu_online_map);
>>
>> will mask things down to a subset of cpu_online_map, and hence
>>
>>         if ( !desc->action || cpumask_subset(affinity, mask) )
>>
>> (effectively being
>>
>>         if ( !desc->action || cpumask_subset(affinity, &cpu_online_map) )
>>
>> ) is nothing else than
>>
>>         if ( !desc->action || true )
>>
>> . Yet that doesn't feel quite right.
> 
> Oh, I get it now.  Ideally we would use cpu_online_map with the to be
> removed CPU set, but that's complicated in this context.
> 
> For the purposes here we might as well avoid the AND of
> ->arch.cpu_mask with cpu_online_map and just check:
> 
> if ( !desc->action || cpumask_subset(desc->arch.cpu_mask, mask) )

Right, just that I wouldn't say "as well" - we simply may not mask with
cpu_online_map, for the reason stated in the earlier reply.

However, I remain unconvinced that we can outright drop the check of
->affinity. While I doubt cpumask_subset() was correct before, if there's
no intersection with cpu_online_map we still need to update ->affinity
too, to avoid it becoming an "impossible" setting. So I continue to think
that the logic as we have it right now may need splitting into two parts,
one dealing with IRQ movement and the other with ->affinity.

> As even if ->arch.cpu_mask has non-online CPUs set aside from the to
> be offlined CPU, it would just mean that we might be shuffling more
> than strictly necessary.

Limiting the overall benefit of your change, but yes.

>  Note this will only be an issue with cluster
> mode, physical mode must always have a single online CPU set in
> ->arch.cpu_mask.

Sure.

Jan

