Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AE53C6529
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jul 2021 22:52:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.154834.285987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m32uQ-0000H3-Bm; Mon, 12 Jul 2021 20:52:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154834.285987; Mon, 12 Jul 2021 20:52:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m32uQ-0000F0-7h; Mon, 12 Jul 2021 20:52:10 +0000
Received: by outflank-mailman (input) for mailman id 154834;
 Mon, 12 Jul 2021 20:52:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Aa2W=ME=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1m32uO-0000Eu-AO
 for xen-devel@lists.xen.org; Mon, 12 Jul 2021 20:52:08 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 04a8c5a0-e353-11eb-8709-12813bfff9fa;
 Mon, 12 Jul 2021 20:52:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BFC3461002;
 Mon, 12 Jul 2021 20:52:05 +0000 (UTC)
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
X-Inumbo-ID: 04a8c5a0-e353-11eb-8709-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626123126;
	bh=J6m9ao+LV67ChBaN6D64zfORhcALTt0HFhiUy/cX4yk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MqxrWtNtRibR6ZBFDxMeQZ8Meqm2snsLyWgMfVMLk57zGg1pd9db/FoZ+tkxENbgy
	 fKhmAnV8sMaaevh+nCKW7nPdqSYH0wB3f8eRS+ySaIgw72MH+h/9SW0QVRzUXogKX+
	 PMDtQBZ9dwOjob5BN24RqAHb4Ia7jEMSwVMet1mU6KPc8n3FHLQ6+x+rxG6hZA2MHM
	 qjwxbka8/LlWPS37/wDnZc47WAtIGVa/Q+EvZ7vnkYhCrUPMju/vakgKDlzzlZIuFm
	 1MF/QjiajpOO7+BE3fYtR/stmiaaBD2QMrtbUf+8MZqHEAa/DWKoma3VuUUHOcqRjx
	 3/7jehQiSkIuQ==
Date: Mon, 12 Jul 2021 13:52:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Andre Przywara <andre.przywara@arm.com>
cc: Wei Chen <Wei.Chen@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
    "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
    "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, 
    "will@kernel.org" <will@kernel.org>, 
    "jean-philippe@linaro.org" <jean-philippe@linaro.org>, 
    Julien Grall <julien@xen.org>, Marc Zyngier <maz@kernel.org>, 
    "julien.thierry.kdev@gmail.com" <julien.thierry.kdev@gmail.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
Subject: Re: [Kvmtool] Some thoughts on using kvmtool Virtio for Xen
In-Reply-To: <20210709123749.1aaa5bfe@slackpad.fritz.box>
Message-ID: <alpine.DEB.2.21.2107121342290.23286@sstabellini-ThinkPad-T480s>
References: <DB9PR08MB6857B375207376D8320AFBA89E309@DB9PR08MB6857.eurprd08.prod.outlook.com> <20210709123749.1aaa5bfe@slackpad.fritz.box>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 9 Jul 2021, Andre Przywara wrote:
> On Tue, 15 Jun 2021 07:12:08 +0100
> Wei Chen <Wei.Chen@arm.com> wrote:
> 
> Hi Wei,
> 
> > I have some thoughts of using kvmtool Virtio implementation
> > for Xen. I copied my markdown file to this email. If you have
> > time, could you please help me review it?
> > 
> > Any feedback is welcome!
> > 
> > # Some thoughts on using kvmtool Virtio for Xen
> > ## Background
> > 
> > Xen community is working on adding VIRTIO capability to Xen. And we're working
> > on VIRTIO backend of Xen. But except QEMU can support virtio-net for x86-xen,
> > there is not any VIRTIO backend can support Xen. Because of the community's
> > strong voice of Out-of-QEMU, we want to find a light weight VIRTIO backend to
> > support Xen.
> > 
> > We have an idea of utilizing the virtio implementaton of kvmtool for Xen. And
> > We know there was some agreement that kvmtool won't try to be a full QEMU
> > alternative. So we have written two proposals in following content for
> > communities to discuss in public:
> > 
> > ## Proposals
> > ### 1. Introduce a new "dm-only" command
> > 1. Introduce a new "dm-only" command to provide a pure device model mode. In
> >    this mode, kvmtool only handles IO request. VM creation and initialization
> >    will be bypassed.
> > 
> >     * We will rework the interface between the virtio code and the rest of
> >     kvmtool, to use just the minimal set of information. At the end, there
> >     would be MMIO accesses and shared memory that control the device model,
> >     so that could be abstracted to do away with any KVM specifics at all. If
> >     this is workable, we will send the first set of patches to introduce this
> >     interface, and adapt the existing kvmtool to it. Then later we will can
> >     add Xen support on top of it.
> > 
> >     About Xen support, we will detect the presence of Xen libraries, also
> >     allow people to ignore them, as kvmtoll do with optional features like
> >     libz or libaio.
> > 
> >     Idealy, we want to move all code replying on Xen libraries to a set of
> >     new files. In this case, thes files can only be compiled when Xen
> >     libraries are detected. But if we can't decouple this code completely,
> >     we may introduce a bit of #ifdefs to protect this code.
> > 
> >     If kvm or other VMM do not need "dm-only" mode. Or "dm-only" can not
> >     work without Xen libraries. We will make "dm-only" command depends on
> >     the presence of Xen libraries.
> > 
> >     So a normal compile (without the Xen libraries installed) would create
> >     a binary as close as possible to the current code, and only the people
> >     who having Xen libraries installed would ever generate a "dm-only"
> >     capable kvmtool.
> 
> This is not for me to decide, but just to let you know that this
> approach might not be very popular with kvmtool people, as kvmtool's
> design goal is be "lean and mean". So slapping a lot of code on the
> side, not helping with the actual KVM functionality, does not sound too
> tempting.
> 
> > 
> > ### 2. Abstract kvmtool virtio implementation as a library
> > 1. Add a kvmtool Makefile target to generate a virtio library. In this
> >    scenario, not just Xen, but any project else want to provide a
> >    userspace virtio backend service can link to this virtio libraris.
> >    These users would benefit from the VIRTIO implementation of kvmtool
> >    and will participate in improvements, upgrades, and maintenance of
> >    the VIRTIO libraries.
> > 
> >     * In this case, Xen part code will not upstream to kvmtool repo,
> >       it would then be natural parts of the xen repo, in xen/tools or
> >       maintained in other repo.
> > 
> >       We will have a completely separate VIRTIO backend for Xen, just
> >       linking to kvmtool's VIRTIO library.
> > 
> >     * The main changes of kvmtool would be:
> >         1. Still need to rework the interface between the virtio code
> >            and the rest of kvmtool, to abstract the whole virtio
> >            implementation into a library
> >         2. Modify current build system to add a new virtio library target.
> 
> As this has at least the prospect of being cleaner, this approach
> sounds better to me.

There are two sets of changes:

a) Xen ioreq handling
b) introducing map_guest_page/unmap_guest_page and abstracting other
   hypervisor interfaces 

a) is minimal and b) is more invasive. The problem is b) is required
regardless, so the library approach wouldn't really help much with
reducing the amount of changes required for this to work. But yes, it
might be cleaner.

