Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15074A35811
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 08:42:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888443.1297803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiqKh-0002FT-GZ; Fri, 14 Feb 2025 07:41:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888443.1297803; Fri, 14 Feb 2025 07:41:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiqKh-0002Dg-Dd; Fri, 14 Feb 2025 07:41:55 +0000
Received: by outflank-mailman (input) for mailman id 888443;
 Fri, 14 Feb 2025 07:41:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PTsb=VF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tiqKf-0002DX-Mc
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 07:41:53 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27851e69-eaa7-11ef-9896-31a8f345e629;
 Fri, 14 Feb 2025 08:41:51 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5de4d3bbc76so2796603a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2025 23:41:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba5327fc9bsm286937566b.75.2025.02.13.23.41.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 23:41:50 -0800 (PST)
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
X-Inumbo-ID: 27851e69-eaa7-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739518911; x=1740123711; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aTyRzyGEVvYsztKHGC5UbChYw2ThJpxXpEiMWvn1fKo=;
        b=L36d3dKHYW4XDbMZtPfe3v0nL8xM4jyz7rr6WCgsgrn0gw3xOq0rrhaxOZuZ+rk6u5
         FIhSnWSu46yyNefcKIW2yUHINwS3E5EE4wPuhviWch2QQuMH/Lp09Bf5kfQeH8QSSt0Y
         Upuq14e27QBk1GBUhhAq2PSQ6hfSIDTUlQDbM0MV9xaxa7GX6dkT2fM77rlX/amvfiUg
         dveUJmgFQpuYgzFvxR4fLDMMmQVcY+tE1EibDZBTkYMy+E8u2HfuofavrBNHXygDJ7Sa
         eKj8gPCS5h73nqlxyTkmHJKyMseYTHwwS1hL/NFhgfVymP/y6q39Ws0ggN4p+vvQoFVE
         Bg9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739518911; x=1740123711;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aTyRzyGEVvYsztKHGC5UbChYw2ThJpxXpEiMWvn1fKo=;
        b=mOcYZdWl2QExmAZ2ujl3x71wkBjCrPDtMfPAMPIMLxD1on6S+vB9bB15K88NNKGPQu
         OqQavHsYwOb4thKzhFkEc/P81FrlbfkpHve5kEQB/oJcLsI1Za66HZ8pCJ6rAnyONzx2
         xuNuoCaxLuf1O64o9C5P0J7OpOBZysQEXKC6OYdMe3vaD2HF1BOayvf2+P5/X6HkOszt
         fK5az9qZAs8ewhwfJzGgEsSSrF9uZ4Pxf3k8T7VGzlgncJGtcUscHze9OjZqYuILudEL
         LJs08QIPB6ulgQp70Ugpb/QFpEKMa3GO+txz6/HT69ZPg+TnzZEU8zeAUbGKrEshNEOQ
         H3Ww==
X-Forwarded-Encrypted: i=1; AJvYcCVsBsv2koKJT5JfYRP9scHhYFpWlquzfle9CoU2nkRIO/An3XcDP0DQwoPbln+VgNV+bQUTYoN8Dq8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzeQsSaxtg+NVWIH7SpTd3hBmKZsIgdLklrtJa9o862ACzbRRtF
	fLYleevjYrFyX/zlef67xnBuZyfzh/LsjrHx2bBSlhY1EYjjUi+qNK1qWgq24w==
X-Gm-Gg: ASbGncsEEWUB6EvkRT0tSq3J/c+mWy0falUJCFhTjfav6K9ZpcgbQr+wif6NW0tfVOY
	8/Ozv8dHwfLOPZ+/ydCWh9cM01Q1/zq153O3cp4hud3T5hLntHwIOdAo/Iv2HEv9iT95e8FmejL
	XX1Dli4IRMZXRwJ0C201rKIoIU088tsplG5jD5TD6e3KSo94nLrd+3LY1/SKcp0e549iEfNte+X
	plEn3i2NF1uoAedHd3/Y10Q1KJtZRaEdfJlP3xCSaImVEj022BOoBPdkmZX5xu6QaOe1Icj+wlq
	ob0Iu7i+qspHr3CNjUS6QmRFB1Z7QrOJ+G01KpfYfNWONJaUZtIsDatGI+jroP+4msxih6Vk5Wx
	g
X-Google-Smtp-Source: AGHT+IG+P6trcKnqz0FoEmviN5Y7HPyR0oZYI/zLkVVBU84smCqfFvYZCXEn0XT6N1+bs34clBpW2g==
X-Received: by 2002:a17:906:7956:b0:ab7:f221:f7b4 with SMTP id a640c23a62f3a-ab7f34738c0mr1009609166b.43.1739518911040;
        Thu, 13 Feb 2025 23:41:51 -0800 (PST)
Message-ID: <38644600-496e-420a-a5e3-6fd2c9975704@suse.com>
Date: Fri, 14 Feb 2025 08:41:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] radix-tree: don't left-shift negative values
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 Luca Fancellu <Luca.Fancellu@arm.com>
References: <70ebba90-59a8-4224-b67c-b9eb373684b4@suse.com>
 <0de3a7e8c55af172e7260f8bb22949b4@bugseng.com>
 <2118904d-3a33-47f3-af68-7303bc17186c@suse.com>
 <e34113912d9886a876fd5f3bd094abb2@bugseng.com>
 <8ca92f7360385a5b4033cf22ef843775@bugseng.com>
 <A7FE0F28-A75E-4CE1-B649-1D92BE334852@arm.com>
 <alpine.DEB.2.22.394.2502131120430.619090@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2502131120430.619090@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.02.2025 20:26, Stefano Stabellini wrote:
> On Thu, 13 Feb 2025, Luca Fancellu wrote:
>>> On 13 Feb 2025, at 15:42, Nicola Vetrini <nicola.vetrini@bugseng.com> wrote:
>>> On 2025-02-13 16:32, Nicola Vetrini wrote:
>>>> On 2025-02-13 16:01, Jan Beulich wrote:
>>>>> On 13.02.2025 15:52, Nicola Vetrini wrote:
>>>>>> On 2025-02-13 15:22, Jan Beulich wrote:
>>>>>>> Any (signed) integer is okay to pass into radix_tree_int_to_ptr(), yet
>>>>>>> left shifting negative values is UB. Use an unsigned intermediate type,
>>>>>>> reducing the impact to implementation defined behavior (for the
>>>>>>> unsigned->signed conversion).
>>>>>>> Also please Misra C:2012 rule 7.3 by dropping the lower case numeric
>>>>>>> 'l'
>>>>>>> tag.
>>>>>>> No difference in generated code, at least on x86.
>>>>>>> Fixes: b004883e29bb ("Simplify and build-fix (for some gcc versions)
>>>>>>> radix_tree_int_to_ptr()")
>>>>>>> Reported-by: Teddy Astie <teddy.astie@vates.tech>
>>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>>> ---
>>>>>>> Bugseng: Why was the 7.3 violation not spotted by Eclair? According to
>>>>>>>         tagging.ecl the codebase is clean for this rule, aiui.
>>>>>> radix-tree.{c,h} is out of scope:
>>>>>> automation/eclair_analysis/ECLAIR/out_of_scope.ecl:32:-file_tag+={out_of_scope,"^xen/include/xen/radix-tree\\.h$"}
>>>>>> docs/misra/exclude-list.json:153:            "rel_path":
>>>>>> "common/radix-tree.c",
>>>>> Is there a record of why they are excluded? Is it further explainable
>>>>> why exclude-list.json mentions only the .c file and out_of_scope.ecl
>>>>> mentions only the .h one? Shouldn't different parts be in sync?
>>>> exclude-list.json is used to generate a configuration file for ECLAIR just before the analysis starts, so effectively both are excluded. It's a good point however to have only one file to handle exclusions, and use that file to generate the exclusion list dynamically, but then someone might want to exclude certain files only in some analyses and not others, which is not a good fit for exclude-list.json as it is now.
>>>> @Stefano, thoughts?
>>>
>>> I forgot to address the first question: the (vague) reasons are listed in exclude-list.json as the "comment" field; in most cases, it's because the files have been imported from Linux, but the full rationale is something that should be asked to the original author, which is Luca Fancellu.
>>
>> So IIRC the full rationale is that since some files are imported from Linux, we would like to maintain them as they are
>> in order to ease backports. Misra fixes can be done, but they need to be upstreamed to Linux and backported to Xen.
>>
>> Probably a re-evaluation could be done by the maintainers to see if some of these files could be removed from the exclusion
>> list.
> 
> Yes, it is as Luca said. At the beginning of the project, we reviewed
> the codebase to define what was in scope and what was out of scope. One
> area of contention was the files imported from Linux. Many of these
> files were declared out of scope because we wanted to retain the ability
> to easily synchronize them with their corresponding files in Linux.  
> 
> Now, years have passed, and we have gained significant experience from
> running this project. It is completely acceptable to redefine the scope,
> including making changes to exclude-list.json.
> 
> However, we do not necessarily need to modify exclude-list.json to
> accept a single, clearly beneficial fix like this one. So, Jan, feel
> free to proceed and commit it.  

FTAOD - I didn't think there was anything in the way of me doing so, once
the tree re-opens. Question here is how many _else_ issues there are in
the radix tree code we've got (and in anything else presently excluded).

Jan

