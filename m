Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D95647985
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 00:13:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457474.715392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3Q4N-0001oS-FJ; Thu, 08 Dec 2022 23:12:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457474.715392; Thu, 08 Dec 2022 23:12:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3Q4N-0001l0-B4; Thu, 08 Dec 2022 23:12:47 +0000
Received: by outflank-mailman (input) for mailman id 457474;
 Thu, 08 Dec 2022 23:12:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rOXo=4G=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p3Q4L-0001ku-LP
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 23:12:45 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1b800d0-774d-11ed-8fd2-01056ac49cbb;
 Fri, 09 Dec 2022 00:12:44 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 75BA7B824D6;
 Thu,  8 Dec 2022 23:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1F8DC433F2;
 Thu,  8 Dec 2022 23:12:39 +0000 (UTC)
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
X-Inumbo-ID: d1b800d0-774d-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670541161;
	bh=+9wH5vNwqhqkZmbWh8OQpDRxFnfyIpszspFwTC/s0n8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ubdqjekhD916sbtM3uUcn4thgZAJ9uMtwBqX6xDCZZUSE0m3gqR+adM5UZgs4jG4U
	 Bpwk3foWF5xpooQFuNJFOKWpvffwiCTroJ+sEExe1uRPQIt3w3zgl8OMHTAAkh33ec
	 PMbvlahOlnGd78gW48J0O+0wXUn28ueshnshVvpYofAvvng7lVXYrdZn+x+tgRStua
	 DueOfzHUpsoh3zbX+7ElBdmnvi2GVc7Z+0kaKGLBd9Pcxc6KPdv6L25GOhnGg4Hva5
	 EgVlGt1w1DMrHLJdEpZKzLnwuDg17PBXkavjqtxbghTiW/1agxUr+uge4VjhCKPTQC
	 gQxuHjko2pHiw==
Date: Thu, 8 Dec 2022 15:12:38 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayankuma@amd.com>
cc: Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
    Ayan Kumar Halder <ayan.kumar.halder@amd.com>, 
    xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    stefanos@xilinx.com, Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [XEN v1] xen/Arm: Probe the entry point address of an uImage
 correctly
In-Reply-To: <ca2db58b-0183-8972-0336-25bcabc99824@amd.com>
Message-ID: <alpine.DEB.2.22.394.2212081510070.2965472@ubuntu-linux-20-04-desktop>
References: <20221208124929.55268-1-ayan.kumar.halder@amd.com> <1ad3ee8c-991f-6e15-255f-ccc24dd5b84f@xen.org> <e8aff19a-4992-9d35-4e78-9e64aec384f9@amd.com> <00ab59fa-d449-255b-bfe3-aaacb87e34dd@xen.org> <ca2db58b-0183-8972-0336-25bcabc99824@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-642912410-1670541160=:2965472"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-642912410-1670541160=:2965472
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 8 Dec 2022, Ayan Kumar Halder wrote:
> On 08/12/2022 16:53, Julien Grall wrote:
> > Hi,
> Hi,
> > 
> > On 08/12/2022 15:24, Michal Orzel wrote:
> > > On 08/12/2022 14:51, Julien Grall wrote:
> > > > Caution: This message originated from an External Source. Use proper
> > > > caution when opening attachments, clicking links, or responding.
> > > > 
> > > > 
> > > > Hi,
> > > > 
> > > > Title extra NIT: I have seen it multiple time and so far refrain to say
> > > > it. Please use 'arm' rather than 'Arm'. This is for consistency in the
> > > > way we name the subsystem in the title.
> > > > 
> > > > On 08/12/2022 12:49, Ayan Kumar Halder wrote:
> > > > > Currently, kernel_uimage_probe() does not set info->zimage.start. As a
> > > > > result, it contains the default value (ie 0). This causes,
> > > > > kernel_zimage_place() to treat the binary (contained within uImage) as
> > > > > position independent executable. Thus, it loads it at an incorrect
> > > > > address.
> > > > > 
> > > > > The correct approach would be to read "uimage.ep" and set
> > > > > info->zimage.start. This will ensure that the binary is loaded at the
> > > > > correct address.
> > > > 
> > > > In non-statically allocated setup, a user doesn't know where the memory
> > > > for dom0/domU will be allocated.
> > > > 
> > > > So I think this was correct to ignore the address. In fact, I am worry
> > > > that...
> > > > 
> > > > > 
> > > > > Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> > > > > ---
> > > > > 
> > > > > I uncovered this issue while loading Zephyr as a dom0less domU with
> > > > > Xen on
> > > > > R52 FVP. Zephyr builds with static device tree. Thus, the load address
> > > > > is
> > > > > always fixed.
> > > > > 
> > > > >    xen/arch/arm/kernel.c | 2 ++
> > > > >    1 file changed, 2 insertions(+)
> > > > > 
> > > > > diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
> > > > > index 2556a45c38..e4e8c67669 100644
> > > > > --- a/xen/arch/arm/kernel.c
> > > > > +++ b/xen/arch/arm/kernel.c
> > > > > @@ -222,6 +222,8 @@ static int __init kernel_uimage_probe(struct
> > > > > kernel_info *info,
> > > > >        if ( len > size - sizeof(uimage) )
> > > > >            return -EINVAL;
> > > > > 
> > > > > +    info->zimage.start = be32_to_cpu(uimage.ep);
> > > > ... this will now ended up to break anyone that may have set an address
> > > > but didn't care where it should be loaded.
> > > > 
> > > > I also understand your use case but now, we have contradictory
> > > > approaches. I am not entirely sure how we can solve it. We may have to
> > > > break those users (Cc some folks that may use it). But we should figure
> > > > out what is the alternative for them.
> > > > 
> > > > If we decide to break those users, then this should be documented in the
> > > > commit message and in docs/misc/arm/booting.txt (which interestingly
> > > > didn't mention uImage).
> > > > 
> > > So the first issue with Zephyr is that it does not support zImage protocol
> > > for arm32.
> > > Volodymyr added support only for Image header for arm64 Zephyr.
> > > I guess this is why Ayan, willing to boot it on Xen (arm32), decided to
> > > add u-boot header.
> > 
> > If that's the only reason, then I would rather prefer if we go with zImage
> > for a few reasons:
> >  - The zImage protocol has at least some documentation (not perfect) of the
> > expected state of the memory/registers when jumping to the image.
> >  - AFAICT libxl is not (yet) supporting uImage. So this means zephyr cannot
> > be loaded on older Xen releases (not great).
> 
> I am exploring for a similar option as Volodymyr ie support zimage protocol
> for arm32.
> 
> But for that I need some public documentation that explains the zimage header
> format for arm32.
> 
> Refer xen/arch/arm/kernel.c
> 
> #define ZIMAGE32_MAGIC_OFFSET 0x24
> #define ZIMAGE32_START_OFFSET 0x28
> #define ZIMAGE32_END_OFFSET   0x2c
> #define ZIMAGE32_HEADER_LEN   0x30
> 
> #define ZIMAGE32_MAGIC 0x016f2818
> 
> Is this documented anywhere ?
> 
> I had a look at
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/arm/booting.rst
> , but there is nothing that explains the header format.

I think this is the closest to documentation of it:

http://www.simtec.co.uk/products/SWLINUX/files/booting_article.html

--8323329-642912410-1670541160=:2965472--

