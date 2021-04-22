Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C3D367EFF
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 12:49:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115271.219823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZWsx-0002nS-Ur; Thu, 22 Apr 2021 10:48:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115271.219823; Thu, 22 Apr 2021 10:48:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZWsx-0002n3-Rj; Thu, 22 Apr 2021 10:48:39 +0000
Received: by outflank-mailman (input) for mailman id 115271;
 Thu, 22 Apr 2021 10:48:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uib8=JT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZWsw-0002my-Py
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 10:48:38 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7a221d9f-7979-425b-b972-762f37d95ec1;
 Thu, 22 Apr 2021 10:48:37 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C11F8B124;
 Thu, 22 Apr 2021 10:48:36 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 7a221d9f-7979-425b-b972-762f37d95ec1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619088516; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wfj3Wq/ZwvGrwAxOSCpJx8Q++ljsC/k1HNHxwv8cBvM=;
	b=j2r3vMNO21YgTXsVOEbMzNs0SzJ1LjCEBdS28oPOAWRqXnpdeGWglwrfqQ+BsQuscfwDAT
	uoLPT0DI6tucj0O4QsSU62gWbfYurgkbNJGYe1A0ft39Kxuum13TSQlEyy0+Rcmks6pSJ5
	YXveglZfIPBXaRaORGEbV6sY9vPT8rg=
Subject: Re: [PATCH v2 15/21] libs/guest: obtain a compatible cpu policy from
 two input ones
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20210413140140.73690-1-roger.pau@citrix.com>
 <20210413140140.73690-16-roger.pau@citrix.com>
 <391b56d0-bb4d-8d3c-231c-e2e3ad7e2f42@suse.com>
 <YIFFBEhPYSYQhycf@Air-de-Roger>
 <c692e77f-1a9a-ea1d-e029-2a8f62ee0e35@suse.com>
 <YIFRQu/CLEId2uMi@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d877502d-9c18-6ff3-6e01-ee997c9f196a@suse.com>
Date: Thu, 22 Apr 2021 12:48:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YIFRQu/CLEId2uMi@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 22.04.2021 12:34, Roger Pau Monné wrote:
> On Thu, Apr 22, 2021 at 11:58:45AM +0200, Jan Beulich wrote:
>> On 22.04.2021 11:42, Roger Pau Monné wrote:
>>> On Wed, Apr 14, 2021 at 03:49:02PM +0200, Jan Beulich wrote:
>>>> On 13.04.2021 16:01, Roger Pau Monne wrote:
>>>>> @@ -944,3 +945,130 @@ bool xc_cpu_policy_is_compatible(xc_interface *xch, const xc_cpu_policy_t host,
>>>>>  
>>>>>      return false;
>>>>>  }
>>>>> +
>>>>> +static uint64_t level_msr(unsigned int index, uint64_t val1, uint64_t val2)
>>>>> +{
>>>>> +    uint64_t val = val1 & val2;;
>>>>
>>>> For arbitrary MSRs this isn't going to do any good. If only very
>>>> specific MSRs are assumed to make it here, I think this wants
>>>> commenting on.
>>>
>>> I've added: "MSRs passed to level_msr are expected to be bitmaps of
>>> features"
>>
>> How does such a comment help? I.e. how does the caller tell which MSRs
>> to pass here and which to deal with anyother way?
> 
> All MSRs should be passed to level_msr, but it's handling logic would
> need to be expanded to support MSRs that are not feature bitmaps.
> 
> It might be best to restore the previous switch and handle each MSR
> specifically?

I think so, yes. We need to be very careful with what a possible
default case does there, though.

>>>>> +                       xen_cpuid_leaf_t *out)
>>>>> +{
>>>>> +    *out = (xen_cpuid_leaf_t){ };
>>>>> +
>>>>> +    switch ( l1->leaf )
>>>>> +    {
>>>>> +    case 0x1:
>>>>> +    case 0x80000001:
>>>>> +        out->c = l1->c & l2->c;
>>>>> +        out->d = l1->d & l2->d;
>>>>> +        return true;
>>>>> +
>>>>> +    case 0xd:
>>>>> +        if ( l1->subleaf != 1 )
>>>>> +            break;
>>>>> +        out->a = l1->a & l2->a;
>>>>> +        return true;
>>>>
>>>> Could you explain your thinking behind this (a code comment would
>>>> likely help)? You effectively discard everything except subleaf 1
>>>> by returning false in that case, don't you?
>>>
>>> Yes, the intent is to only level the features bitfield found in
>>> subleaf 1.
>>>
>>> I was planning for level_leaf so far in this series to deal with the
>>> feature leaves part of the featureset only. I guess you would also
>>> like to leverage other parts of the xstate leaf, like the max_size or
>>> the supported bits in xss_{low,high}?
>>
>> The latter is clearly one of the things to consider, yes (alongside
>> the respective bits in sub-leaf 0 for XCR0). Sub-leaves > 1 may also
>> need dealing with ECX. Yet then again some or all of this may need
>> handling elsewhere, not the least because of the unusual handling of
>> leaf 0xd in the hypervisor. What gets checked and/or adjusted where
>> needs to be settled upon, and then the different parts of code would
>> imo better cross-reference each other.
> 
> There's a comment in recalculate_xstate that mentions that Da1 leaf is
> the only piece of information preserved, and that everything else is
> derived from feature state. I don't think it makes sense to try to
> level anything apart from Da1 if it's going to be discarded by
> recalculate_xstate anyway?
> 
> I can add a comment here regarding why only Da1 is taken into account
> for leveling so far.

Yes, this would help. Thanks.

Jan

