Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA22529FE8
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 12:59:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330737.554122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nquuD-0006Gl-5K; Tue, 17 May 2022 10:58:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330737.554122; Tue, 17 May 2022 10:58:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nquuD-0006E9-1q; Tue, 17 May 2022 10:58:21 +0000
Received: by outflank-mailman (input) for mailman id 330737;
 Tue, 17 May 2022 10:58:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PwZ0=VZ=suse.com=pmladek@srs-se1.protection.inumbo.net>)
 id 1nquuC-0006E3-6u
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 10:58:20 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 420179e6-d5d0-11ec-837e-e5687231ffcc;
 Tue, 17 May 2022 12:58:18 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 97ABB21CB1;
 Tue, 17 May 2022 10:58:17 +0000 (UTC)
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 5CD572C141;
 Tue, 17 May 2022 10:58:15 +0000 (UTC)
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
X-Inumbo-ID: 420179e6-d5d0-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1652785097; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UpU3PwW0+vEopHT6mwlEtKZnt5vjcj6K5z6p2RvwFDI=;
	b=A62HHwy96rt3Peh/2oQoJb/W5OQ8Z85j1RGtcSopCMAn7XlytDk/24zuEW9Tpga7/Yq/ue
	yQKQnkJYG61eGpGqLTfCCGX/srVGllxHF23XScgduJU8Byym34HyS4Bk1MWh3Z8Rwo0Y9Q
	s5hDkQjh35sYKTX8Zcjp7xwrzg3RpvU=
Date: Tue, 17 May 2022 12:58:15 +0200
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
	will@kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Mihai Carabas <mihai.carabas@oracle.com>,
	Shile Zhang <shile.zhang@linux.alibaba.com>,
	Wang ShaoBo <bobo.shaobowang@huawei.com>,
	zhenwei pi <pizhenwei@bytedance.com>
Subject: Re: [PATCH 05/30] misc/pvpanic: Convert regular spinlock into
 trylock on panic path
Message-ID: <YoN/x2fpdDU4+nSB@alley>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-6-gpiccoli@igalia.com>
 <YnpXGOXicwdy1E6n@alley>
 <0a20dd06-f459-638e-cb4d-8255ab1a1f23@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a20dd06-f459-638e-cb4d-8255ab1a1f23@igalia.com>

On Tue 2022-05-10 10:00:58, Guilherme G. Piccoli wrote:
> On 10/05/2022 09:14, Petr Mladek wrote:
> > [...]
> >> With that said, it's dangerous to use regular spinlocks in such path,
> >> as introduced by commit b3c0f8774668 ("misc/pvpanic: probe multiple instances").
> >> This patch fixes that by replacing regular spinlocks with the trylock
> >> safer approach.
> > 
> > It seems that the lock is used just to manipulating a list. A super
> > safe solution would be to use the rcu API: rcu_add_rcu() and
> > list_del_rcu() under rcu_read_lock(). The spin lock will not be
> > needed and the list will always be valid.
> > 
> > The advantage would be that it will always call members that
> > were successfully added earlier. That said, I am not familiar
> > with pvpanic and am not sure if it is worth it.
> > 
> >> It also fixes an old comment (about a long gone framebuffer code) and
> >> the notifier priority - we should execute hypervisor notifiers early,
> >> deferring this way the panic action to the hypervisor, as expected by
> >> the users that are setting up pvpanic.
> > 
> > This should be done in a separate patch. It changes the behavior.
> > Also there might be a discussion whether it really should be
> > the maximal priority.
> > 
> > Best Regards,
> > Petr
> 
> Thanks for the review Petr. Patch was already merged - my goal was to be
> concise, i.e., a patch per driver / module, so the patch kinda fixes
> whatever I think is wrong with the driver with regards panic handling.
> 
> Do you think it worth to remove this patch from Greg's branch just to
> split it in 2? Personally I think it's not worth, but opinions are welcome.

No problem. It is not worth the effort.


> About the RCU part, this one really could be a new patch, a good
> improvement patch - it makes sense to me, we can think about that after
> the fixes I guess.

Yup.

Best Regards,
Petr

