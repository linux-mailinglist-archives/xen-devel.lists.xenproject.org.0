Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB4F1BFA2C
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 15:52:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jU9bK-00085F-06; Thu, 30 Apr 2020 13:51:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ng0l=6O=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jU9bH-00085A-Lr
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 13:51:39 +0000
X-Inumbo-ID: b6e6dcb6-8ae9-11ea-ae69-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b6e6dcb6-8ae9-11ea-ae69-bc764e2007e4;
 Thu, 30 Apr 2020 13:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+yo8jQWDE6EDVgFXhgJvePM3Ow/54L7D3f3iwH/OW0I=; b=ugX7VFld/NDBY5+IF/qpjs/47Q
 tyolP1uI+0Z8JJ83ZNbwDK5JS2apl7yW32OiF83RSGtY1BCp1nhR1M9unp65I7PBdzoca7YErS729
 MS8QVmkhQpoB7YnB1QbVjIoTEbn+gOrg0/JIjuvNAhDpOCltPDNliT3F5gCjXpqkbdso=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jU9bF-00047Y-DC; Thu, 30 Apr 2020 13:51:37 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jU9bF-00060C-63; Thu, 30 Apr 2020 13:51:37 +0000
Subject: Re: [PATCH 11/12] xen/arm: if xen_force don't try to setup the IOMMU
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-11-sstabellini@kernel.org>
 <4b4263ba-bf6f-e578-037d-edb8add52aad@xen.org>
 <alpine.DEB.2.21.2004291400340.28941@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <b60d6ae3-e300-04a1-a884-e73d01a108d5@xen.org>
Date: Thu, 30 Apr 2020 14:51:35 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2004291400340.28941@sstabellini-ThinkPad-T480s>
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
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Volodymyr_Babchuk@epam.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Stefano,

On 29/04/2020 22:55, Stefano Stabellini wrote:
> On Wed, 15 Apr 2020, Julien Grall wrote:
>> Hi Stefano,
>>
>> On 15/04/2020 02:02, Stefano Stabellini wrote:
>>> If xen_force (which means xen,force-assign-without-iommu was requested)
>>> don't try to add the device to the IOMMU. Return early instead.
>>
>>
>> Could you explain why this is an issue to call xen_force after
>> iommu_add_dt_device()?
> 
> There are two issues. I should add info about both of them to the commit
> message.
> 
> 
> The first issue is that an error returned by iommu_add_dt_device (for
> any reason) would cause handle_passthrough_prop to stop and return error
> right away. But actually the iommu is not needed for that device if
> xen_force is set.

During boot, Xen will configure the IOMMUs to fault on any DMA 
transactions that are not valid. So if you don't call 
iommu_assign_dt_device(), then your device will be unusable.

Without your patch, the user will know directly something went wrong. 
With your patch, the fault may occur much later and be more difficult to 
diagnostics.

> (In fact, one of the reasons why a user might want to set
> force-assign-without-iommu is because there are iommu issues with a
> device.)
This would not work because of the reasons I explained above. The only 
way would be to configure the IOMMU in bypass mode for that device.

So you would still need to call the IOMMU subsystem.

> 
> 
> The second issue is about the usage of "xen,force-assign-without-iommu":
> it would be useful to let the user set "xen,force-assign-without-iommu"
> for devices that are described as behind a SMMU in device tree, but
> the SMMU can't actually be used for some reason. Of course, the user
> could always manually edit the device tree to make it look like as if
> the device is not behind an IOMMU. That would work OK. However, I think
> it would be better to avoid making that a requirement.

 From the documentation:

"If xen,force-assign-without-iommu is present, Xen allows to assign a
device even if it is not behind an IOMMU. This renders your platform
*unsafe* if the device is DMA-capable."

xen,force-assign-without-iommu was never meant to be used if the device 
is protected behind an IOMMU. If you want to do that, then your patch is 
not going to be sufficient (see why above).

> 
> If we want to allow "xen,force-assign-without-iommu" for a device behind
> a SMMU then we need this patch, otherwise this would happen:
> 
>      res = iommu_add_dt_device(node); // succeeds
>      if ( xen_force && !dt_device_is_protected(node) ) // fails because the device is protected
>          return 0;
>      return iommu_assign_dt_device(kinfo->d, node); // fails because !is_iommu_enabled(d) which is fine but then handle_prop_pfdt returns error too

You are mixing two things here... xen,force-assign-without-iommu doesn't 
have a say on whether the IOMMU will be used for a domain. This decision 
is only based on whether a partial DT exists and (with your patch #3) 
whether the DomU memory is direct mapped.

The problem here is your are not enabling the IOMMU when a direct 
mapping is used. I don't think we want the direct mapping option to 
disable the IOMMU. This should be a separate option (maybe a bool 
property iommu).

Cheers,

-- 
Julien Grall

