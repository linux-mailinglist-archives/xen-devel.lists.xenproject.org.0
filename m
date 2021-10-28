Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3933C43E586
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 17:55:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218164.378485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg7k9-0005ka-LV; Thu, 28 Oct 2021 15:55:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218164.378485; Thu, 28 Oct 2021 15:55:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg7k9-0005iJ-Gu; Thu, 28 Oct 2021 15:55:05 +0000
Received: by outflank-mailman (input) for mailman id 218164;
 Thu, 28 Oct 2021 15:55:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mg7k7-0005iD-VJ
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 15:55:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mg7k7-0002MB-Sx
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 15:55:03 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mg7k7-0003lf-S6
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 15:55:03 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mg7k2-0002Zf-AA; Thu, 28 Oct 2021 16:54:58 +0100
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
	bh=XKsSmWH6fEEInPTeowmJjPBExAxFn3B2Cx2v8gh8Gkc=; b=WCdg6XN8g1xt9YEd1SV+H7e3fM
	f4IU2LpRnVcaMxjk11V/hr/H2kkGz5uJnxWlCmkN5GXudtKXFdhMFn5LqdY65SaBdkIY/dDSN/nW7
	wxwSsyt3AOloIfwDQdKOnC3vgj+SBgxdSHdazDtz+SGrbXXqW129oXVIYoUaKA88cb2o=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24954.51153.588540.850154@mariner.uk.xensource.com>
Date: Thu, 28 Oct 2021 16:54:57 +0100
To: Julien Grall <julien@xen.org>
Cc: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    "sstabellini\@kernel.org" <sstabellini@kernel.org>,
    "iwj\@xenproject.org" <iwj@xenproject.org>,
    Bertrand Marquis <bertrand.marquis@arm.com>,
    Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers
In-Reply-To: <a74b52fb-6514-4187-17fe-b63236efa0ce@xen.org>
References: <20211027082533.1406015-1-andr2000@gmail.com>
	<cb7e9ef7-476e-93c3-d3c9-9a9ebc61003d@xen.org>
	<d63c6e0b-8aa3-9ba3-893c-5e464638a8db@epam.com>
	<65886734-7333-4469-fcc1-6916db708f13@xen.org>
	<b6bb02b6-6358-b5e0-1b80-7819aadabe10@epam.com>
	<6d8f1061-7aec-2c1a-aaf4-c30440c2797a@xen.org>
	<38da2edd-06a2-63d0-51ad-1284272c8da5@epam.com>
	<a74b52fb-6514-4187-17fe-b63236efa0ce@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("Re: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers"):
> On 28/10/2021 16:27, Oleksandr Andrushchenko wrote:
> > bridge as private and using info->gpa - GUEST_VPCI_ECAM_BASE...
> > So, I would stay with simpler
> > 
> >       if ( bridge )
> >          {
> >              sbdf.sbdf = VPCI_ECAM_BDF(info->gpa - bridge->cfg->phys_addr);
> >              sbdf.seg = bridge->segment;
> >          }
> >          else
> >              sbdf.sbdf = VPCI_ECAM_BDF(info->gpa - GUEST_VPCI_ECAM_BASE);
> 
> I am fine with that so long this is part of an helper (maybe 
> vpci_sbdf_from_addr()) rather than duplicated.

There are a number of patches that I'm getting CC'd on related to ARM
and vpci (according to the Subject).  Are these targeted for 4.16 ?
Most of them don't have 4.16 Subject tags.

Am I getting these in my capacity as a REST maintainer ?

I am finding it difficult to see the wood for the trees.
It would be really helpful if these vpci fixes were collected
together into a series.

Thanks,
Ian.
(writing as Xen 4.16 Release Manager)

