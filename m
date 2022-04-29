Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 940ED514C16
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 15:57:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317367.536659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkR7L-0001Uq-Uy; Fri, 29 Apr 2022 13:57:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317367.536659; Fri, 29 Apr 2022 13:57:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkR7L-0001Sb-Ro; Fri, 29 Apr 2022 13:57:07 +0000
Received: by outflank-mailman (input) for mailman id 317367;
 Fri, 29 Apr 2022 13:57:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xag3=VH=goodmis.org=rostedt@kernel.org>)
 id 1nkR7K-0001SV-KZ
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 13:57:06 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3fcd50dc-c7c4-11ec-a405-831a346695d4;
 Fri, 29 Apr 2022 15:57:04 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 83DDCB83563;
 Fri, 29 Apr 2022 13:57:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78159C385A7;
 Fri, 29 Apr 2022 13:56:56 +0000 (UTC)
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
X-Inumbo-ID: 3fcd50dc-c7c4-11ec-a405-831a346695d4
Date: Fri, 29 Apr 2022 09:56:54 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Sergei Shtylyov <sergei.shtylyov@gmail.com>, akpm@linux-foundation.org,
 bhe@redhat.com, pmladek@suse.com, kexec@lists.infradead.org,
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
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org,
 kernel-dev@igalia.com, kernel@gpiccoli.net, halves@canonical.com,
 fabiomirmar@gmail.com, alejandro.j.jimenez@oracle.com,
 andriy.shevchenko@linux.intel.com, arnd@arndb.de, bp@alien8.de,
 corbet@lwn.net, d.hatayama@jp.fujitsu.com, dave.hansen@linux.intel.com,
 dyoung@redhat.com, feng.tang@intel.com, gregkh@linuxfoundation.org,
 mikelley@microsoft.com, hidehiro.kawai.ez@hitachi.com, jgross@suse.com,
 john.ogness@linutronix.de, keescook@chromium.org, luto@kernel.org,
 mhiramat@kernel.org, mingo@redhat.com, paulmck@kernel.org,
 peterz@infradead.org, senozhatsky@chromium.org, stern@rowland.harvard.edu,
 tglx@linutronix.de, vgoyal@redhat.com, vkuznets@redhat.com, will@kernel.org
Subject: Re: [PATCH 17/30] tracing: Improve panic/die notifiers
Message-ID: <20220429095654.26d00b79@gandalf.local.home>
In-Reply-To: <832eecc5-9569-1d95-6ab8-f029b660dfcb@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
	<20220427224924.592546-18-gpiccoli@igalia.com>
	<b8771b37-01f5-f50b-dbb3-9db4ee26e67e@gmail.com>
	<20220429092351.10bca4dd@gandalf.local.home>
	<832eecc5-9569-1d95-6ab8-f029b660dfcb@igalia.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 29 Apr 2022 10:46:35 -0300
"Guilherme G. Piccoli" <gpiccoli@igalia.com> wrote:

> Thanks Sergei and Steven, good idea! I thought about the switch change
> you propose, but I confess I got a bit confused by the "fallthrough"
> keyword - do I need to use it?

No. The fallthrough keyword is only needed when there's code between case
labels. As it is very common to list multiple cases for the same code path.
That is:

	case DIE_OOPS:
 	case PANIC_NOTIFIER:
 		do_dump = 1;
 		break;

Does not need a fall through label, as there's no code between the DIE_OOPS
and the PANIC_NOTIFIER. But if you had:

	case DIE_OOPS:
		x = true;
 	case PANIC_NOTIFIER:
 		do_dump = 1;
 		break;

Then you do.

-- Steve

