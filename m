Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B071CA5BD
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 10:10:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWy5R-0005am-5x; Fri, 08 May 2020 08:10:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t3Kb=6W=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jWy5P-0005ad-8Y
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 08:10:23 +0000
X-Inumbo-ID: 5ca8c028-9103-11ea-9fcd-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5ca8c028-9103-11ea-9fcd-12813bfff9fa;
 Fri, 08 May 2020 08:10:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 89D70AAC7;
 Fri,  8 May 2020 08:10:23 +0000 (UTC)
Subject: Re: [PATCH v8 01/12] x86emul: disable FPU/MMX/SIMD insn emulation
 when !HVM
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <60cc730f-2a1c-d7a6-74fe-64f3c9308831@suse.com>
 <6110ec4d-36a7-efa7-fb86-069ec5b83ac2@suse.com>
 <a9badaa5-cae0-f2b0-7801-5355f342ad4b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <62c1b64a-5ddb-d6d0-26e7-519eb2695d84@suse.com>
Date: Fri, 8 May 2020 10:10:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <a9badaa5-cae0-f2b0-7801-5355f342ad4b@citrix.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.05.2020 20:11, Andrew Cooper wrote:
> On 05/05/2020 09:12, Jan Beulich wrote:
>> In a pure PV environment (the PV shim in particular) we don't really
>> need emulation of all these. To limit #ifdef-ary utilize some of the
>> CASE_*() macros we have, by providing variants expanding to
>> (effectively) nothing (really a label, which in turn requires passing
>> -Wno-unused-label to the compiler when build such configurations).
>>
>> Due to the mixture of macro and #ifdef use, the placement of some of
>> the #ifdef-s is a little arbitrary.
>>
>> The resulting object file's .text is less than half the size of the
>> original, and looks to also be compiling a little more quickly.
>>
>> This is meant as a first step; more parts can likely be disabled down
>> the road.
>>
>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v7: Integrate into this series. Re-base.
>> ---
>> I'll be happy to take suggestions allowing to avoid -Wno-unused-label.
> 
> I already gave you one, along with a far less invasive change.
> 
> It is not interesting to be able to conditionally compile these things
> separately.  A build of Xen will either need everything, or just the
> integer group.

And I had replied to that, indicating my (at least partial)
disagreement as well as asking for clarification on an apparently
incomplete sentence in your response.

Note that in an initial (3 months earlier) reply you did say

"On that subject, it would be very helpful to at least be able to
 configure reduced builds from these utilities."

which I responded to

"Yes, I too have been thinking this way. I may get there eventually."

I specifically meant FPU-less, MMX-less, and SIMD-less each on their
own.

I'm also not at all convinced of, as you say, "a build of Xen will
either need everything, or just the integer group". Yes, for now I
unilaterally disable all three for !HVM here, but that's just
because we know of no PV guests trying to update their page tables
in "interesting" ways. Long term I think this would better be a
separate Kconfig option (or multiple ones, if we stick to keeping
the three groups here to have separate controls), merely defaulting
to !HVM. I could of course switch to such an approach right away.

Jan

