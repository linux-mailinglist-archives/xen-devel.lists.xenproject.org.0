Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FB04FD376
	for <lists+xen-devel@lfdr.de>; Tue, 12 Apr 2022 11:55:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303560.517872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neDFN-0005Ij-1Q; Tue, 12 Apr 2022 09:55:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303560.517872; Tue, 12 Apr 2022 09:55:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neDFM-0005G1-Ul; Tue, 12 Apr 2022 09:55:40 +0000
Received: by outflank-mailman (input) for mailman id 303560;
 Tue, 12 Apr 2022 09:55:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hmqi=UW=collabora.com=dmitry.osipenko@srs-se1.protection.inumbo.net>)
 id 1neDFL-0005Fv-Na
 for xen-devel@lists.xenproject.org; Tue, 12 Apr 2022 09:55:39 +0000
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4486e7a-ba46-11ec-a405-831a346695d4;
 Tue, 12 Apr 2022 11:55:38 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 1E1521F43F0C
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
X-Inumbo-ID: b4486e7a-ba46-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1649757337;
	bh=L7sIocVMVJFFf6pt5kvonBwHJBi8ufG5aawNMHgSOk0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S7aa0qukIEifv3VA3CuUR35b2mrfJnR/HsoJXzpmjRJMCbhxox8PyYd3y4yAh2cci
	 fkdP6WhWpX2fTNoSalTPD6PO9LosH8R/uIddoXqmSbAGkyMpOv7gtxoyhkm7Vdt7Po
	 VE+FMV4P/sBi8qGDGbVNV7G1cE0QQC1Psgi2NgDN4gF7AuPhmOvrPWztAg0OKxrhYx
	 ZY0kqCMPGfjI965JP3tWKRvKNwoFqex5VZBw8ei+llxHp+CnMQUlR0C0Mb9omyZuyR
	 pQwj21iO0qbnTtEuCeKQh+DA2pdqBpS/Tpsp0jFVlk3igIjJYKAd36t5EZ0tHXKfa6
	 Nz+EAW2F2/bCw==
Message-ID: <24a38d79-b52e-387b-5ef2-954aef05a49d@collabora.com>
Date: Tue, 12 Apr 2022 12:55:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v7 00/20] Introduce power-off+restart call chain API
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
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
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee.jones@linaro.org>, Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux-sh list <linux-sh@vger.kernel.org>, xen-devel@lists.xenproject.org,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>
References: <20220411233832.391817-1-dmitry.osipenko@collabora.com>
 <CAMuHMdVfOpGvF5FR6vFD-3a1h-7Kc_yAKQzWV71PD6mDy6BmZw@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAMuHMdVfOpGvF5FR6vFD-3a1h-7Kc_yAKQzWV71PD6mDy6BmZw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/12/22 10:06, Geert Uytterhoeven wrote:
> Hi Dmitry,
> 
> On Tue, Apr 12, 2022 at 1:38 AM Dmitry Osipenko
> <dmitry.osipenko@collabora.com> wrote:
>> Problem
>> -------
>>
>> SoC devices require power-off call chaining functionality from kernel.
>> We have a widely used restart chaining provided by restart notifier API,
>> but nothing for power-off.
> 
>> Changelog:
>>
>> v7: - Rebased on a recent linux-next. Dropped the recently removed
>>       NDS32 architecture. Only SH and x86 arches left un-acked.
>>
>>     - Added acks from Thomas Bogendoerfer and Krzysztof Kozlowski
>>       to the MIPS and memory/emif patches respectively.
> 
> Looks like you forgot to add the actual acks?

Good catch, thank you! Indeed, I sent out the version without the acks,
but luckily it's only the acks that are missing, the code is fine.

