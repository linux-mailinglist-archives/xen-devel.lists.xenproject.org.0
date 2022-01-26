Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EF649C06A
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 02:03:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260627.450443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCWiC-00049z-BU; Wed, 26 Jan 2022 01:03:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260627.450443; Wed, 26 Jan 2022 01:03:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCWiC-000489-8F; Wed, 26 Jan 2022 01:03:00 +0000
Received: by outflank-mailman (input) for mailman id 260627;
 Wed, 26 Jan 2022 01:02:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pz6t=SK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nCWiA-000483-LO
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 01:02:58 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b23d1c40-7e43-11ec-8f75-fffcc8bd4f1a;
 Wed, 26 Jan 2022 02:02:56 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7E41561511;
 Wed, 26 Jan 2022 01:02:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88EB7C340E0;
 Wed, 26 Jan 2022 01:02:54 +0000 (UTC)
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
X-Inumbo-ID: b23d1c40-7e43-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643158974;
	bh=rA0hWKMmMrB+gFtIdVMu0r46MpGhkpm2ydmZjiFt7Sc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jucYhFUSa7E3Ky3NBWuWSeOHfrhOPkq1GL+/t+nPqLI5uvUDxTWNJORsCpupl/Trf
	 TMfcIZQ3BS8wbrQ/TULNi4ice30huGHHnK9h4+MprefbIbHjk/p4NOMcITPvlRt/BE
	 eQu83I6tGDSZkVBh1OQiahkq7WeX7X2tSBMxtDlYk74wF1LyJw1uWp9UIwGW7OfnbU
	 TPZga7UpWSW317ubb3OhzwT/foz6ZcgnDZxW3oTDnY3u4MAxvc4VS6N0yv09dG9+iZ
	 oMdlqbmYcQ4ouDO1tfMU28GWtcWsmxKQuYFpkI6gHlvH9Oy8qP8BDEWfcIOT85ziaE
	 FHwPLEcAvNvhQ==
Date: Tue, 25 Jan 2022 17:02:53 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Juergen Gross <jgross@suse.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Luca Miccio <lucmiccio@gmail.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    Penny Zheng <Penny.Zheng@arm.com>
Subject: Re: [XEN PATCH v2 3/5] xen/arm: configure dom0less domain for enabling
 xenstore after boot
In-Reply-To: <62b2ebe5-5b15-ab0e-97ee-c1a6f5a2c2c1@xen.org>
Message-ID: <alpine.DEB.2.22.394.2201251659550.27308@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201121646290.19362@ubuntu-linux-20-04-desktop> <20220113005855.1180101-3-sstabellini@kernel.org> <B458F1F7-4DF0-4919-8E16-11E889A9ABB2@arm.com> <62b2ebe5-5b15-ab0e-97ee-c1a6f5a2c2c1@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 23 Jan 2022, Julien Grall wrote:
> On 13/01/2022 14:15, Bertrand Marquis wrote:
> > Hi Stefano,
> > 
> > + Penny in CC for the question.
> > 
> > > On 13 Jan 2022, at 00:58, Stefano Stabellini <sstabellini@kernel.org>
> > > wrote:
> > > 
> > > From: Luca Miccio <lucmiccio@gmail.com>
> > > 
> > > If "xen,enhanced" is enabled, then add to dom0less domains:
> > > 
> > > - the hypervisor node in device tree
> > > - the xenstore event channel
> > > 
> > > The xenstore event channel is also used for the first notification to
> > > let the guest know that xenstore has become available.
> > > 
> > > Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> > > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > > CC: Julien Grall <julien@xen.org>
> > > CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> > > CC: Bertrand Marquis <bertrand.marquis@arm.com>
> > 
> > Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > 
> > Just one question: GUEST_GNTTAB_BASE is fixed but could it be a problem for
> > a direct map guest in the future ?
> It will be an issue. I think we can re-use the same method as we do in dom0
> (see find_gnttab_region()).

Good idea. I prototyped it and it works fine.  I am not going to add the
patch to this series because it needs Penny's but I can easily provide a
patch to her for it.

