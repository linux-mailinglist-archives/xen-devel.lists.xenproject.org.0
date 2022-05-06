Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A8451DB12
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 16:47:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323320.544895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmzEc-0001bf-Tc; Fri, 06 May 2022 14:47:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323320.544895; Fri, 06 May 2022 14:47:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmzEc-0001Yo-QW; Fri, 06 May 2022 14:47:10 +0000
Received: by outflank-mailman (input) for mailman id 323320;
 Fri, 06 May 2022 14:47:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OlOn=VO=collabora.com=dmitry.osipenko@srs-se1.protection.inumbo.net>)
 id 1nmzEb-0001Yi-Am
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 14:47:09 +0000
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 670cd564-cd4b-11ec-a406-831a346695d4;
 Fri, 06 May 2022 16:47:08 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id C32391F468F5
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
X-Inumbo-ID: 670cd564-cd4b-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1651848427;
	bh=utol468ApKu3UfEFy7x8r+aU8cRRwOmqk4bK/1Di3gM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jBE3ytwUGToW06KmZyXbQlLMQh11EfcrZ6bdwLxbmA9KbTMiYuuNn3kvbqh632rH2
	 Jgx0CZHq1E9lNHGEsuRz21D8kAvAh8rFaR8jds1ArktyMwvqKLxX4GAkX19BTWUmPP
	 b1quvNeRnJpwzsGfRULjPmqW94UBaLvY+SdyGZ2o/bAt8UYAzh00sKV0zWBnlAl37N
	 VELNP3WacCdMrm2dk8Vabl3yhZXLesCAV/s6oeDX+kpR+1yBykPgcYSQODD7Vr7gKd
	 V7A6zoiXfzrqEzkhyai26Ys6RbYpjgl9Ni5GI2/IasHsLcZOIHlsySI8JROUyGnbmg
	 dahigOUrcy3KA==
Message-ID: <f8075f97-4cc7-b802-97af-c0ef5a969624@collabora.com>
Date: Fri, 6 May 2022 17:46:57 +0300
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
>>>> +/**
>>>> + *     devm_register_prioritized_power_off_handler - Register prioritized power-off callback
>>>> + *     @dev: Device that registers callback
>>>> + *     @priority: Callback's priority
>>>> + *     @callback: Callback function
>>>> + *     @cb_data: Callback's argument
>>>> + *
>>>> + *     Registers resource-managed power-off callback with a given priority.
>>>> + *     It will be called as last step of the power-off sequence. Callbacks
>>>> + *     chaining is disabled, i.e. further lower priority callbacks won't
>>>> + *     be executed if this @callback will fail to execute.
>>>> + *
>>>> + *     Returns zero on success, or error code on failure.
>>> What's the case in which this should be used instead of registering a
>>> full sys_off handler?
>> There are a lot of drivers that just want to register power-off handler
>> with a non-default priority and don't need to stop the chain or do
>> anything else special. This is a convinient helper for them.
>>
>> Please note that the callback here takes only the cb_data for the
>> argument, while sys_off uses "struct power_off_data".
>>
>> Similar for the reset of the convinient helpers.
> So if there is a way to do this, why would anyone prefer to use the
> full sys_off handler at all?

There are couple occurrences around kernel where there is no device
available for the devm_ functions, like this for example [1].

[1]
https://gitlab.collabora.com/dmitry.osipenko/linux-kernel-rd/-/commit/184dfd3983e774d3cf9050dc5b4ec23a662a9551

-- 
Best regards,
Dmitry

