Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D621294311D
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 15:40:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768698.1179596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ9YJ-0005Kg-Hs; Wed, 31 Jul 2024 13:39:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768698.1179596; Wed, 31 Jul 2024 13:39:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ9YJ-0005Ie-El; Wed, 31 Jul 2024 13:39:39 +0000
Received: by outflank-mailman (input) for mailman id 768698;
 Wed, 31 Jul 2024 13:39:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZ9YI-0005IY-Mr
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 13:39:38 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 549354d8-4f42-11ef-bc01-fd08da9f4363;
 Wed, 31 Jul 2024 15:39:37 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-52efba36802so9784413e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 06:39:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac63590ac3sm8712046a12.34.2024.07.31.06.39.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jul 2024 06:39:36 -0700 (PDT)
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
X-Inumbo-ID: 549354d8-4f42-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722433177; x=1723037977; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YPmQGys78WoobwcUYkzm2HbBm2KhdLxvtkUmqOwLnwo=;
        b=gH7DiHGJ8UkdQWWi2jWzFWVVUs8tRTo9xz4U2EcRVvZ89JwMMIxegk0UP3TmWVVdMZ
         5uwTvg7YNjF0wN6la1yPXrVMsBmU3tF1VFgijMd4qAUxlWT/BM/ebKstcNlzhvCmeTtz
         C6Ogq/6ppb54UaRtKKWU0kiWdshIQqI/rYaFgCME/uMguJKSWPRoGZB/r1OiPh06x5Q7
         E08hE80kaZuCrfKrIiauT41UGdB6p6xlgHNxI+Jbz415Yugj8Ds615SyUun7LnVxX8r+
         bpqqDEoM4gvZxNzb5C2WOhc0ucf8KhypFcrXsAbmZUfjEEm6O4tLT4mzvqhTrSIqsCGp
         ZAbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722433177; x=1723037977;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPmQGys78WoobwcUYkzm2HbBm2KhdLxvtkUmqOwLnwo=;
        b=JDjyYiLquVq2gBgnr2N3RFOXzN2TBbPvIOcBPTonQjnvehYFIldI13kmv6m4KOey1I
         TD1V1Ip4Bm85gHTzskwBv6IUu28FAt86kZTW5EdaRNpBAMoiAWPzHRvGYE6n3OGAxFP2
         7zcM+9eOHdvjJdldiTRooHn3/XMiYOPLoJx315f0Zgoc8fpQ+9Nh6Y3a2G6tmzkBebA7
         ptYoVvSmwBT6tOfphxSAipbOEgimDxmCPCdzflJmx3f0M1bHOHLegkLdrYD4Kr2XmIU0
         rQPhbGNtb3bfvHy78P57eJSMdFH/Y2NKH4ExMjyGruW52Su/w6x8o+OWsCvojKyM60ke
         5W2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXi8kB9uz6LbRt7fKJobhAd2vK1vc0Lz1+KV2Iwn5X7zbBaXF3735GpzkgCwRaxke7fS1CI+J+DnA3GJV34Ts7EYd0yD5HKRTHGUeYAI0Y=
X-Gm-Message-State: AOJu0YyHRc5hvmNO3F7padwvqkoC+F2tqz+BcGLppnwcHJ3Wkb0sLb7P
	ZY12SHqYs6uE84MwH6Yb9uhZcMuQ6pPy5vTR4Jz4VtzshjtvsO1w6QI+clrMZA==
X-Google-Smtp-Source: AGHT+IHzuEYztUel96dLWhjp5Adc8xezMWuCWWaPhL+UcK4zms8MwgOI0NveH12gKkVg87eCK6JXNg==
X-Received: by 2002:a05:6512:2c08:b0:530:ad8b:de11 with SMTP id 2adb3069b0e04-530ad8bdf6emr2393141e87.9.1722433177021;
        Wed, 31 Jul 2024 06:39:37 -0700 (PDT)
Message-ID: <e0000e62-5b00-4a00-85fe-8a6c8e7281b9@suse.com>
Date: Wed, 31 Jul 2024 15:39:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] x86/dom0: only disable SMAP for the PV dom0 build
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240730152855.48745-1-roger.pau@citrix.com>
 <20240730152855.48745-3-roger.pau@citrix.com>
 <3918b171-b908-4962-8fdf-5236056902f8@suse.com> <Zqo7Q-leDNCXs4Fr@macbook>
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
In-Reply-To: <Zqo7Q-leDNCXs4Fr@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.07.2024 15:25, Roger Pau Monné wrote:
> On Wed, Jul 31, 2024 at 08:44:46AM +0200, Jan Beulich wrote:
>> On 30.07.2024 17:28, Roger Pau Monne wrote:
>>> The PVH dom0 builder doesn't switch page tables and has no need to run with
>>> SMAP disabled.
>>>
>>> Use stac() and clac(), as that's safe to use even if events would hit in the
>>> middle of the region with SMAP disabled.  Nesting stac() and clac() calls is
>>> not safe, so the stac() call is done strictly after elf_load_binary() because
>>> that uses raw_{copy_to,clear}_guest() accessors which toggle SMAP.
>>
>> And that was the main concern causing the CR4.SMAP override to be used instead,
>> iirc. While I'm sure you've properly audited all code paths, how can we be sure
>> there's not going to be another stac() or clac() added somewhere? Or setting of
>> EFLAGS as a whole, clearing EFLAGS.AC without that being explicit? I think we'd
>> be better off sticking to the fiddling with CR4.
> 
> On approach I didn't test would be to add ASSERTs in stac/clac
> functions to ensure that the state is as intended.  IOW: for stac we
> would assert that the AC flag is not set, while for clac we would do
> the opposite and assert that it's set before clearing it.
> 
> That should detect nesting.

Yet it would also refuse non-paired uses which are in principle okay.
Plus is requires respective code paths to be taken for such assertions
to trigger.

>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Considering the bug Andrew pointed out on the code you remove from setup.c,
>> don't we want a Fixes: tag as well?
> 
> No, I think the current code is correct, it was my change that was
> incorrect.

Hmm, no I think there was an issue also before, from the cpu_has_smap
use in the restore-CR4 conditional: We'd enable SMAP there even if on
the command line there was "smap=hvm". While we clear FEATURE_SMAP
when "smap=off", we keep the feature available when "smap=hvm". Thus
we'd pointlessly write CR4 in the first if() and then enable SMAP in
the second one, even though it wasn't enabled earlier on.

Jan

