Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 171214602C7
	for <lists+xen-devel@lfdr.de>; Sun, 28 Nov 2021 02:24:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234123.406357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mr8v0-00050V-Aa; Sun, 28 Nov 2021 01:23:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234123.406357; Sun, 28 Nov 2021 01:23:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mr8v0-0004xt-7e; Sun, 28 Nov 2021 01:23:50 +0000
Received: by outflank-mailman (input) for mailman id 234123;
 Sun, 28 Nov 2021 01:23:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LJYX=QP=rere.qmqm.pl=mirq-linux@srs-se1.protection.inumbo.net>)
 id 1mr8uz-0004xn-3h
 for xen-devel@lists.xenproject.org; Sun, 28 Nov 2021 01:23:49 +0000
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5e9c48b-4fe9-11ec-b941-1df2895da90e;
 Sun, 28 Nov 2021 02:23:47 +0100 (CET)
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4J1rNJ4FZPz9Y;
 Sun, 28 Nov 2021 02:23:44 +0100 (CET)
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
X-Inumbo-ID: d5e9c48b-4fe9-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
	t=1638062626; bh=RQibj5ShLXXbscS9xDdhXFMN8ya6wwZPbmp6fmGd398=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n44MG2e5RBocnZVovLrwXYhpcT9mGSj0Yz0AO4iH3bISdkksZFTaPRPQ7fTkCKO8d
	 x+/RaAsmPFcJpyVM1wTyOQcpl9iI/qARQ9nnHNFUKcC/buQZ3OQy4ZdUfMi7/yUTEW
	 7WlKE+/agJAITMqFPd9R5R3E+MgK29J+XYHqyR0kp8JBFZvXtnVk0Pz1QzN3kso8HK
	 er/OuchNHm9U/TZDlt7ogfSjpTlkJvuHMLoM8/Ch6dpvLC0GmYw4askPTjYE6cd0GB
	 +8Icr2w4j1952hSNLT41SWUjT5RKnwcfW3Td5KzPdFvlY7NR4Wfe30xf1uZw3jj57o
	 PLz4CVm2GyNBg==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.3 at mail
Date: Sun, 28 Nov 2021 02:23:43 +0100
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Joshua Thompson <funaho@jurai.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sebastian Reichel <sre@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greentime Hu <green.hu@gmail.com>,
	Vincent Chen <deanbo422@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee.jones@linaro.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, alankao@andestech.com,
	"K . C . Kuen-Chern Lin" <kclin@andestech.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 22/25] memory: emif: Use kernel_can_power_off()
Message-ID: <YaLaH3Yt2M/Gko//@qmqm.qmqm.pl>
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-23-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211126180101.27818-23-digetx@gmail.com>

On Fri, Nov 26, 2021 at 09:00:58PM +0300, Dmitry Osipenko wrote:
> Replace legacy pm_power_off with kernel_can_power_off() helper that
> is aware about chained power-off handlers.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/emif.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/memory/emif.c b/drivers/memory/emif.c
> index 762d0c0f0716..cab10d5274a0 100644
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

BTW, this part of the code seems to be better moved to generic code that
could replace POWER_OFF request with REBOOT like it is done for reboot()
syscall.

Best Regards
Micha��Miros�aw

