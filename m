Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B9D42EE9A
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 12:15:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210177.366934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbKEg-0008Qy-1H; Fri, 15 Oct 2021 10:14:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210177.366934; Fri, 15 Oct 2021 10:14:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbKEf-0008PB-US; Fri, 15 Oct 2021 10:14:45 +0000
Received: by outflank-mailman (input) for mailman id 210177;
 Fri, 15 Oct 2021 10:14:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mbKEe-0008P3-KP
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 10:14:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mbKEe-0001NJ-It
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 10:14:44 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mbKEe-0003hP-Hy
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 10:14:44 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mbKEJ-0005Kl-R4; Fri, 15 Oct 2021 11:14:23 +0100
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
	bh=H6pztpx/uFpPKE+XGY0rm2RF+c8Zb5Y4KFjJQfNb56Y=; b=agums+b5LVi4wtLwRP1Qr6Ea7t
	6WspI73DF0wk7oknqp+4ysEp3xitOVcaKOAcGEepU3OEPjiVjsiJ29W1GWVwTBjkFeGw3SgcmmVIh
	q8AkwvyH8zYJRHY4ss7OP0+39T0ZlVE5EuGJNHy9Z1XIVYkoxD1161aI4CKu5e7niFkA=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24937.21631.538303.29471@mariner.uk.xensource.com>
Date: Fri, 15 Oct 2021 11:14:23 +0100
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Jan Beulich <jbeulich@suse.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    "iwj\@xenproject.org" <iwj@xenproject.org>,
    Rahul Singh <Rahul.Singh@arm.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Julien Grall <julien@xen.org>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Wei  Liu <wl@xen.org>,
    Paul Durrant <paul@xen.org>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 2/3] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
In-Reply-To: <57A39480-34DF-4BF5-9B0E-802D30F94BBD@arm.com>
References: <cover.1634221830.git.bertrand.marquis@arm.com>
	<396b08e2598cf0338e0c7f4ad3cd5cb66db89224.1634221830.git.bertrand.marquis@arm.com>
	<f41f59f7-69ed-e2fe-dc17-434b456cf693@suse.com>
	<57A39480-34DF-4BF5-9B0E-802D30F94BBD@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Bertrand Marquis writes ("Re: [PATCH v6 2/3] xen/arm: Enable the existing x86 virtual PCI support for ARM."):
> > On 15 Oct 2021, at 09:00, Jan Beulich <jbeulich@suse.com> wrote:
> > The latter is fine to be put here (i.e. FTAOD I'm fine with it
> > staying here). For the former I even question its original placement
> > in asm-x86/pci.h: It's not generally correct as per the PCI spec, as
> > the bus portion of the address can be anywhere from 1 to 8 bits. And
> > in fact there is a reason why this macro was/is used in only a
> > single place, but not e.g. in x86'es handling of physical MCFG. It
> > is merely an implementation choice in vPCI that the entire segment 0
> > has a linear address range covering all 256 buses. Hence I think
> > this wants to move to xen/vpci.h and then perhaps also be named
> > VPCI_ECAM_BDF().
> 
> On previous version it was request to renamed this to ECAM and agreed
> to put is here. Now you want me to rename it to VPCI and move it again.
> I would like to have a confirmation that this is ok and the final move if possible.
> 
> @Roger can you confirm this is what is wanted ?

I think Roger is not available today I'm afraid.

Bertrand, can you give me a link to the comment from Roger ?
Assuming that it says what I think it will say:

I think the best thing to do will be to leave the name as it was in
the most recent version of your series.  I don't think it makes sense
to block this patch over a naming disagreement.  And it would be best
to minimise unnecessary churn.

I would be happy to release-ack a name change (perhaps proposed bo Jan
or Roger) supposing that that is the ultimate maintainer consensus.

Jan, would that approach be OK with you ?

Ian.

