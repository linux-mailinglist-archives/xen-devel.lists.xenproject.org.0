Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E616C4709B7
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 20:05:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.244270.422484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvlC5-0002i7-D5; Fri, 10 Dec 2021 19:04:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 244270.422484; Fri, 10 Dec 2021 19:04:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvlC5-0002fH-9X; Fri, 10 Dec 2021 19:04:33 +0000
Received: by outflank-mailman (input) for mailman id 244270;
 Fri, 10 Dec 2021 19:04:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lr8x=Q3=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1mvlC4-0002fB-1h
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 19:04:32 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 011ae5e2-59ec-11ec-ad7a-b7ef48004f0a;
 Fri, 10 Dec 2021 20:04:30 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id t26so19744144lfk.9
 for <xen-devel@lists.xenproject.org>; Fri, 10 Dec 2021 11:04:30 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id k27sm385556ljc.129.2021.12.10.11.04.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 11:04:29 -0800 (PST)
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
X-Inumbo-ID: 011ae5e2-59ec-11ec-ad7a-b7ef48004f0a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rvbAWOjnQ4iiK2qTm1VE6lQGOrcjLKyz5OxaYJHSlms=;
        b=TjeoyxCasR5FMVdl/A0tp1mA72HfZpG7IA3P7NymDxwSTTW3+ca77Hp0RW3fNn90V6
         BsHjIyUl7Vlp+L39rylawnkVapGjnUQqVeWKvetFiA7uvJFxyv0GjUpcVXKt0X+55JJr
         xqXdSvj9BdLL7KX3hwRLKx+qpMEtqmR2FUek4bTb6sXBna+eG0YWGMxM64DOjx5RNWe4
         HoiJuPojsDMo1meIr/+QThmv79vJf2KZerbGrOUNNaqfzynbYTAS2muusrYdRhnsIt5A
         B24OARH3dPFHv5rk46GLF+MM2vVZfTdlA9nyGZ9hBzpvwzg8kPFwKLRgebHs+PEO+1Iq
         vobA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rvbAWOjnQ4iiK2qTm1VE6lQGOrcjLKyz5OxaYJHSlms=;
        b=1viUg1ZqpYcCx70WJmE0OT8+OmPuix22wv7Ch5YKhyM7TNm5CmhyrCHMZzLdUjApJ9
         ebU1Y8q2isAlMqnr6oiCPBmMh3FPYBaAw04d5Xp/OYc3sFHerMpX8DbB0VsYnY6zDmAT
         85dZN3Lr5iNt2QXCHvUF442ZEGxew4pIdUSpfygVIEHnkgwUlIFpCFDHS49+fIQnxN9b
         q2Z71kSJ6uXSrZPXKe2fb3/7wOFNAEWuZFp+U5z7O9dcVfR6DGQAQ7yaEFDw7MzW37Xz
         FaSJC7zMSEb/1peMAaidc4NGJ0cEgZOyUpqiTCY7lIMUBljpOluutJCHXOBohz3NtHSV
         I3pA==
X-Gm-Message-State: AOAM533v1LMOK8NYES/gMQeoBgtfFZJzqeokHH/bSg1AR7Mm4t9P4OaS
	/Vy3fa7DQ9Tc/oiR0ypZtXU=
X-Google-Smtp-Source: ABdhPJyGg6V6axU9mPpKq+4o9ssjbFc0zNzIldal4eICWlLYfWsm94H3hqPTZ3hkXuJwkEExqxjrPg==
X-Received: by 2002:a05:6512:3f84:: with SMTP id x4mr14257818lfa.346.1639163070363;
        Fri, 10 Dec 2021 11:04:30 -0800 (PST)
Subject: Re: [PATCH v4 05/25] reboot: Warn if restart handler has duplicated
 priority
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
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <45025b2d-4be1-f694-be61-31903795cf5d@gmail.com>
Date: Fri, 10 Dec 2021 22:04:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0jMvdhfBqjY+V9h_Z6EH1ohuJH+KjuGiOw_Jor1Tnp7vg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

10.12.2021 21:27, Rafael J. Wysocki пишет:
> On Mon, Nov 29, 2021 at 12:34 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> 29.11.2021 03:26, Michał Mirosław пишет:
>>> On Mon, Nov 29, 2021 at 12:06:19AM +0300, Dmitry Osipenko wrote:
>>>> 28.11.2021 03:28, Michał Mirosław пишет:
>>>>> On Fri, Nov 26, 2021 at 09:00:41PM +0300, Dmitry Osipenko wrote:
>>>>>> Add sanity check which ensures that there are no two restart handlers
>>>>>> registered with the same priority. Normally it's a direct sign of a
>>>>>> problem if two handlers use the same priority.
>>>>>
>>>>> The patch doesn't ensure the property that there are no duplicated-priority
>>>>> entries on the chain.
>>>>
>>>> It's not the exact point of this patch.
>>>>
>>>>> I'd rather see a atomic_notifier_chain_register_unique() that returns
>>>>> -EBUSY or something istead of adding an entry with duplicate priority.
>>>>> That way it would need only one list traversal unless you want to
>>>>> register the duplicate anyway (then you would call the older
>>>>> atomic_notifier_chain_register() after reporting the error).
>>>>
>>>> The point of this patch is to warn developers about the problem that
>>>> needs to be fixed. We already have such troubling drivers in mainline.
>>>>
>>>> It's not critical to register different handlers with a duplicated
>>>> priorities, but such cases really need to be corrected. We shouldn't
>>>> break users' machines during transition to the new API, meanwhile
>>>> developers should take action of fixing theirs drivers.
>>>>
>>>>> (Or you could return > 0 when a duplicate is registered in
>>>>> atomic_notifier_chain_register() if the callers are prepared
>>>>> for that. I don't really like this way, though.)
>>>>
>>>> I had a similar thought at some point before and decided that I'm not in
>>>> favor of this approach. It's nicer to have a dedicated function that
>>>> verifies the uniqueness, IMO.
>>>
>>> I don't like the part that it traverses the list second time to check
>>> the uniqueness. But actually you could avoid that if
>>> notifier_chain_register() would always add equal-priority entries in
>>> reverse order:
>>>
>>>  static int notifier_chain_register(struct notifier_block **nl,
>>>               struct notifier_block *n)
>>>  {
>>>       while ((*nl) != NULL) {
>>>               if (unlikely((*nl) == n)) {
>>>                       WARN(1, "double register detected");
>>>                       return 0;
>>>               }
>>> -             if (n->priority > (*nl)->priority)
>>> +             if (n->priority >= (*nl)->priority)
>>>                       break;
>>>               nl = &((*nl)->next);
>>>       }
>>>       n->next = *nl;
>>>       rcu_assign_pointer(*nl, n);
>>>       return 0;
>>>  }
>>>
>>> Then the check for uniqueness after adding would be:
>>>
>>>  WARN(nb->next && nb->priority == nb->next->priority);
>>
>> We can't just change the registration order because invocation order of
>> the call chain depends on the registration order
> 
> It doesn't if unique priorities are required and isn't that what you want?
> 
>> and some of current
>> users may rely on that order. I'm pretty sure that changing the order
>> will have unfortunate consequences.
> 
> Well, the WARN() doesn't help much then.
> 
> Either you can make all of the users register with unique priorities,
> and then you can make the registration reject non-unique ones, or you
> cannot assume them to be unique.

There is no strong requirement for priorities to be unique, the reboot.c
code will work properly.

The potential problem is on the user's side and the warning is intended
to aid the user.

We can make it a strong requirement, but only after converting and
testing all kernel drivers. I'll consider to add patches for that.

