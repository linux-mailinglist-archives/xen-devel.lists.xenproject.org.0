Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0462C272A13
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 17:29:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKNjr-0004jm-8x; Mon, 21 Sep 2020 15:28:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Wak=C6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kKNjq-0004jh-FO
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 15:28:22 +0000
X-Inumbo-ID: 912a7769-ba77-4d46-9a11-27ffc473c783
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 912a7769-ba77-4d46-9a11-27ffc473c783;
 Mon, 21 Sep 2020 15:28:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600702100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4T8RBS5c9j2QMIi9dK77Rmgh+bBKolIsvi/y0YCZie4=;
 b=tgMTLxQBPp/EHGjuROclrIM8CBlc3NCv2fkSPK0kQ17pS3c29a3LrT38zNoC3xoxUwGwRJ
 Vi6DNuqfuIyAftwxHMAKi39nhT/5OF/8mvZ5EECUxX4NiFdqh0HkmqQ97p4P468gxz8cdp
 qov/si9IsGJMBRkqzVWbGd+FujzolKI=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BC41EAD1B;
 Mon, 21 Sep 2020 15:28:56 +0000 (UTC)
Subject: Re: [PATCH V1 01/16] x86/ioreq: Prepare IOREQ feature for making it
 common
To: Oleksandr <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-2-git-send-email-olekstysh@gmail.com>
 <98420567-40a9-7297-d243-4af90f692bf9@suse.com>
 <123d8e2a-96c2-a97c-a0c0-a5dca4288a2b@gmail.com>
 <2dea0b83-5178-7768-eaab-ff4a8878eeb0@suse.com>
 <e01631d6-7e32-0923-e004-d6aefe6ffabb@gmail.com>
 <dfbe6c62-55f6-8d33-db25-031e36b758bc@suse.com>
 <ac068d84-24cb-af37-cb89-f36fdd785d07@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <341f6ef6-797f-0e7d-dd81-319eca06c9cc@suse.com>
Date: Mon, 21 Sep 2020 17:28:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <ac068d84-24cb-af37-cb89-f36fdd785d07@gmail.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 21.09.2020 16:43, Oleksandr wrote:
> On 21.09.20 16:29, Jan Beulich wrote:
>> On 21.09.2020 14:47, Oleksandr wrote:
>>> On 21.09.20 15:31, Jan Beulich wrote:
>>>> On 21.09.2020 14:22, Oleksandr wrote:
>>>>> On 14.09.20 16:52, Jan Beulich wrote:
>>>>>> On 10.09.2020 22:21, Oleksandr Tyshchenko wrote:
>>>>>>> @@ -1215,8 +1233,7 @@ void hvm_destroy_all_ioreq_servers(struct domain *d)
>>>>>>>         struct hvm_ioreq_server *s;
>>>>>>>         unsigned int id;
>>>>>>>     
>>>>>>> -    if ( !relocate_portio_handler(d, 0xcf8, 0xcf8, 4) )
>>>>>>> -        return;
>>>>>>> +    arch_hvm_ioreq_destroy(d);
>>>>>> So the call to relocate_portio_handler() simply goes away. No
>>>>>> replacement, no explanation?
>>>>> As I understand from the review comment on that for the RFC patch, there
>>>>> is no
>>>>> a lot of point of keeping this. Indeed, looking at the code I got the
>>>>> same opinion.
>>>>> I should have added an explanation in the commit description at least.
>>>>> Or shall I return the call back?
>>>> If there's a reason to drop it (which I can't see, but I also
>>>> don't recall seeing the discussion you're mentioning), then doing
>>>> so should be a separate patch with suitable reasoning. In the
>>>> patch here you definitely should only transform what's already
>>>> there.
>>> Sounds reasonable. Please see the comment below
>>> relocate_portio_handler() here:
>>> https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg78512.html
>>>
>>> However, I might interpret the request incorrectly.
>> I'm afraid you do: The way you've coded it the function was a no-op.
>> But that's because you broke the caller by not bailing from
>> hvm_destroy_all_ioreq_servers() if relocate_portio_handler() returned
>> false. IOW you did assume that moving the "return" statement into an
>> inline function would have an effect on its caller(s). For questions
>> like this one it also often helps to look at the commit introducing
>> the construct in question (b3344bb1cae0 in this case): Chances are
>> that the description helps, albeit I agree there are many cases
>> (particularly the farther you get into distant past) where it isn't
>> of much help.
> 
> 
> Hmm, now it's clear to me what I did wrong. By calling 
> relocate_portio_handler() here we don't really want to relocate 
> something, we just use it as a flag to indicate whether we need to 
> actually release IOREQ resources down the 
> hvm_destroy_all_ioreq_servers(). Thank you for the explanation, it 
> wasn't obvious to me at the beginning. But, now the question is how to 
> do it in a correct way and retain current behavior (to not break callers)?
> 
> I see two options here:
> 1. Place the check of relocate_portio_handler() in 
> arch_hvm_ioreq_destroy() and make the later returning bool.
>      The "common" hvm_destroy_all_ioreq_servers() will check for the 
> return value and bail out if false.
> 2. Don't use relocate_portio_handler(), instead introduce a flag into 
> struct hvm_domain's ioreq_server sub-structure.
> 
> 
> Personally I don't like much the option 1 and option 2 is a little bit 
> overhead.

Well, 1 is what matches current behavior, so I'd advocate for you
not changing the abstract model. Or else, again, change the abstract
model in a separate prereq patch.

Jan

