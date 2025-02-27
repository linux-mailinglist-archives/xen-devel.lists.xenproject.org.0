Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10430A487E6
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 19:36:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898358.1306926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnijV-00008Q-8w; Thu, 27 Feb 2025 18:35:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898358.1306926; Thu, 27 Feb 2025 18:35:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnijV-00005R-5X; Thu, 27 Feb 2025 18:35:41 +0000
Received: by outflank-mailman (input) for mailman id 898358;
 Thu, 27 Feb 2025 18:35:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lrAT=VS=arm.com=mark.rutland@srs-se1.protection.inumbo.net>)
 id 1tnijU-0008TL-MQ
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 18:35:40 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id a3f93096-f539-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 19:35:38 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77A751516;
 Thu, 27 Feb 2025 10:35:53 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0EDB93F5A1;
 Thu, 27 Feb 2025 10:35:31 -0800 (PST)
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
X-Inumbo-ID: a3f93096-f539-11ef-9aaf-95dc52dad729
Date: Thu, 27 Feb 2025 18:35:26 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
	will@kernel.org, oleg@redhat.com, sstabellini@kernel.org,
	tglx@linutronix.de, peterz@infradead.org, luto@kernel.org,
	mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, kees@kernel.org, aliceryhl@google.com,
	ojeda@kernel.org, samitolvanen@google.com, masahiroy@kernel.org,
	rppt@kernel.org, xur@google.com, paulmck@kernel.org, arnd@arndb.de,
	puranjay@kernel.org, broonie@kernel.org, mbenes@suse.cz,
	sudeep.holla@arm.com, guohanjun@huawei.com, prarit@redhat.com,
	liuwei09@cestc.cn, Jonathan.Cameron@huawei.com, dwmw@amazon.co.uk,
	kristina.martsenko@arm.com, liaochang1@huawei.com, ptosi@google.com,
	thiago.bauermann@linaro.org, kevin.brodsky@arm.com,
	Dave.Martin@arm.com, joey.gouly@arm.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH -next v6 8/8] arm64: entry: Switch to generic IRQ entry
Message-ID: <Z8CwbmCXguCEfJvx@J2N7QTR9R3>
References: <20250213130007.1418890-1-ruanjinjie@huawei.com>
 <20250213130007.1418890-9-ruanjinjie@huawei.com>
 <xhsmh4j0fl0p3.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xhsmh4j0fl0p3.mognet@vschneid-thinkpadt14sgen2i.remote.csb>

On Thu, Feb 27, 2025 at 07:08:56PM +0100, Valentin Schneider wrote:
> On 13/02/25 21:00, Jinjie Ruan wrote:
> > Currently, x86, Riscv, Loongarch use the generic entry. Convert arm64
> > to use the generic entry infrastructure from kernel/entry/*.
> > The generic entry makes maintainers' work easier and codes
> > more elegant.
> >
> > Switch arm64 to generic IRQ entry first, which removed duplicate 100+
> > LOC and make Lazy preemption on arm64 available by adding a
> > _TIF_NEED_RESCHED_LAZY bit and enabling ARCH_HAS_PREEMPT_LAZY.
> 
> Just a drive-by comment as I'm interested in lazy preemption for arm64;
> this series doesn't actually enable lazy preemption, is that for a
> follow-up with the rest of the generic entry stuff?
> 
> From a quick glance, it looks like everything is in place for enabling it.

Sorry, there's been some fractured discussion on this on the
linux-rt-users list:

  https://lore.kernel.org/linux-rt-users/20241216190451.1c61977c@mordecai.tesarici.cz/

The TL;DR is that lazy preemption doesn't actually depend on generic
entry, and we should be able to enable it on arm64 independently of this
series. I'd posted a quick hack which Mike Galbraith cleaned up:

  https://lore.kernel.org/linux-rt-users/a198a7dd9076f97b89d8882bb249b3bf303564ef.camel@gmx.de/

... but that was never posted as a new thread to LAKML.

Would you be happy to take charge and take that patch, test it, and post
it here (or spin your own working version)? I was happy with the way it
looks but hadn't had the time for testing and so on.

I expect that we'll merge the generic entry code too, but having them
separate is a bit easier for bisection and backporting where people want
lazy preemption in downstream trees.

Mark.

