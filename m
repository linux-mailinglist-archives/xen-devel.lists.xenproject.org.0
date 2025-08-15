Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D69C5B27B13
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 10:32:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1082986.1442660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umprI-0006BY-K0; Fri, 15 Aug 2025 08:32:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1082986.1442660; Fri, 15 Aug 2025 08:32:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umprI-00068T-Gk; Fri, 15 Aug 2025 08:32:20 +0000
Received: by outflank-mailman (input) for mailman id 1082986;
 Fri, 15 Aug 2025 08:32:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5DW6=23=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umprG-00068H-T9
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 08:32:18 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a649d59-79b2-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 10:32:17 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-6188b794743so2937027a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 01:32:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-618b02b1cfasm947756a12.54.2025.08.15.01.32.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Aug 2025 01:32:17 -0700 (PDT)
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
X-Inumbo-ID: 5a649d59-79b2-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755246737; x=1755851537; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Muea7NkvBYsveiar0A5vnkTQBnnL+3DlrW5SeB8DAi4=;
        b=eGdvO7o3t5mRNhAEzNosyiaEHBVIJXXZLBc7EwEHTyWhLBh+NUfk3U8+4kHmNP1M1l
         iiV/EPzrpowl2y6G3twZUZNVKQnBusmEWUseUBV2cjd1coWVfvKzNo5WZENWdjcMiG+C
         1uiL+yzgF1jFBd80DnUZHT7TBKv60ehpy2gj4CVSdxTjAWgFfAsdwq2IBEbZX4JUzyao
         45VFDBbKyUipPKqTHw46d+tsb/XLbGS7WVmA7WAulzzmRdud4mVMPumLvYwtPsxTTBOB
         GdAz3RQIjugizocrk2xTklIO5Mb7EFeAd0qS843i2l9+JB12lGrecwTrIA7aWFxaSXVW
         i6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755246737; x=1755851537;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Muea7NkvBYsveiar0A5vnkTQBnnL+3DlrW5SeB8DAi4=;
        b=prGKqICqTb1Ycvbgbns4Qfkg/mLPa/9NUY696FhJJJPuNZ8oEqE9CModtgTzCk29ub
         isdG44DE/0s2xp0maTpFQ9fkZayNMUBoL3EFa2sWTALEoa7juS/hXsEjjg3FsVqDwOfp
         qTzim5AhRNq0cugodSxH2h+QwQo+HPpp+b8jt9qkIbrQuZoiiDcKs0xgmPd8oxtm3a7f
         kTRm0Uuof4ioy8lyzAtvgjDptBa/0s+LfPJIzQwj4TJpqwLv2X5yFZwohasBpR5+oCgh
         pws3Bom5NfCHcA8lenuPfwjs/wi7Y1LSRorC+BknSxyJhPDkt8l/XVinpr2NLDq5ZEzq
         bjjA==
X-Forwarded-Encrypted: i=1; AJvYcCWbtVpeNzwEbHsBGeH9bG7pUO7e9h5d0pCongYEYZeZ7z1RoZXI/Uvnl1Dpo/fnxnQ1Oye23HySl/g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzDql7JSxhGwLWc7FcS+X+Q62C9I3qgge8VUGCoDKC+viT1KHaM
	sgvSZPD090mhtxa0tJ7CvtRnd0QQTuex3KB2nuwUbV7ZgvmQheNqQQ7XdmKbsa8uog==
X-Gm-Gg: ASbGncuaoKbfSqKrFFob4oWCRjkI+qO98vf2C/zKA75AkdcO25b3AwRvKwGs8Iw54zv
	6CFIBEFUfBmES794s5gUecn/KIoL5XTIp0kJDm9EGA+G8fSyU/XDOVQdvNZBcNW1x0FbTWDpMKn
	8PwN0K7YoHN/sLOOybRSaHvARtwBumJ/ezKpegL4xH4Q9hitPn4rpqScZGwRFdMvL99ddNur07I
	FTGtEr3Py6fbhDqvva92qM8Z1+itn2bMejqA9S5UpkO69keJdxwc3EqwRet6owWxtA5uqNpX/Yw
	MFrcHF2IqOowRwM1m1QGN5kna9dJral0d4mHbEmKSfYc3HQ6x8koKvInFCOIiLEDCAIK1y9OX4n
	3hGQE3+s1kJ+TBXZ8nmY7eQuNw/2fZ0q+kV9KO/MALCBmsMht57BF7oOFujhiVAyBH34DZymVH5
	FOISKZZC8xIcYx+NeVeA==
X-Google-Smtp-Source: AGHT+IETDH/5x9eLB6pmwslbllCgVgCyw7FlssXa8LyyjLnAXUkY0j7ix9kieViSNmDcsJI3Duf6uQ==
X-Received: by 2002:a05:6402:35cb:b0:615:cc03:e6ab with SMTP id 4fb4d7f45d1cf-618b052b625mr879378a12.2.1755246737300;
        Fri, 15 Aug 2025 01:32:17 -0700 (PDT)
Message-ID: <25794508-f262-4aed-819b-3c32ad4c2a86@suse.com>
Date: Fri, 15 Aug 2025 10:32:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/22] x86/traps: Move load_system_tables() into
 traps-setup.c
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-10-andrew.cooper3@citrix.com>
 <a4a88d7a-8c1f-4170-a1fe-afafcad0c8ea@suse.com>
 <9e955bff-c145-4a52-af4f-a7055fc9aa67@citrix.com>
 <8e0b4a82-3189-4446-96a8-921d8ae44a21@suse.com>
 <5def44a3-4139-4870-94f2-cb895078f968@citrix.com>
 <0e9878a9-fb0d-4d18-ab15-eb248629b192@suse.com>
 <a2f8167b-cfcc-4729-892b-d2994aa77f84@citrix.com>
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
In-Reply-To: <a2f8167b-cfcc-4729-892b-d2994aa77f84@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.08.2025 10:28, Andrew Cooper wrote:
> On 15/08/2025 9:22 am, Jan Beulich wrote:
>> On 14.08.2025 20:09, Andrew Cooper wrote:
>>> On 14/08/2025 9:55 am, Jan Beulich wrote:
>>>> On 13.08.2025 13:25, Andrew Cooper wrote:
>>>>> On 12/08/2025 10:19 am, Jan Beulich wrote:
>>>>>> On 08.08.2025 22:23, Andrew Cooper wrote:
>>>>>>> Since commit a35816b5cae8 ("x86/traps: Introduce early_traps_init() and
>>>>>>> simplify setup"), load_system_tables() is called later on the BSP, so the
>>>>>>> SYS_STATE_early_boot check can be dropped from the safety BUG_ON().
>>>>>>>
>>>>>>> Move the BUILD_BUG_ON() into build_assertions(),
>>>>>> I'm not quite convinced of this move - having the related BUILD_BUG_ON()
>>>>>> and BUG_ON() next to each other would seem better to me.
>>>>> I don't see a specific reason for them to be together, and the comment
>>>>> explains what's going on.
>>>>>
>>>>> With FRED, we want a related BUILD_BUG_ON(), but there's no equivalent
>>>>> BUG_ON() because MSR_RSP_SL0 will #GP on being misaligned.
>>>> That BUILD_BUG_ON() could then sit next to the MSR write? Unless of course
>>>> that ends up sitting in an assembly source.
>>> It's the bottom hunk in patch 14, which you've looked at now.
>>>
>>> Personally, I think both BUILD_BUG_ON()'s should be together, because
>>> they are related.
>> I don't really agree, but I also won't insist on my preference to be followed.
>> IOW please keep as is.
> 
> Thankyou.  Can I consider this to be A-by then?  (This, and the rename
> to percpu_early_traps_init() are the only two remaining items in the
> entire first half of the series.)

Yes:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

