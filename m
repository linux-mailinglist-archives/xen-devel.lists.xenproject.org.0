Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F028523EE0
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 22:25:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327286.550064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nosst-0002aO-Cb; Wed, 11 May 2022 20:24:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327286.550064; Wed, 11 May 2022 20:24:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nosst-0002YD-9U; Wed, 11 May 2022 20:24:35 +0000
Received: by outflank-mailman (input) for mailman id 327286;
 Wed, 11 May 2022 20:24:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SAT7=VT=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1nossr-0002Y7-0w
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 20:24:33 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d360711-d168-11ec-a406-831a346695d4;
 Wed, 11 May 2022 22:24:32 +0200 (CEST)
Received: from [177.183.162.244] (helo=[192.168.0.5])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1noss0-000Aod-US; Wed, 11 May 2022 22:23:41 +0200
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
X-Inumbo-ID: 5d360711-d168-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LCKlEcL/+gLbho7zoJo89g9MDYx2GFkg8N7n1nlW+0g=; b=MQpyMZ3nMM+SlSF0Ic+7AggIHS
	wWCWxLFJNdpcNC/qKw1wNJR3uSo8xMkfiJlq7d2aikSbZG9yuq1pfGOyawWDcFgWnRsla4fbF455Y
	3RXCIUoMIO9o6uix81B+J++RZraHoxYIg5AFTEzg2KmNpXSrs7BEjvRicrp5TYhs6s3mYN27kkyAz
	njPDxaRSeQ75fkZPzqisnL9xIuav4szhmycF8VItK7avDyCoEE8U/Zs7xTZO8x+jizmxi0qGskMhG
	GsWdK7oyZ7kJDFhpPsgWAmAhF7aiE+T5aNpN2RQ5WYTzC7ql7jtRy3esjCfYNiJNCeB+2D6JHceeB
	Ayva3vzg==;
Message-ID: <4b003501-f5c3-cd66-d222-88d98c93e141@igalia.com>
Date: Wed, 11 May 2022 17:22:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 11/30] um: Improve panic notifiers consistency and
 ordering
Content-Language: en-US
To: Petr Mladek <pmladek@suse.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
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
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <Ynp2hRodh04K3pzK@alley>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/05/2022 11:28, Petr Mladek wrote:
> [...]
> It is not clear to me why user mode linux should not care about
> the other notifiers. It might be because I do not know much
> about the user mode linux.
> 
> Is the because they always create core dump or are never running
> in a hypervisor or ...?
> 
> AFAIK, the notifiers do many different things. For example, there
> is a notifier that disables RCU watchdog, print some extra
> information. Why none of them make sense here?
>

Hi Petr, my understanding is that UML is a form of running Linux as a
regular userspace process for testing purposes. With that said, as soon
as we exit in the error path, less "pollution" would happen, so users
can use GDB to debug the core dump for example.

In later patches of this series (when we split the panic notifiers in 3
lists) these UML notifiers run in the pre-reboot list, so they run after
the informational notifiers for example (in the default level).
But without the list split we cannot order properly, so my gut feeling
is that makes sense to run them rather earlier than later in the panic
process...

Maybe Anton / Johannes / Richard could give their opinions - appreciate
that, I'm not attached to the priority here, it's more about users'
common usage of UML I can think of...

Cheers,


Guilherme

