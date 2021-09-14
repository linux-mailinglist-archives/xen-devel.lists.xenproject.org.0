Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D5740BA14
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 23:18:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187020.335756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQFoX-0001Jw-DP; Tue, 14 Sep 2021 21:18:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187020.335756; Tue, 14 Sep 2021 21:18:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQFoX-0001HV-9c; Tue, 14 Sep 2021 21:18:01 +0000
Received: by outflank-mailman (input) for mailman id 187020;
 Tue, 14 Sep 2021 21:18:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L61H=OE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mQFoW-0001HP-0w
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 21:18:00 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3c227a00-15a1-11ec-b478-12813bfff9fa;
 Tue, 14 Sep 2021 21:17:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8CC7E61183;
 Tue, 14 Sep 2021 21:17:57 +0000 (UTC)
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
X-Inumbo-ID: 3c227a00-15a1-11ec-b478-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631654278;
	bh=UQRLGHS6xf6GmOuTj/HQn8nm9cEbre+JvMXAL0ON+oY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HZSjZbN2ZZyyvB7ePeAYwklJBux399JsFKsdhJN6j2v2JC9tz+8KXhn961n9I8fSI
	 7E9I+Foi8FmQ4o82NUpOzS4Fqc72qqIh8xONnfjXyWx473ACwH84NRLvD+CbJit4g6
	 pNXdJITIWK2uv/cNSialnHsfb0c8dTtu7u6ICDalqMGNnnZr9lsJquN2VASCvBatVz
	 gRakVWj6/RKpAdwWKs8brlUhlvGnuBlyovgsWRQA5SbHmlxaqYmKvM9ux7rin4LemX
	 Ys3AbNle8xhhEsHNERbB2a63Y1Cw1cGJrXKozndqum8qDHwkr44bma4eOOPcE/9kG6
	 1Vidzltb1/v3w==
Date: Tue, 14 Sep 2021 14:17:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
    Mathieu Poirier <mathieu.poirier@linaro.org>, 
    Viresh Kumar <viresh.kumar@linaro.org>, Wei Liu <wl@xen.org>, 
    "rust-vmm@lists.opendev.org" <rust-vmm@lists.opendev.org>, 
    xen-devel@lists.xenproject.org, 
    Stratos Mailing List <stratos-dev@op-lists.linaro.org>, 
    Oleksandr Tyshchenko <olekstysh@gmail.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Demi Marie Obenour <demi@invisiblethingslab.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: Is it time to start implementing Xen bindings for rust-vmm?
In-Reply-To: <188afb35-54c1-9a52-19f1-867cea4487ea@citrix.com>
Message-ID: <alpine.DEB.2.21.2109141416160.21985@sstabellini-ThinkPad-T480s>
References: <87lf40vay1.fsf@linaro.org> <abfa4f44-8c56-af3f-485e-41b58e790d92@citrix.com> <874kanus97.fsf@linaro.org> <188afb35-54c1-9a52-19f1-867cea4487ea@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-634525-1631654278=:21985"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-634525-1631654278=:21985
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 14 Sep 2021, Andrew Cooper wrote:
> On 14/09/2021 15:44, Alex Bennée wrote:
> > Andrew Cooper <andrew.cooper3@citrix.com> writes:
> >
> >> On 13/09/2021 13:44, Alex Bennée wrote:
> >>> Hi,
> >>>
> >>> As we consider the next cycle for Project Stratos I would like to make
> >>> some more progress on hypervisor agnosticism for our virtio backends.
> >>> While we have implemented a number of virtio vhost-user backends using C
> >>> we've rapidly switched to using rust-vmm based ones for virtio-i2c,
> >>> virtio-rng and virtio-gpio. Given the interest in Rust for implementing
> >>> backends does it make sense to do some enabling work in rust-vmm to
> >>> support Xen?
> >>>
> >>> There are two chunks of work I can think of:
> >>>
> >>>   1. Enough of libxl/hypervisor interface to implement an IOREQ end point.
> >> No libxl here at all.
> >>
> >> As of Xen 4.15, there are enough stable interfaces to implement simple
> >> IOERQ servers.
> >>
> >> https://nam04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fxapi-project%2Fvarstored%2Fcommit%2Ffde707c59f7a189e1d4e97c1a4ee1a2d0c378ad1&amp;data=04%7C01%7CAndrew.Cooper3%40citrix.com%7C08a3fe14704a4d6888cf08d9778ee5b2%7C335836de42ef43a2b145348c2ee9ca5b%7C0%7C0%7C637672277905441489%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=%2B1pKhIuqzCGkgYD4snd6jnxjoEJzrCgUdol%2FfA2kwOk%3D&amp;reserved=0
> >> was the commit where I removed the final unstable interface from
> >> varstored (terrible name) which is a dom0 backend for UEFI secure
> >> variable handling.  As such, it also serves as a (not totally simple)
> >> reference of an IOERQ server.
> >>
> >>
> >> There are a few bits and pieces of rust going on within Xen, and a whole
> >> load of plans.  Also, there is a lot of interest from other downstreams
> >> in being able to write Rust backends.
> >>
> >> We've got a placeholder xen and xen-sys crates, and placeholder work for
> >> supporting cross-compile as x86 PV and PVH stubdomains.
> > Are these in the rust-vmm project is elsewhere?
> 
> https://crates.io/crates/xen-sys
> 
> When I say placeholder, I really do mean placeholder.
> 
> To start this work meaningfully, we'd want to make a repo (or several)
> in the xen-project organisation on github or gitlab (we have both, for
> reasons), and set these as the upstream of the xen and xen-sys crates.
> 
> >> The want to have a simple IOREQ server compiled either as a dom0
> >> backend, or as a PV or PVH stubdomains influences some of the design
> >> decisions early on, but they're all no-brainers for the longevity of the
> >> work.
> > Just to clarify nomenclature is a PVH stubdomain what I'm referring to
> > as a bare metal backend, i.e: a unikernel or RTOS image that implements
> > the backend without having to transition between some sort of userspace
> > and it's supporting kernel?
> 
> I think so, yes, although calling it "bare metal" seems misleading for
> something which is a VM targetted at a specific hypervisor...
> 
> 
> >> I started work on trying to reimplement varstored entirely in Rust as a
> >> hackathon project, although ran out of time trying to make hypercall
> >> buffers work (there is a bug with Box and non-global allocators causing
> >> rustc to hit an assert().  In the short term, we'll have to implement
> >> hypercall buffers in a slightly more irritating way).
> >>
> >> Furthermore, stick to the stable hypercalls only.  Xen's C libraries are
> >> disaster for cross-version compatibility, and you absolutely do not want
> >> to recompile your rust program just to run it against a different
> >> version of the hypervisor.  The plan is to start with simple IOREQ
> >> servers, which are on fully stable interfaces, then stabilise further
> >> hypercalls as necessary to expand functionality.
> > Are the hypercalls mediated by a kernel layer or are you making direct
> > HVC calls (on ARM) to the hypervisor from userspace?
> 
> For a dom0 backends irrespective of architecture, you need to issue
> ioctl()'s on the appropriate kernel device.
> 
> For a PV/PVH stubdom, you should make a call into the hypercall_page
> https://xenbits.xen.org/docs/latest/guest-guide/x86/hypercall-abi.html
> because Intel and AMD used different instructions for their equivalent
> of HVC.
> 
> ARM doesn't have the hypercall page ABI, so I'd expect the hypercall
> implementation to expand to HVC directly.

See for example arch/arm64/xen/hypercall.S in Linux
--8323329-634525-1631654278=:21985--

