Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D804F3228B5
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 11:16:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88691.166871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEUjA-000267-EH; Tue, 23 Feb 2021 10:15:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88691.166871; Tue, 23 Feb 2021 10:15:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEUjA-00025i-Ah; Tue, 23 Feb 2021 10:15:36 +0000
Received: by outflank-mailman (input) for mailman id 88691;
 Tue, 23 Feb 2021 10:15:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lEUj8-00025d-9d
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 10:15:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fb1f2c5c-0bc4-4e6a-b7c5-035a6ce2059e;
 Tue, 23 Feb 2021 10:15:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E6B75AC1D;
 Tue, 23 Feb 2021 10:15:31 +0000 (UTC)
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
X-Inumbo-ID: fb1f2c5c-0bc4-4e6a-b7c5-035a6ce2059e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614075332; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=He4BN6kF4wmmsZgRktxBgPSAErM07xavK09Fd+mw2/Y=;
	b=FevqeJBX+sAkqDcedBuXKqLtcWzMz6wOZk7Ro2zHipE+MUOR7ZD+Q8975uFkYmNVqlD3IS
	dlYz8e3BJaSUZrogv4sJ2nR8yVEQr8faOVvfsS9sGgfSnrkNJvFo3a3iZPFHqqsgKNV3Sg
	ycMNTeecNcxOcmsXRmnfcB0RSWMRgCw=
Subject: Re: [PATCH v2 2/4] x86: Introduce MSR_UNHANDLED
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 andrew.cooper3@citrix.com
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, iwj@xenproject.org, wl@xen.org,
 anthony.perard@citrix.com, jun.nakajima@intel.com, kevin.tian@intel.com
References: <1611182952-9941-1-git-send-email-boris.ostrovsky@oracle.com>
 <1611182952-9941-3-git-send-email-boris.ostrovsky@oracle.com>
 <YC5GrgqwsR/eBwpy@Air-de-Roger>
 <4e585daa-f255-fbff-d1cf-38ef49f146f5@oracle.com>
 <YDOQvU1h8zpOv5PH@Air-de-Roger>
 <ce2ef7a3-0583-ffff-182a-0ab078f45b82@oracle.com>
 <307a4765-1c54-63fd-b3fb-ecb47ba3dbca@suse.com>
 <YDTMIW5vBe0IncVR@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2744f277-06fb-e49f-2023-0ec6175259dd@suse.com>
Date: Tue, 23 Feb 2021 11:15:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YDTMIW5vBe0IncVR@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 23.02.2021 10:34, Roger Pau Monné wrote:
> On Tue, Feb 23, 2021 at 08:57:00AM +0100, Jan Beulich wrote:
>> On 22.02.2021 22:19, Boris Ostrovsky wrote:
>>>
>>> On 2/22/21 6:08 AM, Roger Pau Monné wrote:
>>>> On Fri, Feb 19, 2021 at 09:56:32AM -0500, Boris Ostrovsky wrote:
>>>>> On 2/18/21 5:51 AM, Roger Pau Monné wrote:
>>>>>> On Wed, Jan 20, 2021 at 05:49:10PM -0500, Boris Ostrovsky wrote:
>>>>>>> When toolstack updates MSR policy, this MSR offset (which is the last
>>>>>>> index in the hypervisor MSR range) is used to indicate hypervisor
>>>>>>> behavior when guest accesses an MSR which is not explicitly emulated.
>>>>>> It's kind of weird to use an MSR to store this. I assume this is done
>>>>>> for migration reasons?
>>>>>
>>>>> Not really. It just seemed to me that MSR policy is the logical place to do that. Because it *is* a policy of how to deal with such accesses, isn't it?
>>>> I agree that using the msr_policy seems like the most suitable place
>>>> to convey this information between the toolstack and Xen. I wonder if
>>>> it would be fine to have fields in msr_policy that don't directly
>>>> translate into an MSR value?
>>>
>>>
>>> We have xen_msr_entry_t.flags that we can use when passing policy array back and forth. Then we can ignore xen_msr_entry_t.idx for that entry (although in earlier version of this series Jan preferred to use idx and leave flags alone).
>>
>> Which, just to clarify, was not the least because of the flags
>> field being per-entry, i.e. per MSR, while here we want a global
>> indicator.
> 
> We could exploit a bit the xen_msr_entry_t structure and use it
> like:
> 
> typedef struct xen_msr_entry {
>     uint32_t idx;
> #define XEN_MSR_IGNORE (1u << 0)
>     uint32_t flags;
>     uint64_t val;
> } xen_msr_entry_t;
> 
> Then use the idx and val fields to signal the start and size of the
> range to ignore accesses to when XEN_MSR_IGNORE is set in the flags
> field?
> 
> xen_msr_entry_t = {
>     .idx = 0,
>     .val = 0xffffffff,
>     .flags = XEN_MSR_IGNORE,
> };
> 
> Would be equivalent to ignoring accesses to the whole MSR range.
> 
> This would allow selectively selecting which MSRs to ignore, while
> not wasting a MSR itself to convey the information?

Hmm, yes, the added flexibility would be nice from an abstract pov
(not sure how relevant it would be to Solaris'es issue). But my
dislike of using a flag which is meaningless in ordinary entries
remains, as was voiced against Boris'es original version.

Andrew - afaict you've been completely silent on this thread so
far. What's your view?

Jan

