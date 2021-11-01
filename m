Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B20441A1E
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 11:45:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219121.379790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhUoe-0001lY-4l; Mon, 01 Nov 2021 10:45:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219121.379790; Mon, 01 Nov 2021 10:45:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhUoe-0001jg-1N; Mon, 01 Nov 2021 10:45:24 +0000
Received: by outflank-mailman (input) for mailman id 219121;
 Mon, 01 Nov 2021 10:45:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mhUod-0001jH-1F
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 10:45:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mhUod-0005ia-0T
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 10:45:23 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mhUoc-00071l-W5
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 10:45:22 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mhUoX-0004iN-Sa; Mon, 01 Nov 2021 10:45:17 +0000
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
	bh=1plTfpnwtv1MJ6kMNmgdFieQulEIKtABiY1scJ10MYA=; b=Xihxdn4LaJIPmLu3cE99YNIx3P
	KPrH3Gb5E3rUULX93A/A/ocbPa7KGBjY0xq0j2BUxAepGVI0CrPWF9O4LIjZynBcj3QlgyTDIhQ9Y
	oyo+q9x/EIsmr+j6ztfWxceH27enjg9ztpCYL9YAuPn7AyMpAE8TwIUZNeVbjNEXnO+Q=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24959.50493.371312.118964@mariner.uk.xensource.com>
Date: Mon, 1 Nov 2021 10:45:17 +0000
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
    <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Juergen Gross <jgross@suse.com>,
    Christian  Lindig <christian.lindig@citrix.com>,
    David Scott <dave@recoil.org>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
    George Dunlap <George.Dunlap@eu.citrix.com>,
    Edwin =?iso-8859-1?Q?T=F6r=F6k?= <edvin.torok@citrix.com>
Subject: Re: [PATCH for-4.16 v4] gnttab: allow setting max version per-domain [and 1 more messages]
In-Reply-To: <YXz579WNpHe7aO91@Air-de-Roger>,
	<YX0qmTXBD3jSXjBI@Air-de-Roger>
References: <ffd27f87-9e47-12cf-2cfd-1688a19c445f@citrix.com>
	<20211029173813.23002-1-andrew.cooper3@citrix.com>
	<YX0qmTXBD3jSXjBI@Air-de-Roger>
	<20211029075956.1260-1-roger.pau@citrix.com>
	<YXz579WNpHe7aO91@Air-de-Roger>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monné writes ("Re: [PATCH for-4.16 v4] gnttab: allow setting max version per-domain"):
> [...]

Roger Pau Monné writes ("Re: [PATCH for-4.16 2/2] xen: Report grant table v1/v2 capabilities to the toolstack"):
> [...]

FTAOD I think these patches are related and I see discussion is still
ongoing.  Thanks for the CCs.  I would like to make a release-ack
decision after the discussion has converged.

Thanks,
Ian.

