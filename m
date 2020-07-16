Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 478AC2225BF
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jul 2020 16:34:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jw4y2-0004Jw-33; Thu, 16 Jul 2020 14:34:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1QOp=A3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jw4y0-0004Jr-AB
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2020 14:34:32 +0000
X-Inumbo-ID: 758204e8-c771-11ea-94bf-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 758204e8-c771-11ea-94bf-12813bfff9fa;
 Thu, 16 Jul 2020 14:34:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 035C7B57E;
 Thu, 16 Jul 2020 14:34:34 +0000 (UTC)
Subject: Re: [PATCH v2] docs: specify stability of hypfs path documentation
To: George Dunlap <George.Dunlap@citrix.com>
References: <20200713140338.16172-1-jgross@suse.com>
 <8a96b1b9-cbcb-557a-5b82-661bbe40fe25@suse.com>
 <68F727A8-29B8-4846-8BE9-BD4F6E0DC60D@citrix.com>
 <9f5e86cc-4f64-982b-d84b-1de6b2739a2b@suse.com>
 <4c681c7c-be69-7e1a-4cd9-c9e05fe85372@suse.com>
 <2567da9b-be43-3f0d-e213-562b5454f4b7@suse.com>
 <757f5f78-6ec9-c740-18bf-a01105d552d7@suse.com>
 <A8D7C0A3-BA48-40F2-B290-C73BC1CDEBD1@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <fd8902f6-0172-2f1f-aae8-fec096d4bff5@suse.com>
Date: Thu, 16 Jul 2020 16:34:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <A8D7C0A3-BA48-40F2-B290-C73BC1CDEBD1@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16.07.20 16:20, George Dunlap wrote:
> 
> 
>> On Jul 16, 2020, at 12:34 PM, Jürgen Groß <jgross@suse.com> wrote:
>>
>> On 16.07.20 13:24, Jan Beulich wrote:
>>> On 16.07.2020 12:31, Jürgen Groß wrote:
>>>> On 16.07.20 12:11, Jan Beulich wrote:
>>>>> On 15.07.2020 16:37, George Dunlap wrote:
>>>>>> IT sounds like you’re saying:
>>>>>>
>>>>>> 1. Paths listed without conditions will always be available
>>>>>>
>>>>>> 2. Paths listed with conditions may be extended: i.e., a node currently listed as PV might also become available for HVM guests
>>>>>>
>>>>>> 3. Paths listed with conditions might have those conditions reduced, but will never entirely disappear.  So something currently listed as PV might be reduced to CONFIG_HAS_FOO, but won’t be completely removed.
>>>>>>
>>>>>> Is that what you meant?
>>>>>
>>>>> I see Jürgen replied "yes" to this, but I'm not sure about 1.
>>>>> above: I think it's quite reasonable to expect that paths without
>>>>> condition may gain a condition. Just like paths now having a
>>>>> condition and (perhaps temporarily) losing it shouldn't all of
>>>>> the sudden become "always available" when they weren't meant to
>>>>> be.
>>>>>
>>>>> As far a 3. goes, I'm also unsure in how far this is any better
>>>>> stability wise (from a consumer pov) than allowing paths to
>>>>> entirely disappear.
>>>>
>>>> The idea is that any user tool using hypfs can rely on paths under 1 to
>>>> exist, while the ones under 3 might not be there due to the hypervisor
>>>> config or the used system.
>>>>
>>>> A path not being allowed to entirely disappear ensures that it remains
>>>> in the documentation, so the same path can't be reused for something
>>>> different in future.
>>> And then how do you deal with a condition getting dropped, and
>>> later wanting to get re-added? Do we need a placeholder condition
>>> like [ALWAYS] or [TRUE]?
>>
>> Dropping a condition has to be considered very carefully, same as
>> introducing a new path without any condition.
>>
>> In worst case you can still go with [CONFIG_HYPFS].
> 
> Couldn’t we just have a section of the document for dead paths that aren’t allowed to be used?
> 
> Alternately, we could have a tag for entries we don’t want used anymore; [DEAD] or [OBSOLETE] maybe? [DEFUNCT]? [REMOVED]?
> 
> So I think I’d write a separate section, like this:
> 
> ~~
> # Stability
> 
> Path *presence* is not stable, but path *meaning* is always stable: if a tool you write finds a path present, it can rely on behavior in future versions of the hypervisors, and in different configurations.  Specifically:
> 
> 1. Conditions under which paths are used may be extended, restricted, or removed.  For example, a path that’s always available only on ARM systems may become available on x86; or a path available on both systems may be restricted to only appearing on ARM systems.  Paths may also disappear entirely.
> 
> 2. However, the meaning of a path will never change.  If a path is present, it will always have exactly the meaning that it always had.  In order to maintain this, removed paths should be retained with the tag [REMOVED].  The path may be restored *only* if the restored version of the path is compatible with the previous functionality.
> ~~~
> 
> Thoughts?

Would work for me, too.


Juergen


