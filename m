Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A57F46147D
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 13:05:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234502.406922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrfOi-0000Lx-CQ; Mon, 29 Nov 2021 12:04:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234502.406922; Mon, 29 Nov 2021 12:04:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrfOi-0000K5-9P; Mon, 29 Nov 2021 12:04:40 +0000
Received: by outflank-mailman (input) for mailman id 234502;
 Mon, 29 Nov 2021 12:04:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zy8G=QQ=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1mrfOg-0000Jz-BN
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 12:04:38 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 861d7e30-510c-11ec-976b-d102b41d0961;
 Mon, 29 Nov 2021 13:04:37 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id bi37so43921057lfb.5
 for <xen-devel@lists.xenproject.org>; Mon, 29 Nov 2021 04:04:37 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id g12sm1317274lfu.135.2021.11.29.04.04.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Nov 2021 04:04:34 -0800 (PST)
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
X-Inumbo-ID: 861d7e30-510c-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PNn5ANXHQBQImIpvHbPbNMd2Lqd15EQlJogO89cnByY=;
        b=MI4kP55/Zlm7TBL7y2OrNMI5h+lPZeZmB7t8OlZkmrVqz5nkh2/Y6HuliAe0oVs0Rk
         rFetODlieSY8yYJ/zujS836D4HMa1RwjML/CAxKtomUWXSGb1qL/KVpTn6q2+Uvz6fll
         o53AZuiQAc2GWbWiafTtGZSuw2c5mqIFJqFNiJYF9aTjEDiBqb562eel2zakvhyPlOl3
         pG/pjhw/StA1ckadkeclKZKjMkX16zdmIl6oAlX+4fS7qeRy6PONzcXzKzm9X1QdAno0
         Kkwc07Ys2BvHYPaVq37PhoNg88rbf4eu8IhUwjBo48bGGmIHfJryc8vu/Bws5bIp8Ted
         95RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PNn5ANXHQBQImIpvHbPbNMd2Lqd15EQlJogO89cnByY=;
        b=DSnOkAZLwuhPXlrYyjmIA+E533O3TXVj4DCXCFlf+H44u1ZDzev0WZtJRKIlgxQNpk
         /axH+X0quNmJypLnsYr48bkRP6fdgTQSZnb8tBzrYQYnO67BtfpctntN9q+dwXEn/NnD
         rw65Y9XbFJskZTuQchQZ3vQ8XUAzWiT8Ghi9GId8J/tfONJpzZqyeaxuj2mFr9Sogoju
         j2eB3quK9/rNgODkmF6CSQNjMlGey5tSnS/aH8FK07DrkK+5Zu1CbaqyjkHbRG0DENSy
         vRB5wWh0cmmlKmeP1acp1xUphfo6Ybn6qIJMEA79MP+b523/zzj/nBL3N5iSjPu5emoY
         hGsQ==
X-Gm-Message-State: AOAM5314O4F8p+RLfmHjUQYqoLZyjyz3epv1QLr4JJE298p64JFkFCKa
	JZQGkVn+rrp/BKrvFWwhJYk=
X-Google-Smtp-Source: ABdhPJwfeiycltlybhTj7UKB2JEhJqYEuRYscpRNQomunXBGc+OXGSTBjoVVWr3Sr9Zkv1hFoSwEuA==
X-Received: by 2002:a05:6512:e9c:: with SMTP id bi28mr45440847lfb.245.1638187475542;
        Mon, 29 Nov 2021 04:04:35 -0800 (PST)
Subject: Re: [PATCH v2 28/45] mfd: rn5t618: Use devm_register_power_handler()
To: Lee Jones <lee.jones@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck
 <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>,
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
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
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
 Pavel Machek <pavel@ucw.cz>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-acpi@vger.kernel.org, linux-omap@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20211027211715.12671-1-digetx@gmail.com>
 <20211027211715.12671-29-digetx@gmail.com> <YaS/lStp2b8GhVxw@google.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <592f2326-b450-1db1-0d3d-804415cf5de6@gmail.com>
Date: Mon, 29 Nov 2021 15:04:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YaS/lStp2b8GhVxw@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

29.11.2021 14:55, Lee Jones пишет:
> On Thu, 28 Oct 2021, Dmitry Osipenko wrote:
> 
>> Use devm_register_power_handler() that replaces global pm_power_off
>> variable and allows to register multiple power-off handlers. It also
>> provides restart-handler support, i.e. all in one API.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/mfd/rn5t618.c | 56 ++++++++++++++++---------------------------
>>  1 file changed, 21 insertions(+), 35 deletions(-)
> 
> For my own reference (apply this as-is to your sign-off block):
> 
>   Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> 

Thanks you. This and other driver patches will be slightly changed
because the power-handler was renamed to sys-off handler starting with
the v3 of this series, but yours ack still will be valid here.

