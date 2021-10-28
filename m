Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A725143F1EE
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 23:36:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218307.378674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgD4X-0007Ok-3O; Thu, 28 Oct 2021 21:36:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218307.378674; Thu, 28 Oct 2021 21:36:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgD4X-0007MM-0I; Thu, 28 Oct 2021 21:36:29 +0000
Received: by outflank-mailman (input) for mailman id 218307;
 Thu, 28 Oct 2021 21:36:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CzqG=PQ=gmail.com=digetx@srs-us1.protection.inumbo.net>)
 id 1mgD4V-0007MG-S7
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 21:36:27 +0000
Received: from mail-lf1-x132.google.com (unknown [2a00:1450:4864:20::132])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb1ba2e5-8254-4573-bf34-f378b2a5f3f6;
 Thu, 28 Oct 2021 21:36:27 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id bq11so16450914lfb.10
 for <xen-devel@lists.xenproject.org>; Thu, 28 Oct 2021 14:36:27 -0700 (PDT)
Received: from [192.168.2.145] (46-138-44-18.dynamic.spd-mgts.ru.
 [46.138.44.18])
 by smtp.googlemail.com with ESMTPSA id s9sm396521ljg.76.2021.10.28.14.36.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 14:36:25 -0700 (PDT)
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
X-Inumbo-ID: eb1ba2e5-8254-4573-bf34-f378b2a5f3f6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=thttoNtx85IqBzMI/c95u4NQI+WEGNQqD09v61bWPkE=;
        b=Y9ted3wnUvFPZbztZa+QHRbohuO2ujzfF68/pFicW5dA7D1yuFrKCL4aTWk/1AChzB
         fKwgUocsDwuNOGM2+iseiHe/bj2d1v3+dSRNtXKqEmTsyBkz7IWQs8pVvc2a2gvGjfup
         yLqAO4u/w7mjCphm/lBZwptgCTPupkSC+307KKr7OHU7po5AtPQB8ZhrguBiu6yERIjH
         bK0WN85VLNpdVAhT7soiJpVcCZ4Sp0KIHJV14Uu8RloVE9YJBCz/nPhBHDPyGgkjYHQ0
         imoJdP8GopH3zoQfTkWNgL4xsg20XHFvSLev9dZQthSUfjSrDblQ5bVzKxHiquLI0ZeF
         3ufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=thttoNtx85IqBzMI/c95u4NQI+WEGNQqD09v61bWPkE=;
        b=FDBsBHWd5QW9ajChVI8APwX+1c9lUOToD7AmkDXk1n0oS1whi09PoBCOWs0jzWF2Uc
         a1MH6zqO7IAfgwP4MY+7o+YQbkYGotXyOl3U3ITgQV4kBQy66SDvF3s9MFuGP9AtQgfP
         Y8SdxrUkYqGXZh9HaYCkeE2XnVrBpgn0qeaZtUbIzmp8OhSePR/QnpJJCsioKYHHbszS
         VGUiM7czj8luIaXKjmPPExGkgUUvYw4cuBlwHG6KJAZZVp3nJnh4AvsXMZMx5R83nfhT
         WsbIY/I5XN17doK9+L0PuZGWefxutB+k22CKn2SUBhhmoTZLwVEnqMau9numy7KKPXTl
         +HIQ==
X-Gm-Message-State: AOAM531bgRsRIJka7XiSoFFuv8JywWaE6EiKpccjDiZbBhb/NwC93Hk1
	1ZPVvu+A0wRxfmGXFelWDNY=
X-Google-Smtp-Source: ABdhPJzbYSC0nWI15MXaoXJe2SikVhRJRnLxoLeSiSPsVfPjrcP1DbWpe0jTqiEw6MLnleJHOc1O3g==
X-Received: by 2002:a05:6512:2292:: with SMTP id f18mr6437448lfu.619.1635456985989;
        Thu, 28 Oct 2021 14:36:25 -0700 (PDT)
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
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>,
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
 <CAJZ5v0jMdSjmkswzu18LSxcNk+k92Oz5XFFXmu-h=W8aPP4Oig@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d1837954-bd70-460d-3548-0d5ec5b75704@gmail.com>
Date: Fri, 29 Oct 2021 00:36:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0jMdSjmkswzu18LSxcNk+k92Oz5XFFXmu-h=W8aPP4Oig@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

28.10.2021 12:53, Rafael J. Wysocki пишет:
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
> The name of this structure is too generic IMV.  There are many things
> that it might apply to in principle.
> 
> What about calling power_off_handler or sys_off_handler as it need not
> be about power at all?

I didn't like much the 'power' either, but couldn't come up with a
better variant. Will change it in v3, thank you.

