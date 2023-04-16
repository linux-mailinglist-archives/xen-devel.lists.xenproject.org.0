Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FEA6E399E
	for <lists+xen-devel@lfdr.de>; Sun, 16 Apr 2023 17:10:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521596.810388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1po41B-0004Go-5Q; Sun, 16 Apr 2023 15:10:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521596.810388; Sun, 16 Apr 2023 15:10:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1po41B-0004ES-2e; Sun, 16 Apr 2023 15:10:17 +0000
Received: by outflank-mailman (input) for mailman id 521596;
 Sun, 16 Apr 2023 15:10:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1po41A-0004EM-C1
 for xen-devel@lists.xenproject.org; Sun, 16 Apr 2023 15:10:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1po41A-0005pQ-4D; Sun, 16 Apr 2023 15:10:16 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.23.18]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1po419-0001k7-S3; Sun, 16 Apr 2023 15:10:15 +0000
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
	bh=4PHEj3HFRC40EsIa6IRecoXudbxCFnXZgHSqRkk5cEI=; b=If+rB0+W8safLbTHDt4r0yNLpv
	gPEdI+7l2Dh7snxf2S8bkxjga3YY7hh9fVCa4U639p47190Gb7kt2mdhTZrPJr5laQeWDyA/Jjuab
	AhTb9jE7SqyWTYPLRXlzOH5KlFtd6tyoMcpJq/BltW7Ves0IwPUQ9cbeWA7nnhvHVHh8=;
Message-ID: <7595ba77-899f-6aa2-a65c-64a0b34553ac@xen.org>
Date: Sun, 16 Apr 2023 16:10:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 0/4] P2M improvements for Arm
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230328071334.2098429-1-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230328071334.2098429-1-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 28/03/2023 08:13, Henry Wang wrote:
> There are some clean-up/improvement work that can be done in the
> Arm P2M code triggered by [1] and [2]. These were found at the 4.17
> code freeze period so the issues were not fixed at that time.
> Therefore do the follow-ups here.
> 
> Patch#1 addresses one comment in [1]. It was sent earlier and reviewed
> once. Pick the updated version, i.e. "[PATCH v2] xen/arm: Reduce
> redundant clear root pages when teardown p2m", to this series.
> 
> Patch#2 is a new patch based on v1 comments, this is a pre-requisite
> patch for patch#3 where the deferring of GICv2 CPU interface mapping
> should also be applied for new vGIC.
> 
> Patch#3 and #4 addresses the comment in [2] following the discussion
> between two possible options.
> 
> [1] https://lore.kernel.org/xen-devel/a947e0b4-8f76-cea6-893f-abf30ff95e0d@xen.org/
> [2] https://lore.kernel.org/xen-devel/e6643bfc-5bdf-f685-1b68-b28d341071c1@xen.org/
> 
> v2 -> v3:
> 1. Add Julien's acked-by tag for patch #2.
> 2. Reword the reason why hwdom extra mappings are not touched by this
>     patch in the commit message of patch #3.
> 3. Rework the address check in stage-2 data abort trap so that larger
>     CPU interface size can work fine.
> 4. Correct a typo in original in-code comment, slightly modify
>     the wording to avoid the presence of preemptive/non-preemptive
>     p2m_teardown() call assumption.
> 5. Drop the (now) unnecessary second parameter of p2m_teardown().
> 
> v1 -> v2:
> 1. Move in-code comment for p2m_force_tlb_flush_sync() on top of
>     p2m_clear_root_pages().
> 2. Add a new patch as patch #2.
> 3. Correct style in in-code comment in patch #3.
> 4. Avoid open-coding gfn_eq() and gaddr_to_gfn(d->arch.vgic.cbase).
> 5. Apply same changes for the new vGICv2 implementation, update the
>     commit message accordingly.
> 6. Add in-code comment in old GICv2's vgic_v2_domain_init() and
>     new GICv2's vgic_v2_map_resources() to mention the mapping of the
>     virtual CPU interface is deferred until first access.
> 7. Add reviewed-by and acked-by tags accordingly.
> 
> Henry Wang (4):
>    xen/arm: Reduce redundant clear root pages when teardown p2m
>    xen/arm: Rename vgic_cpu_base and vgic_dist_base for new vGIC
>    xen/arm: Defer GICv2 CPU interface mapping until the first access
>    xen/arm: Clean-up in p2m_init() and p2m_final_teardown()

I have committed the series.

Cheers,

-- 
Julien Grall

