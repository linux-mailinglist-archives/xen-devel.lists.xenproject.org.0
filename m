Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11ECC45359D
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 16:20:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226366.391161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn0FO-0003Wa-Tr; Tue, 16 Nov 2021 15:19:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226366.391161; Tue, 16 Nov 2021 15:19:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn0FO-0003Ts-QN; Tue, 16 Nov 2021 15:19:46 +0000
Received: by outflank-mailman (input) for mailman id 226366;
 Tue, 16 Nov 2021 15:19:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mn0FN-0003Tm-F2
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 15:19:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mn0FM-0006DO-VA
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 15:19:44 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mn0FM-0004G1-UI
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 15:19:44 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mn0FI-0000MW-8G; Tue, 16 Nov 2021 15:19:40 +0000
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
	bh=knBfnvoUck10veKPWLhZ/TJwideajrClK6rjASb4wR4=; b=l2ox9xmoaTXAxxnN1TxiI+ORX3
	aTBcShQ8Nc3L2LGRCEDZ1IC/mPhDoEoydsuH3fGUgOnLx0odRUTjtkAtxVT8EdKVgpZ16GW7tQPD2
	W7NBM56/ms0mkU+BESXeE/1airMDAfvJhUf1hjUik0oNJ8TmAY0/2YroMV8w5jO/b3oM=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24979.52233.591993.911437@mariner.uk.xensource.com>
Date: Tue, 16 Nov 2021 15:19:37 +0000
To: Jan Beulich <jbeulich@suse.com>,
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <royger@FreeBSD.org>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 1/6][4.16?] x86/x2APIC: defer probe until after IOMMU
 ACPI table parsing [and 2 more messages]
In-Reply-To: <24965.21029.795504.152439@mariner.uk.xensource.com>,
	<24969.15479.681521.102446@mariner.uk.xensource.com>,
	<b752a000-f69c-ad21-d059-90e12fc83553@suse.com>
References: <d88cfda3-54e4-2323-f536-547879380815@suse.com>
	<b752a000-f69c-ad21-d059-90e12fc83553@suse.com>
	<43d8cc88-aae0-5a82-7b4b-756dd54dd223@suse.com>
	<YYVQAH7OYmFSVOei@Air-de-Roger>
	<24965.21029.795504.152439@mariner.uk.xensource.com>
	<89eda99d-67da-ad97-6040-db79702636bd@suse.com>
	<24969.15479.681521.102446@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

I wrote:
> Could we not do a smaller fix that would print something in the boot
> output, mabye ?  That would be a lower risk change.
> 
> So far, I think the tradeoff here isn't looking very good: a risk of
> unclear magnitude for many users, vs a hard crash at boot for a set of
> users we believe to be empty.
> 
> As ever, feel free to contradict me if I have the wrong end of one of
> the many sticks here...

On the question of backporting:

Jan Beulich:
> >Ian Jackson:
> >>>       Nevertheless it will then be a backporting candidate, so
> >>>       considering to take it right away can't simply be put off.
> > 
> > This part confused me.  Under what circumstances would we backport
> > this ?  AIUI it would be backporting a potentially-fragile and
> > not-readily-testable bugfix, for a theoretical scenario with a
> > straightforward workaround.
> 
> Well, I've said "candidate" for this very reason: To me, every bug
> fix is a candidate. Whether risks outweigh the potential benefits is
> then influencing whether to _actually_ take the change. A reason to
> take it despite the available workaround might be that
> "straightforward" doesn't also mean "obvious" here. IOW once you
> know what to do, doing so is easy. But one first needs to arrive
> there.

I didn't find this particularly convincing, TBH.

Despite the above exchanges, this patch is still marked 4.16? and the
release discussion inthe patch does not seem to have bene updated to
take into account this discussion.

In any case, I think at this stage of the freeze this patch is not a
good bet, particularly seeing as it has had to have another round.

Thanks,
Ian.

