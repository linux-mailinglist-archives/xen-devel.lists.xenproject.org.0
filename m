Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9FC446664
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 16:48:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222510.384750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj1Rd-00041L-SR; Fri, 05 Nov 2021 15:47:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222510.384750; Fri, 05 Nov 2021 15:47:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj1Rd-0003yP-OW; Fri, 05 Nov 2021 15:47:57 +0000
Received: by outflank-mailman (input) for mailman id 222510;
 Fri, 05 Nov 2021 15:47:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mj1Rb-0003yJ-Ty
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 15:47:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mj1Rb-0001sN-P9
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 15:47:55 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mj1Rb-0005he-Na
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 15:47:55 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mj1RW-0006TW-9J; Fri, 05 Nov 2021 15:47:50 +0000
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
	bh=WK95rS3U7D7PlYqAjxWco2D1Q6J5eJ8pU+e/1MfMVf0=; b=yaoHUC+M2m7kYv1JQZypxVVeTF
	ilG+Jo+JsU2lD/L8No2Hi/Ow2X2qB7EAYqel+NSMSjkESvcBj3EDxFGQmsOc1p4MJh8EGoZZbKefW
	pOwS1Yp5qNM2TyGvDkoa6j5EqTQvLCx8kdcB+Sg+igKW3YLC+b98UfDVgY40ENZWMdbI=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24965.21029.795504.152439@mariner.uk.xensource.com>
Date: Fri, 5 Nov 2021 15:47:49 +0000
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <royger@FreeBSD.org>
Cc: Jan Beulich <jbeulich@suse.com>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/6][4.16?] x86/x2APIC: defer probe until after IOMMU
 ACPI table parsing
In-Reply-To: <YYVQAH7OYmFSVOei@Air-de-Roger>
References: <d88cfda3-54e4-2323-f536-547879380815@suse.com>
	<43d8cc88-aae0-5a82-7b4b-756dd54dd223@suse.com>
	<YYVQAH7OYmFSVOei@Air-de-Roger>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monné writes ("Re: [PATCH v2 1/6][4.16?] x86/x2APIC: defer probe until after IOMMU ACPI table parsing"):
> > 4.16: While investigating the issue addressed by the referenced commit,
> >       a variant of that problem was identified when firmware pre-enables
> >       x2APIC mode. Whether that's something sane firmware would do when
> >       at the same time IOMMU(s) is/are disabled is unclear, so this may
> >       be a purely academical consideration. Working around the problem
> >       also ought to be as simple as passing "iommu=no-intremap" on the
> >       command line. Considering the fragility of the code (as further
> >       demonstrated by v1 having been completely wrong), it may therefore
> >       be advisable to defer this change until after branching.

Thanks for the frank analysis.

> The main issue here would be missing a dependency between
> acpi_iommu_init and the rest of acpi_boot_init, apart from the
> existing dependencies between acpi_iommu_init and generic_apic_probe.

I have been thinking about this.  I'm still not sure.

> >       Nevertheless it will then be a backporting candidate, so
> >       considering to take it right away can't simply be put off.

This part confused me.  Under what circumstances would we backport
this ?  AIUI it would be backporting a potentially-fragile and
not-readily-testable bugfix, for a theoretical scenario with a
straightforward workaround.

Ian.

