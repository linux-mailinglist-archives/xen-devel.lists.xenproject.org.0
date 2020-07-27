Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7D022F945
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 21:42:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k090W-0004Em-Vc; Mon, 27 Jul 2020 19:41:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfpx=BG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k090V-0004Eh-7V
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 19:41:55 +0000
X-Inumbo-ID: 3870bde7-d041-11ea-a7f0-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3870bde7-d041-11ea-a7f0-12813bfff9fa;
 Mon, 27 Jul 2020 19:41:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8EF74AD43;
 Mon, 27 Jul 2020 19:42:03 +0000 (UTC)
Subject: Re: [PATCH 2/6] x86/iommu: add common page-table allocator
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
References: <20200724164619.1245-1-paul@xen.org>
 <20200724164619.1245-3-paul@xen.org>
 <d0a0c46f-1461-144c-ca62-259b0a1894fa@citrix.com>
 <d329b845e6c348e8bf484e45f051779f@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <344d62f5-1983-9438-853d-795dfbb8091a@suse.com>
Date: Mon, 27 Jul 2020 21:41:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d329b845e6c348e8bf484e45f051779f@EX13D32EUC003.ant.amazon.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.07.2020 11:37, Durrant, Paul wrote:
>> From: Andrew Cooper <andrew.cooper3@citrix.com>
>> Sent: 24 July 2020 19:24
>>
>> On 24/07/2020 17:46, Paul Durrant wrote:
>>> --- a/xen/drivers/passthrough/x86/iommu.c
>>> +++ b/xen/drivers/passthrough/x86/iommu.c
>>> @@ -140,11 +140,19 @@ int arch_iommu_domain_init(struct domain *d)
>>>
>>>       spin_lock_init(&hd->arch.mapping_lock);
>>>
>>> +    INIT_PAGE_LIST_HEAD(&hd->arch.pgtables.list);
>>> +    spin_lock_init(&hd->arch.pgtables.lock);
>>> +
>>>       return 0;
>>>   }
>>>
>>>   void arch_iommu_domain_destroy(struct domain *d)
>>>   {
>>> +    struct domain_iommu *hd = dom_iommu(d);
>>> +    struct page_info *pg;
>>> +
>>> +    while ( (pg = page_list_remove_head(&hd->arch.pgtables.list)) )
>>> +        free_domheap_page(pg);
>>
>> Some of those 90 lines saved were the logic to not suffer a watchdog
>> timeout here.
>>
>> To do it like this, it needs plumbing into the relinquish resources path.
>>
> 
> Ok. I does look like there could be other potentially lengthy destruction done off the back of the RCU call. Ought we have the ability to have a restartable domain_destroy()?

I don't see how this would be (easily) feasible. Instead - why do
page tables not get cleaned up already at relinquish_resources time?

Jan

