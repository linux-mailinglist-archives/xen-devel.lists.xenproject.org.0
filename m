Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA027ADAA6B
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 10:14:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016841.1393781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR4yo-0001MN-HH; Mon, 16 Jun 2025 08:14:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016841.1393781; Mon, 16 Jun 2025 08:14:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR4yo-0001JR-EB; Mon, 16 Jun 2025 08:14:10 +0000
Received: by outflank-mailman (input) for mailman id 1016841;
 Mon, 16 Jun 2025 08:14:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uR4ym-0001JL-Nr
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 08:14:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uR4yi-004SUB-2W;
 Mon, 16 Jun 2025 08:14:04 +0000
Received: from [2a02:8012:3a1:0:64b5:81ad:1f26:5fcb]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uR4yi-00775o-1w;
 Mon, 16 Jun 2025 08:14:04 +0000
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
	bh=fHy39jn/6/6mAfxWaxgiVoi3sXyGx8bJ5mNHgpxp3wI=; b=L04yv9knEY0wf+glKqJ/NOAL1h
	o+IsApv5rTQR84vzLtqcHtvYidp/oRzjmQ6cEgHUIoNbcUr8dDlgCe3COoijfb+NtxMBYGJO2u5zS
	e2stGAuwOqwsiCU6TNNz8aY6Pfl2vTqWb2Ax49hVNfD2HOthRqoqCuyXNP90qrdBhtWM=;
Message-ID: <7f3b4494-7dd7-45a4-8d12-6f8012410a86@xen.org>
Date: Mon, 16 Jun 2025 09:14:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Fix P2M root page tables invalidation
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Michal Orzel <michal.orzel@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20250616065648.17517-1-michal.orzel@amd.com>
 <51d57968-0060-4c53-9c7e-3cabd84c0a4a@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <51d57968-0060-4c53-9c7e-3cabd84c0a4a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 16/06/2025 08:35, Jan Beulich wrote:
> On 16.06.2025 08:56, Michal Orzel wrote:
>> Fix the condition part of the for loop in p2m_invalidate_root() that
>> uses P2M_ROOT_LEVEL instead of P2M_ROOT_PAGES. The goal here is to
>> invalidate all root page tables (that can be concatenated), so the loop
>> must iterate through all these pages. Root level can be 0 or 1, whereas
>> there can be 1,2,8,16 root pages. The issue may lead to some pages
>> not being invalidated and therefore the guest access won't be trapped.
>> We use it to track pages accessed by guest for set/way emulation provided
>> no IOMMU, IOMMU not enabled for the domain or P2M not shared with IOMMU.
> 
> IOW no security concerns?

Copying/pasting what I wrote on the security channel for the record. 
(This was sent after you asked on xen-devel, sorry I should have done it 
before hand):

We both looked at the code and concluded that it is guarantreed that 
P2M_ROOT_PAGES >= P2M_ROOT_LEVEL. This means the only issue is an under 
invalidation. The logic is only used for the benefit of invalidating the 
guest memory when using cache flush by set/way. Because of the issue, 
the guest we may not clean & invalidate some RAM belonging to itself. We 
also don't rely on the p2m_invalidate_root() to ensure any scrubbed 
pages content have reached memory. So any under invalidation will only 
impact the guest.

Hence why we concluded it wasn't a security issue.

Cheers,

-- 
Julien Grall


