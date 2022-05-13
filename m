Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA9E52650E
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 16:45:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328568.551624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npWXg-0004Iv-D7; Fri, 13 May 2022 14:45:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328568.551624; Fri, 13 May 2022 14:45:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npWXg-0004FT-9t; Fri, 13 May 2022 14:45:20 +0000
Received: by outflank-mailman (input) for mailman id 328568;
 Fri, 13 May 2022 14:45:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8+9W=VV=sipsolutions.net=johannes@srs-se1.protection.inumbo.net>)
 id 1npWXd-0004FN-V6
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 14:45:18 +0000
Received: from sipsolutions.net (s3.sipsolutions.net [2a01:4f8:191:4433::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4cfe4e37-d2cb-11ec-aa76-f101dd46aeb6;
 Fri, 13 May 2022 16:45:16 +0200 (CEST)
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95) (envelope-from <johannes@sipsolutions.net>)
 id 1npWX2-00AdYm-Tp; Fri, 13 May 2022 16:44:41 +0200
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
X-Inumbo-ID: 4cfe4e37-d2cb-11ec-aa76-f101dd46aeb6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=A7LCydQD5IYNzaoDGyfG1KKM7tCxGhr7TuWULSo03X0=;
	t=1652453115; x=1653662715; b=d6dFBGxhA+etxcUF2VEIga8eMqjhBSJupzgMJmt/foKc2Pc
	kt5aDud7HLL5H6aSbDMeDMNiWTwxy2xY3uc/dB3IgjkOOMsPepA9WwNVZvZI2ThhVzYJjviqtADHa
	ADTKnjlfKrkb52v2oOuID/onVsG+IYw0qr25T02ttvfUDuqmMHcjb9eRlrDS8LhDAIu3/phkwQl40
	LdmkcbE1RS/mzc1/DrWKTp94HtkNKoI5Ma0OGHGsX2EZ4p8/opAPtP/e0HCrk668C2D1dTR6/OIvw
	SDXD9aS3vu1oWZQYjJh/BNc4FcMgm1eOGVLBa/ilqXGorgou5TkSZG4Kt88CUsSw==;
Message-ID: <1760d499824f9ef053af7a8dac04b48ab7d7fd3d.camel@sipsolutions.net>
Subject: Re: [PATCH 11/30] um: Improve panic notifiers consistency and
 ordering
From: Johannes Berg <johannes@sipsolutions.net>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Petr Mladek
 <pmladek@suse.com>,  Anton Ivanov <anton.ivanov@cambridgegreys.com>,
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
 corbet@lwn.net,  d.hatayama@jp.fujitsu.com, dave.hansen@linux.intel.com,
 dyoung@redhat.com,  feng.tang@intel.com, gregkh@linuxfoundation.org,
 mikelley@microsoft.com,  hidehiro.kawai.ez@hitachi.com, jgross@suse.com,
 john.ogness@linutronix.de,  keescook@chromium.org, luto@kernel.org,
 mhiramat@kernel.org, mingo@redhat.com,  paulmck@kernel.org,
 peterz@infradead.org, rostedt@goodmis.org,  senozhatsky@chromium.org,
 stern@rowland.harvard.edu, tglx@linutronix.de,  vgoyal@redhat.com,
 vkuznets@redhat.com, will@kernel.org
Date: Fri, 13 May 2022 16:44:36 +0200
In-Reply-To: <4b003501-f5c3-cd66-d222-88d98c93e141@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
	 <20220427224924.592546-12-gpiccoli@igalia.com> <Ynp2hRodh04K3pzK@alley>
	 <4b003501-f5c3-cd66-d222-88d98c93e141@igalia.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-malware-bazaar: not-scanned

On Wed, 2022-05-11 at 17:22 -0300, Guilherme G. Piccoli wrote:
> On 10/05/2022 11:28, Petr Mladek wrote:
> > [...]
> > It is not clear to me why user mode linux should not care about
> > the other notifiers. It might be because I do not know much
> > about the user mode linux.
> > 
> > Is the because they always create core dump or are never running
> > in a hypervisor or ...?
> > 
> > AFAIK, the notifiers do many different things. For example, there
> > is a notifier that disables RCU watchdog, print some extra
> > information. Why none of them make sense here?
> > 
> 
> Hi Petr, my understanding is that UML is a form of running Linux as a
> regular userspace process for testing purposes.

Correct.

> With that said, as soon
> as we exit in the error path, less "pollution" would happen, so users
> can use GDB to debug the core dump for example.
> 
> In later patches of this series (when we split the panic notifiers in 3
> lists) these UML notifiers run in the pre-reboot list, so they run after
> the informational notifiers for example (in the default level).
> But without the list split we cannot order properly, so my gut feeling
> is that makes sense to run them rather earlier than later in the panic
> process...
> 
> Maybe Anton / Johannes / Richard could give their opinions - appreciate
> that, I'm not attached to the priority here, it's more about users'
> common usage of UML I can think of...

It's hard to say ... In a sense I'm not sure it matters?

OTOH something like the ftrace dump notifier (kernel/trace/trace.c)
might still be useful to run before the mconsole and coredump ones, even
if you could probably use gdb to figure out the information.

Personally, I don't have a scenario where I'd care about the trace
buffers though, and most of the others I found would seem irrelevant
(drivers that aren't even compiled, hung tasks won't really happen since
we exit immediately, and similar.)

johannes

