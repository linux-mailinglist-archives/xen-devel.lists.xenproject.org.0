Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D11844999C
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 17:23:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223513.386270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk7Qa-0004W5-O7; Mon, 08 Nov 2021 16:23:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223513.386270; Mon, 08 Nov 2021 16:23:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk7Qa-0004UK-JR; Mon, 08 Nov 2021 16:23:24 +0000
Received: by outflank-mailman (input) for mailman id 223513;
 Mon, 08 Nov 2021 16:23:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mNkB=P3=goodmis.org=rostedt@kernel.org>)
 id 1mk7QY-0004UC-IX
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 16:23:22 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f01954c-40b0-11ec-a9d2-d9f7a1cc8784;
 Mon, 08 Nov 2021 17:23:20 +0100 (CET)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E868D61284;
 Mon,  8 Nov 2021 16:23:14 +0000 (UTC)
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
X-Inumbo-ID: 2f01954c-40b0-11ec-a9d2-d9f7a1cc8784
Date: Mon, 8 Nov 2021 11:23:13 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Alan Stern <stern@rowland.harvard.edu>, Geert Uytterhoeven
 <geert@linux-m68k.org>, LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Ayush Sawal <ayush.sawal@chelsio.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Rohit Maheshwari <rohitm@chelsio.com>, Vinay
 Kumar Yadav <vinay.yadav@chelsio.com>, alsa-devel@alsa-project.org,
 bcm-kernel-feedback-list@broadcom.com, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-edac@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-remoteproc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-um@lists.infradead.org,
 linux-usb@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 rcu@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v0 00/42] notifiers: Return an error when callback is
 already registered
Message-ID: <20211108112313.73d0727e@gandalf.local.home>
In-Reply-To: <YYk1xi3eJdMJdjHC@zn.tnic>
References: <20211108101157.15189-1-bp@alien8.de>
	<20211108101924.15759-1-bp@alien8.de>
	<20211108141703.GB1666297@rowland.harvard.edu>
	<YYkzJ3+faVga2Tl3@zn.tnic>
	<YYk1xi3eJdMJdjHC@zn.tnic>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 8 Nov 2021 15:35:50 +0100
Borislav Petkov <bp@alien8.de> wrote:

> On Mon, Nov 08, 2021 at 03:24:39PM +0100, Borislav Petkov wrote:
> > I guess I can add another indirection to notifier_chain_register() and
> > avoid touching all the call sites.  
> 
> IOW, something like this below.
> 
> This way I won't have to touch all the callsites and the registration
> routines would still return a proper value instead of returning 0
> unconditionally.

I prefer this method.

Question, how often does this warning trigger? Is it common to see in
development?

-- Steve

