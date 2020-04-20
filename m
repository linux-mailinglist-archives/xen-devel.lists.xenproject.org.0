Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7C01B012A
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 07:50:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQPIc-0000rM-78; Mon, 20 Apr 2020 05:48:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=z/8R=6E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jQPIa-0000rD-Et
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 05:48:52 +0000
X-Inumbo-ID: 9c7d1e48-82ca-11ea-83d8-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9c7d1e48-82ca-11ea-83d8-bc764e2007e4;
 Mon, 20 Apr 2020 05:48:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5EB13AE79;
 Mon, 20 Apr 2020 05:48:49 +0000 (UTC)
Subject: Re: [PATCH 01/10] x86/mm: no-one passes a NULL domain to
 init_xen_l4_slots()
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <65bfcd6a-2bb0-da6f-9e85-39f224bd81fb@suse.com>
 <19d7ad4f-c653-b7b6-59a8-90c9700c9200@suse.com>
 <68542638-b5d5-3261-8088-d0cd6e2dcd74@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <757e4a8b-f60d-1c5c-fe11-b1d22980f09e@suse.com>
Date: Mon, 20 Apr 2020 07:48:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <68542638-b5d5-3261-8088-d0cd6e2dcd74@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17.04.2020 21:46, Andrew Cooper wrote:
> On 17/04/2020 15:25, Jan Beulich wrote:
>> Drop the NULL checks - they've been introduced by commit 8d7b633ada
>> ("x86/mm: Consolidate all Xen L4 slot writing into
>> init_xen_l4_slots()") for no apparent reason.
> 
> :) I'll take this as conformation that all my sudden pagetable work in
> Xen manage ended up being rather more subtle than Linux's equivalent
> work for KPTI.
> 
> https://lists.xenproject.org/archives/html/xen-devel/2018-01/msg00281.html
> 
> Specifically, this was part of trying to arrange for fully per-pcpu
> private mappings, and was used to construct the pagetables for the idle
> vcpu which specifically don't have a perdomain mapping.
> 
> Seeing as this is still an outstanding task in the secret-free-Xen
> plans, any dropping of it now will have to be undone at some point in
> the future.

s/will/may/ I suppose - we don't know for sure how this will look
like at this point.

>  Is there a specific reason for the cleanup?

Elimination of effectively dead code. We avoid arbitrary NULL checks
elsewhere as well; iirc I've seen you (amongst others) comment on
people trying to introduce such in their patches.

>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -1696,7 +1696,7 @@ void init_xen_l4_slots(l4_pgentry_t *l4t
> 
> If we continue with this patch, this comment, just out of context, needs
> adjusting.

Will do.

Jan

