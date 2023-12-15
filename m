Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2BD814314
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 08:59:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654886.1022365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE36J-0002tr-Le; Fri, 15 Dec 2023 07:59:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654886.1022365; Fri, 15 Dec 2023 07:59:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE36J-0002sC-IZ; Fri, 15 Dec 2023 07:59:15 +0000
Received: by outflank-mailman (input) for mailman id 654886;
 Fri, 15 Dec 2023 07:59:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F+xl=H2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rE36H-0002s5-PG
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 07:59:13 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4ce4ff5-9b1f-11ee-9b0f-b553b5be7939;
 Fri, 15 Dec 2023 08:59:11 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2c9f559b82cso3290731fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 23:59:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 k18-20020a02c652000000b004695eff62cfsm3266455jan.107.2023.12.14.23.59.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 23:59:10 -0800 (PST)
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
X-Inumbo-ID: d4ce4ff5-9b1f-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702627151; x=1703231951; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AoL5T/jtDuRBjgc1vlyLRWbNP3HQ5hMn5bid8W/sS7o=;
        b=OpXzWmxlp1dcWA3u4zEP8BDBKzi+UByVb6Li34S/379+ydnQy9gXTAQ9hCWST2y12z
         j5LpPDQ1+3XqUwkVMtMoItuQtW/k0D/e9a76lbijOikasbJTrTlIfoO5uWvkspIKfxIY
         TDh5QQnU+KvxCEVzMk6nZDtYPiDWWO5+Cy4YyBa9p6nBuO2WsBWr2/gUimX0EieonUIc
         52Vi5+71smFbxiXZjq6rTAfh0obuQJFCNzVGaH+G12N6pKtkiy00v9seScAKzzwyDyls
         rWbG0aGOwyiFwd1YZysVued1b3+8F91INN5F4GVMimnv2+LSNNzmAfQ0+9tfX1BZ2pUn
         iQeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702627151; x=1703231951;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AoL5T/jtDuRBjgc1vlyLRWbNP3HQ5hMn5bid8W/sS7o=;
        b=qJEX6lnafPcx5rD7YkqTJ+Ov2FTDvUsH2r+bJ4CUNW1FZOyPe/Obh90W/XDnePrevO
         wbwOPRQ9OGKUAkfG3TcHHjqNxvqdY2609cMcP3sp28zAq1DPf9bXVnfMRInCiTut5YPv
         sNGJLr1/esC+I0Ya+hGb+DK7UiHwO5FiRTI5gUMD5uwn94fMNUeHtk5xif2YuWE4+q3C
         /Mg7wnKQ2/wALWdTy8P9BmifoNzJFb77MyNQfzqZyusRXg1IOf95oyTg7LbIPnMECIMh
         tJ6IrWxr3tEPiPqbF4UlFCWLZWCwJRb1wiS8II/NzuewjiYzQOBWQevyKqFnaREtvNmq
         31Lg==
X-Gm-Message-State: AOJu0Yz7e1ydmobpPofeJ/1mbvgq3IeY9vxLiuIlAjQfJ/2z1WOel55/
	ewnFnkhoy9cg8qN27xzOWtjO
X-Google-Smtp-Source: AGHT+IHFXKnyzjSf2os4xdbd1HBuakDu+p3YXoGW8DQT1mLf3nFUGyMk7g8dygQe3TdK/hLsA0ELDA==
X-Received: by 2002:a2e:a401:0:b0:2c9:f975:8c59 with SMTP id p1-20020a2ea401000000b002c9f9758c59mr4369386ljn.87.1702627150769;
        Thu, 14 Dec 2023 23:59:10 -0800 (PST)
Message-ID: <698cb944-3e91-498c-99ba-ff0849723285@suse.com>
Date: Fri, 15 Dec 2023 08:59:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] xen: add SAF deviation for safe cast removal.
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Simone Ballarin <simone.ballarin@bugseng.com>,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
 consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1702555386.git.maria.celeste.cesario@bugseng.com>
 <36e996b864853dba26a9c9fb9c9c674e92cc935e.1702555387.git.maria.celeste.cesario@bugseng.com>
 <b93417c7-1375-4bf4-ace2-d36bd63c8b0b@suse.com>
 <alpine.DEB.2.22.394.2312141355391.3175268@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2312141355391.3175268@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.12.2023 23:04, Stefano Stabellini wrote:
> On Thu, 14 Dec 2023, Jan Beulich wrote:
>> On 14.12.2023 13:07, Simone Ballarin wrote:
>>> --- a/docs/misra/safe.json
>>> +++ b/docs/misra/safe.json
>>> @@ -28,6 +28,14 @@
>>>          },
>>>          {
>>>              "id": "SAF-3-safe",
>>> +            "analyser": {
>>> +                "eclair": "MC3R1.R11.8"
>>> +            },
>>> +            "name": "MC3R1.R11.8: removal of const qualifier to comply with function signature",
>>> +            "text": "It is safe to cast away const qualifiers to comply with function signature if the function does not modify the pointee."
>>
>> I'm not happy with this description, as it invites for all sorts of abuse.
>> Yet I'm also puzzled that ...
> 
> We can improve the language but the concept would still be the same. For
> instance:
> 
> A single function might or might not modify the pointee depending on
> other function parameters (for instance a single function that could
> either read or write depending on how it is called). It is safe to cast
> away const qualifiers when passing a parameter to a function of this
> type when the other parameters are triggering a read-only operation.

Right, but I think the next here needs to be setting as tight boundaries
as possible: It should cover only this one specific pattern. Anything
else would better get its own deviation, imo.

>>> --- a/xen/arch/x86/hvm/hvm.c
>>> +++ b/xen/arch/x86/hvm/hvm.c
>>> @@ -3413,6 +3413,7 @@ static enum hvm_translation_result __hvm_copy(
>>>  enum hvm_translation_result hvm_copy_to_guest_phys(
>>>      paddr_t paddr, const void *buf, unsigned int size, struct vcpu *v)
>>>  {
>>> +    /* SAF-3-safe */
>>>      return __hvm_copy((void *)buf /* HVMCOPY_to_guest doesn't modify */,
>>>                        paddr, size, v,
>>>                        HVMCOPY_to_guest | HVMCOPY_phys, 0, NULL);
>>
>> ... this is the only place you then use it. Afaict some of Arm's copy_guest()
>> callers ought to have a similar issue. If so, an enlarged patch should be
>> discussed with a larger audience, to see how we collectively think we want to
>> put this specific kind of deviation.
> 
> We have a similar problem, see xen/arch/arm/guestcopy.c
> raw_copy_to_guest and raw_copy_from_guest.
> 
> I would use the SAF deviation there too.
> 
> In the case here, I think the comment "HVMCOPY_to_guest doesn't modify"
> could be removed as it becomes redundant with SAF-3-safe, but I'll leave
> it to you.

No, the comment cannot be removed: The SAF comment says exactly nothing
until you go and look up its description. The two comments could be
folded, though. Which is something I was trying to advocate for in
general: Unless entirely obvious, what exactly it is that is "safe"
would better be (briefly) stated in these SAF comments.

Jan

