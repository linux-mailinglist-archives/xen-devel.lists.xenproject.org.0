Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AB0415A7F
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 11:03:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193532.344721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTKdA-00060c-L7; Thu, 23 Sep 2021 09:03:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193532.344721; Thu, 23 Sep 2021 09:03:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTKdA-0005xW-HK; Thu, 23 Sep 2021 09:03:00 +0000
Received: by outflank-mailman (input) for mailman id 193532;
 Thu, 23 Sep 2021 09:02:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mTKd9-0005xI-N1
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 09:02:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mTKd9-0003oW-ER; Thu, 23 Sep 2021 09:02:59 +0000
Received: from [202.153.84.92] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mTKd9-0000Ap-4Q; Thu, 23 Sep 2021 09:02:59 +0000
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
	bh=HfN1IGFIrJppc5fvqGb+ktVGm+nPKJ2a+PRtFdhGhM4=; b=pKDkULY9qDol/kEkgunI2Lfgce
	Sn6I5076r1Czj87o0mIlxkHCH87ytn5GBxVuMi8fc8XK6xv2tBZXeDrU6CziueC6oXoShp8oPC1ey
	aupHcQtbdrrripkKwkM9AifBUn0gqNezLpMt5tUIaTEnD8fq/xlc8SSGohLuhODJJYrA=;
Subject: Re: [PATCH v2 13/17] xen:arm: Implement pci access functions
To: Stefano Stabellini <sstabellini@kernel.org>,
 Rahul Singh <rahul.singh@arm.com>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 andre.przywara@arm.com, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1632307952.git.rahul.singh@arm.com>
 <f05b02c04803809bbe4ebd49ed4abb5a4656b010.1632307952.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2109221913430.17979@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <bcb7c35b-cad1-8da1-8723-82f1f79d4f74@xen.org>
Date: Thu, 23 Sep 2021 14:02:54 +0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2109221913430.17979@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 23/09/2021 07:23, Stefano Stabellini wrote:
> Subject should have xen/arm
> 
> 
> On Wed, 22 Sep 2021, Rahul Singh wrote:
>> Implement generic pci access functions to read/write the configuration
>> space.
>>
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>> Change in v2: Fixed comments
>> ---
>>   xen/arch/arm/pci/pci-access.c      | 58 ++++++++++++++++++++++++++++++
>>   xen/arch/arm/pci/pci-host-common.c | 19 ++++++++++
>>   xen/include/asm-arm/pci.h          |  2 ++
>>   3 files changed, 79 insertions(+)
>>
>> diff --git a/xen/arch/arm/pci/pci-access.c b/xen/arch/arm/pci/pci-access.c
>> index 04fe9fbf92..45500cec2a 100644
>> --- a/xen/arch/arm/pci/pci-access.c
>> +++ b/xen/arch/arm/pci/pci-access.c
>> @@ -16,6 +16,7 @@
>>   #include <asm/io.h>
>>   
>>   #define INVALID_VALUE (~0U)
>> +#define PCI_ERR_VALUE(len) GENMASK(0, len * 8)
>>   
>>   int pci_generic_config_read(struct pci_host_bridge *bridge, uint32_t sbdf,
>>                               uint32_t reg, uint32_t len, uint32_t *value)
>> @@ -72,6 +73,63 @@ int pci_generic_config_write(struct pci_host_bridge *bridge, uint32_t sbdf,
>>       return 0;
>>   }
>>   
>> +static uint32_t pci_config_read(pci_sbdf_t sbdf, unsigned int reg,
>> +                                unsigned int len)
>> +{
>> +    uint32_t val = PCI_ERR_VALUE(len);
>> +
> 
> No blank line
> 
> 
>> +    struct pci_host_bridge *bridge = pci_find_host_bridge(sbdf.seg, sbdf.bus);
>> +
>> +    if ( unlikely(!bridge) )
>> +        return val;
>> +
>> +    if ( unlikely(!bridge->ops->read) )
>> +        return val;
>> +
>> +    bridge->ops->read(bridge, (uint32_t) sbdf.sbdf, reg, len, &val);
> 
> The more I look at these casts the less I like them :-D

I really dislike them. This is kind of defeating the purpose of trying 
to be more typesafe.

> 
> One idea is to move the definition of pci_sbdf_t somewhere else
> entirely, for instance xen/include/xen/types.h, then we can use
> pci_sbdf_t everywhere

AFAIU, the problem is the prototype helpers are defined in asm/pci.h 
which is included by xen/pci.h before defining sbdf_t. Is it correct?

If so there are two options:
   1) define sbdf_t and then include asm/pci.h.
   2) Name the union and then pre-declare it.

Option 1 is probably nicer is we have more types in the future that are 
used by arch specific but defined in the common headers. We have a few 
places that uses this approach.

Cheers,

-- 
Julien Grall

