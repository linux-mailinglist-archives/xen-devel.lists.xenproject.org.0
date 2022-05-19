Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D4852D0F8
	for <lists+xen-devel@lfdr.de>; Thu, 19 May 2022 12:58:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332837.556609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrdqg-0008OM-Ua; Thu, 19 May 2022 10:57:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332837.556609; Thu, 19 May 2022 10:57:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrdqg-0008Lg-RS; Thu, 19 May 2022 10:57:42 +0000
Received: by outflank-mailman (input) for mailman id 332837;
 Thu, 19 May 2022 10:57:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t67w=V3=collabora.com=dmitry.osipenko@srs-se1.protection.inumbo.net>)
 id 1nrdqf-0008LZ-H9
 for xen-devel@lists.xenproject.org; Thu, 19 May 2022 10:57:41 +0000
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fb9bcf2-d762-11ec-bd2c-47488cf2e6aa;
 Thu, 19 May 2022 12:57:39 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id A064E1F41C26
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
X-Inumbo-ID: 7fb9bcf2-d762-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1652957857;
	bh=n5xuyUTKwTtfK1E3KUXlguxQHbXpNAqOc2gndpqI8jA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JodT7xtJhuDdpRliWmuR69V68cdLgMXYC8d7buT+z/skOa4D3K2ioz+upZrBg2HUI
	 fFJ9Rn8C3zYLSF4itEkiZf4lAf9mhOFGsXHiH+NvNHs2flmyQC/4D/NcGC8PSQsOSO
	 GcqoxRa4TTV0C4aYYrl2y+kEE4aiAR0BuXE3s+rTbSRmruSUiKG/62QN94HtkxPd8h
	 5hZsoL+SJmGw8nEPAF5+YZtOZrPZ6NRg8hcTQlgW4L/qyI+I5dRn80ayHZZC1Hf8GO
	 mkG9ultCG+PShiWcqnTz48Dvqc3PWYvBoJFQUeF+LqJAZWbjIhdXyvsG+uqjGWPers
	 YX5xODM5B4tmA==
Message-ID: <43133a4d-8bad-93ba-c376-21d30d039b15@collabora.com>
Date: Thu, 19 May 2022 13:57:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v8 00/27] Introduce power-off+restart call chain API
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
References: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
 <CAJZ5v0jhWs-8ChHddebTZcaH6kA05sLEMsXM9Op7kHWAQDxeYA@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAJZ5v0jhWs-8ChHddebTZcaH6kA05sLEMsXM9Op7kHWAQDxeYA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/18/22 17:46, Rafael J. Wysocki wrote:
> On Tue, May 10, 2022 at 1:33 AM Dmitry Osipenko
> <dmitry.osipenko@collabora.com> wrote:
...
>> Introduce new API that provides call chains support for all restart and
>> power-off modes. The new API is designed with simplicity and extensibility
>> in mind.
...
> The v8 looks much better than the previous versions to me.
> 
> I actually don't really have any comments on it except for the minor
> remark regarding patch [1/27] sent separately.
> 
> Please just send an update of that one patch and I will queue up the
> series for 5.19.
> 
> However, I'm going to send a pull request with it in the second half
> of the merge window, after the majority of the other changes in the
> subsystems touched by it have been integrated.

Thanks, Rafael. I sent out the updated [1/27] patch to you.

For the reference, the updated patch can be found here as well:

https://lore.kernel.org/all/20220519105015.1195955-1-dmitry.osipenko@collabora.com/T/#u

-- 
Best regards,
Dmitry

