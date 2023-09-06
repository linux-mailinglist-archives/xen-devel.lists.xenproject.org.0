Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2C97932EC
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 02:38:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595952.929653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdgYc-0003Fi-Cc; Wed, 06 Sep 2023 00:38:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595952.929653; Wed, 06 Sep 2023 00:38:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdgYc-0003CM-9p; Wed, 06 Sep 2023 00:38:10 +0000
Received: by outflank-mailman (input) for mailman id 595952;
 Wed, 06 Sep 2023 00:38:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DwRh=EW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qdgYa-0003CG-Vk
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 00:38:08 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a428ac37-4c4d-11ee-9b0d-b553b5be7939;
 Wed, 06 Sep 2023 02:38:06 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id B5AA4CE1369;
 Wed,  6 Sep 2023 00:38:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E50E8C433C8;
 Wed,  6 Sep 2023 00:37:58 +0000 (UTC)
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
X-Inumbo-ID: a428ac37-4c4d-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693960680;
	bh=hM7OMAxRm413QcZmV4y9sDYXYEsHrgIGYRmgfM+mfBk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FIJZaawMu/gSYZhnXp+k5fW1cNDAChfv4stmQ/Vio++ESgd5okCFP8oxTfQMpMKY2
	 KspjW9ACfWBeSXYZOrE81tn2/juJGTnm0Zsm8rO+KZUrd/IsHMRi44GxpgRntd7Q+x
	 JKD3EnjTIVFgMnibbgA/5U/eNBM+ZF17tceh69/GLlDbSEHObjQH0HhALAQ+dAFfsb
	 k6vbODwouEVFCjPT0mu4UMvYMj1p3gHRJ9y26kUTBn7oVCTIZEMiZ686Sl6z+1hpDu
	 vr7GoARoPax71zjk3cYvPUUa2zIu0TnTu+2ZdfqCOYISGowECutJ14mhLCxQ1D3/fF
	 xkhqoU71rF8pg==
Date: Tue, 5 Sep 2023 17:37:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: Vikram Garhwal <vikram.garhwal@amd.com>, xen-devel@lists.xenproject.org, 
    julien@xen.org, sstabellini@kernel.org, Rahul Singh <rahul.singh@arm.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN][PATCH v11 12/20] xen/smmu: Add remove_device callback for
 smmu_iommu ops
In-Reply-To: <dca9c2b9-aeaf-3628-de2a-846e1b92a0c4@amd.com>
Message-ID: <alpine.DEB.2.22.394.2309051736580.6458@ubuntu-linux-20-04-desktop>
References: <20230901045947.32351-1-vikram.garhwal@amd.com> <20230901045947.32351-13-vikram.garhwal@amd.com> <dca9c2b9-aeaf-3628-de2a-846e1b92a0c4@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 4 Sep 2023, Michal Orzel wrote:
> On 01/09/2023 06:59, Vikram Garhwal wrote:
> > Add remove_device callback for removing the device entry from smmu-master using
> > following steps:
> > 1. Find if SMMU master exists for the device node.
> > 2. Check if device is currently in use.
> Just like in v10: you are not checking it. I asked you to add a check following Julien suggestion
> but you did not reply to it. Even if you do not want to add this extra layer of protection, you
> should mention that you rely on a check in iommu_remove_dt_device() instead. You can wait for Stefano
> to give his opinion (and possibly ack this patch as is).

Yes I would have appreciated a reply on the list. I'll ack it as is.

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

