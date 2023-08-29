Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5452778CF97
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 00:46:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592494.925217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb7Sl-0001zd-9w; Tue, 29 Aug 2023 22:45:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592494.925217; Tue, 29 Aug 2023 22:45:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb7Sl-0001y9-6i; Tue, 29 Aug 2023 22:45:31 +0000
Received: by outflank-mailman (input) for mailman id 592494;
 Tue, 29 Aug 2023 22:45:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jw1q=EO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qb7Sj-0001y3-HL
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 22:45:29 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf7c1087-46bd-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 00:45:28 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A463B61908;
 Tue, 29 Aug 2023 22:45:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0792FC433C8;
 Tue, 29 Aug 2023 22:45:24 +0000 (UTC)
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
X-Inumbo-ID: bf7c1087-46bd-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693349126;
	bh=7OZTdNKDRjgHUlBJQ2wUHE8VVryGQAOnhzdDkxY/wR8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=taSi0ntRj0y1/UMUOg0ZkvHhkhnnbB55Uxuh+uibTM8qwW/TiZnpRKv99yV4IoRx3
	 WzqGJ9phxO54c1OsfLv2th/j0tB/Ocifo67u39KwcWgoVs/mBE8cbVf4Df3iOJUgPo
	 SnBFIr/VpVZaV3vvTXCAQVShz28aPW34E0uzAarLTmpD5e8B2Q+LZ9nGJWG0Q41788
	 CfNqe1/5vnIhvDTs9ykVV0Owh1335aa6SGVN7GvxnX7wtQsgqfYK2Eb5HHd7pq/jaR
	 mGLuuoydc6oKMQBW3l0bxCeBZAOnKmBux57OAyTKt1ANNYPxsQnRmEBj/fKnxbm1ca
	 g2O5XGaHk+CSQ==
Date: Tue, 29 Aug 2023 15:45:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: Vikram Garhwal <vikram.garhwal@amd.com>, xen-devel@lists.xenproject.org, 
    sstabellini@kernel.org, julien@xen.org, Rahul Singh <rahul.singh@arm.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN][PATCH v10 12/20] xen/smmu: Add remove_device callback for
 smmu_iommu ops
In-Reply-To: <32922c58-b9b4-26a1-42ef-426fb9a4b8af@amd.com>
Message-ID: <alpine.DEB.2.22.394.2308291543430.6458@ubuntu-linux-20-04-desktop>
References: <20230825080222.14247-1-vikram.garhwal@amd.com> <20230825080222.14247-13-vikram.garhwal@amd.com> <32922c58-b9b4-26a1-42ef-426fb9a4b8af@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 29 Aug 2023, Michal Orzel wrote:
> On 25/08/2023 10:02, Vikram Garhwal wrote:
> > Add remove_device callback for removing the device entry from smmu-master using
> > following steps:
> > 1. Find if SMMU master exists for the device node.
> > 2. Check if device is currently in use.
> Since you removed a call to iommu_dt_device_is_assigned_locked(), you do not check it from SMMU, right?
> You are relying on a check done in iommu_remove_dt_device().
> This wants to be mentioned. However, Julien suggested to do the check for internal SMMU state.
> Looking at the code, when the device is assigned, we do:
> dev_iommu_domain(dev) = domain;
> and when de-assigned:
> dev_iommu_domain(dev) = NULL;
> 
> This means that before calling remove_smmu_master() you could do:
> 
> /* Make sure device is not assigned */
> if (dev_iommu_domain(dev))
>     return -EBUSY;
> 
> @Julien, @Stefano?

I think it is OK without it, as we have a call to
iommu_dt_device_is_assigned_locked(np) already in
iommu_remove_dt_device?

