Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 666465BA36E
	for <lists+xen-devel@lfdr.de>; Fri, 16 Sep 2022 02:11:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407716.650297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYyx1-0006hu-9y; Fri, 16 Sep 2022 00:11:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407716.650297; Fri, 16 Sep 2022 00:11:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYyx1-0006f0-6x; Fri, 16 Sep 2022 00:11:23 +0000
Received: by outflank-mailman (input) for mailman id 407716;
 Fri, 16 Sep 2022 00:11:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jeri=ZT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oYywz-0006eu-JD
 for xen-devel@lists.xenproject.org; Fri, 16 Sep 2022 00:11:21 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16d406bb-3554-11ed-a31c-8f8a9ae3403f;
 Fri, 16 Sep 2022 02:11:20 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EDFCA6277F;
 Fri, 16 Sep 2022 00:11:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95BEBC433C1;
 Fri, 16 Sep 2022 00:11:17 +0000 (UTC)
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
X-Inumbo-ID: 16d406bb-3554-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663287078;
	bh=Vy69aml8hU2McMw2JQr1x3Oz7RBNUPYxKERbs9nrDQY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OLTrcrlk//iYOL/3Cj/mI3AkwBU75vOjylohZ4EOEtPteOkOfto7yS/9SXMt7FpJE
	 WjMzBujlqdlR39oRZOwJLgu/MHOIBZqaVFqcaseP5iXjetHW8AIPWC5Udxfi4du+u1
	 PTCyR2HlrDa7/051hMx2UeB/i/OflObry62g/u9eCK6nLQuhRg6FPCnJrVW9J7IcUn
	 XPouayjNXw43swEHL4Mm0/lBXJmVg8pyXVVOrlMTIQsHMs2sj1Ns8m4m5esNP8++OQ
	 XFSarM4KtTv9zMqJVp6iRxU2k5EViSOQylPG/aXwlfnvtjaUZelfutfvpe0d4Ykp+G
	 8g52HMWixRPmg==
Date: Thu, 15 Sep 2022 17:11:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xen/privcmd: remove privcmd_ioctl_mmap()
In-Reply-To: <b5c83169-0b92-1ebe-ae5f-fc7bd4e19b99@suse.com>
Message-ID: <alpine.DEB.2.22.394.2209151709420.157835@ubuntu-linux-20-04-desktop>
References: <20220915083944.10097-1-jgross@suse.com> <8137166b-a4c2-aa26-84f9-7b9b2a7e028e@suse.com> <4a95c3d1-d4e8-9b59-8db8-231b59cdb8f5@suse.com> <b5c83169-0b92-1ebe-ae5f-fc7bd4e19b99@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 15 Sep 2022, Jan Beulich wrote:
> On 15.09.2022 12:20, Juergen Gross wrote:
> > On 15.09.22 11:32, Jan Beulich wrote:
> >> On 15.09.2022 10:39, Juergen Gross wrote:
> >>> The IOCTL_PRIVCMD_MMAP isn't in use by Xen since at least Xen 4.0.
> >>>
> >>> Remove it from the privcmd driver.
> >>>
> >>> Signed-off-by: Juergen Gross <jgross@suse.com>
> >>
> >> Can we reasonably remove an IOCTL, without being entirely certain that
> >> no users exist outside of xen.git?
> > 
> > This is a valid question. I'm not sure how probable it is that such a user
> > is existing. Are there any Xen tool stacks not using the Xen libraries?
> > 
> > If so, why? Do we want to support those use cases?
> 
> I'm afraid I have no answers to these questions, and hence would generally
> want to be conservative with removal of functionality.

I don't know either, but maybe we could at least mark IOCTL_PRIVCMD_MMAP
as deprecated in include/uapi/xen/privcmd.h ?

