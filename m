Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AA841CD9F
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 22:51:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199308.353279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVgWr-0000PQ-4t; Wed, 29 Sep 2021 20:50:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199308.353279; Wed, 29 Sep 2021 20:50:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVgWq-0000Ly-Vn; Wed, 29 Sep 2021 20:50:12 +0000
Received: by outflank-mailman (input) for mailman id 199308;
 Wed, 29 Sep 2021 20:50:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mVgWp-0000Ls-Jb
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 20:50:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mVgWp-0000Vd-H8
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 20:50:11 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mVgWp-0001YO-G8
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 20:50:11 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mVgWn-0000Gv-Qa; Wed, 29 Sep 2021 21:50:09 +0100
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
	bh=P035az/3F/SWq9Q9ubjL95zAELjd1lWm1l6ysAB2UEA=; b=i5et6UqVgcywc+ZWQhkh17/uj2
	AeLIcBDF912kgy7OfzxVbkGMw+02yakyaalWRyp6Pwv/mCL/O9TIJ0BGUIoBt9l5NBaA90j9TVfkb
	oYCCBBx2Fosea4cjxEZ8S4bdanLylZW47beJFcel68kLv73u1MjpCpjQRzfJtIh3mG2c=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24916.53633.593814.456485@mariner.uk.xensource.com>
Date: Wed, 29 Sep 2021 21:50:09 +0100
To: xen-devel@lists.xenproject.org,
    committers@xenproject.org
Subject: Re: osstest down, PDU failure
In-Reply-To: <24916.14069.358118.417330@mariner.uk.xensource.com>
References: <24916.14069.358118.417330@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Ian Jackson writes ("osstest down, PDU failure"):
> Currently, osstest is not working.  We have lost one of our PDUs,
> meaning that about half a rack is out of action, including one of the
> VM hosts.
> 
> There has been quite a bit of outstanding maintenance which has been
> deferred due to the pandemic.  I am trying to see if we can get
> someone on-site to the colo, in Massachusetts, soon.  A complication
> is that the replacement PDU is in still New York.  Again, due to the
> pandemic.

I managed to get an on-site look by the staff of the colo facility.  A
breaker had tripped, depriving our PDU of power.  They reset the
breaker.  The VM host has come back fully operational.  I have
verified that all the test boxes connected to that PDU (apart from one
knonw-dead box) are powered and responsive enough.  Initial reports
from a smoke flight were encouraging, so I have re-enabled everything.

It may trip again of course.

A power trip in a colo is not a normal event, but we haven't
determined the root cause.  The colo facility are going to ask their
electrical supply technicians to investigate the trip.  I think the
breaker or associated equipment is probably "smart" and will have some
useful records.

Ian.

