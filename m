Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C18F923C95E
	for <lists+xen-devel@lfdr.de>; Wed,  5 Aug 2020 11:39:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3FtG-0002Zq-HG; Wed, 05 Aug 2020 09:39:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FdrI=BP=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k3FtE-0002Zl-U4
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2020 09:39:16 +0000
X-Inumbo-ID: f4e3dd9e-7838-4d31-8b33-253b46ab88bd
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f4e3dd9e-7838-4d31-8b33-253b46ab88bd;
 Wed, 05 Aug 2020 09:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jRpEmS5YMER/RnQifqxP4UjBRHnj3hq0Ojyzac0TDHI=; b=OR0o3xO0cNXaAaEEexaMTFpeOQ
 50ZnADrvTw5Gqy3FDhCXT61n/6hUr3hF41fPcqt90cTMVcYIqoa0SD9uXr8wq2mM+0Da1Bo1v5Ckr
 ADKOMztXk7HcAQ5gPjHZjsxSBMi8BUiefAzdOgHMiSMG0PTRf+7xHQbTqRR7f8oxLC5A=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k3Ft7-0000Sb-MO; Wed, 05 Aug 2020 09:39:09 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k3Ft7-0001Wq-AO; Wed, 05 Aug 2020 09:39:09 +0000
Subject: Re: [RFC PATCH V1 05/12] hvm/dm: Introduce
 xendevicemodel_set_irq_level DM op
To: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-6-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2008041358150.5748@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <00e261e0-295a-9cd8-ed11-7e3801a4eb58@xen.org>
Date: Wed, 5 Aug 2020 10:39:06 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2008041358150.5748@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 05/08/2020 00:22, Stefano Stabellini wrote:
> On Mon, 3 Aug 2020, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> This patch adds ability to the device emulator to notify otherend
>> (some entity running in the guest) using a SPI and implements Arm
>> specific bits for it. Proposed interface allows emulator to set
>> the logical level of a one of a domain's IRQ lines.
>>
>> Please note, this is a split/cleanup of Julien's PoC:
>> "Add support for Guest IO forwarding to a device emulator"
>>
>> Signed-off-by: Julien Grall <julien.grall@arm.com>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ---
>>   tools/libs/devicemodel/core.c                   | 18 ++++++++++++++++++
>>   tools/libs/devicemodel/include/xendevicemodel.h |  4 ++++
>>   tools/libs/devicemodel/libxendevicemodel.map    |  1 +
>>   xen/arch/arm/dm.c                               | 22 +++++++++++++++++++++-
>>   xen/common/hvm/dm.c                             |  1 +
>>   xen/include/public/hvm/dm_op.h                  | 15 +++++++++++++++
>>   6 files changed, 60 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/libs/devicemodel/core.c b/tools/libs/devicemodel/core.c
>> index 4d40639..30bd79f 100644
>> --- a/tools/libs/devicemodel/core.c
>> +++ b/tools/libs/devicemodel/core.c
>> @@ -430,6 +430,24 @@ int xendevicemodel_set_isa_irq_level(
>>       return xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
>>   }
>>   
>> +int xendevicemodel_set_irq_level(
>> +    xendevicemodel_handle *dmod, domid_t domid, uint32_t irq,
>> +    unsigned int level)
> 
> It is a pity that having xen_dm_op_set_pci_intx_level and
> xen_dm_op_set_isa_irq_level already we need to add a third one, but from
> the names alone I don't think we can reuse either of them.

The problem is not the name...

> 
> It is very similar to set_isa_irq_level. We could almost rename
> xendevicemodel_set_isa_irq_level to xendevicemodel_set_irq_level or,
> better, just add an alias to it so that xendevicemodel_set_irq_level is
> implemented by calling xendevicemodel_set_isa_irq_level. Honestly I am
> not sure if it is worth doing it though. Any other opinions?

... the problem is the interrupt field is only 8-bit. So we would only 
be able to cover IRQ 0 - 255.

It is not entirely clear how the existing subop could be extended 
without breaking existing callers.

> 
> 
> But I think we should plan for not needing two calls (one to set level
> to 1, and one to set it to 0):
> https://marc.info/?l=xen-devel&m=159535112027405

I am not sure to understand your suggestion here? Are you suggesting to 
remove the 'level' parameter?

Cheers,

-- 
Julien Grall

