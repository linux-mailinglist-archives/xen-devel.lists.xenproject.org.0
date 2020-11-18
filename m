Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA132B7F6D
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 15:31:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29889.59582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfOU0-0004mO-E0; Wed, 18 Nov 2020 14:30:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29889.59582; Wed, 18 Nov 2020 14:30:52 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfOU0-0004m3-AH; Wed, 18 Nov 2020 14:30:52 +0000
Received: by outflank-mailman (input) for mailman id 29889;
 Wed, 18 Nov 2020 14:30:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kfOTz-0004ly-7L
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 14:30:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kfOTz-0002ZT-5Q
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 14:30:51 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kfOTz-0002wC-4R
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 14:30:51 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1kfOTh-0006rZ-VR; Wed, 18 Nov 2020 14:30:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <iwj@xenproject.org>)
	id 1kfOTz-0004ly-7L
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 14:30:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=luYJGnjdsocZ+HS6heTu0POKKrOl++fdD8URr7N3hmc=; b=aXwkQdGKZLHy4uaT3PSu92G+9Z
	2xkRW4LAmG+2bumLXehU8VPSejE6bVPUNsgidDYqbEZXjEuev5HE9ml/oH5Nz1DRzbVlP+i02fy4L
	HbGqbPBzAcvSFWuja65lOrLLyqfL79nYXj5tIPsQYN1Ae9BMYXvoAVwuI9iWNFDYzTR8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <iwj@xenproject.org>)
	id 1kfOTz-0002ZT-5Q
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 14:30:51 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <iwj@xenproject.org>)
	id 1kfOTz-0002wC-4R
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 14:30:51 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
	(envelope-from <iwj@xenproject.org>)
	id 1kfOTh-0006rZ-VR; Wed, 18 Nov 2020 14:30:34 +0000
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24501.12297.176680.254553@mariner.uk.xensource.com>
Date: Wed, 18 Nov 2020 14:30:33 +0000
To: Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Daniel De Graaf <dgdegra@tycho.nsa.gov>,
    "committers\@xenproject.org" <committers@xenproject.org>,
    xen-devel@lists.xenproject.org,
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v6 0/3] XSA-343 followup patches
In-Reply-To: <ddb6025e-a4fb-9691-c71f-7a8f0e5543be@xen.org>
References: <20201109163826.13035-1-jgross@suse.com>
	<aaa3c26f-4bfa-d881-8e72-112e3108f4b5@xen.org>
	<1b54d0bb-deab-f4bd-b773-67a716a1fde1@suse.com>
	<ddb6025e-a4fb-9691-c71f-7a8f0e5543be@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("Re: [PATCH v6 0/3] XSA-343 followup patches"):
> On 18/11/2020 08:22, Jan Beulich wrote:
> > Without a clear outline of what would break with the present logic,
> > I had previously indicated I'm not convinced of the change. This
> > isn't a strong objection, no, but I still wouldn't want to see my
> > name associated with it in such a case.
> 
> I was under the impression that the committer job is mostly mechanical 
> (i.e. collecting tags and applying patches). There are no rules in 
> MAINTAINERS that mention committers can decide what gets committed as 
> long as maintainers approved it and there are no strong objections.

I think in practice committers need to exercise quite a bit of
judgement.  I often find myself deciding on what seem to be edge cases
of the rules.  I also sometimes, with something which has the formally
needed acks, but which seems like it might be controversial or
awkward, decide to just make an extra double-check.  I sometimes even
commit something when maybe the formal rules wouldn't permit it, when
I'm confident that the relevant maintainer(s) etc. wouldn't object -
an example being when something is badly broken and this is allegedly
the fix.

However, I don't agree that a committer should omit committing
something which is acked, and is part of a series which they are
committing, simply because they don't see the need for the patch.

If a committer who is also a maintainer has a firm objection, they
should state that objection as a formal NAK.  If a formal NAK is not
warranted, a committer should not engage in passive obstruction.

Also, a committer should not "silently" commit only part of a series.


In summary, committing something is not a declaration by the committer
that they approve of the patch on a technical level.

It is a declaration that (in the committer's view) the patch is
properly acked/approved, and that therefore according to our shared
understanding of the community's processes, it ought to go in.

That might even occur if the committer has an outstanding technical
objection.  I have certainly committed things that I didn't really
like very much, on the grounds that they had enough acks and that I
didn't feel I wanted to give it a formal NAK.


If it would help a committer feel more comfortable to be explicit
about this, there are a number of approaches available: the committer
could commit the patch but also reply to it on-list restating their
objection but saying that they are committing it despite the
objection, because of others' acks.

If it is felt desirable to record this information in the repository,
one could write something like
   Not-Acked-by: Ian Jackson <iwj@xenproject.org>
(which I think is not the same as Nacked-by) or even add a note in
the commit message like
  [ I am committing this, even though I don't think it is
    necessary, because it has the requisite acks.  I do not
    think it warrants a nack.  -iwj ]

> This is a matter of perspective. It helps to confirm with the
> contributor that it was fine to merge only part of the series
> (multiple pair of eyes is always better than one...) or mentioning
> any clash/reworked.

I think it is especially important to send an email about things being
committed when what has happened might be surprising.  For example, if
only part of a series is committed.

Thanks,
Ian.

