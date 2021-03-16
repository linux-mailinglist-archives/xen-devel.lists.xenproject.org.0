Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AD133D67E
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 16:08:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98352.186533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMBJC-00040i-8N; Tue, 16 Mar 2021 15:08:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98352.186533; Tue, 16 Mar 2021 15:08:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMBJC-00040J-55; Tue, 16 Mar 2021 15:08:34 +0000
Received: by outflank-mailman (input) for mailman id 98352;
 Tue, 16 Mar 2021 15:08:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lMBJA-00040E-62
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 15:08:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lMBJ9-0005Ou-72; Tue, 16 Mar 2021 15:08:31 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lMBJ8-0004JU-WE; Tue, 16 Mar 2021 15:08:31 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=88hueI9QdPJDJU5HXKt+1gfDC37JXW57BZzi1Ln4yAY=; b=nmO86/cX0dzU1HQiAMU+2Y0P2p
	lT08dYjEsNQW8HDpRlktKxPQ10ZIlEtDc8bdSVj1jz/8U6hQ11BbxhIKnAd2+VOyam0e8EPBVxVlo
	AYJ5k5XgrBAVm1F26bqZenq1SJYSFUSe42dH55K+FKHfYC8zuP2rwOfXMWcPRLvrDd4E=;
Subject: Re: [PATCH 5/5] xen/arm: smmuv1: Intelligent SMR allocation
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1615312254.git.rahul.singh@arm.com>
 <789abfb57568dcbaba122ea9b68c627e6c9707c4.1615312254.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <299c8294-5f76-2fd6-85ec-d20c0b99368b@xen.org>
Date: Tue, 16 Mar 2021 15:08:29 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <789abfb57568dcbaba122ea9b68c627e6c9707c4.1615312254.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Rahul,

On 09/03/2021 18:19, Rahul Singh wrote:
> Backport 588888a7399db352d2b1a41c9d5b3bf0fd482390
> "iommu/arm-smmu: Intelligent SMR allocation" from the Linux kernel
> 
> This patch fix the stream match conflict issue when two devices have the
> same stream-id.
> 
> Only difference while applying this patch is to use spinlock in place of
> mutex and move iommu_group_alloc(..) function call in
> arm_smmu_add_device(..) function from the start of the function
> to the end.

As you may remember the discussion on the SMMUv3 thread, replacing a 
spinlock by a mutex has consequences. Can you explain why this is fine?

Cheers,

-- 
Julien Grall

