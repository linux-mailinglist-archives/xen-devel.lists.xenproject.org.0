Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 658D4460A3D
	for <lists+xen-devel@lfdr.de>; Sun, 28 Nov 2021 22:17:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234243.406548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrRY1-0000ef-3X; Sun, 28 Nov 2021 21:17:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234243.406548; Sun, 28 Nov 2021 21:17:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrRY1-0000c2-0S; Sun, 28 Nov 2021 21:17:21 +0000
Received: by outflank-mailman (input) for mailman id 234243;
 Sun, 28 Nov 2021 21:17:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LJYX=QP=rere.qmqm.pl=mirq-linux@srs-se1.protection.inumbo.net>)
 id 1mrRXz-0000bw-No
 for xen-devel@lists.xenproject.org; Sun, 28 Nov 2021 21:17:19 +0000
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90fa3c66-5090-11ec-b941-1df2895da90e;
 Sun, 28 Nov 2021 22:17:18 +0100 (CET)
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4J2LsJ1Lcdz9y;
 Sun, 28 Nov 2021 22:17:08 +0100 (CET)
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
X-Inumbo-ID: 90fa3c66-5090-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
	t=1638134236; bh=AVVRrFppT2KXeoQ1knr4qxNAWz0fqZEqjSZX5XRty4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qeLiiTlDKcoC3FvftCsYmUekeo8vu2N1pSF3fCD2tgheWVvyonhdof+qu+Ea9djoI
	 F0VfIqhNPcyB+IepSkiEVfWMkXITXgi5yRN5hDrKipQbOIN/UYPiCQ3ypFE5/lr3yX
	 t143o/oCoxAN5HQdJgLvzJt9p7M6RWXHGnJUqKSETKZD7q6dZ+W4qIz0kh2v3idXT1
	 jUvuN2o4SCcowRIIDi5HFtYotMwlOnPhdI33AjtMrxHoxjMEAOO/hdSLgu27razlyO
	 MB5TcQY9Ad3wE8nllR9aML4jKPT5UuRgghYO2j4ETJ73vP6/OvL2peMilDKCW68Ia0
	 6xDNHfFLM+f6A==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.3 at mail
Date: Sun, 28 Nov 2021 22:17:06 +0100
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
Subject: Re: [PATCH v4 08/25] kernel: Add combined power-off+restart handler
 call chain API
Message-ID: <YaPx0kY7poGpwCL9@qmqm.qmqm.pl>
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-9-digetx@gmail.com>
 <YaLQqks8cB0vWp6Q@qmqm.qmqm.pl>
 <9213569e-0f40-0df1-4710-8dab564e12d6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9213569e-0f40-0df1-4710-8dab564e12d6@gmail.com>

On Mon, Nov 29, 2021 at 12:04:01AM +0300, Dmitry Osipenko wrote:
> 28.11.2021 03:43, Michał Mirosław пишет:
> > On Fri, Nov 26, 2021 at 09:00:44PM +0300, Dmitry Osipenko wrote:
> >> SoC platforms often have multiple ways of how to perform system's
> >> power-off and restart operations. Meanwhile today's kernel is limited to
> >> a single option. Add combined power-off+restart handler call chain API,
> >> which is inspired by the restart API. The new API provides both power-off
> >> and restart functionality.
> >>
> >> The old pm_power_off method will be kept around till all users are
> >> converted to the new API.
> >>
> >> Current restart API will be replaced by the new unified API since
> >> new API is its superset. The restart functionality of the sys-off handler
> >> API is built upon the existing restart-notifier APIs.
> >>
> >> In order to ease conversion to the new API, convenient helpers are added
> >> for the common use-cases. They will reduce amount of boilerplate code and
> >> remove global variables. These helpers preserve old behaviour for cases
> >> where only one power-off handler is expected, this is what all existing
> >> drivers want, and thus, they could be easily converted to the new API.
> >> Users of the new API should explicitly enable power-off chaining by
> >> setting corresponding flag of the power_handler structure.
> > [...]
> > 
> > Hi,
> > 
> > A general question: do we really need three distinct chains for this?
> 
> Hello Michał,
> 
> At minimum this makes code easier to follow.
> 
> > Can't there be only one that chain of callbacks that get a stage
> > (RESTART_PREPARE, RESTART, POWER_OFF_PREPARE, POWER_OFF) and can ignore
> > them at will? Calling through POWER_OFF_PREPARE would also return
> > whether that POWER_OFF is possible (for kernel_can_power_off()).
> 
> I'm having trouble with parsing this comment. Could you please try to
> rephrase it? I don't see how you could check whether power-off handler
> is available if you'll mix all handlers together.

If notify_call_chain() would be fixed to return NOTIFY_OK if any call
returned NOTIFY_OK, then this would be a clear way to gather the
answer if any of the handlers will attempt the final action (reboot or
power off).

> 
> > I would also split this patch into preparation cleanups (like wrapping
> > pm_power_off call with a function) and adding the notifier-based
> > implementation.
> 
> What's the benefit of this split up will be? Are you suggesting that it
> will ease reviewing of this patch or something else?

Mainly to ease review, as the wrapping will be a no-op, but the addition
of notifier chain changes semantics a bit.

Best Regards
Michał Mirosław

