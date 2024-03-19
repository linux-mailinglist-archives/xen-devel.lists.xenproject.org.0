Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4CB87F90B
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 09:12:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695253.1084860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmUZ4-0006h8-Cy; Tue, 19 Mar 2024 08:11:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695253.1084860; Tue, 19 Mar 2024 08:11:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmUZ4-0006fO-8s; Tue, 19 Mar 2024 08:11:18 +0000
Received: by outflank-mailman (input) for mailman id 695253;
 Tue, 19 Mar 2024 08:11:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aOUF=KZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmUZ3-0006fH-Ca
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 08:11:17 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 423da8f4-e5c8-11ee-afdd-a90da7624cb6;
 Tue, 19 Mar 2024 09:11:16 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-56b9e5ed074so134771a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Mar 2024 01:11:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 de24-20020a056402309800b00568c604eea2sm3078781edb.55.2024.03.19.01.11.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 01:11:15 -0700 (PDT)
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
X-Inumbo-ID: 423da8f4-e5c8-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710835876; x=1711440676; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bsx6Lhr9MnXsGSnWlPS2nh2fG7nOaR0L7dRJ8WpTJKA=;
        b=blViKgS+TfD7AMf1O774sLVlxg2Mdpdl5pPoqjLzaWL2bK+pfOmdSTT6A2zdvXRpjX
         XYi6V5pCdTSnpp1fBiHyEH/kZt+TpU/4WY6+BD9rmUPqBjHjy2YOv9xqZtuBphzKz0kE
         2Car3KfP53qmAx/ujx5p1E/hPgBVLr+LpZgP5wt7NA7TcxYAjao5RpRsB5sRoB7Xj5Db
         EwUHX/dzT3+W1UeACGvwWq/oJBgGYhEj546sRWFIWo3Xpg7BeXoNwN3HiYN4DSOHDDhM
         wT/qvj9ozRWybnesgE3GMdElwl1yrc9bffghpgAlqa1oYjaT4hnkWCjvyUm1r+7fNDFt
         jPjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710835876; x=1711440676;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bsx6Lhr9MnXsGSnWlPS2nh2fG7nOaR0L7dRJ8WpTJKA=;
        b=DnQegxn6kswnljmUxHq9UG7p92Wh7zIQM8VTKKCrH0r1uVClRbxM+5e8oEnbsAIIbJ
         X1Pio0wfWRitUSvAWxWBDDV34bdgA9GrcX934o3CPG8zyHXWDc0In4XhkM5n0Umb4BF9
         FZycU+2jSs+w5TE7nSB2FooJkqoIhJ0VTJZEvy86AJHzytu+qTnDkXZ13m4kLstosv7C
         UrF4U+fZcTWZfQM66Le7+se9Z1p2/nxQZg2QB5g4Uz9rM7cQwaoegoi2FvFkoA0Qlyt0
         YdK9C5t9PvJjINWE6IpPOc9WHWeMB/2R+kI09J1kkAcbcTQf8P7d/2Ay9ouWh80WSel/
         XxNA==
X-Forwarded-Encrypted: i=1; AJvYcCX0NAP4nuErpHMLbKZthr/19dlFXAXwNUS7IpTG5i+lgbqz7YQ+2v56VCMQh6gPTcTmjtpNn8KovKjtffZtKoy/dp+TBOsLLzb0u+5SipM=
X-Gm-Message-State: AOJu0Yy+dbLoXbDjgyGTWPuoB4Tzc71zDpvIkWxtz5n8/IVs9X0wuPnt
	Z9punCIcHrM/1eIvwkLiW6NUSy7tBk2unGG4A8UvB7z0XZ33brmG9LFC/dvZ9Q==
X-Google-Smtp-Source: AGHT+IHR3kevxuKmzOiPRHaIrbEeSYk0WNDHhENbfpo1lUZCpeWs1AG6HMVYaBlY3SSysazVJ0Q8XQ==
X-Received: by 2002:a05:6402:3884:b0:568:9a2f:84b with SMTP id fd4-20020a056402388400b005689a2f084bmr1194647edb.10.1710835875798;
        Tue, 19 Mar 2024 01:11:15 -0700 (PDT)
Message-ID: <f09d7b16-c13a-4e9f-8aa1-7605c24780d6@suse.com>
Date: Tue, 19 Mar 2024 09:11:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] x86/PVH: Support relocatable dom0 kernels
Content-Language: en-US
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20240313193021.241764-1-jason.andryuk@amd.com>
 <20240313193021.241764-4-jason.andryuk@amd.com>
 <945609d6-741e-4934-a4f2-6e5597ce5dcd@suse.com>
 <a4f18ccc-c878-4924-a110-6afaaea1b01b@amd.com>
 <43c49aa6-d690-467e-8ce3-ca37b9d41e76@suse.com>
 <769e4e95-1c76-4e07-b623-27b35ef388ef@amd.com>
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
In-Reply-To: <769e4e95-1c76-4e07-b623-27b35ef388ef@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.03.2024 22:19, Jason Andryuk wrote:
> On 2024-03-14 10:19, Jan Beulich wrote:
>> On 14.03.2024 15:13, Jason Andryuk wrote:
>>> On 2024-03-14 09:21, Jan Beulich wrote:
>>>> On 13.03.2024 20:30, Jason Andryuk wrote:
>>>>> --- a/xen/include/public/elfnote.h
>>>>> +++ b/xen/include/public/elfnote.h
>>>>> @@ -194,6 +194,17 @@
>>>>>     */
>>>>>    #define XEN_ELFNOTE_PHYS32_ENTRY 18
>>>>>    
>>>>> +/*
>>>>> + * Physical loading constraints for PVH kernels
>>>>> + *
>>>>> + * Used to place constraints on the guest physical loading addresses and
>>>>> + * alignment for a PVH kernel.  This note's value is 3 64bit values in
>>>>> + * the following order: minimum, maximum and alignment.
>>>>
>>>> Along the lines of what I said on another sub-thread, I think at least
>>>> alignment wants to be optional here. Perhaps, with max going first, min
>>>> could also be optional.
>>>
>>> Interesting idea.
>>>
>>>> As indicated in different context by Roger, the values being uniformly
>>>> 64-bit ones also is questionable.
>>>>
>>>>> + * The presence of this note indicates the kernel is relocatable.
>>>>
>>>> I think it wants making explicit here that the act of relocating is still
>>>> left to the kernel.
>>>
>>> Ok.
>>>
>>> How is this for a new description?
>>>
>>> """
>>> Physical loading constraints for PVH kernels
>>>
>>> Used to place constraints on the guest physical loading addresses and
>>> alignment for a PVH kernel.
>>>
>>> The presence of this note indicates the kernel supports relocating itself.
>>>
>>> The note may include up to three 32bit values.
>>
>> I'm as unsure about always 32-bit as I am on it being uniformly 64-bit.
>> One question here is whether this note is intended to be x86-specific.
>>
>>>    - a maximum address for the entire image to be loaded below (default
>>> 0xfffffff)
>>
>> One f too few?
> 
> Whoops - yes.
> 
>>>    - a minimum address for the start of the image (default 0)
>>>    - a required start alignment (default 1)
> 
> Jan, in the discussion of patch 1, you wrote "Hmm, shouldn't the order 
> of attempts to figure the alignment be ELF note, ELF header, and then 
> 2Mb?"  My latest revision initializes phys_alignment to 1 and updates 
> that if PHYS32_RELOC specifies an alignment.  Do you still want these 
> other locations checked for alignment values?

I think it would be prudent to do so, yet at the same time I guess I won't
insist. Defaulting to 1, though, looks overly lax. In order for the
alignment value to be sensible to omit, the default needs to be sensible
(no lower than 4k, and quite likely better 2M).

Jan

