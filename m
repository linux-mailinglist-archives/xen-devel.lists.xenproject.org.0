Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 781FD1BE2C3
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 17:31:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTofl-0005qr-1B; Wed, 29 Apr 2020 15:30:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2IrC=6N=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jTofj-0005qm-0x
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 15:30:51 +0000
X-Inumbo-ID: 677ce262-8a2e-11ea-995f-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 677ce262-8a2e-11ea-995f-12813bfff9fa;
 Wed, 29 Apr 2020 15:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ijjegwEn0CAzh+QSqwb8f+T0GHqZbpbNPXUWw44g7O8=; b=HVWNs9jYZPzce/6MDiL7UcaBG5
 J5P0o6reth+TuCymSBOa3ugK8GnZ/CpVsEDm7GbR2nc/iGzZBZQuSiXgTYTmt6xjNHp7wJvlSJ2Ck
 D178tDbVRZ7OQDiQrcxyp7VjlF3lhf+7V7KjQmpbH9b3O7JF2xmYlJkMQyTT0B012joc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jTofg-0004K3-5p; Wed, 29 Apr 2020 15:30:48 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jToff-0004Sm-TK; Wed, 29 Apr 2020 15:30:48 +0000
Subject: Re: [PATCH] pvcalls: Document explicitly the padding for all arches
To: Jan Beulich <jbeulich@suse.com>
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
From: Julien Grall <julien@xen.org>
Message-ID: <92be4ce7-3963-7ee6-7ee2-28a180411c9c@xen.org>
Date: Wed, 29 Apr 2020 16:30:45 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1494fe06-b353-00a5-17a6-c11cee269519@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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

Hi Jan,

On 29/04/2020 16:23, Jan Beulich wrote:
> On 29.04.2020 17:06, Julien Grall wrote:
>>
>>
>> On 29/04/2020 15:56, Jan Beulich wrote:
>>> On 29.04.2020 16:14, Julien Grall wrote:
>>>> Hi Jan,
>>>>
>>>> On 29/04/2020 15:05, Jan Beulich wrote:
>>>>> On 29.04.2020 16:01, Julien Grall wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 22/04/2020 10:20, Jan Beulich wrote:
>>>>>>>> Even if it was possible to use the sub-structs defined in the header
>>>>>>>> that way, keep in mind that we also wrote:
>>>>>>>>
>>>>>>>>             /* dummy member to force sizeof(struct xen_pvcalls_request)
>>>>>>>>              * to match across archs */
>>>>>>>>             struct xen_pvcalls_dummy {
>>>>>>>>                 uint8_t dummy[56];
>>>>>>>>             } dummy;
>>>>>>>
>>>>>>> This has nothing to do with how a consumer may use the structs.
>>>>>>>
>>>>>>>> And the spec also clarifies that the size of each specific request is
>>>>>>>> always 56 bytes.
>>>>>>>
>>>>>>> Sure, and I didn't mean to imply that a consumer would be allowed
>>>>>>> to break this requirement. Still something like this
>>>>>>>
>>>>>>> int pvcall_new_socket(struct xen_pvcalls_socket *s) {
>>>>>>>         struct xen_pvcalls_request req = {
>>>>>>>             .req_id = REQ_ID,
>>>>>>>             .cmd = PVCALLS_SOCKET,
>>>>>>>             .u.socket = *s,
>>>>>>>         };
>>>>>>>
>>>>>>>         return pvcall(&req);
>>>>>>> }
>>>>>>>
>>>>>>> may break.
>>>>>>
>>>>>> I think I understand your concern now. So yes I agree this would break 32-bit consumer.
>>>>>>
>>>>>> As the padding is at the end of the structure, I think a 32-bit frontend and 64-bit backend (or vice-versa) should currently work without any trouble. The problem would come later if we decide to extend a command.
>>>>>
>>>>> Can commands be extended at all, i.e. don't extensions require new
>>>>> commands? The issue I've described has nothing to do with future
>>>>> extending of any of the affected structures.
>>>>
>>>> I think my point wasn't conveyed correctly. The implicit padding is at
>>>> the end of the structure for all the consumers but 32-bit x86. So
>>>> without any modification, I think 32-bit frontend can still communicate
>>>> with 64-bit backend (or vice-versa).
>>>
>>> There's no issue communicating afaics, as for communication
>>> you wouldn't use the sub-structures, but the single container
>>> one. The problem is, as described, with possible uses internal
>>> to one side of the communication.
>>
>> I am sorry but I can't figure out how this is an issue. The
>> problem you described would only happen if you are calling a
>> 64-bit library from a 32-bit software.
> 
> Why? The example given doesn't require such.

Your example is only valid if we change the padding. In my previous 
e-mail I wrote "without modification" (i.e existing code) and marking 
the implicit padding only for 64-bit x86 and Arm. So there is no change 
in the size of the structure and therefore there is no issue to 
recompile as the size would not change.

>> Is it even possible?
> 
> In principle yes, I think. I don't think OSes like Linux allow this,
> though.
Do we really have to care about this?

Cheers,

-- 
Julien Grall

