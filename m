Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC30838807
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 08:36:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670268.1042905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSBJK-00057Q-OC; Tue, 23 Jan 2024 07:35:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670268.1042905; Tue, 23 Jan 2024 07:35:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSBJK-00055p-Kh; Tue, 23 Jan 2024 07:35:06 +0000
Received: by outflank-mailman (input) for mailman id 670268;
 Tue, 23 Jan 2024 07:35:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9pmr=JB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSBJI-00055d-L9
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 07:35:04 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebb22a6c-b9c1-11ee-98f4-6d05b1d4d9a1;
 Tue, 23 Jan 2024 08:35:03 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-55c6bc3dd54so1660049a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jan 2024 23:35:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l4-20020a056e020e4400b00361a956a57bsm3068606ilk.53.2024.01.22.23.35.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jan 2024 23:35:02 -0800 (PST)
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
X-Inumbo-ID: ebb22a6c-b9c1-11ee-98f4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705995302; x=1706600102; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F2YMk1NYsryxpouxVJNNVfxMvdmZjN9wWwIYofwyfSk=;
        b=TO8s+kffylfy0XzQ4vkK/+1alLRiED/iBWkuvFG3AaZQ86N40oQMY5udQIGLOboEnF
         bM6gsWueI4la2Nd5h6wnmR+/gsieaUrnVnLvo1MOXZmU53Hbuz/OUNdwCMGDRInGzQe2
         00jF1N4kx+oxL8fb1ob9kCpOiS602KiJza814IzjTo+VfXrqSmTgTMbI8HCa/rHpIkEH
         bjepYiIkcZoGhz4yKpJ4htapoEKl83aCNSe9WgIn7LUwgDuTEyaXqAC2pglkl18bI7lN
         l21Kt4aQ8mVhDJa+ZbdcoLLncpIo7C6mvgu2Gi/U53oj3yTjNXgQI/kSx1PTf5nHnLUY
         seMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705995302; x=1706600102;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F2YMk1NYsryxpouxVJNNVfxMvdmZjN9wWwIYofwyfSk=;
        b=jP/6g6fDTxsa0o/URaxBOwkdOvC/nCI2mDs8V/w2rizgxPUG2M8cc99YjJCjBPtDZ6
         rUxIj9WgHjPbjHwcwEmD6rtmq1g/sDfk2nSSXEEEMpF3Qea77+P8C+3bU274DO0CDDWo
         SkJASB+NW47f90ViSSHbe2RfFO4yBlih+hehBXZX9n9WGynDfWf28Onh8qr4U0CdvFlm
         NYIzVZ1Z1A0mIvE0iDKBgHiOtwHsnPos9Wbx2niHVgZeJmHrcRaaHs+oBPyf3tqyV0KF
         fw10NWgotNaShHMwOuxGrdwlJYncQrXSVekkiTV65TP1W69GLDTCUfNp1Kst6X63sCpi
         ZEiA==
X-Gm-Message-State: AOJu0YzdX/XYEYRPsa31spsnya9tqdBcYc9bc6H+xe5kPlg3Bo1RWdNc
	HLOJ9Wty90u28IZdUbmiCR03MGjzovVO3xzhK8XeBtWkS3mqpmEc8R8DtilAVQ==
X-Google-Smtp-Source: AGHT+IFJcQFCXTzzM4K6+LH482bXtl399K3xjD0TTg9Or2/V83r+/5vMRGK7+niBaMDuki71siwblQ==
X-Received: by 2002:a17:906:3044:b0:a2f:ebb:f200 with SMTP id d4-20020a170906304400b00a2f0ebbf200mr7115221ejd.9.1705995302591;
        Mon, 22 Jan 2024 23:35:02 -0800 (PST)
Message-ID: <ecddb385-fc87-412b-a956-0a08237cc120@suse.com>
Date: Tue, 23 Jan 2024 08:34:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Community Process Group - Proposal
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Kelly Choi <kelly.choi@cloud.com>, committers@xenproject.org,
 advisory-board@lists.xenproject.org, xen-devel@lists.xenproject.org
References: <CAO-mL=yvVWjnOHSFSqcrknoXOqk-N3JY76qObQnzftrkmsq6xw@mail.gmail.com>
 <5309e7d3-7b3c-4522-99dc-bbd7734aeb34@suse.com>
 <alpine.DEB.2.22.394.2401221434440.2287888@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2401221434440.2287888@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.01.2024 23:47, Stefano Stabellini wrote:
> On Mon, 22 Jan 2024, Jan Beulich wrote:
>> What definitely needs clarifying is what "review" is: Are R-b tags
>> counted, or is it the number of replies sent commenting on patches?
> 
> Yes, I think this needs to be clarified. I would say Reviewed-by tags.

Which may end up unfair. It's not uncommon for one person to do a lot
of review on a patch, and for someone else to then ack the final
version that goes in. In the end this is then no different from basing
the decision on simple numbers, without regard to actual (potentially
heavily differing) effort behind each individual instance.

Jan

