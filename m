Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DAA4602AA
	for <lists+xen-devel@lfdr.de>; Sun, 28 Nov 2021 01:48:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234112.406335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mr8MZ-0006sd-AF; Sun, 28 Nov 2021 00:48:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234112.406335; Sun, 28 Nov 2021 00:48:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mr8MZ-0006qq-79; Sun, 28 Nov 2021 00:48:15 +0000
Received: by outflank-mailman (input) for mailman id 234112;
 Sun, 28 Nov 2021 00:48:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LJYX=QP=rere.qmqm.pl=mirq-linux@srs-se1.protection.inumbo.net>)
 id 1mr8MX-0006qk-Hp
 for xen-devel@lists.xenproject.org; Sun, 28 Nov 2021 00:48:13 +0000
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd2e4ee5-4fe4-11ec-976b-d102b41d0961;
 Sun, 28 Nov 2021 01:48:12 +0100 (CET)
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4J1q8r4xRGz9Y;
 Sun, 28 Nov 2021 01:28:44 +0100 (CET)
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
X-Inumbo-ID: dd2e4ee5-4fe4-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
	t=1638059340; bh=BpCUv6sc6+ijt8bP2X1dBPBQztb08CMPEjcmSI4mWHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E2pJXVdwpF7xa7NgJpuaA7I4sUgCSxdIM51ma240k1OvyN0BqmbHCll/qibc7LmRW
	 l2lYyRdiOG0LzZZRcQGCbOEp7l5l7FW2EF13o78tAxh2BlfQLPIqSf2RtHjwNL3AHE
	 ag5QLlLhW95Kp8fH9dCV3j4Imx5XQ5T4nV1vyleMAzKz1Soq6c6OnKpJ5TdzfdwJ2G
	 LnQoKtgUWmpQEblg3IMnaxzgslueaP8apjKdZ9y96JJ35QjeXKQSawNEPmoxjBztTd
	 XADr6Ffb3r0e7Kv67f/UCkeky+8m4GCPkGRqXkdYh2BWzTit8bUIHp4dPNUh/LgLHY
	 SH/yCd1X39o+Q==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.3 at mail
Date: Sun, 28 Nov 2021 01:28:40 +0100
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
Message-ID: <YaLNOJTM+lVq+YNS@qmqm.qmqm.pl>
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-6-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211126180101.27818-6-digetx@gmail.com>

On Fri, Nov 26, 2021 at 09:00:41PM +0300, Dmitry Osipenko wrote:
> Add sanity check which ensures that there are no two restart handlers
> registered with the same priority. Normally it's a direct sign of a
> problem if two handlers use the same priority.

The patch doesn't ensure the property that there are no duplicated-priority
entries on the chain.

I'd rather see a atomic_notifier_chain_register_unique() that returns
-EBUSY or something istead of adding an entry with duplicate priority.
That way it would need only one list traversal unless you want to
register the duplicate anyway (then you would call the older
atomic_notifier_chain_register() after reporting the error).

(Or you could return > 0 when a duplicate is registered in
atomic_notifier_chain_register() if the callers are prepared
for that. I don't really like this way, though.)

Best Regards
Micha³ Miros³aw

