Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EFD52B37A
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 09:39:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331709.555273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrEGl-0002Tx-9L; Wed, 18 May 2022 07:38:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331709.555273; Wed, 18 May 2022 07:38:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrEGl-0002Qb-6d; Wed, 18 May 2022 07:38:55 +0000
Received: by outflank-mailman (input) for mailman id 331709;
 Wed, 18 May 2022 07:38:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NSeT=V2=suse.com=pmladek@srs-se1.protection.inumbo.net>)
 id 1nrEGj-0002EE-VN
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 07:38:54 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90ddcc17-d67d-11ec-837e-e5687231ffcc;
 Wed, 18 May 2022 09:38:53 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id F09A21F9A4;
 Wed, 18 May 2022 07:38:52 +0000 (UTC)
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 5D79B2C142;
 Wed, 18 May 2022 07:38:52 +0000 (UTC)
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
X-Inumbo-ID: 90ddcc17-d67d-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1652859533; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+lyyDjAjgyfEhWEBfN0EDdR6Jmx4pHSl+tBKIhX1g7c=;
	b=j0w4/FD8BT6n50PoBFWZ2B9hxn1McNizrLx3lcvWYTHgmFBxhdJUV3RAv4Ssdii4QSileV
	Dl88LCOs7NY6Zlry9hleanS5GY4TpOEfeqkhXf/HNSrx5fV+jFGy5YS3+L30Mt6n4dNsLm
	vyO1S4F65bAw7AbpuXo9HU2OHf85ddo=
Date: Wed, 18 May 2022 09:38:52 +0200
From: Petr Mladek <pmladek@suse.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Scott Branden <scott.branden@broadcom.com>,
	Sebastian Reichel <sre@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	David Gow <davidgow@google.com>, Evan Green <evgreen@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	bcm-kernel-feedback-list@broadcom.com, linux-pm@vger.kernel.org,
	akpm@linux-foundation.org, bhe@redhat.com,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
	linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
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
	will@kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
	Andrea Parri <parri.andrea@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Brian Norris <computersforpeace@gmail.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	"David S. Miller" <davem@davemloft.net>,
	Dexuan Cui <decui@microsoft.com>, Doug Berger <opendmb@gmail.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Justin Chen <justinpopo6@gmail.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Lee Jones <lee.jones@linaro.org>,
	Markus Mayer <mmayer@broadcom.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mihai Carabas <mihai.carabas@oracle.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
	Shile Zhang <shile.zhang@linux.alibaba.com>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Tianyu Lan <Tianyu.Lan@microsoft.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Wang ShaoBo <bobo.shaobowang@huawei.com>,
	Wei Liu <wei.liu@kernel.org>, zhenwei pi <pizhenwei@bytedance.com>
Subject: Re: [PATCH 19/30] panic: Add the panic hypervisor notifier list
Message-ID: <YoSijKwuwbY9uHxG@alley>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-20-gpiccoli@igalia.com>
 <YoJZVZl/MH0KiE/J@alley>
 <ad082ce7-db50-13bb-3dbb-9b595dfa78be@igalia.com>
 <YoOpyW1+q+Z5as78@alley>
 <d72b9aab-675c-ac89-b73a-b1de4a0b722d@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d72b9aab-675c-ac89-b73a-b1de4a0b722d@igalia.com>

On Tue 2022-05-17 13:42:06, Guilherme G. Piccoli wrote:
> On 17/05/2022 10:57, Petr Mladek wrote:
> >> Disagree here, I'm CCing Florian for information.
> >>
> >> This notifier preserves RAM so it's *very interesting* if we have
> >> kmsg_dump() for example, but maybe might be also relevant in case kdump
> >> kernel is configured to store something in a persistent RAM (then,
> >> without this notifier, after kdump reboots the system data would be lost).
> > 
> > I see. It is actually similar problem as with
> > drivers/firmware/google/gsmi.c.
> > 
> > I does similar things like kmsg_dump() so it should be called in
> > the same location (after info notifier list and before kdump).
> > 
> > A solution might be to put it at these notifiers at the very
> > end of the "info" list or make extra "dump" notifier list.
> 
> Here I still disagree. I've commented in the other response thread
> (about Google gsmi) about the semantics of the hypervisor list, but
> again: this list should contain callbacks that
> 
> (a) Should run early, _by default_ before a kdump;
> (b) Communicate with the firmware/hypervisor in a "low-risk" way;
> 
> Imagine a scenario where users configure kdump kernel to save something
> in a persistent form in DRAM - it'd be like a late pstore, in the next
> kernel. This callback enables that, it's meant to inform FW "hey, panic
> happened, please from now on don't clear the RAM in the next FW-reboot".
> I don't see a reason to postpone that - let's see if the maintainers
> have an opinion.

I have answered this in more detail in the other reply, see
https://lore.kernel.org/r/YoShZVYNAdvvjb7z@alley

I agree that both notifiers in

    drivers/soc/bcm/brcmstb/pm/pm-arm.c
    drivers/firmware/google/gsmi.c

better fit into the hypervisor list after all.

Best Regards,
Petr

