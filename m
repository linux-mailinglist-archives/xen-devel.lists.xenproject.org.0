Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 910861B3B0E
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2020 11:20:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRBYJ-0005S0-40; Wed, 22 Apr 2020 09:20:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9j4T=6G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jRBYH-0005Rv-0K
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2020 09:20:17 +0000
X-Inumbo-ID: 79df70a1-847a-11ea-9248-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 79df70a1-847a-11ea-9248-12813bfff9fa;
 Wed, 22 Apr 2020 09:20:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A2528AC52;
 Wed, 22 Apr 2020 09:20:13 +0000 (UTC)
Subject: Re: [PATCH] pvcalls: Document explicitly the padding for all arches
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20200419104948.31200-1-julien@xen.org>
 <e07dbb22-1300-ae87-4065-824938caec48@suse.com>
 <78288649-5930-9d01-bb8f-85e15406e4ef@xen.org>
 <6fc59120-664e-6a07-5196-57e1dbfb0dde@suse.com>
 <alpine.DEB.2.21.2004211609410.24585@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <240bc5e8-f8fd-217a-fa10-7628ac9d4e6e@suse.com>
Date: Wed, 22 Apr 2020 11:20:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2004211609410.24585@sstabellini-ThinkPad-T480s>
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
Cc: Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.04.2020 01:27, Stefano Stabellini wrote:
> On Mon, 20 Apr 2020, Jan Beulich wrote:
>> On 20.04.2020 15:34, Julien Grall wrote:
>>> Hi Jan,
>>>
>>> On 20/04/2020 09:04, Jan Beulich wrote:
>>>> On 19.04.2020 12:49, Julien Grall wrote:
>>>>> --- a/docs/misc/pvcalls.pandoc
>>>>> +++ b/docs/misc/pvcalls.pandoc
>>>>> @@ -246,9 +246,7 @@ The format is defined as follows:
>>>>>                   uint32_t domain;
>>>>>                   uint32_t type;
>>>>>                   uint32_t protocol;
>>>>> -                #ifdef CONFIG_X86_32
>>>>>                   uint8_t pad[4];
>>>>> -                #endif
>>>>>               } socket;
>>>>>               struct xen_pvcalls_connect {
>>>>>                   uint64_t id;
>>>>> @@ -257,16 +255,12 @@ The format is defined as follows:
>>>>>                   uint32_t flags;
>>>>>                   grant_ref_t ref;
>>>>>                   uint32_t evtchn;
>>>>> -                #ifdef CONFIG_X86_32
>>>>>                   uint8_t pad[4];
>>>>> -                #endif
>>>>>               } connect;
>>>>>               struct xen_pvcalls_release {
>>>>>                   uint64_t id;
>>>>>                   uint8_t reuse;
>>>>> -                #ifdef CONFIG_X86_32
>>>>>                   uint8_t pad[7];
>>>>> -                #endif
>>>>>               } release;
>>>>>               struct xen_pvcalls_bind {
>>>>>                   uint64_t id;
>>>>> @@ -276,9 +270,7 @@ The format is defined as follows:
>>>>>               struct xen_pvcalls_listen {
>>>>>                   uint64_t id;
>>>>>                   uint32_t backlog;
>>>>> -                #ifdef CONFIG_X86_32
>>>>>                   uint8_t pad[4];
>>>>> -                #endif
>>>>>               } listen;
>>>>>               struct xen_pvcalls_accept {
>>>>>                   uint64_t id;
>>>>
>>>> I wonder on what grounds these #ifdef-s had been there - they're
>>>> plain wrong with the types used in the public header.
>>>>
>>>>> --- a/xen/include/public/io/pvcalls.h
>>>>> +++ b/xen/include/public/io/pvcalls.h
>>>>> @@ -65,6 +65,7 @@ struct xen_pvcalls_request {
>>>>>               uint32_t domain;
>>>>>               uint32_t type;
>>>>>               uint32_t protocol;
>>>>> +            uint8_t pad[4];
>>>>>           } socket;
>>>>>           struct xen_pvcalls_connect {
>>>>>               uint64_t id;
>>>>> @@ -73,10 +74,12 @@ struct xen_pvcalls_request {
>>>>>               uint32_t flags;
>>>>>               grant_ref_t ref;
>>>>>               uint32_t evtchn;
>>>>> +            uint8_t pad[4];
>>>>>           } connect;
>>>>>           struct xen_pvcalls_release {
>>>>>               uint64_t id;
>>>>>               uint8_t reuse;
>>>>> +            uint8_t pad[7];
>>>>>           } release;
>>>>>           struct xen_pvcalls_bind {
>>>>>               uint64_t id;
>>>>> @@ -86,6 +89,7 @@ struct xen_pvcalls_request {
>>>>>           struct xen_pvcalls_listen {
>>>>>               uint64_t id;
>>>>>               uint32_t backlog;
>>>>> +            uint8_t pad[4];
>>>>>           } listen;
>>>>
>>>> I'm afraid we can't change these in such a way - your additions
>>>> change sizeof() for the respective sub-structures on 32-bit x86,
>>>> and hence this is not a backwards compatible adjustment. 
>>>
>>> This is a bit confusing, each structure contain a 64-bit field so
>>> I would have thought it the structure would be 8-byte aligned (as
>>> on 32-bit Arm). But looking at the spec, a uint64_t will only
>>> aligned to 4-byte.
>>>
>>> However, I am not sure why sizeof() matters here. I understand
>>> the value would be different, but AFAICT, this is not used as part
>>> of the protocol.
>>
>> Two independent components of a consumer of our interface could
>> have a function taking (pointer to) struct xen_pvcalls_connect.
>> If one component gets re-built with the new definition and the
>> other doesn't, they'll disagree on what range of memory needs
>> to be accessible. The instantiating side (using the old header)
>> may have ended up placing the struct immediately ahead of a
>> page boundary. The consuming side (using the changed header)
>> would then encounter a fault if it wanted to access the struct
>> as a whole (assignment, memcpy()).
> 
> Even if it was possible to use the sub-structs defined in the header
> that way, keep in mind that we also wrote:
> 
>         /* dummy member to force sizeof(struct xen_pvcalls_request)
>          * to match across archs */
>         struct xen_pvcalls_dummy {
>             uint8_t dummy[56];
>         } dummy;

This has nothing to do with how a consumer may use the structs.

> And the spec also clarifies that the size of each specific request is
> always 56 bytes.

Sure, and I didn't mean to imply that a consumer would be allowed
to break this requirement. Still something like this

int pvcall_new_socket(struct xen_pvcalls_socket *s) {
    struct xen_pvcalls_request req = {
        .req_id = REQ_ID,
        .cmd = PVCALLS_SOCKET,
        .u.socket = *s,
    };

    return pvcall(&req);
}

may break.

Jan

