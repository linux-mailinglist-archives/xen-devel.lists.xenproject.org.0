Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B12D7A8AC66
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 02:02:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.954709.1348693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4qEk-0004La-Qa; Wed, 16 Apr 2025 00:02:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 954709.1348693; Wed, 16 Apr 2025 00:02:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4qEk-0004JX-Nv; Wed, 16 Apr 2025 00:02:42 +0000
Received: by outflank-mailman (input) for mailman id 954709;
 Wed, 16 Apr 2025 00:02:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RcVf=XC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u4qEi-0004JR-Ep
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 00:02:40 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b701060-1a56-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 02:02:39 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 11B85A4A7B9;
 Tue, 15 Apr 2025 23:57:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E27CC4CEE7;
 Wed, 16 Apr 2025 00:02:36 +0000 (UTC)
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
X-Inumbo-ID: 1b701060-1a56-11f0-9eaf-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744761757;
	bh=thZ2TEjJjpXSWwKUah121xnc550t/L7IdPewqWYEe0k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gRkYe+mFv4+BuPOuCrGQ0MFg20lbFksMwUuMcMYKHCV3GUkXcbh2OMKsYzWA+kmSu
	 xKA8GHtn6VzXfgx3W2SPgguEwN6GiwePEHSBAuicJEyjJ6/XtzrFH1TYVeJKTiSCh+
	 Rtecz5gLwvxy47l0CyS3phl5p/35GCn64Ye37s5oQA9sD/TbVq5VWgd5IsOk2NhSo9
	 qm2BmXWRlpSLWEOq6vWmCbKeSqf4eHzZopDB3cjrrm71QkLKDLKa+me2oSBTc1Zk+j
	 /HYA5rTeNivEU3A0fCLiTNIQG66TasNVxTj+xw2faFp5eXVRrCSDO3AvxE+d3/vfg5
	 SoLfK+6C6nUZA==
Date: Tue, 15 Apr 2025 17:02:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony@xenproject.org>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] CI: Build with --prefix=/usr rather than setting
 LD_LIBRARY_PATH
In-Reply-To: <Z_598uOF2pBy87jj@l14>
Message-ID: <alpine.DEB.2.22.394.2504151702260.8008@ubuntu-linux-20-04-desktop>
References: <20250415135426.2442073-1-andrew.cooper3@citrix.com> <Z_598uOF2pBy87jj@l14>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 15 Apr 2025, Anthony PERARD wrote:
> On Tue, Apr 15, 2025 at 02:54:26PM +0100, Andrew Cooper wrote:
> > This also moves executables too.  I'm not sure why xilinx-smoke-dom0-x86_64.sh
> > was overriding PATH too, as /usr/local is clearly in PATH for all other tests,
> > but drop that too.
> > 
> > No practical change.
> > 
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

