Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 034CC1964F8
	for <lists+xen-devel@lfdr.de>; Sat, 28 Mar 2020 11:18:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jI8Um-0001m2-AK; Sat, 28 Mar 2020 10:15:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=eoyf=5N=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jI8Uk-0001lv-PE
 for xen-devel@lists.xenproject.org; Sat, 28 Mar 2020 10:15:14 +0000
X-Inumbo-ID: 03cf6024-70dd-11ea-92cf-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 03cf6024-70dd-11ea-92cf-bc764e2007e4;
 Sat, 28 Mar 2020 10:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g0e4kK9JVWsCMXGLCuu9+YY/OhxhU9eomJUvkVHtHfo=; b=FOvROFRPk3BSxcuVuwwtV8hypY
 KjElne2tdcDgUkCB/bhxnls2ARdlY6Ry9G3rcSp+VaVS9lJOxiujJ0mfi1hM9803bSBHyp8T6dwme
 YKFcj3h/1Zn/6kkqMX+4a6Wh5+Bvh59k5ydl0gPLMymcLmlGJUdhtjXzg5zEOhsim7Ag=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jI8Ui-00077p-C4; Sat, 28 Mar 2020 10:15:12 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jI8Ui-0005DL-5X; Sat, 28 Mar 2020 10:15:12 +0000
To: Jan Beulich <jbeulich@suse.com>
References: <20200322161418.31606-1-julien@xen.org>
 <20200322161418.31606-4-julien@xen.org>
 <80c98b3e-efa7-66e6-bd47-61bc0560f535@suse.com>
 <993d82aa-9f19-0b27-a562-53f4c9b2a7a4@xen.org>
 <e2396098-1c65-835c-533f-dfc0cfe3fa0e@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <04cc7785-176d-87d0-8966-214ab0986e45@xen.org>
Date: Sat, 28 Mar 2020 10:15:10 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <e2396098-1c65-835c-533f-dfc0cfe3fa0e@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH 03/17] xen/mm: Move the MM types in a
 separate header
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 26/03/2020 09:02, Jan Beulich wrote:
> On 25.03.2020 19:09, Julien Grall wrote:
>> Hi Jan,
>>
>> On 25/03/2020 15:00, Jan Beulich wrote:
>>> On 22.03.2020 17:14, julien@xen.org wrote:
>>>> From: Julien Grall <jgrall@amazon.com>
>>>>
>>>> It is getting incredibly difficult to use typesafe GFN/MFN/PFN in the
>>>> headers because of circular dependency. For instance, asm-x86/page.h
>>>> cannot include xen/mm.h.
>>>>
>>>> In order to convert more code to use typesafe, the types are now moved
>>>> in a separate header that requires only a few dependencies.
>>>
>>> We definitely need to do this, so thanks for investing the
>>> time. I think though that we want to settle up front (and
>>> perhaps record in a comment in the new header) what is or
>>> is not suitable to go into the new header. After all you're
>>> moving not just type definitions, but also simple helper
>>> functions.
>>
>> I am expecting headers to use the typesafe helpers (such mfn_add)
>> in the long term. So I would like the new header to contain the
>> type definitions and any wrappers that would turn 'generic'
>> operations safe.
>>
>> I am not entirely sure yet how to formalize the rules in the
>> header. Any ideas?
> 
> Well, if the header was just for the typesafe types, it could be
> renamed (to e.g. mm-typesafe.h) and be left without any respective
> comment. The issue I've mentioned arises if, with its currently
> suggested name, further types get added. In such a case perhaps it
> could be "type definitions and their immediate accessors,
> involving no other non-trivial types"?

I will rename the file to mm-typesafe.h.

Cheers,

-- 
Julien Grall

