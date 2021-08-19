Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB7E3F1E57
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 18:50:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168962.308566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGlEq-0001Yl-Ou; Thu, 19 Aug 2021 16:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168962.308566; Thu, 19 Aug 2021 16:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGlEq-0001Vr-LS; Thu, 19 Aug 2021 16:49:56 +0000
Received: by outflank-mailman (input) for mailman id 168962;
 Thu, 19 Aug 2021 16:49:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGlEq-0001Vl-2e
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 16:49:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGlEp-0004Zc-Vg
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 16:49:55 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGlEp-0006gB-Uh
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 16:49:55 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mGlEf-0002Ks-88; Thu, 19 Aug 2021 17:49:45 +0100
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
	bh=SWhuqSlrdE92iInNfvJSf/KeLyN4oiodry3n4rU4t58=; b=oxoGPhi7Mo2sZ4/36ZfpiJU+MG
	IUHqaB0vn6tmA2FgOuxSjTeKaXmy67v72rQIACZ9y6A/r7CW8Q0McYHotrZfsS73W4XIbiJVgOUgr
	Tipye0RFoKUlrZMXtJzZclXhDUg0utiEsHJ0vHriPB7pxzNhjuY6fW/vXg6GbXA5CE3o=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24862.35752.987640.236760@mariner.uk.xensource.com>
Date: Thu, 19 Aug 2021 17:49:44 +0100
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    Anthony Perard <anthony.perard@citrix.com>,
    Julien Grall <julien@xen.org>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: preparations for 4.15.1 and 4.13.4
In-Reply-To: <51ef91e4-24bd-dc95-98fd-124007634978@suse.com>
References: <48cc22b9-6d0a-2cfc-ce34-6aabeb84b160@suse.com>
	<51ef91e4-24bd-dc95-98fd-124007634978@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: preparations for 4.15.1 and 4.13.4"):
> On 15.07.2021 09:58, Jan Beulich wrote:
> > Beyond this I'd like the following to be considered:
> > 
> > 6409210a5f51 libxencall: osdep_hypercall() should return long
> > bef64f2c0019 libxencall: introduce variant of xencall2() returning long
> > 01a2d001dea2 libxencall: Bump SONAME following new functionality
> > 6f02d1ea4a10 libxc: use multicall for memory-op on Linux (and Solaris)
> 
> in addition I'd like to ask you to consider
> 
> 0be5a00af590 libxl/x86: check return value of SHADOW_OP_SET_ALLOCATION domctl
> 
> as well, now that it has gone in.

I have queued that all the way back to 4.12, since it seems
security-adjacent at the very least.

Thanks,
Ian.

