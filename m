Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 401FE9864EF
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 18:38:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804401.1215369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stV1t-0006kL-94; Wed, 25 Sep 2024 16:38:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804401.1215369; Wed, 25 Sep 2024 16:38:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stV1t-0006ik-6L; Wed, 25 Sep 2024 16:38:17 +0000
Received: by outflank-mailman (input) for mailman id 804401;
 Wed, 25 Sep 2024 16:38:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1stV1r-0006ib-LR
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 16:38:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1stV1r-00061p-7a; Wed, 25 Sep 2024 16:38:15 +0000
Received: from [15.248.2.30] (helo=[10.24.67.22])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1stV1r-0003zj-0g; Wed, 25 Sep 2024 16:38:15 +0000
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
	bh=6LAM4ymLwVtobxSgf2Pkay9Q2OTjiTHJPJgaljC5UJ0=; b=GWnVFVFfuESjm6ycrKCqtk/t7B
	XzqA0Kvh2zivui955C7KIXrxUGo3pH72SZWOTbw8NbQwmASP84bspvMIYaV30tcEL62tpt6HwtOSD
	oSGxsFpkZPfLSf8SY7/+Y467xnO9juhw1B2eORXEDnqUl0/ALrLjtpQMeecSG8hP3VZs=;
Message-ID: <d897124b-29c7-4aac-86bf-f1bec1aeade4@xen.org>
Date: Wed, 25 Sep 2024 17:38:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/6] xen/arm: create dom0less virtio-pci DT node
Content-Language: en-GB
To: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com,
 dpsmith@apertussolutions.com, Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <20240924162359.1390487-1-edgar.iglesias@gmail.com>
 <20240924162359.1390487-4-edgar.iglesias@gmail.com>
 <ce21a173-61f4-42d5-aa72-5b50135e6d76@xen.org> <ZvQ7mf9MbmSyC6RB@zapote>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ZvQ7mf9MbmSyC6RB@zapote>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Edgar,

On 25/09/2024 17:34, Edgar E. Iglesias wrote:
> On Wed, Sep 25, 2024 at 08:44:41AM +0100, Julien Grall wrote:
>> Hi,
>> On 24/09/2024 17:23, Edgar E. Iglesias wrote:
>>> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>>
>>> When virtio-pci is specified in the dom0less domU properties, create a
>>> virtio-pci node in the guest's device tree. Set up an mmio handler with
>>> a register for the guest to poll when the backend has connected and
>>> virtio-pci bus is ready to be probed. Grant tables may be used by
>>> specifying virtio-pci = "grants";.
>>>
>>> [Edgar: Use GPEX PCI INTX interrupt swizzling (from PCI specs).
>>>    Make grants iommu-map cover the entire PCI bus.
>>>    Add virtio-pci-ranges to specify memory-map for direct-mapped guests.
>>>    Document virtio-pci dom0less fdt bindings.]
>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
>>> ---
>>>    docs/misc/arm/device-tree/booting.txt |  21 +++
>>>    xen/arch/arm/dom0less-build.c         | 238 ++++++++++++++++++++++++++
>>>    xen/arch/arm/include/asm/kernel.h     |  15 ++
>>>    3 files changed, 274 insertions(+)
>>>
>>> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
>>> index 3a04f5c57f..82f3bd7026 100644
>>> --- a/docs/misc/arm/device-tree/booting.txt
>>> +++ b/docs/misc/arm/device-tree/booting.txt
>>> @@ -276,6 +276,27 @@ with the following properties:
>>>        passed through. This option is the default if this property is missing
>>>        and the user does not provide the device partial device tree for the domain.
>>> +- virtio-pci
>>
>> Similar question to the other patches, why is this specific to virtio PCI?
>> QEMU (or another device module) is free to emulate whatever it wants behind
>> the PCI hosbtridge.
> 
> There's no hard limitatino to only virtio-pci devices it's more of a
> recommendation that PVH guests should not use "emulated" devices but
> there's nothing stopping it.

Could you provide a bit more details where this requirement is coming 
from? For instance, I would expect we would need to do some emulation to 
boot Windows on Arm.

Cheers,

-- 
Julien Grall


