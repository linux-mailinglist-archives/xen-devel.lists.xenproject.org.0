Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 840F47E4207
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 15:46:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628849.980736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0NLI-00016a-3S; Tue, 07 Nov 2023 14:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628849.980736; Tue, 07 Nov 2023 14:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0NLI-00014A-0U; Tue, 07 Nov 2023 14:46:12 +0000
Received: by outflank-mailman (input) for mailman id 628849;
 Tue, 07 Nov 2023 14:46:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=raD6=GU=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r0NLF-00012e-Ra
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 14:46:09 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f8c899a-7d7c-11ee-9b0e-b553b5be7939;
 Tue, 07 Nov 2023 15:46:03 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 68F8E4EE0747;
 Tue,  7 Nov 2023 15:45:52 +0100 (CET)
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
X-Inumbo-ID: 5f8c899a-7d7c-11ee-9b0e-b553b5be7939
MIME-Version: 1.0
Date: Tue, 07 Nov 2023 15:45:52 +0100
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
In-Reply-To: <a95c6666-dbf3-4f1f-9618-b1f31bf47710@xen.org>
References: <cover.1699295113.git.nicola.vetrini@bugseng.com>
 <306ca49d5d63ea0614bbcef470efec9234d1a018.1699295113.git.nicola.vetrini@bugseng.com>
 <a95c6666-dbf3-4f1f-9618-b1f31bf47710@xen.org>
Message-ID: <31d0509acf5a31351d6efa7c66710729@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi Julien,

On 2023-11-07 13:44, Julien Grall wrote:
> Hi Nicola,
> 
> On 07/11/2023 10:33, Nicola Vetrini wrote:
>> As explained in the deviation record, code constructs such as
>> "goto retry" and "goto again" are sometimes the best balance between
>> code complexity and the understandability of the control flow
>> by developers; as such, these construct are allowed to deviate
>> from Rule 15.2.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>>   automation/eclair_analysis/ECLAIR/deviations.ecl | 10 ++++++++++
>>   docs/misra/deviations.rst                        | 10 ++++++++++
>>   2 files changed, 20 insertions(+)
>> 
>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
>> b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> index fa56e5c00a27..8b1f622f8f82 100644
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -270,6 +270,16 @@ statements are deliberate"
>>   -config=MC3R1.R14.3,statements={deliberate , 
>> "wrapped(any(),node(if_stmt))" }
>>   -doc_end
>>   +#
>> +# Series 15
>> +#
>> +
>> +-doc_begin="The additional complexity introduced in the code by using 
>> control flow structures other than backwards goto-s
>> +were deemed not to justify the possible prevention of developer 
>> confusion, given the very torough review process estabilished
> 
> Typoes: s/torough/thorough/ s/estabilished/established/
> 

Thanks

>> +in the community."
>> +-config=MC3R1.R15.2,reports+={deliberate, 
>> "any_area(any_loc(text(^.*goto (again|retry).*$)))"}
>> +-doc_end
>> +
>>   #
>>   # Series 20.
>>   #
>> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
>> index 8511a189253b..7d1e1f0d09b3 100644
>> --- a/docs/misra/deviations.rst
>> +++ b/docs/misra/deviations.rst
>> @@ -208,6 +208,16 @@ Deviations related to MISRA C:2012 Rules:
>>          statements are deliberate.
>>        - Project-wide deviation; tagged as `disapplied` for ECLAIR.
>>   +   * - R15.2
>> +     - The possible prevention of developer confusion as a result of 
>> using
>> +       control flow structures other than backwards goto-s in some 
>> instances was
>> +       deemed not strong enough to justify the additional complexity 
>> introduced
>> +       in the code. Such instances are the uses of the following 
>> labels:
>> +
>> +       - again
>> +       - retry
> 
> Have you investigated the possibility to use SAF-X in the code? If so, 
> what's the problem to use them?
> 
> Cheers,

This is another viable option: putting the SAF comment on top of the 
label should suffice,
as shown below:

/* SAF-2-safe */
repeat:
     ++fmt;          /* this also skips first '%' */
     switch (*fmt) {
     case '-': flags |= LEFT; goto repeat;
     case '+': flags |= PLUS; goto repeat;
     case ' ': flags |= SPACE; goto repeat;
     case '#': flags |= SPECIAL; goto repeat;
     case '0': flags |= ZEROPAD; goto repeat;
     }

I think it ultimately boils down to whether Xen wants to promote the use 
of certain labels
as the designated alternative when no other control flow mechanism is 
clearer from a
readability perspective (in which case there should be a consistent 
naming to capture and deviate
all of them, such as "retry") or do so on a case-by-case basis with a 
SAF, which is ok, but then
it needs someone to check each one and either fix them or mark them as 
ok.
Yet another route could be to mark with a SAF all those present right 
now to establish a baseline.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

