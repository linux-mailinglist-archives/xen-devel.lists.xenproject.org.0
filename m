Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 710DA3D0F07
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jul 2021 14:51:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159338.293090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6BgY-0000dy-En; Wed, 21 Jul 2021 12:50:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159338.293090; Wed, 21 Jul 2021 12:50:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6BgY-0000b6-AZ; Wed, 21 Jul 2021 12:50:50 +0000
Received: by outflank-mailman (input) for mailman id 159338;
 Wed, 21 Jul 2021 12:50:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m6BgX-0000b0-5j
 for xen-devel@lists.xenproject.org; Wed, 21 Jul 2021 12:50:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m6BgX-0002Ho-2m
 for xen-devel@lists.xenproject.org; Wed, 21 Jul 2021 12:50:49 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m6BgX-0002Zw-1m
 for xen-devel@lists.xenproject.org; Wed, 21 Jul 2021 12:50:49 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1m6BgS-0001J3-39; Wed, 21 Jul 2021 13:50:44 +0100
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
	bh=2PRoXlklWCUXoCMJf7wBeu1acByFMbn0aa/jiM/oiew=; b=2j0ZWZ7DMCc16EBndnjQ8bQ1Qj
	OeIvnSbFFkHz7dl2hqlPkPUtJ8ct+K+faoPzaGDwoTt9kuJnoNsNgk1k2xLpsq54BsA6w6LwfMcDy
	2wC1EOggUyuEJ9IwM19bYLBGC0YkH89pbUVAFj6NgUi1dd7rY4hKFu34Z41pFkDOeBMg=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24824.6179.909691.713305@mariner.uk.xensource.com>
Date: Wed, 21 Jul 2021 13:50:43 +0100
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Scott Davis <scottwd@gmail.com>,
    xen-devel <xen-devel@lists.xenproject.org>,
    Scott Davis <scott.davis@starlab.io>,
    Wei Liu <wl@xen.org>,
    George Dunlap <george.dunlap@citrix.com>,
    Nick Rosbrook <rosbrookn@ainfosec.com>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] tools/xl: Add stubdomain_cmdline option to xl.cfg
In-Reply-To: <CAKf6xpucqRp5Db6z0J7PLbTVxBZThn7j2Mjvjn9z7nJ5Lf5F_g@mail.gmail.com>
References: <6562806d7430431dc154af2c6e4a5232725fc136.1626800539.git.scott.davis@starlab.io>
	<CAKf6xpucqRp5Db6z0J7PLbTVxBZThn7j2Mjvjn9z7nJ5Lf5F_g@mail.gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jason Andryuk writes ("Re: [PATCH] tools/xl: Add stubdomain_cmdline option to xl.cfg"):
> I think this option actually sets the string, so you want "Set
> B<STRING> as the device-model stubdomain kernel command line." or
> something equivalent?
> 
> With a suitable change,
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Does it then override an existing commandline calculated by libxl ?

Often people want to just add an option, so a config setting to append
things is useful (but one to override it completely is useful too).

Ian.

