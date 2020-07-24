Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA16C22C1C8
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 11:12:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jytkN-0006Av-B2; Fri, 24 Jul 2020 09:12:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5T8C=BD=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jytkL-0006Ao-Vo
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 09:12:06 +0000
X-Inumbo-ID: be0aee11-cd8d-11ea-87e7-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be0aee11-cd8d-11ea-87e7-bc764e2007e4;
 Fri, 24 Jul 2020 09:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N60kbuTV4dLfypzHvH054K4rbKJpxwA4tUp/pc4EeeM=; b=ud0qT1YnPn3qznD69RBNYK22xS
 Yu8nrkPlsivkcCdiZlBPlzaXh2nO3HBmrYW4e9y8HdLnFLTmiQvH3Q1IMpFNpi1DtWC0V9LRk3BxR
 sF7sQcavCNZ/f7PG9lc7cZA59FsLVmSmRGvIt2y7MXWo1XNDATy++Pat4fgExaWfx56E=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jytkH-0003Ho-D6; Fri, 24 Jul 2020 09:12:01 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jytkH-0008W1-54; Fri, 24 Jul 2020 09:12:01 +0000
Subject: Re: [RFC PATCH v1 4/4] arm/libxl: Emulated PCI device tree node in
 libxl
To: Stefano Stabellini <sstabellini@kernel.org>,
 Rahul Singh <rahul.singh@arm.com>
References: <cover.1595511416.git.rahul.singh@arm.com>
 <23346b24762467bd246b91b05f7b0fc1719282f6.1595511416.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2007231505170.17562@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <a1de23f3-8ab2-16d8-915b-4bf0e41b895f@xen.org>
Date: Fri, 24 Jul 2020 10:11:58 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2007231505170.17562@sstabellini-ThinkPad-T480s>
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
Cc: Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Bertrand.Marquis@arm.com, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, nd@arm.com,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 24/07/2020 00:39, Stefano Stabellini wrote:
> On Thu, 23 Jul 2020, Rahul Singh wrote:
>> +    if (res) return res;
>> +
>> +    /*
>> +     * Legacy interrupt is forced and assigned to the guest.
>> +     * This will be removed once we have implementation for MSI support.
>> +     *
>> +     */
>> +    res = fdt_property_vpci_interrupt_map(gc, fdt, 3, 1, 0, 3,
>> +            4,
>> +            0, 0, 0, 1, 0, 136, DT_IRQ_TYPE_LEVEL_HIGH,
>> +            0, 0, 0, 2, 0, 137, DT_IRQ_TYPE_LEVEL_HIGH,
>> +            0, 0, 0, 3, 0, 138, DT_IRQ_TYPE_LEVEL_HIGH,
>> +            0, 0, 0, 4, 0, 139, DT_IRQ_TYPE_LEVEL_HIGH);
> 
> The 4 interrupt allocated for this need to be defined in
> xen/include/public/arch-arm.h as well. Also, why would we want to get
> rid of the legacy interrupts completely? 

With legacy interrupts, there are a few cases to take into account:
    1) Two PCI devices from the same hostbridge are assigned to 
different cases. As SPIs (used for legacy interrupts) can only be routed 
to one guest, we would need to now be able to share them. This raises 
the question when to EOI the physical interrupts. AFAICT, Linux has some 
code to deal with it using a timer if it takes too long.

    2) Two PCI devices from two distinct hostbridge are assigned to the 
same virtual hostbridge. Legacy interrupts would need to be virtual and 
we would possibly need to merge multiple physical interrupts into one 
virtual.

    3) A mix of virtual and physical PCI devices are assigned to the 
same host bridges. Same as 2) legacy interrupts would need to be virtual.

Given the complexity of handling interrupts legacy and the fact they 
will largely be slower compare to MSIs, I would rather focus on MSIs at 
first.

We can then decide to implement legacy interrupts if there is a real need.

> It would be possible to still
> find device or software that rely on them.

PCI devices without MSI support is getting extremely rare. There are 
actually Arm HW that doesn't support legacy interrupts at all (such as 
Thunder-X). I can't tell for the software.

-- 
Julien Grall

