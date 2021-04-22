Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55061367E37
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 11:59:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115246.219772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZW6k-00067u-4U; Thu, 22 Apr 2021 09:58:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115246.219772; Thu, 22 Apr 2021 09:58:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZW6k-00067Y-12; Thu, 22 Apr 2021 09:58:50 +0000
Received: by outflank-mailman (input) for mailman id 115246;
 Thu, 22 Apr 2021 09:58:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uib8=JT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZW6i-00067T-2B
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 09:58:48 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 675d94a5-a6d5-4a49-b6c0-719c377d7008;
 Thu, 22 Apr 2021 09:58:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7B835AE38;
 Thu, 22 Apr 2021 09:58:45 +0000 (UTC)
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
X-Inumbo-ID: 675d94a5-a6d5-4a49-b6c0-719c377d7008
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619085525; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kCacLMyJBMMJtASnwzPw1A36wJNpFZSxWFe36yTJ6hI=;
	b=me6YaYybdYiHW5JR0zI8zcNRpksLNxCa+jXzlnASVKjcIYC+bluKwO9J1h8D76YKUJE9Ri
	S1Btt8Ietazr1luo5lpgU1XWccAVWM74t5y8aZxzza4pf9s43SSJ6SiXycxmgv7fgfKU6t
	nOKf2U3e5tRAkhqgZcagi/EKObioE/k=
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c692e77f-1a9a-ea1d-e029-2a8f62ee0e35@suse.com>
Date: Thu, 22 Apr 2021 11:58:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YIFFBEhPYSYQhycf@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 22.04.2021 11:42, Roger Pau Monné wrote:
> On Wed, Apr 14, 2021 at 03:49:02PM +0200, Jan Beulich wrote:
>> On 13.04.2021 16:01, Roger Pau Monne wrote:
>>> @@ -944,3 +945,130 @@ bool xc_cpu_policy_is_compatible(xc_interface *xch, const xc_cpu_policy_t host,
>>>  
>>>      return false;
>>>  }
>>> +
>>> +static uint64_t level_msr(unsigned int index, uint64_t val1, uint64_t val2)
>>> +{
>>> +    uint64_t val = val1 & val2;;
>>
>> For arbitrary MSRs this isn't going to do any good. If only very
>> specific MSRs are assumed to make it here, I think this wants
>> commenting on.
> 
> I've added: "MSRs passed to level_msr are expected to be bitmaps of
> features"

How does such a comment help? I.e. how does the caller tell which MSRs
to pass here and which to deal with anyother way?

>>> +                       xen_cpuid_leaf_t *out)
>>> +{
>>> +    *out = (xen_cpuid_leaf_t){ };
>>> +
>>> +    switch ( l1->leaf )
>>> +    {
>>> +    case 0x1:
>>> +    case 0x80000001:
>>> +        out->c = l1->c & l2->c;
>>> +        out->d = l1->d & l2->d;
>>> +        return true;
>>> +
>>> +    case 0xd:
>>> +        if ( l1->subleaf != 1 )
>>> +            break;
>>> +        out->a = l1->a & l2->a;
>>> +        return true;
>>
>> Could you explain your thinking behind this (a code comment would
>> likely help)? You effectively discard everything except subleaf 1
>> by returning false in that case, don't you?
> 
> Yes, the intent is to only level the features bitfield found in
> subleaf 1.
> 
> I was planning for level_leaf so far in this series to deal with the
> feature leaves part of the featureset only. I guess you would also
> like to leverage other parts of the xstate leaf, like the max_size or
> the supported bits in xss_{low,high}?

The latter is clearly one of the things to consider, yes (alongside
the respective bits in sub-leaf 0 for XCR0). Sub-leaves > 1 may also
need dealing with ECX. Yet then again some or all of this may need
handling elsewhere, not the least because of the unusual handling of
leaf 0xd in the hypervisor. What gets checked and/or adjusted where
needs to be settled upon, and then the different parts of code would
imo better cross-reference each other.

>>> +    case 0x7:
>>> +        switch ( l1->subleaf )
>>> +        {
>>> +        case 0:
>>> +            out->b = l1->b & l2->b;
>>> +            out->c = l1->c & l2->c;
>>> +            out->d = l1->d & l2->d;
>>> +            return true;
>>> +
>>> +        case 1:
>>> +            out->a = l1->a & l2->a;
>>> +            return true;
>>> +        }
>>> +        break;
>>
>> Can we perhaps assume all subleaves here are going to hold flags,
>> and hence and both sides together without regard to what subleaf
>> we're actually dealing with (subleaf 1 remaining special as to
> 
> I think you meant subleaf 0 EAX (the max subleaf value)?
> 
> subleaf 1 EAX is just a normal bitfield AFAIK.

Indeed I did.

Jan

>> EAX of course)? This would avoid having to remember to make yet
>> another mechanical change when enabling a new subleaf.
> 
> Sure, seems like a fine approach since leaf 7 will only contain
> feature bitmaps.

