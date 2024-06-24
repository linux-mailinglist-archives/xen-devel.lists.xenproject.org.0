Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE879143BD
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 09:31:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746111.1153063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLeAq-0005L0-55; Mon, 24 Jun 2024 07:31:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746111.1153063; Mon, 24 Jun 2024 07:31:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLeAq-0005J3-2G; Mon, 24 Jun 2024 07:31:36 +0000
Received: by outflank-mailman (input) for mailman id 746111;
 Mon, 24 Jun 2024 07:31:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wsRE=N2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sLeAo-0005Ix-4e
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 07:31:34 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6edfbf8-31fb-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 09:31:31 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2eaae2a6dc1so64851311fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 00:31:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb2f0406sm55888695ad.37.2024.06.24.00.31.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 00:31:30 -0700 (PDT)
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
X-Inumbo-ID: c6edfbf8-31fb-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719214291; x=1719819091; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XZnbhW7TJOMAeHZnQpiyH347MKdrXnDrOQfYzjkmLkU=;
        b=K6WbmHqrR4RlhZE4/JGVnsNtcS0DuhIIIkJhSHJLLmTrNxpIz7+N3nH+Wns3Pj4RjS
         HGNvmMs90JTEvWekuNcTn2ZBJVfJO9KCVg9epkSJk9VRbH1pwl54VIUlOPqPRNjHx631
         YtRyDA04ZuQ9i7QCl0iBFQk8DtjiBgeT29e/XnQBkxT57Nm2NnsMtd37CylJXfaxkPF5
         LbHld//ECPURYO2tp7fYaLJ0alMW396BL3rjpC8/X0hRQKsj3cJDqupe2VEePmuAetKn
         6wuFKIOtjrV37zrAyf+LF9YSW9Bfs48rZ7IU7JQLOQVJDmwM0VVt3BVDMRCY6I1v4DXI
         uh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719214291; x=1719819091;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZnbhW7TJOMAeHZnQpiyH347MKdrXnDrOQfYzjkmLkU=;
        b=vl97uEnSqaduWYJZOJHzKaH2Gz0pmX6XQOS7NZekq/UA+BhGqcGwBRbLlXKWatVvkq
         D1rH06t4wuYwQLgAI5sikU9UNjMcIh4S1Oq88JeREBh+sfr4yWjg0RfIdeBlxoeQhgqE
         GCxi+W0/yT3rRaLjiod0chDlBTp0nqi0AagJsskoRd5eYSjoRK0eh/nlmZ56SDYu9bKN
         kPUS45UipI8l0UelWEMaQNQxLH9XA2vILJFeI5GIa/eMJ4MAPIXa486X2uMsjG9jkY98
         CHSEQW69akd0P6ifMtP8822CohKGIffaq0xibIiSWuTxdLxdZN5laWxLa8zWPLCIdcWH
         45IA==
X-Forwarded-Encrypted: i=1; AJvYcCWU3fUaDXejcHjaOofn2GgJ+VZuRnay/6YWseg+J6iHIe1IdBDUFsv8k7YTcdOMf8xQrNbu+r+vzN3BgtozQKBqKoppom1yjeRAT4PJf0o=
X-Gm-Message-State: AOJu0YzqjZYUwgzkx89wvORW+MIBLRDTgMMtBX824d6T6OtfQ+IjjoHC
	PjpG/hTus8pK9LQXZeGruVOwdvYBp0eHxpiBWEz+XzRwTbBIIELy2pP0m7X0Ebs8mZVpcGdHF10
	=
X-Google-Smtp-Source: AGHT+IEOeqv5pjvGX49hWwiGzGGV2HObGsJ93Fq6sl7jownTkJ6A9Nj8NDGsotAt6gN4GjRx/OJOIA==
X-Received: by 2002:a2e:8954:0:b0:2ea:e1fe:2059 with SMTP id 38308e7fff4ca-2ec5b2e62f4mr30360651fa.27.1719214291093;
        Mon, 24 Jun 2024 00:31:31 -0700 (PDT)
Message-ID: <ac46ccb1-9247-4b66-a21d-d9841ee9f1ef@suse.com>
Date: Mon, 24 Jun 2024 09:31:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] automation/eclair_analysis: deviate MISRA C Rule 21.2
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
 consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, xen-devel@lists.xenproject.org
References: <cover.1718816397.git.alessandro.zucchelli@bugseng.com>
 <5b8364528a9ece8fec9f0e70bee81c2ea94c1820.1718816397.git.alessandro.zucchelli@bugseng.com>
 <02ee9a03-c5b9-4250-960d-e9a2762605c8@suse.com>
 <alpine.DEB.2.22.394.2406201758490.2572888@ubuntu-linux-20-04-desktop>
 <650b7946-ddb5-4428-b6d9-d8f6e0b0f8b9@suse.com>
 <alpine.DEB.2.22.394.2406211619070.2572888@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2406211619070.2572888@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.06.2024 01:27, Stefano Stabellini wrote:
> On Fri, 21 Jun 2024, Jan Beulich wrote:
>> On 21.06.2024 03:02, Stefano Stabellini wrote:
>>> On Thu, 20 Jun 2024, Jan Beulich wrote:
>>>> On 19.06.2024 19:09, Alessandro Zucchelli wrote:
>>>>> Rule 21.2 reports identifiers reserved for the C and POSIX standard
>>>>> libraries: all xen's translation units are compiled with option
>>>>> -nostdinc, this guarantees that these libraries are not used, therefore
>>>>> a justification is provided for allowing uses of such identifiers in
>>>>> the project.
>>>>> Builtins starting with "__builtin_" still remain available.
>>>>>
>>>>> No functional change.
>>>>>
>>>>> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
>>>>> ---
>>>>>  automation/eclair_analysis/ECLAIR/deviations.ecl | 11 +++++++++++
>>>>>  1 file changed, 11 insertions(+)
>>>>>
>>>>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>> index 447c1e6661..9fa9a7f01c 100644
>>>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>> @@ -487,6 +487,17 @@ leads to a violation of the Rule are deviated."
>>>>>  # Series 21.
>>>>>  #
>>>>>  
>>>>> +-doc_begin="Rules 21.1 and 21.2 report identifiers reserved for the C and POSIX
>>>>> +standard libraries: if these libraries are not used there is no reason to avoid such
>>>>> +identifiers. All xen's translation units are compiled with option -nostdinc,
>>>>> +this guarantees that these libraries are not used. Some compilers could perform
>>>>> +optimization using built-in functions: this risk is partially addressed by
>>>>> +using the compilation option -fno-builtin. Builtins starting with \"__builtin_\"
>>>>> +still remain available."
>>>>
>>>> While the sub-section "Reserved Identifiers" is part of Section 7,
>>>> "Library", close coordination is needed between the library and the
>>>> compiler, which only together form an "implementation". Therefore any
>>>> use of identifiers beginning with two underscores or beginning with an
>>>> underscore and an upper case letter is at risk of colliding not only
>>>> with a particular library implementation (which we don't use), but
>>>> also of such with a particular compiler implementation (which we cannot
>>>> avoid to use). How can we permit use of such potentially problematic
>>>> identifiers?
>>>
>>> Alternative question: is there a way we can check if there is clash of
>>> some sort between a compiler implementation of something and a MACRO or
>>> identifier we have in Xen? An error or a warning from the compiler for
>>> instance? That could be an easy way to prove we are safe.
>>
>> Well. I think it is the default for the compiler to warn when re-#define-
>> ing a previously #define-d (by the compiler or by us) symbol, so on that
>> side we ought to be safe at any given point in time,
> 
> OK, that's good. It seems to me that this explanation should be part of
> the deviation text.
> 
> 
>> yet we're still latently unsafe (as to compilers introducing new
>> pre-defines).
> 
> Sure, but we don't need to be safe in relation to future compiler. Right
> now, we are targeting gcc-12.1.0 as written in
> docs/misra/C-language-toolchain.rst. When we decide to enable a new
> compiler in Xen we can fix/change any specific define as needed. Also
> note the large amount of things written in C-language-toolchain.rst that
> need to be checked and verified for a new compiler to make sure we can
> actually use it safely (we make many assumptions).
> 
> 
>> For built-in declarations, though, there's nothing I'm aware of that
>> would indicate collisions.
> 
> For builtins, Alessandro was suggesting -fno-builtin. One question to
> Alessandro is why would -fno-builtin only "partially" address the
> problem.
> 
> Another question for Jan and also Alessandro: given that builtins
> starting with __builtin_ remain available, any drawbacks in using
> -fno-builtin in a Xen build?

Just to mention it - we're building with -fno-builtin already anyway.
What I'm puzzled by is that it looks like I was under the wrong
impression that we're actually building -ffreestanding (which implies
-fno-builtin).

Jan

