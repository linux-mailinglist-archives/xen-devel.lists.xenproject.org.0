Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFA830A7F3
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 13:50:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79857.145540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Yed-0004pK-QI; Mon, 01 Feb 2021 12:50:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79857.145540; Mon, 01 Feb 2021 12:50:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Yed-0004oy-L0; Mon, 01 Feb 2021 12:50:07 +0000
Received: by outflank-mailman (input) for mailman id 79857;
 Mon, 01 Feb 2021 12:50:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l6Yeb-0004dt-TD
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 12:50:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0701a4c7-0ba4-4c56-a9e6-7ff453034b20;
 Mon, 01 Feb 2021 12:50:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 79872AB92;
 Mon,  1 Feb 2021 12:50:03 +0000 (UTC)
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
X-Inumbo-ID: 0701a4c7-0ba4-4c56-a9e6-7ff453034b20
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612183803; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9tYLAgKn1BFPh0ol2qf612xGo0jMgnl+1NkEFaocbWM=;
	b=ITDCeuVqLg7W/tumWZPDMw5oHaH8ploMK4RgUaRFAfNt6fIfJ78dXL6DsjIGTyoZfTTu/K
	aS+PEWtTAxZTz4OwVAVwA9mcjZBrdglErreem790oyC6hMqiGsPRZeBs5nJr9gUXjyzFMP
	0WC0urZaskRmWg6gQKCyqHSRwliLBWI=
Subject: Re: [PATCH v3] x86/mm: Short circuit damage from "fishy"
 ref/typecount failure
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210119094122.23713-1-andrew.cooper3@citrix.com>
 <20210119130254.27058-1-andrew.cooper3@citrix.com>
 <98f64276-ec5d-7242-f10f-126fe7ee1f7e@suse.com>
 <45f5d1f0-1a89-706f-f202-91ddb1d8b094@citrix.com>
 <dd59ad75-c0f1-4d14-a0b6-06dd9e095b36@suse.com>
 <0c279f99-e74e-ced0-4947-b9a104160671@citrix.com>
 <a2ea0bc0-3644-a2c1-c0b2-f3085b1aa0b5@suse.com>
 <a0456589-4626-fc51-d585-9159d6ea3010@citrix.com>
 <d0fc73c7-3dde-b303-dba0-7cf65e1ef0e8@suse.com>
 <6fb91ae1-4b91-f76a-1d38-1c528ab43a9c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <222ce537-b4fc-cf45-1bd0-0aaa3293d8ea@suse.com>
Date: Mon, 1 Feb 2021 13:50:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <6fb91ae1-4b91-f76a-1d38-1c528ab43a9c@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 29.01.2021 18:17, Andrew Cooper wrote:
> On 29/01/2021 16:31, Jan Beulich wrote:
>> On 29.01.2021 17:17, Andrew Cooper wrote:
>>> On 29/01/2021 11:29, Jan Beulich wrote:
>>>> On 25.01.2021 18:59, Andrew Cooper wrote:
>>>>> On 20/01/2021 08:06, Jan Beulich wrote:
>>>>>> Also, as far as "impossible" here goes - the constructs all
>>>>>> anyway exist only to deal with what we consider impossible.
>>>>>> The question therefore really is of almost exclusively
>>>>>> theoretical nature, and hence something like a counter
>>>>>> possibly overflowing imo needs to be accounted for as
>>>>>> theoretically possible, albeit impossible with today's
>>>>>> computers and realistic timing assumptions. If a counter
>>>>>> overflow occurred, it definitely wouldn't be because of a
>>>>>> bug in Xen, but because of abnormal behavior elsewhere.
>>>>>> Hence I remain unconvinced it is appropriate to deal with
>>>>>> the situation by BUG().
>>>>> I'm not sure how to be any clearer.
>>>>>
>>>>> I am literally not changing the current behaviour.  Xen *will* hit a
>>>>> BUG() if any of these domain_crash() paths are taken.
>>>>>
>>>>> If you do not believe me, then please go and actually check what happens
>>>>> when simulating a ref-acquisition failure.
>>>> So I've now also played the same game on the ioreq path (see
>>>> debugging patch below, and again with some non-"//temp"
>>>> changes actually improving overall behavior in that "impossible"
>>>> case). No BUG()s hit, no leaks (thanks to the extra changes),
>>>> no other anomalies observed.
>>>>
>>>> Hence I'm afraid it is now really up to you to point out the
>>>> specific BUG()s (and additional context as necessary) that you
>>>> either believe could be hit, or that you have observed being hit.
>>> The refcounting logic was taken verbatim from ioreq, with the only
>>> difference being an order greater than 0.  The logic is also identical
>>> to the vlapic logic.
>>>
>>> And the reason *why* it bugs is obvious - the cleanup logic
>>> unconditionally put()'s refs it never took to begin with, and hits
>>> underflow bugchecks.
>> In current staging, neither vmx_alloc_vlapic_mapping() nor
>> hvm_alloc_ioreq_mfn() put any refs they couldn't get. Hence
>> my failed attempt to repro your claimed misbehavior.
> 
> I think I've figured out what is going on.
> 
> They *look* as if they do, but the logic is deceptive.
> 
> We skip both puts in free_*() if the typeref failed, and rely on the
> fact that the frame(s) are *also* on the domheap list for
> relinquish_resources() to put the acquire ref.
> 
> Yet another bizzare recounting rule/behaviour which isn't written down.

But that's not the case - extra pages land on their own
list, which relinquish_resources() doesn't iterate. Hence
me saying we leak these pages on the domain_crash() paths,
and hence my repro attempt patches containing adjustments
to at least try to free those pages on those paths.

Jan

