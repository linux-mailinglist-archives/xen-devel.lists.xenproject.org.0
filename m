Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6D372AA0C
	for <lists+xen-devel@lfdr.de>; Sat, 10 Jun 2023 09:52:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546409.853239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7tOa-0003Y9-Bx; Sat, 10 Jun 2023 07:52:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546409.853239; Sat, 10 Jun 2023 07:52:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7tOa-0003V6-8W; Sat, 10 Jun 2023 07:52:24 +0000
Received: by outflank-mailman (input) for mailman id 546409;
 Sat, 10 Jun 2023 07:52:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tnVv=B6=bombadil.srs.infradead.org=BATV+c3a881511f94545a8309+7230+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1q7tOY-0003Uy-MZ
 for xen-devel@lists.xenproject.org; Sat, 10 Jun 2023 07:52:22 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9a07e6b-0763-11ee-8611-37d641c3527e;
 Sat, 10 Jun 2023 09:52:20 +0200 (CEST)
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1q7tOE-00FUuk-0b; Sat, 10 Jun 2023 07:52:02 +0000
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
X-Inumbo-ID: b9a07e6b-0763-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=I3eudtYeV5TV5WQHRhUyvWFxU9I3ISH8S89bAYnG6NU=; b=f67UfxH47kEQBnD5o9jf/FX+4g
	1qi78PW8Y96Pzah96O/dbY4opnpR8I+Haj9rAOZWZ6xeIQUbm8IHzX8wsmaJ0tUC5/A5JqklIiBIf
	AJjvSHlQh3+fkxkgPNvviLO41VtvJ0cKmNUh8Amkmh5s2WkMulPrcGAu3n6hTXfozxgmYPoPdH2gV
	zmPLDFHPBNz5vdpn9HUNwx+2765btptWc0jjeE7tcm3rFtX5IrYU0PHhUbldM3t6eEtNnJnRbxaYe
	tetgvBNjIxfZ4e9OP6Fs6kqqIX2pgra32nosEzCcgu86DrtXyMlmfGkAmb5ocqKaNuP6rSqhHaoa4
	s7bjZeag==;
Date: Sat, 10 Jun 2023 00:52:02 -0700
From: Christoph Hellwig <hch@infradead.org>
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
Subject: Re: [PATCH 3/4] Add strict version of vsscanf()
Message-ID: <ZIQrohcizoj4bZWx@infradead.org>
References: <20230610025759.1813-1-demi@invisiblethingslab.com>
 <20230610025759.1813-3-demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230610025759.1813-3-demi@invisiblethingslab.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

This needs a real commit message explaining what the strict version
does and why, and why we can't just make the normal version more
strict.


