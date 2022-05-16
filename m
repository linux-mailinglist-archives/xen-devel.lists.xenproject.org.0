Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7599752877B
	for <lists+xen-devel@lfdr.de>; Mon, 16 May 2022 16:50:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.329959.553258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqc35-0002S0-Qh; Mon, 16 May 2022 14:50:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 329959.553258; Mon, 16 May 2022 14:50:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqc35-0002PB-NL; Mon, 16 May 2022 14:50:15 +0000
Received: by outflank-mailman (input) for mailman id 329959;
 Mon, 16 May 2022 14:50:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fbMg=VY=suse.com=pmladek@srs-se1.protection.inumbo.net>)
 id 1nqc34-0002P5-Ru
 for xen-devel@lists.xenproject.org; Mon, 16 May 2022 14:50:14 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e1b5b16-d527-11ec-837e-e5687231ffcc;
 Mon, 16 May 2022 16:50:13 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 8A0901FB39;
 Mon, 16 May 2022 14:50:13 +0000 (UTC)
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 0B9D32C142;
 Mon, 16 May 2022 14:50:13 +0000 (UTC)
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
X-Inumbo-ID: 7e1b5b16-d527-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1652712613; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KQiIlBeAtlsgCeLOjjHzTpkuGh7+XAuIIUDB14idFd4=;
	b=S4QT9bHIulh2DX7+Td1E1eHZ8ylXqLGd87dgOU5qON7f0TC2viT1I31ABT9u1YFo+zVF7s
	CRf1jIcOXQaAUTOOLTnLyfyBeX0en2TY7mgyp7gvJnFWNhPu01YU8FRcK1p4/UGj8Io8lk
	XM2tY8ZdnQQ59J0fQXUB5igw6KG7gMQ=
Date: Mon, 16 May 2022 16:50:12 +0200
From: Petr Mladek <pmladek@suse.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, akpm@linux-foundation.org,
	bhe@redhat.com, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
	linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org,
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
	paulmck@kernel.org, peterz@infradead.org, senozhatsky@chromium.org,
	stern@rowland.harvard.edu, tglx@linutronix.de, vgoyal@redhat.com,
	vkuznets@redhat.com, will@kernel.org
Subject: Re: [PATCH 23/30] printk: kmsg_dump: Introduce helper to inform
 number of dumpers
Message-ID: <YoJkpAp8XdS7ROgd@alley>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-24-gpiccoli@igalia.com>
 <20220510134014.3923ccba@gandalf.local.home>
 <c8818906-f113-82b6-b58b-d47ae0c16b4f@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8818906-f113-82b6-b58b-d47ae0c16b4f@igalia.com>

On Wed 2022-05-11 17:03:51, Guilherme G. Piccoli wrote:
> On 10/05/2022 14:40, Steven Rostedt wrote:
> > On Wed, 27 Apr 2022 19:49:17 -0300
> > "Guilherme G. Piccoli" <gpiccoli@igalia.com> wrote:
> > 
> >> Currently we don't have a way to check if there are dumpers set,
> >> except counting the list members maybe. This patch introduces a very
> >> simple helper to provide this information, by just keeping track of
> >> registered/unregistered kmsg dumpers. It's going to be used on the
> >> panic path in the subsequent patch.
> > 
> > FYI, it is considered "bad form" to reference in the change log "this
> > patch". We know this is a patch. The change log should just talk about what
> > is being done. So can you reword your change logs (you do this is almost
> > every patch). Here's what I would reword the above to be:
> > 
> >  Currently we don't have a way to check if there are dumpers set, except
> >  perhaps by counting the list members. Introduce a very simple helper to
> >  provide this information, by just keeping track of registered/unregistered
> >  kmsg dumpers. This will simplify the refactoring of the panic path.
> 
> Thanks for the hint, you're right - it's almost in all of my patches.
> I'll reword all of them (except the ones already merged) to remove this
> "bad form".

Shame on me that I do not care that much about the style of the commit
message :-)

Anyway, the code looks good to me. With the better commit message:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

