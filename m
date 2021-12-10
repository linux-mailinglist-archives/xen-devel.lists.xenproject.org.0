Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 297B2470AA7
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 20:45:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.244320.422573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvlp0-0004tz-Hz; Fri, 10 Dec 2021 19:44:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 244320.422573; Fri, 10 Dec 2021 19:44:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvlp0-0004rL-Du; Fri, 10 Dec 2021 19:44:46 +0000
Received: by outflank-mailman (input) for mailman id 244320;
 Fri, 10 Dec 2021 19:44:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lr8x=Q3=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1mvloz-0004rF-Dd
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 19:44:45 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9fc5d669-59f1-11ec-ad7a-b7ef48004f0a;
 Fri, 10 Dec 2021 20:44:44 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id k37so19986358lfv.3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Dec 2021 11:44:44 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id c15sm394938lfb.154.2021.12.10.11.44.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 11:44:43 -0800 (PST)
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
X-Inumbo-ID: 9fc5d669-59f1-11ec-ad7a-b7ef48004f0a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bghkq/gqakBG3UMA9KtKqv9kgT5Wq1LJh/DaMMP+Buo=;
        b=lFdiyPZK17AYCTV65ZUsvdfciaNUYWPxmzSgJajTwQ07RVOIMn5cd3OMLqgm70DBAO
         sO9a+0M7Ylp7HtPfjlNdELPWJPhFEsL+BBJZhlleZ8ktrzvWgXu2rCggboh+AgCAyR+i
         WdIEhcqPzr+EGbl0oQk36HsGosG8oJ4OqatnVU+rYKpyd3R/jmhh8wJ5nt8gGw45GBZy
         rNd0gesXdm60r4RJ7qNGWsHGKiq3UiUqi5FkpCzhl0LGExdzbir7EPh4UTzIBF/YRE+s
         kyUVKadGSflj2NYa6m+B4vuldmIqJM59VgWObzoRC+XA5qxz4D0b/H+jRuY2tRZWYoPI
         /XGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bghkq/gqakBG3UMA9KtKqv9kgT5Wq1LJh/DaMMP+Buo=;
        b=EihEzm1uUGl2bdGtMJ9AYmcDyZZWzzl6O3R8tBQkyO7c+GJg5xDIn69Hr1rNxtDt4P
         JsfIDhNB4zWhvsst9ShcLZLua1sdzF+ihNZy3VZC27ZnciB0OaVKxy+9PlEb/gLFUUoE
         3tkoL0kzddnmf4KcVeC2zeEYXu5Nl3EmLnsusAWP2tWzGorYkJE7vIl6UTBMVxlD1uWG
         3QJJAnIkl+7DFhJO5inHdrj6vYVFWlgez1+ViM8KIxlhN8FQrt+bcYTm+S+XTxvkSoIe
         vlPCIx+xev13I/JDRIOL7ON0JAAap6iEVymEAMGv4cL9VECb504jb/M1xucHNTfBDDbO
         89vA==
X-Gm-Message-State: AOAM530A15lot9eHqqhbdhLf1Ycahs66QwH5apcXHkE8tbyyzWpDePfB
	ECE1b/5WFB57l8WiO5c1a2c=
X-Google-Smtp-Source: ABdhPJwdPpKxpD5iCVpMoy0RbhPzj8+6gSmN9/Uu5pMKxteqUazmF0c3BRQXsHXIE6Vu9MIa4P5vrA==
X-Received: by 2002:ac2:4c50:: with SMTP id o16mr14291331lfk.517.1639165484083;
        Fri, 10 Dec 2021 11:44:44 -0800 (PST)
Subject: Re: [PATCH v4 05/25] reboot: Warn if restart handler has duplicated
 priority
From: Dmitry Osipenko <digetx@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Thierry Reding <thierry.reding@gmail.com>,
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
 the arch/x86 maintainers <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Len Brown <lenb@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck
 <linux@roeck-us.net>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, alankao@andestech.com,
 "K . C . Kuen-Chern Lin" <kclin@andestech.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-riscv@lists.infradead.org, Linux-sh list <linux-sh@vger.kernel.org>,
 xen-devel@lists.xenproject.org,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-6-digetx@gmail.com> <YaLNOJTM+lVq+YNS@qmqm.qmqm.pl>
 <033ddf2a-6223-1a82-ec64-30f17c891f67@gmail.com>
 <YaQeQgbW+CjEdsqG@qmqm.qmqm.pl>
 <091321ea-4919-0579-88a8-23d05871575d@gmail.com>
 <CAJZ5v0jMvdhfBqjY+V9h_Z6EH1ohuJH+KjuGiOw_Jor1Tnp7vg@mail.gmail.com>
 <45025b2d-4be1-f694-be61-31903795cf5d@gmail.com>
 <CAJZ5v0ieTwnBVjW8R_VTdPFH3yr5AwLc+ZEG5N3KrpTH+j8qZw@mail.gmail.com>
 <45228c88-4d51-591e-5da5-9ec468e71684@gmail.com>
Message-ID: <ad6c7d73-e7d3-4901-fd63-ef87eecd39a2@gmail.com>
Date: Fri, 10 Dec 2021 22:44:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <45228c88-4d51-591e-5da5-9ec468e71684@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

10.12.2021 22:42, Dmitry Osipenko пишет:
...
>>> There is no strong requirement for priorities to be unique, the reboot.c
>>> code will work properly.
>>
>> In which case adding the WARN() is not appropriate IMV.
>>
>> Also I've looked at the existing code and at least in some cases the
>> order in which the notifiers run doesn't matter.  I'm not sure what
>> the purpose of this patch is TBH.
> 
> The purpose is to let developer know that driver needs to be corrected.
> 
>>> The potential problem is on the user's side and the warning is intended
>>> to aid the user.
>>
>> Unless somebody has the panic_on_warn mentioned previously set and
>> really the user need not understand what the WARN() is about.  IOW,
>> WARN() helps developers, not users.
>>
>>> We can make it a strong requirement, but only after converting and
>>> testing all kernel drivers.
>>
>> Right.
>>
>>> I'll consider to add patches for that.
>>
>> But can you avoid adding more patches to this series?
> 
> I won't add more patches since such patches can be added only after
> completion of transition to the new API of the whole kernel.
> 

Thank you for the review.

