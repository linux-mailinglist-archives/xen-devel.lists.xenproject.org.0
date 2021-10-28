Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C68E043DFAE
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 13:01:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217857.378065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg39o-0005Hr-1l; Thu, 28 Oct 2021 11:01:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217857.378065; Thu, 28 Oct 2021 11:01:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg39n-0005FM-Uh; Thu, 28 Oct 2021 11:01:15 +0000
Received: by outflank-mailman (input) for mailman id 217857;
 Thu, 28 Oct 2021 11:01:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cvms=PQ=linux.intel.com=andriy.shevchenko@srs-us1.protection.inumbo.net>)
 id 1mg39m-0005F6-JP
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 11:01:14 +0000
Received: from mga07.intel.com (unknown [134.134.136.100])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5cc50fd4-37de-11ec-849d-12813bfff9fa;
 Thu, 28 Oct 2021 11:01:13 +0000 (UTC)
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 04:01:11 -0700
Received: from smile.fi.intel.com ([10.237.72.184])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 04:00:54 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1mg395-001jY2-If; Thu, 28 Oct 2021 14:00:31 +0300
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
X-Inumbo-ID: 5cc50fd4-37de-11ec-849d-12813bfff9fa
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="293839153"
X-IronPort-AV: E=Sophos;i="5.87,189,1631602800"; 
   d="scan'208";a="293839153"
X-IronPort-AV: E=Sophos;i="5.87,189,1631602800"; 
   d="scan'208";a="447649034"
Date: Thu, 28 Oct 2021 14:00:31 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Lee Jones <lee.jones@linaro.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Russell King <linux@armlinux.org.uk>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Joshua Thompson <funaho@jurai.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
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
	Len Brown <lenb@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Tony Lindgren <tony@atomide.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Pavel Machek <pavel@ucw.cz>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
	linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-acpi@vger.kernel.org, linux-omap@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 03/45] notifier: Add
 atomic/blocking_notifier_has_unique_priority()
Message-ID: <YXqCz/utp2DFJJ45@smile.fi.intel.com>
References: <20211027211715.12671-1-digetx@gmail.com>
 <20211027211715.12671-4-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211027211715.12671-4-digetx@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Oct 28, 2021 at 12:16:33AM +0300, Dmitry Osipenko wrote:
> Add atomic/blocking_notifier_has_unique_priority() helpers which return
> true if given handler has unique priority.

...

> +/**
> + *	atomic_notifier_has_unique_priority - Checks whether notifier's priority is unique
> + *	@nh: Pointer to head of the atomic notifier chain
> + *	@n: Entry in notifier chain to check
> + *
> + *	Checks whether there is another notifier in the chain with the same priority.
> + *	Must be called in process context.
> + *
> + *	Returns true if priority is unique, false otherwise.

Why this indentation?

> + */
> +bool atomic_notifier_has_unique_priority(struct atomic_notifier_head *nh,
> +		struct notifier_block *n)
> +{
> +	struct notifier_block **nl = &nh->head;
> +	unsigned long flags;
> +	bool ret = true;
> +
> +	spin_lock_irqsave(&nh->lock, flags);
> +
> +	while ((*nl) != NULL && (*nl)->priority >= n->priority) {

' != NULL' is redundant.

> +		if ((*nl)->priority == n->priority && (*nl) != n) {
> +			ret = false;
> +			break;
> +		}
> +
> +		nl = &((*nl)->next);
> +	}
> +
> +	spin_unlock_irqrestore(&nh->lock, flags);
> +
> +	return ret;
> +}

...

> +	/*
> +	 * This code gets used during boot-up, when task switching is
> +	 * not yet working and interrupts must remain disabled.  At

One space is enough.

> +	 * such times we must not call down_write().
> +	 */

> +	while ((*nl) != NULL && (*nl)->priority >= n->priority) {

' != NULL' is not needed.

> +		if ((*nl)->priority == n->priority && (*nl) != n) {
> +			ret = false;
> +			break;
> +		}
> +
> +		nl = &((*nl)->next);
> +	}

-- 
With Best Regards,
Andy Shevchenko



