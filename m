Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4985933D658
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 16:04:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98347.186521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMBFB-0003lZ-Mt; Tue, 16 Mar 2021 15:04:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98347.186521; Tue, 16 Mar 2021 15:04:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMBFB-0003l9-Ix; Tue, 16 Mar 2021 15:04:25 +0000
Received: by outflank-mailman (input) for mailman id 98347;
 Tue, 16 Mar 2021 15:04:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lMBFA-0003l2-D6
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 15:04:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lMBF9-0005JL-8V; Tue, 16 Mar 2021 15:04:23 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lMBF8-00040e-TW; Tue, 16 Mar 2021 15:04:23 +0000
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
	bh=CKLsUcxn0nSs2TWPzS8VFxiIR3DQGkyvO4SLheuwtA4=; b=UxK+I724f4EWWRe0jgFIQyJMNH
	/1fND+eKcYOyWZp8tFHsunRNf+GVe5j08Hrsm5RH3f2GCImKDghWP8oog32X7EXI5IpR9mpzZx0M3
	cEOfiohSvI4KPDDlRNJnynIf7SxTxVABvlWTJ/Mu3Ksta2ShsXzin/cDi10u7nHPgmXg=;
Subject: Re: [PATCH 0/5] xen/arm: smmuv1: Fix stream match conflict issue
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1615312254.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7b521058-7e83-2651-aa1b-02098e9bbc19@xen.org>
Date: Tue, 16 Mar 2021 15:04:21 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <cover.1615312254.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Rahul,

On 09/03/2021 18:19, Rahul Singh wrote:
> This patch is the work to fix the stream match conflict issue when two devices
> have the same stream-id.
> 
> Approach taken is to merge the below commit from Linux driver to fix the
> issue.
> 
> 1. "iommu/arm-smmu: Handle stream IDs more dynamically"
>      commit 21174240e4f4439bb8ed6c116cdbdc03eba2126e
> 2. "iommu/arm-smmu: Consolidate stream map entry state"
>      commit 1f3d5ca43019bff1105838712d55be087d93c0da
> 3. "iommu/arm-smmu: Keep track of S2CR state"
>      commit 8e8b203eabd8b9e96d02d6339e4abce3e5a7ea4b
> 4. "iommu/arm-smmu: Add a stream map entry iterator"
>      commit d3097e39302083d58922a3d1032d7d59a63d263d
> 5. "iommu/arm-smmu: Intelligent SMR allocation"
>      commit 588888a7399db352d2b1a41c9d5b3bf0fd482390

A couple of questions:
  * Are they backported verbatim from Linux upstream?
  * Did you check there was no bug fix afterwards?

Cheers,

-- 
Julien Grall

