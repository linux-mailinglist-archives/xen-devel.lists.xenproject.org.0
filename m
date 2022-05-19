Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FA352CC6C
	for <lists+xen-devel@lfdr.de>; Thu, 19 May 2022 09:04:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332743.556506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nraCY-0007C5-I0; Thu, 19 May 2022 07:04:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332743.556506; Thu, 19 May 2022 07:04:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nraCY-00079i-CR; Thu, 19 May 2022 07:04:02 +0000
Received: by outflank-mailman (input) for mailman id 332743;
 Thu, 19 May 2022 07:04:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uZL4=V3=suse.com=pmladek@srs-se1.protection.inumbo.net>)
 id 1nraCW-00079c-AB
 for xen-devel@lists.xenproject.org; Thu, 19 May 2022 07:04:00 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db19530b-d741-11ec-bd2c-47488cf2e6aa;
 Thu, 19 May 2022 09:03:59 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id CF6261F9DC;
 Thu, 19 May 2022 07:03:58 +0000 (UTC)
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 813A52C141;
 Thu, 19 May 2022 07:03:55 +0000 (UTC)
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
X-Inumbo-ID: db19530b-d741-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1652943838; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=395st/CngVntAAOn5uSBsdHcf6UJsehUQOcbe6ab9wI=;
	b=qJ/FgyV3p4LuXUdkZjoAbs2+ewn4o7aNZN0S67D2rC96Mde70WoKxt5D1iYy3vIxFGNywX
	NYQFStO7xXozlUSKqQPZCblT/M2McgEFa5ttVGDSrZzFsBjH4DUBLxqHsrlOhubnXz8Ip9
	VRfQAfc3f6HDJx77hS/XQSQpNXuMeJQ=
Date: Thu, 19 May 2022 09:03:52 +0200
From: Petr Mladek <pmladek@suse.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: David Gow <davidgow@google.com>, Evan Green <evgreen@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Scott Branden <scott.branden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>, akpm@linux-foundation.org,
	bhe@redhat.com, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-leds@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
	netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
	rcu@vger.kernel.org, sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org, x86@kernel.org,
	kernel-dev@igalia.com, kernel@gpiccoli.net, halves@canonical.com,
	fabiomirmar@gmail.com, alejandro.j.jimenez@oracle.com,
	andriy.shevchenko@linux.intel.com, arnd@arndb.de, bp@alien8.de,
	corbet@lwn.net, d.hatayama@jp.fujitsu.com,
	dave.hansen@linux.intel.com, dyoung@redhat.com, feng.tang@intel.com,
	gregkh@linuxfoundation.org, mikelley@microsoft.com,
	hidehiro.kawai.ez@hitachi.com, jgross@suse.com,
	john.ogness@linutronix.de, keescook@chromium.org, luto@kernel.org,
	mhiramat@kernel.org, mingo@redhat.com, paulmck@kernel.org,
	peterz@infradead.org, rostedt@goodmis.org, senozhatsky@chromium.org,
	stern@rowland.harvard.edu, tglx@linutronix.de, vgoyal@redhat.com,
	vkuznets@redhat.com, will@kernel.org,
	Alexander Gordeev <agordeev@linux.ibm.com>,
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
Message-ID: <YoXr2AD+Jc/ukUhJ@alley>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-20-gpiccoli@igalia.com>
 <YoJZVZl/MH0KiE/J@alley>
 <ad082ce7-db50-13bb-3dbb-9b595dfa78be@igalia.com>
 <YoOpyW1+q+Z5as78@alley>
 <YoSnGmBJ3kYs5WMf@alley>
 <fbbd0a8d-2ef4-4a39-4b75-354918e85778@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbbd0a8d-2ef4-4a39-4b75-354918e85778@igalia.com>

On Wed 2022-05-18 10:16:20, Guilherme G. Piccoli wrote:
> On 18/05/2022 04:58, Petr Mladek wrote:
> > [...]
> >> I does similar things like kmsg_dump() so it should be called in
> >> the same location (after info notifier list and before kdump).
> >>
> >> A solution might be to put it at these notifiers at the very
> >> end of the "info" list or make extra "dump" notifier list.
> > 
> > I just want to point out that the above idea has problems.
> > Notifiers storing kernel log need to be treated as kmsg_dump().
> > In particular, we would  need to know if there are any.
> > We do not need to call "info" notifier list before kdump
> > when there is no kernel log dumper registered.
> > 
> 
> Notifiers respect the priority concept, which is just a number that
> orders the list addition (and the list is called in order).
> 
> I've used the last position to panic_print() [in patch 25] - one idea
> here is to "reserve" the last position (represented by INT_MIN) for
> notifiers that act like kmsg_dump(). I couldn't find any IIRC, but that
> doesn't prevent us to save this position and comment about that.

I would ignore it for now. If anyone would want to safe the log
then they would need to read it. They will most likely use
the existing kmsg_dump() infastructure. In fact, they should
use it to avoid a code duplication.

Best Regards,
Petr

