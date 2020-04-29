Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BFA1BE031
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 16:07:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTnNE-0004wj-9K; Wed, 29 Apr 2020 14:07:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yqvu=6N=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jTnND-0004we-2M
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 14:07:39 +0000
X-Inumbo-ID: c8315702-8a22-11ea-9887-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c8315702-8a22-11ea-9887-bc764e2007e4;
 Wed, 29 Apr 2020 14:07:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7277CAC6C;
 Wed, 29 Apr 2020 14:07:36 +0000 (UTC)
Subject: Re: [PATCH 6/7] xen/guest_access: Consolidate guest access helpers in
 xen/guest_access.h
To: Julien Grall <julien@xen.org>
References: <20200404131017.27330-1-julien@xen.org>
 <20200404131017.27330-7-julien@xen.org>
 <e2588f6e-1f13-b66f-8e3d-b8568f67b62a@suse.com>
 <041a9f9f-cc9e-eac5-cdd2-555fb1c88e6f@xen.org>
 <cf6c0e0b-ade0-587f-ea0e-80b02b21b1a9@suse.com>
 <c8e66108-7ac1-fb51-841f-21886b731f04@xen.org>
 <f02f09ec-b643-8321-e235-ce0ee5526ab3@suse.com>
 <69deb8f4-bafe-734c-f6fa-de41ecf539d2@xen.org>
 <c38f4581-42a6-bb4a-1f84-066528edd3ee@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <48d591a8-ce4f-2952-19f8-983637c9cfa5@suse.com>
Date: Wed, 29 Apr 2020 16:07:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <c38f4581-42a6-bb4a-1f84-066528edd3ee@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29.04.2020 16:04, Julien Grall wrote:
> Gentle ping. Any comments on the direction to take?

Just to avoid misunderstanding - while the mail was sent with me as
the only one on the To list, I don't think I've been meant, as I've
voiced my opinion. I assume you rather meant to ping others to chime
in?

Jan

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
>> In theory it makes sense but, in the current state of Xen, 'asm-generic' means they are common to Arm and x86. This is basically the same definition as for the directory 'xen'. So how do you draw a line which files go where?
>>
>> To be honest, I don't think we can draw a line without a 3rd architecture. So I would recommend to wait until then to create an asm-generic directory.
>>
>> Meanwhile, I still think the consolidation in xen/ is useful as it makes easier to maintain. It is also going to make easier for RISCv (or a new arch) as they don't have to worry about duplication (if any).
>>
>> In the event they decide to purse their own route, then it is not going to be a massive pain to move part of xen/guest_access.h in asm-generic/guest_access.h and include the latter from {xen, asm} /guest_access.h.
> 
> Cheers,
> 


