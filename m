Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FC13287E9
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 18:30:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91848.173355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGmNb-0001lh-9R; Mon, 01 Mar 2021 17:30:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91848.173355; Mon, 01 Mar 2021 17:30:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGmNb-0001lI-5G; Mon, 01 Mar 2021 17:30:47 +0000
Received: by outflank-mailman (input) for mailman id 91848;
 Mon, 01 Mar 2021 17:30:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGmNa-0001l9-32
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:30:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGmNZ-00059d-V9
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:30:45 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGmNZ-0003m0-Tj
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:30:45 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lGmNV-00053X-2W; Mon, 01 Mar 2021 17:30:41 +0000
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
	bh=Nmmne9Iw80A/Bd5bhKzBIv2n5PkRVbRY2Iui4VpFNXg=; b=JFI5qkwKwkc95kHG/labq1fbbJ
	iKOm2J2l8XRUvRHBuAeR8TQpgBcIYaethpVQlsD8ar9LHKlXTWBYl2g3mw8cFz0t/CtUEbUDv8cds
	coqEIXY6d8aKlRXH20v7RdYPUZzyPzqdjRUpRRqU4qW8J7rCnsJ7o8CY9tUrK8ECqvPE=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24637.9408.839033.439930@mariner.uk.xensource.com>
Date: Mon, 1 Mar 2021 17:30:40 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    George Dunlap <george.dunlap@citrix.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH][4.15] x86/shadow: suppress "fast fault path" optimization
 without reserved bits
In-Reply-To: <72c3c863-7465-ce26-1f57-b71227bb2b19@suse.com>
References: <aefe5617-9f10-23a4-ee27-6ea66b62cdbe@suse.com>
	<YDkq3KwtfGZZTyLL@deinos.phlegethon.org>
	<72c3c863-7465-ce26-1f57-b71227bb2b19@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH][4.15] x86/shadow: suppress "fast fault path" optimization without reserved bits"):
> On 26.02.2021 18:07, Tim Deegan wrote:
> > Yes, I think it could be reduced to use just one reserved address bit.
> > IIRC we just used such a large mask so the magic entries would be
> > really obvious in debugging, and there was no need to support arbitrary
> > address widths for emulated devices.
> 
> Will cook a patch, albeit I guess I'll keep as many of the bits set
> as possible, while still being able to encode a full-40-bit GFN.
> 
> Ian - I don't suppose you'd consider this a reasonable thing to do
> for 4.15? It would allow limiting the negative (performance) effect
> the change here has.

I'm afraid I don't follow enough of the background here to have an
opinion right now.  Can someone explain to me the risks (and,
correspondingly, upsides) of the options ?  Sorry to be dim, I don't
seem to be firing on all cylinders today.

Ian.

