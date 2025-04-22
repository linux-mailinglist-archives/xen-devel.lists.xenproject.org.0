Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 113ADA95A3E
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 02:40:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961625.1352995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u71gF-0002pX-SD; Tue, 22 Apr 2025 00:40:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961625.1352995; Tue, 22 Apr 2025 00:40:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u71gF-0002nE-PP; Tue, 22 Apr 2025 00:40:07 +0000
Received: by outflank-mailman (input) for mailman id 961625;
 Tue, 22 Apr 2025 00:40:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eQRL=XI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u71gE-0002aE-Cq
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 00:40:06 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 536a8790-1f12-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 02:40:03 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A13BB49D56;
 Tue, 22 Apr 2025 00:39:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7B81C4CEE4;
 Tue, 22 Apr 2025 00:39:59 +0000 (UTC)
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
X-Inumbo-ID: 536a8790-1f12-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745282401;
	bh=3JuZtQS2AMDcTK1zUkU/gUd0qHWbJelOpwPhhmxip+k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bkToZzlSPQ++p0xVomRhTiNLB7kuLoN87Kceb78Oz5NjrL26E3/0bS95GKwF/PHAm
	 bFiSVF3y+J0abi4a2AtURB9XiqyjlrASpilyo8qWhdCY8w5mJPFT59NDeZw1lceDhI
	 MdjqHupU4hsT4eid64KY40do1hbeeOWQDQ6pPNzWo2ztyDclv3JAYR3BqdMbkrgU2Q
	 xtOo1EX3cKrSAu4QWRXOKPbwta6d31NxyyHFbeoPtWMF2yP34zc1MaArCPRgGFfT6g
	 5/t8oKDw9DRGQnlR3VazY7v0jOz7o+QB6s3Q0Yn5tnBjImV74IcQjUdLcsI7NApKNO
	 4aaoLMxGMnG5A==
Date: Mon, 21 Apr 2025 17:39:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Stewart Hildebrand <stewart.hildebrand@amd.com>, 
    Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH v9 1/8] iommu/arm: Add iommu_dt_xlate()
In-Reply-To: <d44b09bdce11137574f3a54ffd4abb6e8a9b1d5f.1741958647.git.mykyta_poturai@epam.com>
Message-ID: <alpine.DEB.2.22.394.2504211739520.785180@ubuntu-linux-20-04-desktop>
References: <cover.1741958647.git.mykyta_poturai@epam.com> <d44b09bdce11137574f3a54ffd4abb6e8a9b1d5f.1741958647.git.mykyta_poturai@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 14 Mar 2025, Mykyta Poturai wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Move code for processing DT IOMMU specifier to a separate helper.
> This helper will be re-used for adding PCI devices by the subsequent
> patches as we will need exact the same actions for processing
> DT PCI-IOMMU specifier.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Committed

