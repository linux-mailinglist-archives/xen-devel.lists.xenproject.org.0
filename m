Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB31521405
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 13:38:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325501.548088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noOCT-000179-Ll; Tue, 10 May 2022 11:38:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325501.548088; Tue, 10 May 2022 11:38:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noOCT-00013y-Hk; Tue, 10 May 2022 11:38:45 +0000
Received: by outflank-mailman (input) for mailman id 325501;
 Tue, 10 May 2022 11:38:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0hsl=VS=suse.com=pmladek@srs-se1.protection.inumbo.net>)
 id 1noOCR-00013s-Ot
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 11:38:43 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be4b475b-d055-11ec-8fc4-03012f2f19d4;
 Tue, 10 May 2022 13:38:42 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id E799F21C06;
 Tue, 10 May 2022 11:38:41 +0000 (UTC)
Received: from suse.cz (unknown [10.100.208.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id F0AB42C141;
 Tue, 10 May 2022 11:38:39 +0000 (UTC)
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
X-Inumbo-ID: be4b475b-d055-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1652182721; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QjxQbnD6WUcAB5XSGPbhgiXq5Z1nB8h07eo4ZkZ4QC8=;
	b=ux1OKlKPpQAZrqb3VSx/+cdnKv+z0GMrb7Vrl4wT7av9mwtdsYHmGTFl15YLILBNoNipDu
	zhzvyNUQ0tVf4I8bosAIddNvm3hk9CLYxTFt2W7RQIuTrmM1G9742/mw3JpxDF9W//N0xh
	4YsR4kO61TX2TGUrgE/V7TAnZzSnJsg=
Date: Tue, 10 May 2022 13:38:39 +0200
From: Petr Mladek <pmladek@suse.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Evan Green <evgreen@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>, bhe@redhat.com,
	kexec@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
	bcm-kernel-feedback-list@broadcom.com,
	linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org,
	linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-leds@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, Linux PM <linux-pm@vger.kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-um@lists.infradead.org,
	linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org,
	sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
	x86@kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net,
	halves@canonical.com, fabiomirmar@gmail.com,
	alejandro.j.jimenez@oracle.com,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Jonathan Corbet <corbet@lwn.net>, d.hatayama@jp.fujitsu.com,
	dave.hansen@linux.intel.com, dyoung@redhat.com, feng.tang@intel.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	mikelley@microsoft.com, hidehiro.kawai.ez@hitachi.com,
	jgross@suse.com, john.ogness@linutronix.de,
	Kees Cook <keescook@chromium.org>, luto@kernel.org,
	mhiramat@kernel.org, mingo@redhat.com, paulmck@kernel.org,
	peterz@infradead.org, rostedt@goodmis.org, senozhatsky@chromium.org,
	Alan Stern <stern@rowland.harvard.edu>,
	Thomas Gleixner <tglx@linutronix.de>, vgoyal@redhat.com,
	vkuznets@redhat.com, Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>, David Gow <davidgow@google.com>,
	Julius Werner <jwerner@chromium.org>
Subject: Re: [PATCH 04/30] firmware: google: Convert regular spinlock into
 trylock on panic path
Message-ID: <YnpOv4hAPV4b+6v4@alley>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-5-gpiccoli@igalia.com>
 <CAE=gft5Pq25L4KFoPWbftkPF-JN1ex2yws77mMJ4GQnn9W0L2g@mail.gmail.com>
 <adcf6d0e-c37c-6ede-479e-29959d03d8c0@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adcf6d0e-c37c-6ede-479e-29959d03d8c0@igalia.com>

On Tue 2022-05-03 16:12:09, Guilherme G. Piccoli wrote:
> On 03/05/2022 15:03, Evan Green wrote:
> > [...]
> > gsmi_shutdown_reason() is a common function called in other scenarios
> > as well, like reboot and thermal trip, where it may still make sense
> > to wait to acquire a spinlock. Maybe we should add a parameter to
> > gsmi_shutdown_reason() so that you can get your change on panic, but
> > we don't convert other callbacks into try-fail scenarios causing us to
> > miss logs.
> > 
> 
> Hi Evan, thanks for your feedback, much appreciated!
> What I've done in other cases like this was to have a helper checking
> the spinlock in the panic notifier - if we can acquire that, go ahead
> but if not, bail out. For a proper example of an implementation, check
> patch 13 of the series:
> https://lore.kernel.org/lkml/20220427224924.592546-14-gpiccoli@igalia.com/ .
> 
> Do you agree with that, or prefer really a parameter in
> gsmi_shutdown_reason() ? I'll follow your choice =)

I see two more alternative solutions:

1st variant is a trick already used in console write() callbacks.
They do trylock() when oops_in_progress is set. They remember
the result to prevent double unlock when printing Oops messages and
the system will try to continue working. For example:

pl011_console_write(struct console *co, const char *s, unsigned int count)
{
[...]
	int locked = 1;
[...]
	if (uap->port.sysrq)
		locked = 0;
	else if (oops_in_progress)
		locked = spin_trylock(&uap->port.lock);
	else
		spin_lock(&uap->port.lock);

[...]

	if (locked)
		spin_unlock(&uap->port.lock);
}


2nd variant is to check panic_cpu variable. It is used in printk.c.
We might move the function to panic.h:

static bool panic_in_progress(void)
{
	return unlikely(atomic_read(&panic_cpu) != PANIC_CPU_INVALID);
}

and then do:

	if (panic_in_progress()) {
		...


> > Though thinking more about it, is this really a Good Change (TM)? The
> > spinlock itself already disables interrupts, meaning the only case
> > where this change makes a difference is if the panic happens from
> > within the function that grabbed the spinlock (in which case the
> > callback is also likely to panic), or in an NMI that panics within
> > that window.

As already mentioned in the other reply, panic() sometimes stops
the other CPUs using NMI, for example, see kdump_nmi_shootdown_cpus().

Another situation is when the CPU using the lock ends in some
infinite loop because something went wrong. The system is in
an unpredictable state during panic().

I am not sure if this is possible with the code under gsmi_dev.lock
but such things really happen during panic() in other subsystems.
Using trylock in the panic() code path is a good practice.

Best Regards,
Petr

