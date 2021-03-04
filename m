Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0A232D146
	for <lists+xen-devel@lfdr.de>; Thu,  4 Mar 2021 11:59:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93160.175868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHlgp-0000RE-5O; Thu, 04 Mar 2021 10:58:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93160.175868; Thu, 04 Mar 2021 10:58:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHlgo-0000QV-UR; Thu, 04 Mar 2021 10:58:42 +0000
Received: by outflank-mailman (input) for mailman id 93160;
 Thu, 04 Mar 2021 10:58:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ecIH=IC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lHlgn-0000Ph-UY
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 10:58:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 910c1d67-2e59-4f61-a71d-223a7a070051;
 Thu, 04 Mar 2021 10:58:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8A70AAAC5;
 Thu,  4 Mar 2021 10:58:39 +0000 (UTC)
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
X-Inumbo-ID: 910c1d67-2e59-4f61-a71d-223a7a070051
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614855519; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I5w785pZDJPZh6Oa1/lqNKxccSspHQkiAPaH+D6nh4U=;
	b=Zt1DTCMpLYBqYj+d9cmRJgoZZ+ERGZphYeE4LWSBCoJI4MzM1X11Z993inyNFzoXa/z2mG
	MM8oKfu1SbOiOcB2s77Eud0ZH6GrSiNeWFb4gZ2qZ2J5QnKam2ul53BmCrpXqE6Z7FY6pQ
	rlG2oN7GoItTVl0oxd5FRArZTlNXA5U=
Subject: Re: [PATCH RFC for-4.15] x86/msr: introduce an option for legacy MSR
 behavior selection
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>
References: <20210301162357.76527-1-roger.pau@citrix.com>
 <bfd185bf-489f-d858-c459-7630cbe7b462@suse.com>
 <YD5TBSwZWzjlwGxD@Air-de-Roger>
 <62be2084-e5fa-e439-8426-6d129a10c379@suse.com>
 <YD+teWWbeu0XDhqm@Air-de-Roger>
 <e84e84f6-8bc3-6a62-53f7-bf309fafa436@suse.com>
 <YECw+LsG17x8Jxev@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7e9ac991-f575-aa92-5fd8-33c8193cad67@suse.com>
Date: Thu, 4 Mar 2021 11:58:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YECw+LsG17x8Jxev@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 04.03.2021 11:05, Roger Pau Monné wrote:
> On Thu, Mar 04, 2021 at 09:48:25AM +0100, Jan Beulich wrote:
>> On 03.03.2021 16:38, Roger Pau Monné wrote:
>>> It also raises the question whether we will allow any more exceptions
>>> to the MSR policy, like we did for Windows and OpenBSD in:
>>>
>>> http://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=ca88a43e660c75796656a544e54a648c60d26ef0
>>> http://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=4175fd3ccd17face664036fa98e9329aa317f7b6
>>>
>>> Or if we are just going to require those guests to enable the legacy
>>> MSR handling instead.
>>
>> It is my understanding that Andrew's view is that adding such special
>> cases is the only acceptable thing. As voiced before I don't share
>> this view, as it means we're going to be entirely reactive to people
>> reporting issues, when I think we should be pro-active as far as is
>> reasonable. Independent of any pro-active measures there'll still be
>> enough reasons for reactive changes - for example I assume Linux
>> would now issue the log message from
>>
>> 	if (cpu_has(c, X86_FEATURE_CONSTANT_TSC)) {
>>
>> 		if (c->x86 > 0x10 ||
>> 		    (c->x86 == 0x10 && c->x86_model >= 0x2)) {
>> 			u64 val;
>>
>> 			rdmsrl(MSR_K7_HWCR, val);
>> 			if (!(val & BIT(24)))
>> 				pr_warn(FW_BUG "TSC doesn't count with P0 frequency!\n");
>> 		}
>> 	}
>>
>> since we surface a zero value right now (but I didn't verify this in
>> practice yet).
> 
> I think we inject a #GP to the guest if it tries to access
> MSR_K7_HWCR? As I don't see this MSR handled explicitly in
> svm_msr_read_intercept. So Linux would complain from the unchecked MSR
> access and the MSR value not having the bit set.

Right - my description was of the behavior with my workaround
already in place.

> This one seems like a fine candidate to implement in
> svm_msr_read_intercept, because Xen needs to return a specific value
> for this MSR.
> 
> Regarding the global approach to fixing the fallout from the MSR
> policy change, I don't see why we couldn't do a mix between pro-active
> and reactive.
> 
> I think we must have an option to fallback to something similar to the
> old policy for HVM guests so that users have a way to get their guests
> running after an update without requiring a code change.
> 
> That doesn't mean we can't reactively add the missing MSRs as we go
> discovering them. I would even print a warning when using such
> fallback legacy MSR handling option that you need to report the issue
> to xen-devel because the option might be removed in future releases.
> 
> Does the above seem like a sensible plan?

I think so, yes. I wonder what Andrew thinks, though.

Jan

