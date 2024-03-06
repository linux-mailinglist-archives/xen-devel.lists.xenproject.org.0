Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 122788739F3
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 15:59:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689358.1074245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhsjO-0005K3-B1; Wed, 06 Mar 2024 14:58:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689358.1074245; Wed, 06 Mar 2024 14:58:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhsjO-0005IP-8D; Wed, 06 Mar 2024 14:58:54 +0000
Received: by outflank-mailman (input) for mailman id 689358;
 Wed, 06 Mar 2024 14:58:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIJu=KM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rhsjN-0005I9-6a
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 14:58:53 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0bad324f-dbca-11ee-afda-a90da7624cb6;
 Wed, 06 Mar 2024 15:58:52 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5645960cd56so2722183a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 06:58:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h26-20020aa7c95a000000b005663b0d7243sm6988183edt.83.2024.03.06.06.58.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 06:58:51 -0800 (PST)
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
X-Inumbo-ID: 0bad324f-dbca-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709737132; x=1710341932; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9ozENvJB1pApgplskxvvlfAp50T1YuHiVXxE9PWgha0=;
        b=NZQyXYn67TrWpUdDIkamBrMQv+A7QSsa7mRjudZSMGlUYL2gYF7bHnq+a5KSOzerIp
         DpbBZbmirIqxAiIIvu1d2Y9m27MSOIJUGIiLnONZtqfIHaMZ7MIcK6bnuGKhsgxTPdfa
         RzM6z3Npb44cPG3HP/VJEnZbTzBnAU4X5dmh2DNEqzqtJk0RMPkKtVOLyDBituMYY/Xk
         pC0t3mVXCRnRNO2sQcsjVymwykwb7A+LQW/A+DwvVdsVEAIgR49/ZunPeefOGfLGkFpN
         ixdvnMH2iruOVH9ckXgxpwPIiRqknm/VHmXoZnPHBkTDv/KcZY+RVqsBg8ra4wDcW9KO
         +8vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709737132; x=1710341932;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ozENvJB1pApgplskxvvlfAp50T1YuHiVXxE9PWgha0=;
        b=ZT+qL/xoJ01V88WtKE/q4UCbEsCL+jMwfmHZUec/v6EFDA768Nuu0ifEbJSrbuUwI9
         63AfespDLEhh2d7fhcMQ5lojs19OHlObMR9REDVMwVAbZ8jC5jSCwdwzAaKLDD8LHqwt
         87QHSlyAR3m2nhGCZSX2v0db3jIUQaxYApY5LQIBSqoC4L3fFw9S8G4SetVWpcj9hVUz
         3kOj7nrnC6VGzZ5ghjVKzaQI9YzRKJJSaVk5DFmoIbz6f0UT3DmwC1HwWMNO/sq48jgq
         UYhOeS2gM5gJ940fkKbZV3P995nG8tON+4K0xrr0m8gkuuQctP8H4Bt3G+pXnebkFvR4
         U8fQ==
X-Gm-Message-State: AOJu0YzJ/pri/nwfZNtTG3eNpZh8IAeSZ7txk0G0kenbMP3yCR408uvo
	nA32RM982qksQzYpedffn56K6wWvHIAmjpTvY4DuXndG+3AojOKnguPhh+TjjQ==
X-Google-Smtp-Source: AGHT+IGLlbBnXGhePH/rCXWTqnxwoic4snkgPKinTAvbGqDUnO/jjhjzX7JV0ISZXo4Fwn+Iyy+qWA==
X-Received: by 2002:a05:6402:2151:b0:566:6a0e:7625 with SMTP id bq17-20020a056402215100b005666a0e7625mr10374439edb.7.1709737131772;
        Wed, 06 Mar 2024 06:58:51 -0800 (PST)
Message-ID: <7dd25eae-64ba-46d2-8dc1-5c697774102d@suse.com>
Date: Wed, 6 Mar 2024 15:58:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/EFI: correct compiler probing
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <089964f2-1b2c-4ee7-92cf-f50f2e967d5b@suse.com>
 <7f0d8e16-c580-4dba-a81a-72d5334052dc@suse.com>
 <9e26c1f2-add7-430b-9ba7-cce54d863955@perard>
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
In-Reply-To: <9e26c1f2-add7-430b-9ba7-cce54d863955@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.03.2024 15:57, Anthony PERARD wrote:
> On Thu, Dec 07, 2023 at 11:48:12AM +0100, Jan Beulich wrote:
>> Passing in $(CFLAGS) means also requesting inclusion of certain headers
>> (via -include command line options). That's particularly xen/config.h,
>> which in turn requires generated/autoconf.h. This has not caused any
>> problems so far only because arch.mk is processed twice, and the missing
> 
> The first pass is ignore because "include/config/auto.conf" is missing,
> and generating that will also generates "generated/autoconf.h" I think.
> So result don't matter, and make restart from scratch once "auto.conf"
> is generated.
> 
>> header on the 1st pass would be there on the 2nd. Having added an
>> inclusion of asm/asm-macros.h to x86'es asm/config.h, the 2nd pass then
> 
> I don't see asm-macros.h been included in asm/config.h, is this
> in a pending patch?

Yes. I hoped to get this across with "Having added ...".

>> also fails on an initial, pristine build.
>>
>> As per dd40177c1bc8 ("x86-64/EFI: add CFLAGS to check compile") dropping
>> the use of $(CFLAGS) altogether isn't an option, though. Hence remove
>> the problematic options only.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> In any case, patch looks fine:
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks.

Jan

