Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 616FD2CEB58
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 10:51:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44299.79413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl7kD-0006M5-RW; Fri, 04 Dec 2020 09:51:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44299.79413; Fri, 04 Dec 2020 09:51:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl7kD-0006Li-O5; Fri, 04 Dec 2020 09:51:17 +0000
Received: by outflank-mailman (input) for mailman id 44299;
 Fri, 04 Dec 2020 09:51:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c9tS=FI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kl7kB-0006Ld-Qu
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 09:51:15 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 331bd1be-58ec-468a-af75-7c037ba931ff;
 Fri, 04 Dec 2020 09:51:14 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A3F7EACB5;
 Fri,  4 Dec 2020 09:51:13 +0000 (UTC)
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
X-Inumbo-ID: 331bd1be-58ec-468a-af75-7c037ba931ff
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607075473; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qbenaPDgJgTp3fFbIP/WDKY+cqxPgsUiAs4OIWpmYTg=;
	b=G3OsXEJ56W9cnoEU8bswQ0U83AhoAaO0SEVnjfXKQGGdh7uToSEVh3PY+S3p/43YNU3P35
	DdyAxV2dGbvpUpnLb3i41gvK+Z10OkRCKmkOuZYn1TiA6yhz8T5oXdeMfBKw0NSouBp85U
	Ds/BWQ0cX3VL1N8pm0yan3eIzAUsCPM=
Subject: Re: [PATCH 2/2] mm: split out mfn_t / gfn_t / pfn_t definitions and
 helpers
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Hongyan Xia <hx242@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <75484377-160c-a529-1cfc-96de86cfc550@suse.com>
 <fb4de786-7302-3336-dcb4-1a388bee34bc@suse.com>
 <9c240acd-f3ef-6775-eb4b-6e3b14251e51@xen.org>
 <320d042c-2e37-f5ef-ce2f-2d4c97901bae@suse.com>
 <3ef55770-70c3-f3d6-371b-79eb7a286466@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ece618f3-26f2-0315-a949-b23023900f06@suse.com>
Date: Fri, 4 Dec 2020 10:51:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <3ef55770-70c3-f3d6-371b-79eb7a286466@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04.12.2020 10:29, Julien Grall wrote:
> On 03/12/2020 09:39, Jan Beulich wrote:
>> On 02.12.2020 18:35, Julien Grall wrote:
>>> On 02/12/2020 14:50, Jan Beulich wrote:
>>>> xen/mm.h has heavy dependencies, while in a number of cases only these
>>>> type definitions are needed. This separation then also allows pulling in
>>>> these definitions when including xen/mm.h would cause cyclic
>>>> dependencies.
>>>>
>>>> Replace xen/mm.h inclusion where possible in include/xen/. (In
>>>> xen/iommu.h also take the opportunity and correct the few remaining
>>>> sorting issues.)
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> --- a/xen/arch/x86/acpi/power.c
>>>> +++ b/xen/arch/x86/acpi/power.c
>>>> @@ -10,7 +10,6 @@
>>>>     * Slimmed with Xen specific support.
>>>>     */
>>>>    
>>>> -#include <asm/io.h>
>>>
>>> This seems to be unrelated of this work.
>>
>> Well spotted, but the answer really is "yes and no". My first
>> attempt at fixing build issues from this and similar asm/io.h
>> inclusions was to remove such unnecessary ones. But this didn't
>> work out - I had to fix the header instead. If you think this
>> extra cleanup really does any harm here, I can drop it. But I'd
>> prefer to keep it.
> 
> I am fine with keeping it here. Can you mention it in the commit message?

I've added a paragraph.

>>>> --- /dev/null
>>>> +++ b/xen/include/xen/frame-num.h
>>>
>>> It would feel more natural to me if the file is named mm-types.h.
>>
>> Indeed I was first meaning to use this name (not the least
>> because I don't particularly like the one chosen, but I also
>> couldn't think of a better one). However, then things like
>> struct page_info would imo also belong there (more precisely in
>> asm/mm-types.h to be included from here), which is specifically
>> something I want to avoid. Yes, eventually we may (I'm inclined
>> to even say "will") want such a header, but I still want to
>> keep these even more fundamental types in a separate one.
>> Otherwise we'll again end up with files including mm-types.h
>> just because of needing e.g. gfn_t for a function declaration.
>> (Note that the same isn't the case for struct page_info, which
>> can simply be forward declared.)
> Thanks for the explanation. AFAICT, this file will mostly contain 
> typesafe for MM. So how about naming it to mm-typesafe.h? Or maybe 
> mm-frame.h?

Hmm, yes, why not. I guess I'd slightly prefer the latter.

Jan

