Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9DB4FD378
	for <lists+xen-devel@lfdr.de>; Tue, 12 Apr 2022 11:57:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303566.517894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neDGa-0006PJ-L3; Tue, 12 Apr 2022 09:56:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303566.517894; Tue, 12 Apr 2022 09:56:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neDGa-0006Mv-Gs; Tue, 12 Apr 2022 09:56:56 +0000
Received: by outflank-mailman (input) for mailman id 303566;
 Tue, 12 Apr 2022 09:56:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hmqi=UW=collabora.com=dmitry.osipenko@srs-se1.protection.inumbo.net>)
 id 1neDGY-0006Me-44
 for xen-devel@lists.xenproject.org; Tue, 12 Apr 2022 09:56:54 +0000
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e12c19e6-ba46-11ec-8fbc-03012f2f19d4;
 Tue, 12 Apr 2022 11:56:53 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id B9CA61F444DB
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
X-Inumbo-ID: e12c19e6-ba46-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1649757412;
	bh=ta29d4wnkNjIs8vxiW+spXtMVlKSVX42O2OgeMWUE4M=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=kvhz7L+WR7F9HsP7+DAE1iJ09kPWZRmi5f2q6+wTFMWAjrPkNWY3Jzpgqp30kF162
	 9ej87DkBRElok2belFURZJE+6KAffcONlx+uSragUy+EKLYmrLe+OmnInaVU38Utnj
	 oGDfaSbiVVHQL6Yf2olT656ydNf9P6W4M76WukTbNC94PbuWprXpn8hcs1neMp19bi
	 iNzDzyCfCh2mIdCCNxP2XuZopGSbEx58bF1q1D3kWpmOuMeUlqToTVLTBXzlWDyGYS
	 beMdM6XO+lz1xQI7S8U0f+hcwzSbrlRYbQ5mvoaXJTg3bPRXH5hIYNcxpGgH7YbXoc
	 9fEZqqnyfRE+w==
Message-ID: <2b603d3d-c6c1-13d7-8f77-042317a41d00@collabora.com>
Date: Tue, 12 Apr 2022 12:56:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v7 17/20] memory: emif: Use kernel_can_power_off()
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
 <20220411233832.391817-18-dmitry.osipenko@collabora.com>
In-Reply-To: <20220411233832.391817-18-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 4/12/22 02:38, Dmitry Osipenko wrote:
> Replace legacy pm_power_off with kernel_can_power_off() helper that
> is aware about chained power-off handlers.
> 
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/memory/emif.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/memory/emif.c b/drivers/memory/emif.c
> index edf3ba7447ed..fa6845313a43 100644
> --- a/drivers/memory/emif.c
> +++ b/drivers/memory/emif.c
> @@ -630,7 +630,7 @@ static irqreturn_t emif_threaded_isr(int irq, void *dev_id)
>  		dev_emerg(emif->dev, "SDRAM temperature exceeds operating limit.. Needs shut down!!!\n");
>  
>  		/* If we have Power OFF ability, use it, else try restarting */
> -		if (pm_power_off) {
> +		if (kernel_can_power_off()) {
>  			kernel_power_off();
>  		} else {
>  			WARN(1, "FIXME: NO pm_power_off!!! trying restart\n");

Adding ack from Krzysztof that he gave to v6. It's missing in v7 by
accident.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

