Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 227761D5A84
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 22:03:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZgXs-0002wd-BY; Fri, 15 May 2020 20:03:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kC4v=65=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jZgXr-0002wY-5a
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 20:02:59 +0000
X-Inumbo-ID: 12698558-96e7-11ea-a5bc-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 12698558-96e7-11ea-a5bc-12813bfff9fa;
 Fri, 15 May 2020 20:02:58 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: yGC/Kqg1r1VUA3XNT+zpL7F45PdFGy6WSsP13wEDiKhAO5cDDN/GhYcyrx5YpSQjQVct9+lba3
 vgMWQrirJWtbh9rZNt00z5CR93QNUW5OE9vRw1vThk1/hnsG3iwxEAS+0WojPbXZVdwCdXShYg
 hDYRHTacWginBiIieQwPkZS/s8Yq9dhE3UwMG87N+iSUo7zC0yxDBfFQ4rJtvrcFmYmC0ffIhI
 1BKImwvOIW882/Bqd585tjSZcjbmfbVaRGk+sV2EtlNLOk4g3KH+gSBzOlQvcoV3++KL6kff+b
 7Aw=
X-SBRS: 2.7
X-MesageID: 17934500
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,396,1583211600"; d="scan'208";a="17934500"
Subject: Re: [PATCH v2 2/6] x86/mem-paging: correct p2m_mem_paging_prep()'s
 error handling
To: Jan Beulich <jbeulich@suse.com>
References: <b8437b1f-af58-70df-91d2-bd875912e57b@suse.com>
 <bf9dd27b-a7db-de0e-a804-d687e66ecf1e@suse.com>
 <2cccf9bb-3930-436d-65de-f0eb7dd0c498@citrix.com>
 <83f6463c-6a61-e79b-cf1b-77589ef287c1@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1e390685-dbca-afee-0cda-692b1134183e@citrix.com>
Date: Fri, 15 May 2020 21:02:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <83f6463c-6a61-e79b-cf1b-77589ef287c1@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, George
 Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15/05/2020 16:15, Jan Beulich wrote:
>>> +            domain_crash(d);
> This already leaves a file/line combination as a (minimal hint).

First, that is still tantamount to useless in logs from a user.

Second, the use of __LINE__ is why it breaks livepatching, and people
using livepatching is still carrying an out-of-tree patch to unbreak it.

> I can make a patch to add a gprintk() as you ask for, but I'm not
> sure it's worth it for this almost dead code.

"page in unexpected state" would be better than nothing, but given the
comment, it might also be better as ASSERT_UNREACHABLE(), and we now
have a lot of cases where we declare unreachable, and kill the domain in
release builds.

>
>>> @@ -1843,13 +1852,24 @@ int p2m_mem_paging_prep(struct domain *d
>>>      ret = p2m_set_entry(p2m, gfn, mfn, PAGE_ORDER_4K,
>>>                          paging_mode_log_dirty(d) ? p2m_ram_logdirty
>>>                                                   : p2m_ram_rw, a);
>>> -    set_gpfn_from_mfn(mfn_x(mfn), gfn_l);
>>> +    if ( !ret )
>>> +    {
>>> +        set_gpfn_from_mfn(mfn_x(mfn), gfn_l);
>>>  
>>> -    if ( !page_extant )
>>> -        atomic_dec(&d->paged_pages);
>>> +        if ( !page_extant )
>>> +            atomic_dec(&d->paged_pages);
>>> +    }
>>>  
>>>   out:
>>>      gfn_unlock(p2m, gfn, 0);
>>> +
>>> +    if ( page )
>>> +    {
>>> +        if ( ret )
>>> +            put_page_alloc_ref(page);
>>> +        put_page(page);
>> This is a very long way from clear enough to follow, and buggy if anyone
>> inserts a new goto out path.
> What alternatives do you see?

/* Fully free the page on error.  Drop our temporary reference in all
cases. */

would at least help someone trying to figure out what is going on here,
especially as put_page_alloc_ref() is not the obvious freeing function
for alloc_domheap_page().

~Andrew

