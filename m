Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FDD3F1E48
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 18:46:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168956.308555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGlBb-0000lC-8Z; Thu, 19 Aug 2021 16:46:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168956.308555; Thu, 19 Aug 2021 16:46:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGlBb-0000ie-5R; Thu, 19 Aug 2021 16:46:35 +0000
Received: by outflank-mailman (input) for mailman id 168956;
 Thu, 19 Aug 2021 16:46:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGlBZ-0000iT-LL
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 16:46:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGlBZ-0004WF-KM
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 16:46:33 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGlBZ-0006J6-JR
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 16:46:33 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mGlBU-0002K1-P7; Thu, 19 Aug 2021 17:46:28 +0100
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
	bh=o8DZOFcYPFsbVuJXyXtp3e/gbaIndLKglG5A2jgpXEw=; b=7KEowxD7mJU9Cwo+Y9GIWoHfyl
	5sZlDxDPNFOvGBMyf93gJcfRHGoP7YGNm8Dq921LPt55TgVdBhrmP/qJjngdG+8Ofxd6NsaCLgvKD
	BjhHhduvTM/QLwZv8eS83q3fvyFJjTN6O1OX9b28T2ta6vLRgU3dIOs1+ZUcKsPeWShg=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24862.35556.514963.249704@mariner.uk.xensource.com>
Date: Thu, 19 Aug 2021 17:46:28 +0100
To: Olaf Hering <olaf@aepfle.de>
Cc: Jan Beulich <jbeulich@suse.com>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    George Dunlap <george.dunlap@citrix.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    Anthony  Perard <anthony.perard@citrix.com>,
    Julien Grall <julien@xen.org>
Subject: Re: preparations for 4.15.1 and 4.13.4
In-Reply-To: <20210715161157.7e85ed9e.olaf@aepfle.de>
References: <48cc22b9-6d0a-2cfc-ce34-6aabeb84b160@suse.com>
	<20210715161157.7e85ed9e.olaf@aepfle.de>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Olaf Hering writes ("Re: preparations for 4.15.1 and 4.13.4"):
> Am Thu, 15 Jul 2021 09:58:24 +0200
> schrieb Jan Beulich <jbeulich@suse.com>:
> 
> > Please point out backports you find missing from the respective staging branches, but which you consider relevant.
> 
> Depending on how green the CI is supposed to be:
> 
> 76416c459c libfsimage: fix parentheses in macro parameters
> e54c433adf libfsimage: fix clang 10 build
> 
> This will likely turn the Leap clang builds at https://gitlab.com/xen-project/xen/-/pipelines/337629824 green.

I would be happy to take fixes like these for stable branches.  I
tried a git cherry-pick but it didn't apply.  Would you like to supply
backports ?

Thanks,
Ian.

