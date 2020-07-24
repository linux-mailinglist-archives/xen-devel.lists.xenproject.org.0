Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC2922C8D7
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 17:16:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyzQQ-00089u-0z; Fri, 24 Jul 2020 15:15:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5T8C=BD=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jyzQP-00089p-1E
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 15:15:53 +0000
X-Inumbo-ID: 8f62c4e2-cdc0-11ea-a412-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8f62c4e2-cdc0-11ea-a412-12813bfff9fa;
 Fri, 24 Jul 2020 15:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wHEtOyXAmYV0hGwJAz85c5e9GF4DwuFI0+o+BdGXrXE=; b=yrd3JOqiHcq+D0HK7UV4kEg94V
 A6eKzfE4f1L5IUQkukRmO8LsmU9OMCv/BcnWRiaQGInuddDwKI8/56OYFSw2BjXc8zQWtRRB9yW6Q
 cvLJG0TTbiW4BIZ/1JFvSl/pH7gX33OQB5ty8ldaAGh6wuyNaFxgQxWiowYopNvO99gA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jyzQL-0002cC-UO; Fri, 24 Jul 2020 15:15:49 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jyzQL-00015N-NJ; Fri, 24 Jul 2020 15:15:49 +0000
Subject: Re: [RFC PATCH v1 1/4] arm/pci: PCI setup and PCI host bridge
 discovery within XEN on ARM.
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Rahul Singh <rahul.singh@arm.com>
References: <cover.1595511416.git.rahul.singh@arm.com>
 <64ebd4ef614b36a5844c52426a4a6a4a23b1f087.1595511416.git.rahul.singh@arm.com>
 <20200724144404.GJ7191@Air-de-Roger>
From: Julien Grall <julien@xen.org>
Message-ID: <0c53b2cb-47e9-f34e-8922-7095669175be@xen.org>
Date: Fri, 24 Jul 2020 16:15:47 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200724144404.GJ7191@Air-de-Roger>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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
Cc: xen-devel@lists.xenproject.org, nd@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand.Marquis@arm.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 24/07/2020 15:44, Roger Pau Monné wrote:
>> diff --git a/xen/arch/arm/pci/Makefile b/xen/arch/arm/pci/Makefile
>> new file mode 100644
>> index 0000000000..358508b787
>> --- /dev/null
>> +++ b/xen/arch/arm/pci/Makefile
>> @@ -0,0 +1,4 @@
>> +obj-y += pci.o
>> +obj-y += pci-host-generic.o
>> +obj-y += pci-host-common.o
>> +obj-y += pci-access.o
> 
> The Kconfig option mentions the support being explicitly for ARM64,
> would it be better to place the code in arch/arm/arm64 then?
I don't believe any of the code in this series is very arm64 specific. I 
guess it was just only tested on arm64. So I would rather keep that 
under arm/pci.

>> +
>> +    struct pci_host_bridge *bridge = pci_find_host_bridge(sbdf.seg, sbdf.bus);
>> +
>> +    if ( unlikely(!bridge) )
>> +    {
>> +        printk(XENLOG_ERR "Unable to find bridge for "PRI_pci"\n",
>> +                sbdf.seg, sbdf.bus, sbdf.dev, sbdf.fn);
> 
> I had a patch to add a custom modifier to out printf format in
> order to handle pci_sbdf_t natively:
> 
> https://patchew.org/Xen/20190822065132.48200-1-roger.pau@citrix.com/
> 
> It missed maintainers Acks and was never committed. Since you are
> doing a bunch of work here, and likely adding a lot of SBDF related
> prints, feel free to import the modifier (%pp) and use in your code
> (do not attempt to switch existing users, or it's likely to get
> stuck again).

I forgot about this patch :/. It would be good to revive it. Which acks 
are you missing?

[...]

>> +static bool __init dt_pci_parse_bus_range(struct dt_device_node *dev,
>> +        struct pci_config_window *cfg)
>> +{
>> +    const __be32 *cells;
> 
> It's my impression that while based on Linux this is not a verbatim
> copy of a Linux file, and tries to adhere with the Xen coding style.
> If so please use uint32_t here.

uint32_t would be incorrect because this is a 32-bit value always in big 
endian. I don't think we have other typedef to show it is a 32-bit BE 
value, so __be32 is the best choice.

[...]

>> +
>> +    if ( acpi_disabled )
>> +        dt_pci_init();
>> +    else
>> +        acpi_pci_init();
> 
> Isn't there an enum or something that tells you whether the system
> description is coming from ACPI or from DT?
> 
> This if .. else seems fragile.
>

This is the common way we do it on Arm.... I would welcome any 
improvement, but I don't think this should be part of this work.

Cheers,

-- 
Julien Grall

