Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F10B02A6F
	for <lists+xen-devel@lfdr.de>; Sat, 12 Jul 2025 12:29:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1041784.1412367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaXTs-0005x1-I2; Sat, 12 Jul 2025 10:29:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1041784.1412367; Sat, 12 Jul 2025 10:29:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaXTs-0005tw-EY; Sat, 12 Jul 2025 10:29:20 +0000
Received: by outflank-mailman (input) for mailman id 1041784;
 Sat, 12 Jul 2025 10:29:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uaXTq-0005tq-SO
 for xen-devel@lists.xenproject.org; Sat, 12 Jul 2025 10:29:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uaXTq-00Dmtq-1L;
 Sat, 12 Jul 2025 10:29:18 +0000
Received: from [2a02:8012:3a1:0:700f:1c87:7a7d:6616]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uaXTq-000rht-0f;
 Sat, 12 Jul 2025 10:29:18 +0000
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
	bh=RO61Ti9KjvziLDhlGskKEcOuV71kUL0b/l5nT7h7vHs=; b=deerGy+DHuvUo+VSvrzfGy5cxD
	0LogKLyukljeebSedXeR1tMFeFz9X9DFNhAAUXiksp5qRJ2rTzDcmym0HeeAWmwpxQEBuCmIU/vEQ
	kh9sbrDY7lbYCgneCHqhgjWP/4eTeJCN4barZBDaWcxjRWXEqzWpAmiS+bMyrNCE40ZM=;
Message-ID: <a6ad4ea4-8eca-47f6-b814-84aeedd1ac3e@xen.org>
Date: Sat, 12 Jul 2025 11:29:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/arm: Skip loops in init_pdx() when no PDX
 compression is used
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250704075428.33485-1-michal.orzel@amd.com>
 <20250704075428.33485-3-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250704075428.33485-3-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 04/07/2025 08:54, Michal Orzel wrote:
> When CONFIG_PDX_COMPRESSION=n, pdx_init_mask(), pdx_region_mask() and
> pfn_pdx_hole_setup() are just stubs doing nothing. It does not make
> sense to keep the two loops iterating over all the memory banks.

I saw this was already committed. But I have a question. Wouldn't the 
compiler be able to optimize and remove the loops? Asking because we are 
trying to limit the number of #ifdef in the code hence why we have stubs.

Cheers,

-- 
Julien Grall


