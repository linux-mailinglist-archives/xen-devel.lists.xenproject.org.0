Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C52B4C4F4F
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 21:09:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279580.477327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNgtX-0006Sk-4V; Fri, 25 Feb 2022 20:08:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279580.477327; Fri, 25 Feb 2022 20:08:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNgtX-0006Q7-1f; Fri, 25 Feb 2022 20:08:51 +0000
Received: by outflank-mailman (input) for mailman id 279580;
 Fri, 25 Feb 2022 20:08:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nNgtV-0006Px-Kk
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 20:08:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nNgtV-0001Qx-DN; Fri, 25 Feb 2022 20:08:49 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.31.13]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nNgtV-0006sr-7X; Fri, 25 Feb 2022 20:08:49 +0000
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
	bh=E3sViSrhk7xmMdXNxQZ441RrrS2eQIzqyhxaILutyPA=; b=7NbXEdKVoeIA15oZznCQio9rOt
	V7uRLwSvL49PqbUJCO8NppjCq4e9A9YYVPqPwZp6zPdlmN9qRLOlV4qUtWtrkmJ7+PylIVDjw2qtr
	/MAxLDWUO/2P2xaQicqVObXRwimv/hp1to+Kg4j74AIErmosv6puuqmOLbVSad4ejTD4=;
Message-ID: <6269ec3d-039e-d68f-771d-c5e088631410@xen.org>
Date: Fri, 25 Feb 2022 20:08:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [RFC PATCH 0/2] Introduce reserved Xenheap
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, wei.chen@arm.com, penny.zheng@arm.com
References: <20220224013023.50920-1-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220224013023.50920-1-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 24/02/2022 01:30, Henry Wang wrote:
> The reserved Xenheap, or statically configured Xenheap, refers to parts
> of RAM reserved in the beginning for Xenheap. Like the static memory
> allocation, such reserved Xenheap regions are reserved by configuration
> in the device tree using physical address ranges.

In Xen, we have the concept of domheap and xenheap. For Arm64 and x86 
they would be the same. But for Arm32, they would be different: xenheap 
is always mapped whereas domheap is separate.

Skimming through the series, I think you want to use the region for both 
domheap and xenheap. Is that correct?

Furthemore, now that we are introducing more static region, it will get 
easier to overlap the regions by mistakes. I think we want to have some 
logic in Xen (or outside) to ensure that none of them overlaps. Do you 
have any plan for that?

> 
> This feature is useful to run Xen on Arm MPU systems, where only a
> finite number of memory protection regions are available. The limited
> number of protection regions places requirement on planning the use of
> MPU protection regions and one or more MPU protection regions needs to
> be reserved only for Xenheap.
> 
> Therefore, this patch series is sent as RFC for comments from the
> community. The first patch introduces the reserved Xenheap and the
> device tree processing code. The second patch adds the implementation of
> the reserved Xenheap pages handling in boot and heap allocator on Arm64.
> 
> Henry Wang (2):
>    docs, xen/arm: Introduce reserved Xenheap memory
>    xen/arm: Handle reserved Xenheap pages in boot/heap allocator
> 
>   docs/misc/arm/device-tree/booting.txt | 43 ++++++++++++++++++++++
>   xen/arch/arm/bootfdt.c                | 52 +++++++++++++++++++++------
>   xen/arch/arm/include/asm/setup.h      |  3 ++
>   xen/arch/arm/setup.c                  | 52 +++++++++++++++++++--------
>   4 files changed, 125 insertions(+), 25 deletions(-)
> 

-- 
Julien Grall

