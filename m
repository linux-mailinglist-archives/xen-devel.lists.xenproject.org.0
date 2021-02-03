Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2021D30E0B6
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 18:17:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80980.148714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7Llv-0005m7-Qh; Wed, 03 Feb 2021 17:16:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80980.148714; Wed, 03 Feb 2021 17:16:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7Llv-0005li-NB; Wed, 03 Feb 2021 17:16:55 +0000
Received: by outflank-mailman (input) for mailman id 80980;
 Wed, 03 Feb 2021 17:16:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7Llt-0005lb-SB
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 17:16:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7Llt-0004dj-PB
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 17:16:53 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7Llt-0008OR-O1
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 17:16:53 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l7Llq-0005XX-EB; Wed, 03 Feb 2021 17:16:50 +0000
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
	bh=W+T1v1TOuUdK1kF5e2BVX7zV5OzlU3rVeTz1+HvQYAs=; b=lOfF2bFtZmPtXpdr4gMaSapYRp
	35diEc0bam5AO3eYIs9dy2QKFfv+hyoGJczYVOqujjd5XorR0rbXxPNtC4uWBnWvbSmgo4g+ovLkU
	quB/6KUychceeU0vgjpGqBQy3wXwB0yvIRiMjxsdKbwDUyQxQ3RVy9JBUmOFQCFrDdL0=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24602.55938.208939.124502@mariner.uk.xensource.com>
Date: Wed, 3 Feb 2021 17:16:50 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Manuel Bouyer <bouyer@netbsd.org>
Subject: Re: [PATCH for-4.15 1/2] libs/foreignmem: Drop useless and/or misleading logging
In-Reply-To: <20210203163750.7564-1-andrew.cooper3@citrix.com>
References: <20210203163750.7564-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH for-4.15 1/2] libs/foreignmem: Drop useless and/or misleading logging"):
> These log lines are all in response to single system calls, and do not provide
> any information which the immediate caller can't determine themselves.  It is
> however exceedinly rude to put junk like this onto stderr, especially as
> system call failures are not even error conditions in certain circumstances.
> 
> The FreeBSD logging has stale function names in, and solaris shouldn't have
> passed code review to start with.
> 
> No functional change.

Thanks.

Reviewed-by: Ian Jackson <iwj@xenproject.org>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>

>          int saved_errno = errno;
> -        PERROR("XXXXXXXX");
> +

That's particularly wtf...

Ian.

