Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A03592F4BE5
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 14:03:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66484.118097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzfnt-0008RH-BW; Wed, 13 Jan 2021 13:03:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66484.118097; Wed, 13 Jan 2021 13:03:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzfnt-0008Qs-8C; Wed, 13 Jan 2021 13:03:13 +0000
Received: by outflank-mailman (input) for mailman id 66484;
 Wed, 13 Jan 2021 13:03:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kzfns-0008Ql-5Q
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 13:03:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kzfns-0004CB-3L
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 13:03:12 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kzfns-0003m7-2V
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 13:03:12 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1kzfno-000170-OP; Wed, 13 Jan 2021 13:03:09 +0000
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
	bh=AIPDRnguKEfZO1k3hCE79OfEi1X6+yoDPFQDY56qYoQ=; b=nE3p7Tm64pfY8k+bv6RCsvUIVT
	PmAtZLG79VwL2/Cj0w4gZr+iy2Zoh1za3lo+6aOw0FwNABlImDvQHcOkd6m40ymAfZFWu6Wqv/q2Q
	Pw03w1HN0kt5mKX3J6l6uUowGCfEs80C8+1CDhtFECK1fKIsAwD+v+zM4ytiWaZPEQ6A=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24574.61324.543410.159952@mariner.uk.xensource.com>
Date: Wed, 13 Jan 2021 13:03:08 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Andrew Cooper <amc96@cam.ac.uk>
Subject: Re: [PATCH 1/3] tools/tests: Drop obsolete running scripts
In-Reply-To: <20210113123455.23209-2-andrew.cooper3@citrix.com>
References: <20210113123455.23209-1-andrew.cooper3@citrix.com>
	<20210113123455.23209-2-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH 1/3] tools/tests: Drop obsolete running scripts"):
> The python unit tests were dropped in Xen 4.12 due to being obsolete, but the
> scripts to run the tests were missed.  Clean up .gitignore as well

I'm happy with this part.

> Also drop the libxenctrl {C,LD}FLAGS adjustments in the Makefile.  This logic
> isn't used, and isn't appropriate even in principle, as there are tests in
> here which don't want to use libxenctrl.

It's not clear to me that it's EBW to link all the tests to libxenctrl
simply to make the build easier.

In a later patch you add these settings back as part of a particular
test target.

I don't much mind it being done this way, and you've done the work, so
I am giving this my ack, but I just wanted to register my qualm in
case you had a second thought.

FTR, however, IMO the -DXC_WANT_COMPAT_DEVICEMODEL_API that you move
to a specific test program in a later patch is something that ought
not to be applied to all tests, so there doing it that way is
necessary - thanks.

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

Ian.

