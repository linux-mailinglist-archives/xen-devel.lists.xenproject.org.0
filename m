Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD44C5324BE
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 10:01:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336382.560683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntPTi-0007Hj-C5; Tue, 24 May 2022 08:01:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336382.560683; Tue, 24 May 2022 08:01:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntPTi-0007F9-94; Tue, 24 May 2022 08:01:18 +0000
Received: by outflank-mailman (input) for mailman id 336382;
 Tue, 24 May 2022 08:01:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=09XB=WA=suse.com=pmladek@srs-se1.protection.inumbo.net>)
 id 1ntPTf-0007Ex-UP
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 08:01:15 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aef0a2cf-db37-11ec-bd2c-47488cf2e6aa;
 Tue, 24 May 2022 10:01:14 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 15D07219F1;
 Tue, 24 May 2022 08:01:14 +0000 (UTC)
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 8ADCF2C141;
 Tue, 24 May 2022 08:01:12 +0000 (UTC)
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
X-Inumbo-ID: aef0a2cf-db37-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1653379274; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YfQDkbqSOT+1qjQjuAj/jCMAhUotd54M/3ml94s/xOo=;
	b=PgXddxLSPksORjL/S6Twz65MXnqRLkhNWsZMkeMCJl5txCWJEZdmdegZfTAX/9coTEEbNM
	8MuciDtA/meSONuDDeUgJuaMT6sJm3SP6OoP4PPs2H8u+yjTfPOAegS/VmQ3g6ca5OFCQB
	kRtlLyoJ6CAvfuEa9KvE4DbHA1Jh8JI=
Date: Tue, 24 May 2022 10:01:12 +0200
From: Petr Mladek <pmladek@suse.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Baoquan He <bhe@redhat.com>,
	"michael Kelley (LINUX)" <mikelley@microsoft.com>,
	Dave Young <dyoung@redhat.com>, d.hatayama@jp.fujitsu.com,
	akpm@linux-foundation.org, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
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
	corbet@lwn.net, dave.hansen@linux.intel.com, feng.tang@intel.com,
	gregkh@linuxfoundation.org, hidehiro.kawai.ez@hitachi.com,
	jgross@suse.com, john.ogness@linutronix.de, keescook@chromium.org,
	luto@kernel.org, mhiramat@kernel.org, mingo@redhat.com,
	paulmck@kernel.org, peterz@infradead.org, rostedt@goodmis.org,
	senozhatsky@chromium.org, stern@rowland.harvard.edu,
	tglx@linutronix.de, vgoyal@redhat.com, vkuznets@redhat.com,
	will@kernel.org
Subject: Re: [PATCH 24/30] panic: Refactor the panic path
Message-ID: <YoyQyHHfhIIXSX0U@alley>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-25-gpiccoli@igalia.com>
 <Yn0TnsWVxCcdB2yO@alley>
 <d313eec2-96b6-04e3-35cd-981f103d010e@igalia.com>
 <20220519234502.GA194232@MiWiFi-R3L-srv>
 <ded31ec0-076b-2c5b-0fe6-0c274954821f@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ded31ec0-076b-2c5b-0fe6-0c274954821f@igalia.com>

On Fri 2022-05-20 08:23:33, Guilherme G. Piccoli wrote:
> On 19/05/2022 20:45, Baoquan He wrote:
> > [...]
> >> I really appreciate the summary skill you have, to convert complex
> >> problems in very clear and concise ideas. Thanks for that, very useful!
> >> I agree with what was summarized above.
> > 
> > I want to say the similar words to Petr's reviewing comment when I went
> > through the patches and traced each reviewing sub-thread to try to
> > catch up. Petr has reivewed this series so carefully and given many
> > comments I want to ack immediately.
> > 
> > I agree with most of the suggestions from Petr to this patch, except of
> > one tiny concern, please see below inline comment.
> 
> Hi Baoquan, thanks! I'm glad you're also reviewing that =)
> 
> 
> > [...]
> > 
> > I like the proposed skeleton of panic() and code style suggested by
> > Petr very much. About panic_prefer_crash_dump which might need be added,
> > I hope it has a default value true. This makes crash_dump execute at
> > first by default just as before, unless people specify
> > panic_prefer_crash_dump=0|n|off to disable it. Otherwise we need add
> > panic_prefer_crash_dump=1 in kernel and in our distros to enable kdump,
> > this is inconsistent with the old behaviour.
> 
> I'd like to understand better why the crash_kexec() must always be the
> first thing in your use case. If we keep that behavior, we'll see all
> sorts of workarounds - see the last patches of this series, Hyper-V and
> PowerPC folks hardcoded "crash_kexec_post_notifiers" in order to force
> execution of their relevant notifiers (like the vmbus disconnect,
> specially in arm64 that has no custom machine_crash_shutdown, or the
> fadump case in ppc). This led to more risk in kdump.
> 
> The thing is: with the notifiers' split, we tried to keep only the most
> relevant/necessary stuff in this first list, things that ultimately
> should improve kdump reliability or if not, at least not break it. My
> feeling is that, with this series, we should change the idea/concept
> that kdump must run first nevertheless, not matter what. We're here
> trying to accommodate the antagonistic goals of hypervisors that need
> some clean-up (even for kdump to work) VS. kdump users, that wish a
> "pristine" system reboot ASAP after the crash.

Good question. I wonder if Baoquan knows about problems caused by the
particular notifiers that will end up in the hypervisor list. Note
that there will be some shuffles and the list will be slightly
different in V2.

Anyway, I see four possible solutions:

  1. The most conservative approach is to keep the current behavior
     and call kdump first by default.

  2. A medium conservative approach to change the default default
     behavior and call hypervisor and eventually the info notifiers
     before kdump. There still would be the possibility to call kdump
     first by the command line parameter.

  3. Remove the possibility to call kdump first completely. It would
     assume that all the notifiers in the info list are super safe
     or that they make kdump actually more safe.

  4. Create one more notifier list for operations that always should
     be called before crash_dump.

Regarding the extra notifier list (4th solution). It is not clear to
me whether it would be always called even before hypervisor list or
when kdump is not enabled. We must not over-engineer it.

2nd proposal looks like a good compromise. But maybe we could do
this change few releases later. The notifiers split is a big
change on its own.

Best Regards,
Petr

