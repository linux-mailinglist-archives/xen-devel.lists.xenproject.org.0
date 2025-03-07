Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B31F0A563A3
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 10:22:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904800.1312627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqTuW-0002kx-FE; Fri, 07 Mar 2025 09:22:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904800.1312627; Fri, 07 Mar 2025 09:22:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqTuW-0002if-By; Fri, 07 Mar 2025 09:22:28 +0000
Received: by outflank-mailman (input) for mailman id 904800;
 Fri, 07 Mar 2025 09:22:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tqTuV-0002iV-7S
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 09:22:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tqTuU-006uJ9-2K;
 Fri, 07 Mar 2025 09:22:26 +0000
Received: from [2a02:8012:3a1:0:9517:10f4:44fb:20af]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tqTuU-00CAXt-0s;
 Fri, 07 Mar 2025 09:22:26 +0000
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
	bh=LOO3bsbjLDkKTFTcxSxrHNGTU0H4SpiXVfq/cu5k0cs=; b=5Pd0cXys7d508aC0QRDxr/RK0b
	RKYuWDYiDcGJZcLcY3nYvwESFVsfzQgZUxyPE3ZDOQQVC+mGwN2PxzDhGEGp0LtJgxt3lmYB51l2S
	JcVKH/h2Nn7jMgCOoRlsDHEDqZEODyQXSSZ/nL4sOlvwLF4v540uJPOPCDnklrhhyq58=;
Message-ID: <9476def9-a02a-4676-ab29-92ba7516866b@xen.org>
Date: Fri, 7 Mar 2025 09:22:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] xen/passthrough: Provide stub functions when
 !HAS_PASSTHROUGH
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20250307075818.740649-1-luca.fancellu@arm.com>
 <20250307075818.740649-2-luca.fancellu@arm.com>
 <9a257d60-3047-4d8a-b461-ce793d5f89e8@xen.org>
 <F4801232-DC72-44D4-AF0D-EFDF5D2B3202@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <F4801232-DC72-44D4-AF0D-EFDF5D2B3202@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 07/03/2025 09:20, Luca Fancellu wrote:
>> On 7 Mar 2025, at 09:09, Julien Grall <julien@xen.org> wrote:
>>>   /*
>>>    * The following flags are passed to map (applicable ones also to unmap)
>>>    * operations, while some are passed back by lookup operations.
>>> @@ -209,6 +233,8 @@ struct msi_msg;
>>>   #ifdef CONFIG_HAS_DEVICE_TREE
>>>   #include <xen/device_tree.h>
>>>   +#ifdef CONFIG_HAS_PASSTHROUGH
>>> +
>>>   int iommu_assign_dt_device(struct domain *d, struct dt_device_node *dev);
>>>   int iommu_deassign_dt_device(struct domain *d, struct dt_device_node *dev);
>>>   int iommu_dt_domain_init(struct domain *d);
>>> @@ -238,6 +264,26 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>>>    */
>>>   int iommu_remove_dt_device(struct dt_device_node *np);
>>>   +#else
>>> +
>>> +static inline int iommu_assign_dt_device(struct domain *d,
>>> +                                         struct dt_device_node *dev)
>>> +{
>>> +    return -EINVAL;
>>> +}
>>> +
>>> +static inline int iommu_add_dt_device(struct dt_device_node *np)
>>> +{
>>> +    return 1;
>>
>> I would suggest to add a comment explain what 1 means. IIRC, this means "no iommu" present.
> 
> Would it be ok something like in iommu_domain_init:
> 
> /*
>   * Returns as the real iommu_add_dt_device() would: Error “no iommu" because
>   * !iommu_enabled due to the fact that !HAS_PASSTHROUGH
>   */

That's fine with me. The iommu code is technically maintained by Jan, so 
I will wait for him to confirm he is fine with the patch before committing.

Cheers,

-- 
Julien Grall


