Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFADCA5CF46
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 20:24:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908916.1315951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts5Cw-0003oj-IM; Tue, 11 Mar 2025 19:24:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908916.1315951; Tue, 11 Mar 2025 19:24:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts5Cw-0003m0-FE; Tue, 11 Mar 2025 19:24:06 +0000
Received: by outflank-mailman (input) for mailman id 908916;
 Tue, 11 Mar 2025 19:24:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ts5Cv-0003lu-H7
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 19:24:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ts5Cv-00Ego8-0r;
 Tue, 11 Mar 2025 19:24:05 +0000
Received: from [2a02:8012:3a1:0:9c08:78f4:b949:88f8]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ts5Cu-004dQA-2k;
 Tue, 11 Mar 2025 19:24:04 +0000
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
	bh=T8pDDfqiNYE9wbTi+9caOXXVuMwuRMwSdJwk43OMT/k=; b=wMeHvJ7OR+kyOd1kGVDcFWPEoj
	Q9N+M1GTtAvTM0ad+nFhnrHKcDhRJQnuvfSJ2OEFaDpGIvmKwGLl9mAyNmQWosWzJcUQnx+BS5nFV
	a0ULwBh5d5EzwVNvoPOiOJSJDDuGndpK8YaSLx8kEd4aZd8ejoKc05THYPc1FU5oNgVg=;
Message-ID: <540cc8cc-1a05-4b0d-9354-2e5c835513ad@xen.org>
Date: Tue, 11 Mar 2025 19:24:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] xen/arm: allow PCI host bridge to have private
 data
Content-Language: en-GB
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1741596512.git.mykyta_poturai@epam.com>
 <cd3bd35a570064e1b03054bab73e29aa1578bd24.1741596512.git.mykyta_poturai@epam.com>
 <8c7b7186-c5eb-4ec7-a2b2-fdad76aacf9d@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8c7b7186-c5eb-4ec7-a2b2-fdad76aacf9d@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 11/03/2025 15:05, Grygorii Strashko wrote:
> 
> 
> On 11.03.25 12:24, Mykyta Poturai wrote:
>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>
>> Some of the PCI host bridges require private data. Create a generic
>> approach for that, so such bridges may request the private data to
>> be allocated during initialization.
>>
>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
>> ---
>> v1->v2:
>> * no change
>> ---
>>   xen/arch/arm/include/asm/pci.h      |  4 +++-
>>   xen/arch/arm/pci/pci-host-common.c  | 18 +++++++++++++++++-
>>   xen/arch/arm/pci/pci-host-generic.c |  2 +-
>>   xen/arch/arm/pci/pci-host-zynqmp.c  |  2 +-
>>   4 files changed, 22 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/ 
>> asm/pci.h
>> index 7f77226c9b..44344ac8c1 100644
>> --- a/xen/arch/arm/include/asm/pci.h
>> +++ b/xen/arch/arm/include/asm/pci.h
>> @@ -66,6 +66,7 @@ struct pci_host_bridge {
>>       uint16_t segment;                /* Segment number */
>>       struct pci_config_window* cfg;   /* Pointer to the bridge config 
>> window */
>>       const struct pci_ops *ops;
>> +    void *priv;                      /* Private data of the bridge. */
>>   };
>>   struct pci_ops {
>> @@ -95,7 +96,8 @@ struct pci_ecam_ops {
>>   extern const struct pci_ecam_ops pci_generic_ecam_ops;
>>   int pci_host_common_probe(struct dt_device_node *dev,
>> -                          const struct pci_ecam_ops *ops);
>> +                          const struct pci_ecam_ops *ops,
>> +                          size_t priv_sz);
>>   int pci_generic_config_read(struct pci_host_bridge *bridge, 
>> pci_sbdf_t sbdf,
>>                               uint32_t reg, uint32_t len, uint32_t 
>> *value);
>>   int pci_generic_config_write(struct pci_host_bridge *bridge, 
>> pci_sbdf_t sbdf,
>> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/ 
>> pci-host-common.c
>> index c0faf0f436..be7e6c3510 100644
>> --- a/xen/arch/arm/pci/pci-host-common.c
>> +++ b/xen/arch/arm/pci/pci-host-common.c
>> @@ -209,7 +209,8 @@ static int pci_bus_find_domain_nr(struct 
>> dt_device_node *dev)
>>   }
>>   int pci_host_common_probe(struct dt_device_node *dev,
>> -                          const struct pci_ecam_ops *ops)
>> +                          const struct pci_ecam_ops *ops,
>> +                          size_t priv_sz)
>>   {
>>       struct pci_host_bridge *bridge;
>>       struct pci_config_window *cfg;
>> @@ -241,11 +242,26 @@ int pci_host_common_probe(struct dt_device_node 
>> *dev,
>>           printk(XENLOG_ERR "Inconsistent \"linux,pci-domain\" 
>> property in DT\n");
>>           BUG();
>>       }
>> +
>>       bridge->segment = domain;
>> +
>> +    if ( priv_sz )
>> +    {
>> +        bridge->priv = xzalloc_bytes(priv_sz);
>> +        if ( !bridge->priv )
>> +        {
>> +            err = -ENOMEM;
>> +            goto err_priv;
>> +        }
>> +    }
>> +
> 
> I'd like to propose to move allocation into pci_alloc_host_bridge()
> to keep mallocs in one place and do it earlier, before proceeding
> with other initialization steps.

In both cases, we need to pass the size of the structure in parameter 
and the structure is not initialized until later. I would rather prefer
if the allocation is done by each PCI controller that needs it close to 
the initialization of "priv".

Cheers,

-- 
Julien Grall


