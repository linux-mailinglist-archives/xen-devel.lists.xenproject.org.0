Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7470542576F
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 18:12:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203838.358985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYVzw-0001ej-8E; Thu, 07 Oct 2021 16:11:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203838.358985; Thu, 07 Oct 2021 16:11:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYVzw-0001c4-5H; Thu, 07 Oct 2021 16:11:56 +0000
Received: by outflank-mailman (input) for mailman id 203838;
 Thu, 07 Oct 2021 16:11:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mYVzu-0001by-HE
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 16:11:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mYVzu-0007hB-5u
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 16:11:54 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mYVzu-0002YI-59
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 16:11:54 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mYVzn-0006tj-W3; Thu, 07 Oct 2021 17:11:48 +0100
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
	bh=bNKObHLvuYHl9RRVVlwnULETAyQzOqANMlh/V3j4NUM=; b=x2K4LBapGsb4ob13njGRroJD4o
	EwY1uEcRVMTfnhUgl4LPrZc3j5Rz4mdfjI09U+QklBMAyc6GqBcjw4Jpo3uuf33Tr6zDi/3Rvgdv8
	/YPFge6YmpCZnFI7ngx7WYoaBoH28JGIFA9FPABvsIKNQyVtZKUD84OyiRbzshZ/EFYA=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24927.7235.736221.270358@mariner.uk.xensource.com>
Date: Thu, 7 Oct 2021 17:11:47 +0100
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: Ian Jackson <iwj@xenproject.org>,
    Julien Grall <julien@xen.org>,
    xen-devel <xen-devel@lists.xenproject.org>,
    Bertrand Marquis <Bertrand.Marquis@arm.com>,
    Andre Przywara <Andre.Przywara@arm.com>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Juergen Gross <jgross@suse.com>,
    Stefano  Stabellini <sstabellini@kernel.org>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 10/11] arm/libxl: Emulated PCI device tree node in
 libxl
In-Reply-To: <294BE20A-7E45-405C-BC19-C292295E85E3@arm.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
	<b81b5dea800c8fe47071f3dbd20588b1e472fb99.1633540842.git.rahul.singh@arm.com>
	<7bdac405-a889-15e1-be19-5876f7253855@xen.org>
	<24926.53690.621007.507249@mariner.uk.xensource.com>
	<294BE20A-7E45-405C-BC19-C292295E85E3@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Rahul Singh writes ("Re: [PATCH v5 10/11] arm/libxl: Emulated PCI device tree node in libxl"):
> As Stefano suggested in another email that we can remove the vpci
> option, if we reach to conclusion that we need vpci option I will
> move it to internal structure.
...
> Yes I agree with you VPCI is necessary for hot plugged PCI device
> and once we implement the hotplug in future we will use the
> passthrough= option to enable VPCI.

So, to summarise, I think the situation is:

 * VCPI is necessry for passthrough on ARM, whether coldplug or
   hotplug.  It's part of the way that PCI-PT works on ARM.

 * Hotplug is not yet implemented.

 * VPCI is not necessary on x86 (evidently, since we don't have it
   there but we do have passthrough).

So when hotplug is added, vpci will need to be turned on when
passthrough=yes is selected.  I don't fully understand the other
possible values for passthrough= but maybe we can defer the question
of whether they apply to ARM ?

I think that means that yes, this should be an internal variable.
Probably in libxl__domain_create_state.  We don't currently arrange to
elide arch-specific state in there, so perhaps it's fine just to
invent a member called `arm_vpci`.

Maybe you could leave a comment somewhere so that if and when PCI PT
hotplug is implemented for ARM, the implementor remembers to wire this
up.

Ian.

