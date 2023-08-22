Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5D8784AC7
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 21:47:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588713.920293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYXLN-0001pc-Rk; Tue, 22 Aug 2023 19:47:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588713.920293; Tue, 22 Aug 2023 19:47:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYXLN-0001nj-P2; Tue, 22 Aug 2023 19:47:13 +0000
Received: by outflank-mailman (input) for mailman id 588713;
 Tue, 22 Aug 2023 19:47:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qYXLM-0001nd-E5
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 19:47:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYXLM-00058O-8u; Tue, 22 Aug 2023 19:47:12 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYXLM-0004i0-47; Tue, 22 Aug 2023 19:47:12 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=GiJ6uhqypT4pjYtrWNuNL0lLs2pqGSE2nMq3IATYJEk=; b=m4nAjxrHvE/VuBNs3MXjviuoqR
	wp+8/4WX2XKZLXUBpokwM9L/3FMKRk61KUjw45x65yeXbwvOMqLnRFGzfmMJBCOiNv8Anr3K0MuSo
	NwRUkK+tdPGG2Wi+aXBQKcN9o5HsOBn2vSfiPqtnHDSkO04bE/jylP8phQPPQtQsJInY=;
Message-ID: <62c19920-cfe4-405d-9294-7ed426b3a99f@xen.org>
Date: Tue, 22 Aug 2023 20:47:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v9 10/19] xen/iommu: protect iommu_add_dt_device()
 with dtdevs_lock
Content-Language: en-GB
To: Vikram Garhwal <vikram.garhwal@amd.com>, xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com, sstabellini@kernel.org, jbeulich@suse.com
References: <20230819002850.32349-1-vikram.garhwal@amd.com>
 <20230819002850.32349-11-vikram.garhwal@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230819002850.32349-11-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vikram,

On 19/08/2023 01:28, Vikram Garhwal wrote:
> Protect iommu_add_dt_device() with dtdevs_lock to prevent concurrent access
> to add/remove/assign/deassign.
> With addition of dynamic programming feature(follow-up patches in this series),

Typo: missing space before '('.

> this function can be concurrently access by pci device assign/deassign and also

I couldn't find any use of this function in the PCI code. So are you 
talking about not yet upstreamed patches?

Also, typo: s/access/accessed/

> by dynamic node add/remove using device tree overlays.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

The code itself looks good to me. So I will provide my reviewed-by tag 
once my question about the commit message is answered.

Cheers,

-- 
Julien Grall

