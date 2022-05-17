Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5688A52A461
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 16:12:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330925.554342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqxun-0003cA-FH; Tue, 17 May 2022 14:11:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330925.554342; Tue, 17 May 2022 14:11:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqxun-0003Z5-CC; Tue, 17 May 2022 14:11:09 +0000
Received: by outflank-mailman (input) for mailman id 330925;
 Tue, 17 May 2022 14:11:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PwZ0=VZ=suse.com=pmladek@srs-se1.protection.inumbo.net>)
 id 1nqxum-0003Yy-89
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 14:11:08 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30f69073-d5eb-11ec-837e-e5687231ffcc;
 Tue, 17 May 2022 16:11:05 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 67D211F8CA;
 Tue, 17 May 2022 14:11:05 +0000 (UTC)
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 10D772C141;
 Tue, 17 May 2022 14:11:04 +0000 (UTC)
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
X-Inumbo-ID: 30f69073-d5eb-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1652796665; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UazRNADyyJz2HI+RS6R0a4/dm7+XkEeyBn9yGoLISk0=;
	b=BKp7+FEVfq6NcVwdI04E/j1IXhL8fav2W9wQb6/2V+MLS4zVCpGBL04+5kiZPUHpPEWWSJ
	UCuw6cy5UFA5oDKAHRw0jxrGspZnMX7jbttS2tX8QWMEWQryA8mHzjbrpe5MfzzbeKkAE+
	HL6pRS/de3kEkB9TyLHSW9ZDBKYUAwA=
Date: Tue, 17 May 2022 16:11:00 +0200
From: Petr Mladek <pmladek@suse.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: "Luck, Tony" <tony.luck@intel.com>, Dinh Nguyen <dinguyen@kernel.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"bhe@redhat.com" <bhe@redhat.com>,
	"kexec@lists.infradead.org" <kexec@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
	"linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"openipmi-developer@lists.sourceforge.net" <openipmi-developer@lists.sourceforge.net>,
	"rcu@vger.kernel.org" <rcu@vger.kernel.org>,
	"sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"x86@kernel.org" <x86@kernel.org>,
	"kernel-dev@igalia.com" <kernel-dev@igalia.com>,
	"kernel@gpiccoli.net" <kernel@gpiccoli.net>,
	"halves@canonical.com" <halves@canonical.com>,
	"fabiomirmar@gmail.com" <fabiomirmar@gmail.com>,
	"alejandro.j.jimenez@oracle.com" <alejandro.j.jimenez@oracle.com>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"arnd@arndb.de" <arnd@arndb.de>, "bp@alien8.de" <bp@alien8.de>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"d.hatayama@jp.fujitsu.com" <d.hatayama@jp.fujitsu.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"dyoung@redhat.com" <dyoung@redhat.com>,
	"Tang, Feng" <feng.tang@intel.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"mikelley@microsoft.com" <mikelley@microsoft.com>,
	"hidehiro.kawai.ez@hitachi.com" <hidehiro.kawai.ez@hitachi.com>,
	"jgross@suse.com" <jgross@suse.com>,
	"john.ogness@linutronix.de" <john.ogness@linutronix.de>,
	"keescook@chromium.org" <keescook@chromium.org>,
	"luto@kernel.org" <luto@kernel.org>,
	"mhiramat@kernel.org" <mhiramat@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"paulmck@kernel.org" <paulmck@kernel.org>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>,
	"stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"vgoyal@redhat.com" <vgoyal@redhat.com>,
	"vkuznets@redhat.com" <vkuznets@redhat.com>,
	"will@kernel.org" <will@kernel.org>, Alex Elder <elder@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Chris Zankel <chris@zankel.net>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Corey Minyard <minyard@acm.org>, Dexuan Cui <decui@microsoft.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	James Morse <james.morse@arm.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
	Richard Weinberger <richard@nod.at>,
	Robert Richter <rric@kernel.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>, Wei Liu <wei.liu@kernel.org>
Subject: Re: [PATCH 21/30] panic: Introduce the panic pre-reboot notifier list
Message-ID: <YoOs9GJ5Ovq63u5Q@alley>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-22-gpiccoli@igalia.com>
 <YoJgcC8c6LaKADZV@alley>
 <63a74b56-89ef-8d1f-d487-cdb986aab798@igalia.com>
 <bed66b9467254a5a8bafc1983dad643a@intel.com>
 <e895ce94-e6b9-caf6-e5d3-06bf0149445c@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e895ce94-e6b9-caf6-e5d3-06bf0149445c@igalia.com>

On Mon 2022-05-16 13:33:51, Guilherme G. Piccoli wrote:
> On 16/05/2022 13:18, Luck, Tony wrote:
> >> [...]
> > Would it be possible to have some global "kdump is configured + enabled" flag?
> > 
> > Then notifiers could make an informed choice on whether to deep dive to
> > get all the possible details (when there is no kdump) or just skim the high
> > level stuff (to maximize chance of getting a successful kdump).
> > 
> > -Tony
> 
> Good idea Tony! What if I wire a kexec_crash_loaded() in the notifier?

I like this idea.

One small problem is that kexec_crash_loaded() has valid result
only under kexec_mutex. On the other hand, it should stay true
once loaded so that the small race window should be innocent.

> With that, are you/Petr/Dinh OK in moving it for the info list?

Sounds good to me.

Best Regards,
Petr

