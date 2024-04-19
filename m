Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F888AA853
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 08:18:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708734.1107815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxhZg-0002Fb-KS; Fri, 19 Apr 2024 06:18:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708734.1107815; Fri, 19 Apr 2024 06:18:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxhZg-0002Di-HK; Fri, 19 Apr 2024 06:18:16 +0000
Received: by outflank-mailman (input) for mailman id 708734;
 Fri, 19 Apr 2024 06:18:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EmAy=LY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxhZe-0002Da-Vq
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 06:18:14 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99c508c4-fe14-11ee-94a3-07e782e9044d;
 Fri, 19 Apr 2024 08:18:12 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-418c2bf2f15so14008905e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 23:18:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 hg12-20020a05600c538c00b00415dfa709dasm5176286wmb.15.2024.04.18.23.18.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 23:18:12 -0700 (PDT)
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
X-Inumbo-ID: 99c508c4-fe14-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713507492; x=1714112292; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2T8c1XxGPTwukkqH1z7j6GPCL0Sa7MRpS26jI3aCnoE=;
        b=MBZ0Mx+VNVw7UYy+tsY/kfQ/n2dpW5TLV9MbquueHKjjoefJ1Qn03UA/mWEMfjw43h
         fi5VXzVNVtA3KpDCby73BklD8E8TnhmarZAFv9VP0v7HQG24rkya6RKJb+6W73f5/SPZ
         OJOk2mGuszUpn1KKQdeQYV+4K0nS4r93fnwb7WIe1iv4AYkpcjLFFBo7IAjuUqpGOs7V
         v40B+Iu+IlMf2rZxn7Ezrosj1rPEtttEerF6Rxn9SdAJdTA5QqgwgSF0ZpzNQ9iqqxds
         BtiX7h6NsY5OjKB22O3CzRbkNGilYY9AWI7Sis0GysMzexb4fSrD43Ujt7/exaRyQ8K3
         T4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713507492; x=1714112292;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2T8c1XxGPTwukkqH1z7j6GPCL0Sa7MRpS26jI3aCnoE=;
        b=wKxSbOI8UQwJx1l6h7gdpV0dvpYHQDCF24ex8OMN7mQ2fhrilZ/1AuLnNwsa+eP7md
         vdx0SSU3SvMPbS1RLGxkibqwTPkXC5kMCn4h+7e9xs7DveppNFdHvmfnKaM7MHZyqIpB
         gEIo5HwNx5yoj1PYwdKMmSQRHZjTMf2nhh30i+mTgDQ5h79+xo3YAkVsHAiXG51VR4GG
         POM+Fq75LJSAhCJE8TZByAsLLt4NTLYAADqRM7Fyj8kow8CcC0HiQUFApib+k5yLK42L
         paimrA33BuEsCIZkkkNV683i06YiesJBgj1sahChinkBKbl1cgao66MfWHySmaS+mAkP
         OKPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSUZOjl1npdYiPqPFo4m4aOiIEIKljFDWnPGXeSYVhqWWEhdaDbqBP+z5dvDWy7dz48/DdkuXi+C5AkTLc/XngP4ObrK+K6aVpZjG11Ew=
X-Gm-Message-State: AOJu0YygPfJskHEkwFzKWlktD494FAMxSBXHnDiAevvCzhEAMu2ViCP2
	Ncu01ezpV1EbVjAOJTEOHj8p7E0qcium9wnUEPknw6jiaaOH0O6oFLNU7C3jGg==
X-Google-Smtp-Source: AGHT+IElBF9fp1twwTJrf7TYR+i4ejhDV7xvxlmreapqR5TYQGvTvU8YdHKrYA/pjuBkYVERdBKcbA==
X-Received: by 2002:a05:600c:19c6:b0:416:b91c:f310 with SMTP id u6-20020a05600c19c600b00416b91cf310mr628134wmq.22.1713507492391;
        Thu, 18 Apr 2024 23:18:12 -0700 (PDT)
Message-ID: <f17d6f60-260f-4090-8a42-7bc1b7d93600@suse.com>
Date: Fri, 19 Apr 2024 08:18:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] xen/memory, tools: Avoid hardcoding
 GUEST_MAGIC_BASE in init-dom0less
Content-Language: en-US
To: Henry Wang <xin.wang2@amd.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Alec Kwapis <alec.kwapis@medtronic.com>,
 xen-devel@lists.xenproject.org, Daniel Smith <dpsmith@apertussolutions.com>
References: <20240409045357.236802-1-xin.wang2@amd.com>
 <20240409045357.236802-5-xin.wang2@amd.com>
 <cc4fd69b-4866-4f1b-b780-64c5fac7d2d6@suse.com>
 <eaad1ad2-e6ec-42a6-a0fb-236ce93f0a9e@amd.com>
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
In-Reply-To: <eaad1ad2-e6ec-42a6-a0fb-236ce93f0a9e@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.04.2024 04:31, Henry Wang wrote:
> On 4/18/2024 8:54 PM, Jan Beulich wrote:
>> On 09.04.2024 06:53, Henry Wang wrote:
>>> --- a/xen/include/public/memory.h
>>> +++ b/xen/include/public/memory.h
>>> @@ -21,6 +21,7 @@
>>>   #define XENMEM_increase_reservation 0
>>>   #define XENMEM_decrease_reservation 1
>>>   #define XENMEM_populate_physmap     6
>>> +#define XENMEM_populate_physmap_heap_alloc 29
>> Without a comment, how is one supposed to know what the difference is of
>> this new sub-op compared to the "normal" one? I actually wonder whether
>> referring to a Xen internal (allocation requested to come from the heap)
>> is actually a good idea here. I'm inclined to suggest to name this after
>> the purpose it has from the guest or tool stack perspective.
>>
>> Speaking of which: Is this supposed to be guest-accessible, or is it
>> intended for tool-stack use only (I have to admit I don't even know where
>> init-dom0less actually runs)? In the latter case that also wants enforcing.
>> This may require an adjustment to the XSM hook in use here. Cc-ing Daniel
>> for possible advice.
> 
> This sub-op should be called by the init-dom0less application (toolstack 
> side), which runs in Dom0.

I'm puzzled: How can init-dom0less (note its name!) run in Dom0, when there
is none?

Jan

> Daniel has proposed an alternative solution 
> which is based on the hypfs. If we decide to go that route, I think I 
> will rewrite the series. I will wait for the discussion settled. Thanks 
> for looping in Daniel!
> 
> Kind regards,
> Henry


