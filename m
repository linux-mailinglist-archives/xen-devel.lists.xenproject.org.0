Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E9933D704
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 16:17:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98361.186558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMBRE-00052W-In; Tue, 16 Mar 2021 15:16:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98361.186558; Tue, 16 Mar 2021 15:16:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMBRE-000527-FZ; Tue, 16 Mar 2021 15:16:52 +0000
Received: by outflank-mailman (input) for mailman id 98361;
 Tue, 16 Mar 2021 15:16:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lMBRC-000522-Cw
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 15:16:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lMBRB-0005Xp-Bm; Tue, 16 Mar 2021 15:16:49 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lMBRB-0004oa-15; Tue, 16 Mar 2021 15:16:49 +0000
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
	bh=AJCtys3Ycj9+nYGl0ckgjrzm8wyybxIJBMYSMKkBcyI=; b=ldsethmlSM0HcyQbj9dr8Bcwwr
	gM4OsmJ6D/pv7HLf0RMA2QNe7WvumLMSTdrCfcs6ARnl5a239tOQByaO0Wc5b9MYfij7LMFJAnGwT
	uTRI6okO5vOPu1ezy1OqqM80BtDm/WLgQbDBW8lbXRBFYid9Gty241jXr8Y1eDJ39tY8=;
Subject: Re: [PATCH 1/5] xen/arm: smmuv1: Handle stream IDs more dynamically
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1615312254.git.rahul.singh@arm.com>
 <7775719c50c56b801e69d952e4ce255b8da1481c.1615312254.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <0ff580cf-0e06-ae17-32c9-bf8dce26aead@xen.org>
Date: Tue, 16 Mar 2021 15:16:47 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <7775719c50c56b801e69d952e4ce255b8da1481c.1615312254.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Rahul,

On 09/03/2021 18:19, Rahul Singh wrote:
> Backport commit 21174240e4f4439bb8ed6c116cdbdc03eba2126e
> "iommu/arm-smmu: Handle stream IDs more dynamically" from the Linux
> ernel.
> 
> This patch is the preparatory work to fix the stream match conflict
> when two devices have the same stream-id.
> 
> Original commit message:
> 
> Rather than assuming fixed worst-case values for stream IDs and SMR
> masks, keep track of whatever implemented bits the hardware actually
> reports. This also obviates the slightly questionable validation of SMR
> fields in isolation - rather than aborting the whole SMMU probe for a
> hardware configuration which is still architecturally valid, we can
> simply refuse masters later if they try to claim an unrepresentable ID
> or mask (which almost certainly implies a DT error anyway).

For single backported and verbatim commit, it is common to keep the 
origin tags (I usually indent them) to show who is the original author 
of the patch.

Since 7936671da9fbf645d6bb207608f7b81c27f992de from Wei Chen as an example.

Cheers,

-- 
Julien Grall

