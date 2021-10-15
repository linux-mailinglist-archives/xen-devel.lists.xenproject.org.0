Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C8F42F1FF
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 15:16:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210593.367521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbN4P-0003jy-R0; Fri, 15 Oct 2021 13:16:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210593.367521; Fri, 15 Oct 2021 13:16:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbN4P-0003gd-Ng; Fri, 15 Oct 2021 13:16:21 +0000
Received: by outflank-mailman (input) for mailman id 210593;
 Fri, 15 Oct 2021 13:16:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mbN4O-0003gX-H4
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 13:16:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mbN4O-0004na-En
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 13:16:20 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mbN4O-000479-Dd
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 13:16:20 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mbN4K-0005nu-O8; Fri, 15 Oct 2021 14:16:16 +0100
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
	bh=kLm5d6faupQ9lA3jQZ9hZ/2hKEnrXUOkZ6Kr/FAIHL0=; b=x+plB/zVekqW9qrM9XMHit4k+k
	XHGCtBzyWNspjjwrYPsq3YUyexfxcTteVqISeh5Jg9n3z116+lZrpyOz/NIcRfc7D9rylUQtWmiWf
	i29DTCx7BHJ14Eu4Dj2vUpAv+whE2YhBAS7giC/X67v6YHN7YbkLzXMswjDU2fH0MaXU=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24937.32544.417730.402070@mariner.uk.xensource.com>
Date: Fri, 15 Oct 2021 14:16:16 +0100
To: Kevin Stefanov <kevin.stefanov@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Ian Jackson <iwj@xenproject.org>,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>,
    Julien Grall <julien@xen.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] tools/tests: Make E2BIG non-fatal to xenstore unit test
In-Reply-To: <20211015121409.24434-1-kevin.stefanov@citrix.com>
References: <20211015121409.24434-1-kevin.stefanov@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Kevin Stefanov writes ("[PATCH v2] tools/tests: Make E2BIG non-fatal to xenstore unit test"):
> Xenstore's unit test fails on read and write of big numbers if
> quota-maxsize is set to a lower number than those test cases use.
> 
> Output a special warning instead of a failure message in such cases
> and make the error non-fatal to the unit test.

I realise that I am late to this, but I'm not sure I agree with the
basic principle of this change.  In general tolerating particular
errors in a test, and simply abandoning the test if they occcur, is
normally not the best approach.

Questions that come to my mind (and which aren't answered in the
commit message and probably should be) include:

Why does test-xenstore using these large numbers for its tests ?
Why would you run the tests with a quota too low for the tests ?
Might this test change not in principle miss genuine bugs ?

Ian.

