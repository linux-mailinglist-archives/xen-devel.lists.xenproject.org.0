Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 443BC1D605E
	for <lists+xen-devel@lfdr.de>; Sat, 16 May 2020 12:26:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZu0w-0007bg-64; Sat, 16 May 2020 10:25:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2yaN=66=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jZu0v-0007ba-ID
 for xen-devel@lists.xenproject.org; Sat, 16 May 2020 10:25:53 +0000
X-Inumbo-ID: 9eb5c9c2-975f-11ea-b07b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9eb5c9c2-975f-11ea-b07b-bc764e2007e4;
 Sat, 16 May 2020 10:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ichr6SHMXmKGfKP3My2ejoF99cAitD44TOiqqpYyWsU=; b=XVPyebpkTKH3W9XvLGQEHWKUNS
 RrEwcw9xTwnWj/uSjy7M9H31cV5lcdIBkB4dHCz7DePknYoriyxj2R2ABUjdT8O0gqOJEVerFThVz
 B2bRAARYKqHQ0FUMJQYyORTsmcFAr437O4ecFgrs00iwJErePmZBLZexe2TgdsPP7BH0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jZu0s-0004Vn-Hy; Sat, 16 May 2020 10:25:50 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jZu0s-0000xe-BO; Sat, 16 May 2020 10:25:50 +0000
Subject: Re: [PATCH 6/7] xen/guest_access: Consolidate guest access helpers in
 xen/guest_access.h
To: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200404131017.27330-1-julien@xen.org>
 <20200404131017.27330-7-julien@xen.org>
 <e2588f6e-1f13-b66f-8e3d-b8568f67b62a@suse.com>
 <041a9f9f-cc9e-eac5-cdd2-555fb1c88e6f@xen.org>
 <cf6c0e0b-ade0-587f-ea0e-80b02b21b1a9@suse.com>
 <c8e66108-7ac1-fb51-841f-21886b731f04@xen.org>
 <f02f09ec-b643-8321-e235-ce0ee5526ab3@suse.com>
 <69deb8f4-bafe-734c-f6fa-de41ecf539d2@xen.org>
 <c38f4581-42a6-bb4a-1f84-066528edd3ee@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <aa209d94-2b39-7932-919b-9842f376e0dc@xen.org>
Date: Sat, 16 May 2020 11:25:48 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <c38f4581-42a6-bb4a-1f84-066528edd3ee@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ping 2.

On 29/04/2020 15:04, Julien Grall wrote:
> Hi,
> 
> Gentle ping. Any comments on the direction to take?
> 
> On 09/04/2020 10:28, Julien Grall wrote:
>>
>>
>> On 09/04/2020 09:06, Jan Beulich wrote:
>>> On 09.04.2020 10:01, Julien Grall wrote:
>>>> Hi,
>>>>
>>>> On 09/04/2020 07:30, Jan Beulich wrote:
>>>>> On 09.04.2020 00:05, Julien Grall wrote:
>>>>> I don't see why a new port may not also want
>>>>> to go that route instead of the x86/Arm one.
>>>> I could accept that someone would want to reinvent a new ABI
>>>> from scratch for just an hypothetical new arch. However it would
>>>> be quite an effort to reinvent XEN_GUEST_HANDLE(). The chance is
>>>> RISC-V is only going to re-use what Arm did as Arm already did
>>>> with x86.
>>>>
>>>> I would like to avoid to introduce a new directory asm-generic
>>>> with just one header in it. Maybe you have some other headers in
>>>> mind?
>>>
>>> I recall having wondered a few times whether we shouldn't use this
>>> concept elsewhere. One case iirc was bitops stuff. Looking over
>>> the Linux ones, some atomic and barrier fallback implementations
>>> may also sensibly live there, and there are likely more.
>>
>> In theory it makes sense but, in the current state of Xen, 
>> 'asm-generic' means they are common to Arm and x86. This is basically 
>> the same definition as for the directory 'xen'. So how do you draw a 
>> line which files go where?
>>
>> To be honest, I don't think we can draw a line without a 3rd 
>> architecture. So I would recommend to wait until then to create an 
>> asm-generic directory.
>>
>> Meanwhile, I still think the consolidation in xen/ is useful as it 
>> makes easier to maintain. It is also going to make easier for RISCv 
>> (or a new arch) as they don't have to worry about duplication (if any).
>>
>> In the event they decide to purse their own route, then it is not 
>> going to be a massive pain to move part of xen/guest_access.h in 
>> asm-generic/guest_access.h and include the latter from {xen, asm} 
>> /guest_access.h.
> 
> Cheers,
> 

-- 
Julien Grall

