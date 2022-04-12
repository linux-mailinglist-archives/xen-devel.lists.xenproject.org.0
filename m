Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 129F94FD377
	for <lists+xen-devel@lfdr.de>; Tue, 12 Apr 2022 11:56:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303563.517882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neDFr-0005oX-At; Tue, 12 Apr 2022 09:56:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303563.517882; Tue, 12 Apr 2022 09:56:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neDFr-0005mh-7Y; Tue, 12 Apr 2022 09:56:11 +0000
Received: by outflank-mailman (input) for mailman id 303563;
 Tue, 12 Apr 2022 09:56:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hmqi=UW=collabora.com=dmitry.osipenko@srs-se1.protection.inumbo.net>)
 id 1neDFp-0005lC-GZ
 for xen-devel@lists.xenproject.org; Tue, 12 Apr 2022 09:56:09 +0000
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c55e6f13-ba46-11ec-8fbc-03012f2f19d4;
 Tue, 12 Apr 2022 11:56:06 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id CA7361F44465
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
X-Inumbo-ID: c55e6f13-ba46-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1649757366;
	bh=zGnnxmSlqh0YJeepd6leEtd3OpvyuoG43h8kmGFF2wc=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=P61L93uCY2BzkAlZkIa7DkNYhLesoazkWjHR45+XoCKZ8ns44JwAXtKwQtsKB5IWu
	 LBnshgET/1to4NkH52cenj6AcmR1fzToetNSgDLXX18/JYkgkQQSwZdaXlqZHCnpKj
	 1GBxRjPOedK74qEOQrXw+d5AInCvSk+FnCDQJJggENcP/eOVY2//qX2NkpjVfzBsqa
	 1dFmWcLJ7EUVzhKFegMKqxZGBg1v/mwnu50TrXhdgNf6aMdvdkZzAOzeVFn7EFF2vi
	 bG+4SHDoaE6xdqEupYSgMD2ed1PrE/GTXU258Xq63ayijsB2BJhDrJNAYUxYDRgOkh
	 gETvkTIe02RWg==
Message-ID: <1b95163a-4b4d-3c0d-440d-0b6dd608b393@collabora.com>
Date: Tue, 12 Apr 2022 12:55:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v7 16/20] mips: Use do_kernel_power_off()
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Thierry Reding <thierry.reding@gmail.com>,
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
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee.jones@linaro.org>, Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20220411233832.391817-1-dmitry.osipenko@collabora.com>
 <20220411233832.391817-17-dmitry.osipenko@collabora.com>
In-Reply-To: <20220411233832.391817-17-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 4/12/22 02:38, Dmitry Osipenko wrote:
> Kernel now supports chained power-off handlers. Use do_kernel_power_off()
> that invokes chained power-off handlers. It also invokes legacy
> pm_power_off() for now, which will be removed once all drivers will
> be converted to the new power-off API.
> 
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  arch/mips/kernel/reset.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/mips/kernel/reset.c b/arch/mips/kernel/reset.c
> index 6288780b779e..e7ce07b3e79b 100644
> --- a/arch/mips/kernel/reset.c
> +++ b/arch/mips/kernel/reset.c
> @@ -114,8 +114,7 @@ void machine_halt(void)
>  
>  void machine_power_off(void)
>  {
> -	if (pm_power_off)
> -		pm_power_off();
> +	do_kernel_power_off();
>  
>  #ifdef CONFIG_SMP
>  	preempt_disable();

Adding ack from Thomas that he gave to v6. It's missing in v7 by accident.

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

