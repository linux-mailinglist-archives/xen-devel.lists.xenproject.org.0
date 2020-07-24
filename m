Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3DD22C9AB
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 18:02:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jz08g-0005FP-Ms; Fri, 24 Jul 2020 16:01:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKVY=BD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jz08f-0005FK-F5
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 16:01:37 +0000
X-Inumbo-ID: f3981d4e-cdc6-11ea-883d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f3981d4e-cdc6-11ea-883d-bc764e2007e4;
 Fri, 24 Jul 2020 16:01:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 19FB5B128;
 Fri, 24 Jul 2020 16:01:44 +0000 (UTC)
Subject: Re: [RFC PATCH v1 1/4] arm/pci: PCI setup and PCI host bridge
 discovery within XEN on ARM.
To: Julien Grall <julien@xen.org>
References: <cover.1595511416.git.rahul.singh@arm.com>
 <64ebd4ef614b36a5844c52426a4a6a4a23b1f087.1595511416.git.rahul.singh@arm.com>
 <20200724144404.GJ7191@Air-de-Roger>
 <0c53b2cb-47e9-f34e-8922-7095669175be@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <980fc583-edb6-b536-f211-f6b8ea6d21a7@suse.com>
Date: Fri, 24 Jul 2020 18:01:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0c53b2cb-47e9-f34e-8922-7095669175be@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Rahul Singh <rahul.singh@arm.com>, Bertrand.Marquis@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 nd@arm.com, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24.07.2020 17:15, Julien Grall wrote:
> On 24/07/2020 15:44, Roger Pau Monné wrote:
>>> +
>>> +    struct pci_host_bridge *bridge = pci_find_host_bridge(sbdf.seg, sbdf.bus);
>>> +
>>> +    if ( unlikely(!bridge) )
>>> +    {
>>> +        printk(XENLOG_ERR "Unable to find bridge for "PRI_pci"\n",
>>> +                sbdf.seg, sbdf.bus, sbdf.dev, sbdf.fn);
>>
>> I had a patch to add a custom modifier to out printf format in
>> order to handle pci_sbdf_t natively:
>>
>> https://patchew.org/Xen/20190822065132.48200-1-roger.pau@citrix.com/
>>
>> It missed maintainers Acks and was never committed. Since you are
>> doing a bunch of work here, and likely adding a lot of SBDF related
>> prints, feel free to import the modifier (%pp) and use in your code
>> (do not attempt to switch existing users, or it's likely to get
>> stuck again).
> 
> I forgot about this patch :/. It would be good to revive it. Which acks 
> are you missing?

It wasn't so much missing acks, but a controversy. And that not so much
about switching existing users, but whether to indeed derive this from
%p (which I continue to consider inefficient).

Jan

