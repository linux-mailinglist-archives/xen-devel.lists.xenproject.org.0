Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0562306079
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 17:03:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76225.137451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4nHl-0006V2-BZ; Wed, 27 Jan 2021 16:03:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76225.137451; Wed, 27 Jan 2021 16:03:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4nHl-0006Ud-83; Wed, 27 Jan 2021 16:03:13 +0000
Received: by outflank-mailman (input) for mailman id 76225;
 Wed, 27 Jan 2021 16:03:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4nHj-0006UY-PO
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 16:03:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4nHj-0001Z8-KG
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 16:03:11 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4nHj-0003JP-Ik
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 16:03:11 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l4nHd-0001gd-6j; Wed, 27 Jan 2021 16:03:05 +0000
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
	bh=+5+2cYDjvbSWLxSN9NELUjAw+CXcFFseY9YTN8ajpYU=; b=rf1QGxCDwZ4xjTQOE4rm3p9ebG
	JVz05J5eguMkHmA9loWG2I8EMunsON+bwWdTE70hvD6Au6H1zD0NeNzJ6Mv2hfarv045kg7sAxe32
	bqa3/wENIkj6FTwBsiH0EXKso5Ekk0FOzSRXCpzxk2ZZn2O+P7AwTFzH4DqwAWE6iUo8=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24593.36536.770883.890760@mariner.uk.xensource.com>
Date: Wed, 27 Jan 2021 16:03:04 +0000
To: Manuel Bouyer <bouyer@antioche.eu.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] libs/light: make it build without setresuid()
In-Reply-To: <24584.26722.347244.50758@mariner.uk.xensource.com>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
	<20210112181242.1570-16-bouyer@antioche.eu.org>
	<20210118181656.2abblbjg2jvhlad7@Air-de-Roger>
	<24584.17302.958286.788145@mariner.uk.xensource.com>
	<20210120151321.GB4175@antioche.eu.org>
	<24584.19725.745755.464840@mariner.uk.xensource.com>
	<20210120165615.GB5035@antioche.eu.org>
	<24584.25612.523093.188718@mariner.uk.xensource.com>
	<20210120172046.GA5772@antioche.eu.org>
	<24584.26722.347244.50758@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Ian Jackson writes ("Re: [PATCH] libs/light: make it build without setresuid()"):
> Manuel Bouyer writes ("Re: [PATCH] libs/light: make it build without setresuid()"):
> > On Wed, Jan 20, 2021 at 05:10:36PM +0000, Ian Jackson wrote:
> > > My last mail had in it a thing that claims to be a proof that this is
> > > not possible.
> > 
> > This code:
...
> > actually works on NetBSD. processes from 375 are killed, and the
> > seteuid(0) call succeeds (showing that the saved used id is still 0).
> 
> I guess I must have been wrong.
> 
> > > What do you think ?
> > 
> > As this is supported by Xen, I hope I can make at last run qemu with a
> > non-zero uid.
> 
> The logic for deciding what user to run qemu as, and whether to kill
> by uid or by pid, is in libxl_dm.c, in the function
> libxl__domain_get_device_model_uid.
> 
> The dm_restrict flag turns on various other things too.

I think I have lost track of where we are with this patch.  I would
like to see all this properly sorted in Xen 4.15.

How about I write a patch splitting the relevant part up into a
version for systems with setresuid and systems without ?  Then you
could fill in the missing part.

Should I expect the non-setresuid OS to provide effectively the whole
orf kill_device_model_uid_child, or just a replacement for the
setresuid call and surrounding logging, something like
  kill_device_model_uid_child_setresuid
?

Ian.

