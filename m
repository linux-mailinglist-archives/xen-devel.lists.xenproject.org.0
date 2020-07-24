Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2263D22C112
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 10:45:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jytJt-0003K1-W1; Fri, 24 Jul 2020 08:44:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5T8C=BD=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jytJs-0003Jw-EN
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 08:44:44 +0000
X-Inumbo-ID: ebc137a0-cd89-11ea-a38a-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ebc137a0-cd89-11ea-a38a-12813bfff9fa;
 Fri, 24 Jul 2020 08:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rFult8kINdISWKMBrnxAFULL5bxrr1mijKyLzJ7ocFg=; b=R4IjjJOQFwmBtPH0tc7FMbKbPd
 t5GF+vGNel7pnhaM0u8IEVpT2izJ934/bjkffC/F3eRrF2PZ0tdXX5jtu2WlCMXJvS+N82+XZ+eqr
 GB98GyP8No8uQ7OLq1VZxzWuAtUp3ON6iZqSrVpt872nMQ3UcbkBjlPXQfZS6Dc0I3jc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jytJp-0002gX-3s; Fri, 24 Jul 2020 08:44:41 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jytJo-0006i3-Pm; Fri, 24 Jul 2020 08:44:40 +0000
Subject: Re: [RFC PATCH v1 1/4] arm/pci: PCI setup and PCI host bridge
 discovery within XEN on ARM.
To: Stefano Stabellini <sstabellini@kernel.org>,
 Rahul Singh <rahul.singh@arm.com>
References: <cover.1595511416.git.rahul.singh@arm.com>
 <64ebd4ef614b36a5844c52426a4a6a4a23b1f087.1595511416.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2007231055230.17562@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <9f09ff42-a930-e4e3-d1c8-612ad03698ae@xen.org>
Date: Fri, 24 Jul 2020 09:44:38 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2007231055230.17562@sstabellini-ThinkPad-T480s>
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
Cc: andrew.cooper3@citrix.com, Bertrand.Marquis@arm.com, jbeulich@suse.com,
 xen-devel@lists.xenproject.org, nd@arm.com,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, roger.pau@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 24/07/2020 00:38, Stefano Stabellini wrote:
>> +    bridge->dt_node = dev;
>> +    bridge->sysdata = cfg;
>> +    bridge->ops = &ops->pci_ops;
>> +
>> +    if( !dt_property_read_u32(dev, "linux,pci-domain", &segment) )
>> +    {
>> +        printk(XENLOG_ERR "\"linux,pci-domain\" property in not available in DT\n");
>> +        return -ENODEV;
>> +    }
>> +
>> +    bridge->segment = (u16)segment;
> 
> My understanding is that a Linux pci-domain doesn't correspond exactly
> to a PCI segment. See for instance:
> 
> https://lists.gnu.org/archive/html/qemu-devel/2018-04/msg03885.html
> 
> Do we need to care about the difference? If we mean pci-domain here,
> should we just call them as such instead of calling them "segments" in
> Xen (if they are not segments)?

So we definitely need a segment number in hand because this is what the 
admin will use to assign a PCI device to a guest.

The segment number is just a value defined by the software. So as long 
as Linux and Xen agrees with the number, then we should be ok.

Looking at the code, I think Linux is using 'segment' as 'domain'. So 
they should be interchangeably. I am not sure what other OS does though.

Cheers,

-- 
Julien Grall

