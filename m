Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D55952A81
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2024 10:31:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777866.1187925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seVst-0004U8-AH; Thu, 15 Aug 2024 08:31:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777866.1187925; Thu, 15 Aug 2024 08:31:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seVst-0004SK-7V; Thu, 15 Aug 2024 08:31:03 +0000
Received: by outflank-mailman (input) for mailman id 777866;
 Thu, 15 Aug 2024 08:31:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/2Vq=PO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1seVsr-0004SC-5G
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2024 08:31:01 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2ae61e9-5ae0-11ef-8776-851b0ebba9a2;
 Thu, 15 Aug 2024 10:30:59 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5a156557029so893075a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Aug 2024 01:30:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83838eeedasm66156866b.94.2024.08.15.01.30.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Aug 2024 01:30:58 -0700 (PDT)
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
X-Inumbo-ID: b2ae61e9-5ae0-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723710658; x=1724315458; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KqhNUKWzkX3Hsi9auKRVSa8W8ju7kY0xwhZtcv9t7vU=;
        b=QJc236j2eQPU7LRE19TO1D8Ck2lrVWWFUxQvkbKJfJ8ZPv+vvga2azbkyOXv+HsBI1
         iqxNmYatPtPFHLZ1xaFPxFPhA4tUCCpsPPiPIrj8/RXEWkEvh2uxDQ49DCo3OItRgYBV
         S5Vi54QG7l6lZh3vnECrxmnxkd3Qx90ZLkVVyDvYdIPQ3jUPqjln3u/L6qZfVezQ7xDt
         A8wlzsdu8FiRayWDnsGi1yX4m4XF2PYRfMBnb6IKzryYsKeRp8Iz3J/01tYqArIuBAxh
         4/T4GZnGrBj5K1Ks/+taGH4JJlEyHvJcHxdtZS3vqOpPdrW2J3jc1geDu6RnNLFmzRJn
         eRVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723710658; x=1724315458;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KqhNUKWzkX3Hsi9auKRVSa8W8ju7kY0xwhZtcv9t7vU=;
        b=Hhy94Qi1YCMZsWpn1MZ3LdcdgOW8UKhtP8tUrSHVnBVPscW41o0XI5tC0eQ/XXD+uY
         G4uG3y4WPdHbVQAULUPTSAyjbs52XfDP4FGfeRicIoKNwvg3/lox8pMQtkuMBUcnYR2J
         Pzv4sREuK5dSx7MSbK9fIjDujlUEg9oysxndzNItkV9XseZXLt9ED9t0Tf7Ac1iF6yAa
         0IWZVVqc+x+1asjIQfb6IcP/TYASpS2tq+Eozdo9UlwNU2g3fqT57iWscxLgs1xqibyV
         iLIMUpxxJZPKVkJqRIWlLwvubAWBKBpy/mVjP1hEa/n+NWvwqnXp2FU9SzxlHuZsGd/Z
         Loyg==
X-Forwarded-Encrypted: i=1; AJvYcCVc5MnszNut8yc8EOGcvC1lgT+brrB9fWahjmrNsYOyNxnlWlZArEQkn60g9XxcUMRhf/IcRMZR7zLBQzFgFll6bCTvdvkpEdT5hzFcYtM=
X-Gm-Message-State: AOJu0Yx4YFdj2+Z9IJFQR8fjr+zhTk7d8KXh4JibkasjjtycAOWdl6by
	GhgXEtaq4710DsEJU8UJRp/sE4u+PAdeqOEIyQ907LbYcCh0wy85Uvg6yfNy/w==
X-Google-Smtp-Source: AGHT+IHHan37+3OyJBa+8vyR/+kSxbcoKZqvQ36DMIkHxcyLiExWC/VU6EJiUU6znXLwiIy+P4dR+Q==
X-Received: by 2002:a17:907:f704:b0:a7d:a00a:a9fe with SMTP id a640c23a62f3a-a8366c3130dmr357437566b.17.1723710658326;
        Thu, 15 Aug 2024 01:30:58 -0700 (PDT)
Message-ID: <ca41d1d0-a1b7-481b-ab80-f8dc79ea95b1@suse.com>
Date: Thu, 15 Aug 2024 10:30:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpufeatures: Add new cpuid features in SPR to
 featureset
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org, Matthew Barnes <matthew.barnes@cloud.com>
References: <09353a67d79b12f2ff2a9be797866902bcd71825.1723650205.git.matthew.barnes@cloud.com>
 <d2a71d20-d3c5-45cc-9e3e-10a0773508a0@suse.com>
 <9dec870a-5bdc-4539-afe9-228afb40249a@citrix.com>
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
In-Reply-To: <9dec870a-5bdc-4539-afe9-228afb40249a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.08.2024 18:46, Andrew Cooper wrote:
> On 14/08/2024 4:58 pm, Jan Beulich wrote:
>> On 14.08.2024 17:52, Matthew Barnes wrote:
>>> Upon running `xen-cpuid -d` on a host machine with Sapphire Rapids
>>> within Dom0, there exist unrecognised features.
>> Without looking at the particular bits yet, just a question up front:
>> Why SPR?
> 
> Because it's what we have easily to hand right now.
> 
> I veto'd doing this based on pre-release hardware, because they often
> contain NDA content which we shouldn't be publishing, or at least
> "publishing yet".
> 
> We should be getting production EMR soon.

Surely I didn't ask for anything not public yet. Yet what about Alder
Lake? That looks to have KeyLocker (patches for which I didn't even
post yet, for multiple reasons) and 7:1.eax[22] (whatever that is) on
top of what SPR has.

>>  There's newer hardware available with presumably yet more newly
>> used bits. If the goal is to cover everything that's known, this is only
>> one step in the right direction.
> 
> Correct, but it is *a* step, and that's fine.
> 
> We anticipate doing patches like this for every new generation, as part
> of our own checks to support the CPU.  Right now there's a bit of a backlog.

Right. What you stripped of my earlier reply is "Which would be okay if
expressed that way, ideally with a plan to subsequently go further."

Jan

