Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6A931CD69
	for <lists+xen-devel@lfdr.de>; Tue, 16 Feb 2021 17:00:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85897.160749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC2lq-0008Ie-Ta; Tue, 16 Feb 2021 16:00:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85897.160749; Tue, 16 Feb 2021 16:00:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC2lq-0008IF-Q5; Tue, 16 Feb 2021 16:00:14 +0000
Received: by outflank-mailman (input) for mailman id 85897;
 Tue, 16 Feb 2021 16:00:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC2lp-0008I9-NI
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 16:00:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC2lp-0003zW-MZ
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 16:00:13 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC2lp-0003KD-LR
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 16:00:13 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lC2lm-0000hw-H6; Tue, 16 Feb 2021 16:00:10 +0000
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
	bh=P6eWWio+X0l5UPkWFzkpOKLW9fWf8eZJUZuO0IBWcXo=; b=lB/hLiaBBaMQ7GMhFWJvenGH0I
	JRv9c6mL8BtcX96AfRbfA/HA9HrZZPLYwhhbW6SwWhJFFASveU9yTDftO3FszzbGlAVtjr7poukPz
	MUTIRrhpDd8tfjcz003YKaS35tqoYxdm/lVaajDhaO9WrQevTVq0OAEezXucaWBmEcik=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24619.60426.285539.113926@mariner.uk.xensource.com>
Date: Tue, 16 Feb 2021 16:00:10 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Julien Grall <julien@xen.org>
Subject: Re: [PATCH v1.1 03/10] tools/libxg: Drop stale p2m logic from ARM's meminit()
In-Reply-To: <20210212200139.26911-1-andrew.cooper3@citrix.com>
References: <20210212153953.4582-4-andrew.cooper3@citrix.com>
	<20210212200139.26911-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH v1.1 03/10] tools/libxg: Drop stale p2m logic from ARM's meminit()"):
> Various version of gcc, when compiling with -Og, complain:
> 
>   xg_dom_arm.c: In function 'meminit':
>   xg_dom_arm.c:420:19: error: 'p2m_size' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>     420 |     dom->p2m_size = p2m_size;
>         |     ~~~~~~~~~~~~~~^~~~~~~~~~
> 
> This is actually entirely stale code since ee21f10d70^..97e34ad22d which
> removed the 1:1 identity p2m for translated domains.
> 
> Drop the write of d->p2m_size, and the p2m_size local variable.  Reposition
> the p2m_size field in struct xc_dom_image and correct some stale
> documentation.
> 
> This change really ought to have been part of the original cleanup series.
> 
> No actual change to how ARM domains are constructed.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

