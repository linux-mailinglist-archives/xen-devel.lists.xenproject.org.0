Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BC6265F14
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 13:56:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGheR-0001jd-DG; Fri, 11 Sep 2020 11:55:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eh3a=CU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kGheQ-0001jY-Bx
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 11:55:34 +0000
X-Inumbo-ID: 9112228a-9819-4b6f-bfac-57e66250a9e1
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9112228a-9819-4b6f-bfac-57e66250a9e1;
 Fri, 11 Sep 2020 11:55:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 90994AC23;
 Fri, 11 Sep 2020 11:55:47 +0000 (UTC)
Subject: Re: [PATCH] x86/mm: do not mark IO regions as Xen heap
From: Jan Beulich <jbeulich@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
References: <20200910133514.82155-1-roger.pau@citrix.com>
 <4d6c3e64-c70a-0400-e01f-9244c63ab0df@suse.com>
Message-ID: <0293c11e-3952-4cf4-ff82-5ad4fe3a85ca@suse.com>
Date: Fri, 11 Sep 2020 13:55:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <4d6c3e64-c70a-0400-e01f-9244c63ab0df@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 10.09.2020 16:41, Jan Beulich wrote:
> On 10.09.2020 15:35, Roger Pau Monne wrote:
>> arch_init_memory will treat all the gaps on the physical memory map
>> between RAM regions as MMIO and use share_xen_page_with_guest in order
>> to assign them to dom_io. This has the side effect of setting the Xen
>> heap flag on such pages, and thus is_special_page would then return
>> true which is an issue in epte_get_entry_emt because such pages will
>> be forced to use write-back cache attributes.
>>
>> Fix this by introducing a new helper to assign the MMIO regions to
>> dom_io without setting the Xen heap flag on the pages, so that
>> is_special_page will return false and the pages won't be forced to use
>> write-back cache attributes.
>>
>> Fixes: 81fd0d3ca4b2cd ('x86/hvm: simplify 'mmio_direct' check in epte_get_entry_emt()')
>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> albeit I'm inclined to add, while committing, a comment ...
> 
>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -271,6 +271,18 @@ static l4_pgentry_t __read_mostly split_l4e;
>>  #define root_pgt_pv_xen_slots ROOT_PAGETABLE_PV_XEN_SLOTS
>>  #endif
>>  
>> +static void __init assign_io_page(struct page_info *page)
>> +{
>> +    set_gpfn_from_mfn(mfn_x(page_to_mfn(page)), INVALID_M2P_ENTRY);
>> +
>> +    /* The incremented type count pins as writable. */
>> +    page->u.inuse.type_info = PGT_writable_page | PGT_validated | 1;
>> +
>> +    page_set_owner(page, dom_io);
>> +
>> +    page->count_info |= PGC_allocated | 1;
>> +}
> 
> ... clarifying its relationship with share_xen_page_with_guest().

I'm also going to add an assertion to share_xen_page_with_guest() to
document and make sure dom_io won't again be passed there.

Jan

