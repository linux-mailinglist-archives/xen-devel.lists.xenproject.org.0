Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AE143F235
	for <lists+xen-devel@lfdr.de>; Fri, 29 Oct 2021 00:00:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218319.378696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgDRB-000273-8l; Thu, 28 Oct 2021 21:59:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218319.378696; Thu, 28 Oct 2021 21:59:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgDRB-00024l-5h; Thu, 28 Oct 2021 21:59:53 +0000
Received: by outflank-mailman (input) for mailman id 218319;
 Thu, 28 Oct 2021 21:59:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CzqG=PQ=gmail.com=digetx@srs-us1.protection.inumbo.net>)
 id 1mgDR9-00024d-27
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 21:59:51 +0000
Received: from mail-lj1-x229.google.com (unknown [2a00:1450:4864:20::229])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af2d5995-b736-4cdb-b187-51773fa2d12b;
 Thu, 28 Oct 2021 21:59:50 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id i26so11253307ljg.7
 for <xen-devel@lists.xenproject.org>; Thu, 28 Oct 2021 14:59:50 -0700 (PDT)
Received: from [192.168.2.145] (46-138-44-18.dynamic.spd-mgts.ru.
 [46.138.44.18])
 by smtp.googlemail.com with ESMTPSA id e12sm398160ljp.30.2021.10.28.14.59.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 14:59:49 -0700 (PDT)
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
X-Inumbo-ID: af2d5995-b736-4cdb-b187-51773fa2d12b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7iQ4oU5lLihLvwqt++KnGQLKBiUKhW8mB9CMlvRrAlo=;
        b=A2gDnKnXbVmAEWSfC30h5AU4KgqctGREzx+w+qi3liDGTlzRRXf3E1jZyML8gNPqGK
         Li6mIZ0lXuGBdwOE60K0G95Tgukhjr9rRKc5cXQiD0w/VxhtL95meDusnxyabh4+EWGW
         r0TYt6OWs+PjfxzqoZ6eJ3DrcMZlu658BTNljXfs4JxLykUHrLNYB1GLE4vhnXR1mGD/
         zsbBpAOKKFkkKsVx+h1bPiV6KMSfM+yc+Xd2DvoUE9RQ/ZfhiCHVvnICfk2iVe468EjX
         DSGsN20SLeM1V9+yNC6BNE7z4vvudCJzb443pi2WeFnCmYQbcFE9zeHCdAOjGieXrkv9
         /UcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7iQ4oU5lLihLvwqt++KnGQLKBiUKhW8mB9CMlvRrAlo=;
        b=4fevKNJNGSnV67gi+ySLnIGJZLVx2gpao/o93Irb6hstQ3UXMTrcS/XhBSJd2z+D5L
         1LNO6s5qmlIx+UtZiRH9Ingl0TetwvCykVjS6V9p9F5lK++DsI7Hz3KIM9lzDUrxFNum
         UK6u5Yk6Tw4jCoHq+wS/4BAHHB1hblUVzf3WwIH0kXnd9Y95omFwPmdXUuQS0AxixW7s
         krJkR6jU3hX0hmxwCFCKer0jZa6kRcoGEdbN+en5lGiXFmichuj25Iabpu+inavcnXJY
         rykfhBRly44gOy/YGL90DH0AW+ioqHamv/09z2xG4Ro/73tu+xqi/zzlwhVYf1f6Vhdr
         7N0g==
X-Gm-Message-State: AOAM533O8fcfl3NtJDGe4TP56eTKwKC9gWlE4jVcp2ZpTZKf0Y5TB6t4
	8vrRQ/AIJ0iOsH3O9holHjY=
X-Google-Smtp-Source: ABdhPJxS5C9pTHHcX2SeZO1OzU/OwueG01d90Y/t9QArtk4xiAh7ZBD5U7QFitj+IF+gde/bz4TCKA==
X-Received: by 2002:a2e:9d93:: with SMTP id c19mr7265789ljj.363.1635458389307;
        Thu, 28 Oct 2021 14:59:49 -0700 (PDT)
Subject: Re: [PATCH v2 08/45] kernel: Add combined power-off+restart handler
 call chain API
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 Mark Brown <broonie@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
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
 Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 Tony Lindgren <tony@atomide.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Pavel Machek <pavel@ucw.cz>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-riscv@lists.infradead.org, Linux-sh list <linux-sh@vger.kernel.org>,
 xen-devel@lists.xenproject.org,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
 openbmc@lists.ozlabs.org, linux-tegra <linux-tegra@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>
References: <20211027211715.12671-1-digetx@gmail.com>
 <20211027211715.12671-9-digetx@gmail.com>
 <CAJZ5v0gpu2ezMhWr=grg6M8aWAx58DQozbXHoZaiPqUaZxJi4Q@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <31547403-969e-91a9-0792-6fd657b78503@gmail.com>
Date: Fri, 29 Oct 2021 00:59:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0gpu2ezMhWr=grg6M8aWAx58DQozbXHoZaiPqUaZxJi4Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

28.10.2021 12:59, Rafael J. Wysocki пишет:
>> +/**
>> + * struct power_handler - Machine power-off + restart handler
>> + *
>> + * Describes power-off and restart handlers which are invoked by kernel
>> + * to power off or restart this machine.  Supports prioritized chaining for
>> + * both restart and power-off handlers.  Callback's priority must be unique.
>> + * Intended to be used by device drivers that are responsible for restarting
>> + * and powering off hardware which kernel is running on.
>> + *
>> + * Struct power_handler can be static.  Members of this structure must not be
>> + * altered while handler is registered.
>> + *
>> + * Fill the structure members and pass it to register_power_handler().
>> + */
>> +struct power_handler {
>> +       /**
>> +        * @cb_data:
>> +        *
>> +        * User data included in callback's argument.
>> +        */
> And here I would document the structure fields in the main kerneldoc
> comment above.
> 
> As is, it is a bit hard to grasp the whole definition.
> 

I'll move the comments in v3, thanks.

