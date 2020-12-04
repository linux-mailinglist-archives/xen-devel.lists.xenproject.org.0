Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A802CEAEC
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 10:30:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44276.79375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl7Pg-0003ey-Cp; Fri, 04 Dec 2020 09:30:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44276.79375; Fri, 04 Dec 2020 09:30:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl7Pg-0003cr-87; Fri, 04 Dec 2020 09:30:04 +0000
Received: by outflank-mailman (input) for mailman id 44276;
 Fri, 04 Dec 2020 09:30:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kl7Pe-0003RM-UI
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 09:30:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kl7Pd-00058p-UG; Fri, 04 Dec 2020 09:30:01 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kl7Pd-00023o-NO; Fri, 04 Dec 2020 09:30:01 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=Pg2ajvPOv+TopAudDD1Tf0w/hz1nlX0P6LwqAjlW1Ng=; b=d+QMPl6syT1//l2wjZDHRw5apZ
	2m4H5DSxEJ6LflcTySRxG4TyTO4mwicQv1ER0dphy+OyBWl6tPDGVJbfcW2kgh3qbNhrRfY1k36y4
	LaTCPJiw1uSW1NPmhaVMbWgEytw853xJ0gEJkk6SirXSd1BQw4BtFvn4++i9ubpQCwg4=;
Subject: Re: [PATCH 2/2] mm: split out mfn_t / gfn_t / pfn_t definitions and
 helpers
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Hongyan Xia <hx242@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <75484377-160c-a529-1cfc-96de86cfc550@suse.com>
 <fb4de786-7302-3336-dcb4-1a388bee34bc@suse.com>
 <9c240acd-f3ef-6775-eb4b-6e3b14251e51@xen.org>
 <320d042c-2e37-f5ef-ce2f-2d4c97901bae@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3ef55770-70c3-f3d6-371b-79eb7a286466@xen.org>
Date: Fri, 4 Dec 2020 09:29:59 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <320d042c-2e37-f5ef-ce2f-2d4c97901bae@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 03/12/2020 09:39, Jan Beulich wrote:
> On 02.12.2020 18:35, Julien Grall wrote:
>> On 02/12/2020 14:50, Jan Beulich wrote:
>>> xen/mm.h has heavy dependencies, while in a number of cases only these
>>> type definitions are needed. This separation then also allows pulling in
>>> these definitions when including xen/mm.h would cause cyclic
>>> dependencies.
>>>
>>> Replace xen/mm.h inclusion where possible in include/xen/. (In
>>> xen/iommu.h also take the opportunity and correct the few remaining
>>> sorting issues.)
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> --- a/xen/arch/x86/acpi/power.c
>>> +++ b/xen/arch/x86/acpi/power.c
>>> @@ -10,7 +10,6 @@
>>>     * Slimmed with Xen specific support.
>>>     */
>>>    
>>> -#include <asm/io.h>
>>
>> This seems to be unrelated of this work.
> 
> Well spotted, but the answer really is "yes and no". My first
> attempt at fixing build issues from this and similar asm/io.h
> inclusions was to remove such unnecessary ones. But this didn't
> work out - I had to fix the header instead. If you think this
> extra cleanup really does any harm here, I can drop it. But I'd
> prefer to keep it.

I am fine with keeping it here. Can you mention it in the commit message?

> 
>>> --- /dev/null
>>> +++ b/xen/include/xen/frame-num.h
>>
>> It would feel more natural to me if the file is named mm-types.h.
> 
> Indeed I was first meaning to use this name (not the least
> because I don't particularly like the one chosen, but I also
> couldn't think of a better one). However, then things like
> struct page_info would imo also belong there (more precisely in
> asm/mm-types.h to be included from here), which is specifically
> something I want to avoid. Yes, eventually we may (I'm inclined
> to even say "will") want such a header, but I still want to
> keep these even more fundamental types in a separate one.
> Otherwise we'll again end up with files including mm-types.h
> just because of needing e.g. gfn_t for a function declaration.
> (Note that the same isn't the case for struct page_info, which
> can simply be forward declared.)
Thanks for the explanation. AFAICT, this file will mostly contain 
typesafe for MM. So how about naming it to mm-typesafe.h? Or maybe 
mm-frame.h?

Cheers,

-- 
Julien Grall

