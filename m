Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 732582347CE
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 16:31:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1W4M-0005D5-Ai; Fri, 31 Jul 2020 14:31:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S17i=BK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k1W4K-0005Cz-Ik
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 14:31:32 +0000
X-Inumbo-ID: 86ae67fa-d33a-11ea-8e4b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 86ae67fa-d33a-11ea-8e4b-bc764e2007e4;
 Fri, 31 Jul 2020 14:31:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A848BAD4A;
 Fri, 31 Jul 2020 14:31:43 +0000 (UTC)
Subject: Re: [PATCH 4/5] xen/memory: Fix acquire_resource size semantics
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200728113712.22966-1-andrew.cooper3@citrix.com>
 <20200728113712.22966-5-andrew.cooper3@citrix.com>
 <002b01d6664b$c7eb5f40$57c21dc0$@xen.org>
 <474ff131-83d8-deff-4e3a-32392ea092b3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0815a476-cee1-71a8-bac4-c1feb3c518e5@suse.com>
Date: Fri, 31 Jul 2020 16:31:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <474ff131-83d8-deff-4e3a-32392ea092b3@citrix.com>
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
Cc: 'Hubert Jasudowicz' <hubert.jasudowicz@cert.pl>,
 'Stefano Stabellini' <sstabellini@kernel.org>, 'Julien Grall' <julien@xen.org>,
 'Wei Liu' <wl@xen.org>, paul@xen.org,
 'George Dunlap' <George.Dunlap@eu.citrix.com>,
 'Konrad Rzeszutek Wilk' <konrad.wilk@oracle.com>,
 =?UTF-8?B?J01pY2hhxYIgTGVzemN6ecWEc2tpJw==?= <michal.leszczynski@cert.pl>,
 'Ian Jackson' <ian.jackson@citrix.com>,
 'Xen-devel' <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 30.07.2020 21:46, Andrew Cooper wrote:
> On 30/07/2020 09:31, Paul Durrant wrote:
>>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Andrew Cooper
>>> Sent: 28 July 2020 12:37
>>>
>>> --- a/xen/common/grant_table.c
>>> +++ b/xen/common/grant_table.c
>>> @@ -4013,6 +4013,25 @@ static int gnttab_get_shared_frame_mfn(struct domain *d,
>>>      return 0;
>>>  }
>>>
>>> +unsigned int gnttab_resource_max_frames(struct domain *d, unsigned int id)
>>> +{
>>> +    unsigned int nr = 0;
>>> +
>>> +    /* Don't need the grant lock.  This limit is fixed at domain create time. */
>>> +    switch ( id )
>>> +    {
>>> +    case XENMEM_resource_grant_table_id_shared:
>>> +        nr = d->grant_table->max_grant_frames;
>>> +        break;
>>> +
>>> +    case XENMEM_resource_grant_table_id_status:
>>> +        nr = grant_to_status_frames(d->grant_table->max_grant_frames);
>> Two uses of d->grant_table, so perhaps define a stack variable for it?
> 
> Can do.
> 
>>  Also, should you not make sure 0 is returned in the case of a v1 table?
> 
> This was the case specifically discussed in the commit message, but
> perhaps it needs expanding.
> 
> Doing so would be buggy.
> 
> Some utility is going to query the resource size, and then try to map it
> (if it doesn't blindly know the size and/or subset it cares about already).
> 
> In between these two hypercalls from the utility, the guest can do a
> v1=>v2 or v2=>v1 switch and make the resource spontaneously appear or
> disappear.
> 
> The only case where we can know for certain whether the resource is
> available is when we're in the map hypercall.  Therefore, userspace has
> to be able to get to the map call if there is potentially a resource
> available.
> 
> The semantics of the size call are really "this resource might exist,
> and if it does, this is how large it is".

With you deriving from d->grant_table->max_grant_frames, this approach
would imply that by obtaining a mapping the grant tables will get
grown to their permitted maximum, no matter whether as much is actually
needed by the guest. If this is indeed the intention, then we could as
well set up maximum grant structures right at domain creation. Not
something I would favor, but anyway...

Jan

