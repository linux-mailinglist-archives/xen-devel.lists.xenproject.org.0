Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD884441F7
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 13:55:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220881.382310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miFn2-0000l5-VH; Wed, 03 Nov 2021 12:54:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220881.382310; Wed, 03 Nov 2021 12:54:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miFn2-0000im-Rz; Wed, 03 Nov 2021 12:54:52 +0000
Received: by outflank-mailman (input) for mailman id 220881;
 Wed, 03 Nov 2021 12:54:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1miFn1-0000ig-O2
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 12:54:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1miFn1-0000Lm-Lh
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 12:54:51 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1miFn1-00055J-Kd
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 12:54:51 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1miFmx-0004IX-Te; Wed, 03 Nov 2021 12:54:47 +0000
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
	bh=WtHrw471XKcGW69vtl4eEO8Wmm7xXLKTzs25Bmxnw0g=; b=2YRa90V0ggfYqwxelafNapnrdB
	EAkH28PxFUbEQHkPAo2dZKMDSwwvQNnuziNtIH8hLj3rbbaC++uFsOkMMgyOAs7aYRkLSa07TXChg
	aZkqBVMfkN1UPIweUY9+PukFQYuGuTyFIzmSOUBzwaA0ONseUxfG+EuO+KmKgkc38Gas=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24962.34455.398862.552200@mariner.uk.xensource.com>
Date: Wed, 3 Nov 2021 12:54:47 +0000
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
    Community Manager <community.manager@xenproject.org>,
    Samuel Thibault <samuel.thibault@ens-lyon.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 3/3] tools: disable building qemu-trad per default
In-Reply-To: <20210910055518.562-4-jgross@suse.com>
References: <20210910055518.562-1-jgross@suse.com>
	<20210910055518.562-4-jgross@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("[PATCH v3 3/3] tools: disable building qemu-trad per default"):
> Using qemu-traditional as device model is deprecated for some time now.
> 
> So change the default for building it to "disable". This will affect
> ioemu-stubdom, too, as there is a direct dependency between the two.
> 
> Today it is possible to use a PVH/HVM Linux-based stubdom as device
> model. Additionally using ioemu-stubdom isn't really helping for
> security, as it requires to run a very old and potentially buggy qemu
> version in a PV domain. This is adding probably more security problems
> than it is removing by using a stubdom.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
> Acked-by: Ian Jackson <iwj@xenproject.org>

Now that the relevant osstest patches are in and stable, I revisited
this.  The downside risk to the release is very modest.  It might
cause some temporary test breakage but is very easily reverted.

The upside is that this will accelerate the total removal of qemu-trad
by about one release cycle.  That is highly desirable.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

And pushed to staging.

Ian.

