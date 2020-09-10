Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D08264812
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 16:36:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGNgM-000594-UC; Thu, 10 Sep 2020 14:36:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dCRG=CT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kGNgL-00058z-JN
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 14:36:13 +0000
X-Inumbo-ID: ce906846-894d-4f99-bfd9-6349600bf6e1
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ce906846-894d-4f99-bfd9-6349600bf6e1;
 Thu, 10 Sep 2020 14:36:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6770BB333;
 Thu, 10 Sep 2020 14:36:26 +0000 (UTC)
Subject: Re: [PATCH] x86/mm: do not mark IO regions as Xen heap
To: paul@xen.org
Cc: 'Roger Pau Monne' <roger.pau@citrix.com>, xen-devel@lists.xenproject.org, 
 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Wei Liu' <wl@xen.org>
References: <20200910133514.82155-1-roger.pau@citrix.com>
 <003201d6877d$f8e07650$eaa162f0$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <17ad499f-bd1f-d8b5-9568-647effdb8c15@suse.com>
Date: Thu, 10 Sep 2020 16:36:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <003201d6877d$f8e07650$eaa162f0$@xen.org>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 10.09.2020 16:23, Paul Durrant wrote:
>> From: Roger Pau Monne <roger.pau@citrix.com>
>> Sent: 10 September 2020 14:35
>>
>> @@ -291,7 +303,7 @@ void __init arch_init_memory(void)
>>       */
>>      BUG_ON(pvh_boot && trampoline_phys != 0x1000);
>>      for ( i = 0; i < 0x100; i++ )
>> -        share_xen_page_with_guest(mfn_to_page(_mfn(i)), dom_io, SHARE_rw);
>> +        assign_io_page(mfn_to_page(_mfn(i)));
>>
>>      /* Any areas not specified as RAM by the e820 map are considered I/O. */
>>      for ( i = 0, pfn = 0; pfn < max_page; i++ )
>> @@ -332,7 +344,7 @@ void __init arch_init_memory(void)
>>              if ( !mfn_valid(_mfn(pfn)) )
>>                  continue;
>>
>> -            share_xen_page_with_guest(mfn_to_page(_mfn(pfn)), dom_io, SHARE_rw);
>> +            assign_io_page(mfn_to_page(_mfn(pfn)));
> 
> Now these calls to share_xen_page_with_guest() are gone, can we
> change share_xen_page_with_guest() to ASSERT that PGC_xen_heap
> is already set, and avoid (needlessly) ORing it in?

At least for the first use from pv_shim_setup_dom() I'm not sure
this holds. I'm also uncertain we want to enforce this - it
ought to be fine to hand a page allocated via alloc_domheap_page()
to this function. The choice of alloc_xenheap_page() should be
merely is an always mapped page is wanted (without extra effort
to map).

Jan

