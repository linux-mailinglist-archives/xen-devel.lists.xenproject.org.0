Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 986F985D614
	for <lists+xen-devel@lfdr.de>; Wed, 21 Feb 2024 11:52:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683957.1063588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rckCx-0004mD-Uo; Wed, 21 Feb 2024 10:52:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683957.1063588; Wed, 21 Feb 2024 10:52:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rckCx-0004jl-Qi; Wed, 21 Feb 2024 10:52:11 +0000
Received: by outflank-mailman (input) for mailman id 683957;
 Wed, 21 Feb 2024 10:52:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TA2L=J6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rckCw-0004jd-RI
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2024 10:52:10 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4248a7d6-d0a7-11ee-98f5-efadbce2ee36;
 Wed, 21 Feb 2024 11:52:08 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a3e75e30d36so592009866b.1
 for <xen-devel@lists.xenproject.org>; Wed, 21 Feb 2024 02:52:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s8-20020a170906168800b00a3e7a2d9ac4sm3339978ejd.6.2024.02.21.02.52.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 02:52:07 -0800 (PST)
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
X-Inumbo-ID: 4248a7d6-d0a7-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708512728; x=1709117528; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ydcPULZ+yw3cK2VhFEG/Cg908Xb9yky5xkBswdzDVWI=;
        b=TaXzlcYrtbJdT5Yld7h/4voKjE19lvd/L4Jq7wbsICaSJS7dLtmxV3ISdAXkctbdKJ
         qPeJe9rgxBCv1NnBoaIFCSDiErb6yqA6VBbTz1SQRND6MT8nOgHVnQ1+OR5vVJgbFVe3
         aV1giqZbHkHn1EceZupD7hE5rkZ1M/K0hdW5/B8pC16Q05EbhBvap/1LSjbKIrSzpEvk
         mDC5BnERPufPGqCOo8rrc9C7X5OsZc80AvChBiHndFJlvuT0UFyUj9jOHeAIEISDf55I
         DCk26FY0POlOx5UY+cT7jBbVA6a3jCnEhzGGrNWBTAExuzU5qOEjRLhl2XSgqhvUelDX
         7gmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708512728; x=1709117528;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ydcPULZ+yw3cK2VhFEG/Cg908Xb9yky5xkBswdzDVWI=;
        b=m0EK43qWIW23VoYknyjGEXiwpSM5IVQ+sNfqM6hG0ynKcASTAi3bBKvD8dWmILaT4W
         79gaUaq6yc4b3bGI1GrgQhChla0PFOVf2ySwIMCJN2iqWpE/DnF/jB1WyQMwdfQLKbui
         Sj8lC8oB/b+VN7zDSUfcgtBAA1OOisH3h9OZpmAZci4C87/3ef+0x8IqEj/KnpSL8fLo
         fxUW4Ia2sORxk/3TweW9djr80mxdG/BpMcSXcVGv4FcSTmT8CHlcmbouDYrOuDaDt/j+
         XGy7rOTxpbwbSi35rHBT/vkBXQp0jeqKzZiWAYZKNQE2BmRMzSE7KT+qymMvagqK56Zy
         ZuRA==
X-Forwarded-Encrypted: i=1; AJvYcCUpmzbeOgr+NMEuAS7TTlRBL1zYsjrc1SS6pIOIuNkSNDyea5A3BDU7qL+6aFzHP+rXvB+qbcujf/aBBy+/LS+9BrlMpjWTpDHDZOS91h4=
X-Gm-Message-State: AOJu0Yzi6b52DyMPMpoE7644EFx7I2mxwopUIkBQDKTWEGF2kVbnwqb7
	BTXxbcaPfF3vKpkxYskxHlBQcxY/Bg2WGJzD3WE0PAv+Na0dXW8xJ+L3bO3ihA==
X-Google-Smtp-Source: AGHT+IFgmhIdfe3tQDzSuE6lmF0tET3TzlCpKxgBN+msncAH6UpUi2V6dQGkh4HQ3QguSnaSLie6iw==
X-Received: by 2002:a17:906:7f18:b0:a3e:7d76:6559 with SMTP id d24-20020a1709067f1800b00a3e7d766559mr9532780ejr.33.1708512728119;
        Wed, 21 Feb 2024 02:52:08 -0800 (PST)
Message-ID: <74ef7b2b-b105-4060-afaa-73ec272a7449@suse.com>
Date: Wed, 21 Feb 2024 11:52:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] nestedsvm: Disable TscRateMSR
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20240206012051.3564035-1-george.dunlap@cloud.com>
 <20240206012051.3564035-5-george.dunlap@cloud.com>
 <c5f3a78c-4a2b-499b-93bb-11f60b0afcc0@suse.com>
 <CA+zSX=acH-4B01=vUBstAbsNBMVgcRe_A5v0eXn66BdsuPtgiA@mail.gmail.com>
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
In-Reply-To: <CA+zSX=acH-4B01=vUBstAbsNBMVgcRe_A5v0eXn66BdsuPtgiA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.02.2024 09:48, George Dunlap wrote:
> On Mon, Feb 19, 2024 at 11:22 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 06.02.2024 02:20, George Dunlap wrote:
>>> For now, just disable the functionality entirely until we can
>>> implement it properly:
>>>
>>> - Don't set TSCRATEMSR in the host CPUID policy
>>
>> This goes too far: This way you would (in principle) also affect guests
>> with nesting disabled. According to the earlier parts of the description
>> there's also no issue with it in that case. What you want to make sure
>> it that in the HVM policy the bit isn't set.
>>
>> While presently resolving to cpu_has_svm_feature(), I think
>> cpu_has_tsc_ratio really ought to resolve to the host policy field.
>> Of course then requiring the host policy to reflect reality rather than
>> having what is "always emulated". IOW ...
>>
>>> --- a/xen/arch/x86/cpu-policy.c
>>> +++ b/xen/arch/x86/cpu-policy.c
>>> @@ -407,8 +407,7 @@ static void __init calculate_host_policy(void)
>>>                                 (1u << SVM_FEATURE_PAUSEFILTER) |
>>>                                 (1u << SVM_FEATURE_DECODEASSISTS));
>>>          /* Enable features which are always emulated. */
>>> -        p->extd.raw[0xa].d |= ((1u << SVM_FEATURE_VMCBCLEAN) |
>>> -                               (1u << SVM_FEATURE_TSCRATEMSR));
>>> +        p->extd.raw[0xa].d |= (1u << SVM_FEATURE_VMCBCLEAN);
>>
>> ... this likely wants replacing altogether by not overriding what we
>> found in hardware, which would apparently mean moving the two bit
>> masks to the earlier "clamping" expression.
>>
>> But then of course Andrew may know of reasons why all of this is done
>> in calculate_host_policy() in the first place, rather than in HVM
>> policy calculation.
> 
> It sounds like maybe you're confusing host_policy with
> x86_capabilities?  From what I can tell:
> 
> *  the "basic" cpu_has_X macros resolve to boot_cpu_has(), which
> resolves to cpu_has(&boot_cpu_data, ...), which is completely
> independent of the cpu-policy.c:host_cpu_policy
> 
> * cpu-policy.c:host_cpu_policy only affects what is advertised to
> guests, via {pv,hvm}_cpu_policy and featureset bits.  Most notably a
> quick skim doesn't show any mechanism by which host_cpu_policy could
> affect what features Xen itself decides to use.

I'm not mixing the two, no; the two are still insufficiently disentangled.
There's really no reason (long term) to have both host policy and
x86_capabilities. Therefore I'd prefer if new code (including a basically
fundamental re-write as is going to be needed for nested) to avoid
needlessly further extending x86_capabilities. Unless of course there's
something fundamentally wrong with eliminating the redundancy, which
likely Andrew would be in the best position to point out.

> Not sure exactly why the nested virt stuff is done at the
> host_cpu_policy level rather than the hvm_cpu_policy level, but since
> that's where it is, that's where we need to change it.
> 
> FWIW, as I said in response to your comment on 2/6, it would be nicer
> if we moved svm_feature_flags into the "capabilities" section; but
> that's a different set of work.

Can as well reply here then, rather than there: If the movement from
host to HVM policy was done first, the patch here could more sanely go
on top, and patch 2 could then also go on top, converting the separate
variable to host policy accesses, quite possibly introducing a similar
wrapper as you introduce there right now.

But no, I'm not meaning to make this a requirement; this would merely be
an imo better approach. My ack there stands, in case you want to keep
(and commit) the change as is.

Jan

