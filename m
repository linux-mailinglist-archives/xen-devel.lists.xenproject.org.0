Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 148CEA9F189
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 14:56:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970697.1359316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9O1c-0006TM-56; Mon, 28 Apr 2025 12:55:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970697.1359316; Mon, 28 Apr 2025 12:55:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9O1c-0006RK-2V; Mon, 28 Apr 2025 12:55:56 +0000
Received: by outflank-mailman (input) for mailman id 970697;
 Mon, 28 Apr 2025 12:55:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1u9O1b-0006RE-Ex
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 12:55:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u9O1a-00ASYh-2C;
 Mon, 28 Apr 2025 12:55:54 +0000
Received: from [2a02:8012:3a1:0:8834:9d13:966f:8422]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u9O1a-0065AB-1P;
 Mon, 28 Apr 2025 12:55:54 +0000
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
	bh=uuJHzQhZovTg4802SQSYYH7n+CIAA3BfigGhLTOZHh8=; b=jKT+MYC2VRqqA66/Rty2MWZUg5
	7eRLjY5VjSmvyUfnFnfXTN0E/cvjs1ORZu2LDvm3Xg0hEZXw7twA+2qimzy8Tyg7rzUzj5VNLGOM3
	c17ckLvGwXZsUd+5zzv6VXhgQ5IkVc9P+hFo3tVtC3CIbg4XTjPB5q7Hp178Jx92AG/8=;
Message-ID: <a1715315-f4c8-4062-89db-e2df7b22865b@xen.org>
Date: Mon, 28 Apr 2025 13:55:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 7/8] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
Content-Language: en-GB
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1741958647.git.mykyta_poturai@epam.com>
 <132afbca390edd6e9fd7b1ffacf6c5aff0d29aa7.1741958647.git.mykyta_poturai@epam.com>
 <7d376741-ff23-4618-83bd-415c8d8fa24e@xen.org>
 <ae2c8d37-e350-4125-921f-3d320c28d6cd@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ae2c8d37-e350-4125-921f-3d320c28d6cd@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 28/04/2025 13:31, Mykyta Poturai wrote:
> On 28.04.25 11:54, Julien Grall wrote:
>> Hi Mykyta,
>>
>> On 14/03/2025 13:34, Mykyta Poturai wrote:
>>> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>>
>>> Enable the use of IOMMU + PCI in dom0 without having to specify
>>> "pci-passthrough=yes". We rely on dom0 to initialize the PCI controller
>>> and perform a PHYSDEVOP_pci_device_add call to add each device to SMMU.
>>
>> It would be good to explain why Xen cannot initialize the PCI
>> controller. Asking, because the reason is the PCI controller is too
>> complex, then you will likely need the same approach for PCI passthrough...
> 
> I think the main reason for this is complexity and the possibility of
> additional dependencies: there could be external clocks or reset pins
> that the PCI host depends on for working correctly. I will add this to
> the commit message. Regarding PCI passthrough, it is already using the
> same approach (at least on Arm). There are patches for enabling Xen on
> Arm to perform bus enumeration by itself by Luca Fancellu, but I haven't
> yet got to test them in a meaningful way.

Can you provide a link to the series? I would like to make sure we have 
a coherent approach. In particular, it is not clear to me how Dom0 and 
Xen will be able to coordinate the access to the PCI controller. Are we 
going to have a mediator?

> 
>>>
>>> Enable pci_init() for initializing Xen's internal PCI subsystem, and
>>> allow PHYSDEVOP_pci_device_add when pci-passthrough is disabled.
>>
>> Effectively, wouldn't this mean dom0 always *have* to call
>> PHYSDEVOP_pci_device_add? Otherwise, how would dom0 know whether it
>> needs to call PHSYDEVOP_pci_device_add?
>>
>> Cheers,
>>
> 
> Yes, I can't say for every system but with PCI host behind SMMU the
> PHYSDEVOP_pci_device_add call is required to use DMA.

Dom0 will not be able to know whether a device is protected by an IOMMU. 
So I guess it means the OS will need to be able to cope with an error 
(like on x86).

Cheers,

-- 
Julien Grall


