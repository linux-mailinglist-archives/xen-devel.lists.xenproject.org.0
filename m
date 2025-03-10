Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B43F4A5A685
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 22:57:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906879.1314253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trl7T-0000GX-7I; Mon, 10 Mar 2025 21:57:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906879.1314253; Mon, 10 Mar 2025 21:57:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trl7T-0000De-3u; Mon, 10 Mar 2025 21:57:07 +0000
Received: by outflank-mailman (input) for mailman id 906879;
 Mon, 10 Mar 2025 21:57:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J+5T=V5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1trl7S-0000DY-0v
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 21:57:06 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9981385a-fdfa-11ef-9898-31a8f345e629;
 Mon, 10 Mar 2025 22:57:04 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9A4175C55E4;
 Mon, 10 Mar 2025 21:54:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EEC3C4CEE5;
 Mon, 10 Mar 2025 21:57:00 +0000 (UTC)
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
X-Inumbo-ID: 9981385a-fdfa-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741643822;
	bh=u70lX74nGf6WeYhQ00FrW26GJx/rngU4WmSC2YzeUTY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tcuMmv4Wo4Ns2HX+2H6xTS2ipNdjkgvk47jcGpVsxKzskgr7PzR0RW/QpARNM6nvV
	 e/vc87odTAYxTEeTx5bUJ3ruMMMamDJvE7bFJ3KDe4aTPmgTG+deiCqRSrLcKGSHtN
	 QsDn0cA3pG8Hzm60N+4D5Y7hX+vJQl89d/hFnKsDsBWZ6m4H5t8XT7/bsQvctY4WdS
	 UHPrW/11HJM23wwrVH14en1/J8yHjpO2ZUB6/AFeaJe8/feLNzmmsYwLd3hh21uOuo
	 PCPKmGuVlSulXqs3brAE4VnZMHaqC6cwGJEz3v6ol0W2A7z/CRyOTSo8rDbr4WH+ok
	 gkDnFaZGSZ2FQ==
Date: Mon, 10 Mar 2025 14:56:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: dmkhn@proton.me, xen-devel@lists.xenproject.org, anthony.perard@vates.tech, 
    jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, 
    roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v3] xen/console: make console buffer size configurable
In-Reply-To: <137cc8c6-0727-4253-96b8-45d28ce40943@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2503101455400.3090675@ubuntu-linux-20-04-desktop>
References: <20250306080428.155039-1-dmkhn@proton.me> <137cc8c6-0727-4253-96b8-45d28ce40943@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 10 Mar 2025, Andrew Cooper wrote:
> On 06/03/2025 8:05 am, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Add new CONRING_SHIFT Kconfig parameter to specify the boot console buffer size
> > as a power of 2.
> >
> > The supported range is [14..27] -> [16KiB..128MiB].
> >
> > Set default to 15 (32 KiB).
> >
> > Link: https://gitlab.com/xen-project/xen/-/issues/185
> 
> Minor note, we typically use Resolves: for this, which will auto-close
> the issue when it's merged.

Hi Andrew, I just noticed that "Fixes" is documented under
docs/process/sending-patches.pandoc, but "Resolves" is not. It would be
nice to fill the gap :-)

