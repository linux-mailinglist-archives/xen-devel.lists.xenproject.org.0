Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F4D522306
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 19:41:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325946.548757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noTqV-0002oa-RD; Tue, 10 May 2022 17:40:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325946.548757; Tue, 10 May 2022 17:40:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noTqV-0002m6-OG; Tue, 10 May 2022 17:40:27 +0000
Received: by outflank-mailman (input) for mailman id 325946;
 Tue, 10 May 2022 17:40:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uVqW=VS=goodmis.org=rostedt@kernel.org>)
 id 1noTqT-0002m0-Q5
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 17:40:25 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4560267c-d088-11ec-8fc4-03012f2f19d4;
 Tue, 10 May 2022 19:40:24 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5AC4FB81EB9;
 Tue, 10 May 2022 17:40:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 749E5C385C2;
 Tue, 10 May 2022 17:40:16 +0000 (UTC)
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
X-Inumbo-ID: 4560267c-d088-11ec-8fc4-03012f2f19d4
Date: Tue, 10 May 2022 13:40:14 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: akpm@linux-foundation.org, bhe@redhat.com, pmladek@suse.com,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, coresight@lists.linaro.org,
 linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 rcu@vger.kernel.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org, kernel-dev@igalia.com,
 kernel@gpiccoli.net, halves@canonical.com, fabiomirmar@gmail.com,
 alejandro.j.jimenez@oracle.com, andriy.shevchenko@linux.intel.com,
 arnd@arndb.de, bp@alien8.de, corbet@lwn.net, d.hatayama@jp.fujitsu.com,
 dave.hansen@linux.intel.com, dyoung@redhat.com, feng.tang@intel.com,
 gregkh@linuxfoundation.org, mikelley@microsoft.com,
 hidehiro.kawai.ez@hitachi.com, jgross@suse.com, john.ogness@linutronix.de,
 keescook@chromium.org, luto@kernel.org, mhiramat@kernel.org,
 mingo@redhat.com, paulmck@kernel.org, peterz@infradead.org,
 senozhatsky@chromium.org, stern@rowland.harvard.edu, tglx@linutronix.de,
 vgoyal@redhat.com, vkuznets@redhat.com, will@kernel.org
Subject: Re: [PATCH 23/30] printk: kmsg_dump: Introduce helper to inform
 number of dumpers
Message-ID: <20220510134014.3923ccba@gandalf.local.home>
In-Reply-To: <20220427224924.592546-24-gpiccoli@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
	<20220427224924.592546-24-gpiccoli@igalia.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 27 Apr 2022 19:49:17 -0300
"Guilherme G. Piccoli" <gpiccoli@igalia.com> wrote:

> Currently we don't have a way to check if there are dumpers set,
> except counting the list members maybe. This patch introduces a very
> simple helper to provide this information, by just keeping track of
> registered/unregistered kmsg dumpers. It's going to be used on the
> panic path in the subsequent patch.

FYI, it is considered "bad form" to reference in the change log "this
patch". We know this is a patch. The change log should just talk about what
is being done. So can you reword your change logs (you do this is almost
every patch). Here's what I would reword the above to be:

 Currently we don't have a way to check if there are dumpers set, except
 perhaps by counting the list members. Introduce a very simple helper to
 provide this information, by just keeping track of registered/unregistered
 kmsg dumpers. This will simplify the refactoring of the panic path.


-- Steve

