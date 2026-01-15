Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7701CD23F51
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 11:34:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204738.1519321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgKfg-0002g9-HX; Thu, 15 Jan 2026 10:33:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204738.1519321; Thu, 15 Jan 2026 10:33:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgKfg-0002dz-Ei; Thu, 15 Jan 2026 10:33:44 +0000
Received: by outflank-mailman (input) for mailman id 1204738;
 Thu, 15 Jan 2026 10:33:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vgKff-0002df-LX
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 10:33:43 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8c7ccd7-f1fd-11f0-9ccf-f158ae23cfc8;
 Thu, 15 Jan 2026 11:33:41 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-47fedb7c68dso3928495e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jan 2026 02:33:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-434af6e1698sm5298158f8f.37.2026.01.15.02.33.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 02:33:39 -0800 (PST)
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
X-Inumbo-ID: a8c7ccd7-f1fd-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768473220; x=1769078020; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=h3U14mP0O4cySah4Cpl1bg8vD/ITlMdvA+VdD6zfWxg=;
        b=gyzrUUQzfOCDKOHNeH5Fez93swY9xO7msn8qwyqlAHp6MKdzFO6wDE5nnuVhB6yA1B
         55NPmNjgcGwoCI+k5HVlqPPplS1o8+RgEaKUCeaLOxqaKR72wACNdVmXvyBX2cuaJs63
         e4BhFVPYG5PfgXKknLMA9yTmWg7kpzPItmDr7GHXmsKPT56KcboNlDFlssh5EfNCCRvX
         2NTKaT+lJzOdBuScvQYoWCW5qrADb9X4xEvNnCjnYNvdIUsWbYwBcgx4vK/9foaOwmbX
         AIH7jiOcSLYzMf6Df6YKCkEFXrZC1fkC0i56wKqSNegnzSYOtsW3GobYyOd5PgJkttw4
         m1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768473220; x=1769078020;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h3U14mP0O4cySah4Cpl1bg8vD/ITlMdvA+VdD6zfWxg=;
        b=XaE4uOJdNKtMU9gHuXUdY7yJQv45cxaZZQggWFEx11PuqVDpcLGLUzJ4Y+nziUq4gK
         16Tk+5Cm/Jp9tk2q2itr7scmO+rvqgRhiQCWqkDpqHKZry7AqFY7AhO7tlHhvOlpipqq
         gUOjhYAQKRIHClSAIS8CpJu4q/0sov3WoRyZw7v11zDgQ6a8oDaOT4BpqS/RMIvyZKk6
         CHO2XeyqcJSD2pWW/5sbYbs9xKhhZzq4uaOfHEFcxV9L4Z6ZmT57fwT1lapUFmZRInwd
         VUA0PrFEDIa9uzZrh75tladPn/SojkVn2nHgowZkYwX0JohIgDzez7b8MyErRr8OBnr7
         umNw==
X-Forwarded-Encrypted: i=1; AJvYcCU+BX2qFwQ9sW81Eye40n5/eiO828Czx4Sfi29C4rnvJc1vFFKpoo9TgtNFoZwHzH1NKVdbuBw0R1M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzAkinCfV2xmUfmYHffJN8uyKHqHDuWjXpRpBP0bE1u6lj+SHlx
	pJUxuHyqALOaAQWMzWoJk2VURG+Ybi+ob3+Pw5gEkkPJZR/3iWPsSmS2zpW2ILFPnw==
X-Gm-Gg: AY/fxX4SkI/tCAvtNllWviDt5ZtbsC2QhMXzcMp5gSgOKqfZZGhnqsQMjkI2vBZLMNl
	tfs9iclCyPQDLR3LAVHELRbw0jy6TdelGHzkGpSMLDBUB2Lo5jSe7bPP854hR0G3dPMFARd31Vc
	CQebdnmuBd175o1PrEYlRh9PhtSB3vMY5NZMS1CbSubmQi1IcFLY4IYaybRfoRo9T5mwvHqOeYZ
	qljko9c5Z9Ng26F7L81JdO1XR073XlKfHHsp8vPpRt9PjqpSv49L6KhyK/wa8xmyPNK0sRP2to5
	HAuKHJTZ71Utb7p4b4EOpJUO/3Y/anl4XoIXftekAKZzuUjCamwwLxSyCHac85XUSibI3gbEVOK
	LD61hKoZkaZf28k2ml+n+i0OhnZbSZ0un67dEggNZSHLKe7woMmdGzMQT5YAa3A5x68JfFa/VdB
	IgEOeFZm3KBwi/SAqg83/EtEQiNvsvMnAYW6hP50zZWQk9mCSlV+9to7atD5/T7fFFQUc2bsQE5
	/4=
X-Received: by 2002:a05:6000:3110:b0:430:fc3a:fbce with SMTP id ffacd0b85a97d-4342c4fef6dmr7592012f8f.15.1768473220380;
        Thu, 15 Jan 2026 02:33:40 -0800 (PST)
Message-ID: <2a0571c2-5c1c-4b03-9f31-1aa283f24e42@suse.com>
Date: Thu, 15 Jan 2026 11:33:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 12/12] xen/arm: Add support for system suspend
 triggered by control domain
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Rahul Singh <rahul.singh@arm.com>, Saeed Nowshadi
 <saeed.nowshadi@xilinx.com>, Mykyta Poturai <mykyta_poturai@epam.com>,
 xen-devel@lists.xenproject.org
References: <cover.1765472890.git.mykola_kvach@epam.com>
 <66fffded45f39599c62a1e4dad83c34f9de51d7d.1765472890.git.mykola_kvach@epam.com>
 <5bfbdbc6-c1ea-4aa6-acf0-1516b226f3c2@suse.com>
 <CAGeoDV8PDwmFMY-mfESUJjBokgRHDg+bT4BPqMNK3hMnWROjkQ@mail.gmail.com>
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
In-Reply-To: <CAGeoDV8PDwmFMY-mfESUJjBokgRHDg+bT4BPqMNK3hMnWROjkQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.01.2026 11:19, Mykola Kvach wrote:
> On Mon, Dec 15, 2025 at 1:49 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 11.12.2025 19:43, Mykola Kvach wrote:
>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -137,6 +137,11 @@ config HAS_EX_TABLE
>>>  config HAS_FAST_MULTIPLY
>>>       bool
>>>
>>> +config HAS_HWDOM_SHUTDOWN_ON_SUSPEND
>>> +     bool
>>> +     default y
>>> +     depends on !ARM_64 || !SYSTEM_SUSPEND
>>
>> As written, this would want to be "def_bool y". However, I think I indicated
> 
> OK, I’ll switch this to def_bool.
> 
>> previously that imo it would be nice if we could stop adding more "depends on"
>> referencing particular architectures. Instead "select" or "imply" from
>> xen/arch/<arch>/Kconfig appears more desirable to use in such cases. That way
>> each arch can control what it wants without needing to touch common code.
>>
>> As an aside, in the context of PV_SHIM_EXCLUSIVE it was also said several
>> times that negative dependencies aren't very nice to have. Here we have no
>> prompt, so the "allyesconfig" concern doesn't apply, but I still thought I'd
>> mention this.
> 
> I used the common-level dependency only to avoid adding selects in every
> other arch Kconfig, as the only exception I need is
>     ARM_64 && SYSTEM_SUSPEND.
> 
> If you still prefer keeping all arch-specific handling under
> xen/arch/<arch>/Kconfig, I can rework it accordingly.

Imo there are two options: Do as you suggest, but with an option not starting
HAS_*. Or use HAS_ with per-arch selects (which I think I'd prefer).

To limit the number of selects needed, perhaps the sense of the option may
want inverting? Otoh I don't think we know yet what RISC-V and PPC are going
to want?

>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -1324,6 +1324,11 @@ void __domain_crash(struct domain *d)
>>>      domain_shutdown(d, SHUTDOWN_crash);
>>>  }
>>>
>>> +static inline bool need_hwdom_shutdown(uint8_t reason)
>>
>> Personally I think "want" would better express things, but I don't really
>> mind "need".
> 
> I'll change it to "want".
> 
>>
>>> +{
>>> +    return IS_ENABLED(CONFIG_HAS_HWDOM_SHUTDOWN_ON_SUSPEND) ||
>>> +           reason != SHUTDOWN_suspend;
>>> +}
>>
>> Seeing this in use, I wonder if HAS_ is really suitable here.
> 
> What name would you consider more suitable here?

As per above, HAS_ dropped would be an option. Yet that goes against my
preference above. Maybe HAS_ really is okay-ish here, despite what I said
earlier.

Jan

