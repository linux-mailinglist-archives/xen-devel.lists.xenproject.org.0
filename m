Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 179BB460B9E
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 01:28:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234270.406579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrUVY-00027K-1g; Mon, 29 Nov 2021 00:27:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234270.406579; Mon, 29 Nov 2021 00:27:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrUVX-000258-UR; Mon, 29 Nov 2021 00:26:59 +0000
Received: by outflank-mailman (input) for mailman id 234270;
 Mon, 29 Nov 2021 00:26:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EiCZ=QQ=rere.qmqm.pl=mirq-linux@srs-se1.protection.inumbo.net>)
 id 1mrUVW-000252-BQ
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 00:26:58 +0000
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ed3275e-50ab-11ec-976b-d102b41d0961;
 Mon, 29 Nov 2021 01:26:56 +0100 (CET)
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4J2R463HYCz9Y;
 Mon, 29 Nov 2021 01:26:46 +0100 (CET)
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
X-Inumbo-ID: 0ed3275e-50ab-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
	t=1638145614; bh=rYhG1/gOEGdeEm/s8Gt8rEBk1iF8QMIsgq7S9tytKm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CbL6Dkr0hp6+eWfnOkswWvW2NOKJ79Uh6/l2ZCnK5kWTiOO50iqx187Rg4dryYZZY
	 bxYRz4m9fgWtZVh11lmgMaMMzocpKUJUWIlke/44DEMmzJJm4vDOSxFAyf1Gq25nhd
	 1THlT17c8aj7yKXukSvNxOS2rqgVH1j/XRMa1p7Hswrcs4jJdmmxtpOwmRnm9PweUg
	 dgln8/6i94ET+XVFAx+2l6pzk4WNbL+PWxg255szxizJhOsvQ3eK1ntEQbcIyPN3HU
	 KJwCs9dJC+yqQftWDNSkBS/r4FvpiW2ousq8It65okWyLREqQTSJR+N2Sf4mDmjtBp
	 iZvEDATRHwtcA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.3 at mail
Date: Mon, 29 Nov 2021 01:26:42 +0100
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
Subject: Re: [PATCH v4 05/25] reboot: Warn if restart handler has duplicated
 priority
Message-ID: <YaQeQgbW+CjEdsqG@qmqm.qmqm.pl>
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-6-digetx@gmail.com>
 <YaLNOJTM+lVq+YNS@qmqm.qmqm.pl>
 <033ddf2a-6223-1a82-ec64-30f17c891f67@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <033ddf2a-6223-1a82-ec64-30f17c891f67@gmail.com>

On Mon, Nov 29, 2021 at 12:06:19AM +0300, Dmitry Osipenko wrote:
> 28.11.2021 03:28, Michał Mirosław пишет:
> > On Fri, Nov 26, 2021 at 09:00:41PM +0300, Dmitry Osipenko wrote:
> >> Add sanity check which ensures that there are no two restart handlers
> >> registered with the same priority. Normally it's a direct sign of a
> >> problem if two handlers use the same priority.
> > 
> > The patch doesn't ensure the property that there are no duplicated-priority
> > entries on the chain.
> 
> It's not the exact point of this patch.
> 
> > I'd rather see a atomic_notifier_chain_register_unique() that returns
> > -EBUSY or something istead of adding an entry with duplicate priority.
> > That way it would need only one list traversal unless you want to
> > register the duplicate anyway (then you would call the older
> > atomic_notifier_chain_register() after reporting the error).
> 
> The point of this patch is to warn developers about the problem that
> needs to be fixed. We already have such troubling drivers in mainline.
> 
> It's not critical to register different handlers with a duplicated
> priorities, but such cases really need to be corrected. We shouldn't
> break users' machines during transition to the new API, meanwhile
> developers should take action of fixing theirs drivers.
> 
> > (Or you could return > 0 when a duplicate is registered in
> > atomic_notifier_chain_register() if the callers are prepared
> > for that. I don't really like this way, though.)
> 
> I had a similar thought at some point before and decided that I'm not in
> favor of this approach. It's nicer to have a dedicated function that
> verifies the uniqueness, IMO.

I don't like the part that it traverses the list second time to check
the uniqueness. But actually you could avoid that if
notifier_chain_register() would always add equal-priority entries in
reverse order:

 static int notifier_chain_register(struct notifier_block **nl,
 		struct notifier_block *n)
 {
 	while ((*nl) != NULL) {
 		if (unlikely((*nl) == n)) {
 			WARN(1, "double register detected");
 			return 0;
 		}
-		if (n->priority > (*nl)->priority)
+		if (n->priority >= (*nl)->priority)
 			break;
 		nl = &((*nl)->next);
 	}
 	n->next = *nl;
 	rcu_assign_pointer(*nl, n);
 	return 0;
 }

Then the check for uniqueness after adding would be:

 WARN(nb->next && nb->priority == nb->next->priority);

Best Regards
Michał Mirosław

