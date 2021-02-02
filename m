Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 373F830BE06
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 13:17:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80528.147347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6uca-0007rl-1Q; Tue, 02 Feb 2021 12:17:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80528.147347; Tue, 02 Feb 2021 12:17:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6ucZ-0007rM-UT; Tue, 02 Feb 2021 12:17:27 +0000
Received: by outflank-mailman (input) for mailman id 80528;
 Tue, 02 Feb 2021 12:17:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6ucY-0007rE-4g
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 12:17:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6ucY-0004fi-33
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 12:17:26 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6ucY-0004o0-1w
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 12:17:26 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l6ucU-00020Y-RR; Tue, 02 Feb 2021 12:17:22 +0000
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:To:Date:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=VSW2mzEMMOyTeQivmM7OnpDGG5T1WNuga1TTwwehR/M=; b=BHM8ckjojBdJJC4oXizZrNFByk
	DteLT/Vh2RWAlwDgAjGDlr3za+nU6uMK0azZx8cFi5t3SZiXB0PvejZSLa2HRZfZoO07LPW4P6NNW
	r9oF3XzDbKhept7o4XnEQ3Xm9v1mqcTgLqyrsm2zhaXz6Gnr1ZFLqBItGe0GCXP/lkH8=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit
Message-ID: <24601.17106.625570.402466@mariner.uk.xensource.com>
Date: Tue, 2 Feb 2021 12:17:22 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>,
    Xen-devel <xen-devel@lists.xenproject.org>,
    =?iso-8859-2?Q?Micha=B3_Leszczy=F1ski?= <michal.leszczynski@cert.pl>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    "Tamas K  Lengyel" <tamas@tklengyel.com>
Subject: Re: [PATCH v9 03/11] tools/[lib]xl: Add vmtrace_buf_size parameter
In-Reply-To: <24601.17068.666597.295268@mariner.uk.xensource.com>
References: <20210201232703.29275-1-andrew.cooper3@citrix.com>
	<20210201232703.29275-4-andrew.cooper3@citrix.com>
	<24601.17068.666597.295268@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Ian Jackson writes ("Re: [PATCH v9 03/11] tools/[lib]xl: Add vmtrace_buf_size parameter"):
> Andrew Cooper writes ("[PATCH v9 03/11] tools/[lib]xl: Add vmtrace_buf_size parameter"):
> > From: Micha³ Leszczyñski <michal.leszczynski@cert.pl>
> > 
> > Allow to specify the size of per-vCPU trace buffer upon
> > domain creation. This is zero by default (meaning: not enabled).
> ...
> 
> Wearing my maintainer/reviewer hat:
> 
> Release risk assessment for this patch:
> 
>  * This contains golang changes which might break the build or need
>    updates to golang generated files.  This ought to be detected by
>    our tests so we can fix it.  At this stage of the release that is
>    probably OK.  The risk of actually shipping a broken build is low.
> 
>  * The patch introduces a new libxl config parameter.  That has API
>    and UI implications.  But it is a very small change and the
>    semantics are fairly obvious.  The name likewise is fine.  So I am
>    very comfortable with recommending this late addition to these
>    APIs.
> 
>  * The patch contains buffer size handling code.  In the general case
>    that might produce a risk of buffer overruns.  But at least here in
>    this patch this is actually just the configured size of a buffer,
>    and actual length/use checks are done elsewhere, so this is is not
>    a real risk.

Consequently, wearing my RM hat, this patch:

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

