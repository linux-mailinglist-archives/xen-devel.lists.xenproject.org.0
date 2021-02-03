Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA7230DCCB
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 15:32:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80942.148522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7JC9-0004q0-04; Wed, 03 Feb 2021 14:31:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80942.148522; Wed, 03 Feb 2021 14:31:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7JC8-0004pb-TK; Wed, 03 Feb 2021 14:31:48 +0000
Received: by outflank-mailman (input) for mailman id 80942;
 Wed, 03 Feb 2021 14:31:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7JC7-0004pW-Nj
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 14:31:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7JC7-0001Nu-JM
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 14:31:47 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7JC7-0000ea-GO
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 14:31:47 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l7JC4-0005AW-5Q; Wed, 03 Feb 2021 14:31:44 +0000
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
	bh=qXrdm/t0Vriz1iUoGDa0nMpVQ6Gf8I/9hbaEOJO78ts=; b=TxWVZmhKL8V0IkmpXKn3eV11Ga
	Qfe6fXczuRd83KT0sQy68zUoiQvBqnWmTqNt6Cx50aXxbw973pcmmKf8d1nBGTj3uVGeuPAcuH3RW
	h7s2IMCs1LddIHC9C5US1EeGd/8+R1eBKoyJ09a8wljBS/fjWdgKqkkciwCxJFPTLbiI=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24602.46031.904844.532072@mariner.uk.xensource.com>
Date: Wed, 3 Feb 2021 14:31:43 +0000
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    <wl@xen.org>,
    <anthony.perard@citrix.com>,
    <tamas.k.lengyel@gmail.com>
Subject: Re: [PATCH] tools/libxl: only set viridian flags on new domains
In-Reply-To: <1612324889-20942-1-git-send-email-igor.druzhinin@citrix.com>
References: <1612324889-20942-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Igor Druzhinin writes ("[PATCH] tools/libxl: only set viridian flags on new domains"):
> Domains migrating or restoring should have viridian HVM param key in
> the migration stream already and setting that twice results in Xen
> returing -EEXIST on the second attempt later (during migration stream parsing)
> in case the values don't match. That causes migration/restore operation
> to fail at destination side.
> 
> That issue is now resurfaced by the latest commits (983524671 and 7e5cffcd1e)
> extending default viridian feature set making the values from the previous
> migration streams and those set at domain construction different.

I am OK with this in principle but I would have preferred the prep
work of passing libxl__domain_build_state* through to more places to
be split out into its own patch.

As it is it's not easy to see the wood for the trees.  If we weren't
in the freeze I would probably just shrug and ack it but I think a bit
more care is needed at this stage.

Would you mind splitting the patch in two, the first of which is "no
intended functional change" ?

Thanks,
Ian.

