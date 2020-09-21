Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5149D272586
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 15:29:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKLsR-0001og-0W; Mon, 21 Sep 2020 13:29:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Wak=C6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kKLsP-0001oZ-RR
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 13:29:05 +0000
X-Inumbo-ID: ee390fcf-4c79-4056-88e9-9ff3b7ef2663
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ee390fcf-4c79-4056-88e9-9ff3b7ef2663;
 Mon, 21 Sep 2020 13:29:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600694944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6rCAF5fbdX8TbGzoZ0O1dfPhCRh7PHT2s5joJiPPfGk=;
 b=pvmLZJXjLCHNq3gGilFBQr/ihTdNMIPiLtT4db7H0prZtTZ4tn/+YcuUzvYSMgP40TVa42
 P14QhcXf+eKGarbDd3gPJjlUPHVYO8URYUVciDN9vfBmyB+UOpVGbmkerWLa48/i1pGzsZ
 4wD57nmnLbwAFNbXA61VPNIbjyklIGk=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 397FBAD1E;
 Mon, 21 Sep 2020 13:29:40 +0000 (UTC)
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dfbe6c62-55f6-8d33-db25-031e36b758bc@suse.com>
Date: Mon, 21 Sep 2020 15:29:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <e01631d6-7e32-0923-e004-d6aefe6ffabb@gmail.com>
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

On 21.09.2020 14:47, Oleksandr wrote:
> On 21.09.20 15:31, Jan Beulich wrote:
>> On 21.09.2020 14:22, Oleksandr wrote:
>>> On 14.09.20 16:52, Jan Beulich wrote:
>>>> On 10.09.2020 22:21, Oleksandr Tyshchenko wrote:
>>>>> @@ -1215,8 +1233,7 @@ void hvm_destroy_all_ioreq_servers(struct domain *d)
>>>>>        struct hvm_ioreq_server *s;
>>>>>        unsigned int id;
>>>>>    
>>>>> -    if ( !relocate_portio_handler(d, 0xcf8, 0xcf8, 4) )
>>>>> -        return;
>>>>> +    arch_hvm_ioreq_destroy(d);
>>>> So the call to relocate_portio_handler() simply goes away. No
>>>> replacement, no explanation?
>>> As I understand from the review comment on that for the RFC patch, there
>>> is no
>>> a lot of point of keeping this. Indeed, looking at the code I got the
>>> same opinion.
>>> I should have added an explanation in the commit description at least.
>>> Or shall I return the call back?
>> If there's a reason to drop it (which I can't see, but I also
>> don't recall seeing the discussion you're mentioning), then doing
>> so should be a separate patch with suitable reasoning. In the
>> patch here you definitely should only transform what's already
>> there.
> Sounds reasonable. Please see the comment below 
> relocate_portio_handler() here:
> https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg78512.html
> 
> However, I might interpret the request incorrectly.

I'm afraid you do: The way you've coded it the function was a no-op.
But that's because you broke the caller by not bailing from
hvm_destroy_all_ioreq_servers() if relocate_portio_handler() returned
false. IOW you did assume that moving the "return" statement into an
inline function would have an effect on its caller(s). For questions
like this one it also often helps to look at the commit introducing
the construct in question (b3344bb1cae0 in this case): Chances are
that the description helps, albeit I agree there are many cases
(particularly the farther you get into distant past) where it isn't
of much help.

Jan

