Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 894991D359A
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 17:52:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZG9T-0000xn-Eu; Thu, 14 May 2020 15:52:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ezST=64=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jZG9S-0000xg-6x
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 15:52:02 +0000
X-Inumbo-ID: d886ecdd-95fa-11ea-a4af-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d886ecdd-95fa-11ea-a4af-12813bfff9fa;
 Thu, 14 May 2020 15:52:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DE07CAEE6;
 Thu, 14 May 2020 15:52:02 +0000 (UTC)
Subject: Re: [PATCH v2 1/6] x86/mem-paging: fold p2m_mem_paging_prep()'s main
 if()-s
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <b8437b1f-af58-70df-91d2-bd875912e57b@suse.com>
 <cea2307f-1aae-51cb-20ac-fbaf4b945771@suse.com>
 <20200514154506.GF54375@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4ef5582f-23c6-40d3-b694-eac9cc3b0edf@suse.com>
Date: Thu, 14 May 2020 17:51:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200514154506.GF54375@Air-de-Roger>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14.05.2020 17:45, Roger Pau Monné wrote:
> On Thu, Apr 23, 2020 at 10:37:06AM +0200, Jan Beulich wrote:
>> The condition of the second can be true only if the condition of the
>> first was met; the second half of the condition of the second then also
>> is redundant with an earlier check. Combine them, drop a pointless
>> local variable, and re-flow the affected gdprintk().
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> --- a/xen/arch/x86/mm/p2m.c
>> +++ b/xen/arch/x86/mm/p2m.c
>> @@ -1808,6 +1808,8 @@ int p2m_mem_paging_prep(struct domain *d
>>      /* Allocate a page if the gfn does not have one yet */
>>      if ( !mfn_valid(mfn) )
>>      {
>> +        void *guest_map;
>> +
>>          /* If the user did not provide a buffer, we disallow */
>>          ret = -EINVAL;
>>          if ( unlikely(user_ptr == NULL) )
>> @@ -1819,22 +1821,16 @@ int p2m_mem_paging_prep(struct domain *d
>>              goto out;
>>          mfn = page_to_mfn(page);
>>          page_extant = 0;
>> -    }
>> -
>> -    /* If we were given a buffer, now is the time to use it */
>> -    if ( !page_extant && user_ptr )
>> -    {
>> -        void *guest_map;
>> -        int rc;
>>  
>>          ASSERT( mfn_valid(mfn) );
> 
> I would be tempted to remove this assert also, since you just
> successfully allocated the page at this point.

Oh, indeed, good point.

Jan

