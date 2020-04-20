Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0631B0CBD
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 15:35:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQWZc-0000Uc-7a; Mon, 20 Apr 2020 13:34:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JPG3=6E=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jQWZb-0000UX-EF
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 13:34:55 +0000
X-Inumbo-ID: b8011106-830b-11ea-b4f4-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b8011106-830b-11ea-b4f4-bc764e2007e4;
 Mon, 20 Apr 2020 13:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KHZs/z/LrfqhfDQ4gmLLzmAK5E3xFeKoPnMo1lVPRtA=; b=duhHwTD69XjxKOBN2aJBRP0fAC
 RfjxcFLoKppfdiuc/OtL0sSJifMmARn7G3dsocyiKFxsPfNIvvUpdtGxZfkiOf+AAMkuMgXvQEaLM
 M9dNaclBdjNBMvsp6pe1Ac6nDUAOX2t7kR3x2eg7j47A9aZvRcOLEArhnKiDLXhiJk0w=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jQWZY-0005Ky-0s; Mon, 20 Apr 2020 13:34:52 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jQWZX-0005RH-PI; Mon, 20 Apr 2020 13:34:51 +0000
Subject: Re: [PATCH] pvcalls: Document explicitly the padding for all arches
To: Jan Beulich <jbeulich@suse.com>
References: <20200419104948.31200-1-julien@xen.org>
 <e07dbb22-1300-ae87-4065-824938caec48@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <78288649-5930-9d01-bb8f-85e15406e4ef@xen.org>
Date: Mon, 20 Apr 2020 14:34:49 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e07dbb22-1300-ae87-4065-824938caec48@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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

Hi Jan,

On 20/04/2020 09:04, Jan Beulich wrote:
> On 19.04.2020 12:49, Julien Grall wrote:
>> --- a/docs/misc/pvcalls.pandoc
>> +++ b/docs/misc/pvcalls.pandoc
>> @@ -246,9 +246,7 @@ The format is defined as follows:
>>       			uint32_t domain;
>>       			uint32_t type;
>>       			uint32_t protocol;
>> -    			#ifdef CONFIG_X86_32
>>       			uint8_t pad[4];
>> -    			#endif
>>       		} socket;
>>       		struct xen_pvcalls_connect {
>>       			uint64_t id;
>> @@ -257,16 +255,12 @@ The format is defined as follows:
>>       			uint32_t flags;
>>       			grant_ref_t ref;
>>       			uint32_t evtchn;
>> -    			#ifdef CONFIG_X86_32
>>       			uint8_t pad[4];
>> -    			#endif
>>       		} connect;
>>       		struct xen_pvcalls_release {
>>       			uint64_t id;
>>       			uint8_t reuse;
>> -    			#ifdef CONFIG_X86_32
>>       			uint8_t pad[7];
>> -    			#endif
>>       		} release;
>>       		struct xen_pvcalls_bind {
>>       			uint64_t id;
>> @@ -276,9 +270,7 @@ The format is defined as follows:
>>       		struct xen_pvcalls_listen {
>>       			uint64_t id;
>>       			uint32_t backlog;
>> -    			#ifdef CONFIG_X86_32
>>       			uint8_t pad[4];
>> -    			#endif
>>       		} listen;
>>       		struct xen_pvcalls_accept {
>>       			uint64_t id;
> 
> I wonder on what grounds these #ifdef-s had been there - they're
> plain wrong with the types used in the public header.
> 
>> --- a/xen/include/public/io/pvcalls.h
>> +++ b/xen/include/public/io/pvcalls.h
>> @@ -65,6 +65,7 @@ struct xen_pvcalls_request {
>>               uint32_t domain;
>>               uint32_t type;
>>               uint32_t protocol;
>> +            uint8_t pad[4];
>>           } socket;
>>           struct xen_pvcalls_connect {
>>               uint64_t id;
>> @@ -73,10 +74,12 @@ struct xen_pvcalls_request {
>>               uint32_t flags;
>>               grant_ref_t ref;
>>               uint32_t evtchn;
>> +            uint8_t pad[4];
>>           } connect;
>>           struct xen_pvcalls_release {
>>               uint64_t id;
>>               uint8_t reuse;
>> +            uint8_t pad[7];
>>           } release;
>>           struct xen_pvcalls_bind {
>>               uint64_t id;
>> @@ -86,6 +89,7 @@ struct xen_pvcalls_request {
>>           struct xen_pvcalls_listen {
>>               uint64_t id;
>>               uint32_t backlog;
>> +            uint8_t pad[4];
>>           } listen;
> 
> I'm afraid we can't change these in such a way - your additions
> change sizeof() for the respective sub-structures on 32-bit x86,
> and hence this is not a backwards compatible adjustment. 

This is a bit confusing, each structure contain a 64-bit field so I 
would have thought it the structure would be 8-byte aligned (as on 
32-bit Arm). But looking at the spec, a uint64_t will only aligned to 
4-byte.

However, I am not sure why sizeof() matters here. I understand the value 
would be different, but AFAICT, this is not used as part of the protocol.

IIUC the request should always be 56-bytes, so at worse you will read 
unknown bytes. Those bytes are at the end of the structure, so it should 
not matter.

> The
> best I can think of right now that we could do is make the
> difference explicit, by putting the padding fields inside
> #ifndef __i386__. But of course this is awkward at least when
> thinking about a 32-bit / 64-bit pair of communication ends on
> an x86-64 host.

I don't think this is necessary because of the way a request has been 
defined.

Cheers,

-- 
Julien Grall

