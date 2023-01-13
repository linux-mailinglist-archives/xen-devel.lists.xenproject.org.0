Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6116C6697DE
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 14:00:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477295.739942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGJfI-0006EO-Ej; Fri, 13 Jan 2023 13:00:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477295.739942; Fri, 13 Jan 2023 13:00:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGJfI-0006Az-AR; Fri, 13 Jan 2023 13:00:12 +0000
Received: by outflank-mailman (input) for mailman id 477295;
 Fri, 13 Jan 2023 13:00:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TZVY=5K=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1pGJfF-0006AR-M6
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 13:00:10 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34f1a767-9342-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 14:00:08 +0100 (CET)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pGJfH-0066XJ-Al; Fri, 13 Jan 2023 13:00:12 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E5685300642;
 Fri, 13 Jan 2023 13:59:56 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id A17DB20B8E4E3; Fri, 13 Jan 2023 13:59:56 +0100 (CET)
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
X-Inumbo-ID: 34f1a767-9342-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sfJlOYO8oT2oPc3YcXscu+eA6dh/Ct/nDZR0RvIAf6Y=; b=XiIJ6939tE1F6/5MIyvqQRsyX4
	zPQinpFwfCbUsr/ZeCKo0iPXa9gyR5C0u68GCX0LDeo4dwCSAuqGb1HcuNOc8EyIGcJlVk6QLr1sG
	3cTf/k7bOSKHZ5APi0Ip5t1q5jaPxnaaPwBGJY5teGYcBo0PPK9+hh1ipyYmWLNoBt/u2z+4wFvt0
	a/Pk3KzwPw7M9ERS7wWijK4ZoSmJCRqII4YP6dO0Z1jEHF5lhvvIIMmcRws26s7y6QzGOCEIPkv2J
	3hZs7m/RgwXavhyuPQO6FvjYJwAN6OjHM1gmDFTiNaUlXMGJb/cdlCfeemQxfBC4UgHBaVDU5QWeu
	9aIi9Flg==;
Date: Fri, 13 Jan 2023 13:59:56 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Joan Bruguera <joanbrugueram@gmail.com>
Cc: linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Kees Cook <keescook@chromium.org>, mark.rutland@arm.com,
	x86@kernel.org
Subject: Re: [RFC][PATCH 0/6] x86: Fix suspend vs retbleed=stuff
Message-ID: <Y8FVzPWQOHl0H4CY@hirez.programming.kicks-ass.net>
References: <20230112143141.645645775@infradead.org>
 <20230113073938.1066227-1-joanbrugueram@gmail.com>
 <Y8EhucZfQ2IyJtnU@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8EhucZfQ2IyJtnU@hirez.programming.kicks-ass.net>

On Fri, Jan 13, 2023 at 10:17:46AM +0100, Peter Zijlstra wrote:

> > (2) Tracing with QEMU I still see two `sarq $5, %gs:0x1337B33F` before
> >     `%gs` is restored. Those correspond to the calls from
> >     `secondary_startup_64` in `arch/x86/kernel/head_64.S` to
> >     `verify_cpu` and `sev_verify_cbit`.
> >     Those don't cause a crash but look suspicious, are they correct?
> > 
> >     (There are also some `sarq`s in the call to `early_setup_idt` from
> >     `secondary_startup_64`, but `%gs` is restored immediately before)
> 
> OK, I'll have a look, thanks!

Definitely fishy and I'm not sure why SMP bringup doesn't burn. Trying
to figure out what to do about this.

One thing I noticed is that trampoline_start already does verify_cpu,
and perhaps we can make startup_64 also do it, then secodary_startup_64
doesn't have to do it (and the realmode trampolines aren't patched).

Doing that would also require pushing the whole SEV thing into the
trampoline which them also gets rid of sev_verify_cbit I think.

But this definitely needs more thinking -- this is not an area I've
poked at much before.

