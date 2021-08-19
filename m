Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A36D33F189D
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 13:55:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168582.307797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGgdb-0007gY-1j; Thu, 19 Aug 2021 11:55:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168582.307797; Thu, 19 Aug 2021 11:55:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGgda-0007eW-Ui; Thu, 19 Aug 2021 11:55:10 +0000
Received: by outflank-mailman (input) for mailman id 168582;
 Thu, 19 Aug 2021 11:55:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGgdZ-0007eQ-GI
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 11:55:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGgdZ-0006UL-EY
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 11:55:09 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGgdZ-0007YZ-Da
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 11:55:09 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mGgdU-0001XZ-IZ; Thu, 19 Aug 2021 12:55:04 +0100
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
	bh=ZFpKZq74rZuv2A114XyAtWL5mLpTlUDkgw8LtPbZP/4=; b=cg9kOTuBPgf7XZnwqXzaXIbHvz
	XmcgWaZLJ5fZ8o21kDttPIMg+aTOH7EfPEU9vo3wNB+thPX8gbtp/o7fjWZ4BrVqll4NrOrTtvC5X
	qste/hgcX7PGJnlQYWPSWsXLmlzO3t3T94ht7NvjpQHXqbKZTaDugWj5zTLSng9N+Z7Q=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24862.18072.322627.161534@mariner.uk.xensource.com>
Date: Thu, 19 Aug 2021 12:55:04 +0100
To: Jan Beulich <jbeulich@suse.com>
Cc: committers@xenproject.org,
    xen-devel@lists.xenproject.org,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH] RFC: Version support policy
In-Reply-To: <de32c6c4-5ad5-862e-3988-0e7310ec3ecb@suse.com>
References: <20210813113727.6028-1-iwj@xenproject.org>
	<de32c6c4-5ad5-862e-3988-0e7310ec3ecb@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH] RFC: Version support policy"):
> On 13.08.2021 13:37, Ian Jackson wrote:
> > The current policy for minimum supported versions of tools, compilers,
> > etc. is unsatisfactory: For many dependencies no minimum version is
> > specified.  For those where a version is stated, updating it is a
> > decision that has to be explicitly taken for that tool.
> 
> Considering your submission of this having been close to a glibc
> version issue you and I have been discussing, I wonder whether
> "etc" above includes library dependencies as well.

Yes.  This is intending to cover all dependencies of whatever nature.

> In addition I see a difference between actively breaking e.g.
> building with older tool chains vs (like you have it in your
> README adjustment) merely a statement about what we believe
> things may work with, leaving room for people to fix issues with
> their (older) environments, and such changes then not getting
> rejected simply because of policy.

This is a valid concern.  I was thinking about this and I think
something needs to be written about this somewhere but the REAME isn't
the right place.  CODING_STYLE maybe.

> > In this patch I propose a cutoff of 6 years.
> > Obviously there will be debate about the precise value.
> 
> Indeed I consider this way too short. Purely as a personal (and
> abstract) view (realizing this isn't really practical, and knowing
> there are reasons why I'd actually like to see a bump of the
> baseline) I'd prefer if there weren't minimum version requirements
> at all (apart from maybe - along the lines of ...
> 
> > It will also be necessary to make exceptions, and/or to make different
> > rules for different architectures.  In particular, new architectures,
> > new configurations, or new features, may need an absolute earliest
> > tooling date which is considerably less than the usual limit.
> 
> ... this - a baseline determined when Xen became an open source
> project).

I don't think that is workable.  Effectively, it means we are
targeting a constantly-obsolescing dependency environment.  It
would prevent us from adopting even very-well-established facilities
and improvements in our dependencies.

Effectively, it would force us to continue to write using 10- or
20-year-old idioms.  Idioms many of which have been found to be
suboptimal, and which in some cases are becoming unsupported.

Ian.

