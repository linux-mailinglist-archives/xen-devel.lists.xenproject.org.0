Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C80A957EC
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 23:22:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961530.1352925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6yad-0008Fv-EQ; Mon, 21 Apr 2025 21:22:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961530.1352925; Mon, 21 Apr 2025 21:22:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6yad-0008ET-Bp; Mon, 21 Apr 2025 21:22:07 +0000
Received: by outflank-mailman (input) for mailman id 961530;
 Mon, 21 Apr 2025 21:22:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nRXx=XH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u6yab-0008EL-TH
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 21:22:05 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9841503-1ef6-11f0-9ffb-bf95429c2676;
 Mon, 21 Apr 2025 23:22:00 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E78BFA4BE75;
 Mon, 21 Apr 2025 21:16:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56F15C4CEEA;
 Mon, 21 Apr 2025 21:21:58 +0000 (UTC)
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
X-Inumbo-ID: a9841503-1ef6-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745270519;
	bh=n84rm+nWUrfiGiHjggkh+TNicvKA+F086gGbBaZGyl8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TEOQ2NyVgLwh+neZaT7FxsioXJPJ99NNls+hWhVZHvkzpfZo6vEQ1Jk4gLOPV0cSG
	 Wwx5QNziNI4VLMN0FjQlJX5pIZO0jD1LH9Fzv/Cd0SpYkaNtT77Y3bnUMqsXSrkKHZ
	 6dzkeM0sSbGKD1nlmYoVwtcgqcBt68QmuD3DGBX3zlpQbh1HS5eLh2+CISxG+/qxm1
	 X3UuPgoSyz7IlLOnXgxuOQwYHHqjYUmX48C0mGH2G7tGgcd+DY78gHjm0RZymMkz3w
	 58Hhx60zwn/+EP463l83TjKDhDBC2Lgg8J9gSlVRgs+ZsVgauXGtfNiTKYwEXYfKB4
	 pcgFh1XmYKNOw==
Date: Mon, 21 Apr 2025 14:21:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@amd.com>
cc: xen-devel@lists.xenproject.org, ray.huang@amd.com, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: Re: [PATCH v3 20/20] xen/sysctl: wrap around sysctl hypercall
In-Reply-To: <20250421073723.3863060-21-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2504211421400.785180@ubuntu-linux-20-04-desktop>
References: <20250421073723.3863060-1-Penny.Zheng@amd.com> <20250421073723.3863060-21-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 21 Apr 2025, Penny Zheng wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Wrap sysctl hypercall def and sysctl.o with CONFIG_SYSCTL, and since
> PV_SHIM_EXCLUSIVE needs sorting as a prereq in the future, we move
> them out of PV_SHIM_EXCLUSIVE condition at the same time.
> 
> We also need to remove all transient "#ifdef CONFIG_SYSCTL"-s in sysctl.c.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> v1 -> v2:
> - remove all transient "#ifdef CONFIG_SYSCTL"-s in sysctl.c
> ---
> v2 -> v3:
> - move out of CONFIG_PV_SHIM_EXCLUSIVE condition
> ---
>  xen/common/Makefile          |  2 +-
>  xen/common/sysctl.c          | 12 ------------
>  xen/include/hypercall-defs.c |  8 ++++++--
>  3 files changed, 7 insertions(+), 15 deletions(-)


