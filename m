Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD688330D21
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 13:12:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94839.178660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJEkS-0003YN-Al; Mon, 08 Mar 2021 12:12:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94839.178660; Mon, 08 Mar 2021 12:12:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJEkS-0003Xw-6J; Mon, 08 Mar 2021 12:12:32 +0000
Received: by outflank-mailman (input) for mailman id 94839;
 Mon, 08 Mar 2021 12:12:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lJEkQ-0003Xk-T8
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 12:12:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lJEkQ-0003bZ-Qc
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 12:12:30 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lJEkQ-0004cI-NG
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 12:12:30 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lJEkN-0008Q2-DB; Mon, 08 Mar 2021 12:12:27 +0000
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
	bh=8wCi3Dftd3FaukUhiK2OHo7Bw4PW8XiwJNUVoRyTk9A=; b=u4EueEr4WOPItrj1PTx24dKNuP
	WG2MENYxkW5n81YTBbPZfjtVuzAfJz9hFNlYdQmhitYL87xQPYm06H4cn6A7kiqifL6ZXInNjnScT
	U9wc6sEOd1jHIvR5b9bC/YSnlm1n/jbMd7khRCQsUUpmd9BIcon+GEVWckEsLtJ1Gr8g=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24646.5291.124853.270432@mariner.uk.xensource.com>
Date: Mon, 8 Mar 2021 12:12:27 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 1/2][4.15?] tools/x86: don't rebuild cpuid-autogen.h every
 time
In-Reply-To: <78259adb-89b1-06a6-c1f4-c0659134e309@suse.com>
References: <d08ec3ba-dff1-cb1c-9103-949e15774fd5@suse.com>
	<336aaf51-f163-8ee7-d8ee-297f6f3052fd@suse.com>
	<24645.62832.737310.550811@mariner.uk.xensource.com>
	<2857440d-058f-5c85-32d3-87e2fe65bb9a@suse.com>
	<24646.1454.55437.250075@mariner.uk.xensource.com>
	<78259adb-89b1-06a6-c1f4-c0659134e309@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH 1/2][4.15?] tools/x86: don't rebuild cpuid-autogen.h every time"):
> Possibly, but it may end up being more complex: We want to only
> retain files of specific names from a single dir. I don't think
> this is as straightforward to express in a find rune. Of course
> I'll be fine whichever way the bug gets fixed, but I'm afraid I
> don't feel convinced I want to put time into trying the alternative
> you suggest. If otoh you wanted to try out yours and it turned out
> equivalent or better, I wouldn't mind at all.

Untested, but I think something like this should DTRT

 find xen ! -type d ! -path 'xen/lib/x86/*-autogen.h' -print0 | xargs -0r rm --

Since my background is GNU utilities, I checked the FreeBSD manpages
for find, xargs and rm.  They support these options.

This will leave the entire directory structure but I think that is
fine.  The xen-dir target uses mkdir -p and should there be any stale
directories (eg due to switching branches or whatever) they wouldn't
be a problem.

Ian.

