Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C6D460BB4
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 01:36:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234276.406590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrUev-0003Xa-W3; Mon, 29 Nov 2021 00:36:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234276.406590; Mon, 29 Nov 2021 00:36:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrUev-0003Vl-T3; Mon, 29 Nov 2021 00:36:41 +0000
Received: by outflank-mailman (input) for mailman id 234276;
 Mon, 29 Nov 2021 00:36:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EiCZ=QQ=rere.qmqm.pl=mirq-linux@srs-se1.protection.inumbo.net>)
 id 1mrUeu-0003Vf-TL
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 00:36:40 +0000
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ab7d94c-50ac-11ec-976b-d102b41d0961;
 Mon, 29 Nov 2021 01:36:39 +0100 (CET)
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4J2RHF5R6Gz9Y;
 Mon, 29 Nov 2021 01:36:25 +0100 (CET)
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
X-Inumbo-ID: 6ab7d94c-50ac-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
	t=1638146198; bh=DI1VWBOrDzR1kSFvGVwF5e/uC6F95umcWDF0D1gW0co=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H73sBxsM7L9z8xEfnp2Ak7MzBK8+vuHhYSpX9ZmIw96z66YhhL0jbzAc1kAW4E8/k
	 E+n0myrDaFBdTPW3DCJBAB1QxLCznookgF41GB3ur/8AtJ172fB625fAJLQBCfF2Il
	 1tVB3rwB3wCft3kEONBcl+9mGZ0YFJna/va55m2Id6G5OQJMzxWyiW8mEoVG9uWh4D
	 9FU7cd4y+9BUv1/bcd+v0FTSSINIJ8msC5Z+cow25KP+uSrFkzTmZSbuYJNYmoN8pj
	 wIHmD3sAFqkn2Up4Tyhb9Q0kZcFFYL4JTYDk03Wdeze2AnxwyR74tes3GEAEUnF7BY
	 Uq7OHC/U12/7A==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.3 at mail
Date: Mon, 29 Nov 2021 01:36:24 +0100
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
Message-ID: <YaQgiLw03lPyvuhr@qmqm.qmqm.pl>
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-9-digetx@gmail.com>
 <YaLQqks8cB0vWp6Q@qmqm.qmqm.pl>
 <9213569e-0f40-0df1-4710-8dab564e12d6@gmail.com>
 <YaPx0kY7poGpwCL9@qmqm.qmqm.pl>
 <1fa2d9d5-f5f6-77f5-adf6-827921acce49@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1fa2d9d5-f5f6-77f5-adf6-827921acce49@gmail.com>

On Mon, Nov 29, 2021 at 12:53:51AM +0300, Dmitry Osipenko wrote:
> 29.11.2021 00:17, Michał Mirosław пишет:
> >> I'm having trouble with parsing this comment. Could you please try to
> >> rephrase it? I don't see how you could check whether power-off handler
> >> is available if you'll mix all handlers together.
> > If notify_call_chain() would be fixed to return NOTIFY_OK if any call
> > returned NOTIFY_OK, then this would be a clear way to gather the
> > answer if any of the handlers will attempt the final action (reboot or
> > power off).
> Could you please show a code snippet that implements your suggestion?

A rough idea is this:

 static int notifier_call_chain(struct notifier_block **nl,
 			       unsigned long val, void *v,
 			       int nr_to_call, int *nr_calls)
 {
-	int ret = NOTIFY_DONE;
+	int ret, result = NOTIFY_DONE;
 	struct notifier_block *nb, *next_nb;
 
 	nb = rcu_dereference_raw(*nl);
 
 	while (nb && nr_to_call) {
...
 		ret = nb->notifier_call(nb, val, v);
+
+		/* Assuming NOTIFY_STOP-carrying return is always greater than non-stopping one. */
+		if (result < ret)
+			result = ret;
... 
 	}
-	return ret;
+	return result;
 }

Then:

bool prepare_reboot()
{
	int ret = xx_notifier_call_chain(&shutdown_notifier, PREPARE_REBOOT, ...);
	return ret == NOTIFY_OK;
}

And the return value would signify whether the reboot will be attempted
when calling the chain for the REBOOT action. (Analogously for powering off.)

Best Regards
Michał Mirosław

