Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDDF248B15
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 18:07:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k848X-0005gS-9D; Tue, 18 Aug 2020 16:06:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RgDL=B4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k848W-0005gK-Cq
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 16:06:56 +0000
X-Inumbo-ID: 9177a386-b2ca-4a10-ae43-75d903c4d9a5
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9177a386-b2ca-4a10-ae43-75d903c4d9a5;
 Tue, 18 Aug 2020 16:06:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 098D6B61E;
 Tue, 18 Aug 2020 16:07:20 +0000 (UTC)
Subject: Re: [PATCH] xen/x86: irq: Avoid a TOCTOU race in
 pirq_spin_lock_irq_desc()
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200722165300.22655-1-julien@xen.org>
 <c9863243-0b5e-521f-80b8-bc5673f895a6@suse.com>
 <5bd56ef4-8bf5-3308-b7db-71e41ac45918@xen.org>
 <bb25c46f-0670-889e-db0b-3031291db640@citrix.com>
 <5a11fa4e-1d57-ad12-ef43-08ed9c5c79dd@xen.org>
 <ca67035b-437b-382f-c3eb-93327042b3d7@suse.com>
 <7b30d0d7-24d4-b38a-6b97-d6b450574b15@xen.org>
 <17176e45-abc9-8b90-50b7-50aacb0e19bf@suse.com>
 <09367b86-50ee-37c5-f0ec-74698f4f4e71@xen.org>
 <4b4a0691-a1ae-6493-fd6f-7bfa4ae80d67@suse.com>
 <676a32d9-c9cf-d436-d3d7-352e7605fa77@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4ebe8364-b08c-7bba-1045-131239840447@suse.com>
Date: Tue, 18 Aug 2020 18:06:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <676a32d9-c9cf-d436-d3d7-352e7605fa77@xen.org>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 18.08.2020 13:52, Julien Grall wrote:
> 
> 
> On 18/08/2020 12:27, Jan Beulich wrote:
>> On 18.08.2020 11:12, Julien Grall wrote:
>>>> As pointed
>>>> out before, ACCESS_ONCE() and {read,write}_atomic() serve slightly
>>>> different purposes, and so far it looks like all of us are lacking ideas
>>>> on how to construct something that catches all cases by one single approach.
>>>
>>> I am guessing you are referring to [1], right?
>>>
>>> If you read the documentation of READ_ONCE()/WRITE_ONCE(), they are meant to be atomic in some cases. The cases are exactly the same as {read, write}_atomic().
>>>
>>> I will ask the same thing as I asked to Roger. If Linux can rely on it, why can't we?
>>
>> That's not the way I'd like to see arguments go here: If Linux has
>> something suitable, I'm fine with us using it. But we ought to be
>> permitted to question whether what we inherit is indeed fit for
>> purpose, and afaict there is at least one gap to be filled. In no
>> case should we blindly pull in things from Linux and then assume
>> that simply by doing so all is well.
> 
> I don't think any of us here are compilers guru, so I would tend to rely on Linux memory work. After all their code received much more attention. But sure we can question everything they have been doing.
> 
> To me the expected semantics (/!\ I am not referring to the implementation) for all the helpers are the same. But you seem to disagree on that.
> 
> I read the thread again and I couldn't find any explanation how a developper could chose between ACCESS_ONCE() and {read, write}_atomic().
> 
> Can you outline how one would decide?

As long as both have weaknesses I'm afraid it's really a case-by-case
decision. If you're strictly after only the property that one has and
the other doesn't, the case is clear. In all other cases it'll need
weighing of the risks. No clear rules, I'm afraid.

Jan

