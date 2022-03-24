Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DB04E5D0B
	for <lists+xen-devel@lfdr.de>; Thu, 24 Mar 2022 03:05:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294109.499926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXCqk-00083J-UZ; Thu, 24 Mar 2022 02:05:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294109.499926; Thu, 24 Mar 2022 02:05:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXCqk-00080c-RL; Thu, 24 Mar 2022 02:05:18 +0000
Received: by outflank-mailman (input) for mailman id 294109;
 Thu, 24 Mar 2022 02:05:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cmcs=UD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nXCqj-00080W-CT
 for xen-devel@lists.xenproject.org; Thu, 24 Mar 2022 02:05:17 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d809a6b2-ab16-11ec-a405-831a346695d4;
 Thu, 24 Mar 2022 03:05:15 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D6F3161967;
 Thu, 24 Mar 2022 02:05:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02165C340E8;
 Thu, 24 Mar 2022 02:05:12 +0000 (UTC)
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
X-Inumbo-ID: d809a6b2-ab16-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648087513;
	bh=KVc+ubNjm8f2ZVAZK8tx9w9HV9EOwLrmeP4DuM0rAOo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dLZKWNN3f3WSW4SkjmxFC+sCrB+NBKMwoBPY5Rf2aLuzv+c+Z1maY1xyBUGiqdX7Z
	 N0yv2cvUtrfgbJIhLBSH1W4G14yPFlzP8l2Al3ldK2egWshvOH/+NuefGQGB8h+F9p
	 lFjJooUM1s+iuAkrdBWmekJ4TZV8kbsC5FewujNqleOVcnGSU9rNby2UnPgGLKbJNG
	 1xYF+wxPUNx82PD7HV+LF8AjRCS4SvMCdX/Gqw9oVzr95oMZz5uppENj0a+bzl+AVk
	 Jjr639QcutaNbD5S2L5eJ+UZxtjl1OE/av6ng/Ot353QaOjIfBlI2D6kI31/6sS4NA
	 IfNAfaSuLyPnA==
Date: Wed, 23 Mar 2022 19:05:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "julien@xen.org" <julien@xen.org>, 
    "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v2] xen/arm: set CPSR Z bit when creating aarch32
 guests
In-Reply-To: <E2220831-D72C-423C-A33F-453C8E851B8D@arm.com>
Message-ID: <alpine.DEB.2.22.394.2203231844240.2910984@ubuntu-linux-20-04-desktop>
References: <20220322202825.418232-1-sstabellini@kernel.org> <E2220831-D72C-423C-A33F-453C8E851B8D@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 23 Mar 2022, Bertrand Marquis wrote:
> > On 22 Mar 2022, at 21:28, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > 
> > The first 32 bytes of zImage are NOPs. When CONFIG_EFI is enabled in the
> > kernel, certain versions of Linux will use an UNPREDICATABLE NOP
> > encoding, sometimes resulting in an unbootable kernel. Whether the
> > resulting kernel is bootable or not depends on the processor. See commit
> > a92882a4d270 in the Linux kernel for all the details.
> > 
> > All kernel releases starting from Linux 4.9 without commit a92882a4d270
> > are affected.
> 
> Can you confirm if those kernels are also affected when started natively ?

Theoretically yes, but in practice only booting on Xen is affected
because:

- the issue cannot happen when booting from u-boot because u-boot sets
  the "Z" bit
- the issue cannot happen when booting with QEMU -kernel because it also
  sets "Z"
- older bootloaders on native skip the first 32 bytes of the start
  address, which also masks this problem

Thus, in practice, I have no idea how one could reproduce the problem on
native.

This info is in the commit message a92882a4d270 on Linux and in-code
comments in the kernel.

 
> > Fortunately there is a simple workaround: setting the "Z" bit in CPSR
> > make it so those invalid NOP instructions are never executed. That is
> > because the instruction is conditional (not equal). So, on QEMU at
> > least, the instruction will end up to be ignored and not generate an
> > exception. Setting the "Z" bit makes those kernel versions bootable
> > again and it is harmless in the other cases.
> 
> I agree with Jan here. This will never be set or should not be expected
> to be set by anyone when started.
> It feels to me that we are introducing an ack for a temporary issue in
> Linux which will makes us derive from the behaviour that could be
> expected on native hardware.
> 
> Could you give more details on how blocking this is ? 

Without this change, none of the Debian arm32 kernels boot on Xen after
Jessie (on QEMU).


> Is the kernel update with the fix available on any of the affected distributions ?

None that I could find. I tried Debian Buster, Debian Bullseye, Debian
testing and the latest Alpine Linux. Happy to try more if you give me a
download link or two.


> Depending on the answers I think we could for example have a config around
> this to flag it as workaround for a specific guest issue so that this is only
> activated when needed.

Also note that this alternative workaround also solves the problem,
however it has other drawbacks as Julien described:
[1] https://marc.info/?l=xen-devel&m=164774063802402


My take on this is the following. PSR_GUEST32_INIT is not part of the
ABI so this cannot be considered an ABI change.

But in any case, given that without this change (or another change [1])
most of the kernels out there don't work, is there a point in discussing
ABI breakages? Basically nothing works right now :-D

I think it makes sense to think whether this change could cause a kernel
that used to boot, not to boot anymore. However, I don't think is
possible because:

- we only support zImage on arm32 and "Z" works well with it
- both u-boot and qemu -kernel set "Z" so we would already now if
  something broke



> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > ---
> > Changes in v2:
> > - improve commit message
> > - add in-code comment
> > - move PSR_Z to the beginning
> > ---
> > xen/include/public/arch-arm.h | 8 +++++++-
> > 1 file changed, 7 insertions(+), 1 deletion(-)
> > 
> > diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> > index 94b31511dd..81cee95f14 100644
> > --- a/xen/include/public/arch-arm.h
> > +++ b/xen/include/public/arch-arm.h
> > @@ -361,6 +361,7 @@ typedef uint64_t xen_callback_t;
> > #define PSR_DBG_MASK    (1<<9)        /* arm64: Debug Exception mask */
> > #define PSR_IT_MASK     (0x0600fc00)  /* Thumb If-Then Mask */
> > #define PSR_JAZELLE     (1<<24)       /* Jazelle Mode */
> > +#define PSR_Z           (1<<30)       /* Zero condition flag */
> > 
> > /* 32 bit modes */
> > #define PSR_MODE_USR 0x10
> > @@ -383,7 +384,12 @@ typedef uint64_t xen_callback_t;
> > #define PSR_MODE_EL1t 0x04
> > #define PSR_MODE_EL0t 0x00
> > 
> > -#define PSR_GUEST32_INIT  (PSR_ABT_MASK|PSR_FIQ_MASK|PSR_IRQ_MASK|PSR_MODE_SVC)
> > +/*
> > + * We set PSR_Z to be able to boot Linux kernel versions with an invalid
> > + * encoding of the first 8 NOP instructions. See commit a92882a4d270 in
> > + * Linux.
> > + */
> > +#define PSR_GUEST32_INIT  (PSR_Z|PSR_ABT_MASK|PSR_FIQ_MASK|PSR_IRQ_MASK|PSR_MODE_SVC)
> > #define PSR_GUEST64_INIT (PSR_ABT_MASK|PSR_FIQ_MASK|PSR_IRQ_MASK|PSR_MODE_EL1h)
> > 
> > #define SCTLR_GUEST_INIT    xen_mk_ullong(0x00c50078)
> > -- 
> > 2.25.1
> > 
> 

