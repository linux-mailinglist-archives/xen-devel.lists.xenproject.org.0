Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD84E223A80
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 13:27:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwOW7-0006lD-GV; Fri, 17 Jul 2020 11:27:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/fKj=A4=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jwOW6-0006l8-5l
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 11:27:02 +0000
X-Inumbo-ID: 6ef34a06-c820-11ea-8496-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6ef34a06-c820-11ea-8496-bc764e2007e4;
 Fri, 17 Jul 2020 11:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qMIF4AIE0d+FYkBAHZOE+bo3oY9eTzs7hLxFk37pVYY=; b=PHa8tbVBOiU0fP2LiMDellURe4
 BccH1XFctvkOMG0t1GHVoOw5LfkYL64PJRYDxHOAOMVKMo5ymnq8tGHdg3WoUuZNLz1BKDFJFkCur
 b84M2ENbpyQ3lfF4UbYsyKRc3pJHcG8NbQ7HZJfWTc+QlyRV15C7+dGGQoefN72WRSpc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jwOW4-00045V-5J; Fri, 17 Jul 2020 11:27:00 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jwOW3-0000GZ-U5; Fri, 17 Jul 2020 11:27:00 +0000
Subject: Re: RFC: PCI devices passthrough on Arm design proposal
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <3F6E40FB-79C5-4AE8-81CA-E16CA37BB298@arm.com>
 <BD475825-10F6-4538-8294-931E370A602C@arm.com>
 <E9CBAA57-5EF3-47F9-8A40-F5D7816DB2A4@arm.com>
 <alpine.DEB.2.21.2007161258160.3886@sstabellini-ThinkPad-T480s>
 <BB4645DF-A040-4912-AC35-C98105917FD5@arm.com>
 <f69f86dc-7a8c-4c25-c059-0e391de51d7f@epam.com>
From: Julien Grall <julien@xen.org>
Message-ID: <547d91e8-a6fe-6430-b020-f9c550bfc22b@xen.org>
Date: Fri, 17 Jul 2020 12:26:57 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f69f86dc-7a8c-4c25-c059-0e391de51d7f@epam.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Rahul Singh <Rahul.Singh@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 17/07/2020 08:41, Oleksandr Andrushchenko wrote:
>>> We need to come up with something similar for dom0less too. It could be
>>> exactly the same thing (a list of BDFs as strings as a device tree
>>> property) or something else if we can come up with a better idea.
>> Fully agree.
>> Maybe a tree topology could allow more possibilities (like giving BAR values) in the future.
>>>
>>>> # Emulated PCI device tree node in libxl:
>>>>
>>>> Libxl is creating a virtual PCI device tree node in the device tree to enable the guest OS to discover the virtual PCI during guest boot. We introduced the new config option [vpci="pci_ecam"] for guests. When this config option is enabled in a guest configuration, a PCI device tree node will be created in the guest device tree.
>>>>
>>>> A new area has been reserved in the arm guest physical map at which the VPCI bus is declared in the device tree (reg and ranges parameters of the node). A trap handler for the PCI ECAM access from guest has been registered at the defined address and redirects requests to the VPCI driver in Xen.
>>>>
>>>> Limitation:
>>>> * Only one PCI device tree node is supported as of now.
>>> I think vpci="pci_ecam" should be optional: if pci=[ "PCI_SPEC_STRING",
>>> ...] is specififed, then vpci="pci_ecam" is implied.
>>>
>>> vpci="pci_ecam" is only useful one day in the future when we want to be
>>> able to emulate other non-ecam host bridges. For now we could even skip
>>> it.
>> This would create a problem if xl is used to add a PCI device as we need the PCI node to be in the DTB when the guest is created.
>> I agree this is not needed but removing it might create more complexity in the code.
> 
> I would suggest we have it from day 0 as there are plenty of HW available which is not ECAM.
> 
> Having vpci allows other bridges to be supported

So I can understand why you would want to have a driver for non-ECAM 
host PCI controller. However, why would you want to emulate a non-ECAM 
PCI controller to a guest?

Cheers,

-- 
Julien Grall

