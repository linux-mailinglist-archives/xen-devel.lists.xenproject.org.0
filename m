Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0293AE80DD
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 13:23:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024751.1400584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUODI-0001mg-1R; Wed, 25 Jun 2025 11:22:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024751.1400584; Wed, 25 Jun 2025 11:22:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUODH-0001k9-Ut; Wed, 25 Jun 2025 11:22:47 +0000
Received: by outflank-mailman (input) for mailman id 1024751;
 Wed, 25 Jun 2025 11:22:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uUODG-0001k2-3q
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 11:22:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uUODD-001wzb-26;
 Wed, 25 Jun 2025 11:22:43 +0000
Received: from [15.248.3.91] (helo=[10.24.67.243])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uUODD-001ukM-1G;
 Wed, 25 Jun 2025 11:22:43 +0000
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
	bh=StcuBj2e+ppyM+2Dov7j3fySUk+DdVHI589u5gAKDfs=; b=yGTjDs/cb7Jn6HrVrO0cfK9cLo
	tEYomHToH1aOZBby06VZeyg4MmCkP0TS2kBYsDbzgs69vjNy2dRbl0J5Ba08K/Ofpq6v4xyq40zLk
	zqbohHy/tGyul5l/HPiF6dg8kXvK4LwWVnQLvj7eEmQ6l8Cn0ROkXE5hcCPNLFhvd2PQ=;
Message-ID: <52b27bae-b182-488f-afcb-bdbfbc1a495e@xen.org>
Date: Wed, 25 Jun 2025 12:22:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Enhance IPMMU-VMSA driver robustness and debug
 output
Content-Language: en-GB
To: Jahan Murudi <jahan.murudi.zg@renesas.com>,
 "Orzel, Michal" <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <20250620103123.2174529-1-jahan.murudi.zg@renesas.com>
 <445c5594-a003-4cd8-aa46-8544c0543b1c@amd.com>
 <OSOPR01MB12408AB9E8CD52B45381E83FFAB7BA@OSOPR01MB12408.jpnprd01.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <OSOPR01MB12408AB9E8CD52B45381E83FFAB7BA@OSOPR01MB12408.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 25/06/2025 11:28, Jahan Murudi wrote:
> Hi Michal,

Hi Jahan,

> 
> Thank you for your review and the Ack.
> 
>>> +    dsb(sy);
>> Any clue why Linux (mainline) does not do that?

One process remark, we typically comment inline rather than pasting a 
quote and replying at the top of the e-mail.

> 
> The implementation writel() which contains an implicit dsb(st) which likely sufficient for Linux for its Stage-1 IOMMU usage where CPU and IOMMU interactions are coherent.
> However, Xen uses the IPMMU as a Stage-2 IOMMU for non-coherent DMA operations (such as PCIe passthrough), requiring the stronger dsb(sy) to ensure writes fully propagate to the IPMMU hardware before continuing.

I don't follow. Are you saying the IPMMU driver in Linux doesn't 
non-coherent DMA operations?

But even if that's the case, I still don't see why non-coherent DMA 
would matter. From my understanding, here we want to make sure the TLB 
walker sees the change before the flush.

So if the TLB walker is coherent with the rest of the system. Then it 
would be similar to the CPU TLBs where we only need a "dsb st" (well we 
use "nshst" because the TLB is in non-shareable domain).

If the walker is not coherent, then that's a different topic.

Anyway, I am not against using "dsb(sy)". It is stronger than necessary 
but also probably not a massive deal in the TLB flush path.

Cheers,

-- 
Julien Grall


