Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC59234A67E
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 12:37:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101710.194666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPklx-00081t-4Z; Fri, 26 Mar 2021 11:37:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101710.194666; Fri, 26 Mar 2021 11:37:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPklx-00081U-1K; Fri, 26 Mar 2021 11:37:01 +0000
Received: by outflank-mailman (input) for mailman id 101710;
 Fri, 26 Mar 2021 11:36:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPklv-00081O-F9
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 11:36:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPklu-0005ay-U4
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 11:36:58 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPklu-0007Pl-Rt
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 11:36:58 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lPklp-0002Gb-TO; Fri, 26 Mar 2021 11:36:53 +0000
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
	bh=QIfN6CmwRgEg/5txXuQ41bQ8Q+OhF87anZVPIZJ5OrI=; b=MIp13Ut7Do5VwtsJlXBuXlMn+m
	eO/uiE0vRh6So9ZSutLGNDV4tPfrQJwtgoqCr1OXuEHAFCK04ZqvOn/KCX7/2Anx1dIWntW9/iTBQ
	lMaffBkSF+YjghSIpQF2XfV4fJ7aN02XbYFFR2rKY30j3ZmsbkwV2/EFSh8xlApYbKoA=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24669.51029.465080.822794@mariner.uk.xensource.com>
Date: Fri, 26 Mar 2021 11:36:53 +0000
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
    Xen-devel <xen-devel@lists.xenproject.org>,
    Jan Beulich <jbeulich@suse.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.15] x86/mem_sharing: copy parent VM's hostp2m's
 max_mapped_pfn during forking
In-Reply-To: <CABfawhmscVPFX6QM4Sfcpo=MjPn4xrfDcBcDmqpFc7awdut2jw@mail.gmail.com>
References: <bdeaf7893acd6497cc2b88f3a1357d1299960e9b.1616103095.git.tamas.lengyel@intel.com>
	<CABfawhmscVPFX6QM4Sfcpo=MjPn4xrfDcBcDmqpFc7awdut2jw@mail.gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Tamas K Lengyel writes ("Re: [PATCH for-4.15] x86/mem_sharing: copy parent VM's hostp2m's max_mapped_pfn during forking"):
> On Thu, Mar 18, 2021 at 5:36 PM Tamas K Lengyel <tamas.lengyel@intel.com> wrote:
> >
> > When creating a VM fork copy the parent VM's hostp2m max_mapped_pfn value. Some
> > toolstack relies on the XENMEM_maximum_gpfn value to establish the maximum
> > addressable physical memory in the VM and for forks that have not yet been
> > unpaused that value is not going to reflect the correct max gpfn that's
> > possible to populate into the p2m. This patch fixes the issue.
...
> CC-ing Ian as 4.15 release manager. This patch is safe to include in
> 4.15 as it's a minor fix in a tech preview feature that's not even
> compiled by default.

As far as I can tell this patch is lacking a maintainer review ?

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

*Provided that it is committed today*  I'm not sure how likely that is.

Thanks,
Ian.

