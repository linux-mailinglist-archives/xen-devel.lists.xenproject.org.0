Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C59D470BB3
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 21:16:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.244339.422609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvmJm-0002oP-Gj; Fri, 10 Dec 2021 20:16:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 244339.422609; Fri, 10 Dec 2021 20:16:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvmJm-0002lk-CL; Fri, 10 Dec 2021 20:16:34 +0000
Received: by outflank-mailman (input) for mailman id 244339;
 Fri, 10 Dec 2021 20:16:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lr8x=Q3=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1mvmJl-0002le-EM
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 20:16:33 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 110963d7-59f6-11ec-a74f-db008197e53d;
 Fri, 10 Dec 2021 21:16:32 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id k37so20113907lfv.3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Dec 2021 12:16:32 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id z23sm409427ljn.23.2021.12.10.12.16.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 12:16:31 -0800 (PST)
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
X-Inumbo-ID: 110963d7-59f6-11ec-a74f-db008197e53d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3TjXmEXDJ/+bmC4Ps/ax4TtRHBZzHR+/4MLS5Bo5vyY=;
        b=pA5gJzqpb6DuYCThgFEy/8I55Q/DWCaUg3a+PUCGAi7titTHPZavt9HNjzNTaNOdtA
         W9bvYLeTFtb26OuFlSespYNsQjEuRbN74aib6efdQf4sRvk0jZOXEyR7Ry1SlPtvny3V
         dHFm88kS0utx46N/B1V95jCju3EdX/3tioPOW0AUjL07+k8WzDTAaYKBNQJxB0pggImt
         zxKY302IiWihQZ6zPY6n4S1ZYz2akRfe0TTR5ci41YrCJJyH8fb1pqNG9DRsK91AXeR3
         4OlRlbRYehYwacP4ScBqgyVswzojoT/ol0CB6bk5gTERql84YP9I/T1kujCvte5MFcNM
         x95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3TjXmEXDJ/+bmC4Ps/ax4TtRHBZzHR+/4MLS5Bo5vyY=;
        b=r8UtpIsI/I5ZI+C1JI7Sy/XXxfwOJtEVEHVwNRVAA1ANl5oV2ja+XEgiAKJidKPTU6
         Z2NwKG3HRJjHIKafmyZiOnq5scD8L+rYaLbo7vhel4Hb+ILaPHO0yPUt0eXJ1/QCmIva
         gFoXlpA69SrANpR/2hy4E9NsTij/KqC8X93TH4OFeRypFtFxsio63U2JHH4AVvxMdCXf
         nRAandTW4IpWnjYWi41FyaooAr9penQjvijXBD4CCJlglIJWWkNjFy6SL500wooTi9rs
         XNduzq2f4q/ggUn0+tkOsQO17jdaN05+n9xqJOy1lmH2Px3tfOwJayKarSeL38X4fNxj
         7iWQ==
X-Gm-Message-State: AOAM532K9N+0ZydxcUAXJaWXweGnM/zCo1GuqCtlyxVQb5PdpsiLwXGR
	R557G/tUCuleP9HUgFm5gGk=
X-Google-Smtp-Source: ABdhPJwE5tZeH/HHL0CnlLb6JayzZfWyUFquo/I1vHYJYjJlUN8IQfec3+fnfy4fMkF6dVQvXojbFQ==
X-Received: by 2002:a05:6512:2292:: with SMTP id f18mr14265704lfu.18.1639167392050;
        Fri, 10 Dec 2021 12:16:32 -0800 (PST)
Subject: Re: [PATCH v4 03/25] notifier: Add
 atomic/blocking_notifier_has_unique_priority()
From: Dmitry Osipenko <digetx@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
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
 <20211126180101.27818-4-digetx@gmail.com>
 <CAJZ5v0jTJ3f7oUUR690PGaPJsxA8yzua9XDa8MONBHMzHnDfOQ@mail.gmail.com>
 <e6ff1cea-a168-1cb0-25c5-fb16c681cf4a@gmail.com>
 <CAJZ5v0gwnY07vg71_NB8RDWyv84FtMsmx7UTDd8TkUd7vFzc6A@mail.gmail.com>
 <fd158245-aa9a-2e48-0145-004f30005a66@gmail.com>
Message-ID: <218e67e2-1d8c-5727-3862-8884d74aa63e@gmail.com>
Date: Fri, 10 Dec 2021 23:16:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <fd158245-aa9a-2e48-0145-004f30005a66@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

10.12.2021 22:33, Dmitry Osipenko пишет:
>> Not really, they only prevent the race from occurring while
>> notifier_has_unique_priority() is running.
>>
>> If anyone depends on this check for correctness, they need to lock the
>> rwsem, do the check, do the thing depending on the check while holding
>> the rwsem and then release the rwsem.  Otherwise it is racy.
>>
> It's fine that it's a bit "racy" since in the context of this series. We
> always do the check after adding new entry, so it's not a problem.
> 
> There are two options:
> 
> 1. Use blocking_notifier_has_unique_priority() like it's done in this
> patchset. Remove it after all drivers are converted to the new API and
> add blocking_notifier_chain_register_unique().
> 
> 2. Add blocking_notifier_chain_register_unique(), but don't let it fail
> the registration of non-unique entries until all drivers are converted
> to the new API.

There is third, perhaps the best option:

3. Add blocking_notifier_chain_register_unique() and fall back to
blocking_notifier_chain_register() if unique fails, do it until all
drivers are converted to the new API.

