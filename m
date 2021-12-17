Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C874A479769
	for <lists+xen-devel@lfdr.de>; Sat, 18 Dec 2021 00:06:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248944.429388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myMIY-0005uj-M1; Fri, 17 Dec 2021 23:05:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248944.429388; Fri, 17 Dec 2021 23:05:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myMIY-0005sJ-Iu; Fri, 17 Dec 2021 23:05:58 +0000
Received: by outflank-mailman (input) for mailman id 248944;
 Fri, 17 Dec 2021 23:05:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W3Ie=RC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1myMIW-0005sB-S3
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 23:05:56 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2a6b073-5f8d-11ec-9e60-abaf8a552007;
 Sat, 18 Dec 2021 00:05:55 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7E3F962420;
 Fri, 17 Dec 2021 23:05:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68A36C36AE2;
 Fri, 17 Dec 2021 23:05:52 +0000 (UTC)
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
X-Inumbo-ID: e2a6b073-5f8d-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639782352;
	bh=3Z9YdgFITzvF0joTJMlOEus/bWvGEmDXNpA1XgVLSgE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=peZwlui2RfjQ6OiY7BwjvO+qbI1FMFlBEfwZFopCpTMKgxPv88FlSBqOD1CBMLOtB
	 0DDCshFFbFIIrjznV4AdvRKbxQF6c6x8PMBlotBb0JDPgqZ5IP0G8wCcuwh56dkA4g
	 DVQ6B8XxuIU1qlcI78/PYNZSrql7VZ5KxnO+PEKUU5oFGkafGusZLZVTy/1WsOEsgH
	 /Mpd/s6mPuzcQ1f9ziEMuoUjMNSzmelAH3MmeCBVIn2OMoHwhyaRh6r64MpTrk1+be
	 8mZjdr83e3X7OlN4UVnM0vYKUxfY+nz5IK+zB8m4YzWRRzpVcvCptDUq4NEeUzqLFS
	 N6u6qdklxzfGw==
Date: Fri, 17 Dec 2021 15:05:52 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH v3 02/13] xen: harmonize return types of hypercall
 handlers
In-Reply-To: <7cabbc0b-f6bd-04a1-9552-8cecf7639b15@xen.org>
Message-ID: <alpine.DEB.2.22.394.2112171500360.1662642@ubuntu-linux-20-04-desktop>
References: <20211208155606.20029-1-jgross@suse.com> <20211208155606.20029-3-jgross@suse.com> <7dd419c1-9ad0-798e-317b-71c8e613ff3e@xen.org> <4e9947b6-08b4-4ac6-9cfe-538c3b34175e@suse.com> <alpine.DEB.2.22.394.2112151757410.3376@ubuntu-linux-20-04-desktop>
 <c650062f-948e-569d-d4fa-e5333867854e@suse.com> <alpine.DEB.2.22.394.2112161232310.3376@ubuntu-linux-20-04-desktop> <alpine.DEB.2.22.394.2112161246180.3376@ubuntu-linux-20-04-desktop> <7cabbc0b-f6bd-04a1-9552-8cecf7639b15@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 17 Dec 2021, Julien Grall wrote:
> Hi Stefano,
> 
> On 16/12/2021 21:15, Stefano Stabellini wrote:
> > On Thu, 16 Dec 2021, Stefano Stabellini wrote:
> > > On Thu, 16 Dec 2021, Juergen Gross wrote:
> > > > On 16.12.21 03:10, Stefano Stabellini wrote:
> > > > > On Wed, 15 Dec 2021, Juergen Gross wrote:
> > > > > > On 14.12.21 18:36, Julien Grall wrote:
> > > > > > > Hi,
> > > > > > > 
> > > > > > > On 08/12/2021 15:55, Juergen Gross wrote:
> > > > > > > > Today most hypercall handlers have a return type of long, while
> > > > > > > > the
> > > > > > > > compat ones return an int. There are a few exceptions from that
> > > > > > > > rule,
> > > > > > > > however.
> > > > > > > 
> > > > > > > So on Arm64, I don't think you can make use of the full 64-bit
> > > > > > > because a
> > > > > > > 32-bit domain would not be able to see the top 32-bit.
> > > > > > > 
> > > > > > > In fact, this could potentially cause us some trouble (see [1]) in
> > > > > > > Xen.
> > > > > > > So it feels like the hypercalls should always return a 32-bit
> > > > > > > signed
> > > > > > > value
> > > > > > > on Arm.
> > > > > > 
> > > > > > This would break hypercalls like XENMEM_maximum_ram_page which are
> > > > > > able
> > > > > > to return larger values, right?
> > > > > > 
> > > > > > > The other advantage is it would be clear that the top 32-bit are
> > > > > > > not
> > > > > > > usuable. Stefano, what do you think?
> > > > > > 
> > > > > > Wouldn't it make more sense to check the return value to be a sign
> > > > > > extended 32-bit value for 32-bit guests in do_trap_hypercall()
> > > > > > instead?
> > > > > > 
> > > > > > The question is what to return if this is not the case. -EDOM?
> > > > > 
> > > > > 
> > > > > I can see where Julien is coming from: we have been trying to keep the
> > > > > arm32 and arm64 ABIs identical since the beginning of the project. So,
> > > > > like Julien, my preference would be to always return 32-bit on ARM,
> > > > > both
> > > > > aarch32 and aarch64. It would make things simple.
> > > > > 
> > > > > The case of XENMEM_maximum_ram_page is interesting but it is not a
> > > > > problem in reality because the max physical address size is only
> > > > > 40-bit
> > > > > for aarch32 guests, so 32-bit are always enough to return the highest
> > > > > page in memory for 32-bit guests.
> > > > 
> > > > You are aware that this isn't the guest's max page, but the host's?
> > 
> > I can see now that you meant to say that, no matter what is the max
> > pseudo-physical address supported by the VM, XENMEM_maximum_ram_page is
> > supposed to return the max memory page, which could go above the
> > addressibility limit of the VM.
> > 
> > So XENMEM_maximum_ram_page should potentially be able to return (1<<44)
> > even when called by an aarch32 VM, with max IPA 40-bit.
> 
> I am a bit confused with what you wrote. Yes, 32-bit VM can only address
> 40-bit, but this is only limiting its own (guest) physical address space. Such
> VM would still be able to map any host physical address (assuming GFN != MFN).
 
I meant to say the same thing that you wrote, sorry it wasn't clear

 
> > I would imagine it could be useful if dom0 is 32-bit but domUs are
> > 64-bit on a 64-bit hypervisor (which I think it would be a very rare
> > configuration on ARM.)
> 
> Looking at the implementation, the hypercall is accessible by any domain. IOW
> a domU 32-bit could read a wrong value.
> 
> That said, it is not clear to me why an Arm or HVM x86 guest would want to
> read the value.

Right, indeed. AFAICT it is currently unused on ARM.

Going through the code, the only caller that could potentially use it on
ARM is libxl_domain_core_dump and xc_maximum_ram_page is called on the
if ( !auto_translated_physmap ) code path.

