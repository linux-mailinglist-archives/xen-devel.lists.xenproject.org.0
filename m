Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EECADAA71
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 10:15:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016851.1393792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR4zq-0001vU-Sz; Mon, 16 Jun 2025 08:15:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016851.1393792; Mon, 16 Jun 2025 08:15:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR4zq-0001sy-PR; Mon, 16 Jun 2025 08:15:14 +0000
Received: by outflank-mailman (input) for mailman id 1016851;
 Mon, 16 Jun 2025 08:15:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uR4zp-0001ss-CV
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 08:15:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uR4zp-004SVL-04;
 Mon, 16 Jun 2025 08:15:13 +0000
Received: from [2a02:8012:3a1:0:64b5:81ad:1f26:5fcb]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uR4zo-007779-2l;
 Mon, 16 Jun 2025 08:15:12 +0000
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
	bh=SLkst4DFjN5lE14k+OR7aJJ+TerpwumiVnzjtjwU+AI=; b=5I2ZyNy+EINuRD3Fi7Nzx+Zrg6
	b1z8HGNBYXYTwGOEImmvEfXNNJBqzMoPsIeRgP9+HvUND3esFqe7zkq1NAVNgZIW80GFasZ8aEZXz
	RTDnfsNajHr80qhLazt+KkR6Yr0KhsiHh+E6bGYltbWlbb73+E+WTz0FzNDy8bgplbgQ=;
Message-ID: <6cd8c65a-c440-45e3-9bb1-e8c28e90ae56@xen.org>
Date: Mon, 16 Jun 2025 09:15:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Fix P2M root page tables invalidation
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksii <oleksii.kurochko@gmail.com>
References: <20250616065648.17517-1-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250616065648.17517-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

(+Oleksii)

Hi,

Adding Oleksii for visibility.

On 16/06/2025 07:56, Michal Orzel wrote:
> Fix the condition part of the for loop in p2m_invalidate_root() that
> uses P2M_ROOT_LEVEL instead of P2M_ROOT_PAGES. The goal here is to
> invalidate all root page tables (that can be concatenated), so the loop
> must iterate through all these pages. Root level can be 0 or 1, whereas
> there can be 1,2,8,16 root pages. The issue may lead to some pages
> not being invalidated and therefore the guest access won't be trapped.
> We use it to track pages accessed by guest for set/way emulation provided
> no IOMMU, IOMMU not enabled for the domain or P2M not shared with IOMMU.
> 
> Fixes: 2148a125b73b ("xen/arm: Track page accessed between batch of Set/Way operations")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


