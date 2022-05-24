Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C77533254
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 22:18:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336741.561128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntaxa-0005CA-5u; Tue, 24 May 2022 20:16:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336741.561128; Tue, 24 May 2022 20:16:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntaxa-00059S-2Z; Tue, 24 May 2022 20:16:54 +0000
Received: by outflank-mailman (input) for mailman id 336741;
 Tue, 24 May 2022 20:16:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I1CX=WA=collabora.com=dmitry.osipenko@srs-se1.protection.inumbo.net>)
 id 1ntaxY-00059M-0V
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 20:16:52 +0000
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71689bf3-db9e-11ec-837f-e5687231ffcc;
 Tue, 24 May 2022 22:16:50 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id F2E871F447A6
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
X-Inumbo-ID: 71689bf3-db9e-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1653423409;
	bh=zYjjoQPSRD28QTzcQmCkF+0zDUTSRxsuI5oi8F0+rRQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fWA1AifiGfpu5zAody+hWBW74K5h5PJY4o9syShHoFUvcDbGztdgO0rxpFXKrmy2Y
	 v+m0QvVaF2TMOM3FrIQn4vCIIUWVeH9erQlS971HHUB5axW0nhIjNhf2t83dRltpj5
	 F+MJuBOytIM400P1utntTu0dMtY0yhe0QZvOmzJR1Di7UCyoNz6N/1CjkNfHCg26JH
	 3c5z3Ze+AYN7fowyq3Sq6g1iqMrOvzo1fQihDQtpwVaXvHM7BJiRY1axu6Kqy3ixZu
	 ZneM8hZeXSfA/wa0YX+aUD23BvnxfaiuWymTABWNglyXpsDZsuQOqKpz07ThIMgq+Y
	 y0ERqGVUsfdJQ==
Message-ID: <72eceb0c-8654-6c63-f1c4-c9374f99dfb3@collabora.com>
Date: Tue, 24 May 2022 23:16:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v8 07/27] kernel/reboot: Add kernel_can_power_off()
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
 linux-tegra <linux-tegra@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
 <20220509233235.995021-8-dmitry.osipenko@collabora.com>
 <CAMuHMdVGjeFe=Z_1Kr9ZaNZ7HUVH1usvubEB31WUQf0fg8E1kA@mail.gmail.com>
 <c4914e14-1882-55a1-bcbd-a905852b45a3@collabora.com>
 <CAMuHMdWBWWVeegvLQQzT8CRL5z38AhXigaNjzw8p0NwQ1B4DPQ@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAMuHMdWBWWVeegvLQQzT8CRL5z38AhXigaNjzw8p0NwQ1B4DPQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/24/22 18:03, Geert Uytterhoeven wrote:
> Hi Dmitry,
> 
> On Tue, May 24, 2022 at 3:41 PM Dmitry Osipenko
> <dmitry.osipenko@collabora.com> wrote:
>> On 5/24/22 16:14, Geert Uytterhoeven wrote:
>>> On Tue, May 10, 2022 at 1:33 AM Dmitry Osipenko
>>> <dmitry.osipenko@collabora.com> wrote:
>>>> Add kernel_can_power_off() helper that replaces open-coded checks of
>>>> the global pm_power_off variable. This is a necessary step towards
>>>> supporting chained power-off handlers.
>>>>
>>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>>
>>> Thanks for your patch, which is now commit 0e2110d2e910e44c
>>> ("kernel/reboot: Add kernel_can_power_off()") in pm/linux-next.
>>>
>>> This causes the "poweroff" command (Debian nfsroot) to no longer
>>> cleanly halt the system on arm32 systems, but fail with a panic
>>> instead:
>>>
>>> -reboot: System halted
>>> +reboot: Power down
>>> +Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000000
>>> +CPU: 0 PID: 1 Comm: systemd-shutdow Not tainted
>>> 5.18.0-rc7-shmobile-00007-g0e2110d2e910 #1274
>>> +Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
>>> + unwind_backtrace from show_stack+0x10/0x14
>>> + show_stack from dump_stack_lvl+0x40/0x4c
>>> + dump_stack_lvl from panic+0xf4/0x330
>>> + panic from do_exit+0x1c8/0x8e4
>>> + do_exit from __do_sys_reboot+0x174/0x1fc
>>> + __do_sys_reboot from ret_fast_syscall+0x0/0x54
>>> +Exception stack(0xf0815fa8 to 0xf0815ff0)
>>> +5fa0:                   004e6954 00000000 fee1dead 28121969 4321fedc f0d94600
>>> +5fc0: 004e6954 00000000 00000000 00000058 befa0c78 00000000 befa0c10 004e56f8
>>> +5fe0: 00000058 befa0b6c b6ec8d45 b6e4a746
>>> +---[ end Kernel panic - not syncing: Attempted to kill init!
>>> exitcode=0x00000000 ]---
>>>
>>> On arm64, "poweroff" causes a clean "reboot: Power down" before/after.
>>>
>>> On both arm32 and arm64, the same handlers are registered:
>>>   - SYS_OFF_MODE_POWER_OFF_PREPARE: legacy_pm_power_off_prepare
>>>   - SYS_OFF_MODE_POWER_OFF: legacy_pm_power_off
>>>
>>> On both arm32 and arm64, legacy_pm_power_off_prepare() is called.
>>> On both arm32 and arm64, legacy_pm_power_off() does not seem to
>>> be called.
>>>
>>> On arm32, both pm_power_off_prepare and pm_power_off are NULL.
>>> On arm64, pm_power_off_prepare is NULL, and
>>> pm_power_off is psci_sys_poweroff.
>>>
>>> Do you have a clue?
>>> Thanks!
>>
>> Thank you, Geert! I see the problem, the kernel_can_power_off() checks whether power-off handler is registered, but it's always registered because legacy_pm_power_off is registered unconditionally. So it causes trouble for platforms that don't have power-off handler installed at all. All platforms that I tested have a power-off handler, so now wonder that I didn't notice this before.
>>
>> This change should fix the problem, please give it a try:
> 
> Thank you, that fixes the problem for me!
> 
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Great! I'll send the proper patch soon.

-- 
Best regards,
Dmitry

