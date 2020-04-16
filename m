Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2463B1AC588
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 16:22:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP5PC-0007EJ-Bk; Thu, 16 Apr 2020 14:22:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jP5PB-0007EE-EP
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 14:22:13 +0000
X-Inumbo-ID: a9e2b7bc-7fed-11ea-9e09-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a9e2b7bc-7fed-11ea-9e09-bc764e2007e4;
 Thu, 16 Apr 2020 14:22:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E5750AC37;
 Thu, 16 Apr 2020 14:22:10 +0000 (UTC)
Subject: Re: [XEN PATCH v4 14/18] xen,symbols: rework file symbols selection
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200331103102.1105674-1-anthony.perard@citrix.com>
 <20200331103102.1105674-15-anthony.perard@citrix.com>
 <e28fa2b6-89c9-8e87-eaf0-91a3d6f6a62f@suse.com>
 <20200416124400.GG4088@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <312e719f-2bae-cb29-a6dd-29ae0d976d95@suse.com>
Date: Thu, 16 Apr 2020 16:22:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200416124400.GG4088@perard.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16.04.2020 14:44, Anthony PERARD wrote:
> On Wed, Apr 08, 2020 at 02:54:35PM +0200, Jan Beulich wrote:
>> On 31.03.2020 12:30, Anthony PERARD wrote:
>>> We want to use the same rune to build mm/*/guest_*.o as the one use to
>>> build every other *.o object. The consequence it that file symbols that
>>> the program ./symbols prefer changes with CONFIG_ENFORCE_UNIQUE_SYMBOLS=y.
>>>
>>> (1) Currently we have those two file symbols:
>>>     guest_walk.c
>>>     guest_walk_2.o
>>> (2) with CONFIG_ENFORCE_UNIQUE_SYMBOLS used on guest_walk.c, we will have:
>>>     arch/x86/mm/guest_walk.c
>>>     guest_walk_2.o
>>>
>>> The order in which those symbols are present may be different.
>>>
>>> Currently, in case (1) ./symbols chooses the *.o symbol (object file
>>> name). But in case (2), may choose the *.c symbol (source file name with
>>> path component) if it is first
>>>
>>> We want to have ./symbols choose the object file name symbol in both
>>> cases.
>>
>> I guess the reason for wanting this is somehow connected to the
>> statement at the beginning of the description, but I can't seem
>> to be able to make the connection.
> 
> I'm not sure I can explain it better.
> 
> The "object file name" file symbol is used to distinguish between symbols
> from all mm/*/guest_* objects. The other file symbol present in those
> object is a "source file name without any path component symbol".
> 
> But building those objects with the same rune as any other objects, and
> having CONFIG_ENFORCE_UNIQUE_SYMBOLS=y, changes the file symbols present
> in the resulting object. We still have the "object file name" symbol,
> but now we also have "source file name with path components" symbol.
> Unfortunately, all mm/*/guest_*.o in one directory are built from the
> same source file, and thus have the same "source file name" symbol, but
> have different "object file name" symbol. We still want to be able to
> distinguish between guest_*.o in one dir, and the only way for that is
> to use the "object file name" symbol.

So where's the difference from how things work right now? The "same rune"
aspect doesn't really change - right now we also build with effectively
the same logic, just that -DGUEST_PAGING_LEVELS=... gets added. I guess
it might help if you showed (for one particular example) how the set of
file symbols changes from what we have now (with and without
CONFIG_ENFORCE_UNIQUE_SYMBOLS=y) to what there would be with your changes
to the symbols utility to what there will be with those changes.

>>> So this patch changes that ./symbols prefer the "object file
>>> name" symbol over the "source file name with path component" symbols.
>>>
>>> The new intended order of preference is:
>>>     - first object file name symbol
>>>     - first source file name with path components symbol
>>>     - last source file name without any path component symbol
>>
>> Isn't this going to lead to ambiguities again when
>> CONFIG_ENFORCE_UNIQUE_SYMBOLS? Several object files (in different
>> dirs) are named the same, after all. Static symbols with the same
>> name in such objects would hence resolve to the same kallsyms
>> name.
> 
> "object file name" symbol are only present in mm/*/guest_*.o objects,
> they all have different basenames. There is no ambiguity here.

At least not right now, I see. Could you make this aspect more explicit
by adding something like "(present only in object files produced from
multiply compiled sources)" to the first bullet point?

Jan

