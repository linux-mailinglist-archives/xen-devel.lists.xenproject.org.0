Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB7652A854
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 18:40:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331272.554760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nr0Ei-0006LH-UT; Tue, 17 May 2022 16:39:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331272.554760; Tue, 17 May 2022 16:39:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nr0Ei-0006IP-RA; Tue, 17 May 2022 16:39:52 +0000
Received: by outflank-mailman (input) for mailman id 331272;
 Tue, 17 May 2022 16:39:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ghfa=VZ=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1nr0Eg-0006IJ-Ln
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 16:39:51 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5f5b521-d5ff-11ec-bd2c-47488cf2e6aa;
 Tue, 17 May 2022 18:39:46 +0200 (CEST)
Received: from 200-161-159-120.dsl.telesp.net.br ([200.161.159.120]
 helo=[192.168.1.60]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1nr0Da-008gju-GJ; Tue, 17 May 2022 18:38:42 +0200
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
X-Inumbo-ID: f5f5b521-d5ff-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nkckcEBnQlRsFTpASqSz6WprnZRaV0YhYSvPtBA0AVg=; b=GXitEwhCwUT4w9+D5pmH2zeSKa
	60OoBts2cxKaTjkNlztKOiPg7JmJSxA8Nf6Mc3GM9eoyPx0kgrCnR1AZ6EjsP0NE4+IxyqcasC5FH
	Bzs6mPDD2Ojz26SlVHGGSFKa4MS4PaKNy9b4ykBdp04iHw75Gq64zjSE08zAzR/RUXjez/E1PIcPr
	w9iTODel9NpjUtjDaWlc8Esr0zkZKONhALq9dFCmuDS5Nj18Wn3hMj4H1VTlzFy6uMc+YdCA3ReKq
	k/CxfFfQpOp3w1u8K+s1/QjiYVlCZZRZYeOFoWStjActxBApHl98rSBUYLtUajOsHPvmBlqZChf2A
	VEU39bjw==;
Message-ID: <b9ec2fc8-216f-f261-8417-77b6dd95e25c@igalia.com>
Date: Tue, 17 May 2022 13:37:58 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 19/30] panic: Add the panic hypervisor notifier list
Content-Language: en-US
To: Petr Mladek <pmladek@suse.com>, Evan Green <evgreen@chromium.org>,
 David Gow <davidgow@google.com>, Julius Werner <jwerner@chromium.org>
Cc: Scott Branden <scott.branden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Sebastian Reichel <sre@kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, Florian Fainelli
 <f.fainelli@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
 bhe@redhat.com, kexec@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-alpha@vger.kernel.org,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 rcu@vger.kernel.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org, kernel-dev@igalia.com,
 kernel@gpiccoli.net, halves@canonical.com, fabiomirmar@gmail.com,
 alejandro.j.jimenez@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
 Jonathan Corbet <corbet@lwn.net>, d.hatayama@jp.fujitsu.com,
 dave.hansen@linux.intel.com, dyoung@redhat.com, feng.tang@intel.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, mikelley@microsoft.com,
 hidehiro.kawai.ez@hitachi.com, jgross@suse.com, john.ogness@linutronix.de,
 Kees Cook <keescook@chromium.org>, luto@kernel.org, mhiramat@kernel.org,
 mingo@redhat.com, paulmck@kernel.org, peterz@infradead.org,
 rostedt@goodmis.org, senozhatsky@chromium.org,
 Alan Stern <stern@rowland.harvard.edu>, Thomas Gleixner
 <tglx@linutronix.de>, vgoyal@redhat.com, vkuznets@redhat.com,
 Will Deacon <will@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andrea Parri <parri.andrea@gmail.com>, Ard Biesheuvel <ardb@kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 "David S. Miller" <davem@davemloft.net>, Dexuan Cui <decui@microsoft.com>,
 Doug Berger <opendmb@gmail.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Justin Chen <justinpopo6@gmail.com>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Lee Jones <lee.jones@linaro.org>, Markus Mayer <mmayer@broadcom.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Mihai Carabas <mihai.carabas@oracle.com>, Nicholas Piggin
 <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Pavel Machek <pavel@ucw.cz>, Shile Zhang <shile.zhang@linux.alibaba.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Wang ShaoBo <bobo.shaobowang@huawei.com>, Wei Liu <wei.liu@kernel.org>,
 zhenwei pi <pizhenwei@bytedance.com>, Stephen Boyd <swboyd@chromium.org>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-20-gpiccoli@igalia.com> <YoJZVZl/MH0KiE/J@alley>
 <ad082ce7-db50-13bb-3dbb-9b595dfa78be@igalia.com>
 <CAE=gft7ds+dHfEkRz8rnSH1EbTpGTpKbi5Wxj9DW0Jr5mX_j4w@mail.gmail.com>
 <YoOi9PFK/JnNwH+D@alley>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <YoOi9PFK/JnNwH+D@alley>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/05/2022 10:28, Petr Mladek wrote:
> [...]
>>> Disagree here. I'm looping Google maintainers, so they can comment.
>>> (CCed Evan, David, Julius)
>>>
>>> This notifier is clearly a hypervisor notification mechanism. I've fixed
>>> a locking stuff there (in previous patch), I feel it's low-risk but even
>>> if it's mid-risk, the class of such callback remains a perfect fit with
>>> the hypervisor list IMHO.
>>
>> This logs a panic to our "eventlog", a tiny logging area in SPI flash
>> for critical and power-related events. In some cases this ends up
>> being the only clue we get in a Chromebook feedback report that a
>> panic occurred, so from my perspective moving it to the front of the
>> line seems like a good idea.
> 
> IMHO, this would really better fit into the pre-reboot notifier list:
> 
>    + the callback stores the log so it is similar to kmsg_dump()
>      or console_flush_on_panic()
> 
>    + the callback should be proceed after "info" notifiers
>      that might add some other useful information.
> 
> Honestly, I am not sure what exactly hypervisor callbacks do. But I
> think that they do not try to extract the kernel log because they
> would need to handle the internal format.
> 

I guess the main point in your response is : "I am not sure what exactly
hypervisor callbacks do". We need to be sure about the semantics of such
list, and agree on that.

So, my opinion about this first list, that we call "hypervisor list",
is: it contains callbacks that

(1) should run early, preferably before kdump (or even if kdump isn't
set, should run ASAP);

(2) these callbacks perform some communication with an abstraction that
runs "below" the kernel, like a firmware or hypervisor. Classic example:
pvpanic, that communicates with VMM (usually qemu) and allow such VMM to
snapshot the full guest memory, for example.

(3) Should be low-risk. What defines risk is the level of reliability of
subsequent operations - if the callback have 50% of chance of "bricking"
the system totally and prevent kdump / kmsg_dump() / reboot , this is
high risk one for example.

Some good fits IMO: pvpanic, sstate_panic_event() [sparc], fadump in
powerpc, etc.

So, this is a good case for the Google notifier as well - it's not
collecting data like the dmesg (hence your second bullet seems to not
apply here, info notifiers won't add info to be collected by gsmi). It
is a firmware/hypervisor/whatever-gsmi-is notification mechanism, that
tells such "lower" abstraction a panic occurred. It seems low risk and
we want it to run ASAP, if possible.

So, I'd like to keep it here, unless gsmi maintainers disagree or I'm
perhaps misunderstanding the meaning of this first list.
Cheers,


Guilherme

