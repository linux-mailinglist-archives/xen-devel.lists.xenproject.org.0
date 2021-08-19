Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4083F1E73
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 18:55:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168969.308581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGlJz-0003IT-EC; Thu, 19 Aug 2021 16:55:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168969.308581; Thu, 19 Aug 2021 16:55:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGlJz-0003GZ-Am; Thu, 19 Aug 2021 16:55:15 +0000
Received: by outflank-mailman (input) for mailman id 168969;
 Thu, 19 Aug 2021 16:55:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGlJy-0003GH-0j
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 16:55:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGlJx-0004gd-W8
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 16:55:13 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGlJx-0002Jp-VF
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 16:55:13 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mGlJt-0002NQ-5B; Thu, 19 Aug 2021 17:55:09 +0100
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:CC:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=tk5/MCtn4EWJm4QKEtLp8oMSoOLPXEK4KWSd+REwSxE=; b=rptUpFV/KONqPfmiTIINc5t1vq
	L4RvEPN5Lh04UmF1N7DWIUu9zho4rC/iwW61w/uXrpTqGkWCaXzAOhhkVHDANuarPwIancaPVuTkU
	Y8IzXKdwNxw1lzFgKsF7bqMB+SqyPLzZXA6zrG3SN8mxHcEHVaPSKj6cvqNWecKjp9Bc=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24862.36076.875216.461840@mariner.uk.xensource.com>
Date: Thu, 19 Aug 2021 17:55:08 +0100
To: Andrew Cooper <andrew.cooper3@citrix.com>,
CC: Jan Beulich <jbeulich@suse.com>,
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Ian Jackson <ian.jackson@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    Anthony Perard <anthony.perard@citrix.com>,
    Julien Grall <julien@xen.org>
Subject: Re: preparations for 4.15.1 and 4.13.4 [and 1 more messages]
In-Reply-To: <24862.35359.95257.223452@mariner.uk.xensource.com>
References: <48cc22b9-6d0a-2cfc-ce34-6aabeb84b160@suse.com>
	<8324f959-924b-d196-149d-2fdad95da8fa@citrix.com>
	<24862.35359.95257.223452@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Ian Jackson writes ("Re: preparations for 4.15.1 and 4.13.4 [and 1 more messages]"):
> Jan Beulich writes ("preparations for 4.15.1 and 4.13.4"):
> > The ABI called VERS_1.2 must be identical on all older branches to avoid
> > binary problems when rebuilding a package against old-xen+updates, and
> > then updating to a newer Xen.
> 
> Indeed.  But that is less relevant than the fact that this must also
> be true for VERS_1.3 which is what we are introducing to 4.15 here :-).
> 
> Andy, I usually agree with you on ABI matters.  I think I am doing
> what you mean.  Please correct me if I have misunderstood you.  If
> what I hnve done is wrong, we should revert and/or fix it quickly on
> staging-4.15.
> 
> (I'll ping you in IRC when I have pushed my queue to staging-4.15.)

I thought of a better way to do this.  See below for proposed patch to
xen.git#staging.

Ian.

From 239847451fbef4194e757ce090b6f96c4852af46 Mon Sep 17 00:00:00 2001
From: Ian Jackson <iwj@xenproject.org>
Date: Thu, 19 Aug 2021 17:53:19 +0100
Subject: [PATCH] libxencall: Put a reminder that ABI VERS_1.3 is now frozen

CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>
Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 tools/libs/call/libxencall.map | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/libs/call/libxencall.map b/tools/libs/call/libxencall.map
index d18a3174e9..c99630a44b 100644
--- a/tools/libs/call/libxencall.map
+++ b/tools/libs/call/libxencall.map
@@ -30,4 +30,5 @@ VERS_1.2 {
 VERS_1.3 {
 	global:
 		xencall2L;
+	/* NB VERS_1.3 is frozen since it has been exposed in Xen 4.15 */
 } VERS_1.2;
-- 
2.20.1


