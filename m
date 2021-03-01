Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A01C32885D
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 18:40:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91862.173391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGmWD-0002N2-KS; Mon, 01 Mar 2021 17:39:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91862.173391; Mon, 01 Mar 2021 17:39:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGmWD-0002Md-H6; Mon, 01 Mar 2021 17:39:41 +0000
Received: by outflank-mailman (input) for mailman id 91862;
 Mon, 01 Mar 2021 17:39:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGmWB-0002MY-If
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:39:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGmWB-0005K0-EX
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:39:39 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGmWB-0004fC-DZ
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:39:39 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lGmW5-00056B-Hb; Mon, 01 Mar 2021 17:39:33 +0000
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
	bh=Qvrhwslv7ahGD8X6RC4cULWCcw+pYjGYuF+RgcPIFvE=; b=I2dR5ef3heBctkhaot5V1HfO6l
	g+vsDv91/H5KH8GtbK7/O5XnFZoRWzBAoYXtosW2d/KjrpNX6shLaam3yycFGKV4bXkatzhh2xtbj
	rKcyx6uI0rOkAXOD3INcbvJ3c+jZc5dA0M8+XNAQDAnHVajcpe9ZPBluUCF3PK/D+2ac=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24637.9941.299951.66421@mariner.uk.xensource.com>
Date: Mon, 1 Mar 2021 17:39:33 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
    <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    =?iso-8859-2?Q?Micha=B3_Leszczy=F1ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH] tools: Improve signal handling in xen-vmtrace
In-Reply-To: <b04c6b3a-08a8-7507-7f3d-24d179358761@citrix.com>
References: <26720bf5c8258e1b7b4600af3648039b5b9ee18d.1614336820.git.hubert.jasudowicz@cert.pl>
	<b04c6b3a-08a8-7507-7f3d-24d179358761@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("Re: [PATCH] tools: Improve signal handling in xen-vmtrace"):
> In which case, what other signals potentially need dealing with?  Lets
> get them all fixed in one go.
> 
> When that's done, we should make it installed by default, to match its
> expected usecase.

With my tools maintainer hat on:

TERM INT HUP PIPE QUIT

Not sure if we can be bothered with SIGTSTP.

If you want to be nice, when a signal occurs. arrange to re-raise it
after cleanup.  After all, exiting with stderr blather and a non-zero
exit status, merely for SIGPIPE, is rather unfriendly.

This means writing the signal number to the volatile.


With my release manager hat on:

I do not intend to give a release ack to install this by default, at
this stage.  It would have been better to have made this program a
proper utility from the start, but it has now missed the boat for
being a supported feature for 4.15.

OTOH given that it is not installed by default, nor supported, I would
welcome impreovements to it that I don't think will break the build.


Ian.

