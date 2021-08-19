Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4966B3F1D23
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 17:44:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168909.308467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGkDE-00061m-HE; Thu, 19 Aug 2021 15:44:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168909.308467; Thu, 19 Aug 2021 15:44:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGkDE-0005zz-Cw; Thu, 19 Aug 2021 15:44:12 +0000
Received: by outflank-mailman (input) for mailman id 168909;
 Thu, 19 Aug 2021 15:44:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGkDC-0005zt-Ll
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 15:44:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGkDC-0002kx-IT
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 15:44:10 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGkDC-0006s6-HO
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 15:44:10 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mGkD7-00029h-G6; Thu, 19 Aug 2021 16:44:05 +0100
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
	bh=d5+5wddgdSmCBw7L0ZyNL+Y2FP2xNV/jA+hZFQTz50E=; b=3DuXsDMxRZfhSip1qMy9LoIuI1
	TluQCFKoqyZhYCQXwfptvIFwzJGNckkbsaoqSowdy/SOZv+FyrKQJBYye9xbPtOrnXYOGqFPo2h/e
	wjREXxwJ6b7iWfoPBTUipmCLocXevaUoLrte5LDiHw5b3ZPEkwtkJEVfdRl6EvBLhfjw=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24862.31813.168508.687823@mariner.uk.xensource.com>
Date: Thu, 19 Aug 2021 16:44:05 +0100
To: Jan Beulich <jbeulich@suse.com>,
    Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>,
    Ian Jackson <ian.jackson@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Anthony Perard <anthony.perard@citrix.com>,
    Julien Grall <julien@xen.org>
Subject: preparations for 4.15.1 and 4.13.4
 support linear p2m table [and 1 more messages]
In-Reply-To: <b871c368-0e9b-20d4-ad18-55c5d8be881e@suse.com>,
	<48cc22b9-6d0a-2cfc-ce34-6aabeb84b160@suse.com>
References: <48cc22b9-6d0a-2cfc-ce34-6aabeb84b160@suse.com>
	<20210702142944.1698-1-jgross@suse.com>
	<b871c368-0e9b-20d4-ad18-55c5d8be881e@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("Re: [PATCH-4.15] tools/libs/ctrl: fix xc_core_arch_map_p2m() to support linear p2m table"):
> Ping?

Jan Beulich writes ("preparations for 4.15.1 and 4.13.4"):
> the releases are due in a couple of weeks time (and 4.14.3 is
> supposed to follow another few weeks later). Please point out backports
> you find missing from the respective staging branches, but which you
> consider relevant.

Hi.  I'm sorry I am behind on this.

I am going to look at some of these backports now but I may not get
through all of them...

Ian.

