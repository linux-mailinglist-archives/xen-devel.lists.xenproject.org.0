Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FAD7EAD40
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 10:47:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632295.986538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2q0E-0007ys-G9; Tue, 14 Nov 2023 09:46:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632295.986538; Tue, 14 Nov 2023 09:46:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2q0E-0007x5-D6; Tue, 14 Nov 2023 09:46:38 +0000
Received: by outflank-mailman (input) for mailman id 632295;
 Tue, 14 Nov 2023 09:46:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZdVB=G3=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r2q0C-0007vf-P5
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 09:46:36 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b27b7828-82d2-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 10:46:34 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 0EFE84EE0738;
 Tue, 14 Nov 2023 10:46:34 +0100 (CET)
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
X-Inumbo-ID: b27b7828-82d2-11ee-9b0e-b553b5be7939
MIME-Version: 1.0
Date: Tue, 14 Nov 2023 10:46:34 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>
Cc: michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Simone Ballarin
 <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH][for-4.19 v4] xen: address violations of Rule 11.9
In-Reply-To: <82637305-58ff-3204-09f4-13a1f2c969fb@suse.com>
References: <b8a82daf5862287bda9545d7e672ce98e49004a2.1697701358.git.nicola.vetrini@bugseng.com>
 <b7df2987-ab46-bb09-4440-e743018561ad@suse.com>
 <alpine.DEB.2.22.394.2311131557210.160649@ubuntu-linux-20-04-desktop>
 <82637305-58ff-3204-09f4-13a1f2c969fb@suse.com>
Message-ID: <664811f5d165e8165501d2062e694062@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-11-14 08:19, Jan Beulich wrote:
> On 14.11.2023 00:58, Stefano Stabellini wrote:
>> On Mon, 13 Nov 2023, Jan Beulich wrote:
>>> On 19.10.2023 09:55, Nicola Vetrini wrote:
>>>> The constant 0 is used instead of NULL in '__ACCESS_ONCE' as a
>>>> compile-time check to detect non-scalar types; its usage for this
>>>> purpose is deviated.
>>>> 
>>>> Furthermore, the 'typeof_field' macro is introduced as a general way
>>>> to access the type of a struct member without declaring a variable
>>>> of struct type. Both this macro and 'sizeof_field' are moved to
>>>> 'xen/macros.h'.
>>>> 
>>>> No functional change intended.
>>>> 
>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>>> ---
>>>> Changes in v2:
>>>> - added entry in deviations.rst
>>>> Changes in v3:
>>>> - dropped access_field
>>>> - moved macro to macros.h
>>>> ---
>>>> Changes in v4:
>>>> - Amend deviation record.
>>>> ---
>>>>  automation/eclair_analysis/ECLAIR/deviations.ecl |  9 +++++++++
>>>>  docs/misra/deviations.rst                        |  6 ++++++
>>>>  xen/include/xen/compiler.h                       |  8 --------
>>>>  xen/include/xen/kernel.h                         |  2 +-
>>>>  xen/include/xen/macros.h                         | 16 
>>>> ++++++++++++++++
>>>>  5 files changed, 32 insertions(+), 9 deletions(-)
>>> 
>>> I tried to commit this patch, but ...
>>> 
>>>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
>>>> b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>> index fa56e5c00a27..28d9c37bedb2 100644
>>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>> @@ -246,6 +246,15 @@ constant expressions are required.\""
>>>>    "any()"}
>>>>  -doc_end
>>>> 
>>>> +#
>>>> +# Series 11
>>>> +#
>>>> +
>>>> +-doc_begin="This construct is used to check if the type is scalar, 
>>>> and for this purpose the use of 0 as a null pointer constant is 
>>>> deliberate."
>>>> +-config=MC3R1.R11.9,reports+={deliberate, 
>>>> "any_area(any_loc(any_exp(macro(^__ACCESS_ONCE$))))"
>>>> +}
>>>> +-doc_end
>>>> +
>>>>  #
>>>>  # Series 13
>>>>  #
>>> 
>>> ... this change doesn't apply, and I also can't see how it would. 
>>> There were
>>> no dependencies specified, so it's also not clear on top of which 
>>> other
>>> (ready to be committed) patch(es) this might have been meant to 
>>> apply. Please
>>> resubmit in a shape applicable to the staging branch.
>> 
>> The order doesn't matter in that file, you can place # Series 11 just
>> after # Series 10
> 
> That would have been one of the possible guesses. Yet then ...
> 
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -274,6 +274,15 @@ still non-negative."
>>  -config=MC3R1.R10.1,etypes+={safe, 
>> "stmt(operator(logical)||node(conditional_operator||binary_conditional_operator))", 
>> "dst_type(ebool||boolean)"}
>>  -doc_end
>> 
>> +#
>> +# Series 11
>> +#
>> +
>> +-doc_begin="This construct is used to check if the type is scalar, 
>> and for this purpose the use of 0 as a null pointer constant is 
>> deliberate."
>> +-config=MC3R1.R11.9,reports+={deliberate, 
>> "any_area(any_loc(any_exp(macro(^__ACCESS_ONCE$))))"
>> +}
>> +-doc_end
>> +
>>  ### Set 3 ###
> 
> ... there is this grouping by sets as well.
> 

+Stefano

I think the culprit here is that this commit 699899f44d09
was never merged with 4.19. Is that correct? My own tree is rebased
against that.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

