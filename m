Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DFB328870
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 18:43:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91868.173415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGmZm-0003KO-CC; Mon, 01 Mar 2021 17:43:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91868.173415; Mon, 01 Mar 2021 17:43:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGmZm-0003Jx-85; Mon, 01 Mar 2021 17:43:22 +0000
Received: by outflank-mailman (input) for mailman id 91868;
 Mon, 01 Mar 2021 17:43:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGmZl-0003Js-0r
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:43:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGmZl-0005Og-00
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:43:21 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGmZk-0004uH-UT
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:43:20 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lGmZd-00058Q-6i; Mon, 01 Mar 2021 17:43:13 +0000
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
	bh=U0CreRcQ5HyG0Zvfrs3/RntpCAxbuwUTGhco0LWVEUw=; b=kLTDbOqGLa4gKlD20i826701tH
	RVoCNycZ8I47InaFY3Z1pwDTQlA17aKX8N/KUy1ftCqExDBvE45nYVNd+/vKjwZvMSN5sBucw3jJ6
	gzEKZSADrquI3zdvLYif2lEostmN6TQY2C3Z8ro49tmBP6aol3yF5oklVIH/o2XIAI4Q=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24637.10160.977640.808417@mariner.uk.xensource.com>
Date: Mon, 1 Mar 2021 17:43:12 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
    Tim Deegan <tim@xen.org>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    George Dunlap <george.dunlap@citrix.com>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH][4.15] x86/shadow: suppress "fast fault path" optimization
 without reserved bits
In-Reply-To: <99db39fd-e479-f71d-9cb9-5903ff6c12f4@citrix.com>
References: <aefe5617-9f10-23a4-ee27-6ea66b62cdbe@suse.com>
	<YDkq3KwtfGZZTyLL@deinos.phlegethon.org>
	<72c3c863-7465-ce26-1f57-b71227bb2b19@suse.com>
	<24637.9408.839033.439930@mariner.uk.xensource.com>
	<99db39fd-e479-f71d-9cb9-5903ff6c12f4@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("Re: [PATCH][4.15] x86/shadow: suppress "fast fault path" optimization without reserved bits"):
> On 01/03/2021 17:30, Ian Jackson wrote:
> > Jan Beulich writes ("Re: [PATCH][4.15] x86/shadow: suppress "fast fault path" optimization without reserved bits"):
> >> On 26.02.2021 18:07, Tim Deegan wrote:
> >>> Yes, I think it could be reduced to use just one reserved address bit.
> >>> IIRC we just used such a large mask so the magic entries would be
> >>> really obvious in debugging, and there was no need to support arbitrary
> >>> address widths for emulated devices.
> >> Will cook a patch, albeit I guess I'll keep as many of the bits set
> >> as possible, while still being able to encode a full-40-bit GFN.
> >>
> >> Ian - I don't suppose you'd consider this a reasonable thing to do
> >> for 4.15? It would allow limiting the negative (performance) effect
> >> the change here has.
> > I'm afraid I don't follow enough of the background here to have an
> > opinion right now.  Can someone explain to me the risks (and,
> > correspondingly, upsides) of the options ?  Sorry to be dim, I don't
> > seem to be firing on all cylinders today.
> 
> Intel IceLake CPUs (imminently coming out) have no reserved bits in
> pagetable entries, so these "optimisations" malfunction.  It is
> definitely an issue for HVM Shadow guests, and possibly migration of PV
> guests (I can never remember whether we use the GNP fastpath on PV or not).
> 
> It is arguably wrong that we ever depended on reserved behaviour.
> 
> I've got a (not-yet-upsteamed) XTF test which can comprehensively test
> this.  I'll find some time to give them a spin and give a T-by.
> 
> Without this fix, some combinations of "normal" VM settings will
> malfunction.

Thanks for that explanation.

I don't quite follow how that relates to Jan's comment

 >> Will cook a patch, albeit I guess I'll keep as many of the bits set
 >> as possible, while still being able to encode a full-40-bit GFN.
 >>
 >> Ian - I don't suppose you'd consider this a reasonable thing to do
 >> for 4.15? It would allow limiting the negative (performance) effect
 >> the change here has.

I already gave a release-ack for the original patch.  I think Jan is
asking for a release-ack for a different way of fixing the problem.

Ian.

