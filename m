Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4E9C643DD
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 14:01:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163820.1490880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKyqj-0006Hg-7V; Mon, 17 Nov 2025 13:00:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163820.1490880; Mon, 17 Nov 2025 13:00:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKyqj-0006G7-4X; Mon, 17 Nov 2025 13:00:53 +0000
Received: by outflank-mailman (input) for mailman id 1163820;
 Mon, 17 Nov 2025 13:00:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Jhw=5Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vKyqh-0006G1-W9
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 13:00:51 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7173a6f0-c3b5-11f0-9d18-b5c5bf9af7f9;
 Mon, 17 Nov 2025 14:00:51 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b73161849e1so732153766b.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 05:00:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fb12d55sm1066391266b.33.2025.11.17.05.00.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 05:00:49 -0800 (PST)
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
X-Inumbo-ID: 7173a6f0-c3b5-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763384450; x=1763989250; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hR32BkG+qnm7Ig538z7j16ZWz1+yjSFqkFndhtSXAJ8=;
        b=arxSjLYtGiIUcyCAp4TJ24GIgnrXXX0i+QyOCkyTtT1JlhhX5RqCOx/K/fLYc+H10k
         0nU2ZlIRfJOxAobzTnIqGxS8MUDU+3Txk6hzdApbySfYbfhmbLtqDq/p3jZlF5VGQA3a
         sEmu3pk286mgT2bXXUr9iGPjt1T1MYJXa7vfb4/W7BQgAhdESgEylnKLI8x2wpljrmGS
         vCSmWP4qP72ktO8HyPwIwHVPF67ELuKWphPOOtMzSYNYTwkCAPMWlWSUPzoBIVKeUh/o
         FyGHLB79auc+GsT7Jln5+dspMabg0+sHLJjAwFcEAOPhiac56plZEVv5k4IwYpbhTpYa
         dxtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763384450; x=1763989250;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hR32BkG+qnm7Ig538z7j16ZWz1+yjSFqkFndhtSXAJ8=;
        b=c+6Gli1iRwHaerjqQ2gTg6JjkdWNM+K+Zyy9FWvhxVFXKmk1Qoi7vfPdeNqDLURdIM
         t7YqmcheBHusTEiUwA4w0A366jlfpytuGzrFMKFbKdbNATrki443JTJPdH4Y8VsuQgg0
         lWidsOaRgPLFvCruOzZxeHVl+/CWhAejXGG1t76zyzj8/TNQYlQNKuHtFevdIb8oqISf
         QBRfQ8nvIaghZTRH9gP4d0nJ82P4BGlBPPv7F6PHBFjntn74+H5c+I0WiuE2rsYiQYuy
         dXnVkXUapj+eo3YGqZSf8YV+Lb7pylRgQAJG+3lonmG5dLVFIL7dk/0vyahON1Dt4dIQ
         oPhA==
X-Forwarded-Encrypted: i=1; AJvYcCX0Cnd+YyYzxszAg8SQ679JP9NuRyc3YA+rG6mOlhvCKJgwrDRF4SMyz+RXTgQGyssd098fiJKw/cs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxNLAaYmqBGr/wPh769jylJf+lAbMCWDo/1/1dszJleQVucqrJk
	lZViZPBKAU7cGN1Tq/Xeailcqd+IzoAOCYoF4tkzgOvbMU1a84hwEfwHfJt1VTCuUA==
X-Gm-Gg: ASbGnctptbLj1twFTIIxUN/wjmTetHN0IDzs6z8pr9tnfpbMtTz1a8gHWoPJ4Cna+PB
	MRiUXJSSY11zngsVCixl1zUNEsQLnj56tHNp+RvZMGoMDMpRdhK6eY0wl0NV/sNIKDwjkCYcFT6
	vQBgSdIMr7BdZlCS++O1jnPM1HLO3VBh/WxvpWLA9wa503cSwBNiZSHNNyao8tTOus4Sfw65DJ9
	t+p8ltlUAo6wGDSL0Rz+94PIKnPiDpoWwcSUJTMYovfydYSyel4Faol4uOSNdLAl1KCTc1Qw06v
	ptfJD3PaZfvC5R3XgXs6dLvxwSkj6wyiyh8s1I8tQYO+eDPq7K2CZUbGvLWa2HFGeL9fVhzcNnY
	DEwUqtQPj5GRxyGEBsLOCryszDEQtw+0G/3VZ2ztDYshKD7twJ6y6HdQ3WZCSJ1jF0YFQUbQ8gk
	CQl1S5Fnc49E4yGteMkw/XwLz9Y+d5HW3DhattLHXyzwcblkMhpbh1hTi6IEZUDzSi
X-Google-Smtp-Source: AGHT+IGivTba1mUcXbfNSJpz6zmj07VcjbKAKE1iNNss83SDjDdInfKhXIQFeIWW+6g/DGJha7vKvQ==
X-Received: by 2002:a17:906:24d9:b0:b73:9fea:331c with SMTP id a640c23a62f3a-b739fea3914mr266320766b.47.1763384450274;
        Mon, 17 Nov 2025 05:00:50 -0800 (PST)
Message-ID: <45c6d3dd-3901-4609-918b-ba6b685d6496@suse.com>
Date: Mon, 17 Nov 2025 14:00:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] docs: replace @xxx@ markers at build time
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20251114113238.9279-1-jgross@suse.com>
 <20251114113238.9279-3-jgross@suse.com>
 <7e24823f-cce1-4430-83f1-ebde6986efa4@citrix.com>
 <2de93313-9f1b-46a7-99c8-618281aff2f1@suse.com>
 <e4d19c4e-8eac-400f-8e3a-83684a290da6@suse.com>
 <0ed9b152-6465-4736-be59-352d68b77e6f@suse.com>
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
In-Reply-To: <0ed9b152-6465-4736-be59-352d68b77e6f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.11.2025 13:55, Jürgen Groß wrote:
> On 17.11.25 13:33, Jan Beulich wrote:
>> On 14.11.2025 14:00, Jürgen Groß wrote:
>>> On 14.11.25 12:40, Andrew Cooper wrote:
>>>> On 14/11/2025 11:32 am, Juergen Gross wrote:
>>>>> diff --git a/docs/Makefile b/docs/Makefile
>>>>> index 37776d303c..e5f4a8ca86 100644
>>>>> --- a/docs/Makefile
>>>>> +++ b/docs/Makefile
>>>>> @@ -8,8 +8,11 @@ DATE		:= $(call date,"+%Y-%m-%d")
>>>>>    DOC_ARCHES      := arm ppc riscv x86_32 x86_64
>>>>>    MAN_SECTIONS    := 1 5 7 8
>>>>>    
>>>>> +IN_FILES := man/xl-disk-configuration.5.pod man/xl-network-configuration.5.pod
>>>>> +IN_FILES += man/xl.1.pod man/xl.cfg.5.pod man/xl.conf.5.pod
>>>>
>>>> Sorry, I meant to say this on the previous revision.  Can we please list
>>>> these one per line, for the future ease of inserting/removing.
>>>
>>> Okay.
>>>
>>>> Is IN_FILES really correct?  These are the generated (non-.in) files,
>>>> rather than the .in files themselves.  GEN_FILES from v1 would seem to
>>>> be a better fit.
>>>
>>> I wanted to make clear this is related to *.in files. And IMHO GEN_FILES
>>> was too generic on a second thought.
>>>
>>> GENERATED_FROM_IN_SUFFIXED_FILES seems a little bit clumsy. ;-)
>>> Seriously, if you have any better name, I'd be happy to use it.
>>
>> GEN_POD_FILES, seeing they're all *.pod?
> 
> For this case, maybe. OTOH in case someone adds a .podman file we'd need
> to rename again.
> 
> And I think using the same make variable name in all Makefiles needing to
> specify *.in derived files would be preferable.
> 
> Maybe IN_TARGETS?

Better than IN_FILES, but still potentially ambiguous. How about sticking
to IN_FILES but indeed enumerating the .in there (zapping the suffix upon
use)? And/or would $(wildcard <path>/*.in) perhaps make sense to use?

Jan

