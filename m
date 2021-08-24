Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D05C3F6137
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 17:01:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171555.313045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIXuV-0003Y8-Bo; Tue, 24 Aug 2021 15:00:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171555.313045; Tue, 24 Aug 2021 15:00:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIXuV-0003WL-7v; Tue, 24 Aug 2021 15:00:19 +0000
Received: by outflank-mailman (input) for mailman id 171555;
 Tue, 24 Aug 2021 15:00:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIXuT-0003WF-To
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 15:00:17 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fd4fb902-04eb-11ec-a8e4-12813bfff9fa;
 Tue, 24 Aug 2021 15:00:16 +0000 (UTC)
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
X-Inumbo-ID: fd4fb902-04eb-11ec-a8e4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629817215;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PYzDpQ+zJTaK4UhGmMVlgoUAKQkUadY8DkY4QPcsSCI=;
  b=XH4NvidhfOB14/QrRnFzLvOhYGtbPypSvIZj5nFqLjk8oYj1yV/Rvbu3
   x5nUNU79+IwcE8pUuU/IC6Rz5zLoC4lIJi81uDlcpvo/zUYgQg4CLaZnX
   UGRqu1q1GdJumUl9a9LzVFke9FD09m4RhLzPXkBejjdZ5DjzTRmJX36FL
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: XtIJ1k6kg6DvDDjdAEE9m0uZV7hBxkLB7lXQ2ibhFeUzzQ8PJnXe2UQU8IjfKofvvOOtCTKQ7J
 UCZU0W+XVw9x5m6A8SRQ/E2NCAf57KKwOx5B2J1XYngyh6tieXxGoIjfyZffJHfIFUy1OZJt2w
 ftPP2VKGlJ9ZfHMXhGMlvCBPFnzCxuLbvladMVqxI83i2LvZ79Lgb1xeM/5Z4joJG0MYNZuyaJ
 oKWy4A5feS6l9lIO/6ftVOEZJs3NeOiycWEsgNrramB3jAqS2edL02xdKJyZYJL25tzNNLz42L
 oWAOoSyJEUBaCqxGvl6ThivB
X-SBRS: 5.1
X-MesageID: 50795068
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:BIjFu6jS8V+MK2sE16drg43IGXBQXtoji2hC6mlwRA09TySZ//
 rBoB0+726RtN9xYgBEpTnuAsS9qB/nmaKdpLNhWotKPzOW2ldATrsD0WKK+VSJcEfDH6xmpM
 RdmsBFebvN5DNB7PoSjjPWL+od
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="50795068"
Date: Tue, 24 Aug 2021 16:00:12 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v7 10/51] build,arm: move LDFLAGS change to arch.mk
Message-ID: <YSUJfGcyBXxPNg8B@perard>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-11-anthony.perard@citrix.com>
 <b5c93c83-1d32-c71b-c4c5-36d2fc00dfa2@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b5c93c83-1d32-c71b-c4c5-36d2fc00dfa2@xen.org>

On Tue, Aug 24, 2021 at 01:50:33PM +0100, Julien Grall wrote:
> Hi Anthony,
> 
> Can you explain why this is moved?

Well, it was in the wrong place, it is best to avoid making changes to
XEN_CFLAGS or XEN_LDFLAGS in Makefile in subdirectories as those are
exported variable and may not work as expected. They may or may not
change *flags in subdirectories, or in the case of arch/*/Makefile, they
might changes *flags in the other directories or not depending on
whether one try to build "xen" or just "common/".

But more importantly, with patch
    build: set ALL_OBJS to main Makefile; move prelink.o to main Makefile
make isn't going to load arch/*/Makefile before building the rest of
xen, and thus changes to XEN_LDFLAGS will only apply to arch/*/Makefile
rather than for all objects. (XEN_LDFLAGS is used with all built_in.o
and few other places like for libfdt-temp.o)

If you want an explanation in the commit message, maybe this one will
do:
    Changes to XEN_LDFLAGS may or may not apply to targets in for
    example "common/" depending on whether one runs `make` or `make
    common/`.

    But arch.mk is loaded before doing any build, so changes to LDFLAGS
    there mean that the value of XEN_LDFLAGS won't depends on the
    initial target.

Thanks,

-- 
Anthony PERARD

