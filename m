Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FA87831BB
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 22:16:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587830.919261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYBJX-0007kF-1q; Mon, 21 Aug 2023 20:15:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587830.919261; Mon, 21 Aug 2023 20:15:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYBJW-0007hM-Uy; Mon, 21 Aug 2023 20:15:50 +0000
Received: by outflank-mailman (input) for mailman id 587830;
 Mon, 21 Aug 2023 20:15:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qYBJV-0007h6-Ui
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 20:15:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYBJR-0000rU-Kh; Mon, 21 Aug 2023 20:15:45 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYBJR-0004Ll-Am; Mon, 21 Aug 2023 20:15:45 +0000
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
	bh=9c70gnoBq74Ea+dYVJRDVhCvaL/ymvGyAQ6wSO2z6io=; b=xmcGNU0H4JRIoRIcAZ7hlWo+Ps
	NsS/U9De4/+gkAb/olLsQjVC0yS72oAAOT0kPXeES267nlDLJqtCRGTBd30x6ZcF0mCRAOh2HSYYQ
	WtzRYoBoWd8sdVnLMbWGZwnHCg7U/lgm7r1Z1lBHqTUZ2pntQLlcIzjW7NCIyKENLEsk=;
Message-ID: <d1b5172e-6d46-d91b-1d42-9e94ff93e810@xen.org>
Date: Mon, 21 Aug 2023 21:15:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [XEN][PATCH v8 09/19] xen/iommu: Move spin_lock from
 iommu_dt_device_is_assigned to caller
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>, michal.orzel@amd.com,
 sstabellini@kernel.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230817003947.3849-1-vikram.garhwal@amd.com>
 <20230817003947.3849-10-vikram.garhwal@amd.com>
 <4905ac18-85ba-40c1-4542-7355cecafdf4@suse.com> <ZN/MDcuo+IS0m5Cz@amd.com>
 <e667948d-944d-2649-7063-3725cc68ca8c@xen.org> <ZOO/FDJaqA68eaAl@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ZOO/FDJaqA68eaAl@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 21/08/2023 20:46, Vikram Garhwal wrote:
> Hi Julien
> On Fri, Aug 18, 2023 at 09:35:02PM +0100, Julien Grall wrote:
>> Hi Vikram,
>>
>> On 18/08/2023 20:52, Vikram Garhwal wrote:
>>> Hi Jan
>>> On Thu, Aug 17, 2023 at 09:05:44AM +0200, Jan Beulich wrote:
>>>> On 17.08.2023 02:39, Vikram Garhwal wrote:
>>>>> --- /dev/null
>>>>> +++ b/xen/include/xen/iommu-private.h
>>>>
>>>> I don't think private headers should live in include/xen/. Judging from only
>>>> the patches I was Cc-ed on, ...
>>> Thank you for suggestion. Do you where can i place it then?
>>> Please see another comment down regarding who might be using this function.
>>>>
>>>>> @@ -0,0 +1,28 @@
>>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>>> +/*
>>>>> + * xen/iommu-private.h
>>>>> + */
>>>>> +#ifndef __XEN_IOMMU_PRIVATE_H__
>>>>> +#define __XEN_IOMMU_PRIVATE_H__
>>>>> +
>>>>> +#ifdef CONFIG_HAS_DEVICE_TREE
>>>>> +#include <xen/device_tree.h>
>>>>> +
>>>>> +/*
>>>>> + * Checks if dt_device_node is assigned to a domain or not. This function
>>>>> + * expects to be called with dtdevs_lock acquired by caller.
>>>>> + */
>>>>> +bool_t iommu_dt_device_is_assigned_locked(const struct dt_device_node *dev);
>>>>> +#endif
>>>>
>>>> ... I don't even see the need for the declaration, as the function is used
>>>> only from the file also defining it. But of course if there is a use
>>>> elsewhere (in Arm-only code, as is suggested by the description here), then
>>>> the header (under a suitable name) wants to live under drivers/passthrough/
>>>> (and of course be included only from anywhere in that sub-tree).
>>>>
>>> This is also use in smmu.c:arm_smmu_dt_remove_device_legacy(). This is added in
>>> 12/19 patch(xen/smmu: Add remove_device callback for smmu_iommu ops).
>>
>> AFAICT, the caller of this function (iommu_remove_dt_device()) will already
>> check if the device was assigned and bail out if that's the case.
>>
>>
>> So why do we need to check it again in the SMMU driver?
>>
> This was comment from you in v2:
> "Even if the IOMMU subsystem check it, it would be good that the SMMU
> driver also check the device is not currently used before removing it.
> 
> If it is, then we should return -EBUSY."
> Link:https://patchew.org/Xen/1636441347-133850-1-git-send-email-fnu.vikram@xilinx.com/1636441347-133850-7-git-send-email-fnu.vikram@xilinx.com/

A lot of water flown under the bridge since that discussion. If you want 
to check the device is not attached in the SMMU driver, then you should 
use the internal SMMU state rather than the generic state.

You can look at arm_smmu_attach_dev() for an example how to do it.

Cheers,

-- 
Julien Grall

