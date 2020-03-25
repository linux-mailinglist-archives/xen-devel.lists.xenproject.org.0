Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B94511921AA
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 08:15:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH0Cq-0002eC-Rf; Wed, 25 Mar 2020 07:12:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=grKZ=5K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jH0Cp-0002e7-0b
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 07:12:03 +0000
X-Inumbo-ID: ec552374-6e67-11ea-92cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec552374-6e67-11ea-92cf-bc764e2007e4;
 Wed, 25 Mar 2020 07:12:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E56F1ABC2;
 Wed, 25 Mar 2020 07:12:00 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <de46590ad566d9be55b26eaca0bc4dc7fbbada59.1585063311.git.hongyxia@amazon.com>
 <37dcd2d8-8ffe-a58e-4c7a-6dafc935b1c1@suse.com>
 <94abc4e0-b11e-df0f-3e3c-c3a61d87c63a@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <30f1ec6d-b5be-fcb1-c685-ed02961175c1@suse.com>
Date: Wed, 25 Mar 2020 08:11:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <94abc4e0-b11e-df0f-3e3c-c3a61d87c63a@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH] Revert "domctl: improve locking during
 domain destruction"
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
Cc: Hongyan Xia <hx242@xen.org>, Charles Arnold <CARNOLD@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jim Fehlig <JFEHLIG@suse.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24.03.2020 19:39, Julien Grall wrote:
> On 24/03/2020 16:13, Jan Beulich wrote:
>> On 24.03.2020 16:21, Hongyan Xia wrote:
>>> From: Hongyan Xia <hongyxia@amazon.com>
>>> In contrast,
>>> after dropping that commit, parallel domain destructions will just fail
>>> to take the domctl lock, creating a hypercall continuation and backing
>>> off immediately, allowing the thread that holds the lock to destroy a
>>> domain much more quickly and allowing backed-off threads to process
>>> events and irqs.
>>>
>>> On a 144-core server with 4TiB of memory, destroying 32 guests (each
>>> with 4 vcpus and 122GiB memory) simultaneously takes:
>>>
>>> before the revert: 29 minutes
>>> after the revert: 6 minutes
>>
>> This wants comparing against numbers demonstrating the bad effects of
>> the global domctl lock. Iirc they were quite a bit higher than 6 min,
>> perhaps depending on guest properties.
> 
> Your original commit message doesn't contain any clue in which
> cases the domctl lock was an issue. So please provide information
> on the setups you think it will make it worse.

I did never observe the issue myself - let's see whether one of the SUSE
people possibly involved in this back then recall (or have further
pointers; Jim, Charles?), or whether any of the (partly former) Citrix
folks do. My vague recollection is that the issue was the tool stack as
a whole stalling for far too long in particular when destroying very
large guests. One important aspect not discussed in the commit message
at all is that holding the domctl lock block basically _all_ tool stack
operations (including e.g. creation of new guests), whereas the new
issue attempted to be addressed is limited to just domain cleanup.

Jan

