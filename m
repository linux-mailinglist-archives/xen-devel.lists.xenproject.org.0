Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AB21BE340
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 17:59:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTp66-00084e-6p; Wed, 29 Apr 2020 15:58:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yqvu=6N=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jTp65-00084Z-Jw
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 15:58:05 +0000
X-Inumbo-ID: 34104781-8a32-11ea-9964-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 34104781-8a32-11ea-9964-12813bfff9fa;
 Wed, 29 Apr 2020 15:58:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 11BAFAB91;
 Wed, 29 Apr 2020 15:58:01 +0000 (UTC)
Subject: Re: [PATCH] pvcalls: Document explicitly the padding for all arches
To: Julien Grall <julien@xen.org>
References: <20200419104948.31200-1-julien@xen.org>
 <e07dbb22-1300-ae87-4065-824938caec48@suse.com>
 <78288649-5930-9d01-bb8f-85e15406e4ef@xen.org>
 <6fc59120-664e-6a07-5196-57e1dbfb0dde@suse.com>
 <alpine.DEB.2.21.2004211609410.24585@sstabellini-ThinkPad-T480s>
 <240bc5e8-f8fd-217a-fa10-7628ac9d4e6e@suse.com>
 <9eb39857-2e33-4a6b-1825-f9dc537a6515@xen.org>
 <423c0369-9c90-dbfe-2f90-d49a2ce5b283@suse.com>
 <4cd108f9-3ad0-2262-fa7c-d2247660c635@xen.org>
 <33f4c492-6400-6386-8dbe-b6b098e97fec@suse.com>
 <d9d7c77c-35d2-9096-7c4b-49f6d0931d5e@xen.org>
 <1494fe06-b353-00a5-17a6-c11cee269519@suse.com>
 <92be4ce7-3963-7ee6-7ee2-28a180411c9c@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2bb47891-bf3c-1bb4-8c54-02f6a7ea4676@suse.com>
Date: Wed, 29 Apr 2020 17:57:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <92be4ce7-3963-7ee6-7ee2-28a180411c9c@xen.org>
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29.04.2020 17:30, Julien Grall wrote:
> Hi Jan,
> 
> On 29/04/2020 16:23, Jan Beulich wrote:
>> On 29.04.2020 17:06, Julien Grall wrote:
>>>
>>>
>>> On 29/04/2020 15:56, Jan Beulich wrote:
>>>> On 29.04.2020 16:14, Julien Grall wrote:
>>>>> Hi Jan,
>>>>>
>>>>> On 29/04/2020 15:05, Jan Beulich wrote:
>>>>>> On 29.04.2020 16:01, Julien Grall wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> On 22/04/2020 10:20, Jan Beulich wrote:
>>>>>>>>> Even if it was possible to use the sub-structs defined in the header
>>>>>>>>> that way, keep in mind that we also wrote:
>>>>>>>>>
>>>>>>>>>             /* dummy member to force sizeof(struct xen_pvcalls_request)
>>>>>>>>>              * to match across archs */
>>>>>>>>>             struct xen_pvcalls_dummy {
>>>>>>>>>                 uint8_t dummy[56];
>>>>>>>>>             } dummy;
>>>>>>>>
>>>>>>>> This has nothing to do with how a consumer may use the structs.
>>>>>>>>
>>>>>>>>> And the spec also clarifies that the size of each specific request is
>>>>>>>>> always 56 bytes.
>>>>>>>>
>>>>>>>> Sure, and I didn't mean to imply that a consumer would be allowed
>>>>>>>> to break this requirement. Still something like this
>>>>>>>>
>>>>>>>> int pvcall_new_socket(struct xen_pvcalls_socket *s) {
>>>>>>>>         struct xen_pvcalls_request req = {
>>>>>>>>             .req_id = REQ_ID,
>>>>>>>>             .cmd = PVCALLS_SOCKET,
>>>>>>>>             .u.socket = *s,
>>>>>>>>         };
>>>>>>>>
>>>>>>>>         return pvcall(&req);
>>>>>>>> }
>>>>>>>>
>>>>>>>> may break.
>>>>>>>
>>>>>>> I think I understand your concern now. So yes I agree this would break 32-bit consumer.
>>>>>>>
>>>>>>> As the padding is at the end of the structure, I think a 32-bit frontend and 64-bit backend (or vice-versa) should currently work without any trouble. The problem would come later if we decide to extend a command.
>>>>>>
>>>>>> Can commands be extended at all, i.e. don't extensions require new
>>>>>> commands? The issue I've described has nothing to do with future
>>>>>> extending of any of the affected structures.
>>>>>
>>>>> I think my point wasn't conveyed correctly. The implicit padding is at
>>>>> the end of the structure for all the consumers but 32-bit x86. So
>>>>> without any modification, I think 32-bit frontend can still communicate
>>>>> with 64-bit backend (or vice-versa).
>>>>
>>>> There's no issue communicating afaics, as for communication
>>>> you wouldn't use the sub-structures, but the single container
>>>> one. The problem is, as described, with possible uses internal
>>>> to one side of the communication.
>>>
>>> I am sorry but I can't figure out how this is an issue. The
>>> problem you described would only happen if you are calling a
>>> 64-bit library from a 32-bit software.
>>
>> Why? The example given doesn't require such.
> 
> Your example is only valid if we change the padding. In my previous
> e-mail I wrote "without modification" (i.e existing code) and
> marking the implicit padding only for 64-bit x86 and Arm. So there
> is no change in the size of the structure and therefore there is no
> issue to recompile as the size would not change.

Oh, sorry, yes. I was mislead by "I think 32-bit frontend can still
communicate with 64-bit backend (or vice-versa)", because I never
said there would be such an issue.

>>> Is it even possible?
>>
>> In principle yes, I think. I don't think OSes like Linux allow this,
>> though.
> Do we really have to care about this?

I don't think we do, but this is a moot point anyway.

Jan

