Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F8F527A9D
	for <lists+xen-devel@lfdr.de>; Mon, 16 May 2022 00:15:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.329534.552774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqMWP-0002up-H9; Sun, 15 May 2022 22:15:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 329534.552774; Sun, 15 May 2022 22:15:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqMWP-0002sN-Di; Sun, 15 May 2022 22:15:29 +0000
Received: by outflank-mailman (input) for mailman id 329534;
 Sun, 15 May 2022 22:15:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jY7L=VX=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1nqMWL-0002gX-05
 for xen-devel@lists.xenproject.org; Sun, 15 May 2022 22:15:27 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82922368-d49c-11ec-b8b8-f95467ff1ed0;
 Mon, 16 May 2022 00:15:23 +0200 (CEST)
Received: from [177.183.162.244] (helo=[192.168.0.5])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1nqMUS-005ij1-QV; Mon, 16 May 2022 00:13:29 +0200
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
X-Inumbo-ID: 82922368-d49c-11ec-b8b8-f95467ff1ed0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YHVcpMpwO8nyb8k3/FdyFSCMjS4nrs3MtFW4fah9gBU=; b=or/Fp90JrKe5WlMtL6cMgrtDTd
	KlQ8Vj1tprmMn4SD+c397HC1ukULCsTvCB4iLkFWE/e5eO3HFfAEwKhrKkKAtUd9klk2EZdbn6mIN
	Qd+4SALGR19YAeq7zzTYslQNi14hCF7XYTbP7jST+WF88j+/yFKclHfwZStwWLlezXivWrxaH8IdO
	FFInQai4LoqHg4Is254olZSUcp3WbX0NojyrclkAFtXk81MOkLDyQLJPvTXx/jJ5o9GkRAlJzHqhs
	Xl4VBJVpr4ONcW/qU5LapKJAeqGhxtirFucuu9tYQZm2MIj3QsWcao7mjJyCDthsv8RdX0nMP6hLP
	SN2gr77A==;
Message-ID: <178a456d-3961-9bc2-83d2-2b9457d45fbd@igalia.com>
Date: Sun, 15 May 2022 19:12:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 11/30] um: Improve panic notifiers consistency and
 ordering
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>, Petr Mladek
 <pmladek@suse.com>, Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Richard Weinberger <richard@nod.at>
Cc: akpm@linux-foundation.org, bhe@redhat.com, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org,
 linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-um@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org,
 kernel-dev@igalia.com, kernel@gpiccoli.net, halves@canonical.com,
 fabiomirmar@gmail.com, alejandro.j.jimenez@oracle.com,
 andriy.shevchenko@linux.intel.com, arnd@arndb.de, bp@alien8.de,
 corbet@lwn.net, d.hatayama@jp.fujitsu.com, dave.hansen@linux.intel.com,
 dyoung@redhat.com, feng.tang@intel.com, gregkh@linuxfoundation.org,
 mikelley@microsoft.com, hidehiro.kawai.ez@hitachi.com, jgross@suse.com,
 john.ogness@linutronix.de, keescook@chromium.org, luto@kernel.org,
 mhiramat@kernel.org, mingo@redhat.com, paulmck@kernel.org,
 peterz@infradead.org, rostedt@goodmis.org, senozhatsky@chromium.org,
 stern@rowland.harvard.edu, tglx@linutronix.de, vgoyal@redhat.com,
 vkuznets@redhat.com, will@kernel.org
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-12-gpiccoli@igalia.com> <Ynp2hRodh04K3pzK@alley>
 <4b003501-f5c3-cd66-d222-88d98c93e141@igalia.com>
 <1760d499824f9ef053af7a8dac04b48ab7d7fd3d.camel@sipsolutions.net>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <1760d499824f9ef053af7a8dac04b48ab7d7fd3d.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/05/2022 11:44, Johannes Berg wrote:
> [...]
>> Maybe Anton / Johannes / Richard could give their opinions - appreciate
>> that, I'm not attached to the priority here, it's more about users'
>> common usage of UML I can think of...
> 
> It's hard to say ... In a sense I'm not sure it matters?
> 
> OTOH something like the ftrace dump notifier (kernel/trace/trace.c)
> might still be useful to run before the mconsole and coredump ones, even
> if you could probably use gdb to figure out the information.
> 
> Personally, I don't have a scenario where I'd care about the trace
> buffers though, and most of the others I found would seem irrelevant
> (drivers that aren't even compiled, hung tasks won't really happen since
> we exit immediately, and similar.)
> 
> johannes

Thanks Johannes, I agree with you.

We don't have great ordering now, one thing we need to enforce is the
order between the 2 UML notifiers, and this patch is doing that..trying
to order against other callbacks like the ftrace dumper is messy in the
current code.

OTOH if this patch set is accepted at some point, we'll likely have 3
lists, and with that we can improve ordering a lot - this notifier for
instance would run in the pre-reboot list, *after* the ftrace dumper (if
a kmsg dumper is set).

So, my intention is to keep this patch as is for V2 (with some changes
Johannes suggested before), unless Petr or the other maintainers want
something different.
Cheers,


Guilherme

