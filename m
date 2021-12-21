Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A7B47B664
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 01:08:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250067.430664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzShQ-0006lW-9a; Tue, 21 Dec 2021 00:08:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250067.430664; Tue, 21 Dec 2021 00:08:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzShQ-0006ij-57; Tue, 21 Dec 2021 00:08:12 +0000
Received: by outflank-mailman (input) for mailman id 250067;
 Tue, 21 Dec 2021 00:08:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mNu3=RG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mzShO-0006id-3W
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 00:08:10 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12fc7957-61f2-11ec-8d39-b1a4ed000e3e;
 Tue, 21 Dec 2021 01:08:08 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7AADA61312;
 Tue, 21 Dec 2021 00:08:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51DEEC36AE5;
 Tue, 21 Dec 2021 00:08:05 +0000 (UTC)
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
X-Inumbo-ID: 12fc7957-61f2-11ec-8d39-b1a4ed000e3e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640045285;
	bh=m/V69/L3GRumk/tGw24ozKLLORhjpngJJBJb+1eSo9A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GljYABVYuQWMLH0kC+Ylq4wje+KXupo1JxS8T/nmTZyLA/9+/o+LhDaRPh+rZd2yR
	 RT7BUWIrwO4wd/FgsRahBxmU3/WBMnCOW9rSynPddR/9TQEiipxVdDrzKCHyySTl+Z
	 RiLP2hkqypBLTp/Ot+DxxH+2WY7v1hLLHzfoY+a1fedoR7mzu9oL7ZSf+U1X7ktLqj
	 EvT+SLIqfGtRWId5O7BAGzE5ooB7/HSFzPwSO493O5wLwqia7LAOr3N1Sg5Cu1xc2+
	 YcFRJzj6Qh+g5loAxYDoklOnJMd3Ys0r9eytuGi3JLVa4ZS7K8OvMGUnWjmvymF+zS
	 H4WJ9zrTH0UBg==
Date: Mon, 20 Dec 2021 16:08:04 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>, 
    xen-devel@lists.xenproject.org, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH v3 02/13] xen: harmonize return types of hypercall
 handlers
In-Reply-To: <df06a42a-89a2-625e-25a3-da0090cc7bc7@xen.org>
Message-ID: <alpine.DEB.2.22.394.2112201545360.2060010@ubuntu-linux-20-04-desktop>
References: <20211208155606.20029-1-jgross@suse.com> <20211208155606.20029-3-jgross@suse.com> <7dd419c1-9ad0-798e-317b-71c8e613ff3e@xen.org> <4e9947b6-08b4-4ac6-9cfe-538c3b34175e@suse.com> <alpine.DEB.2.22.394.2112151757410.3376@ubuntu-linux-20-04-desktop>
 <c650062f-948e-569d-d4fa-e5333867854e@suse.com> <alpine.DEB.2.22.394.2112161232310.3376@ubuntu-linux-20-04-desktop> <alpine.DEB.2.22.394.2112161246180.3376@ubuntu-linux-20-04-desktop> <29c14fd7-4ae2-a277-2413-faa330afc49b@suse.com>
 <67d3c4da-9a20-24ca-543f-02ecf4676277@suse.com> <287c8fba-b22f-95ec-21d4-e440e7e7fb36@suse.com> <e41d26aa-9ef5-459a-c143-caf28e43c47c@xen.org> <a91217dc-8f97-2882-ce08-2a408654295e@suse.com> <alpine.DEB.2.22.394.2112171459490.1662642@ubuntu-linux-20-04-desktop>
 <df06a42a-89a2-625e-25a3-da0090cc7bc7@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1340185955-1640044016=:2060010"
Content-ID: <alpine.DEB.2.22.394.2112201551360.2060010@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1340185955-1640044016=:2060010
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2112201551361.2060010@ubuntu-linux-20-04-desktop>

On Mon, 20 Dec 2021, Julien Grall wrote:
> On 18/12/2021 00:00, Stefano Stabellini wrote:
> > On Fri, 17 Dec 2021, Juergen Gross wrote:
> > > On 17.12.21 11:41, Julien Grall wrote:
> > > > Hi Juergen,
> > > > 
> > > > On 17/12/2021 08:50, Juergen Gross wrote:
> > > > > On 17.12.21 08:45, Jan Beulich wrote:
> > > > > > On 17.12.2021 06:34, Juergen Gross wrote:
> > > > > > > On 16.12.21 22:15, Stefano Stabellini wrote:
> > > > > > > > On Thu, 16 Dec 2021, Stefano Stabellini wrote:
> > > > > > > > > On Thu, 16 Dec 2021, Juergen Gross wrote:
> > > > > > > > > > On 16.12.21 03:10, Stefano Stabellini wrote:
> > > > > > > > > > > The case of XENMEM_maximum_ram_page is interesting but it
> > > > > > > > > > > is
> > > > > > > > > > > not a
> > > > > > > > > > > problem in reality because the max physical address size
> > > > > > > > > > > is
> > > > > > > > > > > only 40-bit
> > > > > > > > > > > for aarch32 guests, so 32-bit are always enough to return
> > > > > > > > > > > the
> > > > > > > > > > > highest
> > > > > > > > > > > page in memory for 32-bit guests.
> > > > > > > > > > 
> > > > > > > > > > You are aware that this isn't the guest's max page, but the
> > > > > > > > > > host's?
> > > > > > > > 
> > > > > > > > I can see now that you meant to say that, no matter what is the
> > > > > > > > max
> > > > > > > > pseudo-physical address supported by the VM,
> > > > > > > > XENMEM_maximum_ram_page
> > > > > > > > is
> > > > > > > > supposed to return the max memory page, which could go above the
> > > > > > > > addressibility limit of the VM.
> > > > > > > > 
> > > > > > > > So XENMEM_maximum_ram_page should potentially be able to return
> > > > > > > > (1<<44)
> > > > > > > > even when called by an aarch32 VM, with max IPA 40-bit.
> > > > > > > > 
> > > > > > > > I would imagine it could be useful if dom0 is 32-bit but domUs
> > > > > > > > are
> > > > > > > > 64-bit on a 64-bit hypervisor (which I think it would be a very
> > > > > > > > rare
> > > > > > > > configuration on ARM.)
> > > > > > > > 
> > > > > > > > Then it looks like XENMEM_maximum_ram_page needs to be able to
> > > > > > > > return a
> > > > > > > > value > 32-bit when called by a 32-bit guest.
> > > > > > > > 
> > > > > > > > The hypercall ABI follows the ARM C calling convention, so a
> > > > > > > > 64-bit
> > > > > > > > value should be returned using r0 and r1. But looking at
> > > > > > > > xen/arch/arm/traps.c:do_trap_hypercall, it doesn't seem it ever
> > > > > > > > sets
> > > > > > > > r1
> > > > > > > > today. Only r0 is set, so effectively we only support 32-bit
> > > > > > > > return
> > > > > > > > values on aarch32 and for aarch32 guests.
> > > > > > > > 
> > > > > > > > In other words, today all hypercalls on ARM return 64-bit to
> > > > > > > > 64-bit
> > > > > > > > guests and 32-bit to 32-bit guests. Which in the case of
> > > > > > > > memory_op
> > > > > > > > is
> > > > > > > > "technically" the correct thing to do because it matches the C
> > > > > > > > declaration in xen/include/xen/hypercall.h:
> > > > > > > > 
> > > > > > > > extern long
> > > > > > > > do_memory_op(
> > > > > > > >        unsigned long cmd,
> > > > > > > >        XEN_GUEST_HANDLE_PARAM(void) arg);
> > > > > > > > 
> > > > > > > > So...  I guess the conclusion is that on ARM do_memory_op should
> > > > > > > > return
> > > > > > > > "long" although it is not actually enough for a correct
> > > > > > > > implementation
> > > > > > > > of XENMEM_maximum_ram_page for aarch32 guests ?
> > > > > > > > 
> > > > > > > 
> > > > > > > Hence my suggestion to check the return value of _all_ hypercalls
> > > > > > > to
> > > > > > > be
> > > > > > > proper sign extended int values for 32-bit guests. This would fix
> > > > > > > all
> > > > > > > potential issues without silently returning truncated values.
> > > > > > 
> > > > > > Are we absolutely certain we have no other paths left where a
> > > > > > possibly
> > > > > > large unsigned values might be returned? In fact while
> > > > > > compat_memory_op() does the necessary saturation, I've never been
> > > > > > fully
> > > > > > convinced of this being the best way of dealing with things. The
> > > > > > range
> > > > > > of error indicators is much smaller than [-INT_MIN,-1], so almost
> > > > > > double the range of effectively unsigned values could be passed back
> > > > > > fine. (Obviously we can't change existing interfaces, so this mem-op
> > > > > > will need to remain as is.)
> > > > > 
> > > > > In fact libxenctrl tries do deal with this fact by wrapping a
> > > > > memory_op
> > > > > for a 32-bit environment into a multicall. This will work fine for a
> > > > > 32-bit Arm guest, as xen_ulong_t is a uint64 there.
> > > > > 
> > > > > So do_memory_op should return long on Arm, yes. OTOH doing so will
> > > > > continue to be a problem in case a 32-bit guest doesn't use the
> > > > > multicall technique for handling possible 64-bit return values.
> > > > > 
> > > > > So I continue to argue that on Arm the return value of a hypercall
> > > > > should be tested to fit into 32 bits.
> > > > 
> > > > It would make sense. But what would you return if the value doesn't fit?
> > > 
> > > I guess some errno value would be appropriate, like -EDOM, -ERANGE or
> > > -E2BIG.
> > 
> > This seems to be better than the alternative below as it is a lot
> > simpler.
> 
> We would still need to special case XENMEM_maximum_reservation (or rework the
> implementation of the sub-op) because the value returned is an unsigned long.
> So technically, the unsigned value for -EDOM & co could be interpreted as the
> maximum host frame number.
> 
> I also would like to see the hypercall returning 'int' when they are only
> meant to return 32-bit value. This will make easier to spot someone that
> decide to return a 64-bit value.

I am completely aligned with you on both points.

XENMEM_maximum_reservation is a bit of a distraction given that is
unused (even unsupported?) on ARM. In general, to switch to "int" as
return type we would have to (manually) check that all the sub-ops of a
given hypercall return 32-bit values, right? Otherwise, how can we be
sure that we don't start to silently truncate the top 32-bit on a sub-op
on arm64?

In theory we could use -Wconversion to automatically spot any
truncations but unfortunately -Wconversion breaks the build at the
moment.
--8323329-1340185955-1640044016=:2060010--

