Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F5CA57707
	for <lists+xen-devel@lfdr.de>; Sat,  8 Mar 2025 01:48:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905506.1313316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqiMb-0001vt-2Y; Sat, 08 Mar 2025 00:48:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905506.1313316; Sat, 08 Mar 2025 00:48:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqiMa-0001tg-W6; Sat, 08 Mar 2025 00:48:24 +0000
Received: by outflank-mailman (input) for mailman id 905506;
 Sat, 08 Mar 2025 00:48:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7c++=V3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tqiMa-0001ta-At
 for xen-devel@lists.xenproject.org; Sat, 08 Mar 2025 00:48:24 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 092a2825-fbb7-11ef-9ab7-95dc52dad729;
 Sat, 08 Mar 2025 01:48:22 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 53991A453A9;
 Sat,  8 Mar 2025 00:42:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1998AC4CED1;
 Sat,  8 Mar 2025 00:48:19 +0000 (UTC)
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
X-Inumbo-ID: 092a2825-fbb7-11ef-9ab7-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741394901;
	bh=H5oYHhqH4NzBGtKxHm2Nw6mnKCEyM983o340HFIuPQk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OGSYGPRAg8EhBmdTL4nPd6mRVcVCqqz5v9UL32tAJlgoASMyqBN74DLJcscPfCNFW
	 tS/0ttVCcH0wahZZ7Wez+/RoJPAvq4J0YJUIlugzDrjGcAolvi+0vC2jPB9CGAAyol
	 jyM/lhgyT8uJDu71kQaRJird4X7pb3vuH+U6Q2sn82cYEA4jk5sE3HVpi8AoXh/Z0S
	 UGMaa+CtNB/8lBqlWqJLHYyL4zI395neMgC6gL3wLHAHK+Rw6Y7AAXa45em6OKDA+S
	 k2mNvQ009iCuuHwA94Qedg/n7HF+DHSCz65B5BAzk9xnzQYccC21XfK0HlbHxLBWV2
	 PjNzBSBsMSPoA==
Date: Fri, 7 Mar 2025 16:48:19 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 08/23] xen/arm: dom0less seed xenstore grant table
 entry
In-Reply-To: <d002aef4-3511-4e9b-8ff2-34bb268d9d7d@amd.com>
Message-ID: <alpine.DEB.2.22.394.2503071642470.3032631@ubuntu-linux-20-04-desktop>
References: <20250306220343.203047-1-jason.andryuk@amd.com> <20250306220343.203047-9-jason.andryuk@amd.com> <4c66ad14-9a30-48e5-aae1-49f61efaaf67@xen.org> <d002aef4-3511-4e9b-8ff2-34bb268d9d7d@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-435799868-1741394695=:3032631"
Content-ID: <alpine.DEB.2.22.394.2503071645100.3032631@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-435799868-1741394695=:3032631
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2503071645101.3032631@ubuntu-linux-20-04-desktop>

On Fri, 7 Mar 2025, Jason Andryuk wrote:
> On 2025-03-07 16:24, Julien Grall wrote:
> > Hi,
> > 
> > On 06/03/2025 22:03, Jason Andryuk wrote:
> > > With a split hardware and control domain, the control domain may still
> > > want and xenstore access.  Currently this relies on init-dom0less to
> > > seed the grants.  This is problematic since we don't want hardware
> > > domain to be able to map the control domain's resources.  Instead have
> > > the hypervisor see the grant table entry.  The grant is then accessible
> > > as normal.
> > 
> > I am probably missing something, but why would run xenstored in the hardware
> > domain rather than the control domain? Isn't xenstored more related to the
> > VM management than HW?
> 
> I addressed this in my other email.  You're probably right that xenstored
> should run in control, but implementation details prevent that in the short
> term.

I wrote a longer reply here:
https://marc.info/?l=xen-devel&m=174139414000462

I think there are valid reasons to run xenstored in either the control
domain or the hardware domain, so it should be configurable. If no
specific preference is indicated, I would place it in the hardware
domain because the control domain must remain free from interference.
Given that I don't think we know for sure today whether the Xenstore
protocol could be a potential vector for interference, it is safer to
avoid placing it in the control domain by default.


> Regardless, of the xenstored placement, I think it's a better design for Xen
> to seed the grants.  With Xen allocating the xenstore page and event channel,
> and now seeding the grant table, they can just be used.  A xenstore stubdom
> can just establish all the connections without relying on another domain to
> perform an action.

+1


> I tested that with hyperlaunching the xenstore stubdom.  That is where the two
> XS_PRIV changes later in the series come from.  xenstore stubdom iterates the
> domains, reads the hvm_param for the event channel, and then runs introduce to
> set up the connection.
--8323329-435799868-1741394695=:3032631--

