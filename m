Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C111A265953
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 08:26:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGcVM-000461-NG; Fri, 11 Sep 2020 06:25:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eh3a=CU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kGcVL-00045w-K8
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 06:25:51 +0000
X-Inumbo-ID: 91ea2adc-131c-4f64-8b52-3e897172dc61
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 91ea2adc-131c-4f64-8b52-3e897172dc61;
 Fri, 11 Sep 2020 06:25:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 355CFAED8;
 Fri, 11 Sep 2020 06:26:05 +0000 (UTC)
Subject: Re: [PATCH] x86/mm: do not mark IO regions as Xen heap
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
References: <20200910133514.82155-1-roger.pau@citrix.com>
 <4d6c3e64-c70a-0400-e01f-9244c63ab0df@suse.com>
 <20200910172438.GA753@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <12b3fe59-5bcf-75f1-4917-67639697225f@suse.com>
Date: Fri, 11 Sep 2020 08:25:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200910172438.GA753@Air-de-Roger>
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

On 10.09.2020 19:27, Roger Pau Monné wrote:
> On Thu, Sep 10, 2020 at 04:41:41PM +0200, Jan Beulich wrote:
>> On 10.09.2020 15:35, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/mm.c
>>> +++ b/xen/arch/x86/mm.c
>>> @@ -271,6 +271,18 @@ static l4_pgentry_t __read_mostly split_l4e;
>>>  #define root_pgt_pv_xen_slots ROOT_PAGETABLE_PV_XEN_SLOTS
>>>  #endif
>>>  
>>> +static void __init assign_io_page(struct page_info *page)
>>> +{
>>> +    set_gpfn_from_mfn(mfn_x(page_to_mfn(page)), INVALID_M2P_ENTRY);
>>> +
>>> +    /* The incremented type count pins as writable. */
>>> +    page->u.inuse.type_info = PGT_writable_page | PGT_validated | 1;
>>> +
>>> +    page_set_owner(page, dom_io);
>>> +
>>> +    page->count_info |= PGC_allocated | 1;
>>> +}
>>
>> ... clarifying its relationship with share_xen_page_with_guest().
> 
> Sure, I think the relation is quite vague now, since this is no longer
> sharing the page (as it's not added to xenpage_list) but rather
> assigning it to dom_io.
> 
> In general I feel this is all quite confusing, and would benefit from
> having some clear rules about what flags and assigned domains non-RAM
> pages have, and how they should be added to the p2m.

Some might call this "organically grown" ... ;-)

Jan

