Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC79159F5AE
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 10:49:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392287.630529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQm3N-0003mU-Tq; Wed, 24 Aug 2022 08:48:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392287.630529; Wed, 24 Aug 2022 08:48:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQm3N-0003kr-Qj; Wed, 24 Aug 2022 08:48:01 +0000
Received: by outflank-mailman (input) for mailman id 392287;
 Wed, 24 Aug 2022 08:48:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oQm3M-0003kl-2L
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 08:48:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oQm3L-0008MN-Rl; Wed, 24 Aug 2022 08:47:59 +0000
Received: from [54.239.6.185] (helo=[192.168.29.89])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oQm3L-0007h4-LV; Wed, 24 Aug 2022 08:47:59 +0000
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
	bh=y+l2UXUzZzyiExqKE9ZirkZLH1QDfV3Y+fad2+OSTTE=; b=Y6KojRwhSJK+kCVWa+D6cI5usd
	tDds0auJY/YB3kILOLW8g+vlghDC/DJbrcd/uuYDRCrvULH1GRCUEtzOFFuPHMoMNcjKvN9bn7fpw
	oAdt4ELeEm79ruJ7ljo9nfPMjpdGsjz2wrqJX1r8q35QYt5QHBkoFQiwrIg3Vpfg6iHQ=;
Message-ID: <dfb034eb-edd4-5489-f000-81a77b44c9e4@xen.org>
Date: Wed, 24 Aug 2022 09:47:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [PATCH v2] xen/arm: smmu: Set s2cr to type fault when the devices
 are deassigned
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Rahul Singh <Rahul.Singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <3d254f1c7045bc212c5700c1becde458174e5bf3.1660232299.git.rahul.singh@arm.com>
 <77f76e28-a397-ffc5-5e6e-e286878f4070@xen.org>
 <098BFF1B-DE23-4ACB-A968-12D0B96CB217@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <098BFF1B-DE23-4ACB-A968-12D0B96CB217@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 23/08/2022 11:34, Bertrand Marquis wrote:
> 
> 
>> On 12 Aug 2022, at 10:17, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Rahul,
>>
>> On 11/08/2022 16:42, Rahul Singh wrote:
>>> When devices are deassigned/assigned, SMMU global fault is observed
>>> because SMEs are freed in detach function and not allocated again when
>>> the device is assigned back to the guest.
>>> Don't free the SMEs when devices are deassigned, set the s2cr to type
>>> fault. This way the SMMU will generate a fault if a DMA access is done
>>> by a device not assigned to a guest.
>>> Remove the arm_smmu_master_free_smes() as this is not needed anymore,
>>> arm_smmu_write_s2cr will be used to set the s2cr to type fault.
>>
>> NIT: I would write arm_smmu_write_s2cr() so it is consistent with the line above.
>>
>>> Fixes: 0435784cc75d ("xen/arm: smmuv1: Intelligent SMR allocation")
>>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>>
>> Reviewed-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> @Julien: could you fix the NIT on commit ?

Yes. The patch is now committed.

Cheers,

-- 
Julien Grall

