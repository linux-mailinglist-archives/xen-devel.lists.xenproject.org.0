Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE284B7A23
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 23:01:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273579.468823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK5sG-0006VO-0j; Tue, 15 Feb 2022 22:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273579.468823; Tue, 15 Feb 2022 22:00:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK5sF-0006SV-U1; Tue, 15 Feb 2022 22:00:39 +0000
Received: by outflank-mailman (input) for mailman id 273579;
 Tue, 15 Feb 2022 22:00:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Y6yl=S6=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1nK5sE-0006SP-B3
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 22:00:38 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b44a69d5-8eaa-11ec-b215-9bbe72dcb22c;
 Tue, 15 Feb 2022 23:00:36 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id o2so255905lfd.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Feb 2022 14:00:36 -0800 (PST)
Received: from [192.168.2.145] (109-252-138-165.dynamic.spd-mgts.ru.
 [109.252.138.165])
 by smtp.googlemail.com with ESMTPSA id k3sm66075lfo.10.2022.02.15.14.00.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 14:00:35 -0800 (PST)
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
X-Inumbo-ID: b44a69d5-8eaa-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:cc:references:to:in-reply-to:content-transfer-encoding;
        bh=DVulEGE2JpmKCAwv+Z9nIfk2u5ZwvRtSEnvF0++tohE=;
        b=eAbTUd8SWrkduWMDvYSL9PCIMvTyx1/PDNq+g34U5a6HTO/JfyDazuc/276Sm7ld7f
         RQAUjz9KnJpaex/eozKDcsnVqqRwA5Fj5CSlNJHiQfzBkJVLCc7y3vw02lxihPY3TExU
         lYcUYoYFkQWAG/XD2qnNsvTl5P4zqH6pcaasqRB1LojAt2IN4Q9BVX82FHrNStE8wYB4
         mmhCvKeDI7YjVSy4dXfgCBsx8WWHAoaLNoouUIXdBuim6buHAqSq3/5veKqw8hxrEwEf
         aYlaoKh86/GFDdT8ghhsvoX3tr735feUL8boUX68tZ9vbfpFMdKPrE/wFw8zC0NNEmPZ
         ssKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:cc:references:to:in-reply-to
         :content-transfer-encoding;
        bh=DVulEGE2JpmKCAwv+Z9nIfk2u5ZwvRtSEnvF0++tohE=;
        b=7DA+cuQ11pWy8B6Cwrc/8KUbiHzMRGSHtlnL/3yd3RPPkRzJd+RndJMQvHEZllmQsa
         mu3gh76WMmQdwFpKfz+WyunVC43N3jTVZ2KHefgJMUmguwC/xmsa3wwj5zweYmPIOtDw
         BweTxUWsnC2TwYBjAJiCBskYoOFP9VQTEJeWk7JlLr/sF0Obtqbw1niSrYPmG357BYC/
         j1EQqoO8O4L9Qio2QBGuoVg/m4e/aAcsmnsAjICet/cHM3qQ84LWSvo08025rwnBaDLu
         wocfpNtgBeflhE7iBIorF3o1EjWKRR18ZJt8JhCB7DGS//7/6yax4BImoskApEGPPmN0
         0JIw==
X-Gm-Message-State: AOAM531mUeGjWh0zBpmPLJEeAqbzvc4p0NETKSkwD1stMN6saudt6U7S
	/vrovyyle7JZAmrIXgkuHUo=
X-Google-Smtp-Source: ABdhPJyJtWqeT1e2wzvijosINOm/qc6wwzWUL/FDa9uqhHR32CJOoO1KF1UaVLhHtHEQQhQBEaQuLQ==
X-Received: by 2002:a05:6512:96d:: with SMTP id v13mr790998lft.343.1644962435902;
        Tue, 15 Feb 2022 14:00:35 -0800 (PST)
Message-ID: <635e8121-fca4-580c-6af5-d9317a2eee1b@gmail.com>
Date: Wed, 16 Feb 2022 01:00:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 00/21] Introduce power-off+restart call chain API
Content-Language: en-US
From: Dmitry Osipenko <digetx@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
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
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
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
 Len Brown <lenb@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck
 <linux@roeck-us.net>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, alankao@andestech.com,
 "K . C . Kuen-Chern Lin" <kclin@andestech.com>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
References: <20220130233718.21544-1-digetx@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
In-Reply-To: <20220130233718.21544-1-digetx@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

31.01.2022 02:36, Dmitry Osipenko пишет:
> Problem
> -------
> 
> SoC devices require power-off call chaining functionality from kernel.
> We have a widely used restart chaining provided by restart notifier API,
> but nothing for power-off.
> 
> Solution
> --------
> 
> Introduce new API that provides both restart and power-off call chains.
> 
> Why combine restart with power-off? Because drivers often do both.
> More practical to have API that provides both under the same roof.
> 
> The new API is designed with simplicity and extensibility in mind.
> It's built upon the existing restart and reboot APIs. The simplicity
> is in new helper functions that are convenient for drivers. The
> extensibility is in the design that doesn't hardcode callback
> arguments, making easy to add new parameters and remove old.
> 
> This is a third attempt to introduce the new API. First was made by
> Guenter Roeck back in 2014, second was made by Thierry Reding in 2017.
> In fact the work didn't stop and recently arm_pm_restart() was removed
> from v5.14 kernel, which was a part of preparatory work started by
> Guenter Roeck. I took into account experience and ideas from the
> previous attempts, extended and polished them.


Rafael and all, do you see anything critical that needs to be improved
in this v6?

Will be great if you could take this patchset via the power tree if it
looks okay, or give an ack.

