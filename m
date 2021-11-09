Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B279C44B004
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 16:05:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224011.387041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkSgb-0002wG-2d; Tue, 09 Nov 2021 15:05:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224011.387041; Tue, 09 Nov 2021 15:05:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkSga-0002te-Uw; Tue, 09 Nov 2021 15:05:20 +0000
Received: by outflank-mailman (input) for mailman id 224011;
 Tue, 09 Nov 2021 15:05:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mkSga-0002tY-5P
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 15:05:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mkSga-0001Bg-1r
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 15:05:20 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mkSga-00065f-0d
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 15:05:20 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mkSgM-0005cW-RG; Tue, 09 Nov 2021 15:05:06 +0000
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
	bh=CE+zW9HqdvCpWDPosYfL3NizJGmPzeUaxG/miib8V1A=; b=qAz0EFMlBFA7xfCay388Ev9jqp
	pCgQwh1uwngydMJ/jPyVcmAkM1Mu1WegtxlIHPQio6XMqPdQDqJLXfdUEYU7ADnVJfi5uwwpQfL+g
	nw9+TPjUms+doYCB6Ko6azhPBESU0X6vkpbdQ9Y1OVgaH6eQIKPWpp6ROCVtLM4qLXOo=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24970.36376.658415.956968@mariner.uk.xensource.com>
Date: Tue, 9 Nov 2021 15:04:56 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan  Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano  Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    Hongyan Xia <hongyxia@amazon.com>,
    Dmitry Isaikin <isaikin-dmitry@yandex.ru>
Subject: Re: [PATCH for-4.16] Revert "domctl: improve locking during domain destruction"
In-Reply-To: <20211109143128.56089-1-roger.pau@citrix.com>
References: <20211109143128.56089-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH for-4.16] Revert "domctl: improve locking during domain destruction""):
> This reverts commit 228ab9992ffb1d8f9d2475f2581e68b2913acb88.
> 
> Performance analysis has shown that dropping the domctl lock during
> domain destruction greatly increases the contention in the heap_lock,
> thus making parallel destruction of domains slower.
...
> Given the current point in the release, revert the commit and
> reinstate holding the domctl lock during domain destruction. Further
> work should be done in order to re-add more fine grained locking to
> the domain destruction path once a proper solution to avoid the
> heap_lock contention is found.
> ---
...
> Since this is a revert and not new code I think the risk is lower.
> There's however some risk, as the original commit was from 2017, and
> hence the surrounding code has changed a bit. It's also a possibility
> that some other parts of the domain destruction code now rely on this
> more fine grained locking. Local tests however haven't shown issues.

From a release management point of view I don't regard this as the
kind of "revert" that ought to get any kind of special consideration.
The tree has been like this since 2017 and Xen 4.11 and many changes
have been happened since.

So I am going to treat this as an effectively new change.

AIUI it is a proposal to improve performance, not a bugfix.  Was this
change posted (or, proposed on-list) before the Xen 4.16 Last Posting
Date (24th of September) ?  Even if it was, it would need a freeze
exception.

Ian.

