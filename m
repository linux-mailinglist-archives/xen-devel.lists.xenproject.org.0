Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 255094CB29C
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 23:55:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282610.481384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPXsr-0008SX-NN; Wed, 02 Mar 2022 22:55:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282610.481384; Wed, 02 Mar 2022 22:55:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPXsr-0008QZ-JV; Wed, 02 Mar 2022 22:55:49 +0000
Received: by outflank-mailman (input) for mailman id 282610;
 Wed, 02 Mar 2022 22:55:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6wI2=TN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nPXsq-0008P6-I1
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 22:55:48 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4ef41db-9a7b-11ec-8539-5f4723681683;
 Wed, 02 Mar 2022 23:55:46 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9BAEFB82285;
 Wed,  2 Mar 2022 22:55:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09738C004E1;
 Wed,  2 Mar 2022 22:55:42 +0000 (UTC)
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
X-Inumbo-ID: e4ef41db-9a7b-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646261743;
	bh=eGkVgzszDtV57fApPBexl0TVZ6WfXQmp/zCtiK77G5w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=J14599mDBY6SiAecIHYOPw+47kA1RD3vf61XWWDduDghgViWRsCH5LCJT9klF6nWM
	 20xTyw20PC9hgjfpGrd02+fhJy+Brw5Tp4HsD1NVZwdTbrPg7Elb+018j1OtRv8gui
	 Sq15JI/SX44J6Xi+ON5mKXlavVCpKmZ+/4JPtuJg9KJy83SFyNm0iatezO7AbYD2jU
	 qU7f+QJvVy303DmGLlJ2cAQxPoRxZ1733TwA9Mx0sy675VEp5Z06KAOlLjoIj/4cSg
	 t4YL3fxEcItHzjdX19tUwV+0KskdEA3SDKZoMAO/0c/j7v22ZqBNki13ufEEIb5hpk
	 JvL8wMmRM1NMQ==
Date: Wed, 2 Mar 2022 14:55:42 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Wei Chen <Wei.Chen@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "julien@xen.org" <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Penny Zheng <Penny.Zheng@arm.com>, Henry Wang <Henry.Wang@arm.com>, 
    nd <nd@arm.com>
Subject: RE: Proposal for Porting Xen to Armv8-R64 - DraftA
In-Reply-To: <PAXPR08MB74201779FC92E734A5107B769E039@PAXPR08MB7420.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2203021454090.3261@ubuntu-linux-20-04-desktop>
References: <PAXPR08MB7420A01809B84E04E196793F9E3D9@PAXPR08MB7420.eurprd08.prod.outlook.com> <alpine.DEB.2.22.394.2202241606450.239973@ubuntu-linux-20-04-desktop> <AS1PR08MB74269923288B75097392BDD99E3E9@AS1PR08MB7426.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2202251214210.239973@ubuntu-linux-20-04-desktop> <PAXPR08MB742081D5E3C94801350C4A739E029@PAXPR08MB7420.eurprd08.prod.outlook.com> <alpine.DEB.2.22.394.2203011455500.3261@ubuntu-linux-20-04-desktop>
 <PAXPR08MB74201779FC92E734A5107B769E039@PAXPR08MB7420.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-615912675-1646261743=:3261"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-615912675-1646261743=:3261
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 2 Mar 2022, Wei Chen wrote:
> > > > > > If not, and considering that we have to generate
> > > > > > ARM_MPU_*_MEMORY_START/END anyway at build time, would it make
> > sense
> > > > to
> > > > > > also generate mpu,guest-memory-section, xen,static-mem, etc. at
> > build
> > > > > > time rather than passing it via device tree to Xen at runtime?
> > > > > >
> > > > >
> > > > > Did you mean we still add these information in device tree, but for
> > > > build
> > > > > time only. In runtime we don't parse them?
> > > >
> > > > Yes, something like that, but see below.
> > > >
> > > >
> > > > > > What's the value of doing ARM_MPU_*_MEMORY_START/END at build time
> > and
> > > > > > everything else at runtime?
> > > > >
> > > > > ARM_MPU_*_MEMORY_START/END is defined by platform. But other things
> > are
> > > > > users customized. They can change their usage without rebuild the
> > image.
> > > >
> > > > Good point.
> > > >
> > > > We don't want to have to rebuild Xen if the user updated a guest
> > kernel,
> > > > resulting in a larger boot-module-section.
> > > >
> > > > So I think it makes sense that "mpu,boot-module-section" is generated
> > by
> > > > the scripts (e.g. ImageBuilder) at build time, and Xen reads the
> > > > property at boot from the runtime device tree.
> > > >
> > > > I think we need to divide the information into two groups:
> > > >
> > > >
> > > > # Group1: board info
> > > >
> > > > This information is platform specific and it is not meant to change
> > > > depending on the VM configuration. Ideally, we build Xen for a
> > platform
> > > > once, then we can use the same Xen binary together with any
> > combination
> > > > of dom0/domU kernels and ramdisks.
> > > >
> > > > This kind of information doesn't need to be exposed to the runtime
> > > > device tree. But we can still use a build-time device tree to generate
> > > > the addresses if it is convenient.
> > > >
> > > > XEN_START_ADDRESS, ARM_MPU_DEVICE_MEMORY_*, and
> > ARM_MPU_NORMAL_MEMORY_*
> > > > seem to be part of this group.
> > > >
> > >
> > > Yes.
> > >
> > > >
> > > > # Group2: boot configuration
> > > >
> > > > This information is about the specific set of binaries and VMs that we
> > > > need to boot. It is conceptually similar to the dom0less device tree
> > > > nodes that we already have. If we change one of the VM binaries, we
> > > > likely have to refresh the information here.
> > > >
> > > > "mpu,boot-module-section" probably belongs to this group (unless we
> > find
> > > > a way to define "mpu,boot-module-section" generically so that we don't
> > > > need to change it any time the set of boot modules change.)
> > > >
> > > >
> > >
> > > I agree.
> > >
> > > > > > It looks like we are forced to have the sections definitions at
> > build
> > > > > > time because we need them before we can parse device tree. In that
> > > > case,
> > > > > > we might as well define all the sections at build time.
> > > > > >
> > > > > > But I think it would be even better if Xen could automatically
> > choose
> > > > > > xen,static-mem, mpu,guest-memory-section, etc. on its own based on
> > the
> > > > > > regular device tree information (/memory, /amba, etc.), without
> > any
> > > > need
> > > > > > for explicitly describing each range with these new properties.
> > > > > >
> > > > >
> > > > > for mpu,guest-memory-section, with the limitations: no other usage
> > > > between
> > > > > different guest' memory nodes, this is OK. But for xen,static-mem
> > (heap),
> > > > > we just want everything on a MPU system is dertermistic. But, of
> > course
> > > > Xen
> > > > > can select left memory for heap without static-mem.
> > > >
> > > > It is good that you think they can be chosen by Xen.
> > > >
> > > > Differently from "boot-module-section", which has to do with the boot
> > > > modules selected by the user for a specific execution,
> > > > guest-memory-section and static-mem are Xen specific memory
> > > > policies/allocations.
> > > >
> > > > A user wouldn't know how to fill them in. And I worry that even a
> > script
> > >
> > > But users should know it, because static-mem for guest must be allocated
> > > in this range. And users take the responsibility to set the DomU's
> > > static allocate memory ranges.
> > 
> > Let me premise that my goal is to avoid having many users reporting
> > errors to xen-devel and xen-users when actually it is just a wrong
> > choice of addresses.
> > 
> > I think we need to make a distinction between addresses for the boot
> > modules, e.g. addresses where to load xen, the dom0/U kernel, dom0/U
> > ramdisk in memory at boot time, and VM static memory addresses.
> > 
> > The boot modules addresses are particularly difficult to fill in because
> > they are many and a small update in one of the modules could invalidate
> > all the other addresses. This is why I ended up writing ImageBuilder.
> > Since them, I received several emails from users thanking me for
> > ImageBuilder :-)
> > 
> 
> Thanks +999 😊
> 
> 
> > The static VM memory addresses (xen,static-mem) should be a bit easier
> > to fill in correctly. They are meant to be chosen once, and it shouldn't
> > happen that an update on a kernel forces the user to change all the VM
> > static memory addresses. Also, I know that some users actually want to
> > be able to choose the domU addresses by hand because they have specific
> > needs. So it is good that we can let the user choose the addresses if
> > they want to.
> > 
> 
> Yes.
> 
> > With all of that said, I do think that many users won't have an opinion
> > on the VM static memory addresses and won't know how to choose them.
> > It would be error prone to let them try to fill them in by hand. So I
> > was already planning on adding support to ImageBuilder to automatically
> > generate xen,static-mem for dom0less domains.
> > 
> 
> Let me make sure that's what you said: Users give an VM memory size to
> ImageBuilder, and ImageBuilder will generate xen,static-mem = <start, size>.
> For specific VM, ImageBuilder also can accept start and size as inputs?
> 
> Do I understand this correctly?

Yes, exactly

 
> > Going back to this specific discussion about boot-module-section: I can
> > see now that, given xen,static-mem is chosen by ImageBuilder (or
> 
> By hand : )
> 
> > similar) and not Xen, then it makes sense to have ImageBuilder (or
> > similar) also generate boot-module-section.
> > 
> 
> If my above understanding is right, then yes.

Yes, I think we are on the same page
 
 
> > > > like ImageBuilder wouldn't be the best place to pick these values --
> > > > they seem too "important" to leave to a script.
> > > >
> > > > But it seems possible to choose the values in Xen:
> > > > - Xen knows ARM_MPU_NORMAL_MEMORY_* because it was defined at build
> > time
> > > > - Xen reads boot-module-section from device tree
> > > >
> > > > It should be possible at this point for Xen to pick the best values
> > for
> > > > guest-memory-section and static-mem based on the memory available.
> > > >
> > >
> > > How Xen to pick? Does it mean in static allocation DomU DT node, we just
> > > need a size, but don't require a start address for static-mem?
> > 
> > Yes the idea was that the user would only provide the size (e.g.
> > DOMU_STATIC_MEM[1]=1024) and the addresses would be automatically
> > calculated. But I didn't mean to change the existing xen,static-mem
> > device tree bindings. So it is best if the xen,static-mem addresses
> > generation is done by ImageBuilder (or similar tool) instead of Xen.
> > 
> 
> If we still keep the option for user to specify the start and size
> parameters for VM memory, because it maybe very important for a
> deterministic system (fully static system), I agree with you.
> 
> And in current static-allocation, I think Xen doesn't generate
> xen,static-mem addresses, all by hands...

Yeah 


> > Sorry for the confusion!
> > 
> 
> NP ; )

--8323329-615912675-1646261743=:3261--

