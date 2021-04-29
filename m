Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 188D036ECEA
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 17:01:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120126.227148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc8AO-0004NP-12; Thu, 29 Apr 2021 15:01:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120126.227148; Thu, 29 Apr 2021 15:01:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc8AN-0004N2-U0; Thu, 29 Apr 2021 15:01:23 +0000
Received: by outflank-mailman (input) for mailman id 120126;
 Thu, 29 Apr 2021 15:01:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfjL=J2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lc8AM-0004Mx-1h
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 15:01:22 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c2ef2041-cea2-49b7-bce5-b4bc2df13556;
 Thu, 29 Apr 2021 15:01:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 256D5B155;
 Thu, 29 Apr 2021 15:01:20 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: c2ef2041-cea2-49b7-bce5-b4bc2df13556
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619708480; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PvmUm53KgHCXUaJWnWOnwWFCAA9Erof4GJ5DZXmYtiA=;
	b=fbnn1mcexhEDrmoScLvJ9FadC3pZd8Ibh4+f2kbrz0K7ml+q5jmVDAh/qa5vDv2lnz8csA
	PDR2uGG6rwLxEvfyU6FXrLnLbATOGUERGNBkX7gtw+V4j2LgM9f9cYwMeKzkjaDtVVqE2p
	7U8wlwf2uh+bVkE7ei5WBZUrvrSUFrU=
Subject: Re: [PATCH v2 02/12] x86/p2m: {,un}map_mmio_regions() are HVM-only
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
 <7f8ca70d-8bbe-bd5d-533a-c5ea81dc91a2@suse.com>
 <YIrHO9N6YgQEOpJh@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b11df1ad-6e2e-9c87-6adb-410402c8dcb5@suse.com>
Date: Thu, 29 Apr 2021 17:01:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YIrHO9N6YgQEOpJh@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 29.04.2021 16:48, Roger Pau Monné wrote:
> On Mon, Apr 12, 2021 at 04:06:34PM +0200, Jan Beulich wrote:
>> Mirror the "translated" check the functions do to do_domctl(), allowing
>> the calls to be DCEd by the compiler. Add ASSERT_UNREACHABLE() to the
>> original checks.
>>
>> Also arrange for {set,clear}_mmio_p2m_entry() and
>> {set,clear}_identity_p2m_entry() to respectively live next to each
>> other, such that clear_mmio_p2m_entry() can also be covered by the
>> #ifdef already covering set_mmio_p2m_entry().
> 
> Seeing the increase in HVM specific regions, would it make sense to
> consider splitting the HVM bits into p2m-hvm.c or some such?

As said on the 01/12 sub-thread, I see the goal as p2m.c as a whole
becoming HVM specific.

>> @@ -1932,7 +1934,10 @@ int map_mmio_regions(struct domain *d,
>>      unsigned int iter, order;
>>  
>>      if ( !paging_mode_translate(d) )
>> +    {
>> +        ASSERT_UNREACHABLE();
>>          return 0;
>> +    }
>>  
>>      for ( iter = i = 0; i < nr && iter < MAP_MMIO_MAX_ITER;
>>            i += 1UL << order, ++iter )
>> @@ -1964,7 +1969,10 @@ int unmap_mmio_regions(struct domain *d,
>>      unsigned int iter, order;
>>  
>>      if ( !paging_mode_translate(d) )
>> +    {
>> +        ASSERT_UNREACHABLE();
>>          return 0;
> 
> Maybe consider returning an error here now instead of silently
> failing? It's not supposed to be reached, so getting here likely means
> something else has gone wrong and it's best to just report an error?

Can do, sure. Would be -EOPNOTSUPP.

> The rest LGTM:
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

Jan

