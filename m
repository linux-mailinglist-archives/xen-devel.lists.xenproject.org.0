Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A7142BF43
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 13:54:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208277.364341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1macoY-0007E6-NK; Wed, 13 Oct 2021 11:52:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208277.364341; Wed, 13 Oct 2021 11:52:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1macoY-0007BY-Jl; Wed, 13 Oct 2021 11:52:54 +0000
Received: by outflank-mailman (input) for mailman id 208277;
 Wed, 13 Oct 2021 11:52:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1macoX-0007BS-Lk
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 11:52:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1macoX-0003lF-Fp
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 11:52:53 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1macoX-0000tV-Er
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 11:52:53 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1macoK-0007S5-Mc; Wed, 13 Oct 2021 12:52:40 +0100
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
	bh=2WT0kmTFC401nOY6M3W3ge4h8W9JrHrW5ZPpi0UGoSk=; b=sP5GiQbNM2L8mqQTBYSkou6WQC
	drzvEmYIy+NCdOHZcp6IrweYv5EWDMF4WSee/+1u0KdiPRVJbvrxI4oNR27nnHntXywX+M+cUvXpU
	DPme82L4ftb1mWRCCPrZ8b3FYRNeg14k0Mlz7+89K4Jn/VGTH1Vsaj/T7Ar65wW3e+Z4=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24934.51335.791795.638185@mariner.uk.xensource.com>
Date: Wed, 13 Oct 2021 12:52:39 +0100
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
    Bertrand Marquis <Bertrand.Marquis@arm.com>,
    Jan Beulich <jbeulich@suse.com>,
    Oleksandr  Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
    Rahul Singh <Rahul.Singh@arm.com>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andre Przywara <Andre.Przywara@arm.com>,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not
 supported on ARM.
In-Reply-To: <YWaTztHHHeghjxDR@MacBook-Air-de-Roger.local>
References: <0744b957-1832-dff2-9ae2-b8e8534f501b@suse.com>
	<c3952fd5-b893-4cb6-a9bc-325a89e859db@epam.com>
	<c125b447-53e8-7d13-3b08-af62fd3a9140@suse.com>
	<c6b6c22f-fb8a-f2d9-7735-f1ebc9809908@epam.com>
	<09656882-b297-7144-c291-1ee997edb119@suse.com>
	<69A83587-B7E0-4653-AF8C-AEE802922CE5@arm.com>
	<24933.41349.893363.203683@mariner.uk.xensource.com>
	<AB6D62B6-2ED2-4957-A933-08EC77A4DFD6@arm.com>
	<24933.47094.43672.782143@mariner.uk.xensource.com>
	<alpine.DEB.2.21.2110121319150.9408@sstabellini-ThinkPad-T480s>
	<YWaTztHHHeghjxDR@MacBook-Air-de-Roger.local>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monné writes ("Re: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not supported on ARM."):
> On Tue, Oct 12, 2021 at 01:42:22PM -0700, Stefano Stabellini wrote:
> > I don't think it is about performance. From a performance point of view,
> > we could make as many (unneeded) hypercalls as required. It is mostly
> > about minimizing unwanted changes to common libxl code. Let me explain.

Thanks.  This summary is helpful  And, pleasingly, it matches what I
had thought I had gleaned from the thread.

> > All options above achieve the goal of a successful domain creation with
> > PCI device assigned on ARM. You might be able to think of other options
> > as well. I think noone here is really set on using one option over the
> > other -- as long as xc_domain_ioport_permission failures don't turn into
> > domain creation failures on ARM we are good.
> 
> I think having a libxl_arch_io_ports_supported helper could be the
> cleaner way to do this. For x86 it will unconditionally return true,
> while for Arm you could consider poking at
> XEN_DOMCTL_ioport_permission and see if it returns ENOSYS or
> otherwise.

> I guess it's possible that in the future we allow IO ports access on
> Arm guests using some kind of emulated mechanism if the need arises,
> at which point the hypercall will be implemented.

I agree with Roger.

So I think I would like to see a version of this patch which

  * Introduces libxl_arch_io_ports_supported.  (I am fine with it just
    returning false, unconditionally on Arm, ie in libxl_arm.c.)

  * Has a commit message explaining what is actually going on.
    Cutting and pasting liberally from your email seems like it would
    be a very good starting point.  Even discussion of rejected
    alternatives is fine, if it seems like it fits.  I'm quite
    unlikely to object to a commit message on grounds that it's too
    long.

Thanks,
Ian.

