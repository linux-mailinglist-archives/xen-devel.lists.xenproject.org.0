Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64299522BAF
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 07:29:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325992.549047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noeu2-0005AF-A2; Wed, 11 May 2022 05:28:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325992.549047; Wed, 11 May 2022 05:28:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noeu2-00057l-7I; Wed, 11 May 2022 05:28:50 +0000
Received: by outflank-mailman (input) for mailman id 325992;
 Tue, 10 May 2022 19:40:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RpBI=VS=linutronix.de=john.ogness@srs-se1.protection.inumbo.net>)
 id 1noVis-0002aR-OT
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 19:40:43 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13168f69-d099-11ec-8fc4-03012f2f19d4;
 Tue, 10 May 2022 21:40:41 +0200 (CEST)
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
X-Inumbo-ID: 13168f69-d099-11ec-8fc4-03012f2f19d4
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1652211640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OEDxfxfGB0zzvmyrmmb19QrPenmgyOx+wB7aMTpPY14=;
	b=s9qpTYE/3WJU4N3KJVSOdyb7xWHt1vkR4fCuQ5J8Zkt0v0hhGnmBmJdDRvMzx7U23g78AD
	5x0GWGYOK6up5rJgLjlqAJ0oKWgxSuZArLqIZD7/93+m719asCNv2npDv0K4E3pzaf0TU1
	QT3fxi7rAkTN0NzY7sIU3W6vHFJAKmFF1D5WFGFp25IVzQ1U2GLRWaAA15JzW4DMVMPiln
	C4PlGutDHid0b5MW+yz4Oad3VH/9G9wKQ7qYFzrw5pmS2R8UQ108RRuRC1xOe7QqhudZaN
	toooF05flVTdgRJ8Mw90Ti/8UtTs7R3lmx6LjRAd0TtWQNVsyqtk/eFe4jDJKA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1652211640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OEDxfxfGB0zzvmyrmmb19QrPenmgyOx+wB7aMTpPY14=;
	b=vLCouTuSreEprlIyaHBdxRuhj0utQMxldxJLsrUVX2CbalgS135YGbpGNA0WSY+j9euZdD
	GTFEAV97omDLmGAg==
To: Steven Rostedt <rostedt@goodmis.org>, Petr Mladek <pmladek@suse.com>
Cc: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Evan Green
 <evgreen@chromium.org>, Andrew Morton <akpm@linux-foundation.org>,
 bhe@redhat.com, kexec@lists.infradead.org, LKML
 <linux-kernel@vger.kernel.org>, bcm-kernel-feedback-list@broadcom.com,
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
 alejandro.j.jimenez@oracle.com, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Jonathan Corbet <corbet@lwn.net>,
 d.hatayama@jp.fujitsu.com, dave.hansen@linux.intel.com, dyoung@redhat.com,
 feng.tang@intel.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 mikelley@microsoft.com, hidehiro.kawai.ez@hitachi.com, jgross@suse.com,
 Kees Cook <keescook@chromium.org>, luto@kernel.org, mhiramat@kernel.org,
 mingo@redhat.com, paulmck@kernel.org, peterz@infradead.org,
 senozhatsky@chromium.org, Alan Stern <stern@rowland.harvard.edu>, Thomas
 Gleixner <tglx@linutronix.de>, vgoyal@redhat.com, vkuznets@redhat.com,
 Will Deacon <will@kernel.org>, Ard
 Biesheuvel <ardb@kernel.org>, David Gow <davidgow@google.com>, Julius
 Werner <jwerner@chromium.org>
Subject: Re: [PATCH 04/30] firmware: google: Convert regular spinlock into
 trylock on panic path
In-Reply-To: <20220510132015.38923cb2@gandalf.local.home>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-5-gpiccoli@igalia.com>
 <CAE=gft5Pq25L4KFoPWbftkPF-JN1ex2yws77mMJ4GQnn9W0L2g@mail.gmail.com>
 <adcf6d0e-c37c-6ede-479e-29959d03d8c0@igalia.com> <YnpOv4hAPV4b+6v4@alley>
 <20220510132015.38923cb2@gandalf.local.home>
Date: Tue, 10 May 2022 21:46:38 +0206
Message-ID: <87h75xkwg9.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain

On 2022-05-10, Steven Rostedt <rostedt@goodmis.org> wrote:
>> As already mentioned in the other reply, panic() sometimes stops the
>> other CPUs using NMI, for example, see kdump_nmi_shootdown_cpus().
>> 
>> Another situation is when the CPU using the lock ends in some
>> infinite loop because something went wrong. The system is in
>> an unpredictable state during panic().
>> 
>> I am not sure if this is possible with the code under gsmi_dev.lock
>> but such things really happen during panic() in other subsystems.
>> Using trylock in the panic() code path is a good practice.
>
> I believe that Peter Zijlstra had a special spin lock for NMIs or
> early printk, where it would not block if the lock was held on the
> same CPU. That is, if an NMI happened and paniced while this lock was
> held on the same CPU, it would not deadlock. But it would block if the
> lock was held on another CPU.

Yes. And starting with 5.19 it will be carrying the name that _you_ came
up with (cpu_sync):

printk_cpu_sync_get_irqsave()
printk_cpu_sync_put_irqrestore()

John

