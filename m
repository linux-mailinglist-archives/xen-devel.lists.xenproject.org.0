Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B00A96BA462
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 01:53:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509864.786497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcFNi-0008S8-1U; Wed, 15 Mar 2023 00:52:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509864.786497; Wed, 15 Mar 2023 00:52:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcFNh-0008QG-Tu; Wed, 15 Mar 2023 00:52:41 +0000
Received: by outflank-mailman (input) for mailman id 509864;
 Wed, 15 Mar 2023 00:52:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=keCs=7H=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pcFNg-0008QA-BJ
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 00:52:40 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ada7aec2-c2cb-11ed-b464-930f4c7d94ae;
 Wed, 15 Mar 2023 01:52:37 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2A6B3B81C3C;
 Wed, 15 Mar 2023 00:52:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F320C4339E;
 Wed, 15 Mar 2023 00:52:32 +0000 (UTC)
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
X-Inumbo-ID: ada7aec2-c2cb-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678841554;
	bh=Pj7Ygwt586tiLVuPtK5dRag7vRC7++AQFNCKq9Gy9z0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Et/kRuTBV+ZIKBtShCQa/at6oA3c4ZLqi1g7IHliizz5rWt5+NKQMh5QzCPLiv9D5
	 4cQbXNX+csNZ+4gxgcCffiOW6NNDaaN+9RNVXvhlH7QB1evk+KXR4L2V9yUkOKilKi
	 C5VTGk60gJqhqSqMYs6RQVZZjJ+wDiX/lJwOlj3ttkTkbSw8tP+BrTBXPgnKwVtQGw
	 OX9lFe8xKwfZU8ncSIlSVhsrAYYFEnB/i8LRjUJgbUfP9w2ZEEUSMzL8bYpePOpgVA
	 OhF72BjXyaZ9/dHjbY3SxG94as9Na2/0Nw6QFaRQGxCDBtg4fNVd1v9Lvg0MI9WS1z
	 HQuXNH2rqyyKA==
Date: Tue, 14 Mar 2023 17:52:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Huang Rui <ray.huang@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
    =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
    Stewart Hildebrand <Stewart.Hildebrand@amd.com>, 
    Xenia Ragiadakou <burzalodowa@gmail.com>, 
    Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>, 
    Chen Jiqian <Jiqian.Chen@amd.com>, Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: Re: [RFC PATCH 1/5] x86/xen: disable swiotlb for xen pvh
In-Reply-To: <ea0e3852-87ba-984b-4010-5eeac3d6c507@suse.com>
Message-ID: <alpine.DEB.2.22.394.2303141747350.863724@ubuntu-linux-20-04-desktop>
References: <20230312120157.452859-1-ray.huang@amd.com> <20230312120157.452859-2-ray.huang@amd.com> <ea0e3852-87ba-984b-4010-5eeac3d6c507@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 13 Mar 2023, Jan Beulich wrote:
> On 12.03.2023 13:01, Huang Rui wrote:
> > Xen PVH is the paravirtualized mode and takes advantage of hardware
> > virtualization support when possible. It will using the hardware IOMMU
> > support instead of xen-swiotlb, so disable swiotlb if current domain is
> > Xen PVH.
> 
> But the kernel has no way (yet) to drive the IOMMU, so how can it get
> away without resorting to swiotlb in certain cases (like I/O to an
> address-restricted device)?

I think Ray meant that, thanks to the IOMMU setup by Xen, there is no
need for swiotlb-xen in Dom0. Address translations are done by the IOMMU
so we can use guest physical addresses instead of machine addresses for
DMA. This is a similar case to Dom0 on ARM when the IOMMU is available
(see include/xen/arm/swiotlb-xen.h:xen_swiotlb_detect, the corresponding
case is XENFEAT_not_direct_mapped).

Jurgen, what do you think? Would you rather make xen_swiotlb_detect
common between ARM and x86?

