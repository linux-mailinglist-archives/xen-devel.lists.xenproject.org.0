Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A7B329EB3
	for <lists+xen-devel@lfdr.de>; Tue,  2 Mar 2021 13:33:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92329.174219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH4CY-0007Zv-Sw; Tue, 02 Mar 2021 12:32:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92329.174219; Tue, 02 Mar 2021 12:32:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH4CY-0007ZW-Og; Tue, 02 Mar 2021 12:32:34 +0000
Received: by outflank-mailman (input) for mailman id 92329;
 Tue, 02 Mar 2021 12:32:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lH4CX-0007ZR-8N
 for xen-devel@lists.xenproject.org; Tue, 02 Mar 2021 12:32:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lH4CX-0004XK-7A
 for xen-devel@lists.xenproject.org; Tue, 02 Mar 2021 12:32:33 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lH4CX-0002l6-6J
 for xen-devel@lists.xenproject.org; Tue, 02 Mar 2021 12:32:33 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lH4CS-0007Qy-HJ; Tue, 02 Mar 2021 12:32:28 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=UyB5hHBrgZUFCyUiaWXC03VstJoaqZ5B8dHkonOfd9Q=; b=1s1xyoqw1BB1STUuNJeamcfAJ+
	mefAgQkY/8Mx5DqBXSn2+x9TfFuPXfK/oPqGQtYmy7ngTtOT0oe3hBLZpJcMtPn9Ke3nn/+t9uyUU
	Q+xu5MsIdyfbfTj0WpaAcvGDXD4BmnFBMfok1BL248ejjKrdV6I1VrgVR5TtOPSbgYzM=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24638.12380.286845.325678@mariner.uk.xensource.com>
Date: Tue, 2 Mar 2021 12:32:28 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    George Dunlap <george.dunlap@citrix.com>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH][4.15] x86/shadow: suppress "fast fault path" optimization
 without reserved bits
In-Reply-To: <fb542bda-d25e-b286-400f-dfb54bfe55d4@suse.com>
References: <aefe5617-9f10-23a4-ee27-6ea66b62cdbe@suse.com>
	<YDkq3KwtfGZZTyLL@deinos.phlegethon.org>
	<72c3c863-7465-ce26-1f57-b71227bb2b19@suse.com>
	<24637.9408.839033.439930@mariner.uk.xensource.com>
	<99db39fd-e479-f71d-9cb9-5903ff6c12f4@citrix.com>
	<24637.10160.977640.808417@mariner.uk.xensource.com>
	<fb542bda-d25e-b286-400f-dfb54bfe55d4@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH][4.15] x86/shadow: suppress "fast fault path" optimization without reserved bits"):
> On 01.03.2021 18:43, Ian Jackson wrote:
> > Andrew Cooper writes ("Re: [PATCH][4.15] x86/shadow: suppress "fast fault path" optimization without reserved bits"):
> >> On 01/03/2021 17:30, Ian Jackson wrote:
> >>> I'm afraid I don't follow enough of the background here to have an
> >>> opinion right now.  Can someone explain to me the risks (and,
> >>> correspondingly, upsides) of the options ?  Sorry to be dim, I don't
> >>> seem to be firing on all cylinders today.
> 
> I guess the risk from that patch is no different than that from the
> patch here. It would merely improve performance for guests using
> very large GFNs for memory areas needing emulation by qemu, which I
> suppose originally wasn't expected to be happening in the first place.
> In fact if I would have been certain there are no side effects of the
> too narrow GFN representation used so far, I would probably have
> submitted the patches in reverse order, or even folded them.

I am still confused.  You are saying that the existing patch, and your
proposal that you are wanting me to have an opinion on, have the same
risk.  So, what aspect of the proposed other way of fixing it might
make me say no ?

> >> Without this fix, some combinations of "normal" VM settings will
> >> malfunction.
> > 
> > Thanks for that explanation.
> > 
> > I don't quite follow how that relates to Jan's comment
> > 
> >  >> Will cook a patch, albeit I guess I'll keep as many of the bits set
> >  >> as possible, while still being able to encode a full-40-bit GFN.
> >  >>
> >  >> Ian - I don't suppose you'd consider this a reasonable thing to do
> >  >> for 4.15? It would allow limiting the negative (performance) effect
> >  >> the change here has.
> > 
> > I already gave a release-ack for the original patch.  I think Jan is
> > asking for a release-ack for a different way of fixing the problem.
> 
> Well, I was trying to negotiate whether I should submit that patch
> for 4.15, or only later for 4.16.

Precisely.  I was hoping someone (eg Andy) would be able to help
explain to me why this is a good idea, or a bad idea.

Ian.

