Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC80940861
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 08:30:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767270.1177870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYgM6-00080E-Vi; Tue, 30 Jul 2024 06:29:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767270.1177870; Tue, 30 Jul 2024 06:29:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYgM6-0007xB-S0; Tue, 30 Jul 2024 06:29:06 +0000
Received: by outflank-mailman (input) for mailman id 767270;
 Tue, 30 Jul 2024 06:29:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hr/k=O6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYgM5-0007x5-TJ
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 06:29:05 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02e76180-4e3d-11ef-8776-851b0ebba9a2;
 Tue, 30 Jul 2024 08:29:02 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-59589a9be92so6450437a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 23:29:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac64eb3591sm6717367a12.67.2024.07.29.23.29.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 23:29:01 -0700 (PDT)
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
X-Inumbo-ID: 02e76180-4e3d-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722320942; x=1722925742; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o30rSjGyiLA+baByhVUoagAJ4Eom+O/0agfEBg6EUQY=;
        b=Y8X/uwXypuewe9oKyzlviHbuV9eU/IZFOnM2enzEek0ud7BFCEUtyihQGzBHiH1JvU
         7kf+Gokq1CmpKLX/XyiNOAOhWElMGPgwVYNTKZ+2BLLYO2Kb1Cf18EVz8oZuh6WkSO3e
         KUtB+q05+ElPDogRc6QD1ftCe+KChxf2xMTiHPHJVsaIF6K/WaRvLfSe9viXB436DMae
         eN4BmsbjbVOF84nb0AtjKX4O4Wd/2LzHgzJrKUeN99KS3x1dWyuH0pfVQCgS5c8IQ5iS
         +vp2/5zXzJf9sCKIQd43hSsv1+zBGV2qQcma3rE+LWTNTHraCfA1f6snAnPN+Sa7qLyJ
         4R6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722320942; x=1722925742;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o30rSjGyiLA+baByhVUoagAJ4Eom+O/0agfEBg6EUQY=;
        b=kAHefk+Ligr6ZKEeNFsugcbthPwwZJoqOJnW4I6k01VQKTL/wzpb7EMikTtldsP9no
         QmIjSzDinoqKlIZquOJXyun1MshEn4ZIn7EyLC3mgzkLeCdCGOJZDE3aokSZ642BSiZa
         wkbvGBt+DWFGZrdCtudTbZNwYIK3UMcPqye5NgaKh53YU6IJJE4dJUW//1b3X3wK2UXi
         yHUi6wEwbpnAdswdDFoJIuZz5KDS4FkrBTvQhfsN8+zXpYtzz0oeVvw7qFIZ5HeyVvuJ
         FdbaMShqvf/VdsBStVQG5bwdwsyamMct7sUiD5Wod/i3PnSYpJIn60MboBM8GI4SbKLb
         STEg==
X-Forwarded-Encrypted: i=1; AJvYcCXT6Q9cjCJZIylmEaVyRaIGmjDUiv2N1V7g07tkUcWG/nb05zmwRbI1ho21MGF0DNmccvZJPJRy81GPHCq2bTqVsXF5hk+DiXFxlirn5oQ=
X-Gm-Message-State: AOJu0YxQ/V5+WiVFI5mJ44I8q5bGXu0W35OCtRirE634ibkCKErq+5na
	Q/9Suhr2sJxsGCSg2jGmS5VPF8dWrptJaaC78YVLNzMz7ojGd56mctASujaSFg==
X-Google-Smtp-Source: AGHT+IH59fRTnHOIPue11mbvKplVBJZBUKMytES2o/lykZSYrTX/ZWE3ous8WgGmLHDSQaw9iZaPQw==
X-Received: by 2002:a50:d7c5:0:b0:5a2:1f7b:dffa with SMTP id 4fb4d7f45d1cf-5b020101f53mr6212972a12.3.1722320941473;
        Mon, 29 Jul 2024 23:29:01 -0700 (PDT)
Message-ID: <1cf7a97f-b9fd-4daa-851b-fb0fc43a2817@suse.com>
Date: Tue, 30 Jul 2024 08:29:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] xen: add no_instrument_function attributes
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20240729142421.137283-1-stewart.hildebrand@amd.com>
 <20240729142421.137283-2-stewart.hildebrand@amd.com>
 <baa57ab0-60c9-49b0-9601-09bea081ddd7@suse.com>
 <5d015d47-0ba0-4a3d-861e-2c7712d9a97d@amd.com>
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
In-Reply-To: <5d015d47-0ba0-4a3d-861e-2c7712d9a97d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.07.2024 20:56, Stewart Hildebrand wrote:
> On 7/29/24 10:55, Jan Beulich wrote:
>> On 29.07.2024 16:24, Stewart Hildebrand wrote:
>>> In preparation for using -finstrument-functions option, we need to tag a
>>> few functions that don't work well with such instrumentation. If we
>>> don't intervene, we would end up with linker errors such as undefined
>>> reference to __bad_cmpxchg.
>>
>> I can't spot mention of such a side effect from the documentation. Talk
>> there is of function calls being added at function entry and exit.
>> Nothing is being said that calls to other functions would also be
>> affected.
> 
> Oddly, it seems the compiler fails remove the implementations of the
> affected functions from the object files even though they are not called
> in the generated code (because they were inlined). I can mention this in
> the commit message.
> 
> For example, if no_instrument is omitted from __int_cmpxchg, feeding one
> of the object files through aarch64-none-linux-gnu-objdump -d yields for
> example:
> 
> 0000000000000048 <__int_cmpxchg>:
>      <snip>
>      16c:       94000000        bl      0 <__bad_cmpxchg>
>      <snip>
> 
> Yet, __int_cmpxchg is not called by anything.
> 
> Even more oddly, this appears to be the case for both clang and gcc.

Upon a 2nd, closer look this doesn't appear odd at all. The 1st
argument to the two instrumentation functions is a pointer to the
function, thus requiring instantiation somewhere. Question then is
whether adding the attribute is an appropriate approach to the issue.
Gcc doc kind of suggests to possibly use extern inline instead.

Jan

