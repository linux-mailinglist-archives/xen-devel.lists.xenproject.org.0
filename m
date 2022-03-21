Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BA84E3291
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 23:08:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293221.498058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWQBS-0006Mi-4o; Mon, 21 Mar 2022 22:07:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293221.498058; Mon, 21 Mar 2022 22:07:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWQBS-0006Kd-1i; Mon, 21 Mar 2022 22:07:26 +0000
Received: by outflank-mailman (input) for mailman id 293221;
 Mon, 21 Mar 2022 22:07:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/V3S=UA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nWQBQ-0006KX-At
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 22:07:24 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47fe1199-a963-11ec-a405-831a346695d4;
 Mon, 21 Mar 2022 23:07:22 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0F24AB819FA;
 Mon, 21 Mar 2022 22:07:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 806C9C340E8;
 Mon, 21 Mar 2022 22:07:19 +0000 (UTC)
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
X-Inumbo-ID: 47fe1199-a963-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647900439;
	bh=pHWdQX0Ql3oIVswk/SyCIITMZBJ6rNGnv9UImcD6sB8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hm/Zbo9tJlhlon2BXskSejnkiOAktG1lupf8RwHkVt1L91JBHXRLxWGar7ZGnAVll
	 qAlpZo7A3+ls4NCVM1xMlVWXK6XD0LZIFT6XCPxRtGAsy5vdpqrp9aiNyoh4ZcumMb
	 R/KnyAKS7+wacQAsa2zT93cZ9GiuKndUVnPGT3p9lvrMYRv4aMS8cuEaMhRfGxmxtD
	 deWDeohqSXOYbkgv+TE9+eDPLQru95RC/g0KAAIxZLhz66LRND3dVYlA6vpASdUFh5
	 6Y5cyxtWHDoHzbJwwXdijC2GilSkcGZ/qSXGePGFdniMeSR0mSGxznqzeWNewYZ2DL
	 4XjoGEma+GrWg==
Date: Mon, 21 Mar 2022 15:07:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, bertrand.marquis@arm.com, 
    Volodymyr_Babchuk@epam.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/arm: skip first 32 bytes of zimage32
In-Reply-To: <3d4194b2-b5e8-2fde-6000-9fd4674297ac@xen.org>
Message-ID: <alpine.DEB.2.22.394.2203211442540.2910984@ubuntu-linux-20-04-desktop>
References: <20220320010509.3605525-1-sstabellini@kernel.org> <33f1ea14-4486-be3d-ca9f-a82274078dba@xen.org> <1a8ed108-7485-1ed5-3819-fd921164662b@xen.org> <alpine.DEB.2.22.394.2203211214030.2910984@ubuntu-linux-20-04-desktop>
 <3d4194b2-b5e8-2fde-6000-9fd4674297ac@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; CHARSET=US-ASCII
Content-ID: <alpine.DEB.2.22.394.2203211446241.2910984@ubuntu-linux-20-04-desktop>

On Mon, 21 Mar 2022, Julien Grall wrote:
> > This is the list of kernels that I tried and failed:
> > 
> > - Debian Buster
> > - Debian Bullseye
> > - vanilla 4.9
> > - vanilla 4.10
> 
> Does this mean you where using v4.{9,10}.0 rather than the stable branch?
> 
> Note that AFAICT, 4.10 is not even supported by the kernel communinty (see
> [1]).

Yeah... I was trying to bisect the Debian kernel failure. That is how I
discovered that CONFIG_EFI was causing it. So yes, I only tried the
vanilla, now unsupported, releases.


> > The latest Alpine Linux kernel also doesn't boot, but that one doesn't
> > boot even with the fix for other reason. (More in the other email.)
> > 
> > 
> >  From a Xen gitlab-ci perspective, we just need a kernel that works.
> > Ideally, we wouldn't rebuild our own but reuse an existing kernel
> > because that is one less things to maintain in the gitlab-ci build.
> > 
> > We have a couple of options to make progress on the QEMU32 gitlab-ci
> > test:
> > 
> > 1) use Debian Jessie in gitlab-ci and do not commit the Xen-side fix,
> >     file a Debian bug and revisit the situation in a couple of months
> >     (Debian might get the fix in the meantime)
> 
> Why do we need to use Debian here? Couldn't we use Ubuntu (or any distros that
> have a newer kernel)?

We could use something else but see below.


> > 2) commit the Xen fix and use Debian Bullseye right now
> > 
> > 3) do not commit the Xen fix and build our own kernel now
> > 
> > 
> > All of these options work. My preference is 1) or 2).
> > 
> > Between 1) and 2) I have a slight preference for 2) for this reason: I
> > know that in Open Source we try to fix bugs wherever they are (kernel
> > project, QEMU project, Debian project) rather than working around them,
> > but in this case it looks like there is a significant amount of binaries
> > out there that require an update before they can boot on Xen. 
> 
> My problem here is the bug is not Xen specific. You would exactly have the
> same problem if you were booting on baremetal. But as Andre wrote in his
> commit message, this is only working by luck.
> 
> So we are setting another bad precendence by preserving the luck.
> 
> I appreciate we recently agreed to merge the code to emulate ldr/str. But this
> was based on the fact the Arm Arm doesn't clearly forbid such access. This is
> quite different here as the instructions are UNDEFINED.

Yeah, I understand your point and I also kind of agree.


> So I am not willing to accept a lot of code in Xen just to workaround a
> software bug (see more below).
> 
> > I think it
> > is one of those times where it is worth considering the Xen fix, or
> > should I say workaround, if it is considered harmless.
> 
> The problem with your workaround is now the zImage will be loaded in a
> different aligned. For instance, if the symbol <foo> was 2MB aligned, now, it
> will be aligned to 2MB - 32. See kernel_zimage_load().
> 
> The booting protocol (see Documentation/arm/booting.rst). Doesn't look to
> impose an alignment. But I wouldn't be surprised if there is an assumption
> here.
> 
> Furthermore, there are some problem if the kernel is expected to be loaded a
> specific address.
> 
> I do expect the code to become more convoluted. This would also have to be
> duplicated in the tools side. Overall, this will likely be more than I am
> willing to accept for this issue.
> 
> Therefore I would like to suggest a more simple workaround. Per the commit
> message of the Linux bug fix, U-boot and direct loading are not affected
> because the bit "Z" is set.
> 
> So how about updating PSR_GUEST32_INIT to set Z?

That worked! Excellent suggestion and much safer than the 32 byte
workaround. I tested with the Debian Bullseye kernel.

I think you might have a better suggestion for the commit message.

---
xen/arm: set CPSR Z bit when creating aarch32 guests

The first 32 bytes of zImage32 are NOPs. When CONFIG_EFI is enabled in
the kernel, certain versions of Linux have a bug in the way the initial
NOP instructions gets encoded (invalid encoding), resulting in an
unbootable kernel. See commit a92882a4d270 in the Linux kernel for all
the details.

All kernel releases starting from Linux 4.9 without commit a92882a4d270
are affected.

Fortunately there is a simple workaround: setting the "Z" bit in CPSR
make it so those invalid  NOP instructions are never executed. Setting
the "Z" bit makes those kernel versions bootable again and it is
harmless in the other cases.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 94b31511dd..309684e946 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -361,6 +361,7 @@ typedef uint64_t xen_callback_t;
 #define PSR_DBG_MASK    (1<<9)        /* arm64: Debug Exception mask */
 #define PSR_IT_MASK     (0x0600fc00)  /* Thumb If-Then Mask */
 #define PSR_JAZELLE     (1<<24)       /* Jazelle Mode */
+#define PSR_Z           (1<<30)       /* Zero condition flag */
 
 /* 32 bit modes */
 #define PSR_MODE_USR 0x10
@@ -383,7 +384,7 @@ typedef uint64_t xen_callback_t;
 #define PSR_MODE_EL1t 0x04
 #define PSR_MODE_EL0t 0x00
 
-#define PSR_GUEST32_INIT  (PSR_ABT_MASK|PSR_FIQ_MASK|PSR_IRQ_MASK|PSR_MODE_SVC)
+#define PSR_GUEST32_INIT  (PSR_ABT_MASK|PSR_FIQ_MASK|PSR_IRQ_MASK|PSR_MODE_SVC|PSR_Z)
 #define PSR_GUEST64_INIT (PSR_ABT_MASK|PSR_FIQ_MASK|PSR_IRQ_MASK|PSR_MODE_EL1h)
 
 #define SCTLR_GUEST_INIT    xen_mk_ullong(0x00c50078)

