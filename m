Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B8472A8CC
	for <lists+xen-devel@lfdr.de>; Sat, 10 Jun 2023 05:28:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546371.853179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7pG6-00071Q-8n; Sat, 10 Jun 2023 03:27:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546371.853179; Sat, 10 Jun 2023 03:27:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7pG6-0006yU-4w; Sat, 10 Jun 2023 03:27:22 +0000
Received: by outflank-mailman (input) for mailman id 546371;
 Sat, 10 Jun 2023 03:27:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KtaG=B6=infradead.org=willy@srs-se1.protection.inumbo.net>)
 id 1q7pG3-0006yN-I6
 for xen-devel@lists.xenproject.org; Sat, 10 Jun 2023 03:27:21 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3530a04-073e-11ee-b232-6b7b168915f2;
 Sat, 10 Jun 2023 05:27:18 +0200 (CEST)
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1q7pFJ-00HR1D-8P; Sat, 10 Jun 2023 03:26:33 +0000
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
X-Inumbo-ID: b3530a04-073e-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iWsYnjfno/GMHCivYc524n1XWJb9xmxltmrmIDlCdQE=; b=c0Jh5FhIIB3DTx5SY3eXpBgbpz
	CpGnTxh/SXEglYdzpIbVob0Ixmh/MIkNrYVq4qMOIA2ZlKOf/gqjFprH6VjtZVvelLKR8FA8GRXM1
	hTeuuoG/8cSkeiAAeLcvo9BZXvI18OQnxgi1OYgXaaoWhzX4bL4/Yx7UTfM/NJUcXbzeC3orHZEYL
	0+sHTGqG+Mb7nxqPrXEJIPwFDsIbsigxbIdySdYh3D057/Zz4yNFUO8Cm0Jycz0yrwAYBihG1sJ6S
	aWsGDC9NApAADViPpJPErry6+/c/ewy4ihxFQSSUr0JYXxWVVmZpe20Zzte7DPhvLz5EsC4e7hi+S
	rfwZVq9Q==;
Date: Sat, 10 Jun 2023 04:26:33 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>,
	Federico Vaga <federico.vaga@vaga.pv.it>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Lee Jones <lee@kernel.org>, Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 4/4] Strict XenStore entry parsing
Message-ID: <ZIPtaYfgevtegNot@casper.infradead.org>
References: <20230610025759.1813-1-demi@invisiblethingslab.com>
 <20230610025759.1813-4-demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230610025759.1813-4-demi@invisiblethingslab.com>

On Fri, Jun 09, 2023 at 10:57:59PM -0400, Demi Marie Obenour wrote:
> This uses the newly-introduced strict version of sscanf().

I can see that.  Why does it do that?

Documentation/process/5.Posting.rst

(in general, there is a lack of detail across all four of these patches
justifying why any of this work is being done.  it isn't obvious to me
why skipping leading whitespace is bad in this context)


