Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 950DC457512
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 18:12:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228147.394706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo7QX-0001uz-Dm; Fri, 19 Nov 2021 17:11:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228147.394706; Fri, 19 Nov 2021 17:11:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo7QX-0001tC-AY; Fri, 19 Nov 2021 17:11:53 +0000
Received: by outflank-mailman (input) for mailman id 228147;
 Fri, 19 Nov 2021 17:11:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mo7QV-0001t6-8l
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 17:11:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mo7QV-0004IX-7t
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 17:11:51 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mo7QV-0007DS-71
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 17:11:51 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mo7QR-0006AG-66; Fri, 19 Nov 2021 17:11:47 +0000
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
	bh=fBFketeRe1HeyMVskFP3UQlZf/6oaaluiuzUhsXlt/U=; b=4kIVc8ZFW7qRpAcdwtjyV9SDe3
	2cCtMg5D313OdZyqOk7/omZB0vXe3RTTj+n6szJs0xkdxM3M9x7pFY/HjoOeYiVxHkc72QrqHjlhD
	1r3cpz7JGTExqMCQfaoacUqhhB5svFaIVb8aHcQl+DzC1LG9Ke/SgZMXN7J29RFxQTfA=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24983.56018.616233.142494@mariner.uk.xensource.com>
Date: Fri, 19 Nov 2021 17:11:46 +0000
To: Andrew Cooper <amc96@srcf.net>
Cc: xen-devel@lists.xenproject.org,
    committers@xenproject.org
Subject: Re: Xen 4.16 development update - tree status
In-Reply-To: <099d9fdc-6ea5-d6ba-6ca9-62e724ec376f@srcf.net>
References: <24983.49015.777430.780265@mariner.uk.xensource.com>
	<099d9fdc-6ea5-d6ba-6ca9-62e724ec376f@srcf.net>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("Re: Xen 4.16 development update - tree status"):
> On 19/11/2021 15:15, Ian Jackson wrote:
> > Open issues and potential blockers
> > ==================================

Thanks, Andrew, for this helpful information.

> > I am aware of three issues for which I don't know the current
> > disposition:
> >
> > * "x86/IOMMU: enabled / intremap handling"
> >   3/3 "AMD/IOMMU: iommu_enable vs iommu_intremap"
> >   Last I heard this was being reworked.
> 
> Some of this has been committed, and has fixed the regression I reported.
> 
> One part is quite risky, and not a regression fix (Xen has been broken
> for years and years here).  I suggest deferring that part to 4.17.

Right.  That's 3/.  1/ and 2/ have been committed already.

> > * I have a note "HPET regression".  There have been number of patches in
> >   this area.  Most recently,
> >   "x86/hpet: setup HPET even when disabled due to stopping in deep C states"
> 
> This regression has been fixed too.  The bugfix got in ahead of RC1.

Oh, good, thanks.

> > * "x86/viridian: EOI MSR should always happen in affected vCPU context"
> >   Jan mentioned this on IRC but I don't see any discussion of it in
> >   my mailbox.
> >
> > The last two were mentioned in my last release update, but I don't
> > seem to find any definitive conclusion.  x86 maintainers, can you
> > please confirm ?
> 
> There is not consensus on whether the change is correct, although I
> admit it had fallen off my radar.
> 
> All it is doing is introducing two ASSERT_UNREACHABLE()'s.  It's not
> critical for 4.16 at this point.

OK, thanks for the information.  It sounds like this might be debated.
So if anyone disagrees, and thinks I ought to have this on my 4.16
radar, please let me know.

Meanwhile I just committed the EFI alignment fix, which was the one
other outstanding item.  It's too quiet.  I'm expecting a monster to
jump out at any moment...

Ian.

