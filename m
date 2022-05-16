Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD74A528699
	for <lists+xen-devel@lfdr.de>; Mon, 16 May 2022 16:11:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.329898.553178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqbRJ-0002r9-2T; Mon, 16 May 2022 14:11:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 329898.553178; Mon, 16 May 2022 14:11:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqbRI-0002np-VD; Mon, 16 May 2022 14:11:12 +0000
Received: by outflank-mailman (input) for mailman id 329898;
 Mon, 16 May 2022 14:11:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fbMg=VY=suse.com=pmladek@srs-se1.protection.inumbo.net>)
 id 1nqbRH-0002nj-Ku
 for xen-devel@lists.xenproject.org; Mon, 16 May 2022 14:11:11 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0873b420-d522-11ec-837e-e5687231ffcc;
 Mon, 16 May 2022 16:11:09 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 8469521F6D;
 Mon, 16 May 2022 14:11:08 +0000 (UTC)
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id C9CB72C141;
 Mon, 16 May 2022 14:11:06 +0000 (UTC)
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
X-Inumbo-ID: 0873b420-d522-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1652710268; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dmHPB9vjv1LBmNrF4zaonBMXasUoClA4XRHwK4fdG3Q=;
	b=uHHoYScC3vOzAq1rF/GezErIJTTCAnG26YueVBaMYGI4KIiBuE4CJEi5I5FkSHuHNJvOhi
	jBbeahpPdNTqQb9qWzy8wQwtiwj/B2njZ1Svs0P1iMsaZXkpVlpc6Bgj/6IAHlnD6RNRY+
	7obFqakfVm+qw0H2R1BXYJwwfwabCHA=
Date: Mon, 16 May 2022 16:11:06 +0200
From: Petr Mladek <pmladek@suse.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: akpm@linux-foundation.org, bhe@redhat.com, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
	coresight@lists.linaro.org, linuxppc-dev@lists.ozlabs.org,
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
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
	will@kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Leo Yan <leo.yan@linaro.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Leach <mike.leach@linaro.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Neeraj Upadhyay <quic_neeraju@quicinc.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Paul Mackerras <paulus@samba.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH 20/30] panic: Add the panic informational notifier list
Message-ID: <YoJbeuTNBXOIypSH@alley>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-21-gpiccoli@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427224924.592546-21-gpiccoli@igalia.com>

On Wed 2022-04-27 19:49:14, Guilherme G. Piccoli wrote:
> The goal of this new panic notifier is to allow its users to
> register callbacks to run earlier in the panic path than they
> currently do. This aims at informational mechanisms, like dumping
> kernel offsets and showing device error data (in case it's simple
> registers reading, for example) as well as mechanisms to disable
> log flooding (like hung_task detector / RCU warnings) and the
> tracing dump_on_oops (when enabled).
> 
> Any (non-invasive) information that should be provided before
> kmsg_dump() as well as log flooding preventing code should fit
> here, as long it offers relatively low risk for kdump.
> 
> For now, the patch is almost a no-op, although it changes a bit
> the ordering in which some panic notifiers are executed - specially
> affected by this are the notifiers responsible for disabling the
> hung_task detector / RCU warnings, which now run first. In a
> subsequent patch, the panic path will be refactored, then the
> panic informational notifiers will effectively run earlier,
> before ksmg_dump() (and usually before kdump as well).
> 
> We also defer documenting it all properly in the subsequent
> refactor patch. Finally, while at it, we removed some useless
> header inclusions too.
> 
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>

All notifiers moved in this patch seems to fit well the "info"
notifier list. The patch looks good from this POV.

I still have to review the rest of the patches to see if it
is complete.

Best Regards,
Petr

