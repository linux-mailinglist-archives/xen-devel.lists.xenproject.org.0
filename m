Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0102521BB8
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 16:16:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325708.548396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noQes-00027D-6f; Tue, 10 May 2022 14:16:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325708.548396; Tue, 10 May 2022 14:16:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noQes-00024N-3O; Tue, 10 May 2022 14:16:14 +0000
Received: by outflank-mailman (input) for mailman id 325708;
 Tue, 10 May 2022 14:16:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0hsl=VS=suse.com=pmladek@srs-se1.protection.inumbo.net>)
 id 1noQer-00024H-Gp
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 14:16:13 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bea19b27-d06b-11ec-a406-831a346695d4;
 Tue, 10 May 2022 16:16:12 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 932901F896;
 Tue, 10 May 2022 14:16:11 +0000 (UTC)
Received: from suse.cz (unknown [10.100.208.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 01C5F2C141;
 Tue, 10 May 2022 14:16:09 +0000 (UTC)
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
X-Inumbo-ID: bea19b27-d06b-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1652192171; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A8/NZJeBAhTKLHLb3PoAvlXD/AvbEgaBaR5HXaRNdkM=;
	b=BeTzacf3mS4VoGHK6i1jVn2p93FIleajbiX/lqLZYQzEPT5BuEThdtby46ST2AJUboj/I/
	VqEG9r83Q4xijGW9lCE2hweKm6E7raa+vKstZ+w2OtTvG5P31Un3HT5rf7nvpJdK7CHBFy
	VZPQPYk1mnBdJ3vUcDiFbXkwBcjlkRU=
Date: Tue, 10 May 2022 16:16:06 +0200
From: Petr Mladek <pmladek@suse.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, rth@gcc.gnu.org,
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org,
	bhe@redhat.com, kexec@lists.infradead.org,
	linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-leds@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-um@lists.infradead.org,
	linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org,
	sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
	x86@kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net,
	halves@canonical.com, fabiomirmar@gmail.com,
	alejandro.j.jimenez@oracle.com, andriy.shevchenko@linux.intel.com,
	arnd@arndb.de, bp@alien8.de, corbet@lwn.net,
	d.hatayama@jp.fujitsu.com, dave.hansen@linux.intel.com,
	dyoung@redhat.com, feng.tang@intel.com, gregkh@linuxfoundation.org,
	mikelley@microsoft.com, hidehiro.kawai.ez@hitachi.com,
	jgross@suse.com, john.ogness@linutronix.de, keescook@chromium.org,
	luto@kernel.org, mhiramat@kernel.org, mingo@redhat.com,
	paulmck@kernel.org, peterz@infradead.org, rostedt@goodmis.org,
	senozhatsky@chromium.org, stern@rowland.harvard.edu,
	tglx@linutronix.de, vgoyal@redhat.com, vkuznets@redhat.com,
	will@kernel.org
Subject: Re: [PATCH 10/30] alpha: Clean-up the panic notifier code
Message-ID: <YnpzpkfuwzJYbPYj@alley>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-11-gpiccoli@igalia.com>
 <f6def662-5742-b3a8-544f-bf15c636d83d@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6def662-5742-b3a8-544f-bf15c636d83d@igalia.com>

On Mon 2022-05-09 11:13:17, Guilherme G. Piccoli wrote:
> On 27/04/2022 19:49, Guilherme G. Piccoli wrote:
> > The alpha panic notifier has some code issues, not following
> > the conventions of other notifiers. Also, it might halt the
> > machine but still it is set to run as early as possible, which
> > doesn't seem to be a good idea.

Yeah, it is pretty strange behavior.

I looked into the history. This notifier was added into the alpha code
in 2.4.0-test2pre2. In this historic code, the default panic() code
either rebooted after a timeout or ended in a infinite loop. There
was not crasdump at that times.

The notifier allowed to change the behavior. There were 3 notifiers:

   + mips and mips64 ended with blinking in panic()
   + alpha did __halt() in this srm case

They both still do this. I guess that it is some historic behavior
that people using these architectures are used to.

Anyway, it makes sense to do this as the last notifier after
dumping other information.

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

