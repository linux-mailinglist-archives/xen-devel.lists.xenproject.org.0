Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BEE72AA06
	for <lists+xen-devel@lfdr.de>; Sat, 10 Jun 2023 09:51:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546399.853218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7tM0-0001cS-NL; Sat, 10 Jun 2023 07:49:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546399.853218; Sat, 10 Jun 2023 07:49:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7tM0-0001aD-KP; Sat, 10 Jun 2023 07:49:44 +0000
Received: by outflank-mailman (input) for mailman id 546399;
 Sat, 10 Jun 2023 07:49:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tnVv=B6=bombadil.srs.infradead.org=BATV+c3a881511f94545a8309+7230+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1q7tLy-0001a3-6g
 for xen-devel@lists.xenproject.org; Sat, 10 Jun 2023 07:49:42 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59aade4d-0763-11ee-b232-6b7b168915f2;
 Sat, 10 Jun 2023 09:49:39 +0200 (CEST)
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1q7tLS-00FUgv-1F; Sat, 10 Jun 2023 07:49:10 +0000
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
X-Inumbo-ID: 59aade4d-0763-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UmRbWljufOPyIQiIA7CHB8iopRQHod9Lz261qd58zvs=; b=nEy8SFw08DDvJdj0bE8owjCgYJ
	MxplFsLBDrXPMjndU9aVtWXYozgH686nLhrIwfzoPEdmK3bZZcdbaZZywwF0Le//wtRCM+oL4rZjd
	xAXCGmj7bTdJOTw185oeGzARHKM/OsYXo7DgGaS0V+UKYBBfR2oiMcnwNooQm2kB5W3XzmT00TqDd
	nP0ts9vHWoRIVfAIxOYT5y5E7ctDiFERDzIAlQK0RyublDP6Rj37SfvqnsSilB/KqlE+gpg5yHjEs
	kKgxOEsmznIm+llwr1JrwtPJFEpmNk5ZhqAYwYd6PZVMqt5L3PbHPGRTOZu2cc3e2NpqWG9KZ416Z
	Qftgjt7Q==;
Date: Sat, 10 Jun 2023 00:49:10 -0700
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
Subject: Re: [PATCH 1/4] Rip out simple_strtoll()
Message-ID: <ZIQq9m7+YSLBIKzP@infradead.org>
References: <20230610025759.1813-1-demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230610025759.1813-1-demi@invisiblethingslab.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

I'd maybe say remove instead of "rip out", but otherwise this looks
good:

Reviewed-by: Christoph Hellwig <hch@lst.de>


