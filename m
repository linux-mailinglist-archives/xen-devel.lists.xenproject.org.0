Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D6F1B0D11
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 15:45:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQWk6-0001pL-Rm; Mon, 20 Apr 2020 13:45:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=z/8R=6E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jQWk5-0001p7-1I
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 13:45:45 +0000
X-Inumbo-ID: 3b17da24-830d-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b17da24-830d-11ea-b58d-bc764e2007e4;
 Mon, 20 Apr 2020 13:45:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6D501AAB2;
 Mon, 20 Apr 2020 13:45:42 +0000 (UTC)
Subject: Re: [PATCH] pvcalls: Document explicitly the padding for all arches
To: Julien Grall <julien@xen.org>
References: <20200419104948.31200-1-julien@xen.org>
 <e07dbb22-1300-ae87-4065-824938caec48@suse.com>
 <78288649-5930-9d01-bb8f-85e15406e4ef@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6fc59120-664e-6a07-5196-57e1dbfb0dde@suse.com>
Date: Mon, 20 Apr 2020 15:45:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <78288649-5930-9d01-bb8f-85e15406e4ef@xen.org>
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20.04.2020 15:34, Julien Grall wrote:
> Hi Jan,
> 
> On 20/04/2020 09:04, Jan Beulich wrote:
>> On 19.04.2020 12:49, Julien Grall wrote:
>>> --- a/docs/misc/pvcalls.pandoc
>>> +++ b/docs/misc/pvcalls.pandoc
>>> @@ -246,9 +246,7 @@ The format is defined as follows:
>>>                   uint32_t domain;
>>>                   uint32_t type;
>>>                   uint32_t protocol;
>>> -                #ifdef CONFIG_X86_32
>>>                   uint8_t pad[4];
>>> -                #endif
>>>               } socket;
>>>               struct xen_pvcalls_connect {
>>>                   uint64_t id;
>>> @@ -257,16 +255,12 @@ The format is defined as follows:
>>>                   uint32_t flags;
>>>                   grant_ref_t ref;
>>>                   uint32_t evtchn;
>>> -                #ifdef CONFIG_X86_32
>>>                   uint8_t pad[4];
>>> -                #endif
>>>               } connect;
>>>               struct xen_pvcalls_release {
>>>                   uint64_t id;
>>>                   uint8_t reuse;
>>> -                #ifdef CONFIG_X86_32
>>>                   uint8_t pad[7];
>>> -                #endif
>>>               } release;
>>>               struct xen_pvcalls_bind {
>>>                   uint64_t id;
>>> @@ -276,9 +270,7 @@ The format is defined as follows:
>>>               struct xen_pvcalls_listen {
>>>                   uint64_t id;
>>>                   uint32_t backlog;
>>> -                #ifdef CONFIG_X86_32
>>>                   uint8_t pad[4];
>>> -                #endif
>>>               } listen;
>>>               struct xen_pvcalls_accept {
>>>                   uint64_t id;
>>
>> I wonder on what grounds these #ifdef-s had been there - they're
>> plain wrong with the types used in the public header.
>>
>>> --- a/xen/include/public/io/pvcalls.h
>>> +++ b/xen/include/public/io/pvcalls.h
>>> @@ -65,6 +65,7 @@ struct xen_pvcalls_request {
>>>               uint32_t domain;
>>>               uint32_t type;
>>>               uint32_t protocol;
>>> +            uint8_t pad[4];
>>>           } socket;
>>>           struct xen_pvcalls_connect {
>>>               uint64_t id;
>>> @@ -73,10 +74,12 @@ struct xen_pvcalls_request {
>>>               uint32_t flags;
>>>               grant_ref_t ref;
>>>               uint32_t evtchn;
>>> +            uint8_t pad[4];
>>>           } connect;
>>>           struct xen_pvcalls_release {
>>>               uint64_t id;
>>>               uint8_t reuse;
>>> +            uint8_t pad[7];
>>>           } release;
>>>           struct xen_pvcalls_bind {
>>>               uint64_t id;
>>> @@ -86,6 +89,7 @@ struct xen_pvcalls_request {
>>>           struct xen_pvcalls_listen {
>>>               uint64_t id;
>>>               uint32_t backlog;
>>> +            uint8_t pad[4];
>>>           } listen;
>>
>> I'm afraid we can't change these in such a way - your additions
>> change sizeof() for the respective sub-structures on 32-bit x86,
>> and hence this is not a backwards compatible adjustment. 
> 
> This is a bit confusing, each structure contain a 64-bit field so
> I would have thought it the structure would be 8-byte aligned (as
> on 32-bit Arm). But looking at the spec, a uint64_t will only
> aligned to 4-byte.
> 
> However, I am not sure why sizeof() matters here. I understand
> the value would be different, but AFAICT, this is not used as part
> of the protocol.

Two independent components of a consumer of our interface could
have a function taking (pointer to) struct xen_pvcalls_connect.
If one component gets re-built with the new definition and the
other doesn't, they'll disagree on what range of memory needs
to be accessible. The instantiating side (using the old header)
may have ended up placing the struct immediately ahead of a
page boundary. The consuming side (using the changed header)
would then encounter a fault if it wanted to access the struct
as a whole (assignment, memcpy()).

Jan

