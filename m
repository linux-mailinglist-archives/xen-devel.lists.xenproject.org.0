Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA4822DD38
	for <lists+xen-devel@lfdr.de>; Sun, 26 Jul 2020 10:26:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jzbz7-00005u-Pa; Sun, 26 Jul 2020 08:26:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jzbz5-00005p-NA
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2020 08:26:15 +0000
X-Inumbo-ID: aa5fc948-cf19-11ea-a650-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aa5fc948-cf19-11ea-a650-12813bfff9fa;
 Sun, 26 Jul 2020 08:26:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C8EEAAEBF;
 Sun, 26 Jul 2020 08:26:21 +0000 (UTC)
Subject: Re: [PATCH 2/6] x86/iommu: add common page-table allocator
To: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <20200724164619.1245-1-paul@xen.org>
 <20200724164619.1245-3-paul@xen.org>
 <d0a0c46f-1461-144c-ca62-259b0a1894fa@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <036e10b0-d0b3-0437-f9ac-82845fd0cbd2@suse.com>
Date: Sun, 26 Jul 2020 10:26:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d0a0c46f-1461-144c-ca62-259b0a1894fa@citrix.com>
Content-Type: text/plain; charset=utf-8
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24.07.2020 20:24, Andrew Cooper wrote:
> On 24/07/2020 17:46, Paul Durrant wrote:
>> --- a/xen/drivers/passthrough/x86/iommu.c
>> +++ b/xen/drivers/passthrough/x86/iommu.c
>> @@ -140,11 +140,19 @@ int arch_iommu_domain_init(struct domain *d)
>>  
>>      spin_lock_init(&hd->arch.mapping_lock);
>>  
>> +    INIT_PAGE_LIST_HEAD(&hd->arch.pgtables.list);
>> +    spin_lock_init(&hd->arch.pgtables.lock);
>> +
>>      return 0;
>>  }
>>  
>>  void arch_iommu_domain_destroy(struct domain *d)
>>  {
>> +    struct domain_iommu *hd = dom_iommu(d);
>> +    struct page_info *pg;
>> +
>> +    while ( (pg = page_list_remove_head(&hd->arch.pgtables.list)) )
>> +        free_domheap_page(pg);
> 
> Some of those 90 lines saved were the logic to not suffer a watchdog
> timeout here.
> 
> To do it like this, it needs plumbing into the relinquish resources path.

And indeed this is possible now only because we don't destroy page
tables for still running domains anymore. Maybe the description
should also make this connection.

Jan

