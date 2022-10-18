Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F1260206C
	for <lists+xen-devel@lfdr.de>; Tue, 18 Oct 2022 03:27:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424679.672294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okbNj-00059l-JW; Tue, 18 Oct 2022 01:26:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424679.672294; Tue, 18 Oct 2022 01:26:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okbNj-00056W-GG; Tue, 18 Oct 2022 01:26:59 +0000
Received: by outflank-mailman (input) for mailman id 424679;
 Tue, 18 Oct 2022 01:26:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9K0G=2T=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1okbNh-00055g-Vs
 for xen-devel@lists.xenproject.org; Tue, 18 Oct 2022 01:26:57 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3dd3eef-4e83-11ed-91b4-6bf2151ebd3b;
 Tue, 18 Oct 2022 03:26:56 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 61C476131D;
 Tue, 18 Oct 2022 01:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 713D3C433D6;
 Tue, 18 Oct 2022 01:26:53 +0000 (UTC)
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
X-Inumbo-ID: f3dd3eef-4e83-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666056414;
	bh=e/FVKmjHz7MymBQZF1e2NJrF7LA/JdyKHUkXs0U4oCo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ei8aoBlMpDFZxdLLdKBgvbEbXtoR9h2XV2+LhO4SOQePty/BsLpbE7/wu8nPgR5hc
	 azPcVsJ2i54XB/FJIpu2iWKFwHtBRPQqc82D1YDAkWcCIIdhQoqUKVv9iVzP4cV6UP
	 CQ4YOEAD7j1r4Oxe0BVQcmGACYOYUN8lBTwLoAs/0N4vzPw6y9rnZXbp9mAnt+W+6R
	 Vt5lZjo4oe9zCZKNbBo/qU/xsSBb6y5fhHBEFojgbaIa/mNet9nRyxVO2jtsbBbGYV
	 HXK1WkBqAt7E1ZqPfizCbuvuYRlMK7Wv1TQzPoOjZokz2hGIMPKHzgE9aSzhKQvgbO
	 ydcyKHVX7e1WA==
Date: Mon, 17 Oct 2022 18:26:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Ayan Kumar Halder <ayankuma@amd.com>, 
    "Stabellini, Stefano" <stefano.stabellini@amd.com>, 
    "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>, 
    Henry Wang <Henry.Wang@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, 
    Jaxson Han <Jaxson.Han@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Need guidance to support reading GICR_TYPER (64 bit register)
 on Aarch32_v8r
In-Reply-To: <6D2FD203-04D9-4CDD-B57D-E90F5BC5CC3A@arm.com>
Message-ID: <alpine.DEB.2.22.394.2210171549480.4587@ubuntu-linux-20-04-desktop>
References: <e2d041b2-3b38-f19b-2d8e-3a255b0ac07e@amd.com> <alpine.DEB.2.22.394.2210141109400.3690179@ubuntu-linux-20-04-desktop> <e5e337cc-9478-e4d5-e7ce-71138817f56e@xen.org> <2FED929A-C718-468B-B385-5C80CEED0664@arm.com>
 <6D2FD203-04D9-4CDD-B57D-E90F5BC5CC3A@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 17 Oct 2022, Bertrand Marquis wrote:
> > On 17 Oct 2022, at 10:17, Bertrand Marquis <Bertrand.Marquis@arm.com> wrote:
> >> On 15 Oct 2022, at 10:28, Julien Grall <julien@xen.org> wrote:
> >> On 14/10/2022 19:09, Stefano Stabellini wrote:
> >>> On Thu, 13 Oct 2022, Ayan Kumar Halder wrote:
> >>>> Hi Arm mantainers/Folks,
> >>>> 
> >>>> Please refer to the discussion
> >>>> https://github.com/zephyrproject-rtos/zephyr/pull/51163 .
> >>>> 
> >>>> We intend to run Zephyr as a domU guest on Xen on Aarch32_v8R fixed virtual
> >>>> platform.
> >>>> 
> >>>> Zephyr is trying to read GICR_TYPER which is a 64 bit register using ldrd
> >>>> instruction.
> >>>> 
> >>>> As GICR is emulated by Xen, so this instruction gets trapped with HSR =
> >>>> 0x9200000c.
> >>>> 
> >>>> As ISV is 0, so Xen cannot emulate this instruction.
> >>>> 
> >>>> The proposed solution is to use two sys_read32() on GICR_TYPER to return the
> >>>> lower and upper 32 bits.
> >>>> 
> >>>> With this, HSR = 0x9383 000c, ISV=1 so ISS is valid.
> >>> Hi all,
> >>> I wanted to take a step back on this issue before we jump into the
> >>> details.
> >>> Differently from other instructions we discussed in the past, strd and ldrd
> >>> are not deprecated and are not "unusual corner cases". There is no
> >>> statements such as "please don't use this" on the ARM ARM. If I were to
> >>> write an register read/write function in assembly for an RTOS, it would
> >>> be reasonable to use them.
> >> 
> >> Just to be clear it is fine to use the ldrd/strd for accessing non MMIO area. The problem comes with MMIO access because they can be emulated by the hypervisor and we don't have the syndrome. At the moment, this is only a problem when accessing some of the GICv3 (including ITS) registers.
> >> 
> >>> So, I struggle to see how we'll be able to deal with all the possible
> >>> RTOSes out there that might have them in the code. We can fix Zephyr,
> >>> but what about FreeRTOS, ThreadX and the proprietary ones (VxWorks,
> >>> etc.)?
> >> 
> >> This is not an Xen issue but architecture issue. The RTOSes will face the exact same issue on any hypervisors unless they decided to decode the instruction.
> >> 
> >> As we discussed before decoding an instruction correctly is quite difficult to do (what we have in Xen for pos-increment store/load is just a band-aid). So I would expect the other hypervisors to have made the decision to not implement it. AFAIK KVM doesn't suppor them,
> >> Note that looking at ID_ISAR2, it seems that ldrd/strd is technically optional. Therefore, the RTOS would have to assume it is targeting a processor that supports them.
> >> 
> >>> Unless we can get ARM to issue a clear guidance that strd and ldrd are
> >>> deprecated, 
> >> 
> >> Arm Arm cannot say that because ldrd/strd are necessary to modify the LPAE page-tables atomically. What we need to know is which instructions can be allowed on MMIO accesses.
> > 
> > Definitely this is something that arm arm cannot fully answer as it is also down to the full platform. MMIO accesses are going out of the CPU and hence wether or not 64bit MMIO accesses can be properly done might also depend on the bus or the IP on the other side (some peripherals might just refuse 64bit accesses or some bus might only be 32bit so the operations would need to be divided).
> > 
> >> 
> >> I think I already raised that when Ayan added decoding for post-increment instructions. There are plenty of instructions (or combinations) that doesn't provide a syndrome and yet the processor doesn't prevent anyone to use them on MMIO.
> >> 
> >> I was worry we are going to have to continue to decode instructions in a non-compliant way in Xen just to please a few RTOs that may not even run anywhere else.
> >> 
> >> This would also reduce our leverage to request a change in the RTOes or the Arm Arm (maybe there is already a statement I haven't spotted) because Xen will already (badly) support the instruction.
> > 
> > Going back on the ID_ISAR2, if Xen is properly setting the value seen by the guests, there is not reason for us to actually emulate those instructions.
> > The emulation code inside Xen cost a lot in matter of lines of code and would need a lot of testing (which is missing at the moment).
> > So as we have a standard way to inform the guest that this is not supported, we should stick to that.
> > 
> >> 
> >>> I think it would be better to attempt to decode them rather
> >>> than just fail. I don't like to have this kind of code in Xen, but I
> >>> don't see a way to support R52s without it.
> >> That's not specific to R52. This is anyone using GICv3 on Arm32 core.
> > 
> > Agree.
> > 
> >> 
> >>> That said, of course if Zephyr was to use two 32-bit reads instead of
> >>> one 64-bit read, it would be better for Xen. And we have more important
> >>> things to deal with right now in terms of R52 support (it is not even
> >>> upstream yet). So it is totally fine to change Zephyr and move forward
> >>> for now.
> >>> But medium term it doesn't seem to me that we can get away without a
> >>> solution in Xen for this (or a change in the ARM ARM).
> >> 
> >> See above. This is an architecture problem and we should discuss with Arm first before continuing to add more decoding in Xen.
> > 
> > I will discuss it internally to have an answer but I think that the answer cannot only come from Arm as there are for sure hardware implementations that cannot support this, as explain before.
> 
> I had some discussions internally and here is the official view:
> 
> >From the architecture point of view this should always work but this is not virtualisable (as there is no syndrome register) and not recommended as deferencing a pointer accessing MMIO registers is not safe, so it should not be done for MMIO.
> 
> Linux is not doing those kind of accesses and KVM does not support guest doing them.
> 
> So I think we should not try to emulate this.

I wouldn't take Linux and KVM as role models for the embedded space.
Zephyr would be better (unfortunately Zephyr is not behaving as we
prefer today).


At least at AMD/Xilinx, our users try something on native first, then
they try it on Xen, and if it doesn't work they blame Xen. They don't
typically try KVM and compare behavior. We try to explain that Xen is
not necessarily to blame but this is the natural way of thinking for
engineers apparently as it happened many times in the last few years for
a range of issues with users in very different
geographys/companies/projects.

I am writing the above just for context and to create a common
understanding of Xen users' behavior and way of thinking. I don't think
we can succeed in changing our users' way of thinking.

So generally my preference is to try to prevent a situation where a user
might reach out to us in regard to something that used to work on native
and doesn't anymore on Xen. It is always very difficult to explain in a
way that is convincing to the user.


But honestly, we had zero reports of ldrd/strd causing a guest crash
from users so far. So I think it is OK not to introduce code in the
hypervisor to fix a "theoretical" bug. So one approach is to wait for
the first real user report of the problem and then re-discuss the issue
at that point in time (if it ever happens).

Documentation would help if we had it -- we don't have an official
document anywhere stating that Xen as a project doesn't intend to
support ltrd/strd on MMIO regions. That would help.

If we had such a document, it would be easier to explain the issue to
users and they would more easily fix their RTOS if they can. There is
also the possibility that they can't, because it is provided by
third-parties. Like above, if it happens we can re-discuss it at that
point in time.

