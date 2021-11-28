Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F7C4609F6
	for <lists+xen-devel@lfdr.de>; Sun, 28 Nov 2021 22:05:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234219.406505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrRLL-0005l1-4E; Sun, 28 Nov 2021 21:04:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234219.406505; Sun, 28 Nov 2021 21:04:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrRLL-0005iY-0J; Sun, 28 Nov 2021 21:04:15 +0000
Received: by outflank-mailman (input) for mailman id 234219;
 Sun, 28 Nov 2021 21:04:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YMG7=QP=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1mrRLJ-0005iS-9k
 for xen-devel@lists.xenproject.org; Sun, 28 Nov 2021 21:04:13 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc9e92a0-508e-11ec-b941-1df2895da90e;
 Sun, 28 Nov 2021 22:04:12 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id t11so30546960ljh.6
 for <xen-devel@lists.xenproject.org>; Sun, 28 Nov 2021 13:04:12 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id c17sm1100736lfr.235.2021.11.28.13.04.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Nov 2021 13:04:11 -0800 (PST)
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
X-Inumbo-ID: bc9e92a0-508e-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wtn5Hkee5e4Yh99ylBrB3oNbIRTQMbXx6i2LcHRuAAA=;
        b=D7axuJW5K4soTW7ePg2XEY/iNxftObXK2r+AyGGcLpSZUVVVDeOdARXPvJKsrnTiWz
         AoAXcXPY5kZDAFmNd2VORgyu8fNJK2h3Akf7Z4wOIV4j7hl4k+Lg94oWKvPyZvxvLsrU
         gHjqykqz9pVTUOOpARf13AebW7syYSoupun9EMn0XvrUZckKr/LqJa+4eSWKEzDWJLdo
         K7OPzWs09+Av5yHcfZj3Q7MZQ+BDltCGiVFFVwhBt7T15YiSiT0WAJ3uiNnPq9pF4dyU
         I8pWXsXnC3XNCL+7zY4D1T6JR7EW9moTsiVuNSfEmpW1ojxHFbjsYoYQXbcJq5XV5+Um
         iPxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wtn5Hkee5e4Yh99ylBrB3oNbIRTQMbXx6i2LcHRuAAA=;
        b=baTsX54WlnLjvE9joKKuO6rWnzzHEHtWZwwbvI5tmQurTPLp0RijvikPz/kEvdVlAA
         BRjTwjbr/WTb/hf/p0pWd0DMjB2jtRVA9bf7eFAaK0mKtmx4/JpiZADWA7m/3OTaaqmk
         vmK3rWzXjmbgbYmc1+Z8VZfLNHgyDVU2HN9NgHN/AHC0uZaBXwlwqKCa9y1L3ZMZGBry
         d7yE2QksrGyeBr28kO8/ojG0euMqR4JqjNjXF+7CrncF6Cf8wab5GFenTqx9WeqniZ7B
         tYon8W5Ecn0+zHem5aKyr8R9fXNz5nyH8MKYiXHDpYG0/wmEdA2FgjEZTdyhkCHeWmbS
         kFlA==
X-Gm-Message-State: AOAM530oC53xhz2ieEh+j44kSo2Hs3ui/H+gRRhZ3X6xqGHG2ZmGweOH
	GDtapkWOSyG5no35VMd4/XI=
X-Google-Smtp-Source: ABdhPJxH7knkFdz7TFpFlawyIdB41srtPJMqsrOfzCPJDLK6AlWk3m8N6okcECoeJRZyDtP9PR9VhQ==
X-Received: by 2002:a05:651c:1257:: with SMTP id h23mr44458754ljh.17.1638133451873;
        Sun, 28 Nov 2021 13:04:11 -0800 (PST)
Subject: Re: [PATCH v4 08/25] kernel: Add combined power-off+restart handler
 call chain API
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer
 <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Sebastian Reichel <sre@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck
 <linux@roeck-us.net>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, alankao@andestech.com,
 "K . C . Kuen-Chern Lin" <kclin@andestech.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-9-digetx@gmail.com> <YaLQqks8cB0vWp6Q@qmqm.qmqm.pl>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9213569e-0f40-0df1-4710-8dab564e12d6@gmail.com>
Date: Mon, 29 Nov 2021 00:04:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YaLQqks8cB0vWp6Q@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

28.11.2021 03:43, Michał Mirosław пишет:
> On Fri, Nov 26, 2021 at 09:00:44PM +0300, Dmitry Osipenko wrote:
>> SoC platforms often have multiple ways of how to perform system's
>> power-off and restart operations. Meanwhile today's kernel is limited to
>> a single option. Add combined power-off+restart handler call chain API,
>> which is inspired by the restart API. The new API provides both power-off
>> and restart functionality.
>>
>> The old pm_power_off method will be kept around till all users are
>> converted to the new API.
>>
>> Current restart API will be replaced by the new unified API since
>> new API is its superset. The restart functionality of the sys-off handler
>> API is built upon the existing restart-notifier APIs.
>>
>> In order to ease conversion to the new API, convenient helpers are added
>> for the common use-cases. They will reduce amount of boilerplate code and
>> remove global variables. These helpers preserve old behaviour for cases
>> where only one power-off handler is expected, this is what all existing
>> drivers want, and thus, they could be easily converted to the new API.
>> Users of the new API should explicitly enable power-off chaining by
>> setting corresponding flag of the power_handler structure.
> [...]
> 
> Hi,
> 
> A general question: do we really need three distinct chains for this?

Hello Michał,

At minimum this makes code easier to follow.

> Can't there be only one that chain of callbacks that get a stage
> (RESTART_PREPARE, RESTART, POWER_OFF_PREPARE, POWER_OFF) and can ignore
> them at will? Calling through POWER_OFF_PREPARE would also return
> whether that POWER_OFF is possible (for kernel_can_power_off()).

I'm having trouble with parsing this comment. Could you please try to
rephrase it? I don't see how you could check whether power-off handler
is available if you'll mix all handlers together.

> I would also split this patch into preparation cleanups (like wrapping
> pm_power_off call with a function) and adding the notifier-based
> implementation.

What's the benefit of this split up will be? Are you suggesting that it
will ease reviewing of this patch or something else?

