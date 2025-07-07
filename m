Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62758AFBDD6
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 23:49:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035844.1408226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYthe-0003Hr-93; Mon, 07 Jul 2025 21:48:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035844.1408226; Mon, 07 Jul 2025 21:48:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYthe-0003GQ-5X; Mon, 07 Jul 2025 21:48:46 +0000
Received: by outflank-mailman (input) for mailman id 1035844;
 Mon, 07 Jul 2025 21:48:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3ai=ZU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uYthc-0003GK-MT
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 21:48:44 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25d879a8-5b7c-11f0-b894-0df219b8e170;
 Mon, 07 Jul 2025 23:48:42 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7620F5C5D9D;
 Mon,  7 Jul 2025 21:48:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FE28C4CEE3;
 Mon,  7 Jul 2025 21:48:40 +0000 (UTC)
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
X-Inumbo-ID: 25d879a8-5b7c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751924921;
	bh=B9tTwaZKTg1VY+4CAzhaqp6t+WdMJypxMOj2/qFH31I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jdiMenNqQuRNvxv1yTot0lsQlSjft+GAl3LoFVE8AFR0s1sxCrrHUVTwGWoN575gz
	 uSfBqNCE2zcFlY5Y1HFkSdFGDTIWO3gVP3bRNSeQWtlQ5oYfgTnBfz2s2Li9mWK8An
	 hYXVZTtdaAhvvPdjw/zO0Uk94xxwlS758FDwAnQWD+2P8iCcofR/nbAo5tQdejMWsb
	 un4vIKsYhlNEwZCPL0aMwTjjV1n84OkiGP4hfXCZsNfUh66tKIsXeU8p0yidUxJ03M
	 TGma/3z3RVm7ZfNKT1i+6AsdiMkToF7jSc55G+CgaXW2u4Rqskke+MZWyHWCSVP2ao
	 uYrp4mPmC0WQg==
Date: Mon, 7 Jul 2025 14:48:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Michal Orzel <michal.orzel@amd.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Fix booting hwdom/1:1 domU with
 CONFIG_GRANT_TABLE=n
In-Reply-To: <1EF5D001-222C-4FBF-BAC1-FA1A2D4BFCA7@arm.com>
Message-ID: <alpine.DEB.2.22.394.2507071448330.605088@ubuntu-linux-20-04-desktop>
References: <20250625101230.49653-1-michal.orzel@amd.com> <1EF5D001-222C-4FBF-BAC1-FA1A2D4BFCA7@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-493684314-1751924921=:605088"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-493684314-1751924921=:605088
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 30 Jun 2025, Luca Fancellu wrote:
> Hi Michal,
> 
> > On 25 Jun 2025, at 11:12, Michal Orzel <michal.orzel@amd.com> wrote:
> > 
> > At the moment, we unconditionally allocate space for grant table region
> > membank and add it in the membanks array to find_unallocated_memory() to
> > find unused memory. In case of CONFIG_GRANT_TABLE=n, the size of the
> > region is empty and assertion in rangeset_remove_range() fails when
> > booting hwdom or 1:1 domU without IOMMU. Example:
> > 
> > (XEN) Assertion 's <= e' failed at common/rangeset.c:189
> > ...
> > (XEN) Xen call trace:
> > (XEN)    [<00000a0000218b5c>] rangeset_remove_range+0xbc/0x2d4 (PC)
> > (XEN)    [<00000a00002b8370>] find_unallocated_memory+0x140/0x208 (LR)
> > (XEN)    [<00000a00002cc28c>] make_hypervisor_node+0x310/0x7e0
> > ...
> > 
> > Same issue would occur when booting hwdom with LLC coloring enabled.
> > Fix it by performing conditional allocation and configuration.
> > 
> > Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> The patch looks good to me, I’ve reproduced locally the issue and tested that this patch
> solves it, using FVP.
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> Tested-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-493684314-1751924921=:605088--

