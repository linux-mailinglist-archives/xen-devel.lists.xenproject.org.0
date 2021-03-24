Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61675348316
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 21:49:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101171.193332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPAQk-0001mg-D0; Wed, 24 Mar 2021 20:48:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101171.193332; Wed, 24 Mar 2021 20:48:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPAQk-0001mH-9b; Wed, 24 Mar 2021 20:48:42 +0000
Received: by outflank-mailman (input) for mailman id 101171;
 Wed, 24 Mar 2021 20:48:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lPAQj-0001mC-AA
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 20:48:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lPAQi-0001Hb-A9; Wed, 24 Mar 2021 20:48:40 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lPAQi-0000gL-0m; Wed, 24 Mar 2021 20:48:40 +0000
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
	bh=WrkBGQkxZKd22Wj1sqgzEgBF+RB9abiUeilPohZU1bU=; b=dwlKDNXQm3ezPr9ZCt09m6pZ36
	WktTC5oNRRRC+klS/l8gPWCupwJ1US6U0gLg8Y5xjaaFExOUsXQqD1WZjgyXv1vJo9mAnc/y74nOL
	+CwSAceM8i+p0bDJ8pqCxgYYdqEMEK4/qByrTwrn1Ih1qnYdGp/GSW+eVuVsmrNqTB0w=;
Subject: Re: [PATCH v2 0/5] xen/arm: smmuv1: Fix stream match conflict issue
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1616428314.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2e1af560-5657-32cf-ad6f-c94086e2309b@xen.org>
Date: Wed, 24 Mar 2021 20:48:38 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <cover.1616428314.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Rahul,

On 22/03/2021 16:11, Rahul Singh wrote:
> This patch is the work to fix the stream match conflict issue when two devices
> have the same stream-id.
> 
> Approach taken is to merge the below commit from Linux driver to fix the
> issue.
> 
> 1. "iommu/arm-smmu: Handle stream IDs more dynamically"
>     commit 21174240e4f4439bb8ed6c116cdbdc03eba2126e
> 2. "iommu/arm-smmu: Consolidate stream map entry state"
>     commit 1f3d5ca43019bff1105838712d55be087d93c0da
> 3. "iommu/arm-smmu: Keep track of S2CR state"
>     commit 8e8b203eabd8b9e96d02d6339e4abce3e5a7ea4b
> 4. "iommu/arm-smmu: Add a stream map entry iterator"
>     commit d3097e39302083d58922a3d1032d7d59a63d263d
> 5. "iommu/arm-smmu: Intelligent SMR allocation"
>     commit 588888a7399db352d2b1a41c9d5b3bf0fd482390
> 
> Changes since v2:
>   - Updated commit message to show the original author of the patch.
>   - Added  Acked-by: Stefano Stabellini <sstabellini@kernel.org>
>   - Addded Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>    
> Rahul Singh (5):
>    xen/arm: smmuv1: Handle stream IDs more dynamically
>    xen/arm: smmuv1: Consolidate stream map entry state
>    xen/arm: smmuv1: Keep track of S2CR state
>    xen/arm: smmuv1: Add a stream map entry iterator
>    xen/arm: smmuv1: Intelligent SMR allocation

I went through the commit messages and they look good to me:

Acked-by: Julien Grall <jgrall@amazon.com>

I have committed the series to my for-next/4.16 branch. They will be 
merged soon in staging.

Cheers,

> 
>   xen/drivers/passthrough/arm/smmu.c | 423 ++++++++++++++++++-----------
>   1 file changed, 262 insertions(+), 161 deletions(-)
> 

-- 
Julien Grall

