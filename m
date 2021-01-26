Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E65B1303C28
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 12:53:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74906.134701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4MuY-0006pc-5Z; Tue, 26 Jan 2021 11:53:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74906.134701; Tue, 26 Jan 2021 11:53:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4MuY-0006p9-0R; Tue, 26 Jan 2021 11:53:30 +0000
Received: by outflank-mailman (input) for mailman id 74906;
 Tue, 26 Jan 2021 11:53:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4MuW-0006p3-DV
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 11:53:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4MuW-00057w-AQ
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 11:53:28 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4MuW-0008EQ-9F
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 11:53:28 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l4MuT-0006X3-4H; Tue, 26 Jan 2021 11:53:25 +0000
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
	bh=ff/V4FnxG/jPk0ixcChvLsShb8TmvtWdQbTCxAR/HEI=; b=uh4BkRhoMXoWFsNtfR8jcXWvST
	C/q39j+AwUyUZOoZ+JeiNpFbKWzDEA1E9wKo7rqoXO1drdhcHUSXV6zgbLkqPkmz9vgWspDfst0B/
	/9H1vmxzB9++mtMqBMGo+MmSGRhursK9lX0NMQxbXfatKlEwZIfuDzicWcZo3mO5aP1M=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24592.692.867054.486695@mariner.uk.xensource.com>
Date: Tue, 26 Jan 2021 11:53:24 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 02/15] libxenguest: support zstd compressed kernels
In-Reply-To: <02b2a15a-debc-e066-72ff-ab9ca9429839@suse.com>
References: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
	<02b2a15a-debc-e066-72ff-ab9ca9429839@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH v3 02/15] libxenguest: support zstd compressed kernels"):
> This follows the logic used for other decompression methods utilizing an
> external library, albeit here we can't ignore the 32-bit size field
> appended to the compressed image - its presence causes decompression to
> fail. Leverage the field instead to allocate the output buffer in one
> go, i.e. without incrementally realloc()ing.
> 
> As far as configure.ac goes, I'm pretty sure there is a better (more
> "standard") way of using PKG_CHECK_MODULES(). The construct also gets
> put next to the other decompression library checks, albeit I think they
> all ought to be x86-specific (e.g. placed in the existing case block a
> few lines down).
> 
> Note that, where possible, instead of #ifdef-ing xen/*.h inclusions,
> they get removed.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Wei Liu <wl@xen.org>
> Release-Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
> ---
> Note for committer: As an alternative to patching tools/configure here,
> autoconf may want re-running.

Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>

Thanks,
Ian.

