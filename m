Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B219B4AED
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 14:31:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827419.1242024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5mJZ-0006mb-HG; Tue, 29 Oct 2024 13:31:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827419.1242024; Tue, 29 Oct 2024 13:31:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5mJZ-0006jz-E4; Tue, 29 Oct 2024 13:31:17 +0000
Received: by outflank-mailman (input) for mailman id 827419;
 Tue, 29 Oct 2024 13:31:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E68c=RZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t5mJY-0006jo-O3
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 13:31:16 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11a29ed9-95fa-11ef-a0c3-8be0dac302b0;
 Tue, 29 Oct 2024 14:31:14 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4316a44d1bbso50082005e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 06:31:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4319360d32bsm144263845e9.46.2024.10.29.06.31.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 06:31:13 -0700 (PDT)
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
X-Inumbo-ID: 11a29ed9-95fa-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmUiLCJoZWxvIjoibWFpbC13bTEteDMyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjExYTI5ZWQ5LTk1ZmEtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjA4Njc0LjM5NTUzMywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730208674; x=1730813474; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kx44HI33RYWboMoxZ7ovpZm2AGUdgnridxr3Yf4WQVE=;
        b=IGpuMPOtg8+8V4oJiE1xiebtifuhN3XcbJdSNeW6F8OzM6jCCdOTjx9Wn/4O+wQ2qL
         1x6sA2v6Qu8j0VfjVNuDzIrnnync6hs7+ouG+aBbi3BxzQJOoYc1GgMYlRUjaGKosA/b
         79UErJlN5wrsrXbA4erXLKI0f+jfqmJ0L0JkMX2ZvGMPqFOrGDG+olkf4M+M+c3CXujQ
         7kSPTNDFYgmjrFl41/7yAbBUmfWlwUT2V8aYPuya0xznb34n12mQYE4WDBeUC+EuO7FC
         sMoCV77P/17N7Sdo8dZgdZzKeFWS8w6ExIQsTXqlvLGmRd54WZSiQMpIWWluUXkX5794
         VkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730208674; x=1730813474;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kx44HI33RYWboMoxZ7ovpZm2AGUdgnridxr3Yf4WQVE=;
        b=qRARj5sF1+ArVkLm78SlfTq3Ua4u/vJUhBGZVWbjLJcgcsFaMnEanp7xsk0mQsS7D2
         DDBgIgwtNZY+sEk6WnMP9zFo5a2Vtp/U3yTpx8GbxEtXqiF0SrSs6BTQm4G2GXdJvUzz
         pQ39lS7LcWUGDrNVvI+v2PXqvcIsnfMhf7hzUc5hVwYxNIqo7tjSWR6gA13mG0J+0A6O
         vENpZMg5ktHh91Nf/pqctWuMwQf7+l7TCHFd9cTZH0XElsHb/lRSMuvqAqfgGidWaHh2
         WgpsZWcR52fmI+XPnBwvcQ6BoWYs7DNJamKatSpTp/f0wjRzolV2ptscZzI1MtGKM5VC
         +n8A==
X-Forwarded-Encrypted: i=1; AJvYcCWIKyZWRefUtNkVd3FBSyoqZy6nCNe7Dq+mryaR1tL41aU60jMa4LfijTZk+eCZ7h2k/N7Z1peYZVU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy6vfwF8UAPEohZmutWQnUaDlz2UhU099NEk30JIAWgv2ZVlQKS
	cpKSIbzE3s3ogLIdntVzMsRvg8lsAwPhG0OdOysNxwmmD9yRN4YZwCFlVroRug==
X-Google-Smtp-Source: AGHT+IGQ3JOkVgbfT2tk56ZbMEEwbOD9xvXCYKZrSYwJM625Brhu2gYXo5AOaB8Bg7PMgOaOPkW3xA==
X-Received: by 2002:a05:600c:4f15:b0:431:5f9e:3f76 with SMTP id 5b1f17b1804b1-4319acaf35emr120370715e9.16.1730208673740;
        Tue, 29 Oct 2024 06:31:13 -0700 (PDT)
Message-ID: <aeaa64ed-91f3-4856-8938-195436427892@suse.com>
Date: Tue, 29 Oct 2024 14:31:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/14] x86/xstate: Map/unmap xsave area in
 xstate_set_init() and handle_setbv()
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
 <20241028154932.6797-6-alejandro.vallejo@cloud.com>
 <4f49f8df-d455-4be2-a245-e876713addf1@suse.com>
 <D58B4QZAZKUD.3BAWPZIU90TND@cloud.com>
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
In-Reply-To: <D58B4QZAZKUD.3BAWPZIU90TND@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.10.2024 14:00, Alejandro Vallejo wrote:
> On Tue Oct 29, 2024 at 8:26 AM GMT, Jan Beulich wrote:
>> On 28.10.2024 16:49, Alejandro Vallejo wrote:
>>> --- a/xen/arch/x86/xstate.c
>>> +++ b/xen/arch/x86/xstate.c
>>> @@ -993,7 +993,12 @@ int handle_xsetbv(u32 index, u64 new_bv)
>>>  
>>>          clts();
>>>          if ( curr->fpu_dirtied )
>>> -            asm ( "stmxcsr %0" : "=m" (curr->arch.xsave_area->fpu_sse.mxcsr) );
>>> +        {
>>> +            struct xsave_struct *xsave_area = vcpu_map_xsave_area(curr);
>>> +
>>> +            asm ( "stmxcsr %0" : "=m" (xsave_area->fpu_sse.mxcsr) );
>>> +            vcpu_unmap_xsave_area(curr, xsave_area);
>>> +        }
>>
>> Since it's curr that we're dealing with, is this largely a cosmetic change? I.e.
>> there's no going to be any actual map/unmap operation in that case? Otherwise
>> I'd be inclined to say that an actual map/unmap is pretty high overhead for a
>> mere store of a 32-bit value.
> 
> Somewhat.
> 
> See the follow-up reply to patch2 with something resembling what I expect the
> wrappers to have. In short, yes, I expect "current" to not require
> mapping/unmapping; but I still would rather see those sites using the same
> wrappers for auditability. After we settle on a particular interface, we can
> let the implementation details creep out if that happens to be clearer, but
> it's IMO easier to work this way for the time being until those details
> crystalise.

Sure. As expressed in a later reply on the same topic, what I'm after are brief
comments indicating that despite the function names involved, no actual mapping
operations will be carried out in these cases, thus addressing concerns towards
the overhead involved.

Jan

