Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD717E5317
	for <lists+xen-devel@lfdr.de>; Wed,  8 Nov 2023 11:10:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629251.981312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0fVq-0007on-TE; Wed, 08 Nov 2023 10:10:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629251.981312; Wed, 08 Nov 2023 10:10:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0fVq-0007n8-QB; Wed, 08 Nov 2023 10:10:18 +0000
Received: by outflank-mailman (input) for mailman id 629251;
 Wed, 08 Nov 2023 10:10:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7seD=GV=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r0fVp-0007n2-0N
 for xen-devel@lists.xenproject.org; Wed, 08 Nov 2023 10:10:17 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 028da52a-7e1f-11ee-98da-6d05b1d4d9a1;
 Wed, 08 Nov 2023 11:10:14 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 921EB4EE0737;
 Wed,  8 Nov 2023 11:10:14 +0100 (CET)
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
X-Inumbo-ID: 028da52a-7e1f-11ee-98da-6d05b1d4d9a1
MIME-Version: 1.0
Date: Wed, 08 Nov 2023 11:10:14 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, Simone Ballarin <simone.ballarin@bugseng.com>, Doug
 Goldstein <cardoe@cardoe.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>
Subject: Re: [RFC PATCH 4/4] automation/eclair: add deviation for certain
 backwards goto
In-Reply-To: <a35f339b-29c4-4618-a631-0b53019424b1@xen.org>
References: <cover.1699295113.git.nicola.vetrini@bugseng.com>
 <306ca49d5d63ea0614bbcef470efec9234d1a018.1699295113.git.nicola.vetrini@bugseng.com>
 <a95c6666-dbf3-4f1f-9618-b1f31bf47710@xen.org>
 <31d0509acf5a31351d6efa7c66710729@bugseng.com>
 <a35f339b-29c4-4618-a631-0b53019424b1@xen.org>
Message-ID: <5314cdb478d6385a4a07ab1c2440038f@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2023-11-07 18:35, Julien Grall wrote:
> On 07/11/2023 14:45, Nicola Vetrini wrote:
>> Hi Julien,
> 
> Hi,
> 
>> On 2023-11-07 13:44, Julien Grall wrote:
>>>> +in the community."
>>>> +-config=MC3R1.R15.2,reports+={deliberate, 
>>>> "any_area(any_loc(text(^.*goto (again|retry).*$)))"}
>>>> +-doc_end
>>>> +
>>>>   #
>>>>   # Series 20.
>>>>   #
>>>> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
>>>> index 8511a189253b..7d1e1f0d09b3 100644
>>>> --- a/docs/misra/deviations.rst
>>>> +++ b/docs/misra/deviations.rst
>>>> @@ -208,6 +208,16 @@ Deviations related to MISRA C:2012 Rules:
>>>>          statements are deliberate.
>>>>        - Project-wide deviation; tagged as `disapplied` for ECLAIR.
>>>>   +   * - R15.2
>>>> +     - The possible prevention of developer confusion as a result 
>>>> of using
>>>> +       control flow structures other than backwards goto-s in some 
>>>> instances was
>>>> +       deemed not strong enough to justify the additional 
>>>> complexity introduced
>>>> +       in the code. Such instances are the uses of the following 
>>>> labels:
>>>> +
>>>> +       - again
>>>> +       - retry
>>> 
>>> Have you investigated the possibility to use SAF-X in the code? If 
>>> so, what's the problem to use them?
>>> 
>>> Cheers,
>> 
>> This is another viable option: putting the SAF comment on top of the 
>> label should suffice,
>> as shown below:
>> 
>> /* SAF-2-safe */
>> repeat:
>>      ++fmt;          /* this also skips first '%' */
>>      switch (*fmt) {
>>      case '-': flags |= LEFT; goto repeat;
>>      case '+': flags |= PLUS; goto repeat;
>>      case ' ': flags |= SPACE; goto repeat;
>>      case '#': flags |= SPECIAL; goto repeat;
>>      case '0': flags |= ZEROPAD; goto repeat;
>>      }
>> 
>> I think it ultimately boils down to whether Xen wants to promote the 
>> use of certain labels
>> as the designated alternative when no other control flow mechanism is 
>> clearer from a
>> readability perspective (in which case there should be a consistent 
>> naming to capture and deviate
>> all of them, such as "retry") or do so on a case-by-case basis with a 
>> SAF, which is ok,
> 
> I would prefer a case-by-case basis because it adds an additional 
> review. With deviating by keywords, the reviewrs/developpers may not be 
> aware of the deviation (which may be fine for some, but IMHO not this 
> one).
> 

Ok, I'll keep this in mind when the rule will be discussed.

>> but then
>> it needs someone to check each one and either fix them or mark them as 
>> ok.
> 
> Don't we technically already need to go through all the existing use of 
> ready & co even if we deviate by keyword?
> 

my hope was trying to extract a common well-known pattern that can be
defensible as a deviation and then fix the rest.

>> Yet another route could be to mark with a SAF all those present right 
>> now to establish a baseline.
> 
> How many do we have?
> 

~30 in Arm (half of which are in common code) and ~250 in x86. The 
actual count of labels
is lower, because a report is given for each use of a backward jump, but 
those under
x86e_emulate likely do not (~40 total on x86 remain if we exclude 
x86_emulate/.*).

https://saas.eclairit.com:3787/fs/var/local/eclair/XEN.ecdf/ECLAIR_normal/arm/for-4.19/ARM64-Set3/372/PROJECT.ecd;/by_service/MC3R1.R15.2.html

https://saas.eclairit.com:3787/fs/var/local/eclair/XEN.ecdf/ECLAIR_normal/x86_64/staging/X86_64-Set3/372/PROJECT.ecd;/by_service/MC3R1.R15.2.html#

> Cheers,

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

