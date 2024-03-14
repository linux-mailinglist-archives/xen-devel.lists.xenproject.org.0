Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1A287B81C
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 07:57:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692876.1080469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkf0s-0007lS-9Q; Thu, 14 Mar 2024 06:56:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692876.1080469; Thu, 14 Mar 2024 06:56:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkf0s-0007jA-6A; Thu, 14 Mar 2024 06:56:26 +0000
Received: by outflank-mailman (input) for mailman id 692876;
 Thu, 14 Mar 2024 06:56:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n3nm=KU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rkf0r-0007j1-0Y
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 06:56:25 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f71f0708-e1cf-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 07:56:21 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-513c8b72b24so761794e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 23:56:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 i26-20020a17090671da00b00a46231722ffsm393340ejk.26.2024.03.13.23.56.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Mar 2024 23:56:20 -0700 (PDT)
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
X-Inumbo-ID: f71f0708-e1cf-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710399381; x=1711004181; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4bsRFjvEs9d2X4RMP01V0aWA4NbOMHn0nWSvnkSs0c4=;
        b=gnbUvIBM2lbZWDFJGCHwReS+q8JvAaybt52o5k/J3P0Q32SfrUZmlwE9aK23QYtnk4
         ioMKIlMHgJ9tMKwexA+7nyC5l1W/1PEEpU6namPowv+aPMT8bRdJE2LnMxgXCwR41EjF
         rM67IGrSaIiaU1ZSkYRrcw1T3wwPSmvcQo3fsT81YZe89+fkWqEsTECioxZw4ZgPQzye
         iKHvE+TXUf1knjshH5uV/+97NDOTUOAYy4cB0FGjD877yz52o2zvkYLZq/C3drjHB3yp
         KP1IGhpb9jVw3hHgWlek5AFQB5LVLJ2z7SQfB93w3G+X+sL2cS0kClv4KOatxJk25MU8
         5/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710399381; x=1711004181;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4bsRFjvEs9d2X4RMP01V0aWA4NbOMHn0nWSvnkSs0c4=;
        b=D8JZ1YetGTKzpi3GHMmw5ot+4JqRRUE6nSxFUgMINfmjT2iHWYrhKpWRHgXzBY11JN
         HX0qi6WAJrTohD6RoZc/bRL0F1466t7G83ai9pMxHa/mDjucrmHApc2M0m9moK2lkBwW
         hcu1JIAJKCm86kwdZf0JyOCLfHNZvNNn/t45SUSEut5Cc0yHRMV5w6lEtEmsyRVfLRHb
         UM1rj8/+/nTIGbLLWbVIW+cICkJVTGT3CTumUjXHNLTFmxJde8op73jzij/Ag9GbUl7V
         4B/9Erhrmg1TS/woLUa+pcct8W9Gto7u5jSfmceFaagL+udjdwz+HSEEGaM50fFhsDnn
         Ogug==
X-Forwarded-Encrypted: i=1; AJvYcCW7P8aTisOFIchYB4Zng6mVCU8kDMkSyx8PXz2XjcagAeX5ulZ3whbhOrMgSJ1O2SIqidf8Y9y8A8UcwznW/O+h9fJ3JbUHuXU7yhzQ4lk=
X-Gm-Message-State: AOJu0YwygoTfAAez4LeYnOIPMrfttgUzvOW3ojpg22GHYSx83zhk0QyY
	dTc/pj2L/UzNTVpMuUOYcOiSDNYMJjQMIIABdQ0ZkwOfXCwRLV0R7OyAylpwYA==
X-Google-Smtp-Source: AGHT+IGgHPeJlmnkLd9D6K+sgH0kd6RJ4KwJ6Pa0Bf4BUEL4LzxqyR31kpGaPDfbL0OHsX7EThy/ag==
X-Received: by 2002:a19:2d55:0:b0:512:ab58:3807 with SMTP id t21-20020a192d55000000b00512ab583807mr533489lft.9.1710399381036;
        Wed, 13 Mar 2024 23:56:21 -0700 (PDT)
Message-ID: <a92e5343-ab40-448e-a05c-84a5c2ffb95c@suse.com>
Date: Thu, 14 Mar 2024 07:56:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/misra: add Rule 16.4
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, bertrand.marquis@arm.com, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2403121725370.853156@ubuntu-linux-20-04-desktop>
 <136e4667-8c6d-45ec-b652-b6b690a16f34@suse.com>
 <alpine.DEB.2.22.394.2403131554100.853156@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2403131554100.853156@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2024 00:04, Stefano Stabellini wrote:
> On Wed, 13 Mar 2024, Jan Beulich wrote:
>> On 13.03.2024 01:28, Stefano Stabellini wrote:
>>> +       Switch statements with integer types as controlling expression
>>> +       should have a default label:
>>> +
>>> +       - if the switch is expected to handle all possible cases
>>> +         explicitly, then a default label shall be added to handle
>>> +         unexpected error conditions, using BUG(), ASSERT(), WARN(),
>>> +         domain_crash(), or other appropriate methods;
>>> +
>>> +       - if the switch is expected to handle a subset of all
>>> +         possible cases, then a default label shall be added with an
>>> +         in-code comment as follows::
>>> +
>>> +             /* only handle a subset of the possible cases */
>>> +             default:
>>> +                 break;
>>
>> Unless it being made crystal clear that mechanically reproducing this
>> comment isn't going to do, I'm going to have a hard time picking
>> between actively vetoing or just accepting if someone else acks this.
>> At the very least, though, the suggested (or, as requested, example)
>> comment should match ./CODING_STYLE. And it may need placing
>> differently if I understood correctly what Misra / Eclair demand
>> (between default: and break; rather than ahead of both).
>>
>> The only place I'd accept a pre-cooked comment is to cover the
>> "notifier pattern".
> 
> Hi Jan, 
> 
> During the MISRA C call we discussed two distinct situations:
> 
> 1) when the default is not supposed to happen (it could be an BUG_ON)
> 2) when we only handle a subset of cases on purpose
> 
> For 2), it is useful to have a comment to clarify that we are dealing
> with 2) instead of 1). It is not a pre-cooked comment. The comment
> should be reviewed and checked that it is actually true that for this
> specific switch the default is expected and we should do nothing.
> 
> However, the comment is indeed pre-cooked in the sense that we don't
> need to have several different variations of them to explain why we only
> handle a subset of cases.
> 
> The majority of people on the call agreed with this (or so I understood).

Hmm, my -0.5 was on the understanding that we would not encourage entirely
mechanical adding of such comments. Yet providing a pre-worded comment
here does exactly this, in my opinion. Imo here it should be made clear
_where_ the comment needs to be put, but not how it is to be worded. As
was (largely) settled on during the discussion, the comment doesn't need
to go into a great level of detail.

Jan

