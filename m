Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2A24452BA
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 13:09:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221496.383233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mibYt-0004ni-EH; Thu, 04 Nov 2021 12:09:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221496.383233; Thu, 04 Nov 2021 12:09:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mibYt-0004l3-Aa; Thu, 04 Nov 2021 12:09:43 +0000
Received: by outflank-mailman (input) for mailman id 221496;
 Thu, 04 Nov 2021 12:09:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mibYs-0004kv-Gj
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 12:09:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mibYs-0003IB-Fu
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 12:09:42 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mibYs-0005yZ-FM
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 12:09:42 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mibYo-0002fh-Rs; Thu, 04 Nov 2021 12:09:39 +0000
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
	bh=ZSAjBo/vl1Dz1jl2ULZNxJUBYRI5js9z35iKbsNE+yE=; b=4qFps4Da3igzhWhyAATd/RjGt/
	xWTa/axwLqPCcBr4k+ldSv8YtF/OvNJAqxuoWPCf1eh3HROZsIuHVdMF8KtOsHxZukFzTZgp922Wh
	cphtRjuPBNOrkGpiYcZFLQ/+70L2oKmei1BVOlF/nnnlqeh+QpzALOso8X63DlU2VL8c=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24963.52610.316896.770905@mariner.uk.xensource.com>
Date: Thu, 4 Nov 2021 12:09:38 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Andrew  Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano  Stabellini <sstabellini@kernel.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Juergen Gross <jgross@suse.com>,
    Christian  Lindig <christian.lindig@citrix.com>,
    David Scott <dave@recoil.org>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH for-4.16 v6] gnttab: allow setting max version per-domain
In-Reply-To: <20211104104834.10977-1-roger.pau@citrix.com>
References: <20211104104834.10977-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH for-4.16 v6] gnttab: allow setting max version per-domain"):
> Introduce a new domain create field so that toolstack can specify the
> maximum grant table version usable by the domain. This is plumbed into
> xl and settable by the user as max_grant_version.
> 
> Previously this was only settable on a per host basis using the
> gnttab command line option.
> 
> Note the version is specified using 4 bits, which leaves room to
> specify up to grant table version 15. Given that we only have 2 grant
> table versions right now, and a new version is unlikely in the near
> future using 4 bits seems more than enough.
> 
> xenstored stubdomains are limited to grant table v1 because the
> current MiniOS code used to build them only has support for grants v1.
> There are existing limits set for xenstored stubdomains at creation
> time that already match the defaults in MiniOS.
...
> This needs to be applied on top of Andrew's:
> 
> xen: Report grant table v1/v2 capabilities to the toolstack
> https://lore.kernel.org/xen-devel/20211029173813.23002-1-andrew.cooper3@citrix.com/

Thanks.

We have discussed this wrt 4.16.  I am minded to grant a release ack
for this.  If anyone has a contrary opinion please speak now.

(I think committing both of these would be subject to maintainer acks
for "Report grant table v1/v2 capabilities", which I didn't see but
perhaps I am missing.)

Thanks,
Ian.

