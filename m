Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD9C32B9B6
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 19:09:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92955.175360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHVUi-0001a0-5c; Wed, 03 Mar 2021 17:41:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92955.175360; Wed, 03 Mar 2021 17:41:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHVUi-0001Ze-28; Wed, 03 Mar 2021 17:41:08 +0000
Received: by outflank-mailman (input) for mailman id 92955;
 Wed, 03 Mar 2021 17:41:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHVUg-0001ZY-Fu
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 17:41:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHVUg-0005Xf-E2
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 17:41:06 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHVUg-0001G2-BA
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 17:41:06 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lHVUc-0002k0-Qw; Wed, 03 Mar 2021 17:41:02 +0000
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
	bh=77yGCMQlUlkllciv5PI8xDDFSgFjn6qktwQBzbvMo70=; b=006B8qhPQHPD/U2X/gLHWeOwoh
	uqcLEKUTytxg6sZg7SDFjpsDcTNJWwopwgwhTlTueMFDUB9+hDTofujGIIEGrf+uoLnQDhQpVxYK/
	AegtvMo7C0Vr9gG37bCj8v7YZXlHS4Y4Ak9MoKrjaDqR3KZdtfA1a+xVfI32XJyWf+co=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24639.51758.530818.933444@mariner.uk.xensource.com>
Date: Wed, 3 Mar 2021 17:41:02 +0000
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
    raphning@amazon.co.uk,
    Julien Grall <jgrall@amazon.com>,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>,
    Bjoern Doebel <doebel@amazon.de>
Subject: Re: [PATCH for-4.15] tools/xenstored: liveupdate: Properly check long transaction
In-Reply-To: <20210303170526.15903-1-julien@xen.org>
References: <20210303170526.15903-1-julien@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("[PATCH for-4.15] tools/xenstored: liveupdate: Properly check long transaction"):
> From: Julien Grall <jgrall@amazon.com>
> 
> As XenStored is single-threaded, conn->ta_start_time will always be
> smaller than now. As we substract the latter from the former, it means
> a transaction will never be considered long running.
> 
> Invert the two operands of the substraction in both lu_reject_reason()
> and lu_check_allowed(). In addition to that, the former also needs to
> check that conn->ta_start_time is not 0 (i.e the transaction is not
> active).
> 
> Take the opportunity to document the return condition of
> lu_check_allowed().

AFAICT this only affects live updated which is not security-supported
in 4.15 and which won't block our tests.  So:

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Ian.

