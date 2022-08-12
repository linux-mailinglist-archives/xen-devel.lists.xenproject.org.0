Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A02590DF5
	for <lists+xen-devel@lfdr.de>; Fri, 12 Aug 2022 11:17:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385461.621115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMQnV-0007Pr-7l; Fri, 12 Aug 2022 09:17:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385461.621115; Fri, 12 Aug 2022 09:17:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMQnV-0007NY-4b; Fri, 12 Aug 2022 09:17:41 +0000
Received: by outflank-mailman (input) for mailman id 385461;
 Fri, 12 Aug 2022 09:17:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oMQnT-0007NS-ID
 for xen-devel@lists.xenproject.org; Fri, 12 Aug 2022 09:17:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oMQnT-0006hi-Cf; Fri, 12 Aug 2022 09:17:39 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=[192.168.11.5])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oMQnT-0005kA-6y; Fri, 12 Aug 2022 09:17:39 +0000
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
	bh=dsa9nfUyPPbYGINBJpS50giJJZQL3qlilX932uitAj4=; b=E1wG9CjRXjKW0rVfsHt9wvECoD
	XpIVq7EwwO2fJ1DIaVROYAr/UnM1+jZK+xSE9Xs3xHtnrAWy46JzociI1K64nGkVR3SHUSlTYmQCD
	1wdpDC9K8Opayk10G/JkJRbbbd9TQGN64D+avDoSMy7f58utFQPfJ6CXtcFs1wndSKq0=;
Message-ID: <77f76e28-a397-ffc5-5e6e-e286878f4070@xen.org>
Date: Fri, 12 Aug 2022 10:17:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Subject: Re: [PATCH v2] xen/arm: smmu: Set s2cr to type fault when the devices
 are deassigned
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <3d254f1c7045bc212c5700c1becde458174e5bf3.1660232299.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3d254f1c7045bc212c5700c1becde458174e5bf3.1660232299.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Rahul,

On 11/08/2022 16:42, Rahul Singh wrote:
> When devices are deassigned/assigned, SMMU global fault is observed
> because SMEs are freed in detach function and not allocated again when
> the device is assigned back to the guest.
> 
> Don't free the SMEs when devices are deassigned, set the s2cr to type
> fault. This way the SMMU will generate a fault if a DMA access is done
> by a device not assigned to a guest.
> 
> Remove the arm_smmu_master_free_smes() as this is not needed anymore,
> arm_smmu_write_s2cr will be used to set the s2cr to type fault.

NIT: I would write arm_smmu_write_s2cr() so it is consistent with the 
line above.

> 
> Fixes: 0435784cc75d ("xen/arm: smmuv1: Intelligent SMR allocation")
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

