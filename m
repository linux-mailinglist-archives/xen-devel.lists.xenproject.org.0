Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 483B11B090B
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 14:15:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQVKE-00014X-4o; Mon, 20 Apr 2020 12:14:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=z/8R=6E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jQVKC-00014Q-HY
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 12:14:56 +0000
X-Inumbo-ID: 8b91a62c-8300-11ea-9055-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8b91a62c-8300-11ea-9055-12813bfff9fa;
 Mon, 20 Apr 2020 12:14:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BBA0CABAD;
 Mon, 20 Apr 2020 12:14:53 +0000 (UTC)
Subject: Re: [PATCH 05/17] xen/x86: Remove the non-typesafe version of
 pagetable_* helpers
To: Julien Grall <julien@xen.org>
References: <20200322161418.31606-1-julien@xen.org>
 <20200322161418.31606-6-julien@xen.org>
 <b0d29ded-f0e8-013b-de43-22788cd8f599@suse.com>
 <2be87441-05a6-6b58-23e3-da467230ffe7@xen.org>
 <cf983d3e-125a-621a-f81d-2f9955ec86eb@suse.com>
 <f72f5c31-c437-549a-9d8b-8b836caf699b@xen.org>
 <6af445d8-636f-a19e-ac53-9c66ae9f61c5@suse.com>
 <0bb49716-6b1c-0beb-01c5-4c0d220ca011@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e9b5d086-3d95-68cc-a8d3-7c3309dae464@suse.com>
Date: Mon, 20 Apr 2020 14:14:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <0bb49716-6b1c-0beb-01c5-4c0d220ca011@xen.org>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20.04.2020 12:10, Julien Grall wrote:
> Hi,
> 
> On 20/04/2020 10:16, Jan Beulich wrote:
>> On 18.04.2020 12:23, Julien Grall wrote:
>>> On 30/03/2020 08:52, Jan Beulich wrote:
>>>> On 28.03.2020 11:52, Julien Grall wrote:
>>>>> On 26/03/2020 15:39, Jan Beulich wrote:
>>>>>> On 22.03.2020 17:14, julien@xen.org wrote:
>>>>>>> @@ -3116,24 +3116,24 @@ int vcpu_destroy_pagetables(struct vcpu *v)
>>>>>>>           /* Free that page if non-zero */
>>>>>>>         do {
>>>>>>> -        if ( mfn )
>>>>>>> +        if ( !mfn_eq(mfn, _mfn(0)) )
>>>>>>
>>>>>> I admit I'm not fully certain either, but at the first glance
>>>>>>
>>>>>>            if ( mfn_x(mfn) )
>>>>>>
>>>>>> would seem more in line with the original code to me (and then
>>>>>> also elsewhere).
>>>>>
>>>>> It is doing *exactly* the same things. The whole point of typesafe
>>>>> is to use typesafe helper not open-coding test everywhere.
>>>>>
>>>>> It is also easier to spot any use of MFN 0 within the code as you
>>>>> know could grep "_mfn(0)".
>>>>>
>>>>> Therefore I will insist to the code as-is.
>>>>
>>>> What I insit on is that readability of the result of such changes be
>>>> also kept in mind. The mfn_eq() construct is (I think) clearly less
>>>> easy to read and recognize than the simpler alternative suggested.
>>>
>>> If mfn_eq() is less clear, then where do you draw the line when the
>>> macro should or not be used?
>>
>> I'm afraid there may not be a clear line to draw until everything
>> got converted.
> 
> I am sorry but this doesn't add up. Here you say that we can't have
> a clear line to draw until everything is converted but...
> 
>> I do seem to recall though that, perhaps in a
>> different context, Andrew recently agreed with my view here (Andrew,
>> please correct me if I'm wrong). It being a fuzzy thing, I guess
>> maintainers get to judge ...
> 
> ... here you say the maintainers get to decide when to use mfn_eq()
> (or other typesafe construction). So basically, we would never be
> able to fully convert the code and therefore never draw a line.

Why? Eventually both sides of an mfn_eq() will be of type mfn_t. And
in the specific case hand even with my alternative suggestion no
further change would  be needed down the road. Type safety is for
things like function argument passing and assignments and alike. A
leaf expression like "if ( mfn_x() )" is not type-unsafe in any way.

Jan

