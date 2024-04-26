Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC6E8B300B
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 08:07:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712422.1113106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Ejd-0003lM-6D; Fri, 26 Apr 2024 06:07:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712422.1113106; Fri, 26 Apr 2024 06:07:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Ejd-0003jO-37; Fri, 26 Apr 2024 06:07:01 +0000
Received: by outflank-mailman (input) for mailman id 712422;
 Fri, 26 Apr 2024 06:07:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj3M=L7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s0Ejc-0003jB-2h
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 06:07:00 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 312c76fd-0393-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 08:06:59 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-57258c90899so278765a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2024 23:06:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l11-20020a50cbcb000000b0057030326144sm9634351edi.47.2024.04.25.23.06.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 23:06:58 -0700 (PDT)
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
X-Inumbo-ID: 312c76fd-0393-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714111619; x=1714716419; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7F2OdtE36+46uTns3HXGqQsuhYm80veJ2ZB4254cG7o=;
        b=V0s7JoJ6inGZyH4SBMEVI89u16PkFKPatM4oGdsmAwFi5sTnx7IuslBz5KcLzygxlF
         ZrSxWXXVYvJyIVOZq8RHzV4jkuja0h3owdRQCeWYUGQpI57C5faeTB5hXbLTG3qNwNkg
         p5In/p/1r4DKnnnYwiguFe0IeriDRDnM7lD7OcPEiBoVjM+e+TzXHktQVq0B7Gyzgfug
         YMREm1fH7KQ1i6lt4F24thwWT5uvyhvUD4TOAnVLtzxCCNS9Od5GHr2QE9Dofn5P6vpx
         Dw+FiQECF8mz0s3trI/8HVgqKk91z1sBvE5/FU9/mkqc9gAgK3j9Bx93uv0okCRnsv45
         /OKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714111619; x=1714716419;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7F2OdtE36+46uTns3HXGqQsuhYm80veJ2ZB4254cG7o=;
        b=pC8KxQyLt2GcFDxmltwq1MhgK3tf4aMLCfxUOOke5uaAs6jG8Yowik0K/wDfYqY1jG
         kQxVaHwwxcaqC1bqyx5RKfbyjO0zr1vtUMSW5IB6jv15NJEEVmJh7Pjz9RTZwO9/Rbsx
         BRZJ0QdhZ1vj/vLoT3M9/0vyZKOSTtsZZw0K/S/Gf4G4Tgr2yVpTYKNjse7vd3h0rSDO
         Hf4vwkXVXk4S0qW1CjiyE2ugD26Z4CUo7G8y7eJnhVhr2bVD8NxEOu6zqTtXPEqpZ4ou
         L/bfnyJdnkat6tuwl0eFNyBmvhmfSzXnzfNKax0hlXcOvVx6/oEispAVecwWuSGnn4tV
         KKXA==
X-Forwarded-Encrypted: i=1; AJvYcCVyBjKxmx7LmeiHuNZY7IHHm2kg0QqezAntbbgWTgyT8DR2yH6OaxbgdwMq7/gxUddBG5HF64UlROPugzPrnx3pL9Om4DiqnidnDEK79x4=
X-Gm-Message-State: AOJu0YwJP2sUt2aZKNLEHq0csvEf4cnZyemTOL7AI3Xdqr5uc2cpbguS
	4ScwkkdpCNjfi4jEhm7nWc53pnm4JPIsEazVGjC/qn9R8cSUB3mHFDDmuI7fVA==
X-Google-Smtp-Source: AGHT+IGtRslbmFnwr5Z5HmB+6JzNExhY5rYZHn+qLHJLV9kzldbXd6RvzbzU81NxSZ4+S8JTbFhUSQ==
X-Received: by 2002:a05:6402:358a:b0:571:ba0f:fb8a with SMTP id y10-20020a056402358a00b00571ba0ffb8amr5362732edc.1.1714111618813;
        Thu, 25 Apr 2024 23:06:58 -0700 (PDT)
Message-ID: <90a25857-af9b-45ac-a6d6-e46ed1fb0609@suse.com>
Date: Fri, 26 Apr 2024 08:06:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] public: xen: Define missing guest handle for int32_t
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>
References: <20240417121442.56178-1-michal.orzel@amd.com>
 <be95f6be-0404-4c43-926f-d011782a02db@xen.org>
 <alpine.DEB.2.22.394.2404171148060.2257106@ubuntu-linux-20-04-desktop>
 <29afd327-a66c-4b4e-b076-ee6ecb70807e@xen.org>
 <alpine.DEB.2.22.394.2404251538250.3940@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2404251538250.3940@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.04.2024 00:39, Stefano Stabellini wrote:
> On Mon, 22 Apr 2024, Julien Grall wrote:
>> Hi Stefano,
>>
>> On 17/04/2024 19:49, Stefano Stabellini wrote:
>>> On Wed, 17 Apr 2024, Julien Grall wrote:
>>>> Hi Michal,
>>>>
>>>> On 17/04/2024 13:14, Michal Orzel wrote:
>>>>> Commit afab29d0882f ("public: s/int/int32_t") replaced int with int32_t
>>>>> in XEN_GUEST_HANDLE() in memory.h but there is no guest handle defined
>>>>> for it. This results in a build failure. Example on Arm:
>>>>>
>>>>> ./include/public/arch-arm.h:205:41: error: unknown type name
>>>>> ‘__guest_handle_64_int32_t’
>>>>>     205 | #define __XEN_GUEST_HANDLE(name)        __guest_handle_64_ ##
>>>>> name
>>>>>         |                                         ^~~~~~~~~~~~~~~~~~
>>>>> ./include/public/arch-arm.h:206:41: note: in expansion of macro
>>>>> ‘__XEN_GUEST_HANDLE’
>>>>>     206 | #define XEN_GUEST_HANDLE(name)
>>>>> __XEN_GUEST_HANDLE(name)
>>>>>         |                                         ^~~~~~~~~~~~~~~~~~
>>>>> ./include/public/memory.h:277:5: note: in expansion of macro
>>>>> ‘XEN_GUEST_HANDLE’
>>>>>     277 |     XEN_GUEST_HANDLE(int32_t) errs;
>>>>>
>>>>> Fix it. Also, drop guest handle definition for int given no further use.
>>>>>
>>>>> Fixes: afab29d0882f ("public: s/int/int32_t")
>>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>
>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>>
>>>
>>>> So it turned out that I committed v1 from Stefano. I was meant to commit
>>>> the
>>>> patch at all, but I think I started with a dirty staging :(. Sorry for
>>>> that.
>>>>
>>>> I have reverted Stefano's commit for now so we can take the correct patch.
>>>>
>>>> Now, from my understanding, Andrew suggested on Matrix that this solution
>>>> may
>>>> actually be a good way to handle GUEST_HANLDEs (they were removed in v2).
>>>> Maybe this can be folded in Stefano's patch?
>>>
>>> v1 together with Michal's fix is correct. Also v2 alone is correct, or
>>> v2 with Michal's fix is also correct.
>>
>> I am slightly confused, v2 + Michal's fix means that XEN_GUEST_HANDLE(int) is
>> removed and we introduce XEN_GUEST_INT(int32_t) with no user. So wouldn't this
> 
> You are right I apologize. I looked at Michal's patch too quickly and
> I thought it was just adding XEN_GUEST_INT(int32_t) without removing
> anything.
> 
> In that case, if you are OK with it, please ack and commit v2 only.

Just to mention it: Committing would apparently be premature, as I can't spot
any response to comments I gave to the patch. I'm okay with those being
addressed verbally only, but imo they cannot be dropped on the floor.

Jan

