Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEC567602B
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 23:31:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482196.747593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIzuV-00063N-DT; Fri, 20 Jan 2023 22:30:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482196.747593; Fri, 20 Jan 2023 22:30:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIzuV-000610-9d; Fri, 20 Jan 2023 22:30:59 +0000
Received: by outflank-mailman (input) for mailman id 482196;
 Fri, 20 Jan 2023 22:30:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wqBo=5R=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pIzuU-00060u-HB
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 22:30:58 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b2bea67-9912-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 23:30:57 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D2A5262098;
 Fri, 20 Jan 2023 22:30:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A051C433EF;
 Fri, 20 Jan 2023 22:30:54 +0000 (UTC)
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
X-Inumbo-ID: 1b2bea67-9912-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674253855;
	bh=h52ElCM10Z0p5uVE/m+qQ5BRAyYedUn9CRq/B3e7F2c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bDoFKdH5REjD2HBlZQDeRHqKuB2T/OPf8VWR8v/90lvGG1vdLHeT1OPUCqvyXByb4
	 NJP70kZI5s6rGrfYoGqylVNX+2u94cYmXau9QEnGGIrYmeD4dAsbRT4NeKO1KE0sMG
	 zGu1i10TQdN3wdx8uFUS7Sams6/qSHJRGJc9Z8WSgMjvusXesN53rKRL7k8b0n/GeB
	 OI3ySpv3vgtHrpMdVUKkkviHevkyVgNx3v3jMDYMwgLvys3OeGgEpRlRA0elawPpGy
	 tjWt9myV+duqsDWQKw5GOMAEImlGFxG26w9OKFxBX4PlyWzrllPASRU6MCd6c3d03t
	 SI+YFbiG9xLzQ==
Date: Fri, 20 Jan 2023 14:30:52 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, 
    xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    stefano.stabellini@amd.com, julien@xen.org, Volodymyr_Babchuk@epam.com, 
    bertrand.marquis@arm.com
Subject: Re: [XEN v5] xen/arm: Probe the load/entry point address of an uImage
 correctly
In-Reply-To: <bb7ca965-c9f4-445f-dfe9-d96d0b3d8707@amd.com>
Message-ID: <alpine.DEB.2.22.394.2301201404320.731018@ubuntu-linux-20-04-desktop>
References: <20230113122423.22902-1-ayan.kumar.halder@amd.com> <bb7ca965-c9f4-445f-dfe9-d96d0b3d8707@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Jan 2023, Michal Orzel wrote:
> Hello all,
> 
> On 13/01/2023 13:24, Ayan Kumar Halder wrote:
> > Currently, kernel_uimage_probe() does not read the load/entry point address
> > set in the uImge header. Thus, info->zimage.start is 0 (default value). This
> > causes, kernel_zimage_place() to treat the binary (contained within uImage)
> > as position independent executable. Thus, it loads it at an incorrect
> > address.
> > 
> > The correct approach would be to read "uimage.load" and set
> > info->zimage.start. This will ensure that the binary is loaded at the
> > correct address. Also, read "uimage.ep" and set info->entry (ie kernel entry
> > address).
> > 
> > If user provides load address (ie "uimage.load") as 0x0, then the image is
> > treated as position independent executable. Xen can load such an image at
> > any address it considers appropriate. A position independent executable
> > cannot have a fixed entry point address.
> > 
> > This behavior is applicable for both arm32 and arm64 platforms.
> > 
> > Earlier for arm32 and arm64 platforms, Xen was ignoring the load and entry
> > point address set in the uImage header. With this commit, Xen will use them.
> > This makes the behavior of Xen consistent with uboot for uimage headers.
> > 
> > Users who want to use Xen with statically partitioned domains, can provide
> > non zero load address and entry address for the dom0/domU kernel. It is
> > required that the load and entry address provided must be within the memory
> > region allocated by Xen.
> > 
> > A deviation from uboot behaviour is that we consider load address == 0x0,
> > to denote that the image supports position independent execution. This
> > is to make the behavior consistent across uImage and zImage.
> > 
> > Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> 
> When looking at this patch, I spotted one incorrect Xen behavior related to supporting uImage kernels.
> And if we want to document that we support such kernels, we should take a look at it.
> 
> Xen supports gzip compressed kernels and it tries to decompress them before kernel_XXX_probe.
> For zImage and Image, their respective headers are built into the kernel itself and then such image is compressed.
> This results in a gzip header appearing right at the top of the image and the workflow works smoothly.
> 
> However, uImage header is something that is always added as a last step in the image preparation using mkimage utility
> and always appears right at the top of the image. That is why uImage header has a field "ih_comp" used to inform about the compression type.
> So the uImage gzip compressed image will have the uImage header before gzip header. Because Xen tries to decompress the image
> before probing its header, this will not work for uImage.

It looks like to solve both this problem and also the other one about
zimage64.text_offset we would need to move the kernel_uimage_probe()
call earlier, before kernel_decompress() and before
kernel_zimage64_probe().

However, I can see that this patch is already complex as is, so I would
also be OK if any additional changes (e.g. moving kernel_uimage_probe()
earlier) were done in a separate patch on top.

