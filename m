Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4125D68B1E1
	for <lists+xen-devel@lfdr.de>; Sun,  5 Feb 2023 22:14:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.489908.758463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOmKO-0004K5-Ec; Sun, 05 Feb 2023 21:13:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 489908.758463; Sun, 05 Feb 2023 21:13:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOmKO-0004Hh-Bp; Sun, 05 Feb 2023 21:13:36 +0000
Received: by outflank-mailman (input) for mailman id 489908;
 Sun, 05 Feb 2023 21:13:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pOmKN-0004Hb-8C
 for xen-devel@lists.xenproject.org; Sun, 05 Feb 2023 21:13:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pOmKM-0001Il-SX; Sun, 05 Feb 2023 21:13:34 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pOmKM-0006xp-Nl; Sun, 05 Feb 2023 21:13:34 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=Nzm6hIq1RVb/TSeMEB2Lutm0jbt8Bo9/VctKhfQBWFU=; b=SndVR/Lsxju105+ICxHvx1Xu2g
	4zjo5G6bDMZ8G7GnWAnKuFvrhw1/ludfpeQ3ReOi6pAby2WS0vS3gI+fc6WHjDfd+j7n4UomKQ26a
	sp1AvabF8GLZzAnU+xac2kD50cBBQ4C576Jnz+wEy3IP2hSQXbCthTgwFchEcpWT8uHU=;
Message-ID: <e1b99501-4f46-63f2-3d7a-ffbf920aea8e@xen.org>
Date: Sun, 5 Feb 2023 21:13:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-15-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 14/40] xen/arm64: head: Jump to the runtime mapping in
 enable_mm()
In-Reply-To: <20230113052914.3845596-15-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 13/01/2023 05:28, Penny Zheng wrote:
> At the moment, on MMU system, enable_mm() will return to an address in
> the 1:1 mapping, then each path is responsible to switch to virtual runtime
> mapping. Then remove_identity_mapping() is called to remove all 1:1 mapping.
> 
> Since remove_identity_mapping() is not necessary on MPU system, and we also
> avoid creating empty function for MPU system, trying to keep only one codeflow
> in arm64/head.S, we move path switch and remove_identity_mapping() in
> enable_mm() on MMU system.

AFAICT, remove_identity_mapping() is still using ENTRY(). But you could 
avoid to introduce ENTRY() if you re-order your series so this patch 
happens before the MMU specific code is moved in a separate helper.

> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>   xen/arch/arm/arm64/head.S     | 28 +++++++++++++---------------
>   xen/arch/arm/arm64/head_mmu.S | 33 ++++++++++++++++++++++++++++++---
>   2 files changed, 43 insertions(+), 18 deletions(-)

This will need to be rebased on top of [1] (which will be merged pretty 
soon). There are two main differences:

  1) enable_mmu has an extra parameter to take the root page-tables
  2) the remove_identity_mapping should only be called for the boot CPU.

So I think we want to introduce two functions:
  1) enable_boot_mmu
  2) enable_runtime_mmu

You might need the same for the MPU as I would expect it would be per-CPU.

Cheers,

[1] 20230127195508.2786-1-julien@xen.org

-- 
Julien Grall

