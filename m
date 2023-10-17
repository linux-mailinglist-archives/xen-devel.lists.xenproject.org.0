Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C04B7CCCCD
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 22:00:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618352.961905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsqDP-0000IR-Jq; Tue, 17 Oct 2023 19:58:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618352.961905; Tue, 17 Oct 2023 19:58:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsqDP-0000Fc-HE; Tue, 17 Oct 2023 19:58:55 +0000
Received: by outflank-mailman (input) for mailman id 618352;
 Tue, 17 Oct 2023 19:58:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dFgi=F7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qsqDO-0000FU-6z
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 19:58:54 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 966241ab-6d27-11ee-9b0e-b553b5be7939;
 Tue, 17 Oct 2023 21:58:50 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A7F8DCE1CF6;
 Tue, 17 Oct 2023 19:58:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78C84C433C7;
 Tue, 17 Oct 2023 19:58:42 +0000 (UTC)
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
X-Inumbo-ID: 966241ab-6d27-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697572723;
	bh=PP7AX4Pq9aIcZ9xC5nXuuSDj/kmLE8PT+8RSDCw6ZsI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=odGh0r2g6YoZ5CMd8LV8sRLohVIwtPQHPgchP5P7te6Aj/13KnTTVhbNXmTZr/Kk/
	 086u+/nd/Q0K0uM0AqihATAokIrkMCNzDVBWb9e4nQmSfwNIn8hXp49qwpSXwWf3r6
	 +M+hkvKUe3p/eUiSS1K19Dn0hSI0gq428mjmOltVshXyL7I93nGm96pEB9HT0v4tXh
	 Y1NQyVUO2Hqp0WWGHinLU47+vy4QKvQXIYQIfWRi/F5GIX7SGUF++fB3lHTl+WzQya
	 AT69MUmcsnN14xUkEtNjat//U6HTSKm8NRGFHFkwj7ShmOrtbBi9af5OPIyLECn8AJ
	 Wx48Pp/J9v1Xg==
Date: Tue, 17 Oct 2023 12:58:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Alexey Klimov <alexey.klimov@linaro.org>, 
    Luca Fancellu <Luca.Fancellu@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
    "leo.yan@linaro.org" <leo.yan@linaro.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Rahul Singh <Rahul.Singh@arm.com>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH v4 2/2] xen/arm: Enlarge identity map space to 10TB
In-Reply-To: <990b21a3-f8c7-4d02-a8ac-63d31794a76d@xen.org>
Message-ID: <alpine.DEB.2.22.394.2310171258330.965337@ubuntu-linux-20-04-desktop>
References: <20231013122658.1270506-1-leo.yan@linaro.org> <20231013122658.1270506-3-leo.yan@linaro.org> <169101f8-0475-45b1-b2c2-60dadd88d3f0@amd.com> <5a5e960b-e6fd-4617-b33a-10cf07f5bb52@xen.org> <8BCB97B4-CBDD-43D9-B0F8-7F637B8BE559@arm.com>
 <4B2BD200-5D3E-49D5-BF13-65B769AD4B90@arm.com> <CANgGJDqHu0CB=zzZqda18giLYDkL3My+gT592GLO-b9HsF2A4g@mail.gmail.com> <d3952200-9edb-4de0-94e3-c00c571a10b9@xen.org> <794B0D71-70A7-4546-98E0-EC01573E0D89@arm.com>
 <990b21a3-f8c7-4d02-a8ac-63d31794a76d@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-551337818-1697572723=:965337"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-551337818-1697572723=:965337
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 15 Oct 2023, Julien Grall wrote:
> On 16/10/2023 16:07, Bertrand Marquis wrote:
> > > On 16 Oct 2023, at 16:46, Julien Grall <julien@xen.org> wrote:
> > > CC Henry
> > > 
> > > Hi Alexey,
> > > 
> > > On 16/10/2023 15:24, Alexey Klimov wrote:
> > > > On Mon, 16 Oct 2023 at 15:13, Luca Fancellu <Luca.Fancellu@arm.com>
> > > > wrote:
> > > > > 
> > > > > 
> > > > > 
> > > > > > On 16 Oct 2023, at 15:00, Bertrand Marquis
> > > > > > <Bertrand.Marquis@arm.com> wrote:
> > > > > > 
> > > > > > Hi
> > > > > > 
> > > > > > +Luca and Rahul
> > > > > > 
> > > > > > > On 16 Oct 2023, at 15:54, Julien Grall <julien@xen.org> wrote:
> > > > > > > 
> > > > > > > 
> > > > > > > 
> > > > > > > On 16/10/2023 09:44, Michal Orzel wrote:
> > > > > > > > Hi,
> > > > > > > 
> > > > > > > Hi,
> > > > > > > 
> > > > > > > > On 13/10/2023 14:26, Leo Yan wrote:
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > On ADLink AVA platform (Ampere Altra SoC with 32 Arm Neoverse
> > > > > > > > > N1 cores),
> > > > > > > > > the physical memory regions are:
> > > > > > > > > 
> > > > > > > > >   DRAM memory regions:
> > > > > > > > >     Node[0] Region[0]: 0x000080000000 - 0x0000ffffffff
> > > > > > > > >     Node[0] Region[1]: 0x080000000000 - 0x08007fffffff
> > > > > > > > >     Node[0] Region[2]: 0x080100000000 - 0x0807ffffffff
> > > > > > > > > 
> > > > > > > > > The UEFI loads Xen hypervisor and DTB into the high memory,
> > > > > > > > > the kernel
> > > > > > > > > and ramdisk images are loaded into the low memory space:
> > > > > > > > > 
> > > > > > > > >   (XEN) MODULE[0]: 00000807f6df0000 - 00000807f6f3e000 Xen
> > > > > > > > >   (XEN) MODULE[1]: 00000807f8054000 - 00000807f8056000 Device
> > > > > > > > > Tree
> > > > > > > > >   (XEN) MODULE[2]: 00000000fa834000 - 00000000fc5de1d5 Ramdisk
> > > > > > > > >   (XEN) MODULE[3]: 00000000fc5df000 - 00000000ffb3f810 Kernel
> > > > > > > > > 
> > > > > > > > > In this case, the Xen binary is loaded above 8TB, which
> > > > > > > > > exceeds the
> > > > > > > > > maximum supported identity map space of 2TB in Xen.
> > > > > > > > > Consequently, the
> > > > > > > > > system fails to boot.
> > > > > > > > > 
> > > > > > > > > This patch enlarges identity map space to 10TB, allowing
> > > > > > > > > module loading
> > > > > > > > > within the range of [0x0 .. 0x000009ff_ffff_ffff].
> > > > > > > > > 
> > > > > > > > > Fixes: 1c78d76b67 ("xen/arm64: mm: Introduce helpers to
> > > > > > > > > prepare/enable/disable")
> > > > > > > > I don't think a fixes tag applies here given that 2TB was just a
> > > > > > > > number we believed is enough
> > > > > > > > and all of this is platform dependent.
> > > > > > > > This can be dropped on commit if committer agrees
> > > > > > > Xen may have booted on that platform before hand. So this would be
> > > > > > > considered a regression and therefore a tag would be warrant.
> > > > > > > 
> > > > > > > AFAICT, the commit is only present on the upcoming 4.18. So the
> > > > > > > question is whether Xen 4.17 booted out-of-the-box on ADLink? If
> > > > > > > the answer is yes, then we need to add a Fixes tag. But the
> > > > > > > correct one would be
> > > > > > > 
> > > > > > 
> > > > > > @Rahul or Luca: could you give an answer here ?
> > > > > > I know you used Xen on an AVA platform but was it booting out of the
> > > > > > box ?
> > > > > 
> > > > > I can’t say for Xen 4.17, but our nightly job has run successfully on
> > > > > AVA for the commit 730406ab81094115d9fb5ca00ba8d53cec1279b3
> > > > > (docs/misra: add deviations.rst to document additional deviations.)
> > > > > 
> > > > > We are not applying any patch for it to run on AVA.
> > > > Most likely it is because your UEFI/BIOS firmware is 2.x, for instance
> > > > 2.04.100.07.
> > > > This fix if for AVA machine with older UEFI firmware 1.07.300.03.
> > > 
> > > OOI, why not updating your firmware? I was expecting that it would also
> > > contain other critical fixes.
> > > 
> > > With this in mind, I am now more in two mind to ask to merge this patch in
> > > Xen 4.18. On one hand, I understand it will help to boot on AVA machine
> > > with an older firmware. But on the other hand this is changing the memory
> > > layout quite late in the release. The risk seems limited because Xen is
> > > not loaded at the top of the virtual address space (there is the directmap
> > > afterwards).
> > > 
> > > Henry (as the release manager) and others, any opinions?
> > 
> > With the new information, I think it should be stated that it is fixing an
> > issue on AVA platforms using an old firmware and platforms with and
> > up-to-date firmware are not impacted.
> > It is an important information to keep in mind that this is not a fix to be
> > backported for example (and for me the fixes tag should not be kept).
> 
> IMHO, the fixes tag should not be based solely on the AVA platform. It should
> be based on whether this could sensibly affect others. Right now, there is
> nothing that would indicate either way.
> 
> And therefore a Fixes tag is sensible. This doesn't mean I would want to
> backport it right now (note that only 4.18 is affected). But this could change
> in the future if we get another report (post-4.18) on a platform where there
> are no other workaround.
> 
> Stefano any opinions?

The Fixes tag carries useful information but the problem is that it is
typically used for identifying backports and this is not a backport (at
least today we would not consider it a backport).

So I would provide the same information but without using the Fixes tag.
For instance: "This commit fixes an issue that was introduced by XXX
because of YYY and only affects the AVA platform with not up-to-date
firmware".

That way, we avoid the risk of someone taking all the applicable commits
with a Fixes tag and backporting them without thinking twice about it.
But we still have the information in the git log.
--8323329-551337818-1697572723=:965337--

