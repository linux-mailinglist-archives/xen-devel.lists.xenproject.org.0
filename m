Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 941A7501B17
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 20:28:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.305023.519821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf4CZ-0007Ab-Dh; Thu, 14 Apr 2022 18:28:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 305023.519821; Thu, 14 Apr 2022 18:28:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf4CZ-00077h-Aj; Thu, 14 Apr 2022 18:28:19 +0000
Received: by outflank-mailman (input) for mailman id 305023;
 Thu, 14 Apr 2022 18:28:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DvB4=UY=rere.qmqm.pl=mirq-linux@srs-se1.protection.inumbo.net>)
 id 1nf4CW-00077b-QS
 for xen-devel@lists.xenproject.org; Thu, 14 Apr 2022 18:28:17 +0000
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6076b8e-bc20-11ec-a405-831a346695d4;
 Thu, 14 Apr 2022 20:28:15 +0200 (CEST)
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4KfSCW69gWz4X;
 Thu, 14 Apr 2022 20:09:27 +0200 (CEST)
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
X-Inumbo-ID: a6076b8e-bc20-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
	t=1649959782; bh=dFgq80ZhVmCzh8EszsBqFZFG3IVVYvOIEvlGI0Tq4bM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M6meHZrwxDyeU2pD3ZmxqrGIOzrLBQXdCeqnbtwDtUq7d8NQ4FnteJZa5YFykZ6e+
	 X355Jw6iEC8xz5YVcTjA7IGBOIrhJJnO2gyLkF37nJHv3MgLZmJqPn2G0I5dDKnrg4
	 F4lkBza7OIX6WAPVjLgmrFFU3bI2WDyTsmq3yRNaX+0PJysAXwkYCJl0nPOwBhBgob
	 8slrsU1NRKlCWPtWM49DA1EczNJlhcfy1OC/YVXW0ILmdWA2Y4HIWMLSnQstsdxWpp
	 LxCcPEO0wf/x0jtEuJ4NrLpxwq+b047xHqknUEqc50McWrzi2dQf66NZb5+xCwTgL8
	 LJAaOowB2v/uQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.5 at mail
Date: Thu, 14 Apr 2022 20:09:26 +0200
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
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
	Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee.jones@linaro.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v7 00/20] Introduce power-off+restart call chain API
Message-ID: <YlhjVqStJJoL01v9@qmqm.qmqm.pl>
References: <20220411233832.391817-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220411233832.391817-1-dmitry.osipenko@collabora.com>

On Tue, Apr 12, 2022 at 02:38:12AM +0300, Dmitry Osipenko wrote:
> Problem
> -------
> 
> SoC devices require power-off call chaining functionality from kernel.
> We have a widely used restart chaining provided by restart notifier API,
> but nothing for power-off.
> 
> Solution
> --------
> 
> Introduce new API that provides both restart and power-off call chains.
[...]

For the series:

Reviewed-by: Micha³ Miros³aw <mirq-linux@rere.qmqm.pl>

