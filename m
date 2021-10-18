Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD5F431646
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 12:38:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211987.369706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcQ29-0002GU-Se; Mon, 18 Oct 2021 10:38:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211987.369706; Mon, 18 Oct 2021 10:38:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcQ29-0002ES-PH; Mon, 18 Oct 2021 10:38:21 +0000
Received: by outflank-mailman (input) for mailman id 211987;
 Mon, 18 Oct 2021 10:38:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mcQ28-0002EK-Kw
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 10:38:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mcQ28-0002iQ-Ht
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 10:38:20 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mcQ28-0002H7-H2
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 10:38:20 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mcQ21-0005VV-MB; Mon, 18 Oct 2021 11:38:13 +0100
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
	bh=y3Xyy8GVqWBEIN4ybsydeTQBkgiNMMy1ZiDPQvGMWsw=; b=iUK5YKi2EQ3DAvugEaeZCBswH3
	AO/LxYenkrLMzSVeHZB44bZRqZ4s79hIv7UY1P3vdivyrtxCbYLOErsrB+ZALtwbLptruFiBZl5dp
	0IKUSRlxoUBu/SUd3/yOhfBeauHDBTINS+izGdRXnNT9YebtsCuZ644CmVF4ieziPAz0=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24941.20117.330072.580007@mariner.uk.xensource.com>
Date: Mon, 18 Oct 2021 11:38:13 +0100
To: Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
    Xen-devel <xen-devel@lists.xenproject.org>,
    "sstabellini\@kernel.org" <sstabellini@kernel.org>,
    Rahul Singh <Rahul.Singh@arm.com>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Wei Liu <wl@xen.org>,
    Paul Durrant <paul@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v8 2/5] xen/arm: Enable the existing x86 virtual PCI
 support for ARM [and 1 more messages]
In-Reply-To: <a45077dc-e144-4427-9ae2-5815045ecaec@xen.org>,
	<2b6c80de-f71a-b32e-340f-130f62d9dfd5@suse.com>
References: <cover.1634315461.git.bertrand.marquis@arm.com>
	<e2b10f56043155e4bb8eae824723045ccc042f8e.1634315461.git.bertrand.marquis@arm.com>
	<cef8d2a6-91c1-2d4d-2078-98d0a92b067a@xen.org>
	<F447A1D8-A023-4127-AAC0-7511868DE9C4@arm.com>
	<a45077dc-e144-4427-9ae2-5815045ecaec@xen.org>
	<alpine.DEB.2.21.2110151235100.31303@sstabellini-ThinkPad-T480s>
	<YWqpQyKvNzE8GYda@MacBook-Air-de-Roger.local>
	<2b6c80de-f71a-b32e-340f-130f62d9dfd5@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("Re: [PATCH v8 2/5] xen/arm: Enable the existing x86 virtual PCI support for ARM"):
> AFAICT, the code is not reachable on Arm (?). Therefore, one could argue 
> we this can wait after the week-end as this is a latent bug. Yet, I am 
> not really comfortable to see knowningly buggy code merged.

I agree that merging something that is known to be wrong would be
quite irregular, at least without a compelling reason.

Jan Beulich writes ("Re: [PATCH v8 2/5] xen/arm: Enable the existing x86 virtual PCI support for ARM"):
> On 16.10.2021 12:28, Roger Pau Monné wrote:
> > Maybe I'm being pedantic, or there was some communication outside the
> > mailing list, but I think strictly speaking you are missing an Ack
> > from either Jan or Paul for the xen/drivers/passthrough/pci.c change.
> > 
> > IMHO seeing how that chunk moved from 3 different places in just one
> > afternoon also doesn't give me a lot of confidence. It's Arm only code
> > at the end, so it's not going to effect the existing x86 support and
> > I'm not specially worried, but I would like to avoid having to move it
> > again.
> 
> +1
> 
> I'll be replying to the patch itself for the technical aspects. As per
> context still visible above this code path is supposedly unreachable
> right now, which makes me wonder even more: Why the rush? Depending on
> the answer plus considering the __hwdom_init issue, Ian, I'm inclined
> to suggest a revert.

I don't want to be waving hammers about at this stage, and I haven't
looked at the technical details myself, but:

Can I ask the ARM folks to make sure that this situation is sorted out
ASAP ?  Say, by the end of Thursday ?

By sorted out I mean that the __init_hwdom issue is fixed and that
the overall changes to xen/drivers/passthrough/pci.c have been
properly approved.

Furthermore, I think these followup patches should go in all in one
go, as a small series, when everyone is OK with it, rather than
dribbling in.  That will make it easier to see the wood for the trees
(and it would also make a revert less complicated).

Jan, are you OK with this approach ?

Thanks,
Ian.

