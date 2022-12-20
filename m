Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CFA651D83
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 10:35:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466815.725760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7Z2K-0002p2-I3; Tue, 20 Dec 2022 09:35:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466815.725760; Tue, 20 Dec 2022 09:35:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7Z2K-0002mn-FI; Tue, 20 Dec 2022 09:35:48 +0000
Received: by outflank-mailman (input) for mailman id 466815;
 Tue, 20 Dec 2022 09:35:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p7Z2J-0002mh-H9
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 09:35:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p7Z2J-0003qc-85; Tue, 20 Dec 2022 09:35:47 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.6.189]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p7Z2J-0008RN-2Y; Tue, 20 Dec 2022 09:35:47 +0000
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
	bh=iQkDUosc5fkvvT8gkag7cr4V83/r4PjbfhI3+Cu0864=; b=aaUG4GUQ9O5BPys51ph5t4gb2L
	bQeKVHuCMoD/ukLu8AAO+jP0DFHja2axjGtHFxOBnfv0tKzzLPiJPglMCMRw35IjI14w/NRNEiD0W
	3TCZI+kuAf+/hCJYNj32reTnIclOlGow5zcncKq0QnIE2SKUl7OeJKeqqc67/lT73/JU=;
Message-ID: <31d758d0-4c2c-3eca-45b5-9fe8f93e2d67@xen.org>
Date: Tue, 20 Dec 2022 09:35:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v3] xen/arm: smmuv3: mark arm_smmu_disable_pasid
 __maybe_unused
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221215212619.78686-1-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221215212619.78686-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 15/12/2022 21:26, Stewart Hildebrand wrote:
> When building with clang 12 and CONFIG_ARM_SMMU_V3=y, we observe the
> following build error:
> 
> drivers/passthrough/arm/smmu-v3.c:1408:20: error: unused function 'arm_smmu_disable_pasid' [-Werror,-Wunused-function]
> static inline void arm_smmu_disable_pasid(struct arm_smmu_master *master) { }
>                     ^
> 
> arm_smmu_disable_pasid is not currently called from anywhere in Xen, but
> it is inside a section of code guarded by CONFIG_PCI_ATS, which may be
> helpful in the future if the PASID feature is to be implemented. Add the
> attribute __maybe_unused to the function.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Reviewed-by: Rahul Singh <rahul.singh@arm.com>

I have committed the patch.

Cheers,

-- 
Julien Grall

