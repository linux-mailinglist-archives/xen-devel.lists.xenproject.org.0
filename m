Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DDA22C06E
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 10:06:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jysi7-0007r7-7g; Fri, 24 Jul 2020 08:05:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5T8C=BD=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jysi5-0007r2-05
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 08:05:41 +0000
X-Inumbo-ID: 76d730c0-cd84-11ea-87e3-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 76d730c0-cd84-11ea-87e3-bc764e2007e4;
 Fri, 24 Jul 2020 08:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vcUV31aYWSnGqtJsv8ngKgDlhVy7UxTBkS6YqKCatO0=; b=oHxYO686RrCgocwjyUKm7iXB5T
 ozdWmM1YCH73Kdumnwg+zraJaMMXobUzzGGf9ITPriq6Neal0M2diOr/wXULr1IbLpXuPv7NvFA8l
 56WrnK60iz73RakqPbvmD4084YVDsnCsrzJEc/FYMv6zusZjHVeKqyMp/xvUgTxlFjnk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jysi3-0001te-KC; Fri, 24 Jul 2020 08:05:39 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jysi3-00048c-Bo; Fri, 24 Jul 2020 08:05:39 +0000
Subject: Re: [RFC PATCH v1 1/4] arm/pci: PCI setup and PCI host bridge
 discovery within XEN on ARM.
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Rahul Singh <rahul.singh@arm.com>
References: <cover.1595511416.git.rahul.singh@arm.com>
 <64ebd4ef614b36a5844c52426a4a6a4a23b1f087.1595511416.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2007231055230.17562@sstabellini-ThinkPad-T480s>
 <3ee41590-e8ca-84d6-3010-6e5dffe91df0@epam.com>
From: Julien Grall <julien@xen.org>
Message-ID: <276d6b48-8cd7-7fb1-1d76-15cb6a95cad9@xen.org>
Date: Fri, 24 Jul 2020 09:05:36 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3ee41590-e8ca-84d6-3010-6e5dffe91df0@epam.com>
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
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "nd@arm.com" <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 24/07/2020 08:03, Oleksandr Andrushchenko wrote:
>>> diff --git a/xen/arch/arm/pci/pci-access.c b/xen/arch/arm/pci/pci-access.c
>>> new file mode 100644
>>> index 0000000000..c53ef58336
>>> --- /dev/null
>>> +++ b/xen/arch/arm/pci/pci-access.c
>>> @@ -0,0 +1,101 @@
>>> +/*
>>> + * Copyright (C) 2020 Arm Ltd.
> I think SPDX will fit better in any new code.

While I would love to use SPDX in Xen, there was some push back in the 
past to use it. So the new code should use the full-blown copyright 
until there is an agreement to use it.

>>
>>> +    list_add_tail(&bridge->node, &pci_host_bridges);
>> It looks like &pci_host_bridges should be an ordered list, ordered by
>> segment number?
> 
> Why? Do you expect bridge access in some specific order so ordered
> 
> list will make it faster?

Access to the configure space will be pretty random. So I don't think 
ordering the list will make anything better.

However, looking up for the bridge for every config spec access is 
pretty slow. When I was working on the PCI passthrough, I wanted to look 
whether it would be possible to have a pointer to the PCI host bridge 
passed in argument to the helpers (rather than the segment).

Cheers,

-- 
Julien Grall

