Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC3D3B881A
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jun 2021 20:00:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148233.273938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyeVU-0004Pc-U0; Wed, 30 Jun 2021 18:00:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148233.273938; Wed, 30 Jun 2021 18:00:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyeVU-0004NB-PX; Wed, 30 Jun 2021 18:00:16 +0000
Received: by outflank-mailman (input) for mailman id 148233;
 Wed, 30 Jun 2021 18:00:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lyeVT-0004N5-1c
 for xen-devel@lists.xenproject.org; Wed, 30 Jun 2021 18:00:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lyeVS-0002q8-02; Wed, 30 Jun 2021 18:00:14 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lyeVR-0006Pc-PK; Wed, 30 Jun 2021 18:00:13 +0000
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
	bh=6NwnJyT75rAq/4tGb6rIRlERCRqDIOKV2CFDqtyDaOU=; b=lt1qK4JT3WDXSoDI/5Apvogh3T
	khE8tSSHSaGjauixdoWCtRf70KLamr/olHorswJiKYzg0cWpjERhaazCorncfbxZrq8hZUaleQ9HL
	ea0rqSBs704TEvPRSD+CD8qYLN/twfhaghrm5+LNT0TIyhF/crdS34npjnWYzS2dbzb4=;
Subject: Re: [PATCH] xen/arm: smmuv1: Fixed stream matching register
 allocation
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <612e7f61c19e60019bb7829888342fda95fd36be.1624546532.git.rahul.singh@arm.com>
 <11df0a34-724a-63ad-1822-4bd8aa364ab0@xen.org>
 <BE2AB42D-A896-4FFE-856C-DA494D8DF1C8@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <f1a4cdb5-c525-8d6b-5f4d-7e2f2c090dcf@xen.org>
Date: Wed, 30 Jun 2021 19:00:11 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <BE2AB42D-A896-4FFE-856C-DA494D8DF1C8@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 30/06/2021 18:49, Rahul Singh wrote:
> Hi Julien,

Hi,

>> On 30 Jun 2021, at 10:09 am, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Rahul,
>>
>> On 25/06/2021 17:37, Rahul Singh wrote:
>>> SMR allocation should be based on the number of supported stream
>>> matching register for each SMMU device.
>>> Issue introduced by commit 5e08586afbb90b2e2d56c175c07db77a4afa873c
>>> when backported the patches from Linux to XEN to fix the stream match
>>> conflict issue when two devices have the same stream-id.
>>> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
>>> Tested-by: Stefano Stabellini <sstabellini@kernel.org>
>>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>>> ---
>>>   xen/drivers/passthrough/arm/smmu.c | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
>>> index d9a3a0cbf6..da2cd457d7 100644
>>> --- a/xen/drivers/passthrough/arm/smmu.c
>>> +++ b/xen/drivers/passthrough/arm/smmu.c
>>> @@ -149,6 +149,7 @@ typedef enum irqreturn irqreturn_t;
>>>   #define kzalloc(size, flags)		_xzalloc(size, sizeof(void *))
>>>   #define devm_kzalloc(dev, size, flags)	_xzalloc(size, sizeof(void *))
>>>   #define kmalloc_array(size, n, flags)	_xmalloc_array(size, sizeof(void *), n)
>>> +#define kzalloc_array(size, n, flags)	_xzalloc_array(size, sizeof(void *), n)
>>>     static void __iomem *devm_ioremap_resource(struct device *dev,
>>>   					   struct resource *res)
>>> @@ -2221,7 +2222,7 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
>>>   		smmu->smr_mask_mask = smr >> SMR_MASK_SHIFT;
>>>     		/* Zero-initialised to mark as invalid */
>>> -		smmu->smrs = devm_kzalloc(smmu->dev, sizeof(*smmu->smrs), GFP_KERNEL);
>>> +		smmu->smrs = kzalloc_array(sizeof(*smmu->smrs), size, GFP_KERNEL);
>>
>> I noticed this is already in... However, I am a bit puzzled into why this was switched devm_kzalloc() to kzalloc_array(). This doesn't matter for Xen as they are just wrappers to x*alloc() but a mention in the commit message would have been useful.
> 
> Yes we can use the devm_kzalloc(..) but then we have to pass (sizeof(*smmu->smrs) * size ) as size argument to devm_kzalloc(..)
> I thought for better code readability I will use kzalloc_array() as the function name suggests we are allocating memory for an array.

My point is devm_k*alloc() and k*alloc() are quite different on the 
paper. One will allocate memory for a given device while the other is 
unknown memory.

It would have been better to call the function devm_kzalloc_array() to 
keep to keep the code coherent. Can you please send a patch to make the 
switch?

Cheers,

-- 
Julien Grall

