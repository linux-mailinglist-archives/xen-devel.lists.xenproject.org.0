Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C9B681BEE
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 21:57:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487207.754749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMbD9-0000mS-Bz; Mon, 30 Jan 2023 20:57:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487207.754749; Mon, 30 Jan 2023 20:57:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMbD9-0000kI-9T; Mon, 30 Jan 2023 20:57:07 +0000
Received: by outflank-mailman (input) for mailman id 487207;
 Mon, 30 Jan 2023 20:57:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fYol=53=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pMbD8-0000k3-1r
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 20:57:06 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a53a2d0e-a0e0-11ed-933c-83870f6b2ba8;
 Mon, 30 Jan 2023 21:57:04 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8EE6B61222;
 Mon, 30 Jan 2023 20:57:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01901C433D2;
 Mon, 30 Jan 2023 20:56:59 +0000 (UTC)
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
X-Inumbo-ID: a53a2d0e-a0e0-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675112221;
	bh=18YOYum/MX28t5WraK0HRv+6cpTf75pxWOESa3rDN7U=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gEPTjUlLKDgS4ilCPg/XHQVbcTPCKG8eMPYNzYsBMDKJgK2KhDVUvdzUzWl4Mo8gm
	 BuNWTJMG1AseSZSZ0wtsR+yzzDLy1m0XxaS/CQRFARJYt4bWPZvAOjNhrUKzw+nqf2
	 byZsTn42UuxkWxCHkX3l7frl0bEhS/4pHZ/ta6uMMZIH1uFGt7oKbOdApd8WXCfqtw
	 QXC8QNaM13wmvMJuJFIqOHanC/ujF+EGk27KFIGRBVP/9Qxdph2L8AIi525YrPBMxK
	 DNjLF1yhujjCBoj4fIqQpdNRufZgnpr6GgxF9ld5E4YpuEhghTZ0tq+9+Gxn62KHvf
	 Xw1djrgQLnYOQ==
Date: Mon, 30 Jan 2023 12:56:55 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Ayan Kumar Halder <ayan.kumar.halder@amd.com>, 
    xen-devel@lists.xenproject.org, stefano.stabellini@amd.com, 
    Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
Subject: Re: [XEN v6] xen/arm: Probe the load/entry point address of an uImage
 correctly
In-Reply-To: <cd184a58-426e-4249-c635-504509734262@xen.org>
Message-ID: <alpine.DEB.2.22.394.2301301256470.132504@ubuntu-linux-20-04-desktop>
References: <20230125112131.19682-1-ayan.kumar.halder@amd.com> <alpine.DEB.2.22.394.2301251302360.1978264@ubuntu-linux-20-04-desktop> <cd184a58-426e-4249-c635-504509734262@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 30 Jan 2023, Julien Grall wrote:
> Hi Stefano,
> 
> On 25/01/2023 21:06, Stefano Stabellini wrote:
> > On Wed, 25 Jan 2023, Ayan Kumar Halder wrote:
> > > Currently, kernel_uimage_probe() does not read the load/entry point
> > > address
> > > set in the uImge header. Thus, info->zimage.start is 0 (default value).
> > > This
> > > causes, kernel_zimage_place() to treat the binary (contained within
> > > uImage)
> > > as position independent executable. Thus, it loads it at an incorrect
> > > address.
> > > 
> > > The correct approach would be to read "uimage.load" and set
> > > info->zimage.start. This will ensure that the binary is loaded at the
> > > correct address. Also, read "uimage.ep" and set info->entry (ie kernel
> > > entry
> > > address).
> > > 
> > > If user provides load address (ie "uimage.load") as 0x0, then the image is
> > > treated as position independent executable. Xen can load such an image at
> > > any address it considers appropriate. A position independent executable
> > > cannot have a fixed entry point address.
> > > 
> > > This behavior is applicable for both arm32 and arm64 platforms.
> > > 
> > > Earlier for arm32 and arm64 platforms, Xen was ignoring the load and entry
> > > point address set in the uImage header. With this commit, Xen will use
> > > them.
> > > This makes the behavior of Xen consistent with uboot for uimage headers.
> > > 
> > > Users who want to use Xen with statically partitioned domains, can provide
> > > non zero load address and entry address for the dom0/domU kernel. It is
> > > required that the load and entry address provided must be within the
> > > memory
> > > region allocated by Xen.
> > > 
> > > A deviation from uboot behaviour is that we consider load address == 0x0,
> > > to denote that the image supports position independent execution. This
> > > is to make the behavior consistent across uImage and zImage.
> > > 
> > > Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> > > ---
> > > 
> > > Changes from v1 :-
> > > 1. Added a check to ensure load address and entry address are the same.
> > > 2. Considered load address == 0x0 as position independent execution.
> > > 3. Ensured that the uImage header interpretation is consistent across
> > > arm32 and arm64.
> > > 
> > > v2 :-
> > > 1. Mentioned the change in existing behavior in booting.txt.
> > > 2. Updated booting.txt with a new section to document "Booting Guests".
> > > 
> > > v3 :-
> > > 1. Removed the constraint that the entry point should be same as the load
> > > address. Thus, Xen uses both the load address and entry point to determine
> > > where the image is to be copied and the start address.
> > > 2. Updated documentation to denote that load address and start address
> > > should be within the memory region allocated by Xen.
> > > 3. Added constraint that user cannot provide entry point for a position
> > > independent executable (PIE) image.
> > > 
> > > v4 :-
> > > 1. Explicitly mentioned the version in booting.txt from when the uImage
> > > probing behavior has changed.
> > > 2. Logged the requested load address and entry point parsed from the
> > > uImage
> > > header.
> > > 3. Some style issues.
> > > 
> > > v5 :-
> > > 1. Set info->zimage.text_offset = 0 in kernel_uimage_probe().
> > > 2. Mention that if the kernel has a legacy image header on top of
> > > zImage/zImage64
> > > header, then the attrbutes from legacy image header is used to determine
> > > the load
> > > address, entry point, etc. Thus, zImage/zImage64 header is effectively
> > > ignored.
> > > 
> > > This is true because Xen currently does not support recursive probing of
> > > kernel
> > > headers ie if uImage header is probed, then Xen will not attempt to see if
> > > there
> > > is an underlying zImage/zImage64 header.
> > > 
> > >   docs/misc/arm/booting.txt         | 30 ++++++++++++++++
> > >   xen/arch/arm/include/asm/kernel.h |  2 +-
> > >   xen/arch/arm/kernel.c             | 58 +++++++++++++++++++++++++++++--
> > >   3 files changed, 86 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
> > > index 3e0c03e065..1837579aef 100644
> > > --- a/docs/misc/arm/booting.txt
> > > +++ b/docs/misc/arm/booting.txt
> > > @@ -23,6 +23,32 @@ The exceptions to this on 32-bit ARM are as follows:
> > >     There are no exception on 64-bit ARM.
> > >   +Booting Guests
> > > +--------------
> > > +
> > > +Xen supports the legacy image header[3], zImage protocol for 32-bit
> > > +ARM Linux[1] and Image protocol defined for ARM64[2].
> > > +
> > > +Until Xen 4.17, in case of legacy image protocol, Xen ignored the load
> > > +address and entry point specified in the header. This has now changed.
> > > +
> > > +Now, it loads the image at the load address provided in the header.
> > > +And the entry point is used as the kernel start address.
> > > +
> > > +A deviation from uboot is that, Xen treats "load address == 0x0" as
> > > +position independent execution (PIE). Thus, Xen will load such an image
> > > +at an address it considers appropriate. Also, user cannot specify the
> > > +entry point of a PIE image since the start address cennot be
> > > +predetermined.
> > > +
> > > +Users who want to use Xen with statically partitioned domains, can
> > > provide
> > > +the fixed non zero load address and start address for the dom0/domU
> > > kernel.
> > > +The load address and start address specified by the user in the header
> > > must
> > > +be within the memory region allocated by Xen.
> > > +
> > > +Also, it is to be noted that if user provides the legacy image header on
> > > top of
> > > +zImage or Image header, then Xen uses the attrbutes of legacy image
> > > header only
> >                                               ^ attributes
> > ^ remove only
> > 
> > > +to determine the load address, entry point, etc.
> > 
> > Also add:
> > 
> > """
> > Known limitation: compressed kernels with a uboot headers are not
> > working.
> > """
> 
> I am not entirely sure where you want this sentence to be added. So...
> 
> > 
> > These few minor changes to the documentation can be done on commit:
> 
> ... can you take care of committing it?

Certainly, done

