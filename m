Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E70AF360A82
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 15:29:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111148.212520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX23S-0000Lb-Ee; Thu, 15 Apr 2021 13:29:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111148.212520; Thu, 15 Apr 2021 13:29:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX23S-0000LC-BA; Thu, 15 Apr 2021 13:29:10 +0000
Received: by outflank-mailman (input) for mailman id 111148;
 Thu, 15 Apr 2021 13:29:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sSSh=JM=goodmis.org=rostedt@kernel.org>)
 id 1lX23Q-0000L6-PO
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 13:29:08 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e866fcc-821c-4b4f-b474-a43636560e06;
 Thu, 15 Apr 2021 13:29:08 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D4926611F1;
 Thu, 15 Apr 2021 13:29:06 +0000 (UTC)
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
X-Inumbo-ID: 4e866fcc-821c-4b4f-b474-a43636560e06
Date: Thu, 15 Apr 2021 09:29:05 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: Andrew Cooper  <andrew.cooper3@citrix.com>, Giuseppe Eletto
 <giuseppe.eletto@edu.unito.it>, linux-trace-devel@vger.kernel.org,
 xen-devel@lists.xenproject.org, Enrico Bini <enrico.bini@unito.it>
Subject: Re: A KernelShark plugin for Xen traces analysis
Message-ID: <20210415092905.5c2d7aad@gandalf.local.home>
In-Reply-To: <281ee74f5ce416feeafbca7cb8370889e0d2067f.camel@suse.com>
References: <CALTQNB5X1+G33Qoh5nNxttQe_GkzKvJFLfEXQszsc6XYr+NgUA@mail.gmail.com>
	<f33b39a5-9bbd-934f-a9cd-c536a0ba7416@citrix.com>
	<eefc512b8c1ac26c4eaae81e79ee0243901a3de2.camel@suse.com>
	<7184a7d7-6bca-4106-d70e-8cf9d5b227fb@citrix.com>
	<20210414150752.34366b99@gandalf.local.home>
	<281ee74f5ce416feeafbca7cb8370889e0d2067f.camel@suse.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 15 Apr 2021 02:50:53 +0200
Dario Faggioli <dfaggioli@suse.com> wrote:

> On Wed, 2021-04-14 at 15:07 -0400, Steven Rostedt wrote:
> > On Wed, 14 Apr 2021 19:11:19 +0100
> > Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> >   
> > > Where the plugin (ought to) live depends heavily on whether we
> > > consider
> > > the trace format a stable ABI or not.  
> > 
> > Agreed. Like the VMware plugin to handle ESX traces. It's internal
> > and not
> > published as the API is not stable.
> >   
> Mmm... Does this imply that Linux's tracepoints should be considered a
> stable ABI then? :-D :-D :-D

Some already are. Like the sched_switch tracepoint. That's one of the
reasons Peter Zijlstra now hates exported tracepoints.

> 
> > But if it ever becomes stable, and you would like it to live with
> > KernelShark, we are looking to have a place to store third party
> > plugins.
> >   
> Sure. TBH, either Xen or KernelShark main or plugin repositories would
> be fine for me.
> 
> Which doesn't mean we should choose randomly, as clearly each solution
> has pros and cons that needs to be evaluated.
> 
> I'm just saying that we would prefer the plugin to end up in one of
> those places, rather than remaining its own project. And of course
> we're up for maintaining it, wherever it lands. :-)

Like I said, we can have a third party repository within the KernelShark
repo (or along side of it). As a claws-mail user, I like their method. They
have a bunch of plugins you can add that they have in their repo, but those
plugins are maintained by different people.

-- Steve


> 
> > We are working to make sure that the API for KernelShark plugins
> > remains
> > stable, so your plugins should always work too.
> >   
> Great!
> 
> Regards


