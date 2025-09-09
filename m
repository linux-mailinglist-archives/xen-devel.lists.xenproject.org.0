Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E484B4A718
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 11:14:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1115970.1462414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvuQq-0003Tc-KU; Tue, 09 Sep 2025 09:14:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1115970.1462414; Tue, 09 Sep 2025 09:14:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvuQq-0003Qb-HQ; Tue, 09 Sep 2025 09:14:32 +0000
Received: by outflank-mailman (input) for mailman id 1115970;
 Tue, 09 Sep 2025 09:14:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r7oN=3U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uvuQo-0002yh-DJ
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 09:14:30 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63d4fd37-8d5d-11f0-9d13-b5c5bf9af7f9;
 Tue, 09 Sep 2025 11:14:29 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-61cd6089262so8536327a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Sep 2025 02:14:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62c01ae5f75sm904162a12.46.2025.09.09.02.14.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Sep 2025 02:14:28 -0700 (PDT)
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
X-Inumbo-ID: 63d4fd37-8d5d-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757409269; x=1758014069; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AaqUvhKbg0nt20i9a+zwlFhmXiGYUUJ5SzK6ujdfPj4=;
        b=dizkRh3aZv+hdo0eBvl4uNBSTb/yE0bV/5ct67wKvJ4jFdPmyJarEEL5FJ7W4b56Zi
         RS9Y8xHvkVZGPL30vVHcck+dSbVxkd0oYowTWDuUlzwf+oCogjqtnUd0tmPmXo45/UhA
         INgdTV6SL48Z/F1KrMC8WxqYlbWXuPHlkP9Mq6Mt45tMxLxkAdgJnL6paVkbvqcBf/ej
         4grX7DPueycje6ZJvVLI5jwC3g8ZcxaeJaWaQdaycAKe5CETV0FkPMyOTBNIAQQP+HDz
         Plf9basSLD5Flr7yXv3BZg7SJu5JqODiG5a1V9UWOJCUvVMLGQP38kHBRwe2IbDDPDtf
         vh8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409269; x=1758014069;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AaqUvhKbg0nt20i9a+zwlFhmXiGYUUJ5SzK6ujdfPj4=;
        b=OAtHZhznECEeAhOaBv79DbM6KfzPMo5qwW1klgZA0vTJecHItaoIncaXIG4N088Y/r
         gGdRyLOXKFegL5ebHo+NUZ3lMm0ejT/wfvw/l6QLiWGseCpzfkQTUw4Y7PfonJ2Q80sl
         3zF7zkB3KSVlXn5M2HbVfKOK5p6bm7kGp5QTXo7LM5RtfkSAkzlQNvwy1FxxaCyzTSzK
         X/zf6wJEBeVWpQtkWLbueg5ZSRqsUwqLciMv5BtRc8iF+D6QEeBsygxWJ5HfGp2sM9p2
         o2Lq0y5N582I1pH1ugipmO7WssyhmF4kXXYI+DQwV5m3oY+Ly6dqy3O6ooYVH9aN1nfY
         Mtdw==
X-Forwarded-Encrypted: i=1; AJvYcCVa9TJ/hOOuh3tO38J1UpbA+JR3Ff6zVnfU0ARhMJRkfLXay1TVvBkjqp6SRzcnnZIO1hgbMXEOie4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yws6zM+KgkTKQU+V6HKVNxOMzp4Ev0ss9mvkOyowFARe9/SaJxR
	TFM7zzOcmcoUJ7nZiiYoHY+02ZVNno2iaLfg3n4Q1SoBa68S79Lotf0vZMCw9YSg1g==
X-Gm-Gg: ASbGncusMIfmxuyCCssvvm5OAnDAfnZn4eC1uw07dWDO/6hBbTvQmWW85t3gLRjoyKd
	Pr1YWoziYYYdIlTQY/pXTbQQXseSkRS+Cy5TR1PQeEDErNl/ySxhN6JbJKvoU5jCX/XroIuozsv
	Wlpi281QJ2AW2ZP5/P78HHdnCGZBKq0T3UmV0lG0cAKu1O8G//31rJ5zoNH09dwbCuDBSPmVGUZ
	GsradZsGSbB+gMQX2x3++qgSXipSbXEJjLvHYHkVz+5sFfNnxKNfJDPciVh3V8GAu6JyhkTZH99
	AlO/YKitxnS6obKbXg7m4w8+Qu4M5Owd2KWJGpyZAM47wwVrTE3EVlkgPWY2ID67l0+tK2Rh7Hf
	OT6i7EepJQWepLPLrFzVxddHPM76JHF5mBE24kYMaE33ton928R1RhhTGgkiZ3SZGkwBqWyhHkv
	6jB1mc1Sma0qxTCjxZFA==
X-Google-Smtp-Source: AGHT+IFE0pTSExnZ28gMsqbCjxublwg3r6djMMaZsey5QKd4ongsGi0UribDMX+V3EBIogPngX3pzQ==
X-Received: by 2002:a05:6402:2685:b0:61d:dd9:20db with SMTP id 4fb4d7f45d1cf-6237c048793mr9317216a12.31.1757409268890;
        Tue, 09 Sep 2025 02:14:28 -0700 (PDT)
Message-ID: <646f7070-83c7-45ce-a4c9-c59cd39a33c5@suse.com>
Date: Tue, 9 Sep 2025 11:14:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/13] xen/arm: Add support for system suspend
 triggered by hardware domain
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
 Mykyta Poturai <mykyta_poturai@epam.com>,
 Mykola Kvach <mykola_kvach@epam.com>, xen-devel@lists.xenproject.org
References: <cover.1756763487.git.mykola_kvach@epam.com>
 <547196292a007ec2bbedd52036e8f8a0cc69c4ea.1756763487.git.mykola_kvach@epam.com>
 <fb1709de-c288-4641-8419-fdd4a2fd8401@suse.com>
 <CAGeoDV_JwupoKWsiztgDSYbEgAHrRjgSHYZ+y=KCiJEoZ2eK_g@mail.gmail.com>
 <CAGeoDV8hPDXFfY2UWwhNFi7K0sJZoKvyKY=Lrs7cer7hn2xX4g@mail.gmail.com>
 <21f2f6e1-cbf7-4b36-bbba-bffc2dab3422@suse.com>
 <CAGeoDV-U74A2ooAsZ5N00_rm8Xo=GNnGA6zBuvF=naQ45jhtyw@mail.gmail.com>
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
In-Reply-To: <CAGeoDV-U74A2ooAsZ5N00_rm8Xo=GNnGA6zBuvF=naQ45jhtyw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.09.2025 10:14, Mykola Kvach wrote:
> On Tue, Sep 9, 2025 at 9:57 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 09.09.2025 08:29, Mykola Kvach wrote:
>>> Then, in domain_shutdown(), we can call need_hwdom_shutdown() instead
>>> of directly checking is_hardware_domain(d). This keeps the logic
>>> readable and avoids code duplication.
>>>
>>> What do you think about this approach?
>>
>> Well, there's still the CONFIG_ARM check in there that I would like to
>> see gone. (As a nit, the use of u8 would also want to go away.)
> 
> We could combine your proposal from v5 of this patch series, i.e., using the
> HAS_HWDOM_SUSPEND extra config together with this helper function:
> 
>     static inline bool need_hwdom_shutdown(const struct domain *d)
>     {
>         bool is_hw_dom = is_hardware_domain(d);
> 
>         if ( !IS_ENABLED(CONFIG_HAS_HWDOM_SUSPEND) )
>             return is_hw_dom && d->shutdown_code != SHUTDOWN_suspend;
> 
>         return is_hw_dom;
>     }

Maybe. Yet then the next thing striking me as odd is the redundant
checking of is_hw_dom. Why not simply

{
    if ( !is_hardware_domain(d) )
        return false;

    return IS_ENABLED(CONFIG_HAS_HWDOM_SUSPEND) || d->shutdown_code != SHUTDOWN_suspend;
}

Yet as said - my expectation is anyway that the is_hardware_domain() check
would live in the caller.

> As for the second argument (reason), I can extract it directly from the
> domain structure, as is done in the function above.

Looks like a misunderstanding: I don't mind the function parameter. But
the "u8" type shouldn't be used anymore in new code; that's uint8_t now.

>> Furthermore with continuing to (ab)use domain_shutdown() also for the
>> suspend case (Dom0 isn't really shut down when suspending, aiui), you
>> retain the widening of the issue with the bogus setting of
>> d->is_shutting_down (and hence the need for later clearing the flag
>> again) that I mentioned elsewhere. (Yes, I remain of the opinion that
>> you don't need to sort that as a prereq to your work, yet at the same
>> time I think the goal should be to at least not make a bad situation
>> worse.)
> 
> From the perspective of ARM logic inside Xen, we perform the exact same
> shutdown steps as for other domains, except that in the end we need to
> call Xen suspend.

Which, as said, feels wrong. Domains to be revived after resume aren't
really shut down, so imo they should never have ->is_shutting_down set.

> For a domain with a toolstack, it is possible to have a running Xen
> watchdog service. For example, if we have systemd, it can be easily stopped
> from the guest because we have hooks and can perform some actions before
> suspend.
> 
> The same story applies to a Linux kernel driver: if it has PM ops installed
> for the Xen watchdog driver, nothing bad happens.
> 
> However, in the case of using init.d, it isn’t easy to stop the Xen WDT
> automatically right before suspend. Therefore, Xen code has an extra check
> (see domain_watchdog_timeout) where it checks the is_shutting_down flag
> and does nothing if it is set.

I don't understand how these watchdog considerations come into play here.

> The is_shutting_down flag is easily reset on Xen resume via a
> domain_resume call, so I don’t see any problems with that.

You did read my earlier mail though, regarding concerns towards the clearing
of that flag once it was set? (You must have, since iirc you even asked [1]
whether you're expected to address those issues up front.)

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2025-08/msg02057.html

