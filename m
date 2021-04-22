Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A9E367F3B
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 13:05:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115288.219859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZX9C-0004yT-Th; Thu, 22 Apr 2021 11:05:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115288.219859; Thu, 22 Apr 2021 11:05:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZX9C-0004y4-Qc; Thu, 22 Apr 2021 11:05:26 +0000
Received: by outflank-mailman (input) for mailman id 115288;
 Thu, 22 Apr 2021 11:05:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uib8=JT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZX9B-0004xz-D2
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 11:05:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3f667938-496e-4ad5-8c4d-dac2873f9c81;
 Thu, 22 Apr 2021 11:05:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B5B64AD8D;
 Thu, 22 Apr 2021 11:05:23 +0000 (UTC)
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
X-Inumbo-ID: 3f667938-496e-4ad5-8c4d-dac2873f9c81
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619089523; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kUYTcQUp0/mJCLYPG6gLPeNLdSxlpqqTB7glypM/QhA=;
	b=qvqgXQubzLvTMwLVWUMrn9luStIPYCzphfFC5RlCJM/H38wM4wRhIj3VZ0qZWvExS6MZz7
	QwzHVeXtHe97lJqQ4pAspy2tYZ4TW9K+Sqd26rSOQIk/uxIQOk19bPPfezvtAA/OhBVaUe
	tlvpIL5edVUa9l00tB3OXDWYd+iw9tw=
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <320d9aca-1f72-f357-d303-487a67f39655@suse.com>
Date: Thu, 22 Apr 2021 13:05:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YIFWUnQ6d4Pk7nf4@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 22.04.2021 12:56, Roger Pau Monné wrote:
> On Thu, Apr 22, 2021 at 12:48:36PM +0200, Jan Beulich wrote:
>> On 22.04.2021 12:34, Roger Pau Monné wrote:
>>> On Thu, Apr 22, 2021 at 11:58:45AM +0200, Jan Beulich wrote:
>>>> On 22.04.2021 11:42, Roger Pau Monné wrote:
>>>>> On Wed, Apr 14, 2021 at 03:49:02PM +0200, Jan Beulich wrote:
>>>>>> On 13.04.2021 16:01, Roger Pau Monne wrote:
>>>>>>> @@ -944,3 +945,130 @@ bool xc_cpu_policy_is_compatible(xc_interface *xch, const xc_cpu_policy_t host,
>>>>>>>  
>>>>>>>      return false;
>>>>>>>  }
>>>>>>> +
>>>>>>> +static uint64_t level_msr(unsigned int index, uint64_t val1, uint64_t val2)
>>>>>>> +{
>>>>>>> +    uint64_t val = val1 & val2;;
>>>>>>
>>>>>> For arbitrary MSRs this isn't going to do any good. If only very
>>>>>> specific MSRs are assumed to make it here, I think this wants
>>>>>> commenting on.
>>>>>
>>>>> I've added: "MSRs passed to level_msr are expected to be bitmaps of
>>>>> features"
>>>>
>>>> How does such a comment help? I.e. how does the caller tell which MSRs
>>>> to pass here and which to deal with anyother way?
>>>
>>> All MSRs should be passed to level_msr, but it's handling logic would
>>> need to be expanded to support MSRs that are not feature bitmaps.
>>>
>>> It might be best to restore the previous switch and handle each MSR
>>> specifically?
>>
>> I think so, yes. We need to be very careful with what a possible
>> default case does there, though.
> 
> Maybe it would be better to handle level_msr in a way similar to
> level_leaf: return true/false to notice whether the MSR should be
> added to the resulting compatible policy?
> 
> And then make the default case in level_msr just return false in order
> to prevent adding MSRs not properly leveled to the policy?

I'm afraid I'm not clear about the implications. What again is the
(planned?) final effect of an MSR not getting added there?

Jan

