Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBE4871627
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 08:01:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688599.1072963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhOnD-0006yK-4p; Tue, 05 Mar 2024 07:00:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688599.1072963; Tue, 05 Mar 2024 07:00:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhOnD-0006w9-2F; Tue, 05 Mar 2024 07:00:51 +0000
Received: by outflank-mailman (input) for mailman id 688599;
 Tue, 05 Mar 2024 07:00:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mek3=KL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rhOnB-0006w3-Re
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 07:00:49 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17c8d3cf-dabe-11ee-a1ee-f123f15fe8a2;
 Tue, 05 Mar 2024 08:00:47 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a44cdb2d3a6so389898666b.2
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2024 23:00:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s5-20020a170906c30500b00a4588e03238sm985393ejz.49.2024.03.04.23.00.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 23:00:46 -0800 (PST)
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
X-Inumbo-ID: 17c8d3cf-dabe-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709622047; x=1710226847; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nf8icuCYBgULOWuEIBWVrfHWIQzMo8D1uULlQymypaM=;
        b=Knu9/eTiIUi1YTH7z+2PWla8SHejI/Zy/ih/Q1wEu+2Iblus95JxYEE6To1M7p3ibH
         qzD6qzgAMw+/DlxMEZAU6elC1CdaNCa70N6rmWve4c3c+Sae2WZUewN/QkHXwmjT7mWd
         U03yS8qd37RB1akCIxBqt+ulv/Bv5NMtCsQvmhlIAvYMxO7uaRZoDCTE5IltrW2BpUvi
         OWdvONkupSS9MwZGikZ6g96UK44on/bxIC3ZB20reoHvdson41GsvLmSmH94W0PVEZ9h
         gj33+vzun6Ahj50Kz1NCP0w37Muh0+QFUrjg7GxQowOsb87S+F6FJ+AwWe0MAWkV83OA
         BWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709622047; x=1710226847;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nf8icuCYBgULOWuEIBWVrfHWIQzMo8D1uULlQymypaM=;
        b=eUHn8OwpJpc91r5tzeEKk+3/hIC07DiA4m2KQ0HttH/PdJ7s0LIfZkbT0COyEQhba/
         Cl6x2w5bKPU6pijpOFNsoxJqt3q1JgRw15Wcp/sOITvSeW0ypzJTDtGCok4GQHB9GHM8
         AGc0aACiCqVytNsfgcBnuS1PiTEauUttI2jHvPhZJAn8HhIfGNYlFjIJ36oZ8eNe9MTV
         FD4XTeK9QwLs6wWpbs23peRrZ0qqq9XvokyjuOYcFGCAHB7OVDsahQgupzncTfUKvUNx
         8Nn1yRyHPiQ0dANlwMWK7BvxfCpb56Gttp31pIP9WOqi9aIvoT2gtpwHcaWzI0uXsnnd
         Gfyg==
X-Gm-Message-State: AOJu0Yz9O8lVTvEx5VjARPsnrH+EiGUE0S5FqClGPfGTBK4eM7zZc6Ie
	y08kiiIs935lH9HxZ8hm3700gVdfWeH99KUyqrF09RKB/cxcec57aPXs22tHtQ==
X-Google-Smtp-Source: AGHT+IHNbaswhkAzSgaIDgzEk4PeKUxQopwW20xf6VqpHEP6RRYPpByRQtENyroBp7IgEBKXtDCuQQ==
X-Received: by 2002:a17:906:8318:b0:a45:597e:7628 with SMTP id j24-20020a170906831800b00a45597e7628mr3221713ejx.41.1709622046842;
        Mon, 04 Mar 2024 23:00:46 -0800 (PST)
Message-ID: <fe15bab2-3a48-4243-b50c-6d9854c218c2@suse.com>
Date: Tue, 5 Mar 2024 08:00:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 10/10] xen/keyhandler: address violations of MISRA C
 Rule 20.7
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <cover.1709219010.git.nicola.vetrini@bugseng.com>
 <2bc4a964f0f2f47488e72237678e944dbdbd7bb7.1709219010.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2402291457000.853156@ubuntu-linux-20-04-desktop>
 <1afd8805-7365-40ec-8e8e-468a83e20c40@suse.com>
 <alpine.DEB.2.22.394.2403011716180.853156@ubuntu-linux-20-04-desktop>
 <d7411c57-32f3-41c6-8233-685ed5dfe976@suse.com>
 <alpine.DEB.2.22.394.2403041756140.853156@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2403041756140.853156@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.03.2024 03:03, Stefano Stabellini wrote:
> On Mon, 4 Mar 2024, Jan Beulich wrote:
>> On 02.03.2024 02:37, Stefano Stabellini wrote:
>>> On Fri, 1 Mar 2024, Jan Beulich wrote:
>>>> On 29.02.2024 23:57, Stefano Stabellini wrote:
>>>>> On Thu, 29 Feb 2024, Nicola Vetrini wrote:
>>>>>> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
>>>>>> of macro parameters shall be enclosed in parentheses". Therefore, some
>>>>>> macro definitions should gain additional parentheses to ensure that all
>>>>>> current and future users will be safe with respect to expansions that
>>>>>> can possibly alter the semantics of the passed-in macro parameter.
>>>>>>
>>>>>> No functional change.
>>>>>>
>>>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>>>
>>>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>>>
>>>> You did see the discussion on earlier patches, though? I don't think
>>>> any of the parentheses here are needed or wanted.
>>>
>>> We need to align on this. Currently if we go by what's written in
>>> docs/misra/deviations.rst, then rhs should have parentheses.
>>
>> Quoting the actual patch again:
> 
> [...]
> 
>> What rhs are you talking about in light of this change? The only rhs I
>> can spot here is already parenthesized.
> 
> Yes you are right. I replied here as an overall comment about our
> approach to 20.7, although this patch is not a good example. My reply
> was meant in the context of https://marc.info/?l=xen-devel&m=170928051025701

I'm still confused: The rhs is being parenthsized there. It's the _lhs_
which isn't and ...

>>> Can we safely claim that rhs parentheses are never needed? If so, then
>>> great, let's add it to deviations.rst and skip them here and other
>>> places in this patch series (e.g. patch #8). When I say "never" I am
>>> taking for granted that the caller is not doing something completely
>>> unacceptably broken such as: 
>>>
>>>      WRITE_SYSREG64(var +, TTBR0_EL1)
>>
>> I'm afraid I can't associate this with the patch here either. Instead in
>> the context here a (respective) construct as you mention above would simply
>> fail to build.
> 
> Fair enough it will break the build. I was trying to clarify that when I
> wrote "the rhs parentheses are never needed" I meant "never" within
> reason. One can always find ways to break the system and I tried to make
> an example of something that for sure would break rhs or lhs without
> parentheses.
> 
> I meant to say, if we don't account for exceptionally broken cases, can
> we safety say we don't need parentheses for rhs?

... doesn't need to, unless - as you say - one contrives examples. Yet to
clarify here as well: I assume you mean "we don't need parentheses for lhs".

And note that even if your example used the first parameter as lhs of an
assignment, the build would still break. The + there would not magically
combine with the = to a += operator. Tokenization occurs ahead of
preprocessing, so the expanded macro would still have a + token followed by
a = one. The only way to alter tokens is by using the ## operator. Which in
turn precludes using parentheses.

Jan

