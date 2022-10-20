Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4836059C5
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 10:31:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426288.674623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olQxJ-0000qX-DX; Thu, 20 Oct 2022 08:31:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426288.674623; Thu, 20 Oct 2022 08:31:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olQxJ-0000o0-9J; Thu, 20 Oct 2022 08:31:09 +0000
Received: by outflank-mailman (input) for mailman id 426288;
 Thu, 20 Oct 2022 08:31:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1olQxH-0000nu-BX
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 08:31:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1olQxH-0002gQ-3l; Thu, 20 Oct 2022 08:31:07 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225] helo=[10.85.39.71])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1olQxG-0007YW-TE; Thu, 20 Oct 2022 08:31:07 +0000
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
	bh=jvqPFdVSuH7U+4G6vXCwKN0osyDEPAsFd6qojsAy05Y=; b=fbURFBPjJeFWIGQTCq1Y46j89t
	yljmdPpcgV5/riPWQe8gj48Dmnl8Ui+21X0T8sDMDV0uK0gAuLjBQ2bVZSLTmxyvuqERjq5YDPbfg
	KDrj5i+2JAb/mmzq+k8hUsuQIPgen404NOOOc79C7R8kLo/NpfVwtXjc+7aC0UjS7/kQ=;
Message-ID: <910e5b7a-da5b-d7c9-1236-faa000ed4f5c@xen.org>
Date: Thu, 20 Oct 2022 09:31:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [PATCH v5 2/2] xen/arm: p2m: Populate pages for GICv2 mapping in
 p2m_init()
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221018142346.52272-1-Henry.Wang@arm.com>
 <20221018142346.52272-3-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221018142346.52272-3-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 18/10/2022 15:23, Henry Wang wrote:
> Hardware using GICv2 needs to create a P2M mapping of 8KB GICv2 area
> when the domain is created. Considering the worst case of page tables
> which requires 6 P2M pages as the two pages will be consecutive but not
> necessarily in the same L3 page table and keep a buffer, populate 16
> pages as the default value to the P2M pages pool in p2m_init() at the
> domain creation stage to satisfy the GICv2 requirement. For GICv3, the
> above-mentioned P2M mapping is not necessary, but since the allocated
> 16 pages here would not be lost, hence populate these pages
> unconditionally.
> 
> With the default 16 P2M pages populated, there would be a case that
> failures would happen in the domain creation with P2M pages already in
> use. To properly free the P2M for this case, firstly support the
> optionally preemption of p2m_teardown(), then call p2m_teardown() and
> p2m_set_allocation(d, 0, NULL) non-preemptively in p2m_final_teardown().
> As non-preemptive p2m_teardown() should only return 0, use a
> BUG_ON to confirm that.
> 
> Since p2m_final_teardown() is called either after
> domain_relinquish_resources() where relinquish_p2m_mapping() has been
> called, or from failure path of domain_create()/arch_domain_create()
> where mappings that require p2m_put_l3_page() should never be created,
> relinquish_p2m_mapping() is not added in p2m_final_teardown(), add
> in-code comments to refer this.
> 
> Fixes: cbea5a1149ca ("xen/arm: Allocate and free P2M pages from the P2M pool")
> Suggested-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

I will commit it shortly. Regarding the backports, I will wait for a 
push in to staging/master before doing them.

Cheers,

-- 
Julien Grall

