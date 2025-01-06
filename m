Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D66A02FEF
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 19:48:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865890.1277172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUs9H-0001Hj-22; Mon, 06 Jan 2025 18:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865890.1277172; Mon, 06 Jan 2025 18:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUs9G-0001FB-VW; Mon, 06 Jan 2025 18:48:22 +0000
Received: by outflank-mailman (input) for mailman id 865890;
 Mon, 06 Jan 2025 18:48:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T/Ld=T6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tUs9F-0001F5-MR
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 18:48:21 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cbb75cc7-cc5e-11ef-99a4-01e77a169b0f;
 Mon, 06 Jan 2025 19:48:19 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 03FB15C5CCD;
 Mon,  6 Jan 2025 18:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3887C4CED2;
 Mon,  6 Jan 2025 18:48:16 +0000 (UTC)
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
X-Inumbo-ID: cbb75cc7-cc5e-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736189297;
	bh=StKZKILXt9SnW45gvGVYlW2CAXTja7eetln+MZhsxkk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=vPyPn+tNwaZ0SwvP01a0SL4o37rrr8ARIGdkyHuhiXJzCzr7th07cA8SMjvKiblqq
	 zKPuG6S6NOsF60sD/bq1q2c7NXzhiNlXuUDz3aM3CeAe9jgAR1dDAGHc5iwFETfEgW
	 evHZecugjpo4ZZ3ltqLBUvUlN1OIfbJrylxT9/ZE85GU0btfgsLB8l2Q8tTXvW7T8Q
	 nbVjdO35xQ0Lc4ZSt1ry0j/QS83Uuih6pkz0PelVQTsj1NQ2bS8xDjqSdWSfvBwqLQ
	 CqjCO7G6EqWu+kV9uh9hQlkcVr5JC0Fif6Ogg0mTpsgM1V3JrCA1BRxlpLFI80zuyU
	 GF/GFUvW91s2A==
Date: Mon, 6 Jan 2025 10:48:15 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Denis Mukhin <dmkhn@proton.me>, dmukhin@ford.com, 
    xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 20/35] xen/console: introduce console_owner_domid()
In-Reply-To: <8a5a5a0f-72b0-4336-b0d2-142254319242@suse.com>
Message-ID: <alpine.DEB.2.22.394.2501061046060.133435@ubuntu-linux-20-04-desktop>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-20-e9aa923127eb@ford.com> <d55bf6a6-5861-4b72-88b5-2aaa28ae0290@suse.com> <VJ9ivpkbNlqfKhBlb5dL6OuoPAXK9wqD4mhgO9Qt4f0qgmuow22qFv1C7L8DlbKYo7ytdKWeV1bLaYJvTAc2Yt7sEd06XREerWER5RPx4No=@proton.me>
 <8a5a5a0f-72b0-4336-b0d2-142254319242@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 6 Jan 2025, Jan Beulich wrote:
> On 04.01.2025 05:15, Denis Mukhin wrote:
> > 
> > On Tuesday, December 10th, 2024 at 11:28 PM, Jan Beulich <jbeulich@suse.com> wrote:
> > 
> >>
> >>
> >> On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
> >>
> >>> From: Denis Mukhin dmukhin@ford.com
> >>>
> >>> console_owner_domid() is introduced to obtain the "console owner" domain ID.
> >>>
> >>> The call is used in NS8250 emulator to identify the case when physical xen
> >>> console focus is owned by the domain w/ NS8250 emulator, in which case,
> >>> messages from guest OS are formatted w/o '(XEN)' prefix.
> >>
> >>
> >> Such messages ought to be processed through guest_printk(), which wants a
> >> domain pointer, not a domid_t anyway. Plus isn't that going to be
> >> current->domain anyway at the callsite, eliminating the need for such a
> >>
> >> helper altogether?
> > 
> > If the current domain is owning the physical console and printing, say, Linux
> > login prompt, there's no need to add "(XEN)" for every printout; adding timestamps
> > can be disabled from Xen command line.
> 
> Surely there shouldn't be (XEN), but without (d<N>) it'll be ambiguous in a log
> which domain a message came from. As long as only Dom0 messages are left un-
> prefixed, that's likely fine. Yet as soon as multiple domains can issue such
> messages (and have console "focus") I think the prefix needs to be there.

Hi Jan,

It looks like we are aligned on the desired behavior, but for clarity,
see https://marc.info/?l=xen-devel&m=173405161613716, also copy/pasted
here:

I think we should provide a consistent behavior across architectures.
The current behavior with vpl011 and dom0less on ARM is the following:

- no prefix for Dom0 output
- DOM$NUM for DomUs when not in focus, otherwise no prefix

It is OK to change this behavior, but in that case I would ask that we
change it consistently also for ARM.

