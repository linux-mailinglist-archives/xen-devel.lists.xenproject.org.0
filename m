Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 017BE1BE203
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 17:07:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jToIb-00035s-MT; Wed, 29 Apr 2020 15:06:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2IrC=6N=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jToIa-00035l-Mt
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 15:06:56 +0000
X-Inumbo-ID: 10f8b4dc-8a2b-11ea-9887-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 10f8b4dc-8a2b-11ea-9887-bc764e2007e4;
 Wed, 29 Apr 2020 15:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cIT7cIOQOS7x4/SAdKPDnjC8HObYullJAfnmre0sfzk=; b=1J0HK0mEGIjjarsyCAki8gqgJd
 EU95CkkBAsUawtq0mTApeps9xxi6U8kp4OFUZ2SXThtGzIVw/JzfmrBvEa/khSUmgHfgFRmljHB9t
 +9ZXCbKpfVKLadO3625+hi5sf+TLw4ewoZmsZVADP8BnoFv9krwLMgk+7vTG5OFTNNFc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jToIW-0003tf-1x; Wed, 29 Apr 2020 15:06:52 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jToIV-0002rp-RW; Wed, 29 Apr 2020 15:06:51 +0000
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
From: Julien Grall <julien@xen.org>
Message-ID: <d9d7c77c-35d2-9096-7c4b-49f6d0931d5e@xen.org>
Date: Wed, 29 Apr 2020 16:06:49 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <33f4c492-6400-6386-8dbe-b6b098e97fec@suse.com>
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



On 29/04/2020 15:56, Jan Beulich wrote:
> On 29.04.2020 16:14, Julien Grall wrote:
>> Hi Jan,
>>
>> On 29/04/2020 15:05, Jan Beulich wrote:
>>> On 29.04.2020 16:01, Julien Grall wrote:
>>>> Hi,
>>>>
>>>> On 22/04/2020 10:20, Jan Beulich wrote:
>>>>>> Even if it was possible to use the sub-structs defined in the header
>>>>>> that way, keep in mind that we also wrote:
>>>>>>
>>>>>>            /* dummy member to force sizeof(struct xen_pvcalls_request)
>>>>>>             * to match across archs */
>>>>>>            struct xen_pvcalls_dummy {
>>>>>>                uint8_t dummy[56];
>>>>>>            } dummy;
>>>>>
>>>>> This has nothing to do with how a consumer may use the structs.
>>>>>
>>>>>> And the spec also clarifies that the size of each specific request is
>>>>>> always 56 bytes.
>>>>>
>>>>> Sure, and I didn't mean to imply that a consumer would be allowed
>>>>> to break this requirement. Still something like this
>>>>>
>>>>> int pvcall_new_socket(struct xen_pvcalls_socket *s) {
>>>>>        struct xen_pvcalls_request req = {
>>>>>            .req_id = REQ_ID,
>>>>>            .cmd = PVCALLS_SOCKET,
>>>>>            .u.socket = *s,
>>>>>        };
>>>>>
>>>>>        return pvcall(&req);
>>>>> }
>>>>>
>>>>> may break.
>>>>
>>>> I think I understand your concern now. So yes I agree this would break 32-bit consumer.
>>>>
>>>> As the padding is at the end of the structure, I think a 32-bit frontend and 64-bit backend (or vice-versa) should currently work without any trouble. The problem would come later if we decide to extend a command.
>>>
>>> Can commands be extended at all, i.e. don't extensions require new
>>> commands? The issue I've described has nothing to do with future
>>> extending of any of the affected structures.
>>
>> I think my point wasn't conveyed correctly. The implicit padding is at
>> the end of the structure for all the consumers but 32-bit x86. So
>> without any modification, I think 32-bit frontend can still communicate
>> with 64-bit backend (or vice-versa).
> 
> There's no issue communicating afaics, as for communication
> you wouldn't use the sub-structures, but the single container
> one. The problem is, as described, with possible uses internal
> to one side of the communication.

I am sorry but I can't figure out how this is an issue. The problem you 
described would only happen if you are calling a 64-bit library from a 
32-bit software. Is it even possible?

Cheers,

-- 
Julien Grall

