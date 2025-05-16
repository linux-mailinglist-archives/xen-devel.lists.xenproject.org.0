Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DADAB97CD
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 10:36:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986561.1372100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFqYO-0005tu-Oh; Fri, 16 May 2025 08:36:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986561.1372100; Fri, 16 May 2025 08:36:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFqYO-0005sB-Ly; Fri, 16 May 2025 08:36:28 +0000
Received: by outflank-mailman (input) for mailman id 986561;
 Fri, 16 May 2025 08:36:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C2cV=YA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uFqYN-0005s5-Up
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 08:36:27 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8490051-3230-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 10:36:21 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-6000f2f217dso2576214a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 01:36:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d047754sm116547466b.7.2025.05.16.01.36.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 01:36:21 -0700 (PDT)
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
X-Inumbo-ID: d8490051-3230-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747384581; x=1747989381; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8bwWom9M2XFqFg597hu7e+15n3vsPX9sMRocMuN2nII=;
        b=XR/o4XZ/NuTG2gEE5Bx1/rZLvWmhZh+VUacyfo7Ws0YKZyMHXYGX6ThmRMF0yMHDtb
         A2l0H8jtFCCQOU/pK88cIQwSqF315PbiaNsNz4fM4IhIsYfug3pH5FXhOGYTvCTWZlZl
         BsDBV8OWYGiD6PJBDF3pkOkRySq7Pj7Cf8N/uiQOP6IUaoAfrXWgwCSmEwpAoYbU41aR
         O24G/IHWvqrTku2aPb4HfJyd82QwKoWoj31DWE033QzcruyBXMZ0d76jqSfgUU6zvLDT
         a92Mh8jVigSuq0BE/jqMli/kLWDCG1BLfdLf12ayxBFE7MW7j1MpvuyxriibBTTnys8x
         XTTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747384581; x=1747989381;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8bwWom9M2XFqFg597hu7e+15n3vsPX9sMRocMuN2nII=;
        b=NDdRQ6utcVKCd6hNhuOP8DyEoeYHhZKcyA7VOIjCEPwjeIGrR0IA+5Ot2WCuoyKidQ
         OEl/ImOR/npqiBU6H5+e3XYLPW0bKdjzv2NhWcxnIOzW10G+xuYGTNi3/LSAv/1ptkWm
         yeOr5lQSRpNu22O0ulLvagQj5TJ9lQXLsJtUWYWd5uKhVvmazyU5r/ID0NgfJ9VyBQH8
         KoEfzl2Emxed8GgrkO3+OL6CnR+6iRdQVh7XxzXXVGaut3n3VovuQQG2HeGbcagspAiP
         /MffcnJmB6HKyQt+FxDI4Zi2J0Clwjbl/MDP5jqKwrDUimpwVkx9o6cv8ZS7PT03tCmm
         AKjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXq81ko459ecLR5cJjObXAidWtAKhQDjMRGnSPRPim6ltF3IwkBA72uSScT3Ef6FbPO6fvsoTB6I9E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzT5au96myM/J90r5lKdXilm9Q4iuKNpVcm3WDvD+WUzdmxrHuk
	b48kFljCop+zNe/kwFF/+R+ZdN5nu9lNXdg35Nd5YQSw/evhh+15W1/zFIc60e04Ow==
X-Gm-Gg: ASbGnctIgL89lFne5t/CAlsEyFWMQHYWlsiZZDbFQJiJBO/7jRsgKftBlePFAbSOZIJ
	4iA63U7x0QtUM7c/5JFxt+hFAiiTATQEiaIX+4z/ZIbPSKj9LL1hc5R4kyPDWgjeo/MEJr3CPqv
	jiD/oiZSV+nxK2LvAnkHQoIlYOZxbNIrYk4vMzFfIqAOJ6tFtLkUxOuS0mTavPZBNiCRjB7OXNT
	jT5LMbR8oOVJXVDO2Too1IJU0H1b+i9rDPTjd74DIEu6vpBysALJ9IIs8tqlbN6aNw9RLDG2F8d
	i9OOfr7Q3Ojnr7K6hihX3QOOnC556zcRq0L4opgJxMELz6pLXRC2b4JVjqvTnsSpX2bBOGgxDZG
	S0IwbkoA2z8jXOYm6gmbRfRcZ9sDO23MfvAJK
X-Google-Smtp-Source: AGHT+IFT9Iq1MqE4br+yUZDPG5DEbEZ49uyuAoA/itNPLQ6Kkr65dJHtT7Gyq48dpzqqNZcXCCSLyw==
X-Received: by 2002:a17:906:c7c6:b0:ad5:3746:591d with SMTP id a640c23a62f3a-ad537465c09mr95207166b.52.1747384581312;
        Fri, 16 May 2025 01:36:21 -0700 (PDT)
Message-ID: <00594224-7a33-4c5f-812e-7160bfecb5c4@suse.com>
Date: Fri, 16 May 2025 10:36:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] xen/x86: rename cache_flush_permitted() to
 has_arch_io_resources()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250506083148.34963-1-roger.pau@citrix.com>
 <20250506083148.34963-8-roger.pau@citrix.com>
 <e2396e92-79b6-487a-88d6-725cd9e173a9@suse.com>
 <aCXB5zpqGfBrPTZy@macbook.lan>
 <205a65d3-92bd-4281-8605-758ca03fcac5@suse.com>
 <aCbxMF9Uj4eBPMAf@macbook.lan>
 <9db4a2ce-ba06-42a1-b6e6-7d0c2b59c0c3@suse.com>
 <aCb2-6hIlYQ8V0NG@macbook.lan>
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
In-Reply-To: <aCb2-6hIlYQ8V0NG@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.05.2025 10:27, Roger Pau Monné wrote:
> On Fri, May 16, 2025 at 10:08:35AM +0200, Jan Beulich wrote:
>> On 16.05.2025 10:02, Roger Pau Monné wrote:
>>> On Fri, May 16, 2025 at 09:07:43AM +0200, Jan Beulich wrote:
>>>> On 15.05.2025 12:28, Roger Pau Monné wrote:
>>>>> On Mon, May 12, 2025 at 05:16:02PM +0200, Jan Beulich wrote:
>>>>>> On 06.05.2025 10:31, Roger Pau Monne wrote:
>>>>>>> To better describe the underlying implementation.  Define
>>>>>>> cache_flush_permitted() as an alias of has_arch_io_resources(), so that
>>>>>>> current users of cache_flush_permitted() are not effectively modified.
>>>>>>>
>>>>>>> With the introduction of the new handler, change some of the call sites of
>>>>>>> cache_flush_permitted() to instead use has_arch_io_resources() as such
>>>>>>> callers are not after whether cache flush is enabled, but rather whether
>>>>>>> the domain has any IO resources assigned.
>>>>>>>
>>>>>>> Take the opportunity to adjust l1_disallow_mask() to use the newly
>>>>>>> introduced has_arch_io_resources() macro.
>>>>>>
>>>>>> While I'm happy with everything else here, to me it's at least on the
>>>>>> edge whether cache_flush_permitted() wouldn't be the better predicate
>>>>>> to use there, for this being about ...
>>>>>>
>>>>>>> --- a/xen/arch/x86/mm.c
>>>>>>> +++ b/xen/arch/x86/mm.c
>>>>>>> @@ -172,8 +172,7 @@ static DEFINE_SPINLOCK(subpage_ro_lock);
>>>>>>>  
>>>>>>>  #define l1_disallow_mask(d)                                     \
>>>>>>>      (((d) != dom_io) &&                                         \
>>>>>>> -     (rangeset_is_empty((d)->iomem_caps) &&                     \
>>>>>>> -      rangeset_is_empty((d)->arch.ioport_caps) &&               \
>>>>>>> +     (!has_arch_io_resources(d) &&                              \
>>>>>>>        !has_arch_pdevs(d) &&                                     \
>>>>>>>        is_pv_domain(d)) ?                                        \
>>>>>>>       L1_DISALLOW_MASK : (L1_DISALLOW_MASK & ~PAGE_CACHE_ATTRS))
>>>>>>
>>>>>> ... cachability, which goes hand in hand with the ability to also
>>>>>> flush cache contents.
>>>>>
>>>>> Hm, I was on the edge here, in fact I've previously coded this using
>>>>> cache_flush_permitted(), just to the change back to
>>>>> has_arch_io_resources().  If you think cache_flush_permitted() is
>>>>> better I'm fine with that.
>>>>
>>>> I think that would be better here, yet as you say - it's not entirely
>>>> clear cut either way.
>>>
>>> I've reverted this chunk of the change and left the code as-is for the
>>> time being.
>>
>> Didn't we agree to use cache_flush_permitted() here instead?
> 
> I think it would be a bit weird, if we want this to be a
> non-functional change we would need to keep the has_arch_pdevs()
> condition because cache_flush_permitted() doesn't take that into
> account.  Or we need to adjust cache_flush_permitted() to also take
> has_arch_pdevs() into consideration.

Which is what you suggested elsewhere, or did I misunderstand that?

Jan

