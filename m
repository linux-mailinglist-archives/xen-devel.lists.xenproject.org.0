Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 816D519AB9B
	for <lists+xen-devel@lfdr.de>; Wed,  1 Apr 2020 14:25:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJcPE-00037O-1N; Wed, 01 Apr 2020 12:23:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1qDs=5R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jJcPC-00037J-7H
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2020 12:23:38 +0000
X-Inumbo-ID: 9cc41476-7413-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9cc41476-7413-11ea-b58d-bc764e2007e4;
 Wed, 01 Apr 2020 12:23:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B8AD1AE71;
 Wed,  1 Apr 2020 12:23:36 +0000 (UTC)
Subject: Re: [PATCH 1/5] xen/common: introduce a new framework for
 save/restore of 'domain' context
To: Julien Grall <julien@xen.org>
References: <20200327185012.1795-1-paul@xen.org>
 <20200327185012.1795-2-paul@xen.org>
 <5a26a89a-6422-b41d-daac-8f33a48ae23b@xen.org>
 <663f4a01-168a-6ead-8447-45e005e578ce@suse.com>
 <77e5ef68-0d1e-b2b6-6e21-273ab7b9b707@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <890e451d-3f78-466c-4780-bd58c56abfe7@suse.com>
Date: Wed, 1 Apr 2020 14:23:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <77e5ef68-0d1e-b2b6-6e21-273ab7b9b707@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 01.04.2020 14:16, Julien Grall wrote:
> Hi Jan,
> 
> On 01/04/2020 13:07, Jan Beulich wrote:
>> On 01.04.2020 14:00, Julien Grall wrote:
>>> On 27/03/2020 18:50, Paul Durrant wrote:
>>>> +    if ( (exact ?
>>>> +          (dst_len != c->desc.length) : (dst_len < c->desc.length)) ||
>>>
>>> Using ternary in if is really confusing. How about:
>>>
>>> dst_len < c->desc.length || (exact && dst_len != c->desc.length) ||
>>>
>>> I understand that there would be two check for the exact case but I think it is better than a ternary.
>>
>> I'm of the opposite opinion, and hence with Paul. While the alternative
>> you suggest is still reasonable because of the special case here, I
>> find it confusing / more difficult to read / follow
>>
>>      if ( (a && b) || (!a && c) )
>>
>> (and I've seen quite a few instances of such over time) instead of
>>
>>      if ( a ? b : c )
> 
> If the ternary was the only condition and in a single line then it would be okay. However, the if is split over 3 lines...
> 
> The more stuff you put in an if, then more chance you are going to misread/make a mistake (you likely know what I am referring about here ;)).
> 
> So if you prefer the ternary, then we should at least write 2 ifs.

Since it's || that would be fine (albeit not preferred) by me. If
it was &&, would be be suggesting two nested if()-s (which
generally in reviews we ask to be avoided)? I see nothing wrong
with e.g.

      if ( (a ? b : c) &&
           (x ? y : z) )

Nevertheless I agree that very large conditionals often are more
difficult to read.

Jan

