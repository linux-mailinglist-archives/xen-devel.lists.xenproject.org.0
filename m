Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 706598C5743
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 15:37:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721514.1124985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6sKD-0003gN-MA; Tue, 14 May 2024 13:36:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721514.1124985; Tue, 14 May 2024 13:36:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6sKD-0003en-JJ; Tue, 14 May 2024 13:36:13 +0000
Received: by outflank-mailman (input) for mailman id 721514;
 Tue, 14 May 2024 13:36:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VieR=MR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s6sKC-0003eh-VK
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 13:36:12 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ecc43df5-11f6-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 15:36:10 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-51f1b378ca5so9678554e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 06:36:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a50365669sm485869266b.193.2024.05.14.06.36.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 06:36:09 -0700 (PDT)
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
X-Inumbo-ID: ecc43df5-11f6-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715693770; x=1716298570; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tI1mCcdu3kmApZJIMxVjSs2Dx1/LGxlqUqxBx/MkAyA=;
        b=A1BNAZJZuHSJRRf3SNCYv9wxOhlG0q+zKRCvwnNgNBz7ORl1HVeSSLahoGEGlFXJov
         8opavyvn6bFJ7L4Ypa7ygaksn1KQIXdKWO7kGzjSk5KlFZZXmSn7BfNyTfogYBz1UVl4
         VZ03XqVY9rCLpaDw32+6GZc62TgZjsONoBhkI+yxJUi0Qd6oilSZbz4gQTnKhOlwlG0H
         6nO2WLtGmMZf5JLtmL5BJqv7k5Ai5t+VkuJp9Knl4C27Eo+c7VzEZB/is11krxvEEF5D
         Zbr3t/wlVaHq4Rp2U1k+TEz410cICHw25jiBfxScNhHP/BcUXr63FEQb41PcrcFgHtBO
         GByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715693770; x=1716298570;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tI1mCcdu3kmApZJIMxVjSs2Dx1/LGxlqUqxBx/MkAyA=;
        b=m6v0YEWtH4Yc7vRKQrm4gKzTyvYTzo4zcBHdzOShTt0O1lZcmMf8MHfGPgCln3IOfx
         tQg9grT0900Bu26TmVXwrsNpSSElwrTdxghJtJHV+LDxc8V7UXxRVULuEjC4yqkhbj7V
         TnsdcJywngwtOAI+1g8ZbajK5dnzFBPmDDWzSxltQ4sfebwqmrHu4u+gbuXvb3Zz3/l3
         cOpK/sz4eVMNNr5V0do0btNnu0/ibHvg9hh5gUpUQWTPSS6M4k0lW3WxqyghFpdDznWN
         tJUStTbj+0R9rt6x3iAcQi1mNjq/lC2M22ez3vcSULMiISH10duyEtc3e+mOyDH0gFxM
         Ju9g==
X-Forwarded-Encrypted: i=1; AJvYcCVPag5Ws5FVyr832RBeW7lfKuQfXLDW7KXFvjgeieGFlRJ45LPftcfk/Vbzp1ZN0ASDJvNp/lUPYY/D+SW1Vifkf9Z8fhXJ3xNtTnCGSmg=
X-Gm-Message-State: AOJu0YyV/PgiQPE1LfH6+l050uaCQ6lazKLiWI51Hrt7k92jB3NWjGe9
	/ovif8vy/3W2WbnlM5s8Skt7JCRji6DTKvp/z01k60tjbX2xbe0kyyDRHNPhxg==
X-Google-Smtp-Source: AGHT+IFUTjblc7BihXGNoUH7eyzKt+dMlBDeIqSMNg3vCiD2lPqD22xAdA3kQwBrHCl+aFdnQ916xw==
X-Received: by 2002:a05:6512:1308:b0:520:36ea:9375 with SMTP id 2adb3069b0e04-522102783ffmr12844611e87.43.1715693769860;
        Tue, 14 May 2024 06:36:09 -0700 (PDT)
Message-ID: <5749f2f4-19e1-435f-9daf-31c248fb9a0b@suse.com>
Date: Tue, 14 May 2024 15:36:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] x86/mtrr: avoid system wide rendezvous when
 setting AP MTRRs
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <20240513085925.59324-1-roger.pau@citrix.com>
 <435ccfc3-d4e3-4da4-838f-4fb0e8987eab@suse.com> <ZkNi3HE4V_ErzyhR@macbook>
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
In-Reply-To: <ZkNi3HE4V_ErzyhR@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.05.2024 15:10, Roger Pau Monné wrote:
> On Tue, May 14, 2024 at 01:57:13PM +0200, Jan Beulich wrote:
>> On 13.05.2024 10:59, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/cpu/mtrr/main.c
>>> +++ b/xen/arch/x86/cpu/mtrr/main.c
>>> @@ -573,14 +573,15 @@ void mtrr_ap_init(void)
>>>  	if (!mtrr_if || hold_mtrr_updates_on_aps)
>>>  		return;
>>>  	/*
>>> -	 * Ideally we should hold mtrr_mutex here to avoid mtrr entries changed,
>>> -	 * but this routine will be called in cpu boot time, holding the lock
>>> -	 * breaks it. This routine is called in two cases: 1.very earily time
>>> -	 * of software resume, when there absolutely isn't mtrr entry changes;
>>> -	 * 2.cpu hotadd time. We let mtrr_add/del_page hold cpuhotplug lock to
>>> -	 * prevent mtrr entry changes
>>> +	 * hold_mtrr_updates_on_aps takes care of preventing unnecessary MTRR
>>> +	 * updates when batch starting the CPUs (see
>>> +	 * mtrr_aps_sync_{begin,end}()).
>>> +	 *
>>> +	 * Otherwise just apply the current system wide MTRR values to this AP.
>>> +	 * Note this doesn't require synchronization with the other CPUs, as
>>> +	 * there are strictly no modifications of the current MTRR values.
>>>  	 */
>>> -	set_mtrr(~0U, 0, 0, 0);
>>> +	mtrr_set_all();
>>>  }
>>
>> While I agree with the change here, it doesn't go quite far enough. Originally
>> I meant to ask that, with this (supposedly) sole use of ~0U gone, you please
>> also drop the handling of that special case from set_mtrr(). But another
>> similar call exist in mtrr_aps_sync_end(). Yet while that's "fine" for the
>> boot case (watchdog being started only slightly later), it doesn't look to be
>> for the S3 resume one: The watchdog is re-enabled quite a bit earlier there.
>> I actually wonder whether mtrr_aps_sync_{begin,end}() wouldn't better
>> themselves invoke watchdog_{dis,en}able(), thus also making the boot case
>> explicitly safe, not just safe because of ordering.
> 
> Hm, I don't like disabling the watchdog, I guess it could be
> acceptable here because both usages of mtrr_aps_sync_end() are limited
> to specific scenarios (boot or resume from suspension).  I can prepare
> a separate patch, but I don't think the watchdog disabling should be
> part of this patch.

Not sure (as to being part of this patch). Of course it would be okay to
address the S3 side separately, whichever approach we use. Yet imo it
would also be okay to address both in one go, again whichever approach we
use. If you prefer a separate one, so be it.

Jan

