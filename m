Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2ADF54B347
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jun 2022 16:37:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349039.575250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o17eM-0008A4-Bz; Tue, 14 Jun 2022 14:36:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349039.575250; Tue, 14 Jun 2022 14:36:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o17eM-00087L-8p; Tue, 14 Jun 2022 14:36:10 +0000
Received: by outflank-mailman (input) for mailman id 349039;
 Tue, 14 Jun 2022 14:36:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PEcw=WV=suse.com=pmladek@srs-se1.protection.inumbo.net>)
 id 1o17eK-00087F-N0
 for xen-devel@lists.xenproject.org; Tue, 14 Jun 2022 14:36:08 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 519220ca-ebef-11ec-a26a-b96bd03d9e80;
 Tue, 14 Jun 2022 16:36:06 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 8286121B97;
 Tue, 14 Jun 2022 14:36:03 +0000 (UTC)
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 0C0ED2C142;
 Tue, 14 Jun 2022 14:36:01 +0000 (UTC)
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
X-Inumbo-ID: 519220ca-ebef-11ec-a26a-b96bd03d9e80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655217363; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7h6hH0gYTond1cgiS/uMW2G4mVmL8aIozW74ouv+gK4=;
	b=B9wTA4hA6Qxez4dhaQq2jaLjcRQqv8/C1d0oKbtJxHWYl3duIpfM3QjZ2J2ZIG1jByzjIk
	ObTWFZbyZcppMylTomPCNwhynw9TlYQGEMrmiuv4k8IcEezBoIE3JYy9Oiijt3mtdocbSR
	YntR36rSYs/Otfz0SDXm/BOtVHJZFAE=
Date: Tue, 14 Jun 2022 16:36:01 +0200
From: Petr Mladek <pmladek@suse.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: bhe@redhat.com, d.hatayama@jp.fujitsu.com,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Mark Rutland <mark.rutland@arm.com>, mikelley@microsoft.com,
	vkuznets@redhat.com, akpm@linux-foundation.org,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
	linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
	netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
	rcu@vger.kernel.org, sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org, x86@kernel.org,
	kernel-dev@igalia.com, kernel@gpiccoli.net, halves@canonical.com,
	fabiomirmar@gmail.com, alejandro.j.jimenez@oracle.com,
	andriy.shevchenko@linux.intel.com, arnd@arndb.de, bp@alien8.de,
	corbet@lwn.net, dave.hansen@linux.intel.com, dyoung@redhat.com,
	feng.tang@intel.com, gregkh@linuxfoundation.org,
	hidehiro.kawai.ez@hitachi.com, jgross@suse.com,
	john.ogness@linutronix.de, keescook@chromium.org, luto@kernel.org,
	mhiramat@kernel.org, mingo@redhat.com, paulmck@kernel.org,
	peterz@infradead.org, rostedt@goodmis.org, senozhatsky@chromium.org,
	stern@rowland.harvard.edu, tglx@linutronix.de, vgoyal@redhat.com,
	will@kernel.org
Subject: Re: [PATCH 24/30] panic: Refactor the panic path
Message-ID: <Yqic0R8/UFqTbbMD@alley>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-25-gpiccoli@igalia.com>
 <87fskzuh11.fsf@email.froward.int.ebiederm.org>
 <0d084eed-4781-c815-29c7-ac62c498e216@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d084eed-4781-c815-29c7-ac62c498e216@igalia.com>

On Thu 2022-05-26 13:25:57, Guilherme G. Piccoli wrote:
> OK, so it seems we have some points in which agreement exists, and some
> points that there is no agreement and instead, we have antagonistic /
> opposite views and needs. Let's start with the easier part heh
>
> It seems everybody agrees that *we shouldn't over-engineer things*, and
> as per Eric good words: making the panic path more feature-full or
> increasing flexibility isn't a good idea. So, as a "corollary": the
> panic level approach I'm proposing is not a good fit, I'll drop it and
> let's go with something simpler.

Makes sense.

> Another point of agreement seems to be that _notifier lists in the panic
> path are dangerous_, for *2 different reasons*:
> 
> (a) We cannot guarantee that people won't add crazy callbacks there, we
> can plan and document things the best as possible - it'll never be
> enough, somebody eventually would slip a nonsense callback that would
> break things and defeat the planned purpose of such a list;

It is true that notifier lists might allow to add crazy stuff
without proper review more easily. Things added into the core
code would most likely get better review.

But nothing is error-proof. And bugs will happen with any approach.


> (b) As per Eric point, in a panic/crash situation we might have memory
> corruption exactly in the list code / pointers, etc, so the notifier
> lists are, by nature, a bit fragile. But I think we shouldn't consider
> it completely "bollocks", since this approach has been used for a while
> with a good success rate. So, lists aren't perfect at all, but at the
> same time, they aren't completely useless.

I am not able to judge this. Of course, any extra step increases
the risk. I am just not sure how much more complicated it would
be to hardcode the calls. Most of them are architecture
and/or feature specific. And such code is often hard to
review and maintain.

> To avoid using a 4th list,

4th or 5th? We already have "hypervisor", "info", "pre-reboot", and "pre-loop".
The 5th might be pre-crash-exec.

> especially given the list nature is a bit
> fragile, I'd suggest one of the 3 following approaches - I *really
> appreciate feedbacks* on that so I can implement the best solution and
> avoid wasting time in some poor/disliked solution:

Honestly, I am not able to decide what might be better without seeing
the code.

Most things fits pretty well into the 4 proposed lists:
"hypervisor", "info", "pre-reboot", and "pre-loop". IMHO, the
only question is the code that needs to be always called
even before crash_dump.

I suggest that you solve the crash_dump callbacks the way that
looks best to you. Ideally do it in a separate patch so it can be
reviewed and reworked more easily.

I believe that a fresh code with an updated split and simplified
logic would help us to move forward.

Best Regards,
Petr

