Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0993C30AAD1
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 16:16:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79962.145916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6aw8-0005AH-Oc; Mon, 01 Feb 2021 15:16:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79962.145916; Mon, 01 Feb 2021 15:16:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6aw8-00059s-LB; Mon, 01 Feb 2021 15:16:20 +0000
Received: by outflank-mailman (input) for mailman id 79962;
 Mon, 01 Feb 2021 15:16:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6aw7-00059m-H5
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 15:16:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6aw7-0004RN-GA
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 15:16:19 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6aw7-00054z-FY
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 15:16:19 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l6aw2-0007mt-SJ; Mon, 01 Feb 2021 15:16:14 +0000
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
	bh=xAJ0H1W7F6Zc9EUBrxRiO0yUaKI7jIqhIhCKb1SPPB4=; b=Wr9MnSV39M9x5pSidjLUO+syKs
	KDp4vdzGUxQsk7o9R6Mq5rwrJdBdYiLHo9kHl4PE6mJhM/v1OyybdaQoLfcFRrFQnnPDpd1NeZYpb
	f2/5LcHAsyMmT50T+WsSaKvQvlvI9sI0yZvd4/ZyvgrYAPu+MW16518tKeyhSu9Havh4=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24600.6974.503961.950273@mariner.uk.xensource.com>
Date: Mon, 1 Feb 2021 15:16:14 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>,
    Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Julien Grall <julien@xen.org>
Subject: Re: [PATCH] x86/build: correctly record dependencies of asm-offsets.s [and 1 more messages]
In-Reply-To: <b3b57f6b-3ed9-18f6-2a87-6af3304c6645@suse.com>,
	<0cbbdb3a-5681-10df-aeee-ac185d7033cc@citrix.com>
References: <b3b57f6b-3ed9-18f6-2a87-6af3304c6645@suse.com>
	<0cbbdb3a-5681-10df-aeee-ac185d7033cc@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("Re: [PATCH] x86/build: correctly record dependencies of asm-offsets.s"):
> On 01/02/2021 14:56, Jan Beulich wrote:
> > Going through an intermediate *.new file requires telling the compiler
> > what the real target is, so that the inclusion of the resulting .*.d
> > file will actually be useful.
> >
> > Fixes: 7d2d7a43d014 ("x86/build: limit rebuilding of asm-offsets.h")
> > Reported-by: Julien Grall <julien@xen.org>
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, whatever the
> outcome of the discussion below.

This is a bugfix and does not need a release ack, but FTAOD

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

> > Already on the original patch I did suggest that perhaps Arm would want
> > to follow suit. So again - perhaps the rules should be unified by moving
> > to common code?

Quite so.

Ian.

