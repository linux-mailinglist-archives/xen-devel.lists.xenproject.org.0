Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B276522246
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 19:21:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325926.548735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noTXB-0007pS-T7; Tue, 10 May 2022 17:20:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325926.548735; Tue, 10 May 2022 17:20:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noTXB-0007ly-QO; Tue, 10 May 2022 17:20:29 +0000
Received: by outflank-mailman (input) for mailman id 325926;
 Tue, 10 May 2022 17:20:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uVqW=VS=goodmis.org=rostedt@kernel.org>)
 id 1noTXA-0007ls-5H
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 17:20:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a7f4d3b-d085-11ec-a406-831a346695d4;
 Tue, 10 May 2022 19:20:25 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 08353618CD;
 Tue, 10 May 2022 17:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BA9BC385A6;
 Tue, 10 May 2022 17:20:17 +0000 (UTC)
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
X-Inumbo-ID: 7a7f4d3b-d085-11ec-a406-831a346695d4
Date: Tue, 10 May 2022 13:20:15 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Petr Mladek <pmladek@suse.com>
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
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org,
 kernel-dev@igalia.com, kernel@gpiccoli.net, halves@canonical.com,
 fabiomirmar@gmail.com, alejandro.j.jimenez@oracle.com, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Jonathan Corbet <corbet@lwn.net>,
 d.hatayama@jp.fujitsu.com, dave.hansen@linux.intel.com, dyoung@redhat.com,
 feng.tang@intel.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 mikelley@microsoft.com, hidehiro.kawai.ez@hitachi.com, jgross@suse.com,
 john.ogness@linutronix.de, Kees Cook <keescook@chromium.org>,
 luto@kernel.org, mhiramat@kernel.org, mingo@redhat.com, paulmck@kernel.org,
 peterz@infradead.org, senozhatsky@chromium.org, Alan Stern
 <stern@rowland.harvard.edu>, Thomas Gleixner <tglx@linutronix.de>,
 vgoyal@redhat.com, vkuznets@redhat.com, Will Deacon <will@kernel.org>, Ard
 Biesheuvel <ardb@kernel.org>, David Gow <davidgow@google.com>, Julius
 Werner <jwerner@chromium.org>
Subject: Re: [PATCH 04/30] firmware: google: Convert regular spinlock into
 trylock on panic path
Message-ID: <20220510132015.38923cb2@gandalf.local.home>
In-Reply-To: <YnpOv4hAPV4b+6v4@alley>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
	<20220427224924.592546-5-gpiccoli@igalia.com>
	<CAE=gft5Pq25L4KFoPWbftkPF-JN1ex2yws77mMJ4GQnn9W0L2g@mail.gmail.com>
	<adcf6d0e-c37c-6ede-479e-29959d03d8c0@igalia.com>
	<YnpOv4hAPV4b+6v4@alley>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 May 2022 13:38:39 +0200
Petr Mladek <pmladek@suse.com> wrote:

> As already mentioned in the other reply, panic() sometimes stops
> the other CPUs using NMI, for example, see kdump_nmi_shootdown_cpus().
> 
> Another situation is when the CPU using the lock ends in some
> infinite loop because something went wrong. The system is in
> an unpredictable state during panic().
> 
> I am not sure if this is possible with the code under gsmi_dev.lock
> but such things really happen during panic() in other subsystems.
> Using trylock in the panic() code path is a good practice.

I believe that Peter Zijlstra had a special spin lock for NMIs or early
printk, where it would not block if the lock was held on the same CPU. That
is, if an NMI happened and paniced while this lock was held on the same
CPU, it would not deadlock. But it would block if the lock was held on
another CPU.

-- Steve

