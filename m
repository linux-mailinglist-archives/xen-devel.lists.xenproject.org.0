Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1752F781455
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 22:35:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586593.917853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX6Bb-0006OZ-VR; Fri, 18 Aug 2023 20:35:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586593.917853; Fri, 18 Aug 2023 20:35:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX6Bb-0006LE-SO; Fri, 18 Aug 2023 20:35:11 +0000
Received: by outflank-mailman (input) for mailman id 586593;
 Fri, 18 Aug 2023 20:35:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qX6Ba-0006L8-3H
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 20:35:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qX6BV-0003fN-Qf; Fri, 18 Aug 2023 20:35:05 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qX6BV-0008Uy-HS; Fri, 18 Aug 2023 20:35:05 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=lTegecKRxPelLYOnRTCZYrJKhUW0zCESgCNh55pqwHM=; b=65f5upiX6LNzOKDjhIHEYtaem4
	IP60NqNOH4OB6r54oDmi+zvjZzAqm3FoGLKhz02LoKsewVf5zgj7GOnDqh2F0ayOUC/4gw2rYoGqR
	1aACaxeyZlEDfB6neiyJEaHvqiPXj4uuXTEaAgpFscRTRcEy61FwV1tGAemBsaWiGY5w=;
Message-ID: <e667948d-944d-2649-7063-3725cc68ca8c@xen.org>
Date: Fri, 18 Aug 2023 21:35:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
To: Vikram Garhwal <vikram.garhwal@amd.com>, Jan Beulich <jbeulich@suse.com>
Cc: michal.orzel@amd.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230817003947.3849-1-vikram.garhwal@amd.com>
 <20230817003947.3849-10-vikram.garhwal@amd.com>
 <4905ac18-85ba-40c1-4542-7355cecafdf4@suse.com> <ZN/MDcuo+IS0m5Cz@amd.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [XEN][PATCH v8 09/19] xen/iommu: Move spin_lock from
 iommu_dt_device_is_assigned to caller
In-Reply-To: <ZN/MDcuo+IS0m5Cz@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vikram,

On 18/08/2023 20:52, Vikram Garhwal wrote:
> Hi Jan
> On Thu, Aug 17, 2023 at 09:05:44AM +0200, Jan Beulich wrote:
>> On 17.08.2023 02:39, Vikram Garhwal wrote:
>>> --- /dev/null
>>> +++ b/xen/include/xen/iommu-private.h
>>
>> I don't think private headers should live in include/xen/. Judging from only
>> the patches I was Cc-ed on, ...
> Thank you for suggestion. Do you where can i place it then?
> Please see another comment down regarding who might be using this function.
>>
>>> @@ -0,0 +1,28 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * xen/iommu-private.h
>>> + */
>>> +#ifndef __XEN_IOMMU_PRIVATE_H__
>>> +#define __XEN_IOMMU_PRIVATE_H__
>>> +
>>> +#ifdef CONFIG_HAS_DEVICE_TREE
>>> +#include <xen/device_tree.h>
>>> +
>>> +/*
>>> + * Checks if dt_device_node is assigned to a domain or not. This function
>>> + * expects to be called with dtdevs_lock acquired by caller.
>>> + */
>>> +bool_t iommu_dt_device_is_assigned_locked(const struct dt_device_node *dev);
>>> +#endif
>>
>> ... I don't even see the need for the declaration, as the function is used
>> only from the file also defining it. But of course if there is a use
>> elsewhere (in Arm-only code, as is suggested by the description here), then
>> the header (under a suitable name) wants to live under drivers/passthrough/
>> (and of course be included only from anywhere in that sub-tree).
>>
> This is also use in smmu.c:arm_smmu_dt_remove_device_legacy(). This is added in
> 12/19 patch(xen/smmu: Add remove_device callback for smmu_iommu ops).

AFAICT, the caller of this function (iommu_remove_dt_device()) will 
already check if the device was assigned and bail out if that's the case.


So why do we need to check it again in the SMMU driver?

And if you really need to then you most likely want to check the 
internal state of the SMMU driver rather than the generic state.

Cheers,

-- 
Julien Grall

