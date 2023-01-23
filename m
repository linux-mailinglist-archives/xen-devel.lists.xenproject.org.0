Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23656677885
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 11:07:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482715.748371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJtii-0005EM-Rt; Mon, 23 Jan 2023 10:06:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482715.748371; Mon, 23 Jan 2023 10:06:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJtii-0005BX-Ob; Mon, 23 Jan 2023 10:06:32 +0000
Received: by outflank-mailman (input) for mailman id 482715;
 Mon, 23 Jan 2023 10:06:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pJtih-0005BR-9X
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 10:06:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pJtig-0003po-Gl; Mon, 23 Jan 2023 10:06:30 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.11.171]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pJtig-0000An-AD; Mon, 23 Jan 2023 10:06:30 +0000
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
	bh=18SE7SHjckfBxjtButz+tpG9m2iYFLekvCknyMkwnvw=; b=BJi+ASAGDKHxe6Vd8duudiouhA
	xbz99un8c/Touv/nq60o8yQ6sscsGcuXm/KtKN//S5692jxM7fKRJnj4CuCEBmxTCXuD648/aLsuE
	1R0kKcNBN8q/oV7fno0j8+e0gqqk9gXj4a1/2Dc7hLsZ7p4ALTPCVUz3+UXT3cU4PweU=;
Message-ID: <07dac0bc-6415-259f-6410-0ca285997a81@xen.org>
Date: Mon, 23 Jan 2023 10:06:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [XEN][RFC PATCH v4 09/16] xen/iommu: Introduce
 iommu_remove_dt_device()
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>,
 Vikram Garhwal <vikram.garhwal@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, Luca.Fancellu@arm.com,
 Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20221207061815.7404-1-vikram.garhwal@amd.com>
 <20221207061815.7404-3-vikram.garhwal@amd.com>
 <311dc97d-e924-e9ad-25d3-1135d4b24f7e@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <311dc97d-e924-e9ad-25d3-1135d4b24f7e@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 23/01/2023 10:00, Michal Orzel wrote:
>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>> ---
>>   xen/drivers/passthrough/device_tree.c | 38 +++++++++++++++++++++++++++
>>   xen/include/xen/iommu.h               |  2 ++
>>   2 files changed, 40 insertions(+)
>>
>> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
>> index 457df333a0..a8ba0b0d17 100644
>> --- a/xen/drivers/passthrough/device_tree.c
>> +++ b/xen/drivers/passthrough/device_tree.c
>> @@ -126,6 +126,44 @@ int iommu_release_dt_devices(struct domain *d)
>>       return 0;
>>   }
>>
>> +int iommu_remove_dt_device(struct dt_device_node *np)
>> +{
>> +    const struct iommu_ops *ops = iommu_get_ops();
>> +    struct device *dev = dt_to_dev(np);
>> +    int rc;
>> +
> Aren't we missing a check if iommu is enabled?
> 
>> +    if ( !ops )
>> +        return -EOPNOTSUPP;
> -EINVAL to match the return values returned by other functions?

The meaning of -EINVAL is quite overloaded. So it would be better to use 
a mix of errno to help differentiating the error paths.

In this case, '!ops' means there are no possibility (read "support") to 
remove the device. So I think -EOPNOTUSUPP is suitable.

> 
>> +
>> +    spin_lock(&dtdevs_lock);
>> +
>> +    if ( iommu_dt_device_is_assigned_locked(np) ) {
> Incorrect coding style. The closing brace should be placed on the next line.
> 
>> +        rc = -EBUSY;
>> +        goto fail;
>> +    }
>> +
>> +    /*
>> +     * The driver which supports generic IOMMU DT bindings must have
>> +     * these callback implemented.
>> +     */
>> +    if ( !ops->remove_device ) {
> Incorrect coding style. The closing brace should be placed on the next line.
> 
>> +        rc = -EOPNOTSUPP;
> -EINVAL to match the return values returned by other functions?

Ditto.

Cheers,

-- 
Julien Grall

