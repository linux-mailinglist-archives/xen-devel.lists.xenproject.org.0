Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A8F42BF62
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 14:01:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208297.364363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1macws-0000xg-25; Wed, 13 Oct 2021 12:01:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208297.364363; Wed, 13 Oct 2021 12:01:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1macwr-0000ve-V2; Wed, 13 Oct 2021 12:01:29 +0000
Received: by outflank-mailman (input) for mailman id 208297;
 Wed, 13 Oct 2021 12:01:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1macwq-0000vY-0K
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 12:01:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1macwp-0003xk-Vq
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 12:01:27 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1macwp-0001u0-Ux
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 12:01:27 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1macwm-0007W1-79; Wed, 13 Oct 2021 13:01:24 +0100
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
	bh=nQU6TI2PtWNBs/i68t8H3oeT0PBEvEJ8oUIdbu6WNwA=; b=payHZ7gAk4ADGf3o7+zxYONoi8
	9XHM94kSXJeLWJex17mDG8UXfKslWKgG9IKqv6ryled+rF/hNmhOVClK7vw/ObYm0EsKortOTdaZE
	kUO9+DvUs5P32hu8BFvIfuAll/0TAWIEPe5ekvVhwgvXY6oSflrjjxX8N9Bn2WkWIZoY=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24934.51859.927952.290897@mariner.uk.xensource.com>
Date: Wed, 13 Oct 2021 13:01:23 +0100
To: Michal Orzel <michal.orzel@arm.com>
Cc: xen-devel@lists.xenproject.org,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Ian Jackson <iwj@xenproject.org>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    Nick Rosbrook <rosbrookn@ainfosec.com>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Juergen Gross <jgross@suse.com>,
    Christian Lindig <christian.lindig@citrix.com>,
    David Scott <dave@recoil.org>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
    bertrand.marquis@arm.com
Subject: Re: [PATCH v6] xen: Expose the PMU to the guests
In-Reply-To: <20211013074528.1396-1-michal.orzel@arm.com>
References: <20211013074528.1396-1-michal.orzel@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Michal Orzel writes ("[PATCH v6] xen: Expose the PMU to the guests"):
> Add parameter vpmu to xl domain configuration syntax
> to enable the access to PMU registers by disabling
> the PMU traps(currently only for ARM).
...
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> Signed-off-by: Julien Grall <julien@xen.org>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Acked-by: Anthony PERARD <anthony.perard@citrix.com>

I have looked at the tools parts of this and I am fine with them,
especially since Anthony has given his ack for the libxl parts
specifically.

So, for tools:

Acked-by: Ian Jackson <iwj@xenproject.org>

However, this still needs a REST ack, especially, for the SUPPORT.md
change.  There's an update needed there, so I think we should look
forward to a respin.

Ian.

