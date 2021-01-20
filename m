Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E812FD504
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 17:13:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71600.128330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2G5z-0003Fe-KQ; Wed, 20 Jan 2021 16:12:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71600.128330; Wed, 20 Jan 2021 16:12:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2G5z-0003FF-Gb; Wed, 20 Jan 2021 16:12:35 +0000
Received: by outflank-mailman (input) for mailman id 71600;
 Wed, 20 Jan 2021 16:12:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2G5y-0003FA-EF
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 16:12:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2G5y-0004cV-CZ
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 16:12:34 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2G5y-0006tV-9z
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 16:12:34 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l2G5t-0006NG-K3; Wed, 20 Jan 2021 16:12:29 +0000
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
	bh=t84CnhFfiLD0oe0QYgCF0JkdPs2eZ4zXdqAd21sg6O8=; b=wLsNzkzlsB0nGl8DuKbs5yJAa1
	DLEq9+rHtRVM3QO/isStiVyQh5KmO3we4a7ASFbZQuk8wfseirwIy4lxrgS9+06cpEycBaCSOjEP5
	Ke7Aw3EVQJud2d1pgi4sDYlrcqsImbHiNc5RFpm6NCziHGhNbhR+L2lRGNbewxyEhFvI=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24584.22125.355284.48139@mariner.uk.xensource.com>
Date: Wed, 20 Jan 2021 16:12:29 +0000
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 05/24] Introduce locking functions for block device setup
 on NetBSD
In-Reply-To: <20210120155900.GA5035@antioche.eu.org>
References: <20201214163623.2127-1-bouyer@netbsd.org>
	<20201214163623.2127-6-bouyer@netbsd.org>
	<20201229112909.kprjtysxkg4p6y2i@Air-de-Roger>
	<20210104102037.GA2005@antioche.eu.org>
	<24584.18578.623201.789017@mariner.uk.xensource.com>
	<20210120155900.GA5035@antioche.eu.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Manuel Bouyer writes ("Re: [PATCH 05/24] Introduce locking functions for block device setup on NetBSD"):
> Yes, at last the stat call will need to be patched.
> But it seems to rely on a linux-specific behavoir, which is that
> /dev/stdin points to the real file on redirection:
> >ls -l /dev/stdin /proc/self/fd/0 < /etc/passwd
> lrwxrwxrwx 1 root   root      15 Apr 30  2019 /dev/stdin -> /proc/self/fd/0
> lr-x------ 1 bouyer ita-iatos 64 Jan 20 16:54 /proc/self/fd/0 -> /etc/passwd
> 
> On NetBSD (and I guess other BSDs) this won't work, as /dev/stdin is a
> specific device:
> >ls -l /dev/stdin 
> crw-rw-rw-  1 root  wheel  22, 0 Nov 15  2007 /dev/stdin
> 
> so stat -L will always return the same data. We can't use the same
> protocol.

Ah.

The manpage I am looking at says:

     If no argument is given, stat displays information about the
     file descriptor for standard input.

Here NetBSD has a better command line API than Linux - Linux requires
pratting about with /dev/stdin and NetBSD doesn't.  So I think
where on Linux we have
   stat .... /dev/stdin
on NetBsd we can simply have
   stat ....
with no filename argument.

I think NetBSD's stat(1) also takes different argumnts to specify the
format.  NetBSD uses -f, whereas Linux uses -c.  So the exact rune
will have to be different.

Ian.

