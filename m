Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAB738B428
	for <lists+xen-devel@lfdr.de>; Thu, 20 May 2021 18:23:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131037.245119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljlQe-0001i2-0X; Thu, 20 May 2021 16:21:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131037.245119; Thu, 20 May 2021 16:21:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljlQd-0001eq-Tg; Thu, 20 May 2021 16:21:43 +0000
Received: by outflank-mailman (input) for mailman id 131037;
 Thu, 20 May 2021 16:21:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VWqy=KP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ljlQc-0001ek-Mg
 for xen-devel@lists.xenproject.org; Thu, 20 May 2021 16:21:42 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2c6911a5-8bc0-4ee0-a171-8eec5c704666;
 Thu, 20 May 2021 16:21:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AD8D16128A;
 Thu, 20 May 2021 16:21:40 +0000 (UTC)
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
X-Inumbo-ID: 2c6911a5-8bc0-4ee0-a171-8eec5c704666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1621527700;
	bh=YMVfveNMim4AYPmvuG50EyQ/1XFPJJUMxIc5vnIzvtA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pjjwSBNnda/hTfwhMvvj/dG2HD4u3a4nUzcnm58HAorcT/GWzbNGvvaWD5kYuTL0s
	 JohZuTCjAjR+sxCy2gosXMTJTiT90glDIPMwBw6hPyGSAlDRO/PKGbPYxux65oiw1E
	 /q4ZHGwMMMgJh33rs3Vl9AL+um+52IiF2ZUPlhHL1wpRTLjmOMHWYhXJ7ZRRnSboJp
	 UpJ4dl0n9zzW/Omtm7AzT3zM4mM866aavtJBG3iEmGW3dvXZkXCPQfqKxEs7bbWwST
	 HLOd5v09cDhgM1JqBcu6yafW7S86TVi7AYmHVYeXPdWepE9sD4os92HrHpjk61Lr/o
	 GyIPMOxKKwy4Q==
Date: Thu, 20 May 2021 09:21:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Elliott Mitchell <ehem+xen@m5p.com>, xen-devel@lists.xenproject.org, 
    Roger Pau Monn?? <royger@freebsd.org>, Mitchell Horne <mhorne@freebsd.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Uses of /hypervisor memory range (was: FreeBSD/Xen/ARM issues)
In-Reply-To: <b6fe6e06-517c-ee4c-5b71-a1bee4d4df13@xen.org>
Message-ID: <alpine.DEB.2.21.2105200919100.14426@sstabellini-ThinkPad-T480s>
References: <YIptpndhk6MOJFod@Air-de-Roger> <YItwHirnih6iUtRS@mattapan.m5p.com> <YIu80FNQHKS3+jVN@Air-de-Roger> <YJDcDjjgCsQUdsZ7@mattapan.m5p.com> <YJURGaqAVBSYnMRf@Air-de-Roger> <YJYem5CW/97k/e5A@mattapan.m5p.com> <YJs/YAgB8molh7e5@mattapan.m5p.com>
 <54427968-9b13-36e6-0001-27fb49f85635@xen.org> <YJ3jlGSxs60Io+dp@mattapan.m5p.com> <93936406-574f-7fd0-53bf-3bafaa4b1947@xen.org> <YJ8hTE/JbJygtVAL@mattapan.m5p.com> <f7360dac-5d83-733b-7ec5-c73d4dc0350d@xen.org> <alpine.DEB.2.21.2105191611540.14426@sstabellini-ThinkPad-T480s>
 <b6fe6e06-517c-ee4c-5b71-a1bee4d4df13@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 20 May 2021, Julien Grall wrote:
> On 20/05/2021 00:25, Stefano Stabellini wrote:
> > On Sat, 15 May 2021, Julien Grall wrote:
> > > > My feeling is one of two things should happen with the /hypervisor
> > > > address range:
> > > > 
> > > > 1>  OSes could be encouraged to use it for all foreign mappings.  The
> > > > range should be dynamic in some fashion.  There could be a handy way to
> > > > allow configuring the amount of address space thus reserved.
> > > 
> > > In the context of XSA-300 and virtio on Xen on Arm, we discussed about
> > > providing a revion for foreign mapping. The main trouble here is figuring
> > > out
> > > of the size, if you mess it up then you may break all the PV drivers.
> > > 
> > > If the problem is finding space, then I would like to suggest a different
> > > approach (I think I may have discussed it with Andrew). Xen is in
> > > maintaining
> > > the P2M for the guest and therefore now where are the unallocated space.
> > > How
> > > about introducing a new hypercall to ask for "unallocated space"?
> > > 
> > > This would not work for older hypervisor but you could use the RAM instead
> > > (as
> > > Linux does). This is has drawbacks (e.g. shattering superpage, reducing
> > > the
> > > amount of memory usuable...), but for 1> you would also need a hack for
> > > older
> > > Xen.
> > 
> > I am starting to wonder if it would make sense to add a new device tree
> > binding to describe larger free region for foreign mapping rather then a
> > hypercall. It could be several GBs or even TBs in size. I like the idea
> > of having it device tree because after all this is static information.
> > I can see that a hypercall would also work and I am open to it but if
> > possible I think it would be better not to extend the hypercall
> > interface when there is a good alternative.
> 
> There are two issues with the Device-Tree approach:
>   1) This doesn't work on ACPI
>   2) It is not clear how to define the size of the region. An admin doesn't
> have the right information in hand to know how many mappings will be done (a
> backend may map multiple time the same page).
> 
> The advantage of the hypercall solution is the size is "virtually" unlimited
> and not based on a specific firmware.

Fair enough

