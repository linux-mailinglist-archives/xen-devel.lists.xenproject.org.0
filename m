Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DA551DBB3
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 17:11:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323326.544907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmzbR-00053x-OC; Fri, 06 May 2022 15:10:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323326.544907; Fri, 06 May 2022 15:10:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmzbR-00051U-L3; Fri, 06 May 2022 15:10:45 +0000
Received: by outflank-mailman (input) for mailman id 323326;
 Fri, 06 May 2022 15:10:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OlOn=VO=collabora.com=dmitry.osipenko@srs-se1.protection.inumbo.net>)
 id 1nmzbQ-00051O-BC
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 15:10:44 +0000
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1833c0d-cd4e-11ec-8fc4-03012f2f19d4;
 Fri, 06 May 2022 17:10:41 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 3BE091F46A77
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
X-Inumbo-ID: b1833c0d-cd4e-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1651849840;
	bh=W4lTpGoqRDp9jGpQmSeg75zdqgDSf5NBF1xaIYSJv90=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nzDQfSC0mATKPl7KMFojVZYi/BuoRw0OpfD54szXaDeylL+J+qQoXJUCJwPnICT/+
	 I/8Sy9s84BogRpRojC6gImDJ92xHSdZ7FPiQMJZURPxR9roLC1xtjbIKIwiggwbDrJ
	 UyaTMJ/2JU2bfO9WoTWZ2N7xEm7TpEz7ocN5RCxlOhvhrIBNeygJsGOPczykA2dH3Y
	 ihMVuTbEr72h1fNuHXeA9KS5RWNyWO9XvwVu/QHvJStTZHleWev97ymTDjkKKIqCsB
	 bhqNsJtDoTgZz1cxiqs29hp9q3R5MhFc8U2fUaOt4aKqtIuVwJRIWZP1u5mW0Ypayn
	 BRUe8/CfvIiJQ==
Message-ID: <3fc21eb5-218b-f783-a7ef-f805f13c66da@collabora.com>
Date: Fri, 6 May 2022 18:10:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v7 04/20] kernel: Add combined power-off+restart handler
 call chain API
Content-Language: en-US
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
 Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee.jones@linaro.org>, Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 Linux-sh list <linux-sh@vger.kernel.org>, xen-devel@lists.xenproject.org,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>
References: <20220411233832.391817-1-dmitry.osipenko@collabora.com>
 <20220411233832.391817-5-dmitry.osipenko@collabora.com>
 <CAJZ5v0gnTSoeNP+QXwrZ45FQY4howVkJMuCjM=j+_-2BngJdQg@mail.gmail.com>
 <990621e7-9f8a-8b4a-02ec-fd6c1e1f48ff@collabora.com>
 <CAJZ5v0jxXtwot0qpib4UG8Tz8Hd1dEbgo58tEdPFboU8xwKHNw@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAJZ5v0jxXtwot0qpib4UG8Tz8Hd1dEbgo58tEdPFboU8xwKHNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/20/22 21:47, Rafael J. Wysocki wrote:
>>>> +       void (*platform_power_off_cb)(void);
>>>> +       void (*simple_power_off_cb)(void *data);
>>>> +       void *simple_power_off_cb_data;
>>> Is there any particular reason to put these callbacks here and not
>>> directly into struct sys_off_handler?
>> They are used internally by reboot.c and shouldn't be touched by the
>> kernel API users, so I wanted to factor out and protect all the private
>> data.
> But they come from these users anyway, don't they?
> 

Yes, the point is that these callback pointers are owned by the kernel
core while callbacks are registered.

-- 
Best regards,
Dmitry

