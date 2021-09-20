Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 846884112D5
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 12:26:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.190598.340443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSGUV-0003uY-MW; Mon, 20 Sep 2021 10:25:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190598.340443; Mon, 20 Sep 2021 10:25:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSGUV-0003r4-Ip; Mon, 20 Sep 2021 10:25:39 +0000
Received: by outflank-mailman (input) for mailman id 190598;
 Mon, 20 Sep 2021 10:25:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mSGUU-0003qI-5u
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 10:25:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mSGUU-0004Yy-4F
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 10:25:38 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mSGUU-0005d5-2A
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 10:25:38 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mSGUQ-0005RN-NE; Mon, 20 Sep 2021 11:25:34 +0100
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
	bh=OBBSdiHztldZB/EBdjqdaA/K7bZRaJl+x5djZHDPwrw=; b=lAPoRXKrvPFXtOzKsJbaOgeqcG
	kmIQKF0PPNvdrQXZTvNM9OLwzXXNhF7XG+SW5By7C0sf976rA61mqBV/2PgO6RA3Gm6k5rywuGnf6
	rcPr4kCnJ3YrTnSx9gulyO+urgLqw7Y97uObIPEFgFtG6HUPclICBDk/UR76T3kL8nu4=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24904.24990.422751.855186@mariner.uk.xensource.com>
Date: Mon, 20 Sep 2021 11:25:34 +0100
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH] page-alloc: further adjust assign_page{,s}()
In-Reply-To: <90df9041-4f1f-9911-d64e-f8d7b2a99534@suse.com>
References: <90df9041-4f1f-9911-d64e-f8d7b2a99534@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH] page-alloc: further adjust assign_page{,s}()"):
> The on-commit editing of 5260e8fb93f0 ("xen: re-define assign_pages and
> introduce a new function assign_page") didn't go quite far enough: A
> local variable and a function argument also would have wanted adjusting.

This kind of thing is why I really dislike our practice of on-commit
editing.

Ian.

