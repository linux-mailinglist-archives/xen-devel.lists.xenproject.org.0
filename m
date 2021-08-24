Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C72773F5BBB
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 12:09:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170841.311788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mITMi-0008Pj-6z; Tue, 24 Aug 2021 10:09:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170841.311788; Tue, 24 Aug 2021 10:09:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mITMi-0008Me-3f; Tue, 24 Aug 2021 10:09:08 +0000
Received: by outflank-mailman (input) for mailman id 170841;
 Tue, 24 Aug 2021 10:09:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mITMg-0008MY-TQ
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:09:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mITMg-00006O-Nq; Tue, 24 Aug 2021 10:09:06 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mITMg-0004Fh-HU; Tue, 24 Aug 2021 10:09:06 +0000
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
	MIME-Version:Date:Message-ID:References:Cc:To:From:Subject;
	bh=0I4ZBp/Cbv83CjJH0iVXfFo89zGV7f2Di89x7lrrBbo=; b=ujVJn8X6AmJVPltgtLgObSRbYL
	JzTbLccKAihL1vsEMxfIrUXzO1zz/XoAVQVKzSCPv2khlpFruElR+N7Nr9yx3opxeTkTdFMQxNtM1
	R7PkhpW6My56EfXfpNJD6xTbshE/0pDV67daO11i3p3jliKD5WZgNqSQrIBUVfNxniTY=;
Subject: Re: [PATCH v2] xen/arm: smmu: Set/clear IOMMU domain for device
From: Julien Grall <julien@xen.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, sstabellini@kernel.org,
 Volodymyr_Babchuk@epam.com, xen-devel@lists.xenproject.org
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20210818052202.1711084-1-andr2000@gmail.com>
 <4654c3c8-b31b-c017-df76-0a6c3c9fc928@xen.org>
Message-ID: <d038d0d9-607b-cf32-fc54-006b903bf836@xen.org>
Date: Tue, 24 Aug 2021 11:09:04 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <4654c3c8-b31b-c017-df76-0a6c3c9fc928@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 18/08/2021 18:42, Julien Grall wrote:
> On 18/08/2021 06:22, Oleksandr Andrushchenko wrote:
>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>
>> When a device is assigned/de-assigned it is required to properly set
>> IOMMU domain used to protect the device. This assignment was missing,
>> thus it was not possible to de-assign the device:
>>
>> (XEN) Deassigning device 0000:03:00.0 from dom2
>> (XEN) smmu: 0000:03:00.0:  not attached to domain 2
>> (XEN) d2: deassign (0000:03:00.0) failed (-3)
>>
>> Fix this by assigning IOMMU domain on arm_smmu_assign_dev and reset it
>> to NULL on arm_smmu_deassign_dev.
>>
>> Fixes: 06d1f7a278dd ("xen/arm: smmuv1: Keep track of S2CR state")
>>
>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>

I have just committed it.

Cheers,

-- 
Julien Grall

