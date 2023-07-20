Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 092FB75AA85
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 11:21:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566492.885364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMPpY-0005Pi-1r; Thu, 20 Jul 2023 09:20:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566492.885364; Thu, 20 Jul 2023 09:20:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMPpX-0005NN-VT; Thu, 20 Jul 2023 09:20:15 +0000
Received: by outflank-mailman (input) for mailman id 566492;
 Thu, 20 Jul 2023 09:20:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qMPpW-0005NH-O1
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 09:20:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qMPpW-0007ds-AN; Thu, 20 Jul 2023 09:20:14 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.24.131]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qMPpV-0003Du-UL; Thu, 20 Jul 2023 09:20:14 +0000
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
	bh=jvifhrBzg7ZW3jPPsl89TSoiFWqaidsXZQg2N+GG++w=; b=yPAvsaeh8esNTbGZCgeKSeB6Xd
	gf8/2olijbwAHOzz4QFhu44rUWpX0rEjg5uQQ2McG3oBbfWHaaMhdXmjvRcRP1QjiAS+Bt6u4J0v2
	1uqYxhQgbe6luIoB6PQ1+uPHcmehuaYlKkpahkSE0SW1uRnmAQyfcahlYoUkWtHr2fcY=;
Message-ID: <2053098f-5311-89ec-294a-aa731f2b01e1@xen.org>
Date: Thu, 20 Jul 2023 10:20:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/3] xen/arm: pci: introduce PCI_PASSTHROUGH Kconfig
 option
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Artem Mygaiev <artem_mygaiev@epam.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>
References: <20230707014754.51333-1-stewart.hildebrand@amd.com>
 <20230707014754.51333-2-stewart.hildebrand@amd.com>
 <041323d2-9114-328f-40c6-f5fed60892a5@xen.org>
 <1a8d7024-f881-a3f4-c575-240fb393555f@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1a8d7024-f881-a3f4-c575-240fb393555f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 18/07/2023 18:35, Stewart Hildebrand wrote:
> On 7/13/23 14:40, Julien Grall wrote:
>> Hi Stewart,
>>
>> On 07/07/2023 02:47, Stewart Hildebrand wrote:
>>> From: Rahul Singh <rahul.singh@arm.com>
>>>
>>> Setting CONFIG_PCI_PASSTHROUGH=y will enable PCI passthrough on ARM, even though
>>> the feature is not yet complete in the current upstream codebase. The purpose of
>>> this is to make it easier to enable the necessary configs (HAS_PCI, HAS_VPCI) for
>>> testing and development of PCI passthrough on ARM.
>>>
>>> Since PCI passthrough on ARM is still work in progress at this time, make it
>>> depend on EXPERT.
>>
>> While preparing the patch for committing, I noticed that HAS_PASSTHROUGH
>> will now allow the user to select one of the IOMMU quarantine options.
>>
>> There are three of them right now:
>>    1. none
>>    2. basic (i.e. faulting)
>>    3. scratch page
>>
>> The latter is unlikely to work on Arm because we don't setup the scratch
>> page. AFAIU, for that, we would need to implement the callback
>> quarantine_init().
>>
>> I would expect 1 and 2 work. That said, I think 1. would behave like 2.
>> because on Arm the device should not be automatically re-assigned to
>> dom0. I know this is correct for platform device, but will it be valid
>> for PCI as well?
> 
> In a system with dom0 where the guest is created from the xl toolstack, we rely on "xl pci-assignable-add". Upon domain destruction, the device automatically gets assigned to domIO.

Ok. To clarify, does this mean any DMA will fault, the same as for 
platform device?

> However, there's nothing preventing a user from attempting to invoke "xl pci-assignable-remove", which should assign the device back to dom0, but it is not automatic.

I don't think we want to fully prevent a user to re-assign a device to 
dom0. But we at least want to avoid re-assigning the device to dom0 by 
default. After that a user can reset the device before it gets 
re-assigned to dom0.

Cheers,

-- 
Julien Grall

