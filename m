Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F474367FB7
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 13:43:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115310.219901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZXjN-0000Qj-Fz; Thu, 22 Apr 2021 11:42:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115310.219901; Thu, 22 Apr 2021 11:42:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZXjN-0000QK-Cl; Thu, 22 Apr 2021 11:42:49 +0000
Received: by outflank-mailman (input) for mailman id 115310;
 Thu, 22 Apr 2021 11:42:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uib8=JT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZXjL-0000QF-8z
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 11:42:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a872038b-2e75-4c90-8b3a-487a43aee638;
 Thu, 22 Apr 2021 11:42:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 582E1AD8D;
 Thu, 22 Apr 2021 11:42:45 +0000 (UTC)
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
X-Inumbo-ID: a872038b-2e75-4c90-8b3a-487a43aee638
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619091765; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jv8CDtHU9y7mrGsR1ty+Y53Z0UbXKZZl7uNWPAUhCVg=;
	b=VEG1PTJW4z4aF9crsvcgrCfodPRlH3Hulcu/Bb958CuOyNtJW/hOkChSlEO5i1OYBrkSsM
	dcY6XOQhl4LzNyF61Q1ce0wSym/zpeNlgkMCay0rwrib2I4d0lMfWvZb7tOT2MoorzIpDk
	kPz1boDDKLn84ixpOVd5AxyFTrAG2cE=
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
 <d877502d-9c18-6ff3-6e01-ee997c9f196a@suse.com>
 <YIFWUnQ6d4Pk7nf4@Air-de-Roger>
 <320d9aca-1f72-f357-d303-487a67f39655@suse.com>
 <YIFgCoyQaZefKZvi@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8a25c636-d20c-f45f-0901-314b22b70bfe@suse.com>
Date: Thu, 22 Apr 2021 13:42:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YIFgCoyQaZefKZvi@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 22.04.2021 13:37, Roger Pau Monné wrote:
> On Thu, Apr 22, 2021 at 01:05:23PM +0200, Jan Beulich wrote:
>> On 22.04.2021 12:56, Roger Pau Monné wrote:
>>> On Thu, Apr 22, 2021 at 12:48:36PM +0200, Jan Beulich wrote:
>>>> On 22.04.2021 12:34, Roger Pau Monné wrote:
>>>>> On Thu, Apr 22, 2021 at 11:58:45AM +0200, Jan Beulich wrote:
>>>>>> On 22.04.2021 11:42, Roger Pau Monné wrote:
>>>>>>> On Wed, Apr 14, 2021 at 03:49:02PM +0200, Jan Beulich wrote:
>>>>>>>> On 13.04.2021 16:01, Roger Pau Monne wrote:
>>>>>>>>> @@ -944,3 +945,130 @@ bool xc_cpu_policy_is_compatible(xc_interface *xch, const xc_cpu_policy_t host,
>>>>>>>>>  
>>>>>>>>>      return false;
>>>>>>>>>  }
>>>>>>>>> +
>>>>>>>>> +static uint64_t level_msr(unsigned int index, uint64_t val1, uint64_t val2)
>>>>>>>>> +{
>>>>>>>>> +    uint64_t val = val1 & val2;;
>>>>>>>>
>>>>>>>> For arbitrary MSRs this isn't going to do any good. If only very
>>>>>>>> specific MSRs are assumed to make it here, I think this wants
>>>>>>>> commenting on.
>>>>>>>
>>>>>>> I've added: "MSRs passed to level_msr are expected to be bitmaps of
>>>>>>> features"
>>>>>>
>>>>>> How does such a comment help? I.e. how does the caller tell which MSRs
>>>>>> to pass here and which to deal with anyother way?
>>>>>
>>>>> All MSRs should be passed to level_msr, but it's handling logic would
>>>>> need to be expanded to support MSRs that are not feature bitmaps.
>>>>>
>>>>> It might be best to restore the previous switch and handle each MSR
>>>>> specifically?
>>>>
>>>> I think so, yes. We need to be very careful with what a possible
>>>> default case does there, though.
>>>
>>> Maybe it would be better to handle level_msr in a way similar to
>>> level_leaf: return true/false to notice whether the MSR should be
>>> added to the resulting compatible policy?
>>>
>>> And then make the default case in level_msr just return false in order
>>> to prevent adding MSRs not properly leveled to the policy?
>>
>> I'm afraid I'm not clear about the implications. What again is the
>> (planned?) final effect of an MSR not getting added there?
> 
> Adding the MSR with a 0 value will zero out any previous value on the
> 'out' policy, while not adding it would leave the previous value
> there given the current code in xc_cpu_policy_calc_compatible added by
> this patch.
> 
> I would expect callers of xc_cpu_policy_calc_compatible to pass a
> zeroed 'out' policy, so I think the end result should be the same.

But we're not talking about actual MSR values here, as this is all
about policy. So in the end we'll have to see how things need to
be once we have the first non-feature-flag-like entries there. It
feels as if simply zeroing can't be generally the right thing in
such a case. It may e.g. be that min() is wanted instead.

Jan

