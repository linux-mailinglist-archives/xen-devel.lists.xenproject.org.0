Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1F735D474
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 02:28:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109463.208933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lW6u9-0005kb-35; Tue, 13 Apr 2021 00:27:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109463.208933; Tue, 13 Apr 2021 00:27:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lW6u8-0005kC-Ur; Tue, 13 Apr 2021 00:27:44 +0000
Received: by outflank-mailman (input) for mailman id 109463;
 Tue, 13 Apr 2021 00:27:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1MWi=JK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lW6u7-0005k7-D8
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 00:27:43 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 417e07d7-10a9-4686-86fa-14cf90fc7f17;
 Tue, 13 Apr 2021 00:27:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4443B6109E;
 Tue, 13 Apr 2021 00:27:41 +0000 (UTC)
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
X-Inumbo-ID: 417e07d7-10a9-4686-86fa-14cf90fc7f17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618273661;
	bh=dENYFUjEUnHuUQgwPE7nhH4LIoGHwVzQZ6ZtbZUv2UI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZJqH0m6UMR/0L6Tqwr4wztekJhpRBaaCQn8FzjUz+6kTi6tXFUytp9OE12EKMdkxq
	 B6pYVD+1Cxn1ACur00sZbgTORNG27Nqo56Whb2k45toLH1sT04c1VhxnmdrEUQfnBz
	 AnPfs2NfLB2rKaBceq6xtQG4CxbV4ZOVchI69MBYG5maBmv99kGcoAYu/1WZb6Po1p
	 s6qnv5cGRF/Q+XCVivUNGLDM7s6u7I/YRvCUVdkwOg+W8+KBf6JtuOsA/YMESuQc5q
	 oRh/dJBgPJoY1+9RGsj9IFCaK3srThNwBXD87u65yXIRiBtVe6QinMR+bqyhAG9HKr
	 d9mu7idfaj8Sg==
Date: Mon, 12 Apr 2021 17:27:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <Rahul.Singh@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    "brian.woods@xilinx.com" <brian.woods@xilinx.com>
Subject: Re: [PATCH v3 0/3] Generic SMMU Bindings
In-Reply-To: <A64881AF-DAD6-4A14-A545-354A75FE1B4F@arm.com>
Message-ID: <alpine.DEB.2.21.2104121724090.4885@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2101261435550.2568@sstabellini-ThinkPad-T480s> <80de3eb5-b338-af4e-42eb-d358f51d0bd7@xen.org> <alpine.DEB.2.21.2104061606080.31460@sstabellini-ThinkPad-T480s> <alpine.DEB.2.21.2104091714270.4885@sstabellini-ThinkPad-T480s>
 <A64881AF-DAD6-4A14-A545-354A75FE1B4F@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-204089749-1618273661=:4885"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-204089749-1618273661=:4885
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 12 Apr 2021, Rahul Singh wrote:
> Hi Stefano,
> 
> > On 10 Apr 2021, at 1:27 am, Stefano Stabellini <sstabellini@kernel.org> wrote:
> >
> > On Tue, 6 Apr 2021, Stefano Stabellini wrote:
> >> On Mon, 5 Apr 2021, Julien Grall wrote:
> >>> On 26/01/2021 22:58, Stefano Stabellini wrote:
> >>>> Hi all,
> >>>
> >>> Hi Stefano,
> >>>
> >>>> This series introduces support for the generic SMMU bindings to
> >>>> xen/drivers/passthrough/arm/smmu.c.
> >>>>
> >>>> The last version of the series was
> >>>> https://marc.info/?l=xen-devel&m=159539053406643
> >>> Some changes in the SMMU drivers went in recently. I believe this touched
> >>> similar area to this series. Would you be able to check that this series still
> >>> work as intented?
> >>
> >> Thanks for the heads up, no, unfortunately they don't work :-(
> >>
> >> They badly clash. I did the forward port of the three patches but they
> >> fail at runtime in my tests. I ran out of time to figure out what is the
> >> problem, and I'll have to pick it up at some point in the future (it
> >> might not be any time soon unfortunately).
> >>
> >> Rahul, if you have any ideas about what the problem is please let me
> >> know. This is the branch with the forward port:
> >>
> >> http://xenbits.xenproject.org/git-http/people/sstabellini/xen-unstable.git smmu-generic
> >
> > I did some more investigation and spotted a minor error in my forward
> > port. This an updated branch based on staging:
> >
> > http://xenbits.xenproject.org/git-http/people/sstabellini/xen-unstable.git smmu-generic-2
> >
> > However, the real issue is that Rahul's patches break SMMU support on
> > ZynqMP even without my changes. I ran a bisection and found out that
> > patch #2 is the culprit:
> >
> > 5ee3fa0b21ea xen/arm: smmuv1: Consolidate stream map entry state
> >
> > It causes the abort appended below. The problem doesn't seem
> > particularly ZynqMP specific. Rahul, can you reproduce it on your side?
> 
> Yes. I can reproduce the issue on Xilinx QEMU as we don’t have access to physical ZynqMP and found out that
> associating an iommu group pointer with the S2CR causing the issue.
> 
> Associating the group pointer with S2CR is part of the patch "xen/arm: smmuv1: Intelligent SMR allocation”.
> 
> I just revert that part of the code from the patch and it works fine for me. Please find the attached patch for the same.
> 
> As per your analysis "5ee3fa0b21ea xen/arm: smmuv1: Consolidate stream map entry state” is causing the issue but what I found out that
> "xen/arm: smmuv1: Intelligent SMR allocation” is causing the issue.
> Can you please test it on the physical device and let me know if it works for you also to make sure we both observing the same issue.

Great! Yes, I can confirm that your patch fixed the issue, now I can
boot staging on ZynqMP without errors and I can do device assignment
too. Thank you so much!

The other good news is that the three "Generic SMMU Bindings" patches
work too on top of yours with the fix!

Is the patch you submitted the valid fix for the problem? In other words,
should we go ahead, review, and commit the patch you attached or do you
want to send a different version of the patch for inclusion in Xen
staging?
--8323329-204089749-1618273661=:4885--

