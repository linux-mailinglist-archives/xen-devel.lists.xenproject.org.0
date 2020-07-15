Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D903C2207D3
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 10:52:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvd9U-00078C-BR; Wed, 15 Jul 2020 08:52:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jvd9S-000780-CK
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 08:52:30 +0000
X-Inumbo-ID: 82b1e77c-c678-11ea-939f-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 82b1e77c-c678-11ea-939f-12813bfff9fa;
 Wed, 15 Jul 2020 08:52:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A844DAD75;
 Wed, 15 Jul 2020 08:52:30 +0000 (UTC)
Subject: Re: [PATCH v2 6/7] flask: drop dead compat translation code
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <bb6a96c6-b6b1-76ff-f9db-10bec0fb4ab1@suse.com>
 <7711f68d-394e-a74f-81fa-51f8447174ce@suse.com>
 <20200714145800.GO7191@Air-de-Roger>
 <937a51c5-7563-0ac2-4ada-b4dfd7a5d636@suse.com>
 <20200715084115.GS7191@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9dc3e0fd-3e1a-5bd0-b8c7-01287e5c2c93@suse.com>
Date: Wed, 15 Jul 2020 10:52:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200715084115.GS7191@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel de Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.07.2020 10:41, Roger Pau Monné wrote:
> On Wed, Jul 15, 2020 at 08:42:44AM +0200, Jan Beulich wrote:
>> On 14.07.2020 16:58, Roger Pau Monné wrote:
>>> On Wed, Jul 01, 2020 at 12:28:07PM +0200, Jan Beulich wrote:
>>>> Translation macros aren't needed at all (or else a devicetree_label
>>>> entry would have been missing), and userlist has been removed quite some
>>>> time ago.
>>>>
>>>> No functional change.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> --- a/xen/include/xlat.lst
>>>> +++ b/xen/include/xlat.lst
>>>> @@ -148,14 +148,11 @@
>>>>  ?	xenoprof_init			xenoprof.h
>>>>  ?	xenoprof_passive		xenoprof.h
>>>>  ?	flask_access			xsm/flask_op.h
>>>> -!	flask_boolean			xsm/flask_op.h
>>>>  ?	flask_cache_stats		xsm/flask_op.h
>>>>  ?	flask_hash_stats		xsm/flask_op.h
>>>> -!	flask_load			xsm/flask_op.h
>>>>  ?	flask_ocontext			xsm/flask_op.h
>>>>  ?	flask_peersid			xsm/flask_op.h
>>>>  ?	flask_relabel			xsm/flask_op.h
>>>>  ?	flask_setavc_threshold		xsm/flask_op.h
>>>>  ?	flask_setenforce		xsm/flask_op.h
>>>> -!	flask_sid_context		xsm/flask_op.h
>>>>  ?	flask_transition		xsm/flask_op.h
>>>
>>> Shouldn't those become checks then?
>>
>> No, checking will never succeed for structures containing
>> XEN_GUEST_HANDLE(). But there's no point in generating xlat macros
>> when they're never used. There are two fundamentally different
>> strategies for handling the compat hypercalls: One is to wrap a
>> translation layer around the native hypercall. That's where the
>> xlat macros come into play. The other, used here, is to compile
>> the entire hypercall function a second time, arranging for the
>> compat structures to get used in place of the native ones. There
>> are no xlat macros involved here, all that's needed are correctly
>> translated structures. (For completeness, x86's MCA hypercall
>> uses yet another, quite adhoc strategy for handling, but also not
>> involving any xlat macro use. Hence the consideration there to
>> possibly drop the respective lines from the file here.)
> 
> Thanks, I think this explanation is helpful and I wonder whether it
> would be possible to have something along this lines in a file or as a
> comment somewhere, maybe at the top of xlat.lst?

To be honest - I'm not sure: Such a comment may indeed be helpful
to have, but I don't think I can see any single good place for it
to live. For people editing xlat.lst (a file the existence of which
many aren't even aware of), this would be a good place. But how
would others have any chance of running into this comment?

> Also could you add a line to the commit message noting that flask code
> doesn't use any of the translation macros because it follows a
> different approach to compat handling?

I've made the sentence start "Translation macros aren't used (and
hence needed) at all ..." - is that enough of an adjustment?

> For the patch:
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

Jan

